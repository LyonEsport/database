-- Sélectionner toutes les commandes avec détails utilisateur, produit et facture
SELECT u.email, p.name AS product_name, o.quantity, b.bill_date, b.fee, pm.label AS payment_mode, sm.label AS sale_mode
FROM line_order o
JOIN app_user u ON o.id_user = u.id_user
JOIN product p ON o.id_product = p.id_product
JOIN bill b ON o.id_bill = b.id_bill
JOIN payment_mode pm ON b.id_payement = pm.id_payement
JOIN sale_mode sm ON b.id_sale_mode = sm.id_sale_mode;

-- Sélectionner toutes les factures payées
SELECT * FROM bill WHERE is_payed = 1;

-- Sélectionner toutes les commandes pour un utilisateur donné
SELECT o.*, p.name AS product_name, b.bill_date, b.is_payed, pm.label AS payment_mode, sm.label AS sale_mode 
FROM line_order o
JOIN product p ON o.id_product = p.id_product
JOIN bill b ON o.id_bill = b.id_bill
JOIN payment_mode pm ON b.id_payement = pm.id_payement
JOIN sale_mode sm ON b.id_sale_mode = sm.id_sale_mode
WHERE o.id_user = 1;

-- Sélectionner tous les stocks et leurs types
SELECT s.*, t.label AS stock_type 
FROM stock s 
JOIN stock_type t ON s.id_stock_type = t.id_stock_type;

-- Sélectionner tous les produits et leurs familles
SELECT p.*, f.libelle AS product_family 
FROM product p 
JOIN product_family f ON p.id_product_family = f.id_product_family;

-- Sélectionner toutes les adresses d'un utilisateur donné
SELECT u.id_user, u.email, a.zip_code, a.city, a.number, a.street, c.name AS country, t.label AS address_type 
FROM app_user u
JOIN user_adress ua ON u.id_user = ua.id_user
JOIN address a ON ua.id_address = a.id_address
JOIN country c ON a.id_country = c.id_country
JOIN address_type t ON a.id_type = t.id_type
WHERE u.id_user = 1;