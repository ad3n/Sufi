<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Order;

use KejawenLab\Semart\Skeleton\Entity\Order;
use KejawenLab\Semart\Skeleton\Installment\InstallmentService;
use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

/**
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class OrderExtension extends AbstractExtension
{
    private $orderService;

    public function __construct(OrderService $orderService)
    {
        $this->orderService = $orderService;
    }

    public function getFunctions(): array
    {
        return [
            new TwigFunction('total_order', [$this, 'totalOrder']),
            new TwigFunction('count_order', [$this, 'countOrder']),
        ];
    }

    public function totalOrder(): float
    {
        return $this->orderService->getTotalOrder();
    }

    public function countOrder(): int
    {
        return $this->orderService->countOrder();
    }
}
