<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Order;

use Doctrine\ORM\NoResultException;
use KejawenLab\Semart\Skeleton\Contract\Service\ServiceInterface;
use KejawenLab\Semart\Skeleton\Entity\Order;
use KejawenLab\Semart\Skeleton\Repository\OrderRepository;
use function Doctrine\ORM\QueryBuilder;

/**
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class OrderService implements ServiceInterface
{
    private $orderRepository;

    public function __construct(OrderRepository $orderRepository)
    {
        $orderRepository->setCacheable(true);
        $this->orderRepository = $orderRepository;
    }

    /**
     * @param string $id
     *
     * @return Order|null
     */
    public function get(string $id): ?object
    {
        return $this->orderRepository->find($id);
    }

    /**
    * @return Order[]
    */
    public function getActives(): array
    {
        return $this->orderRepository->findAll();
    }

    public function update(Order $order): void
    {
        $this->orderRepository->save($order);
    }

    public function getTotalOrder(): float
    {
        $queryBuilder = $this->orderRepository->createQueryBuilder('o');
        $queryBuilder->select('SUM(o.price + o.margin) AS total');

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

        try {
            return (float) $query->getSingleScalarResult();
        } catch (NoResultException $ex) {
            return 0.0;
        }
    }

    public function countOrder(): int
    {
        $queryBuilder = $this->orderRepository->createQueryBuilder('o');
        $queryBuilder->select('COUNT(1) AS total');

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

        return (int) $query->getSingleScalarResult();
    }

    public function countPayOff(): int
    {
        $queryBuilder = $this->orderRepository->createQueryBuilder('o');
        $queryBuilder->select('COUNT(1) AS total');
        $queryBuilder->andWhere($queryBuilder->expr()->eq('o.isPaidOff', $queryBuilder->expr()->literal(true)));

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

        return (int) $query->getSingleScalarResult();
    }

    public function countOutStanding(): int
    {
        $queryBuilder = $this->orderRepository->createQueryBuilder('o');
        $queryBuilder->select('COUNT(1) AS total');
        $queryBuilder->andWhere($queryBuilder->expr()->eq('o.isPaidOff', $queryBuilder->expr()->literal(false)));

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

        return (int) $query->getSingleScalarResult();
    }

    public function getProfitProjection(): array
    {
        $queryBuilder = $this->orderRepository->createQueryBuilder('o');
        $queryBuilder->select('SUM(o.margin) AS margin, SUM(o.cashback) AS cashback');

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

        return $query->getSingleResult();
    }

    public function getRealProfit(): float
    {
        $queryBuilder = $this->orderRepository->createQueryBuilder('o');
        $queryBuilder->select('SUM(o.margin) AS total');
        $queryBuilder->andWhere($queryBuilder->expr()->eq('o.isPaidOff', $queryBuilder->expr()->literal(true)));

        $query = $queryBuilder->getQuery();
        $query->useQueryCache(true);
        $query->enableResultCache(7, sprintf('%s:%s', __CLASS__, __METHOD__));

        try {
            return (float) $query->getSingleScalarResult();
        } catch (NoResultException $ex) {
            return 0.0;
        }
    }
}
