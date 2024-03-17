<?php

namespace App\Repository;

use App\Entity\AjouterEnFavoris;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<AjouterEnFavoris>
 *
 * @method AjouterEnFavoris|null find($id, $lockMode = null, $lockVersion = null)
 * @method AjouterEnFavoris|null findOneBy(array $criteria, array $orderBy = null)
 * @method AjouterEnFavoris[]    findAll()
 * @method AjouterEnFavoris[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AjouterEnFavorisRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AjouterEnFavoris::class);
    }

    //    /**
    //     * @return AjouterEnFavoris[] Returns an array of AjouterEnFavoris objects
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

    //    public function findOneBySomeField($value): ?AjouterEnFavoris
    //    {
    //        return $this->createQueryBuilder('a')
    //            ->andWhere('a.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }

    public function findFavoritesByUser($userId)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.Utilisateurs = :val')
            ->setParameter('val', $userId)
            ->getQuery()
            ->getResult();
    }
}
