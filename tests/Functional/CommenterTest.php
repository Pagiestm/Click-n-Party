<?php

namespace App\Tests;

use App\Entity\Utilisateurs;
use Symfony\Component\HttpFoundation\Request;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class CommenterTest extends WebTestCase
{

    public function testCreateComment(): void
    {
        $client = static::createClient();

        // Récupération de l'url generator
        $urlGenerator = $client->getContainer()->get('router');

        // Récupération de l'entity manager
        $entityManager = $client->getContainer()->get('doctrine.orm.entity_manager');

        $user = $entityManager->find(Utilisateurs::class, 1);

        $client->loginUser($user);

        // Aller sur la page de création de commentaire
        $crawler = $client->request(Request::METHOD_GET, $urlGenerator->generate('app_commenter', ['locationId' => 11]));

        // Rempli le formulaire avec des données valides
        $form = $crawler->filter('form[name=commenter]')->form([
            'commenter[Avis]' => 'Ceci est un commentaire de test',
            'commenter[Note_Loueur]' => '4',
        ]);

        // Soumettre le formulaire
        $client->submit($form);

        // Vérifie que l'utilisateur est redirigé vers la page de la location
        $this->assertResponseRedirects($urlGenerator->generate('app_location', ['id' => 11]));
    }

    public function testReadComment(): void
    {
        $client = static::createClient();

        $urlGenerator = $client->getContainer()->get('router');

        $entityManager = $client->getContainer()->get('doctrine.orm.entity_manager');

        $user = $entityManager->find(Utilisateurs::class, 1);

        $client->loginUser($user);

        // Aller sur la page de détail du commentaire
        $crawler = $client->request(Request::METHOD_GET, $urlGenerator->generate('app_location', ['id' => 11]));

        // Vérifie que la page contient le bon commentaire
        $this->assertSelectorTextContains('html', 'Ceci est un commentaire de test');
        $this->assertSelectorTextContains('html', '4');
    }
}
