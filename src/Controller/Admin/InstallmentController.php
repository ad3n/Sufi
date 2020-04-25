<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Controller\Admin;

use KejawenLab\Semart\Skeleton\Entity\Installment;
use KejawenLab\Semart\Skeleton\Installment\InstallmentService;
use KejawenLab\Semart\Skeleton\Order\OrderService;
use KejawenLab\Semart\Skeleton\Pagination\Paginator;
use KejawenLab\Semart\Skeleton\Request\RequestHandler;
use KejawenLab\Semart\Skeleton\Security\Authorization\Permission;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @Route("/installments")
 *
 * @Permission(menu="INSTALLMENT")
 *
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class InstallmentController extends AdminController
{
    /**
     * @Route("/", methods={"GET"}, name="installments_index", options={"expose"=true})
     *
     * @Permission(actions=Permission::VIEW)
     */
    public function index(Request $request, Paginator $paginator, OrderService $orderService)
    {
        $page = (int) $request->query->get('p', 1);
        $sort = $request->query->get('s');
        $direction = $request->query->get('d');
        $key = md5(sprintf('%s:%s:%s:%s:%s', __CLASS__, __METHOD__, $page, $sort, $direction));
        if ($request->isXmlHttpRequest()) {
            if (!$this->isCached($key)) {
                $installments = $paginator->paginate(Installment::class, $page);
                $this->cache($key, $installments);
            } else {
                $installments = $this->cache($key);
            }

            $table = $this->renderView('installment/table-content.html.twig', ['installments' => $installments]);
            $pagination = $this->renderView('installment/pagination.html.twig', ['installments' => $installments]);

            return new JsonResponse([
                'table' => $table,
                'pagination' => $pagination,
                '_cache_id' => $key,
            ]);
        }

        return $this->render('installment/index.html.twig', [
            'title' => $this->getPageTitle(),
            'order' => $orderService->get($request->query->get('orderId')),
            'orders' => $orderService->getActives(),
            'cacheId' => $key,
        ]);
    }

    /**
     * @Route("/{id}", methods={"GET"}, name="installments_detail", options={"expose"=true})
     *
     * @Permission(actions=Permission::VIEW)
     */
    public function find(string $id, InstallmentService $service, SerializerInterface $serializer)
    {
        $installment = $service->get($id);
        if (!$installment) {
            throw new NotFoundHttpException();
        }

        return new JsonResponse($serializer->serialize($installment, 'json', ['groups' => ['read']]));
    }

    /**
     * @Route("/save", methods={"POST"}, name="installments_save", options={"expose"=true})
     *
     * @Permission(actions={Permission::ADD, Permission::EDIT})
     */
    public function save(Request $request, InstallmentService $service, RequestHandler $requestHandler)
    {
        $primary = $request->get('id');
        if ($primary) {
            $installment = $service->get($primary);
        } else {
            $installment = new Installment();
        }

        $requestHandler->handle($request, $installment);
        if (!$requestHandler->isValid()) {
            return new JsonResponse(['status' => 'KO', 'errors' => $requestHandler->getErrors()]);
        }

        $this->commit($installment);

        return new JsonResponse(['status' => 'OK']);
    }

    /**
     * @Route("/{id}/delete", methods={"POST"}, name="installments_remove", options={"expose"=true})
     *
     * @Permission(actions=Permission::DELETE)
     */
    public function delete(string $id, InstallmentService $service)
    {
        if (!$installment = $service->get($id)) {
            throw new NotFoundHttpException();
        }

        $this->remove($installment);

        return new JsonResponse(['status' => 'OK']);
    }
}
