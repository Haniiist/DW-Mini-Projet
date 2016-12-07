#Général

##Identifying the business processes (Actions/opérations) 
Nous fixons définitivement les business processes aux deux suivants : 
- Commandes/ventes (Datamart1): Comprendre quels produits sont commandés durant quelles périodes dans quelles régions sous quelles conditions de tarification (promotions/remises).

- Stocks/inventaire (Datamart2): Retracer l'état des stocks à travers le temps (Produits présents dans l(es)'entrepôt(s) à une date donnée).

##Déclaration de la granularité du modèle (Modifiée)
-Datamart1:
Une ligne créee / produit commandé ( Within a set of orders / Parmis un ensemble de produits commandés -> Plateau) 
-   Justification : analytical strategies may requiere a detailed slicing operations(of the cube).

                    La flexibilité analytique : Les démarches analytiques requièrent des coupes détaillées du cube.

-Datamart2 : 
Periodical (Daily/weekly/monthly ?) snapshots of products present in the warehouse.

##Vues et dimensions partagées : 
Le fait de référencer la même table passe par la création de vues indépendantes (Avec des nom de colonnes uniques)...On appelle ça Role-playing.
#Vente Business Process/ DATAMART 1 : 

##Table de faits Vente et mesures :
- Attributs : 

    - Clé table plateau (Degenerative Dimension key)
    - Clé primaire :  
    
        - Combinaison (Clé table plateau, Clé produit)

- Mesures : 
    - Prix de vente (Additive).
    - coût réel (Additive).
    - bénéfice net (Additive).
    - Pourcentage de bénéfice (Nominateur et dénominateur stockés séparement) (Nonadditive).
    
##Dimensions : (Détaillées afin de permettre les drill-up)
- Client
- Produit
- Date
- Remise (Inclure un tuple unique "Pas de promotion")

##Traitements: 
Quelques idées de traitements pour la nouvelle dimension (: Remise/promotion) seraient :  

- Efficacité des remises : 

	- les bénéfices hébdomadaires de la charcuterie faits auprès des clients de Montpellier, avec la remise Fin_d'année, durant le mois de Décembre 2015.(A comparer avec les résultats d'une requête visant une période ne proposant pas de remise).
	- Les ventes d'un produit ont-ils significativement baissé juste après la fin d'une promotion donnée.
	- Les produit en promotion quelconque qui ne se sont pas mieux vendus en région parisienne, durant le mois de Mai 2016.




##Allergies/Tables ponts: 

Partie 3."Use a bridge table to link the 2 dimensions"--->https://dwbi1.wordpress.com/2011/03/13/dimensions-with-multi-valued-attributes/
- Backup solution : Si jamais on ne réussit pas à implémenter les bridge tables, on devra limiter le nombre d'allergies possibles et prévoir par exemple 3 champs d'allergies

#Stocks Business Process/ DATAMART 2 : 

##Table de faits Stocks et mesures :
- Attributs : 

    - Clé primaire :  
    
        - Combinaison des clés de toutes les dimensions.

- Mesures : 
    - Quantité (semi-additive).
    - Capacité restante (semi-additive).
    
##Dimensions : (Détaillées afin de permettre les drill-up)

- Produit
- Date
- Entrepôt 

##Traitements: 
Quelques idées de traitements seraient :  

- Quelle est la quantitée de produit x dans l'entrepot y, tel mois. 
- Quels sont les mois ou le stock de la catégorie fromage s'épuise.

	