<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use Gedmo\SoftDeleteable\Traits\SoftDeleteableEntity;
use KejawenLab\Semart\Skeleton\Contract\Entity\PrimaryableTrait;
use KejawenLab\Semart\Skeleton\Query\Sortable;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Table(name="semart_angsuran")
 * @ORM\Entity(repositoryClass="KejawenLab\Semart\Skeleton\Repository\InstallmentRepository")
 *
 * @Gedmo\SoftDeleteable(fieldName="deletedAt")
 *
 * @Sortable({"installmentDate"})
 *
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class Installment
{
    use PrimaryableTrait;
    use SoftDeleteableEntity;

    /**
     * @ORM\Column(name="tanggal_angsuran", type="date")
     *
     * @Groups({"read"})
     */
    private $installmentDate;

    /**
     * @ORM\ManyToOne(targetEntity="KejawenLab\Semart\Skeleton\Entity\Order", fetch="EAGER")
     * @ORM\JoinColumn(name="order_id", referencedColumnName="id")
     *
     * @Assert\NotBlank()
     *
     * @Groups({"read"})
     **/
    private $order;

    /**
     * @ORM\Column(name="jumlah", type="decimal", precision=17, scale=0)
     *
     * @Assert\Positive()
     * @Assert\NotBlank()
     *
     * @Groups({"read"})
     */
    private $amount;

    /**
     * @ORM\Column(name="keterangan", type="string", length=7, nullable=true)
     */
    private $description;

    public function __construct()
    {
        $this->installmentDate = new \DateTime();
    }

    public function getInstallmentDate(): \DateTimeInterface
    {
        return $this->installmentDate;
    }

    public function setInstallmentDate(\DateTimeInterface $installmentDate): void
    {
        $this->installmentDate = $installmentDate;
    }

    public function getOrder(): ?Order
    {
        return $this->order;
    }

    public function setOrder(Order $order): void
    {
        $this->order = $order;
    }

    public function getAmount(): float
    {
        return (float) $this->amount;
    }

    public function setAmount(float $amount): void
    {
        $this->amount = $amount;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): void
    {
        $this->description = $description;
    }
}
