<?php

namespace App\Tests;

use App\Entity\Locations;
use App\Entity\Categories;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

class LocationsTest extends KernelTestCase
{
    private Locations $location;

    protected function setUp(): void
    {
        // On crée une nouvelle instance de Locations
        $this->location = new Locations();
    }

    // Test pour la propriété Nom
    public function testNom(): void
    {
        // On définit la valeur de Nom
        $this->location->setNom('Test Location');
        // On vérifie que la valeur retournée par getNom est celle attendue
        $this->assertSame('Test Location', $this->location->getNom());
    }

    // Test pour la propriété Description
    public function testDescription(): void
    {
        // On définit la valeur de Description
        $this->location->setDescription('Test Description');
        // On vérifie que la valeur retournée par getDescription est celle attendue
        $this->assertSame('Test Description', $this->location->getDescription());
    }

    // Test pour la propriété Prix
    public function testPrix(): void
    {
        // On définit la valeur de Prix
        $this->location->setPrix(100.0);
        // On vérifie que la valeur retournée par getPrix est celle attendue
        $this->assertSame(100.0, $this->location->getPrix());
    }

    // Test pour la propriété Adresse
    public function testAdresse(): void
    {
        // On définit la valeur de Adresse
        $this->location->setAdresse('Test Address');
        // On vérifie que la valeur retournée par getAdresse est celle attendue
        $this->assertSame('Test Address', $this->location->getAdresse());
    }

    // Test pour la propriété DateDebutDisponibilite
    public function testDateDebutDisponibilite(): void
    {
        // On définit la valeur de DateDebutDisponibilite
        $dateDebut = new \DateTime();
        $this->location->setDateDebutDisponibilite($dateDebut);
        // On vérifie que la valeur retournée par getDateDebutDisponibilite est celle attendue
        $this->assertSame($dateDebut, $this->location->getDateDebutDisponibilite());
    }

    // Test pour la propriété DateFinDisponibilite
    public function testDateFinDisponibilite(): void
    {
        // On définit la valeur de DateFinDisponibilite
        $dateFin = new \DateTime();
        $this->location->setDateFinDisponibilite($dateFin);
        // On vérifie que la valeur retournée par getDateFinDisponibilite est celle attendue
        $this->assertSame($dateFin, $this->location->getDateFinDisponibilite());
    }

    // Test pour la propriété CapaciteMaximal
    public function testCapaciteMaximal(): void
    {
        // On définit la valeur de CapaciteMaximal
        $this->location->setCapaciteMaximal(10);
        // On vérifie que la valeur retournée par getCapaciteMaximal est celle attendue
        $this->assertSame(10, $this->location->getCapaciteMaximal());
    }

    // Test pour la propriété PMR
    public function testPMR(): void
    {
        // On définit la valeur de PMR
        $this->location->setPMR(true);
        // On vérifie que la valeur retournée par isPMR est celle attendue
        $this->assertTrue($this->location->isPMR());
    }

    // Test pour la propriété Actif
    public function testActif(): void
    {
        // On définit la valeur de Actif
        $this->location->setActif(true);
        // On vérifie que la valeur retournée par isActif est celle attendue
        $this->assertTrue($this->location->isActif());
    }

    // Test pour la collection Categories
    public function testCategories(): void
    {
        // On vérifie que la collection est vide au départ
        $this->assertCount(0, $this->location->getCategories());

        // On ajoute une catégorie
        $category = new Categories();
        $this->location->addCategory($category);

        // On vérifie que la collection contient maintenant un élément
        $this->assertCount(1, $this->location->getCategories());

        // On supprime la catégorie
        $this->location->removeCategory($category);

        // On vérifie que la collection est à nouveau vide
        $this->assertCount(0, $this->location->getCategories());
    }
}
