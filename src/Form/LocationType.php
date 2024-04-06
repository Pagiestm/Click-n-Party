<?php

namespace App\Form;

use App\Entity\Categories;
use App\Entity\Locations;
use App\Form\EquipementType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;

class LocationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('Nom')
            ->add('Description')
            ->add('Prix')
            ->add('Adresse')
            ->add('Date_Debut_Disponibilite')
            ->add('Date_Fin_Disponibilite')
            ->add('Capacite_maximal')
            ->add('PMR')
            ->add('Actif')
            ->add('Equipements', CollectionType::class, [
                'entry_type' => EquipementType::class,
                'allow_add' => true,
                'by_reference' => false,
                'label' => false,
                'entry_options' => [
                    'label' => false,
                ],
                'prototype' => true,
                'prototype_name' => '__name__',
            ])
            ->add('Images', FileType::class, [
                'label' => false,
                'multiple' => true,
                'mapped' => false,
                'required' => false
            ])
            ->add('Categories', EntityType::class, [
                'class' => Categories::class,
                'choice_label' => 'id',
                'multiple' => true,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Locations::class,
        ]);
    }
}
