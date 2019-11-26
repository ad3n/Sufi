<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Installment;

use KejawenLab\Semart\Skeleton\Entity\Order;
use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

/**
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class InstallmentExtension extends AbstractExtension
{
    private $installmentService;

    public function __construct(InstallmentService $installmentService)
    {
        $this->installmentService = $installmentService;
    }

    public function getFunctions(): array
    {
        return [
            new TwigFunction('sum_installment', [$this, 'sumInstallment']),
            new TwigFunction('total_revenue', [$this, 'totalInstallment']),
        ];
    }

    public function sumInstallment(Order $order): float
    {
        return $this->installmentService->getTotalInstallmentPerOrder($order);
    }

    public function totalInstallment(): float
    {
        return $this->installmentService->getTotalInstallment();
    }
}
