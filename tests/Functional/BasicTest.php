<?php

namespace App\Tests\Functional;

use App\Entity\Categories;
use App\Entity\Equipements;
use App\Entity\Locations;
use App\Entity\Utilisateurs;
use App\Form\LocationType;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class BasicTest extends WebTestCase
{
    public function testAddLocation(): void
    {
        $client = static::createClient();

        // Récupération de l'url generator
        $urlGenerator = $client->getContainer()->get('router');

        // Récupération de l'entity manager
        $entityManager = $client->getContainer()->get('doctrine.orm.entity_manager');

        $user = $entityManager->find(Utilisateurs::class, 1);

        $client->loginUser($user);

        $location = $entityManager->find(Locations::class, 10);

        // Aller sur la page de création d'une location
        $crawler = $client->request(Request::METHOD_GET, $urlGenerator->generate('app_add_location', ['id' => $location->getId()]));

        $categoriesRepository = $entityManager->getRepository(Categories::class);
        $categories = $categoriesRepository->findBy([], null, 2);

        // Create some fake uploaded images
        $images = [
            new \Symfony\Component\HttpFoundation\File\UploadedFile(
                __DIR__ . '/../../public/tests/uploads/image1.png', // path to the image file
                'image1.png', // original name of the file
                'image/png', // mime type of the file
                null,
                true // mark it as already moved, Symfony will not move it
            ),
            new \Symfony\Component\HttpFoundation\File\UploadedFile(
                __DIR__ . '/../../public/tests/uploads/image2.jpg',
                'image2.jpg',
                'image/jpeg',
                null,
                true
            ),
        ];

        $form = $crawler->filter('form[name=location]')->form([
            'location[Nom]' => 'Test Location',
            'location[Description]' => 'This is a test location',
            'location[Prix]' => 100,
            'location[Adresse]' => '123 Test Street',
            'location[Date_Debut_Disponibilite]' => '2022-01-01',
            'location[Date_Fin_Disponibilite]' => '2022-12-31',
            'location[Capacite_maximal]' => 10,
            'location[PMR]' => true,
            'location[Actif]' => true,
            'location[Equipements][0][libelle]' => 'Equipement 1',
            'location[Equipements][1][libelle]' => 'Equipement 2',
            'location[Equipements][2][libelle]' => 'Equipement 3',
            'location[Images]' => $images,
            'location[Categories]' => $categories,
        ]);               

        $client->submit($form);

        // Gére la redirection
        $this->assertResponseStatusCodeSame(Response::HTTP_FOUND);

        // Ajout du flash message
        $this->assertSelectorTextContains('div.alert-success', 'La nouvelle location a été créée avec succès.');

        $this->assertRouteSame('mes_locations');
    }
}
