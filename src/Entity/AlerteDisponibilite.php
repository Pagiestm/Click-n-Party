<?php

namespace App\Entity;

use App\Repository\AlerteDisponibiliteRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AlerteDisponibiliteRepository::class)]
class AlerteDisponibilite
{

    #[ORM\Column(nullable: true)]
    private ?bool $Actif = null;

    #[ORM\Column(options: ['default' => 'CURRENT_TIMESTAMP'])]
    private ?\DateTimeInterface $Date_creation = null;

    #[ORM\Id]
    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Utilisateurs $Utilisateurs = null;

    #[ORM\Id]
    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Categories $Categories = null;

    public function isActif(): ?bool
    {
        return $this->Actif;
    }

    public function setActif(?bool $Actif): static
    {
        $this->Actif = $Actif;

        return $this;
    }

    public function getDateCreation(): ?\DateTimeInterface
    {
        return $this->Date_creation;
    }

    public function setDateCreation(\DateTimeInterface $Date_creation): static
    {
        $this->Date_creation = $Date_creation;

        return $this;
    }

    public function getUtilisateurs(): ?Utilisateurs
    {
        return $this->Utilisateurs;
    }

    public function setUtilisateurs(?Utilisateurs $Utilisateurs): static
    {
        $this->Utilisateurs = $Utilisateurs;

        return $this;
    }

    public function getCategories(): ?Categories
    {
        return $this->Categories;
    }

    public function setCategories(?Categories $Categories): static
    {
        $this->Categories = $Categories;

        return $this;
    }
}
