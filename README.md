ContainerOrchestrator est un projet qui consiste à créer un environnement de développement local en utilisant Docker et Docker Compose pour orchestrer plusieurs services conteneurisés. L'objectif principal est de configurer et de gérer plusieurs conteneurs qui interagissent entre eux pour former un environnement de développement complet et isolé.
Voici quelques caractéristiques clés de ContainerOrchestrator :


Docker et Docker Compose : Utilisation de Docker pour conteneuriser les applications et de Docker Compose pour définir et gérer les services multi-conteneurs.


Services Multi-conteneurs : Configuration de plusieurs conteneurs pour différents services tels que le serveur web, la base de données, et d'autres outils nécessaires au développement.


Isolation des Environnements : Chaque service s'exécute dans son propre conteneur, ce qui permet d'isoler les environnements et de gérer les dépendances de manière efficace.


Configuration et Déploiement : Définition des configurations nécessaires pour chaque service dans des fichiers Dockerfile et docker-compose.yml, facilitant ainsi le déploiement et la gestion des services.


Réseau et Volumes : Configuration des réseaux Docker pour permettre la communication entre les conteneurs et utilisation des volumes pour la persistance des données.


Automatisation : Automatisation du processus de configuration et de démarrage des services, rendant l'environnement de développement facile à reproduire et à partager.


Ce projet est une excellente introduction à l'orchestration de conteneurs et offre une compréhension pratique de la gestion des environnements de développement avec Docker et Docker Compose.

exemple de .env fonctionnel:

DOMAIN_NAME=user.42.fr

MYSQL_USER=user

MYSQL_PASSWORD=kekeforce

MYSQL_DATABASE=wordpress

MYSQL_ROOT_PASSWORD=kakiforce

ADMIN_USER=superuser

ADMIN_PASSWORD=lelaisserpasser

ADMIN_MAIL=superuser@mail.com

MYSQL_HOST=mariadb

NORMAL_USER=jean

NORMAL_PASSWORD=1234

NORMAL_MAIL=jean@example.com
