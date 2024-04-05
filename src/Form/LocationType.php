<?php

namespace App\Form;

use App\Entity\Categories;
use App\Entity\Locations;
use App\Entity\Equipements;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
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
            ->add('Prix')
            ->add('Adresse')
            ->add('Date_Debut_Disponibilite')
            ->add('Date_Fin_Disponibilite')
            ->add('Capacite_maximal')
            ->add('PMR')
            ->add('Actif')
            ->add('Equipements', TextType::class, [
                'required' => false,
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
