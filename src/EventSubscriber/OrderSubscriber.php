<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\EventSubscriber;

use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\QueryBuilder;
use KejawenLab\Semart\Skeleton\Entity\Order;
use KejawenLab\Semart\Skeleton\Pagination\PaginationEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

/**
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class OrderSubscriber implements EventSubscriberInterface
{
    public function filterPagination(PaginationEvent $event)
    {
        if (Order::class !== $event->getEntityClass()) {
            return;
        }

        $alias = $event->getJoinAlias('root');

        /** @var QueryBuilder $queryBuilder */
        $queryBuilder = $event->getQueryBuilder();
        $queryBuilder->addOrderBy(sprintf('%s.orderDate', $alias), Criteria::DESC);
        $queryBuilder->addOrderBy(sprintf('%s.isPaidOff', $alias), Criteria::DESC);
    }

    public static function getSubscribedEvents(): array
    {
        return [
            PaginationEvent::class => 'filterPagination',
        ];
    }
}
