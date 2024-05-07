<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\Response;

class LoginTest extends WebTestCase
{
    public function testIfLoginIsSuccessful(): void
    {
        $client = static::createClient();

        /** @var UrlGeneratorInterface */
        $urlGenerator = $client->getContainer()->get('router');

        $crawler = $client->request('GET', $urlGenerator->generate('app_login'));

        //Form
        $form = $crawler->filter("form[name=login]")->form([
            "email" => "test@gmail.com",
            "password" => "password",
        ]);

        $client->submit($form);

        $this->assertResponseStatusCodeSame(Response::HTTP_FOUND);

        $client->followRedirect();
    }

    public function testIfLoginFailedWhenPasswordIsIncorrect(): void
    {
        $client = static::createClient();

        /** @var UrlGeneratorInterface */
        $urlGenerator = $client->getContainer()->get('router');

        $crawler = $client->request('GET', $urlGenerator->generate('app_login'));

        //Form
        $form = $crawler->filter("form[name=login]")->form([
            "email" => "test@gmail.com",
            "password" => "password_",
        ]);

        $client->submit($form);

        $this->assertResponseStatusCodeSame(Response::HTTP_FOUND);

        $client->followRedirect();

        $this->assertRouteSame('app_login');

        $this->assertSelectorExists('div.alert.alert-danger');
    }
}
