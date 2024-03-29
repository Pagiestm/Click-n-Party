<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Contact;
use App\Form\ContactType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;

class ContactController extends AbstractController
{
    #[Route('/contact', name: 'app_contact')]
    public function contact(Request $request, EntityManagerInterface $em): Response
    {

        $contact = new Contact();

        if ($this->getUser()) {
            $contact->setPrenom($this->getUser()->getPrenom());
            $contact->setNom($this->getUser()->getNom());
            $contact->setEmail($this->getUser()->getEmail());
        }

        $contactForm = $this->createForm(ContactType::class, $contact);

        $contactForm->handleRequest($request);
        if ($contactForm->isSubmitted() && $contactForm->isValid()) {

            $contact = $contactForm->getData();

            $em->persist($contact);
            $em->flush();

            $this->addFlash('success', 'Votre message a été envoyé avec succès');

            return $this->redirectToRoute('app_contact');
        }

        return $this->render('contact/index.html.twig', [
            'contactForm' => $contactForm->createView(),
        ]);
    }
}
