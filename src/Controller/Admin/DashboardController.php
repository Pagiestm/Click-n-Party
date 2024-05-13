<?php

namespace App\Controller\Admin;

use App\Entity\Categories;
use App\Entity\Contact;
use App\Entity\Locations;
use App\Entity\Utilisateurs;
use App\Entity\Reserver;
use App\Repository\ReserverRepository;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use App\Repository\LocationsRepository;


class DashboardController extends AbstractDashboardController
{

    private $reserverRepository;
    private $locationsRepository;

    public function __construct(ReserverRepository $reserverRepository, LocationsRepository $locationsRepository)
    {
        $this->reserverRepository = $reserverRepository;
        $this->locationsRepository = $locationsRepository;
    }

    #[Route('/admin', name: 'admin')]
    #[IsGranted('ROLE_ADMIN', statusCode: 404, message: 'Post not found')]
    public function index(): Response
    {
        $reservationsThisYear = $this->reserverRepository->findReservationsThisYear();

        $counts = [];
        $dates = [];
        foreach ($reservationsThisYear as $reservation) {
            $month = $reservation['date']->format('Y-m');
            if (!isset($counts[$month])) {
                $counts[$month] = 0;
                $dates[] = $month;
            }
            $counts[$month] += 1;
        }

        $counts = array_values($counts);

        $locationsThisYear = $this->locationsRepository->findLocationsThisYear();

        $locationsCounts = [];
        foreach ($locationsThisYear as $location) {
            $month = $location['date']->format('Y-m');
            if (!isset($locationsCounts[$month])) {
                $locationsCounts[$month] = 0;
            }
            $locationsCounts[$month] += 1;
        }

        ksort($locationsCounts);

        $locationsDates = array_keys($locationsCounts);
        $locationsCounts = array_values($locationsCounts);

        return $this->render('admin/dashboard.html.twig', [
            'counts' => $counts,
            'dates' => $dates,
            'locationsDates' => $locationsDates,
            'locationsCounts' => $locationsCounts,
        ]);
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Click N Party - Administration')
            ->renderContentMaximized();
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToRoute('Accueil', 'fa fa-home', 'app_home');
        yield MenuItem::linkToDashboard('Statistiques', 'fas fa-chart-bar');
        yield MenuItem::linkToCrud('Utilisateurs', 'fas fa-user', Utilisateurs::class);
        yield MenuItem::linkToCrud('Contact', 'fas fa-envelope', Contact::class);
        yield MenuItem::subMenu('Gestion du site', 'fa fa-cogs')->setSubItems([
            MenuItem::linkToCrud('Catégories', 'fas fa-list', Categories::class),
            MenuItem::linkToCrud('Réservations', 'fa fa-ticket', Reserver::class),
            MenuItem::linkToCrud('Locations', 'fas fa-hotel', Locations::class),
        ]);
        yield MenuItem::linkToLogout('Déconnexion', 'fas fa-sign-out');
    }
}
