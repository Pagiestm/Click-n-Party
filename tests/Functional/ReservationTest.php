<?php

namespace App\Tests\Functional;

use App\Entity\Utilisateurs;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ReservationTest extends WebTestCase
{

    public function testReserverForm(): void
    {
        $client = static::createClient();

        // Récupération de l'url generator
        $urlGenerator = $client->getContainer()->get('router');

        // Récupération de l'entity manager
        $entityManager = $client->getContainer()->get('doctrine.orm.entity_manager');

        $user = $entityManager->find(Utilisateurs::class, 1);

        $client->loginUser($user);

        // Aller sur la page de réservation
        $crawler = $client->request(Request::METHOD_GET, $urlGenerator->generate('app_location', ['id' => 10]));

        // Remplir le formulaire
        $form = $crawler->filter('form[name=reserver]')->form([
            'reserver[Date_debut]' => '2024-04-07',
            'reserver[Date_fin]' => '2024-04-07',
            'reserver[NombresDeLocataires]' => 2,
        ]);

        // Soumettre le formulaire
        $client->submit($form);

        // Vérifier que la redirection a eu lieu
        $this->assertResponseStatusCodeSame(Response::HTTP_FOUND);
    }

}
