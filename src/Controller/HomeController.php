<?php

namespace App\Controller;

use App\Repository\CategoriesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function Home(CategoriesRepository $categoriesRepo): Response
    {

        $categories = $categoriesRepo->findAll();

        return $this->render('home/index.html.twig', [
            "categories" => $categories,
        ]);
    }
}
