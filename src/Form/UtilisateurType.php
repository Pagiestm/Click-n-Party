<?php

namespace App\Form;

use App\Entity\Utilisateurs;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\Regex;

class UtilisateurType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new Email(['message' => 'Please enter a valid email address.']),
                    new NotBlank(['message' => 'Please enter an email address.']),
                    new Length(['max' => 60, 'maxMessage' => 'Your email should not exceed {{ limit }} characters.']),
                ],
            ])
            ->add('Nom', TextType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new NotBlank(['message' => 'Please enter a name.']),
                ],
            ])
            ->add('Prenom', TextType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new NotBlank(['message' => 'Please enter a first name.']),
                ],
            ])
            ->add('Adresse', TextType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new NotBlank(['message' => 'Please enter an address.']),
                ],
            ])
            ->add('Telephone', TelType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new NotBlank(['message' => 'Please enter a phone number.']),
                    new Regex([
                        'pattern' => '/^\+?[0-9]{10,15}$/',
                        'message' => 'Your phone number should contain 10 to 15 digits, and may start with a +.'
                    ]),
                ],
            ])
            ->add('password', PasswordType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new NotBlank(['message' => 'Please enter a password.']),
                ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Utilisateurs::class,
        ]);
    }
}
