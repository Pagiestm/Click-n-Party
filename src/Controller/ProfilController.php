<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use App\Form\UtilisateurType;
use Doctrine\ORM\EntityManagerInterface;

class ProfilController extends AbstractController
{
    #[Route('/profil', name: 'app_profil')]
    public function profil(): Response
    {
        $user = $this->getUser();
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        return $this->render('profil/index.html.twig', [
            'user' => $user,
        ]);
    }

    #[Route('/profil/edit', name: 'app_profil_edit')]
    public function edit(Request $request, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        //Création du formulaire
        $userForm = $this->createForm(UtilisateurType::class, $user);
        // Traitement de la requête du formulaire
        $userForm->handleRequest($request);

        // Vérification de la soumission et de la validité du formulaire
        if ($userForm->isSubmitted() && $userForm->isValid()) {
            $em->persist($user);
            $em->flush();

            return $this->redirectToRoute('app_profil');
        }

        return $this->render('profil/edit.html.twig', [
            'user' => $user,
            'form' => $userForm->createView(),
        ]);
    }
}
