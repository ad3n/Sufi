<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Installment;

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
