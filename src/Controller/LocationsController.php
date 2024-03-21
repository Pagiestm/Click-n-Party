<?php

namespace App\Controller;

use App\Repository\CategoriesRepository;
use App\Repository\LocationsRepository;
use App\Repository\AjouterEnFavorisRepository;
use App\Repository\ReserverRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Reserver;
use App\Form\ReserverType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;

class LocationsController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function Home(
        CategoriesRepository $categoriesRepo,
        LocationsRepository $locationsRepo,
        AjouterEnFavorisRepository $favorisRepo
    ): Response {
        $categories = $categoriesRepo->findAll();
        $locations = $locationsRepo->findAll();

        // Obtenir l'utilisateur actuel
        $user = $this->getUser();

        $favoris = [];
        if ($user) {
            // Obtenir les favoris de l'utilisateur actuel
            $favoris = $favorisRepo->findFavoritesByUser($user->getId());
        }

        return $this->render('home/index.html.twig', [
            "categories" => $categories,
            "locations" => $locations,
            "favoris" => $favoris
        ]);
    }

    #[Route('/location/{id}', name: 'app_location')]
    public function Location($id, LocationsRepository $locationsRepo, ReserverRepository $reserverRepo, Request $request, EntityManagerInterface $em): Response
    {
        $location = $locationsRepo->find($id);

        // Récupération des réservations associées à la location
        $reservations = $reserverRepo->findBy(['Locations' => $location]);

        // Création d'une nouvelle réservation
        $reservation = new Reserver();
        
        $reservation->setStatut('transmis');

        // Création du formulaire
        $reservationForm = $this->createForm(ReserverType::class, $reservation);
        // Traitement de la requête du formulaire
        $reservationForm->handleRequest($request);

        // Vérification de la soumission et de la validité du formulaire
        if ($reservationForm->isSubmitted() && $reservationForm->isValid()) {
            // Vérifiez si les dates de réservation sont disponibles
            $dateDebut = $reservation->getDateDebut();
            $dateFin = $reservation->getDateFin();
            $nombreDeLocataires = $reservation->getNombresDeLocataires();
            $capaciteMaximale = $location->getCapaciteMaximal();
        
            if ($location->getDateDebutDisponibilite() <= $dateDebut && $location->getDateFinDisponibilite() >= $dateFin) {
                // Vérifiez si le nombre de locataires est inférieur ou égal à la capacité maximale
                if ($nombreDeLocataires <= $capaciteMaximale) {
                    $session = $request->getSession();
                    $session->set('reservation', $reservation);
        
                    return $this->redirectToRoute('app_paiement', ['id' => $location->getId()]);
                } else {
                    $this->addFlash('error', 'Le nombre de locataires est supérieur à la capacité maximale.');
                }
            } else {
                $this->addFlash('error', 'Les dates sélectionnées ne sont pas disponibles.');
            }  
        }

        return $this->render('home/location.html.twig', [
            "location" => $location,
            'reservationForm' => $reservationForm->createView(),
            'reservations' => $reservations,
        ]);
    }
}
