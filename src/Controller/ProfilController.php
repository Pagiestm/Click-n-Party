<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Form\UtilisateurType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use App\Form\UtilisateursPasswordType;

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

                $this->addFlash('success', 'Votre profil a été modifié avec succès.');

                return $this->redirectToRoute('app_profil');
        }

        return $this->render('profil/edit.html.twig', [
            'user' => $user,
            'form' => $userForm->createView(),
        ]);
    }

    #[Route('/profil/edition-mot-de-passe', 'app_edit_password', methods: ['GET', 'POST'])]
    public function editPassword(
        Request $request,
        EntityManagerInterface $manager,
        UserPasswordHasherInterface $hasher
    ): Response {

        // $user est une instance de Utilisateurs
        /** @var \App\Entity\Utilisateurs $user */
        $user = $this->getUser();

        $form = $this->createForm(UtilisateursPasswordType::class);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($hasher->isPasswordValid($user, $form->getData()['password'])) {
                $user->setPassword(
                    $hasher->hashPassword($user, $form->getData()['newPassword'])
                );

                $manager->persist($user);
                $manager->flush();

                $this->addFlash('success', 'Votre mot de passe a été modifié avec succès.');

                return $this->redirectToRoute('app_profil');
            } else {
                $this->addFlash(
                    'warning',
                    'Le mot de passe renseigné est incorrect.'
                );
            }
        }

        return $this->render('profil/edit_password.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
