<?php

namespace App\Entity;

use App\Repository\AjouterEnFavorisRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AjouterEnFavorisRepository::class)]
class AjouterEnFavoris
{

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $Date_ajout = null;

    #[ORM\Id]
    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Utilisateurs $Utilisateurs = null;

    #[ORM\Id]
    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Locations $Locations = null;

    public function getDateAjout(): ?\DateTimeInterface
    {
        return $this->Date_ajout;
    }

    public function setDateAjout(\DateTimeInterface $Date_ajout): static
    {
        $this->Date_ajout = $Date_ajout;

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

    public function getLocations(): ?Locations
    {
        return $this->Locations;
    }

    public function setLocations(?Locations $Locations): static
    {
        $this->Locations = $Locations;

        return $this;
    }
}
