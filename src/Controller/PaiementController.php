<?php

namespace App\Controller;

use App\Entity\Locations;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Attribute\Route;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\BillingPortal\Session;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Stripe\Stripe;
use Symfony\Component\BrowserKit\Response;

class PaiementController extends AbstractController
{

    private EntityManagerInterface $entityManager;
    private UrlGeneratorInterface $generator;

    public function __construct(EntityManagerInterface $entityManager, UrlGeneratorInterface $generator)
    {
        $this->entityManager = $entityManager;
        $this->generator = $generator;
    }

    #[Route('/paiement/create-session-stripe/{id}', name: 'app_paiement')]
    public function StripeCheckout(int $id): RedirectResponse
    {
        $location = $this->entityManager->getRepository(Locations::class)->find($id);

        if (!$location) {
            throw $this->createNotFoundException('La location demandée n\'existe pas');
        }

        $locationStripe[] = [
            'price_data' => [
                'currency' => 'eur',
                'product_data' => [
                    'name' => $location->getNom(),
                ],
                'unit_amount' => $location->getPrix() * 100,
            ],
            'quantity' => 1,
        ];

        $stripeSecretKey = $_SERVER['STRIPE_SECRET_KEY'];
        Stripe::setApiKey($stripeSecretKey);

        $checkout_session = \Stripe\Checkout\Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [[
                'price_data' => [
                    'currency' => 'eur',
                    'product_data' => [
                        'name' => $location->getNom(),
                    ],
                    'unit_amount' => $location->getPrix() * 100,
                ],
                'quantity' => 1,
            ]],
            'mode' => 'payment',
            'success_url' => $this->generator->generate('app_paiement_success', [
                'id' => $location->getId()
            ], UrlGeneratorInterface::ABSOLUTE_URL),
            'cancel_url' => $this->generator->generate('app_paiement_error', [
                'id' => $location->getId()
            ], UrlGeneratorInterface::ABSOLUTE_URL),
        ]);

        return new RedirectResponse($checkout_session->url);

        // return $this->render('paiement/index.html.twig', [
        //     'controller_name' => 'PaiementController',
        // ]);
    }

    #[Route('/paiement/success/{id}', name: 'app_paiement_success')]
    public function StripeSuccess(Locations $location): RedirectResponse
    {
        return $this->redirectToRoute('app_show_location');
    }

    #[Route('/paiement/error/{id}', name: 'app_paiement_error')]
    public function StripeError(Locations $location): RedirectResponse
    {
        return $this->redirectToRoute('app_show_location');
    }
}
