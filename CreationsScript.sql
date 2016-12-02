/*

Création de la table de faits F_commande.
Mesures : prix_total, benefice_net.
Dimensions : D_plateau, D_livreur, D_client, D_local, D_date.

*/

CREATE TABLE F_commande
(
	plateau_id number,
	livreur_id number,
	client_id number,
	local_id number,
	date_id number,
	prix_potal number,
	benefice_net number,
	PRIMARY KEY (plateau_id,livreur_id,client_id,livreur_id,date_id);
	CONSTRAINT fkey_plateau_id FOREIGN KEY (plateau_id) REFERENCES D_plateau(plateau_id),
	CONSTRAINT fkey_livreur_id FOREIGN KEY (livreur_id) REFERENCES D_livreur(livreur_id),
	CONSTRAINT fkey_client_id FOREIGN KEY (client_id) REFERENCES D_client(client_id),
	CONSTRAINT fkey_local_id FOREIGN KEY (local_id) REFERENCES D_local(local_id),
	CONSTRAINT fkey_date_id FOREIGN KEY (date_id) REFERENCES D_date(date_id)
);

/*

Création des tables de dimensions d_<Table>.
Tables : D_plateau, D_livreur, D_client, D_local, D_date.

*/

CREATE TABLE D_client
(
	client_id number,
	nom varchar(15),
	prenom varchar(15),
	ville varchar(50),
	code_postal varchar(5),
	num_tel varchar(12),
	date_naissance Date,
	date_inscription Date,
	sexe varchar(1),
	allergies varchar(50),
	PRIMARY KEY (client_id),
);

CREATE TABLE D_livreur
(
	livreur_id number,
	nom varchar(15),
	prenom varchar(15),
	adresse varchar(50),
	code_postal varchar(5),
	num_tel varchar(12),
	date_Naissance Date,
	date_Recrutement Date,
	sexe varchar(1),
	moyen_transport varchar(50),
	PRIMARY KEY (livreur_id),
);

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
	nbr_livreurs number,
	classement number,
	PRIMARY KEY (local_id),
);

CREATE TABLE D_plateau
(
	plateau_id number,
	nom varchar(15),
	type_pain varchar(15),
	type_vin varchar(15),
	type_charcuterie varchar(15),
	type_fromage varchar(15),
	prix_pain number,
	prix_vin number,
	prix_charcuterie number,
	prix_fromage number,
	prix_total number,
	allergies varchar(50),
	PRIMARY KEY (plateau_id),
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