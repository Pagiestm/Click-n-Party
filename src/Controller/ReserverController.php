<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\ReserverRepository;

class ReserverController extends AbstractController
{
    #[Route('/reserver', name: 'app_reserver')]
    public function Reservations(ReserverRepository $reserverRepository): Response
    {
        // Récupérer l'utilisateur connecté
        $user = $this->getUser();

        // Vérifier si l'utilisateur est connecté
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        // Récupérer les réservations de l'utilisateur
        $reservations = $reserverRepository->findBy(['Utilisateurs' => $user]);

        // Passer les réservations à la vue
        return $this->render('reserver/index.html.twig', [
            'reservations' => $reservations,
        ]);
    }
}
