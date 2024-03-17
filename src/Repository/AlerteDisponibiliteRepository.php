<?php

namespace App\Repository;

use App\Entity\AlerteDisponibilite;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<AlerteDisponibilite>
 *
 * @method AlerteDisponibilite|null find($id, $lockMode = null, $lockVersion = null)
 * @method AlerteDisponibilite|null findOneBy(array $criteria, array $orderBy = null)
 * @method AlerteDisponibilite[]    findAll()
 * @method AlerteDisponibilite[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AlerteDisponibiliteRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AlerteDisponibilite::class);
    }

//    /**
//     * @return AlerteDisponibilite[] Returns an array of AlerteDisponibilite objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('a')
//            ->andWhere('a.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('a.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?AlerteDisponibilite
//    {
//        return $this->createQueryBuilder('a')
//            ->andWhere('a.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
