<?php

namespace App\Form;


use App\Entity\Reserver;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class ReserverType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('Date_debut', DateType::class, [
                'widget' => 'single_text',
                'label' => false,
            ])
            ->add('Date_fin', DateType::class, [
                'widget' => 'single_text',
                'label' => false,
            ])
            ->add('NombresDeLocataires', ChoiceType::class, [
                'choices' => ['Nombres de locataires' => ''] + array_combine(range(1, $options['max_capacity']), range(1, $options['max_capacity'])),
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Reserver::class,
            'max_capacity' => null,
        ]);
    }
}
