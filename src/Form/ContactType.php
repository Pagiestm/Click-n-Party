<?php

namespace App\Form;

use App\Entity\Contact;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Karser\Recaptcha3Bundle\Form\Recaptcha3Type;
use Karser\Recaptcha3Bundle\Validator\Constraints\Recaptcha3;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
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
            ->add('email', EmailType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new Email(['message' => 'Veuillez entrer une adresse email valide.']),
                    new NotBlank(['message' => 'Veuillez entrer une adresse email.']),
                    new Length(['max' => 60, 'maxMessage' => 'Votre email ne doit pas dépasser {{ limit }} caractères.']),
                ],
            ])
            ->add('Sujet', TextType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer un sujet.']),
                ],
            ])
            ->add('Message', TextareaType::class, [
                'attr' => ['class' => 'form-input block w-full'],
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer un message.']),
                    new Length(['max' => 500, 'maxMessage' => 'Votre message ne doit pas dépasser {{ limit }} caractères.']),
                ],
            ])
            ->add('captcha', Recaptcha3Type::class, [
                'constraints' => new Recaptcha3(),
                'action_name' => 'contact',
            ]);;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Contact::class,
        ]);
    }
}
