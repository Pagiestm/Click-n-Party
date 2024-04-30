<?php

namespace App\Entity;

use App\Repository\ReserverRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ReserverRepository::class)]
class Reserver
{
    #[ORM\Id]
    #[ORM\Column(type: "integer")]
    #[ORM\GeneratedValue(strategy: "AUTO")]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $Date_debut = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $Date_fin = null;

    #[ORM\Column(length: 15)]
    private ?string $Statut = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Utilisateurs $Utilisateurs = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: true, onDelete: "SET NULL")]
    private ?Locations $Locations = null;

    #[ORM\Column]
    private ?float $NombresDeLocataires = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateDebut(): ?\DateTimeInterface
    {
        return $this->Date_debut;
    }

    public function setDateDebut(\DateTimeInterface $Date_debut): static
    {
        $this->Date_debut = $Date_debut;

        return $this;
    }

    public function getDateFin(): ?\DateTimeInterface
    {
        return $this->Date_fin;
    }

    public function setDateFin(\DateTimeInterface $Date_fin): static
    {
        $this->Date_fin = $Date_fin;

        return $this;
    }

    public function getStatut(): ?string
    {
        return $this->Statut;
    }

    public function setStatut(string $Statut): static
    {
        $this->Statut = $Statut;

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

    public function getNombresDeLocataires(): ?float
    {
        return $this->NombresDeLocataires;
    }

    public function setNombresDeLocataires(float $NombresDeLocataires): static
    {
        $this->NombresDeLocataires = $NombresDeLocataires;

        return $this;
    }
}
