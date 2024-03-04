<?php

namespace App\Controller;

use App\Repository\CategoriesRepository;
use App\Repository\LocationsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function Home(CategoriesRepository $categoriesRepo, LocationsRepository $locationsRepo): Response
    {

        $categories = $categoriesRepo->findAll();
        $locations = $locationsRepo->findAll();

        return $this->render('home/index.html.twig', [
            "categories" => $categories,
            "locations" => $locations
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
