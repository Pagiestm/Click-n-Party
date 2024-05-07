<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use App\Entity\Contact;
use App\Form\ContactType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;

class ContactController extends AbstractController
{
    #[Route('/contact', name: 'app_contact')]
    public function contact(Request $request, EntityManagerInterface $em, MailerInterface $mailer): Response
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

            $email = (new Email())
                ->from('gunride56.discord@gmail.com') // Utilise une adresse e-mail vérifiée ici
                ->replyTo($contact->getEmail()) // Utilise l'adresse e-mail de l'utilisateur comme adresse "Reply-To"
                ->to('gunride56.discord@gmail.com')
                ->subject($contact->getSujet())
                ->html($this->renderView('contact/email.html.twig', ['contact' => $contact]));

            $mailer->send($email);

            $this->addFlash('success', 'Votre message a été envoyé avec succès');

            return $this->redirectToRoute('app_contact');
        }

        return $this->render('contact/index.html.twig', [
            'contactForm' => $contactForm->createView(),
        ]);
    }
}
