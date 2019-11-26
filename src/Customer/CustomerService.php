<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Customer;

use KejawenLab\Semart\Skeleton\Contract\Service\ServiceInterface;
use KejawenLab\Semart\Skeleton\Entity\Customer;
use KejawenLab\Semart\Skeleton\Repository\CustomerRepository;

/**
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class CustomerService implements ServiceInterface
{
    private $customerRepository;

    public function __construct(CustomerRepository $customerRepository)
    {
        $customerRepository->setCacheable(true);
        $this->customerRepository = $customerRepository;
    }

    /**
     * @param string $id
     *
     * @return Customer|null
     */
    public function get(string $id): ?object
    {
        return $this->customerRepository->find($id);
    }

    /**
    * @return Customer[]
    */
    public function getActives(): array
    {
        return $this->customerRepository->findAll();
    }
}
