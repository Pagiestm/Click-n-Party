<?php

namespace App\Controller;

use App\Repository\CategoriesRepository;
use App\Repository\LocationsRepository;
use App\Repository\AjouterEnFavorisRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
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
    public function Location($id, LocationsRepository $locationsRepo): Response
    {
        $location = $locationsRepo->find($id);

        return $this->render('home/location.html.twig', [
            "location" => $location
        ]);
    }
}
