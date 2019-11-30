<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Installment;

use Doctrine\ORM\NoResultException;
use KejawenLab\Semart\Skeleton\Contract\Service\ServiceInterface;
use KejawenLab\Semart\Skeleton\Entity\Installment;
use KejawenLab\Semart\Skeleton\Entity\Order;
use KejawenLab\Semart\Skeleton\Repository\InstallmentRepository;

/**
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class InstallmentService implements ServiceInterface
{
    private $installmentRepository;

    public function __construct(InstallmentRepository $installmentRepository)
    {
        $installmentRepository->setCacheable(true);
        $this->installmentRepository = $installmentRepository;
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
        $query->useResultCache(true, 7, sprintf('%s:%s:%s', __CLASS__, __METHOD__, serialize($query->getParameters())));

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
        $query->useResultCache(true, 7, sprintf('%s:%s', __CLASS__, __METHOD__));

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
        $query->useResultCache(true, 7, sprintf('%s:%s', __CLASS__, __METHOD__));

        try {
            return (int) $query->getSingleScalarResult();
        } catch (NoResultException $ex) {
            return 0;
        }
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
    * @return Installment[]
    */
    public function getActives(): array
    {
        return $this->installmentRepository->findAll();
    }
}
