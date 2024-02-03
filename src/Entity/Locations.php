<?php

namespace App\Entity;

use App\Repository\LocationsRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: LocationsRepository::class)]
class Locations
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100)]
    private ?string $Nom = null;

    #[ORM\Column(length: 255)]
    private ?string $Description = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $Image = null;

    #[ORM\Column]
    private ?float $Prix = null;

    #[ORM\Column(length: 255)]
    private ?string $Adresse = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $Date_disponibilite = null;

    #[ORM\Column(nullable: true)]
    private ?int $Notes = null;

    #[ORM\Column]
    private ?int $Capacite_maximal = null;

    #[ORM\Column]
    private ?bool $PMR = null;

    #[ORM\Column]
    private ?bool $Disponible = null;

    #[ORM\ManyToOne(inversedBy: 'locations')]
    private ?Utilisateurs $Utilisateurs = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->Nom;
    }

    public function setNom(string $Nom): static
    {
        $this->Nom = $Nom;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->Description;
    }

    public function setDescription(string $Description): static
    {
        $this->Description = $Description;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->Image;
    }

    public function setImage(string $Image): static
    {
        $this->Image = $Image;

        return $this;
    }

    public function getPrix(): ?float
    {
        return $this->Prix;
    }

    public function setPrix(float $Prix): static
    {
        $this->Prix = $Prix;

        return $this;
    }

    public function getAdresse(): ?string
    {
        return $this->Adresse;
    }

    public function setAdresse(string $Adresse): static
    {
        $this->Adresse = $Adresse;

        return $this;
    }

    public function getDateDisponibilite(): ?\DateTimeInterface
    {
        return $this->Date_disponibilite;
    }

    public function setDateDisponibilite(\DateTimeInterface $Date_disponibilite): static
    {
        $this->Date_disponibilite = $Date_disponibilite;

        return $this;
    }

    public function getNotes(): ?int
    {
        return $this->Notes;
    }

    public function setNotes(?int $Notes): static
    {
        $this->Notes = $Notes;

        return $this;
    }

    public function getCapaciteMaximal(): ?int
    {
        return $this->Capacite_maximal;
    }

    public function setCapaciteMaximal(int $Capacite_maximal): static
    {
        $this->Capacite_maximal = $Capacite_maximal;

        return $this;
    }

    public function isPMR(): ?bool
    {
        return $this->PMR;
    }

    public function setPMR(bool $PMR): static
    {
        $this->PMR = $PMR;

        return $this;
    }

    public function isDisponible(): ?bool
    {
        return $this->Disponible;
    }

    public function setDisponible(bool $Disponible): static
    {
        $this->Disponible = $Disponible;

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
}
