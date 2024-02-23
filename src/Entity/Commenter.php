<?php

namespace App\Entity;

use App\Repository\CommenterRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CommenterRepository::class)]
class Commenter
{

    #[ORM\Column(length: 255)]
    private ?string $Avis = null;

    #[ORM\Column(nullable: true)]
    private ?int $Note_proprietaires = null;

    #[ORM\Column(nullable: true)]
    private ?int $Note_Loueur = null;

    #[ORM\Id]
    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Utilisateurs $Utilisateurs = null;

    #[ORM\Id]
    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Locations $Locations = null;

    public function getAvis(): ?string
    {
        return $this->Avis;
    }

    public function setAvis(string $Avis): static
    {
        $this->Avis = $Avis;

        return $this;
    }

    public function getNoteProprietaires(): ?int
    {
        return $this->Note_proprietaires;
    }

    public function setNoteProprietaires(?int $Note_proprietaires): static
    {
        $this->Note_proprietaires = $Note_proprietaires;

        return $this;
    }

    public function getNoteLoueur(): ?int
    {
        return $this->Note_Loueur;
    }

    public function setNoteLoueur(?int $Note_Loueur): static
    {
        $this->Note_Loueur = $Note_Loueur;

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
