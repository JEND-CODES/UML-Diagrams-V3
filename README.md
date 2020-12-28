# Elaboration d'une base de données pour une application de livraisons de plats à domicile

- Introduction : Rappel sur les attendus
- Plan de présentation : Explications CAS / SEQUENCES / CLASSES / MODELES / BDD SQL
- Objectifs : donner une vision globale du projet / on parle d'une représentation graphique macroscopique d'un "domaine" pour communiquer avec un client sur le bon fonctionnement d'une application future.
- Importance : Modéliser, c’est décrire de manière visuelle et graphique les besoins et, les solutions fonctionnelles et techniques de votre projet logiciel. Un logiciel qui a été réalisé sans analyse et sans conception (étapes où l’on modélise le futur logiciel) risque lui aussi de ne pas répondre aux besoins, de comporter des anomalies et d’être très difficile à maintenir. / Les diagrammes UML nous permettent d’illustrer ce que nous comprenons des besoins des utilisateurs. Il s'agit ensuite de s’assurer que la modélisation des besoins est bien conforme aux besoins réels des utilisateurs.
- UML signifie Unified Modeling Language (langage unifié de modélisation). C'est un standard de notation que l'on peut utiliser pour modéliser ou représenter de manière visuelle une application informatique. 

## Cas d'utilisation : Ajout d'un plat du jour

- Définition : Les diagrammes de cas d'utilisation (DCU) sont des diagrammes UML utilisés pour comprendre le fonctionnement global d'une application, modéliser les interactions entre des acteurs et des systèmes. Les diagrammes de cas d’utilisation permettent de représenter visuellement les objectifs des utilisateurs. Ils montrent les relations entre les acteurs et les cas d’utilisation, entre acteurs et acteurs, et enfin entre différents cas d’utilisation.
- Les acteurs : l’acteur principal et les acteurs secondaires - Le système est utilisé par des acteurs principaux, et parfois, il peut être lié à des acteurs secondaires. Les acteurs secondaires échangent des informations avec le système, mais ne déclenchent aucune des fonctionnalités.
- Modèle de labels « include » ou « extend » / On appelle ça des « relations stéréotypées » / Une relation « include » est utilisée pour indiquer que le cas d’utilisation source (départ de la flèche) contient TOUJOURS le cas d’utilisation inclus. Une relation « include » permet d’indiquer qu’un cas d’utilisation a toujours besoin du cas d’utilisation lié. / Une relation « extend » est ici utilisée pour indiquer que le cas d’utilisation source (à l’origine de la flèche) est nécessaire au cas d’utilisation principal. Une relation « extend » c’est une relation qui est soumise à une condition. Le cas d’utilisation initial n’utilisera les actions du cas d’utilisation lié que dans certaines circonstances. On doit toujours expliciter la condition qui doit être rencontrée pour que le cas d’utilisation lié soit utile.
- Explication sur les conditions : le manager ne peut ajouter un plat uniquement si il est au préalable authentifié : c’est pourquoi nous mentionnons que l’action de « Lister les plats » inclut -> « include » l’authentification – et cette même authentification « extends », est la conséquence d’une inscription préalable

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Diagramme_Ajout_Plat_Jour_V4.png)

## Cas d'utilisation : Création de commande

- Expliquer le choix du moyen de paiement : le rôle des acteurs secondaires (Bank, Restaurant, Système de géolocalisation) qui conditionnent les actions du Client

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Diagramme_Cr%C3%A9ation_Commande_V4.png)

## Cas d'utilisation : Livraison d'une commande

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Diagramme_Livraison_Commande_V5.png)

## Séquence : Ajout Plat du Jour

- Définition : Les diagrammes de séquences sont la représentation graphique des interactions entre les acteurs et le système selon un ordre chronologique (dans la formulation Unified Modeling Language).

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/S%C3%A9quence_Ajout_Plat_du_jour_V2.png)

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

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Diagramme_de_Classes_V9.png)

## Modèle de données

- Définition : Le modèle de données fournit la représentation finale de la base de données - Il précise ce qui va être créé dans la base de données ainsi que les types de champs créés pour chaque table.
- Modèle relationnel - La classe d'association choisie : une association un à plusieurs (one-to-many) 
- Indications des clés primaires PK, et des clés secondaires FK / La clé primaire (PK) sert d'identifiant aux données enregistrées / La valeur de la clé étrangère est la valeur d'une clé primaire liée d'une table à une autre. 
- Indications des types de champs et des valeurs pour chaque table (INT, VARCHAR, DATETIME, TIME, DECIMAL)
- NULL, NOT NULL : Si la colonne n'est pas nullable, elle est notée NOT NULL dans le MPD - Si la colonne accepte les NULL, on dit qu'elle est nullable. 
- Les nombres décimaux :  DECIMAL(p,s) : p (precision) : le nombre total de chiffres dans le nombre, s (scale) : le nombre de chiffres après la virgule
- DECIMAL (4,2) utilisé pour stocker les prix des plats et des desserts. Cela signifie que le chiffre total sera de 4 caractères max et que deux chiffres max seront après la virgule décimale.
- INT(11) peut stocker des valeurs négatives (si on n'a pas indiqué UNSIGNED) : les valeurs peuvent varier de -2 147 483 647 à 2 147 483 647 
- TIME stocke l'heure sans la date / DATETIME stocke à la fois la date et l'heure

- On peut effectuer le calcul du temps restant pour la livraison de commande : à partir de l'heure de prise en charge par le livreur (deliverer_start) et la date de la commande majorée de 30 minutes (on fait une soustraction pour obtenir le temps restant)


![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Mod%C3%A8le_de_Donn%C3%A9es_V7.png)

## Concepteur SQL

- Environnement de développement : SQL / phpMyAdmin (exemples de créations de tables, de colonnes, de valeurs, de clés..)
- Expliquer les choix des types de données pour chaque colonne (Nombre, Texte, Date, Temps, Prix..)
- Colonne ID PK 11 en « auto incrément » : Le principe de l'auto incrément d'une colonne est d'affecter une valeur numérique incrémentée (généralement de 1) à chaque nouvel ajout de ligne dans la table.
- Expliquer les relations des clés étrangères. L'impossibilité de modifier une table liée par une clé étrangère (sauf en mentionnant une autorisation spécifique)

![RESTO](https://raw.githubusercontent.com/JEND-CODES/UML-Diagrams-V3/master/Concepteur_phpMyAdmin_BDD_V5.JPG)

## Base de données avec jeu de données

- Parcourir quelques jeux de données pour voir apparaître les relations entre les tables, la récupération de données par exemple à l'aide des clés étrangères.

Consultable ici : https://github.com/JEND-CODES/UML-Diagrams-V3/blob/master/restaurant_v7.sql



