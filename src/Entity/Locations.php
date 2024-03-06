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

    #[ORM\Column]
    private ?float $Prix = null;

    #[ORM\Column(length: 255)]
    private ?string $Adresse = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $Date_Debut_Disponibilite = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $Date_Fin_Disponibilite = null;

    #[ORM\Column]
    private ?int $Capacite_maximal = null;

    #[ORM\Column]
    private ?bool $PMR = null;

    #[ORM\Column]
    private ?bool $Actif = null;

    #[ORM\ManyToOne(inversedBy: 'locations')]
    private ?Utilisateurs $Utilisateurs = null;

    #[ORM\ManyToMany(targetEntity: Categories::class)]
    private Collection $Appartenir;

    #[ORM\ManyToMany(targetEntity: Categories::class, inversedBy: 'locations')]
    private Collection $Categories;

    #[ORM\ManyToOne(inversedBy: 'Locations')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Images $images = null;

    public function __construct()
    {
        $this->Appartenir = new ArrayCollection();
        $this->Categories = new ArrayCollection();
    }

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

    public function getDateDebutDisponibilite(): ?\DateTimeInterface
    {
        return $this->Date_Debut_Disponibilite;
    }

    public function setDateDebutDisponibilite(\DateTimeInterface $Date_Debut_Disponibilite): static
    {
        $this->Date_Debut_Disponibilite = $Date_Debut_Disponibilite;

        return $this;
    }

    public function getDateFinDisponibilite(): ?\DateTimeInterface
    {
        return $this->Date_Fin_Disponibilite;
    }

    public function setDateFinDisponibilite(\DateTimeInterface $Date_Fin_Disponibilite): static
    {
        $this->Date_Fin_Disponibilite = $Date_Fin_Disponibilite;

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

    public function isActif(): ?bool
    {
        return $this->Actif;
    }

    public function setActif(bool $Actif): static
    {
        $this->Actif = $Actif;

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

    /**
     * @return Collection<int, Categories>
     */
    public function getAppartenir(): Collection
    {
        return $this->Appartenir;
    }

    public function addAppartenir(Categories $appartenir): static
    {
        if (!$this->Appartenir->contains($appartenir)) {
            $this->Appartenir->add($appartenir);
        }

        return $this;
    }

    public function removeAppartenir(Categories $appartenir): static
    {
        $this->Appartenir->removeElement($appartenir);

        return $this;
    }

    /**
     * @return Collection<int, Categories>
     */
    public function getCategories(): Collection
    {
        return $this->Categories;
    }

    public function addCategory(Categories $category): static
    {
        if (!$this->Categories->contains($category)) {
            $this->Categories->add($category);
        }

        return $this;
    }

    public function removeCategory(Categories $category): static
    {
        $this->Categories->removeElement($category);

        return $this;
    }

    public function getImages(): ?Images
    {
        return $this->images;
    }

    public function setImages(?Images $images): static
    {
        $this->images = $images;

        return $this;
    }
}
