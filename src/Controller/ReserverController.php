<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\ReserverRepository;
use App\Repository\CommenterRepository;

class ReserverController extends AbstractController
{
    #[Route('/reserver/{page<\d+>?1}', name: 'app_reserver')]
    public function Reservations(int $page, ReserverRepository $reserverRepository, CommenterRepository $commenterRepo): Response
    {
        // Récupérer l'utilisateur connecté
        $user = $this->getUser();

        // Vérifier si l'utilisateur est connecté
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        $limit = 5;
        $totalReservations = $reserverRepository->count(['Utilisateurs' => $user]);
        $totalPages = ceil($totalReservations / $limit);
        $offset = ($page - 1) * $limit;

        // Récupérer les réservations de l'utilisateur
        $reservations = $reserverRepository->findBy(['Utilisateurs' => $user], ['Date_debut' => 'DESC'], $limit, $offset);

        // Passer les réservations à la vue
        return $this->render('reserver/index.html.twig', [
            'reservations' => $reservations,
            'commenterRepo' => $commenterRepo,
            'totalPages' => $totalPages,
            'currentPage' => $page,
            'reservationsPerPage' => $limit,
        ]);
    }
}
