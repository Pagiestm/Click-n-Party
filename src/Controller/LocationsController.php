<?php

namespace App\Controller;

use App\Entity\Locations;
use App\Form\LocationType;
use App\Repository\LocationsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class LocationsController extends AbstractController
{
    #[Route('/mes-locations', name: 'mes_locations')]
    public function mesLocations(LocationsRepository $locationRepository): Response
    {
        // Récupérer l'utilisateur connecté
        $user = $this->getUser();

        // Vérifier si l'utilisateur est connecté
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        // Récupérer les locations de l'utilisateur
        $locations = $locationRepository->findBy(['Utilisateurs' => $user]);

        // Rendre la vue avec les locations
        return $this->render('locations/index.html.twig', [
            'locations' => $locations,
        ]);
    }

    #[Route('/add-location', name: 'app_add_location')]
    public function addLocation(Request $request, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        // Création d'une nouvelle location
        $location = new Locations();

        // Associer l'utilisateur à la location
        $location->setUtilisateurs($user);

        //Création du formulaire
        $locationForm = $this->createForm(LocationType::class, $location);
        // Traitement de la requête du formulaire
        $locationForm->handleRequest($request);

        // Vérification de la soumission et de la validité du formulaire
        if ($locationForm->isSubmitted() && $locationForm->isValid()) {
            $em->persist($location);
            $em->flush();

            return $this->redirectToRoute('mes_locations');
        }

        return $this->render('locations/add.html.twig', [
            'user' => $user,
            'locationForm' => $locationForm->createView(),
        ]);
    }
}
