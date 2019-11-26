<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Controller\Admin;

use KejawenLab\Semart\Skeleton\Entity\Customer;
use KejawenLab\Semart\Skeleton\Pagination\Paginator;
use KejawenLab\Semart\Skeleton\Customer\CustomerService;
use KejawenLab\Semart\Skeleton\Request\RequestHandler;
use KejawenLab\Semart\Skeleton\Security\Authorization\Permission;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @Route("/customers")
 *
 * @Permission(menu="CUSTOMER")
 *
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class CustomerController extends AdminController
{
    /**
     * @Route("/", methods={"GET"}, name="customers_index", options={"expose"=true})
     *
     * @Permission(actions=Permission::VIEW)
     */
    public function index(Request $request, Paginator $paginator)
    {
        $page = (int) $request->query->get('p', 1);
        $sort = $request->query->get('s');
        $direction = $request->query->get('d');
        $key = md5(sprintf('%s:%s:%s:%s:%s', __CLASS__, __METHOD__, $page, $sort, $direction));
        if ($request->isXmlHttpRequest()) {
            if (!$this->isCached($key)) {
                $customers = $paginator->paginate(Customer::class, $page);
                $this->cache($key, $customers);
            } else {
                $customers = $this->cache($key);
            }

            $table = $this->renderView('customer/table-content.html.twig', ['customers' => $customers]);
            $pagination = $this->renderView('customer/pagination.html.twig', ['customers' => $customers]);

            return new JsonResponse([
                'table' => $table,
                'pagination' => $pagination,
                '_cache_id' => $key,
            ]);
        }

        return $this->render('customer/index.html.twig', [
            'title' => $this->getPageTitle(),
            'cacheId' => $key,
        ]);
    }

    /**
     * @Route("/{id}", methods={"GET"}, name="customers_detail", options={"expose"=true})
     *
     * @Permission(actions=Permission::VIEW)
     */
    public function find(string $id, CustomerService $service, SerializerInterface $serializer)
    {
        $customer = $service->get($id);
        if (!$customer) {
            throw new NotFoundHttpException();
        }

        return new JsonResponse($serializer->serialize($customer, 'json', ['groups' => ['read']]));
    }

    /**
     * @Route("/save", methods={"POST"}, name="customers_save", options={"expose"=true})
     *
     * @Permission(actions={Permission::ADD, Permission::EDIT})
     */
    public function save(Request $request, CustomerService $service, RequestHandler $requestHandler)
    {
        $primary = $request->get('id');
        if ($primary) {
            $customer = $service->get($primary);
        } else {
            $customer = new Customer();
        }

        $requestHandler->handle($request, $customer);
        if (!$requestHandler->isValid()) {
            return new JsonResponse(['status' => 'KO', 'errors' => $requestHandler->getErrors()]);
        }

        $this->commit($customer);

        return new JsonResponse(['status' => 'OK']);
    }

    /**
     * @Route("/{id}/delete", methods={"POST"}, name="customers_remove", options={"expose"=true})
     *
     * @Permission(actions=Permission::DELETE)
     */
    public function delete(string $id, CustomerService $service)
    {
        if (!$customer = $service->get($id)) {
            throw new NotFoundHttpException();
        }

        $this->remove($customer);

        return new JsonResponse(['status' => 'OK']);
    }
}
