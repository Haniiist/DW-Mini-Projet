##Identifying the business process (Actions/opérations) 
Nous fixons définitivement les business process aux deux suivants : 
- Commandes/ventes (Datamart1): Comprendre quels produits sont commandés durant quelles périodes dans quelles régions sous quelles conditions de tarification (promotions/remises).

- Stocks/inventaire (Datamart2): Retracer l'état des stocks à travers le temps (Produits présents dans l(es)'entrepôt(s) à une date donnée).

##Déclaration de la granularité du modèle (Modifiée)
-Datamart1:
Une ligne crée / produit commandé ( Within a set of orders / Parmis un ensemble de produits commandés -> Plateau) 
-   Justification : analytical strategies may requiere a detailed slicing operations(of the cube).

                    La flexibilité analytique : Les démarches analytiques requièrent des coupes détaillées du cube.

-Datamart2 : 
Periodical (Daily/monthly ?) snapshots of products present in the warehouse.

##Table de faits Vente et mesures :
- Attributs : 

    - Clé table plateau (Degenerative Dimension key)
    - Clé primaire :  
    
        - Combinaison (Clé table plateau, Code produit)

- Mesures : 
    - Prix de vente.
    - coût réel.
    - bénéfice net.
    - Pourcentage de bénéfice (Nominateur et dénominateur stockés séparement)
    
##Dimensions : (Détaillées afin de permettre les drill-up)
- Client
- Produit
- Date
- Remise

##Allergies/Tables ponts: 

Ce que je comprend pour l'instant : 

Les bridge tables servent à gérer les versioning des valeurs qui changent régulièrement.

- Backup solution : Si jamais on ne réussit pas à implémenter les bridge point, on devra limiter le nombre d'allergies possibles et prévoir par exemple 3 champs d'allergies
