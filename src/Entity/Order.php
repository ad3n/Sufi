<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use Gedmo\SoftDeleteable\Traits\SoftDeleteableEntity;
use KejawenLab\Semart\Skeleton\Contract\Entity\PrimaryableTrait;
use KejawenLab\Semart\Skeleton\Query\Searchable;
use KejawenLab\Semart\Skeleton\Query\Sortable;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Table(name="semart_order")
 * @ORM\Entity(repositoryClass="KejawenLab\Semart\Skeleton\Repository\OrderRepository")
 *
 * @Gedmo\SoftDeleteable(fieldName="deletedAt")
 *
 * @Searchable({"customer.name", "productName"})
 * @Sortable({"customer.name", "productName"})
 *
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class Order
{
    use PrimaryableTrait;
    use SoftDeleteableEntity;

    /**
     * @ORM\ManyToOne(targetEntity="KejawenLab\Semart\Skeleton\Entity\Customer", fetch="EAGER")
     * @ORM\JoinColumn(name="pelanggan_id", referencedColumnName="id")
     *
     * @Assert\NotBlank()
     *
     * @Groups({"read"})
     **/
    private $customer;

    /**
     * @ORM\Column(name="nama_produk", type="string", length=77)
     *
     * @Assert\Length(max=77)
     * @Assert\NotBlank()
     *
     * @Groups({"read"})
     */
    private $productName;

    /**
     * @ORM\Column(name="harga", type="decimal", precision=17, scale=0)
     *
     * @Assert\Positive()
     * @Assert\NotBlank()
     *
     * @Groups({"read"})
     */
    private $price;

    /**
     * @ORM\Column(name="keuntungan", type="decimal", precision=17, scale=0)
     *
     * @Assert\Positive()
     * @Assert\NotBlank()
     *
     * @Groups({"read"})
     */
    private $margin;

    /**
     * @ORM\Column(name="cashback", type="decimal", precision=17, scale=0)
     *
     * @Groups({"read"})
     */
    private $cashback;

    /**
     * @ORM\Column(name="lama_cicilan", type="smallint")
     *
     * @Assert\Positive()
     * @Assert\NotBlank()
     *
     * @Groups({"read"})
     */
    private $installmentPeriod;

    /**
     * @ORM\Column(name="lunas", type="boolean")
     *
     * @Groups({"read"})
     */
    private $isPaidOff;

    /**
     * @ORM\Column(name="batal_order", type="boolean")
     *
     * @Groups({"read"})
     */
    private $cancelled;

    public function __construct()
    {
        $this->cancelled = false;
        $this->isPaidOff = false;
        $this->cashback = 0.0;
    }

    public function getCustomer(): ?Customer
    {
        return $this->customer;
    }

    public function setCustomer(Customer $customer): void
    {
        $this->customer = $customer;
    }

    public function getProductName(): ?string
    {
        return $this->productName;
    }

    public function setProductName(string $productName): void
    {
        $this->productName = $productName;
    }

    public function getPrice(): float
    {
        return (float) $this->price;
    }

    public function setPrice(float $price): void
    {
        $this->price = $price;
    }

    public function getMargin(): float
    {
        return (float) $this->margin;
    }

    public function setMargin(float $margin): void
    {
        $this->margin = $margin;
    }

    public function getCashback(): float
    {
        return (float) $this->cashback;
    }

    public function setCashback(float $cashback): void
    {
        $this->cashback = $cashback;
    }

    public function getInstallmentPeriod(): int
    {
        return (int) $this->installmentPeriod;
    }

    public function setInstallmentPeriod(int $installmentPeriod): void
    {
        $this->installmentPeriod = $installmentPeriod;
    }

    public function isPaidOff(): bool
    {
        return (bool) $this->isPaidOff;
    }

    public function setPaidOff(bool $isPaidOff): void
    {
        $this->isPaidOff = $isPaidOff;
    }

    public function isCancelled(): bool
    {
        return (bool) $this->cancelled;
    }

    public function setCancelled(bool $cancelled): void
    {
        $this->cancelled = $cancelled;
    }
}
