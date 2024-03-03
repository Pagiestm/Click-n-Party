<?php

namespace App\Form;

use App\Entity\Categories;
use App\Entity\Locations;
use App\Entity\Utilisateurs;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class LocationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('Nom')
            ->add('Description')
            ->add('Image')
            ->add('Prix')
            ->add('Adresse')
            ->add('Date_Debut_Disponibilite')
            ->add('Date_Fin_Disponibilite')
            ->add('Capacite_maximal')
            ->add('PMR')
            ->add('Actif')
            ->add('Utilisateurs', EntityType::class, [
                'class' => Utilisateurs::class,
                'choice_label' => 'id',
            ])
            ->add('Appartenir', EntityType::class, [
                'class' => Categories::class,
                'choice_label' => 'id',
                'multiple' => true,
            ])
            ->add('Categories', EntityType::class, [
                'class' => Categories::class,
                'choice_label' => 'id',
                'multiple' => true,
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Locations::class,
        ]);
    }
}
