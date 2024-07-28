# Installation du projet

## Installation des dépendances

Exécutez les commandes suivantes dans votre terminal pour installer les dépendances nécessaires :

```sh
npm install
```
Cette commande installe toutes les dépendances JavaScript nécessaires spécifiées dans le fichier package.json.

```sh
composer install
```
Cette commande installe toutes les dépendances PHP nécessaires spécifiées dans le fichier composer.json.

## Récupération du fichier .env.local

Contactez Théotime pour obtenir le fichier .env.local.

## Configuration de la base de données : 

1. Ouvrez le fichier .env et assurez-vous que la ligne suivante y est présente : 

```php
DATABASE_URL="mysql://root:@127.0.0.1:3306/click-n-party?serverVersion=8.0.32&charset=utf8mb4"
```
Cette ligne configure la connexion à la base de données MySQL.

2. Ensuite, ouvrez votre terminal et exécutez la commande suivante pour créer la base de données :

```sh
symfony console doctrine:database:create
```
Cette commande crée la base de données spécifiée dans le fichier .env.

3. Importez le fichier dump.sql dans votre système de gestion de base de données (par exemple, PhpMyAdmin). Le fichier dump.sql se trouve dans le dossier dump à la racine du projet.

Vous avez maintenant installé la base de données du projet !

## Lancement du projet en local : 

Pour démarrer le serveur local, ouvrez votre terminal et exécutez la commande suivante :

```sh
symfony server:start
```
Cette commande démarre un serveur web local en utilisant Symfony.

ou 

```sh
php -S 127.0.0.1:8000 -t public
```
Cette commande démarre un serveur web local en utilisant le serveur web intégré de PHP.

Dans un autre terminal, exécutez également cette commande :

```sh
npm run watch
```
Cette commande compile et surveille les fichiers JavaScript et CSS pour les changements, recompilant automatiquement les fichiers au besoin.