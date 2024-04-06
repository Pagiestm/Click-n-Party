<?php

namespace App\Controller;

use App\Entity\Locations;
use App\Form\LocationType;
use App\Entity\Images;
use App\Repository\LocationsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class LocationsUtilisateursController extends AbstractController
{

    #[Route('/mes-locations/{page<\d+>?1}', name: 'mes_locations')]
    public function mesLocations(LocationsRepository $locationRepository, int $page): Response
    {
        // Récupérer l'utilisateur connecté
        $user = $this->getUser();

        // Vérifier si l'utilisateur est connecté
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        $limit = 5;
        $totalLocations = $locationRepository->count(['Utilisateurs' => $user]);
        $totalPages = ceil($totalLocations / $limit);
        $offset = ($page - 1) * $limit;

        // Récupérer les locations de l'utilisateur
        $locations = $locationRepository->findBy(['Utilisateurs' => $user], null, $limit, $offset);

        // Rendre la vue avec les locations
        return $this->render('locations/index.html.twig', [
            'locations' => $locations,
            'totalPages' => $totalPages,
            'currentPage' => $page,
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

            // récupération des images transmises 
            $images = $locationForm->get('Images')->getData();

            // On boucle sur les images
            foreach ($images as $image) {
                // On génère un nouveau nom de fichier
                $fichier = md5(uniqid()) . '.' . $image->guessExtension();

                // On copie le fichier dans le dossier uploads
                $image->move(
                    $this->getParameter('images_directory'),
                    $fichier
                );

                // On stocke l'image dans la base de données (son nom)
                $img = new Images();
                $img->setNom($fichier);
                $location->addImage($img);
            }

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
