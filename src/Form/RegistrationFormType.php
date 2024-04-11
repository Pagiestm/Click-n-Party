<?php

namespace App\Form;

use App\Entity\Utilisateurs;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Karser\Recaptcha3Bundle\Form\Recaptcha3Type;
use Karser\Recaptcha3Bundle\Validator\Constraints\Recaptcha3;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Validator\Constraints\Regex;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new Email(['message' => 'Veuillez entrer une adresse email valide.']),
                    new NotBlank(['message' => 'Veuillez entrer une adresse email.']),
                    new Length(['max' => 60, 'maxMessage' => 'Your email should not exceed {{ limit }} characters.']),
                ],
            ])
            ->add('Nom', TextType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer un nom.']),
                ],
            ])
            ->add('Prenom', TextType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer un prénom.']),
                ],
            ])
            ->add('Adresse', TextType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer une adresse.']),
                ],
            ])
            ->add('Telephone', TelType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer un numéro de téléphone.']),
                    new Regex([
                        'pattern' => '/^\+?[0-9]{10,15}$/',
                        'message' => 'Votre numéro de téléphone doit contenir 10 à 15 chiffres et peut commencer par un +'
                    ]),
                ],
            ])
            ->add('plainPassword', PasswordType::class, [
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'mapped' => false,
                'attr' => ['autocomplete' => 'new-password'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Entrer un mot de passe',
                    ]),
                    new Length([
                        'min' => 12,
                        'minMessage' => 'Votre mot de passe doit comporter au moins {{ limit }} caractères',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                    new Regex([
                        'pattern' => '/^(?=.*[A-Z])(?=.*\d{2,})(?=.*[\W]).+$/',
                        'message' => 'Votre mot de passe doit contenir au moins une majuscule, un symbole et deux chiffres.'
                    ]),
                ],
            ])
            ->add('captcha', Recaptcha3Type::class, [
                'constraints' => new Recaptcha3(),
                'action_name' => 'contact',
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Utilisateurs::class,
        ]);
    }
}
