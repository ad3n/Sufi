<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Order;

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
            new TwigFunction('count_payoff', [$this, 'countPayOff']),
            new TwigFunction('count_outstanding', [$this, 'countOutStanding']),
            new TwigFunction('profit_projection', [$this, 'profitProjection']),
            new TwigFunction('real_profit', [$this, 'realProfit']),
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

    public function countPayOff(): int
    {
        return $this->orderService->countPayOff();
    }

    public function countOutStanding(): int
    {
        return $this->orderService->countOutStanding();
    }

    public function profitProjection(): array
    {
        return $this->orderService->getProfitProjection();
    }

    public function realProfit(): float
    {
        return $this->orderService->getRealProfit();
    }
}
