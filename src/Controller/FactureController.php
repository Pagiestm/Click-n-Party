<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class FactureController extends AbstractController
{
    #[Route('/user/invoices', name: 'user_invoices')]
    public function getUserInvoices()
    {
        // Récupérez l'utilisateur connecté
        $user = $this->getUser();
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        // Définissez le chemin du répertoire où vous stockez les factures
        $directory = $this->getParameter('kernel.project_dir') . '/public/facture';

        // Récupérez tous les fichiers de facture pour l'utilisateur connecté
        $files = glob($directory . '/facture_' . $user->getId() . '_*.pdf');

        // Récupérez uniquement les noms de fichier
        $filenames = array_map('basename', $files);

        // Renvoyez les noms de fichier à la vue
        return $this->render('facture/index.html.twig', [
            'invoices' => $filenames,
        ]);
    }
}
