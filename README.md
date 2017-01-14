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

### Hermetica ###

The diagnostic queries are stored in XML files, inside the `CorpusHermeticum` folder. To add your own query, simply copy an existing xml file and edit it. You need to specify :

- The `name` of the hermeticus.
- The `level` : it can be `Server` or `Database`. A Database-level query will be run against all selected databases of your server and produce one result per database. When you write a Database level query, assume it will be run in the context of each database.
- the `folder`. It is the name of the folder in which the result will appear in the Sql Trismegiste tree view. The folder name must exist in the `Folders.xml` file, inside the `CorpusHermeticum` folder. You can add new folders in this file.

Then, you can write multiple versions of your query, for different versions (MajorVersion) of SQL Server. Sql Trismegiste will choose the query accordingly. It will execute the query defined for the version of SQL server it is connected to, or the closest previous version, or the query marked as `*` for any version. You can write only one query and mark it as `*` if your query is not version-specific.

### Not yet implemented ###

- `Save Sql Text` and `Save Query Plans` is almost done. It can save query plans and sql texts when you check it and Sql Trismegiste sees `plan_handle` or `sql_handle` columns.
