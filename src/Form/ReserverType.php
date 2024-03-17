<?php

namespace App\Form;


use App\Entity\Reserver;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Validator\Constraints\GreaterThanOrEqual;

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
            ->add('NombresDeLocataires', NumberType::class, [
                'constraints' => [
                    new GreaterThanOrEqual([
                        'value' => 1,
                        'message' => 'Le nombre de locataires doit être supérieur ou égal à 1.',
                    ]),
                ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Reserver::class,
        ]);
    }
}
