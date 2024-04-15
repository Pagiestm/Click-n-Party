<?php

namespace App\Entity;

use App\Repository\EquipementsRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: EquipementsRepository::class)]
class Equipements
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100)]
    private ?string $Libelle = null;

    #[ORM\ManyToMany(targetEntity: Locations::class, inversedBy: 'Equipements', cascade: ['persist', 'remove'])]
    private Collection $Locations;

    public function __construct()
    {
        $this->Locations = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLibelle(): ?string
    {
        return $this->Libelle;
    }

    public function setLibelle(string $Libelle): static
    {
        $this->Libelle = $Libelle;

        return $this;
    }

    /**
     * @return Collection<int, Locations>
     */
    public function getLocations(): Collection
    {
        return $this->Locations;
    }

    public function addLocation(Locations $location): static
    {
        if (!$this->Locations->contains($location)) {
            $this->Locations->add($location);
        }

        return $this;
    }

    public function removeLocation(Locations $location): static
    {
        $this->Locations->removeElement($location);

        return $this;
    }
}
