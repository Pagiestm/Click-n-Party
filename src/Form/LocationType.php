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
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Count;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Validator\Constraints\GreaterThan;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\Range;

class LocationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('Nom', null, [
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer un nom.']),
                    new Length([
                        'max' => 50,
                        'maxMessage' => 'Le nom ne peut pas dépasser {{ limit }} caractères.',
                    ]),
                ],
            ])
            ->add('Description', null, [
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer une description.']),
                ],
            ])
            ->add('Prix',  NumberType::class, [
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer un prix.']),
                    new Range([
                        'min' => 0,
                        'max' => 100000,
                        'notInRangeMessage' => 'Le prix doit être entre {{ min }} et {{ max }} euros.',
                    ]),
                ],
            ])
            ->add('Adresse', null, [
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer une adresse.']),
                    new Length([
                        'max' => 255,
                        'maxMessage' => 'Le nom ne peut pas dépasser {{ limit }} caractères.',
                    ]),
                ],
            ])
            ->add('Date_Debut_Disponibilite', DateType::class, [
                'widget' => 'single_text',
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer une date de début de disponibilité.']),
                ],
            ])
            ->add('Date_Fin_Disponibilite', DateType::class, [
                'widget' => 'single_text',
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer une date de fin de disponibilité.']),
                ],
            ])
            ->add('Capacite_maximal', null, [
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez entrer le nombre maximum de personne.']),
                    new GreaterThan(['value' => 0, 'message' => 'La capacité maximal doit être positif.']),
                ],
            ])
            ->add('PMR')
            ->addEventListener(FormEvents::PRE_SET_DATA, function (FormEvent $event) {
                $location = $event->getData();
                $form = $event->getForm();
        
                if ($location && $location->getId() !== null) {
                    $form->add('Actif');
                }
            })
            ->add('Equipements', CollectionType::class, [
                'entry_type' => EquipementType::class,
                'allow_add' => true,
                'allow_delete' => true,
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
                'required' => false,
            ])
            ->addEventListener(FormEvents::PRE_SET_DATA, function (FormEvent $event) {
                // Récupèration de la location
                $location = $event->getData();
                // Récupèration du formulaire
                $form = $event->getForm();

                $imagesField = $form->get('Images');
                 // Récupère la config du champ Images
                $config = $imagesField->getConfig();
                $options = $config->getOptions();

                 // Compte les images existantes
                $existingImagesCount = count($location->getImages());
                // Calcule les images requises
                $requiredImagesCount = max(0, 5 - $existingImagesCount);

                $options['constraints'] = [
                    new Count([
                        'min' => $requiredImagesCount,
                        'max' => 10,
                        'minMessage' => 'Veuillez télécharger au moins ' . $requiredImagesCount . ' images.',
                        'maxMessage' => 'Vous ne pouvez pas télécharger plus de {{ limit }} images.',
                    ]),
                ];

                $form->add('Images', FileType::class, $options);
            })
            ->add('Categories', EntityType::class, [
                'class' => Categories::class,
                'choice_label' => 'libelle',
                'multiple' => true,
                'constraints' => [
                    new NotBlank(['message' => 'Veuillez sélectionner une catégorie.']),
                    new Count([
                        'max' => 2,
                        'maxMessage' => 'Vous ne pouvez pas sélectionner plus de {{ limit }} catégories.',
                    ]),
                ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Locations::class,
        ]);
    }
}
