<?php

namespace App\Repository;

use App\Entity\Reserver;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Reserver>
 *
 * @method Reserver|null find($id, $lockMode = null, $lockVersion = null)
 * @method Reserver|null findOneBy(array $criteria, array $orderBy = null)
 * @method Reserver[]    findAll()
 * @method Reserver[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReserverRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Reserver::class);
    }

    public function findReservationsThisYear(): array
    {
        $startOfYear = (new \DateTime())->setDate(date('Y'), 1, 1);
        $endOfYear = (new \DateTime())->setDate(date('Y'), 12, 31);

        $qb = $this->createQueryBuilder('r')
            ->select('r.Date_debut as date')
            ->addSelect('r.id as reservationId')
            ->where('r.Date_debut >= :start')
            ->andWhere('r.Date_debut <= :end')
            ->setParameter('start', $startOfYear)
            ->setParameter('end', $endOfYear)
            ->orderBy('r.Date_debut', 'ASC')
            ->getQuery();

        return $qb->getArrayResult();
    }

    //    /**
    //     * @return Reserver[] Returns an array of Reserver objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('r.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Reserver
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
