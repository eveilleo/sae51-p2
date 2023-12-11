# SAE51 - Projet 2: Installation d’un ERP/CRM

Eveillé Léo
Saussey Emerick

10/12/2023

## Contexte du Projet

Vous êtes responsable informatique dans l'entreprise XXX. La direction souhaite migrer d'une solution ERP/CRM externalisée vers une solution hébergée en interne, basée sur le progiciel "Dolibarr". Un export des données du prestataire actuel a été récupéré sous la forme de fichiers CSV.

## Cahier des Charges

La direction vous donne le cahier des charges suivants :

1. Faire l'étude de la mise en place d'un Dolibarr fonctionnel sur un serveur dédié hébergé dans l'entreprise.

2. Considérer à la fois l'installation, l'aspect import des données et l'aspect sauvegardes des données.

3. L'objectif final :
    - L'installation doit être automatisée via le script `install.sh`, incluant l'installation de Dolibarr et du SGBD nécessaire.
    - L'import des données exportées depuis l'ancien système sera automatisé via le script `import_csv.sh`.
    - Toute l'installation (Dolibarr + SGBD) sera de préférence "dockerisée" pour s'affranchir de l'OS sous-jacent du serveur.
    - Une sauvegarde des données sur une machine distante sera mise en place via un "crontab", de façon hebdomadaire (typiquement dans la soirée du dimanche).

# Points Clés du Projet

## Installation Automatisée

Le script `install.sh` a été développé pour automatiser le processus d'installation de Dolibarr et du SGBD nécessaire sur le serveur dédié. 

## Import Automatisé des Données

Le script `import_csv.sh` a été créé pour automatiser l'importation des données exportées depuis le système ERP/CRM précédent. Ce script fonctionne grâce a un `mysqldump`, qui reprend un dolibarr foctionnel avec les fichiers csv déjà importés.

## Dockerisation

Toute l'installation, y compris Dolibarr et le SGBD, a été "dockerisée".

# Difficultés Rencontrées et Solutions

## Dockerisation de Dolibarr

### Problème et résolution

#### Premier problème:
 L'installation automatique de Dolibarr à l'aide de Docker Compose a posé des difficultés, en utilisant la commande `docker ps ` notre conteneur n'était pas "up". Les tentatives avec Docker Compose n'ont pas abouti comme prévu.

#### Première solution:
Pour résoudre ce problème, il a fallut stopper plusieurs packet comme mariadb, apache2, nginx

###Deuxième problème :
Dolibarr ne voulait pas être sauvegarder, à chaque fois que je lançais http://0.0.0.0:80/admin je devais recommencer le setup de dolibarr.

###Deuxième solution :
Pour résoudre ce problème, il a fallut mettre 2 dump sql dans le script install.sh qui permettait de créer la base de données pour le premier dump et d'ajouter les tables à partir du deuxième dump.







