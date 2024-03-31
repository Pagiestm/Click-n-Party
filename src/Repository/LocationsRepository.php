<?php

namespace App\Repository;

use App\Entity\Locations;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Locations>
 *
 * @method Locations|null find($id, $lockMode = null, $lockVersion = null)
 * @method Locations|null findOneBy(array $criteria, array $orderBy = null)
 * @method Locations[]    findAll()
 * @method Locations[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LocationsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Locations::class);
    }

    public function search($location, $startDate, $endDate, $partySize)
    {
        $query = $this->createQueryBuilder('l');

        if ($location) {
            $query->andWhere('l.Adresse LIKE :location')
                ->setParameter('location', "%$location%");
        }

        if ($startDate) {
            $query->andWhere('l.Date_Debut_Disponibilite <= :startDate')
                ->setParameter('startDate', new \DateTime($startDate));
        }

        if ($endDate) {
            $query->andWhere('l.Date_Fin_Disponibilite >= :endDate')
                ->setParameter('endDate', new \DateTime($endDate));
        }

        if ($partySize) {
            $query->andWhere('l.Capacite_maximal >= :partySize')
                ->setParameter('partySize', $partySize);
        }

        return $query->getQuery()->getResult();
    }

    //    /**
    //     * @return Locations[] Returns an array of Locations objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('l')
    //            ->andWhere('l.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('l.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Locations
    //    {
    //        return $this->createQueryBuilder('l')
    //            ->andWhere('l.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
