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
            new TwigFunction('count_payment', [$this, 'countPayment']),
            new TwigFunction('revenue_per_month', [$this, 'revenuePerMonth']),
            new TwigFunction('last_installments', [$this, 'lastInstallments']),
            new TwigFunction('arrears_installment', [$this, 'arrearsInstallment']),
            new TwigFunction('lastest_installments', [$this, 'lastestInstallments']),
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

    public function countPayment(Order $order) : int
    {
        return $this->installmentService->countPayment($order);
    }

    public function revenuePerMonth(int $year): array
    {
        $records = [
            ['bulan' => 1, 'tahun' => $year, 'total' => 0],
            ['bulan' => 2, 'tahun' => $year, 'total' => 0],
            ['bulan' => 3, 'tahun' => $year, 'total' => 0],
            ['bulan' => 4, 'tahun' => $year, 'total' => 0],
            ['bulan' => 5, 'tahun' => $year, 'total' => 0],
            ['bulan' => 6, 'tahun' => $year, 'total' => 0],
            ['bulan' => 7, 'tahun' => $year, 'total' => 0],
            ['bulan' => 8, 'tahun' => $year, 'total' => 0],
            ['bulan' => 9, 'tahun' => $year, 'total' => 0],
            ['bulan' => 10, 'tahun' => $year, 'total' => 0],
            ['bulan' => 11, 'tahun' => $year, 'total' => 0],
            ['bulan' => 12, 'tahun' => $year, 'total' => 0],
        ];

        $result = $this->installmentService->revenuePerMonth($year);
        foreach ($records as $key => $record) {
            foreach ($result as $k => $item) {
                if ($record['bulan'] === (int) $item['bulan']) {
                    $records[$key]['total'] = $item['total'];
                }
            }
        }

        return  $records;
    }

    public function lastInstallments(): array
    {
        return $this->installmentService->lastInstallments();
    }

    public function arrearsInstallment(): array
    {
        return  $this->installmentService->arrearsInstallment();
    }

    public function lastestInstallments(): array
    {
        return  $this->installmentService->lastestInstallments();
    }
}
