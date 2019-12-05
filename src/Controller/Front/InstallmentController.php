<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Controller\Front;

use KejawenLab\Semart\Skeleton\Installment\InstallmentService;
use KejawenLab\Semart\Skeleton\Order\OrderService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class InstallmentController extends AbstractController
{
    /**
     * @Route("/report/{id}", methods={"GET"})
     */
    public function report(string $id, OrderService $orderService, InstallmentService $installmentService)
    {
        if (!$order = $orderService->get($id)) {
            throw new NotFoundHttpException();
        }

        $customer = $order->getCustomer();
        $totalPrice = $order->getPrice() + $order->getMargin();

        return $this->render('installment/report.html.twig', [
            'totalPrice' => $totalPrice,
            'title' => sprintf('Tabel Angsuran %s(%s) - %s(Rp. %s)', $customer->getName(), $customer->getWhatsAppNumber(), $order->getProductName(), number_format($totalPrice, 0, ',', '.')),
            'installments' => $installmentService->getByOrder($order),
        ]);
    }
}
