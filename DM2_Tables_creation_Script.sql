--Suppression des tables si elles existent

DROP TABLE F_stock;
DROP TABLE F_entrepot;
/*

Création de la table de faits F_stock.
Mesures : quantité, capacité restante.
Dimensions : D_prodForStocks, D_dateForStocks, D_entrepot.

*/

CREATE TABLE F_stock
(
	produit_id number,
	entrepot_id number,
	date_id number,
	quantite number,
	capacite_restante number,
	PRIMARY KEY (produit_id,plateau_code);
	CONSTRAINT fkey_produit_id FOREIGN KEY (produit_id) REFERENCES D_prodForStocks(vs_produit_id),
	CONSTRAINT fkey_entrepot_id FOREIGN KEY (entrepot_id) REFERENCES D_entrepot(entrepot_id),
	CONSTRAINT fkey_date_id FOREIGN KEY (date_id) REFERENCES D_dateForStocks(vs_date_id)
);

/*

Création des tables de dimensions D_<Table>.
Table : D_entrepot.

*/

CREATE TABLE D_entrepot
(
	entrepot_id number,
	nom varchar(15),
	region varchar(15),
	adresse varchar(50),
	code_postal varchar(5),
	capacite_stockage number,
	nbr_employes number,
	nom_responsable varchar(15),
	superficie number,
	classement number,
	PRIMARY KEY (local_id),
)


