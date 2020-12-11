# Elaboration d'une base de données pour une application de livraisons de plats à domicile

- Introduction : Rappel sur les attendus
- Plan de présentation : Explications CAS / SEQUENCES / CLASSES / MODELES / BDD SQL
- Objectifs : donner une vision globale du projet
- Importance : Modéliser, c’est décrire de manière visuelle et graphique les besoins et, les solutions fonctionnelles et techniques de votre projet logiciel. Un logiciel qui a été réalisé sans analyse et sans conception (étapes où l’on modélise le futur logiciel) risque lui aussi de ne pas répondre aux besoins, de comporter des anomalies et d’être très difficile à maintenir.

## Cas d'utilisation : Ajout d'un plat du jour

- Définition : Les diagrammes de cas d'utilisation (DCU) sont des diagrammes UML utilisés pour comprendre le fonctionnement global d'une application, modéliser les interactions entre des acteurs et des systèmes.
- Les acteurs : l’acteur principal et les acteurs secondaires
- Modèle de labels « include » ou « extend » / On appelle ça des « relations stéréotypées » 
- Explication sur les conditions : le manager ne peut ajouter un plat qu’à condition où il soit authentifié : c’est pourquoi nous mentionnons que l’action de « Lister les plats » inclut -> « include » l’authentification – et cette même authentification « extends », est la conséquence d’une inscription préalable

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Diagramme_Ajout_Plat_Jour_V4.png)

## Cas d'utilisation : Création de commande

- Expliquer le choix du moyen de paiement - le rôle des acteurs secondaires (Bank / Restaurant) qui conditionnent les actions du Client

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Diagramme_Cr%C3%A9ation_Commande_V4.png)

## Cas d'utilisation : Livraison d'une commande

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Diagramme_Livraison_Commande_V5.png)

## Séquence : Ajout Plat du Jour

- Définition : Les diagrammes de séquences sont la représentation graphique des interactions entre les acteurs et le système selon un ordre chronologique (dans la formulation Unified Modeling Language).

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/S%C3%A9quence_Ajout_Plat_du_jour_V1.png)

## Séquence : Création d'une commande

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Sequence_Cr%C3%A9ation_de_Commande_v2.png)

## Séquence : Livraison de commande

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/S%C3%A9quence_Livraison_de_commande_V2.png)

## Diagramme de Classes

- Définitions : Représente la structure interne d’un logiciel - représente l’organisation des classes de l’application - Ce diagramme propose des modèles relationnels entre les classes et peut ensuite être dérivé pour élaborer la base de données SQL (permet de décrire la structure et les fonctionnalités de la base de données). Une classe décrit le comportement d’une ou plusieurs parties de la base de données.
- Lecture et élaboration du diagramme : Attention à ne pas mélanger le traitement séquentiel et les informations sur le stockage des données - Dans un diagramme de classes on souhaite juste connaître les données qui vont être stockées, pas les modalités de traitements et d'affichages côté Front-End.
- Chaque classe est découpée en 2 partie : la première indique le nom de la classe, la seconde ses attributs
- Attributs: INTEGER pour les entiers relatifs, DATE, TIME, STRING, DECIMAL
- String : pour les chaînes de caractères (texte)
- Propriétés de classes : Le symbole (–) signifie privé, le symbole (+) signifie Public, le symbole (#) signifie Protégé
- Les relations entre les tables en fonction du type d'association : un à plusieurs, plusieurs à plusieurs, 0 à plusieurs…
- Multiplicités utilisées dans les diagrammes de classes : "1 à n", "1 à 0..n"
- Utilisation de liens d'agrégation (ou relation de subordination) : ex: table DISH subordonnée à MANAGER

- Dans la table « order_detail », le title va être une copie du titre du plat et du dessert, c’est fait pour conserver l’historique des plats créés chaque jour.

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Diagramme_de_Classes_V7.png)

## Modèle de données

- Définition : Le modèle de données fournit la représentation finale de la base de données - Il précise ce qui va être créé dans la base de données ainsi que le type de champs créés pour chaque table.
- Indications des clés primaires PK, et des clés secondaires FK
- Indications des types de champs et des valeurs pour chaque table (INT, VARCHAR, DATETIME, TIME, DECIMAL)
- NULL, NOT NULL : Si la colonne n'est pas nullable, elle est notée NOT NULL dans le MPD - Si la colonne accepte les NULL, on dit qu'elle est nullable. 
- Colonne en « auto incrément » : Le principe de l'auto incrément d'une colonne est d'affecter une valeur numérique incrémentée (généralement de 1) à chaque nouvel ajout de ligne dans la table. 
- Les nombres décimaux :  DECIMAL(p,s) : p (precision) : le nombre total de chiffres dans le nombre, s (scale) : le nombre de chiffres après la virgule
- DECIMAL (4,2) utilisé pour stocker les prix des plats et des desserts. Cela signifie que le chiffre total sera de 4 caractères max et que deux chiffres max seront après la virgule décimale.
- INT(11) peut stocker des valeurs négatives (si on n'a pas indiqué UNSIGNED) : les valeurs peuvent varier de -2 147 483 647 à 2 147 483 647 
- TIME stocke l'heure sans la date / DATETIME stocke à la fois la date et l'heure

- On peut effectuer le calcul du temps restant pour la livraison de commande : calcul effectué à partir de l'heure de prise en charge par le livreur (deliverer_start) et la date de la commande majorée de 30 minutes (on fait une soustraction pour obtenir le temps restant)


![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Mod%C3%A8le_de_Donn%C3%A9es_V5.png)

## Concepteur SQL

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Concepteur_phpMyAdmin_BDD_V3.png)

## Base de données avec jeu de données

Consultable ici : https://github.com/JEND-CODES/UML-Diagrams-V3/blob/master/restaurant_v5.sql



