INSERT INTO F_commande VALUES(
	1, 2, 1, 1, 1, 20, 7, 13);

INSERT INTO F_commande VALUES(
	2, 1, 2, 2, 2, 35, 13, 22);

INSERT INTO F_commande VALUES(
	3, 0, 3, 3, 3, 1380, 600, 780);



INSERT INTO D_client VALUES(
	1, 'Tonneau', 'Mathieu', 'Montpellier', 34000, 06123456, '16/02/1984', '13/09/2011', 'M');

INSERT INTO D_client VALUES(
	2, 'Bruges', 'Jon', 'Londres', 124, 02079460777, '24/05/1990', '15/12/2015', 'M');

INSERT INTO D_client VALUES(
	3, 'Richard', 'Julie', 'Paris', 75015, 0607815637, '03/11/1972', '11/06/2009', 'F');



INSERT INTO D_remise VALUES(
	2, 'remise de 50%', 'r50', 'remise de fin d"année', 0.5, '01/12/2016', '31/12/2016', 1, 'Monde');

INSERT INTO D_remise VALUES(
	1, 'remise de 20%', 'r20', 'remise de -25 ans en France', 0.2, NULL, NULL, NULL, 'France');

INSERT INTO D_remise VALUES(
	0, 'pas de remise', 'r0', 'pas de remise', NULL, NULL, NULL, NULL, NULL);



INSERT INTO D_produit VALUES(
	1, 'Pain complet', 'Pain fabriqué à partir de la farine', 'Pain', 'Pain', 'Planète pain', 0.12, 400, 'Sachet', 1.20,);

INSERT INTO D_produit VALUES(
	2, 'Chorizo', 'Saucisson origine espagnole fabriqué à partir de viande de porc', 'Saucisse', 'Chorizo de Léon', 'Portalconsa', 0.38, 100, 'Film', 0.95);

INSERT INTO D_produit VALUES(
	3, 'Cros Parantoux', 'Vin rouge - Vosne-Romanée Premier Cru Cros Parantoux', 'Vin', 'Rouge', 'Henri Jayer Richebourg', 0, 0.75, 'Boîtes', 1380);



INSERT INTO D_allergie VALUES(
	1, 'Intolérant au gluten', 'souvent dès la naissance', 2, 'Céréales contenant du gluten', 'Cancer des intestins');

INSERT INTO D_allergie VALUES(
	2, 'Intolérant au lactose', 'se développe assez souvent chez les jeunes', 0, 'Produits à base de lactose', 'Maladie coeliaque');

INSERT INTO D_allergie VALUES(
	3, 'Intolérant au sésame', 'souvent dès la naissance', 1, 'Produits à base de sésame', 'Eczéma');



INSERT INTO D_clientAllergieBridge VALUES(
	1, 1, 1, 0.25);

INSERT INTO D_clientAllergieBridge VALUES(
	2, 2, 2, 0.3);

INSERT INTO D_clientAllergieBridge VALUES(
	3, 3, 3, 0.2);

