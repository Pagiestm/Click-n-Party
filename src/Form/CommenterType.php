<?php

namespace App\Form;

use App\Entity\Commenter;
use App\Entity\Locations;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class CommenterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('Avis', TextType::class, [
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer un avis.']),
                    new Length(['max' => 255, 'maxMessage' => 'Votre avis ne doit pas dépasser {{ limit }} caractères.']),
                ],
            ])
            ->add('Note_Loueur', ChoiceType::class, [
                'choices' => array_combine(range(0, 5), range(0, 5)),
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Commenter::class,
        ]);
    }
}
