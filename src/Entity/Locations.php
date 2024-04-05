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

    #[ORM\Column(type: Types::TEXT)]
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

    #[ORM\ManyToMany(targetEntity: Categories::class, inversedBy: 'locations')]
    private Collection $Categories;

    #[ORM\OneToMany(mappedBy: 'Locations', targetEntity: Images::class, orphanRemoval: true, cascade: ['persist'])]
    private Collection $images;

    #[ORM\ManyToMany(targetEntity: Equipements::class, mappedBy: 'Locations')]
    private Collection $Equipements;

    public function __construct()
    {
        $this->Categories = new ArrayCollection();
        $this->images = new ArrayCollection();
        $this->Equipements = new ArrayCollection();
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

    /**
     * @return Collection<int, Images>
     */
    public function getImages(): Collection
    {
        return $this->images;
    }

    public function addImage(Images $image): static
    {
        if (!$this->images->contains($image)) {
            $this->images->add($image);
            $image->setLocations($this);
        }

        return $this;
    }

    public function removeImage(Images $image): static
    {
        if ($this->images->removeElement($image)) {
            // set the owning side to null (unless already changed)
            if ($image->getLocations() === $this) {
                $image->setLocations(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Equipements>
     */
    public function getEquipements(): Collection
    {
        return $this->Equipements;
    }

    public function addEquipement(Equipements $equipement): static
    {
        if (!$this->Equipements->contains($equipement)) {
            $this->Equipements->add($equipement);
            $equipement->addLocation($this);
        }

        return $this;
    }

    public function removeEquipement(Equipements $equipement): static
    {
        if ($this->Equipements->removeElement($equipement)) {
            $equipement->removeLocation($this);
        }

        return $this;
    }
}
