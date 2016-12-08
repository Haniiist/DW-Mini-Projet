--Suppression des vues si elles existent

DROP VIEW D_prodForComm;
DROP VIEW D_prodForStocks;
DROP VIEW D_dateForComm;
DROP VIEW D_dateForStocks;

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

