<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Commenter;
use App\Form\CommenterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use App\Repository\LocationsRepository;

class CommenterController extends AbstractController
{
    #[Route('/commenter/{locationId}', name: 'app_commenter')]
    public function commenter(Request $request, EntityManagerInterface $em, LocationsRepository $locationsRepo, int $locationId): Response
    {
        // Récupérer l'utilisateur connecté
        $user = $this->getUser();

        // Vérifier si l'utilisateur est connecté
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        // Récupérer la location
        $location = $locationsRepo->find($locationId);

        // Création d'un nouveau commentaire
        $comment = new Commenter();

        // Définition de l'utilisateur et de la location sur le commentaire
        $comment->setUtilisateurs($user);
        $comment->setLocations($location);

        // Création du formulaire
        $commentForm = $this->createForm(CommenterType::class, $comment);

        // Traitement de la requête du formulaire
        $commentForm->handleRequest($request);

        // Vérification de la soumission et de la validité du formulaire
        if ($commentForm->isSubmitted() && $commentForm->isValid()) {
            // Enregistrement du commentaire dans la base de données
            $em->persist($comment);
            $em->flush();

            // Redirection vers la page de la location
            return $this->redirectToRoute('app_location', ['id' => $location->getId()]);
        }

        return $this->render('commenter/index.html.twig', [
            'commentForm' => $commentForm->createView(),
        ]);
    }
}
