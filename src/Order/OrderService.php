<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Order;

use KejawenLab\Semart\Skeleton\Contract\Service\ServiceInterface;
use KejawenLab\Semart\Skeleton\Entity\Order;
use KejawenLab\Semart\Skeleton\Repository\OrderRepository;

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
}
