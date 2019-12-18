<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Installment;

use Doctrine\ORM\NoResultException;
use KejawenLab\Semart\Skeleton\Contract\Service\ServiceInterface;
use KejawenLab\Semart\Skeleton\Entity\Installment;
use KejawenLab\Semart\Skeleton\Entity\Order;
use KejawenLab\Semart\Skeleton\Order\OrderService;
use KejawenLab\Semart\Skeleton\Repository\InstallmentRepository;

/**
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class InstallmentService implements ServiceInterface
{
    private $installmentRepository;

    private $orderService;

    public function __construct(InstallmentRepository $installmentRepository, OrderService $orderService)
    {
        $installmentRepository->setCacheable(true);
        $this->installmentRepository = $installmentRepository;
        $this->orderService = $orderService;
    }

    public function isPaidOff(Order $order, float $amount)
    {
        $installments = $this->installmentRepository->findBy(['order' => $order]);
        /** @var Installment $installment */
        foreach ($installments as $installment) {
            $amount += $installment->getAmount();
        }

        if ($amount >= $order->getPrice()) {
            return true;
        }

        return false;
    }

    public function getTotalInstallmentPerOrder(Order $order): float
    {
        $queryBuilder = $this->installmentRepository->createQueryBuilder('o');
        $queryBuilder->select('SUM(o.amount) AS total');
        $queryBuilder->andWhere($queryBuilder->expr()->eq('o.order', $queryBuilder->expr()->literal($order->getId())));
        $queryBuilder->addGroupBy('o.order');

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s:%s', __CLASS__, __METHOD__, serialize($query->getParameters())));

        try {
            return (float) $query->getSingleScalarResult();
        } catch (NoResultException $ex) {
            return 0.0;
        }
    }

    public function getTotalInstallment(): float
    {
        $queryBuilder = $this->installmentRepository->createQueryBuilder('o');
        $queryBuilder->select('SUM(o.amount) AS total');

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

        try {
            return (float) $query->getSingleScalarResult();
        } catch (NoResultException $ex) {
            return 0.0;
        }
    }

    public function countPayment(Order $order): int
    {
        $queryBuilder = $this->installmentRepository->createQueryBuilder('o');
        $queryBuilder->select('COUNT(1) AS total');
        $queryBuilder->andWhere($queryBuilder->expr()->eq('o.order', $queryBuilder->expr()->literal($order->getId())));

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

        try {
            return (int) $query->getSingleScalarResult();
        } catch (NoResultException $ex) {
            return 0;
        }
    }

    public function revenuePerMonth(int $year): array
    {
        $queryBuilder = $this->installmentRepository->createQueryBuilder('o');
        $queryBuilder->select('YEAR(o.installmentDate) AS tahun, MONTH(o.installmentDate) AS bulan, SUM(o.amount) AS total');
        $queryBuilder->andWhere($queryBuilder->expr()->eq('YEAR(o.installmentDate)', $queryBuilder->expr()->literal($year)));
        $queryBuilder->addGroupBy('tahun');
        $queryBuilder->addGroupBy('bulan');

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

        return $query->getArrayResult();
    }

    public function arrearsInstallment(): array
    {
        $output = [];
        $unPaidOffOrders = $this->orderService->getUnPaidOffOrders();
        foreach ($unPaidOffOrders as $unPaidOffOrder) {
            $queryBuilder = $this->installmentRepository->createQueryBuilder('o');
            $queryBuilder->select('o.id');
            $queryBuilder->andWhere($queryBuilder->expr()->eq('o.order', $queryBuilder->expr()->literal($unPaidOffOrder->getId())));
            $queryBuilder->andWhere($queryBuilder->expr()->eq('MONTH(o.installmentDate)', $queryBuilder->expr()->literal((int) date('n'))));

            $query = $queryBuilder->getQuery();
            $query->useQueryCache(true);
            $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

            $result = $query->getArrayResult();
            if (empty($result)) {
                $queryBuilder = $this->installmentRepository->createQueryBuilder('o');
                $queryBuilder->select('MONTH(o.installmentDate) AS bulan, o.amount AS angsuran');
                $queryBuilder->andWhere($queryBuilder->expr()->eq('o.order', $queryBuilder->expr()->literal($unPaidOffOrder->getId())));
                $queryBuilder->setMaxResults(1);
                $queryBuilder->addOrderBy('o.installmentDate', 'DESC');

                $query = $queryBuilder->getQuery();
                $query->useQueryCache(true);
                $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

                $installment = $query->getOneOrNullResult();

                $output[] = [
                    'nama' => $unPaidOffOrder->getCustomer()->getName(),
                    'produk' => $unPaidOffOrder->getProductName(),
                    'harga' => ($unPaidOffOrder->getPrice() + $unPaidOffOrder->getCashback() + $unPaidOffOrder->getMargin()),
                    'angsuran_terakhir' => $installment['bulan'],
                    'angsuran' => $installment['angsuran'],
                ];
            }
        }

        return $output;
    }

    public function lastestInstallments(): array
    {
        $queryBuilder = $this->installmentRepository->createQueryBuilder('o');
        $queryBuilder->select('r.id AS id, o.installmentDate AS tanggal, c.name AS nama, r.productName AS produk, o.amount AS angsuran');
        $queryBuilder->join('o.order', 'r');
        $queryBuilder->join('r.customer', 'c');
        $queryBuilder->andWhere($queryBuilder->expr()->eq('MONTH(o.installmentDate)', $queryBuilder->expr()->literal((int) date('n'))));
        $queryBuilder->andWhere($queryBuilder->expr()->eq('r.isPaidOff', $queryBuilder->expr()->literal(false)));
        $queryBuilder->addOrderBy('o.installmentDate', 'DESC');

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

        $output = [];
        $results = $query->getArrayResult();
        foreach ($results as $result) {
            $id = (string) $result['id'];
            if (!array_key_exists($id, $output)) {
                $output[$id] = [
                    'nama' => $result['nama'],
                    'produk' => $result['produk'],
                    'tanggal' => $result['tanggal'],
                    'angsuran' => $result['angsuran'],
                ];
            }
        }

        return $output;
    }

    public function lastInstallments(): array
    {
        $queryBuilder = $this->installmentRepository->createQueryBuilder('o');
        $queryBuilder->select('o.installmentDate, o.amount, c.name, _or.productName');
        $queryBuilder->innerJoin('o.order', '_or');
        $queryBuilder->innerJoin('_or.customer', 'c');
        $queryBuilder->addOrderBy('o.installmentDate', 'DESC');
        $queryBuilder->setMaxResults(13);

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

        return $query->getArrayResult();
    }

    /**
     * @param string $id
     *
     * @return Installment|null
     */
    public function get(string $id): ?object
    {
        return $this->installmentRepository->find($id);
    }

    /**
     * @param Order $order
     *
     * @return Installment[]
     */
    public function getByOrder(Order $order): array
    {
        return $this->installmentRepository->findBy(['order' => $order], ['installmentDate' => 'ASC']);
    }

    /**
    * @return Installment[]
    */
    public function getActives(): array
    {
        return $this->installmentRepository->findAll();
    }
}
