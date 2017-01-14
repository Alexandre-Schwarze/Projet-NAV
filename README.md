# Projet-NAV

**Projet Nav** est un projet d'étude réalisé dans le cadre d'une formation supérieure en informatique.
Il s'agit d'une application web/mobile de géolocalisation avec placement de POI et de suivi d'un trajet.

Elle permet de géolocaliser la position de l'utilisateur sur une carte type Google Map, de l'informer des alertes placées par les autres utilisateurs, de programmer un trajet et de placer des alertes de circulation sur son trajet

### Dépendances ###

Projet-Nav est écrit en HTML5 et CSS3, les traitements côté client en Javascript avec les libraires Jquery et JqueryMobile, et les traitements côté serveur en PHP avec des procédures stockées dans une base MySQL.
Elle fait également appel au web-service de Google : l'API Google Map.

### Comment ça marche ###

Comme toute application web, Projet-Nav s'éxécute dans un navigateur web supportant HTML5. Sa page principale utilise la librairie Jquery Mobile pour adapter ses éléments HTML à l'affichage mobile. Elle est donc totalement responsive. L'application utilise la librairie Jquery pour configurer le comportements des élements HTML.
L'application effectue des appels AJAX pour requêter l'API Google MAP et le serveur de base de données pour ses fonctionnalités :

### Fonctionnalités ###
- Authentification
- Création de compte utilisateur
- Affichage de la Google Map
- Affichage des alertes
- Paramétrage des types d'alertes à afficher


### Non encore implémenté ###

- Historique pour chaque utilisateur
- Indice de confiance pour chaque utilisateur
- Google Speech pour suivi de trajet en mode vocal
- Message de proximité d'une alerte
