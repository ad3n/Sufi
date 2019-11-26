<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Controller\Admin;

use KejawenLab\Semart\Skeleton\Customer\CustomerService;
use KejawenLab\Semart\Skeleton\Entity\Order;
use KejawenLab\Semart\Skeleton\Pagination\Paginator;
use KejawenLab\Semart\Skeleton\Order\OrderService;
use KejawenLab\Semart\Skeleton\Request\RequestHandler;
use KejawenLab\Semart\Skeleton\Security\Authorization\Permission;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @Route("/orders")
 *
 * @Permission(menu="ORDER")
 *
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class OrderController extends AdminController
{
    /**
     * @Route("/", methods={"GET"}, name="orders_index", options={"expose"=true})
     *
     * @Permission(actions=Permission::VIEW)
     */
    public function index(Request $request, Paginator $paginator, CustomerService $customerService)
    {
        $page = (int) $request->query->get('p', 1);
        $sort = $request->query->get('s');
        $direction = $request->query->get('d');
        $key = md5(sprintf('%s:%s:%s:%s:%s', __CLASS__, __METHOD__, $page, $sort, $direction));
        if ($request->isXmlHttpRequest()) {
            if (!$this->isCached($key)) {
                $orders = $paginator->paginate(Order::class, $page);
                $this->cache($key, $orders);
            } else {
                $orders = $this->cache($key);
            }

            $table = $this->renderView('order/table-content.html.twig', ['orders' => $orders]);
            $pagination = $this->renderView('order/pagination.html.twig', ['orders' => $orders]);

            return new JsonResponse([
                'table' => $table,
                'pagination' => $pagination,
                '_cache_id' => $key,
            ]);
        }

        return $this->render('order/index.html.twig', [
            'title' => $this->getPageTitle(),
            'customers' => $customerService->getActives(),
            'cacheId' => $key,
        ]);
    }

    /**
     * @Route("/{id}", methods={"GET"}, name="orders_detail", options={"expose"=true})
     *
     * @Permission(actions=Permission::VIEW)
     */
    public function find(string $id, OrderService $service, SerializerInterface $serializer)
    {
        $order = $service->get($id);
        if (!$order) {
            throw new NotFoundHttpException();
        }

        return new JsonResponse($serializer->serialize($order, 'json', ['groups' => ['read']]));
    }

    /**
     * @Route("/save", methods={"POST"}, name="orders_save", options={"expose"=true})
     *
     * @Permission(actions={Permission::ADD, Permission::EDIT})
     */
    public function save(Request $request, OrderService $service, RequestHandler $requestHandler)
    {
        $primary = $request->get('id');
        if ($primary) {
            $order = $service->get($primary);
        } else {
            $order = new Order();
        }

        $requestHandler->handle($request, $order);
        if (!$requestHandler->isValid()) {
            return new JsonResponse(['status' => 'KO', 'errors' => $requestHandler->getErrors()]);
        }

        $this->commit($order);

        return new JsonResponse(['status' => 'OK']);
    }

    /**
     * @Route("/{id}/delete", methods={"POST"}, name="orders_remove", options={"expose"=true})
     *
     * @Permission(actions=Permission::DELETE)
     */
    public function delete(string $id, OrderService $service)
    {
        if (!$order = $service->get($id)) {
            throw new NotFoundHttpException();
        }

        $this->remove($order);

        return new JsonResponse(['status' => 'OK']);
    }
}
