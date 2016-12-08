/*

Remarques : 

type D_produit(poids_unitaire) ??

*/


--Suppression des tables si elles existent

DROP TABLE F_commande;
DROP TABLE D_client;
DROP TABLE D_produit;
DROP TABLE D_remise;
DROP TABLE D_allergie;
DROP TABLE D_clientAllergieBridge;
DROP VIEW D_prodForComm;
DROP VIEW D_prodForStocks;
DROP VIEW D_dateForComm;
DROP VIEW D_dateForStocks;
/*

Création de la table de faits F_commande.
Mesures : prix_total, benefice_net.
Dimensions : D_produit, D_remise, D_client, D_local, D_date.

*/

CREATE TABLE F_commande
(
	produit_id number,
	remise_id number,
	client_id number,
	--local_id number,
	date_id number,
	plateau_code number
	prix_vente number,
	cout_reel number,
	benefice_net number,
	PRIMARY KEY (produit_id,plateau_code);
	CONSTRAINT fkey_produit_id FOREIGN KEY (produit_id) REFERENCES D_produit(produit_id),
	CONSTRAINT fkey_remise_id FOREIGN KEY (remise_id) REFERENCES D_remise(remise_id),
	CONSTRAINT fkey_client_id FOREIGN KEY (client_id) REFERENCES D_client(client_id),
	--CONSTRAINT fkey_local_id FOREIGN KEY (local_id) REFERENCES D_local(local_id),
	CONSTRAINT fkey_date_id FOREIGN KEY (date_id) REFERENCES D_date(date_id)
);

/*

Création des tables de dimensions D_<Table> et table bridge.
Tables : D_produit, D_remise, D_client, D_local, D_date, D_allergie, D_clientAllergieBridge.

*/

CREATE TABLE D_client
(
	client_id number,
	nom varchar(15),
	prenom varchar(15),
	ville varchar(50),
	code_postal number,
	num_tel number,
	date_naissance Date,
	date_inscription Date,
	sexe varchar(1),
	PRIMARY KEY (client_id),

);
CREATE TABLE D_clientAllergieBridge
(
	bridge_id number,
	client_id number,
	allergies_id number,
	weight number,
	PRIMARY KEY (bridge_id),
	CONSTRAINT fkey_client_id FOREIGN KEY (client_id) REFERENCES D_client(client_id)
);

CREATE TABLE D_allergie
(
	allergie_id number,
	description varchar(15),
	age_debut varchar(30),
	gravite number,
	allergene varchar(15),
	risques varchar(50),
	PRIMARY KEY (allergie_id),
	CONSTRAINT fkey_bridge_id FOREIGN KEY (allergie_id) REFERENCES D_clientAllergieBridge(allergie_id)
);

CREATE TABLE D_remise
(
	remise_id number,
	description varchar(15),
	code varchar(15),
	publique varchar(50),
	pourcentage varchar(12),
	date_debut Date,
	date_fin Date,
	frequence_annuelle number,
	portee_geographique varchar(50),
	PRIMARY KEY (remise_id),
);
/*
CREATE TABLE D_local
(
	local_id number,
	nom varchar(15),
	region varchar(15),
	adresse varchar(50),
	code_postal varchar(5),
	capacite_stockage number,
	nbr_employes number,
	nom_responsable varchar(15),
	superficie number,
	nbr_remises number,
	classement number,
	PRIMARY KEY (local_id),
);
*/
CREATE TABLE D_produit
(
	produit_id number,
	nom varchar(15),
	description varchar(15),
	category varchar(15),
	type varchar(15),
	fournisseur varchar(15),
	matiere_grasse number,
	poids_unitaire number,
	emballage varchar(15),
	prix_unitaire number,
	PRIMARY KEY (produit_id),
);

--Script de création de D_Date pris de http://www.ipcdesigns.com/dim_date/ -Fiabilité incertaine, à revoir ^^'

CREATE TABLE D_date 
(
date_id integer NOT NULL,
date_type varchar2 (20) NULL  DEFAULT 'NORMAL',
full_date date NULL,
day_num_of_week integer NULL,
day_num_of_month integer NULL,
day_num_of_quarter integer NULL,
day_num_of_year integer NULL,
day_num_absolute integer NULL,
day_of_week_name varchar2 (10) NULL,
day_of_week_abbreviation varchar2 (3) NULL,
julian_day_num_of_year integer NULL,
julian_day_num_absolute decimal(18, 0) NULL,
is_weekday char (1) NULL,
is_US_civil_holiday char (1) NULL DEFAULT 'N',
is_last_day_of_week char (1) NULL DEFAULT 'N',
is_last_day_of_month char (1) NULL DEFAULT 'N' ,
is_last_day_of_quarter char (1) NULL DEFAULT 'N',
is_last_day_of_year char (1) NULL DEFAULT 'N',
is_last_day_of_fiscal_month char (1) NULL DEFAULT 'N',
is_last_day_of_fiscal_quarter char (1) NULL DEFAULT 'N',
is_last_day_of_fiscal_year char (1) NULL DEFAULT 'N',
prev_day_date date NULL,
prev_day_date_key integer NULL,
same_weekday_year_ago_date date NULL,
same_weekday_year_ago_date_key integer NULL,
week_of_year_begin_date date NULL,
week_of_year_begin_date_key integer NULL,
week_of_year_end_date date NULL,
week_of_year_end_date_key integer NULL,
week_of_month_begin_date date NULL,
week_of_month_begin_date_key integer NULL,
week_of_month_end_date date NULL,
week_of_month_end_date_key integer NULL,
week_of_quarter_begin_date date NULL,
week_of_quarter_begin_date_key integer NULL,
week_of_quarter_end_date date NULL,
week_of_quarter_end_date_key integer NULL,
week_num_of_month integer NULL,
week_num_of_quarter integer NULL,
week_num_of_year integer NULL,
week_num_overall integer NULL,
month_num_of_year integer NULL,
month_num_overall integer NULL,
month_name varchar2 (10) NULL,
month_name_abbreviation varchar2 (3) NULL,
month_begin_date date NULL,
month_begin_date_key integer NULL,
month_end_date date NULL,
month_end_date_key integer NULL,
quarter_num_of_year integer NULL,
quarter_num_overall integer NULL,
quarter_begin_date date NULL,
quarter_begin_date_key integer NULL,
quarter_end_date date NULL,
quarter_end_date_key integer NULL,
year_num integer NULL,
year_begin_date date NULL,
year_begin_date_key integer NULL,
year_end_date date NULL,
year_end_date_key integer NULL,
YYYYMM varchar2 (6) NULL,
YYYYMMDD varchar2 (8) NULL,
DDMONYY varchar2 (7) NULL,
DDMONYYYY varchar2 (9) NULL,
fiscal_week_num_of_year integer NULL,
fiscal_week_num_overall integer NULL,
fiscal_week_begin_date_key integer NULL,
fiscal_week_begin_date date NULL,
fiscal_week_end_date_key integer NULL,
fiscal_week_end_date date NULL,
fiscal_month_num_of_year integer NULL,
fiscal_month_num_overall integer NULL,
fiscal_month_begin_date date NULL,
fiscal_month_begin_date_key integer NULL,
fiscal_month_end_date date NULL,
fiscal_month_end_date_key integer NULL,
fiscal_quarter_num_of_year integer NULL,
fiscal_quarter_num_overall integer NULL,
fiscal_quarter_begin_date date NULL,
fiscal_quarter_begin_date_key integer NULL,
fiscal_quarter_end_date date NULL,
fiscal_quarter_end_date_key integer NULL,
fiscal_year_num integer NULL,
fiscal_year_begin_date date NULL,
fiscal_year_begin_date_key integer NULL,
fiscal_year_end_date date NULL,
fiscal_year_end_date_key integer NULL
);

/*

Création des vues pour les dimensions partagées.
<dimension>s partagées : D_produit, D_date.

Une vue pour chaque table de fait référençant la dimension ; 
<dimension>ForComm : attributs --> vc_<nom_attribut>.
<dimension>ForStocks : attributs --> vs_<nom_attribut>.

*/

--D_produit


CREATE VIEW D_prodForComm (vc_produit_id,vc_nom,vc_description,vc_category,vc_type,vc_fournisseur,vc_matiere_grasse,vc_poids_unitaire,vc_emballage,vc_prix_unitaire) AS
SELECT produit_id,nom,description,category ,type,fournisseur,matiere_grasse,poids_unitaire,emballage,prix_unitaire 
FROM D_produit


CREATE VIEW D_prodForStocks (vs_produit_id,vs_nom,vs_description,vs_category,vs_type,vs_fournisseur,vs_matiere_grasse,vs_poids_unitaire,vs_emballage,vs_prix_unitaire) AS
SELECT produit_id,nom,description,category,type,fournisseur,matiere_grasse,poids_unitaire,emballage,prix_unitaire 
FROM D_produit

--D_date

CREATE VIEW D_dateForComm (vc_date_id,vc_date_type,vc_full_date,vc_day_num_of_week,vc_day_num_of_month,vc_day_num_of_quarter,vc_day_num_of_year,vc_day_num_absolute,vc_week_num_of_month,vc_week_num_of_quarter,vc_week_num_of_year,vc_week_num_overall,vc_month_num_of_year,vc_month_num_overall) AS
SELECT date_id,date_type,full_date,day_num_of_week ,day_num_of_month ,day_num_of_quarter ,day_num_of_year ,day_num_absolute,week_num_of_month ,week_num_of_quarter ,week_num_of_year ,week_num_overall ,month_num_of_year ,month_num_overall
FROM D_date

CREATE VIEW D_dateForStocks (vs_date_id,vs_date_type,vs_full_date,vs_day_num_of_week,vs_day_num_of_month,vs_day_num_of_quarter,vs_day_num_of_year,vs_day_num_absolute,vs_week_num_of_month,vs_week_num_of_quarter,vs_week_num_of_year,vs_week_num_overall,vs_month_num_of_year,vs_month_num_overall) AS
SELECT date_id,date_type,full_date,day_num_of_week ,day_num_of_month ,day_num_of_quarter ,day_num_of_year ,day_num_absolute,week_num_of_month ,week_num_of_quarter ,week_num_of_year ,week_num_overall ,month_num_of_year ,month_num_overall
FROM D_date
