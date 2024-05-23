INSERT INTO address (zip_code, city, number, street, id_country, id_type) VALUES 
('10001', 'New York', '123', '5th Ave', 1, 1),
('10002', 'New York', '456', 'Madison Ave', 1, 2);
-- Ajoutez d'autres adresses uniques pour chaque utilisateur...

-- Lier les utilisateurs et les adresses
INSERT INTO user_address (id_user, id_address) VALUES 
(1, 1),
(2, 2);
-- Ajoutez les relations pour les autres utilisateurs...

-- Insertion des produits
INSERT INTO product (code, name, purchase_price, sale_price, id_product_family) VALUES 
('FIGLOL', 'Figurine LoL', 5.00, 15.00, 1),
('FIGSTW', 'Figurine Star Wars', 6.00, 18.00, 1),
('FIGASC', 'Figurine Assassin’s Creed', 7.00, 20.00, 1),
('MINTET', 'Mini-jeu Tetris', 4.00, 12.00, 5),
('MINPAC', 'Mini-jeu Pac-Man', 4.50, 13.00, 5);

-- Insertion des stocks
INSERT INTO stock (quantity, id_stock_type) VALUES 
(500, 1),
(300, 2);
-- Ajoutez d'autres stocks ici...

-- Lier les produits et les stocks
INSERT INTO product_stock (id_product, id_stock) VALUES 
(1, 1),
(2, 2);
-- Ajoutez les relations pour les autres produits...

-- Insertion des factures
INSERT INTO bill (bill_date, fee, is_payed, id_payement, id_sale_mode) VALUES 
('2024-05-01', 2.00, 1, 1, 1),
('2024-05-02', 3.00, 0, 2, 2);
-- Ajoutez d'autres factures ici...

-- Insertion des commandes
INSERT INTO line_order (id_user, id_product, id_bill, quantity) VALUES 
(1, 1, 1, 2),
(2, 3, 2, 1);
-- Ajoutez d'autres commandes ici...
