<?php

namespace App\Controller;

use App\Entity\Locations;
use App\Form\LocationType;
use App\Entity\Images;
use App\Repository\ImagesRepository;
use App\Repository\LocationsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\Common\Collections\ArrayCollection;
use App\Entity\AjouterEnFavoris;
use App\Repository\ReserverRepository;

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

    #[Route('/mes-locations/{id}/reservations/{page<\d+>?1}', name: 'location_reservations')]
    public function locationReservations(int $id, LocationsRepository $locationRepository, ReserverRepository $reserverRepository, int $page): Response
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

        $location = $locationRepository->find($id);

        // Récupérer les réservations pour la location spécifiée + deuxième argument à findBy pour trier par Date de début en ordre décroissant
        $reservations = $reserverRepository->findBy(['Locations' => $id], ['Date_debut' => 'DESC'], $limit, $offset);

        // Rendre la vue avec les réservations
        return $this->render('locations/reservations.html.twig', [
            'reservations' => $reservations,
            'location' => $location,
            'totalPages' => $totalPages,
            'currentPage' => $page,
            'reservationsPerPage' => $limit,
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

            $this->addFlash('success', 'La nouvelle location a été créée avec succès.');

            return $this->redirectToRoute('mes_locations');
        }

        return $this->render('locations/add.html.twig', [
            'user' => $user,
            'locationForm' => $locationForm->createView(),
        ]);
    }

    #[Route('/edit-location/{id}', name: 'app_edit_location')]
    public function editLocation(Request $request, EntityManagerInterface $em, Locations $location): Response
    {
        $user = $this->getUser();
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        // Vérifie si l'utilisateur est le propriétaire de la location
        if ($user !== $location->getUtilisateurs()) {
            throw $this->createAccessDeniedException('Vous n\'êtes pas autorisé à modifier cette location.');
        }

        // Création du formulaire
        $locationForm = $this->createForm(LocationType::class, $location);

        // Avant de traiter le formulaire, récupérez les équipements originaux
        $originalEquipements = new ArrayCollection();
        foreach ($location->getEquipements() as $equipement) {
            $originalEquipements->add($equipement);
        }

        // Traitement de la requête du formulaire
        $locationForm->handleRequest($request);

        // Vérification de la soumission et de la validité du formulaire
        if ($locationForm->isSubmitted() && $locationForm->isValid()) {

            // Parcourez les équipements originaux pour voir s'ils ont été supprimés
            foreach ($originalEquipements as $equipement) {
                if (false === $location->getEquipements()->contains($equipement)) {
                    // Supprimez l'équipement de la base de données
                    $em->remove($equipement);
                }
            }

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

            $em->flush();

            $this->addFlash('success', 'La location a été modifié avec succès.');

            return $this->redirectToRoute('mes_locations');
        }

        return $this->render('locations/edit.html.twig', [
            'locationForm' => $locationForm->createView(),
            'location' => $location,
        ]);
    }

    #[Route('/delete-location/{id}', name: 'app_delete_location')]
    public function deleteLocation(EntityManagerInterface $em, Locations $location): Response
    {
        $user = $this->getUser();
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        // Vérifie si l'utilisateur est le propriétaire de la location
        if ($user !== $location->getUtilisateurs()) {
            throw $this->createAccessDeniedException('Vous n\'êtes pas autorisé à supprimer cette location.');
        }

        // Supprime les likes associés à la location
        $likes = $em->getRepository(AjouterEnFavoris::class)->findBy(['Locations' => $location]);
        foreach ($likes as $like) {
            $em->remove($like);
        }

        // Supprime les images associées à la location
        foreach ($location->getImages() as $image) {
            // Construit le chemin vers le fichier d'image
            $imagePath = $this->getParameter('images_directory') . '/' . $image->getNom();

            // Supprime le fichier d'image du système de fichiers
            if (file_exists($imagePath)) {
                unlink($imagePath);
            }

            $em->remove($image);
        }

        // Supprime les équipements associés à la location
        foreach ($location->getEquipements() as $equipement) {
            $em->remove($equipement);
        }

        // Supprime la location
        $em->remove($location);
        $em->flush();

        $this->addFlash('success', 'La location a été supprimé avec succès.');

        return $this->redirectToRoute('mes_locations');
    }

    #[Route('/remove-image/{id}', name: 'remove_image', methods: ['DELETE'])]
    public function removeImage($id, ImagesRepository $imageRepo, EntityManagerInterface $em): Response
    {
        $image = $imageRepo->find($id);

        if ($image) {
            // Construit le chemin vers le fichier d'image
            $imagePath = $this->getParameter('images_directory') . '/' . $image->getNom();

            // Supprime le fichier d'image du système de fichiers
            if (file_exists($imagePath)) {
                unlink($imagePath);
            }

            $em->remove($image);
            $em->flush();
        }

        return new Response(null, 204);
    }
}
