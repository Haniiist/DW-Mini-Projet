# Remarques sur la conception et éléments à modifier

abonnement -> carte de fidelité
dimension plateau -> type
1 seul type de fromage, charcuterie, vin, pain -> dans la table commande, pas seulement plateau mais aussi code du produit qui
compose le plateau.
Une ligne pour chaque produit constituant un platau qui est commandé.
Tous les achats font partie d'une même transaction

On supprime les plateaux, + une vision produit.
Ajouter un ID des commandes (important) 
Ajouter produit 

Du moment ou on a la transaction, on a plus de problème
Un acheteur peut commander plusieurs plateaux

Un client peut avoir plusieurs allergies (gérer plusieurs allergies)
utiliser les tables ponts (relations n à m)

Livreur -> enlever la composante de livraison
Stock -> enlever la composante stock

Regarder la question 7b -> donner une instance du modèle pour voir ce qui fonctionne/ne fonctionne pas concrètement.

Réflechir à ce qu'on veut extraire à partir de nos données

