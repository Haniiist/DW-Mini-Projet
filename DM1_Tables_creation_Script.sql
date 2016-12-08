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
	date_id number,
	plateau_code number,
	prix_vente number,
	cout_reel number,
	benefice_net number,
	PRIMARY KEY (produit_id,plateau_code);
	CONSTRAINT fkey_produit_id FOREIGN KEY (produit_id) REFERENCES D_prodForComm(vc_produit_id),
	CONSTRAINT fkey_remise_id FOREIGN KEY (remise_id) REFERENCES D_remise(remise_id),
	CONSTRAINT fkey_client_id FOREIGN KEY (client_id) REFERENCES D_client(client_id),
	CONSTRAINT fkey_date_id FOREIGN KEY (date_id) REFERENCES D_dateForComm(vc_date_id)
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
	PRIMARY KEY (client_id)

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
	PRIMARY KEY (remise_id)
);

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
	PRIMARY KEY (produit_id)
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
)

