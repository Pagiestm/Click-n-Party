<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\AjouterEnFavoris;
use App\Entity\Locations;
use Doctrine\ORM\EntityManagerInterface;


class FavorisController extends AbstractController
{
    #[Route('/add-favoris', name: 'app_favoris')]
    public function addToFavorites(Request $request, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();
        if (!$user) {
            return new Response('Not authenticated', Response::HTTP_UNAUTHORIZED);
        }

        // Obtenir les données de la requête
        $data = json_decode($request->getContent(), true);
        $locationId = $data['locationId'];

        $location = $em->getRepository(Locations::class)->find($locationId);
        if (!$location) {
            return new Response('Location not found', Response::HTTP_NOT_FOUND);
        }

        $favoris = new AjouterEnFavoris();
        $favoris->setLocations($location);
        $favoris->setUtilisateurs($user);
        $favoris->setDateAjout(new \DateTime());

        $em->persist($favoris);
        $em->flush();

        return new Response('Added to favorites', Response::HTTP_OK);
    }

    #[Route('/remove-favoris', name: 'app_unfavoris', methods: ['DELETE'])]
    public function removeFromFavorites(Request $request, EntityManagerInterface $em): Response
    {
        $data = json_decode($request->getContent(), true);
        $locationId = $data['locationId'];

        $location = $em->getRepository(Locations::class)->find($locationId);
        if (!$location) {
            return new Response('Location not found', Response::HTTP_NOT_FOUND);
        }

        $favoris = $em->getRepository(AjouterEnFavoris::class)->findOneBy([
            'Locations' => $location,
        ]);

        if ($favoris) {
            $em->remove($favoris);
            $em->flush();
        }

        return new Response('Removed from favorites', Response::HTTP_OK);
    }
}