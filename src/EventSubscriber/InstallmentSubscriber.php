<?php


namespace KejawenLab\Semart\Skeleton\EventSubscriber;

use Doctrine\ORM\QueryBuilder;
use KejawenLab\Semart\Skeleton\Entity\Installment;
use KejawenLab\Semart\Skeleton\Installment\InstallmentService;
use KejawenLab\Semart\Skeleton\Order\OrderService;
use KejawenLab\Semart\Skeleton\Pagination\PaginationEvent;
use KejawenLab\Semart\Skeleton\Request\RequestEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class InstallmentSubscriber implements EventSubscriberInterface
{
    private $orderService;

    private $installmentService;

    public function __construct(OrderService $orderService, InstallmentService $installmentService)
    {
        $this->orderService = $orderService;
        $this->installmentService = $installmentService;
    }

    public function filterRequest(RequestEvent $event)
    {
        $installment = $event->getObject();
        if (!$installment instanceof Installment) {
            return;
        }

        $request = $event->getRequest();
        $session = $request->getSession();

        $order = $this->orderService->get($session->get('orderId'));
        $installment->setOrder($this->orderService->get($session->get('orderId')));

        if ($this->installmentService->isPaidOff($order, $request->request->get('amount'))) {
            $order->setPaidOff(true);
            $this->orderService->update($order);
        }
    }

    public function filterPagination(PaginationEvent $event)
    {
        if (Installment::class !== $event->getEntityClass()) {
            return;
        }

        $request = $event->getRequest();
        $session = $request->getSession();

        $orderId = $request->query->get('orderId');
        $session->set('orderId', $orderId);
        if ($orderId) {
            /** @var QueryBuilder $queryBuilder */
            $queryBuilder = $event->getQueryBuilder();
            $queryBuilder->join(sprintf('%s.order', $event->getJoinAlias('root')), '_or');
            $queryBuilder->andWhere($queryBuilder->expr()->eq('_or.id', $queryBuilder->expr()->literal($orderId)));
            $event->addJoinAlias('order', 'or');
        }
    }

    public static function getSubscribedEvents(): array
    {
        return [
            PaginationEvent::class => 'filterPagination',
            RequestEvent::class => 'filterRequest',
        ];
    }
}
