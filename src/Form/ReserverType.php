<?php

namespace App\Form;


use App\Entity\Reserver;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ReserverType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('Date_debut', DateType::class, [
                'widget' => 'single_text',
            ])
            ->add('Date_fin', DateType::class, [
                'widget' => 'single_text',
            ])
            ->add('Statut')
            ->add('NombresDeLocataires')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Reserver::class,
        ]);
    }
}
