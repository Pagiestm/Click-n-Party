<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\Response;

class ContactTest extends WebTestCase
{
    public function testSomething(): void
    {
        $client = static::createClient();
        $crawler = $client->request('GET', '/contact');

        $this->assertResponseIsSuccessful();
        $this->assertSelectorTextContains('h1', 'Contact');

        //Récupération du formulaire
        $submitButton = $crawler->selectButton('Envoyer');
        $form = $submitButton->form();

        $form['contact[Nom]'] = 'Doe';
        $form['contact[Prenom]'] = 'John';
        $form['contact[email]'] = 'john.doe@gmail.com';
        $form['contact[Sujet]'] = 'Test';
        $form['contact[Message]'] = 'Ceci est un message de test';

        //Soumettre le formulaire
        $client->submit($form);

        //Vérfie le statut HTTP
        $this->assertResponseStatusCodeSame(Response::HTTP_FOUND);

        //Vérifie que le mail a bien été envoyé
        $this->assertEmailCount(1);

        $client->followRedirect();

        //Vérifie la présence du message de succès
        $this->assertSelectorTextContains('div.bg-green-100.border.border-green-400.text-green-700.px-4.py-3.rounded.relative.animate-slide-down.text-center', 'Succès !');
    }
}
