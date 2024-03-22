<?php

namespace App\Controller;

use App\Entity\Locations;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Attribute\Route;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Stripe\Stripe;
use Symfony\Component\HttpFoundation\Request;
use App\Repository\LocationsRepository;

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
    public function StripeCheckout(int $id, Request $request): RedirectResponse
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

        $session = $request->getSession();
        
        // Récupére le prix total de la session
        $prixTotal = $session->get('prixTotal');

        // Récupére le nombre de jours de la session
        $nombreDeJours = $session->get('nombreDeJours');

        $checkout_session = \Stripe\Checkout\Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [[
                'price_data' => [
                    'currency' => 'eur',
                    'product_data' => [
                        'name' => $location->getNom(),
                        'description' => 'Réservation pour ' . $nombreDeJours . ' jours',
                    ],
                    'unit_amount' => $prixTotal * 100,
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
    }

    #[Route('/paiement/success/{id}', name: 'app_paiement_success')]
    public function StripeSuccess(Request $request, $id, LocationsRepository $locationsRepo): RedirectResponse
    {
        $location = $locationsRepo->find($id);

        $session = $request->getSession();
        $SessionReservation = $session->get('reservation');
        $user = $this->getUser();
        if ($user) {
            $SessionReservation->setUtilisateurs($user);
        }
        $SessionReservation->setLocations($location);
        $this->entityManager->persist($SessionReservation);
        $this->entityManager->flush();
        return $this->redirectToRoute('app_home');
    }

    #[Route('/paiement/error/{id}', name: 'app_paiement_error')]
    public function StripeError(): RedirectResponse
    {
        return $this->redirectToRoute('app_show_location');
    }
}
