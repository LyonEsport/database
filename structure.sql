CREATE TABLE app_user(
   id_user INT AUTO_INCREMENT,
   email VARCHAR(50)  NOT NULL,
   password VARCHAR(50)  NOT NULL,
   last_name VARCHAR(50)  NOT NULL,
   first_name VARCHAR(50) ,
   PRIMARY KEY(id_user),
   UNIQUE(email)
);

CREATE TABLE address_type(
   id_type INT AUTO_INCREMENT,
   label VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_type)
);

CREATE TABLE country(
   id_country INT AUTO_INCREMENT,
   name VARCHAR(50)  NOT NULL,
   fee DECIMAL(19,4) NOT NULL,
   PRIMARY KEY(id_country)
);

CREATE TABLE product_family(
   id_product_family INT AUTO_INCREMENT,
   libelle VARCHAR(200) ,
   sale_quantity INT,
   sale_amount DECIMAL(25,2)  ,
   online_product_sale DECIMAL(25,2)  ,
   direct_product_sale DECIMAL(25,2)  ,
   PRIMARY KEY(id_product_family)
);

CREATE TABLE payment_mode(
   id_payement INT AUTO_INCREMENT,
   label VARCHAR(50) ,
   PRIMARY KEY(id_payement)
);

CREATE TABLE sale_mode(
   id_sale_mode INT AUTO_INCREMENT,
   label VARCHAR(50) ,
   PRIMARY KEY(id_sale_mode)
);

CREATE TABLE stock_type(
   id_stock_type INT AUTO_INCREMENT,
   label VARCHAR(50) ,
   PRIMARY KEY(id_stock_type)
);

CREATE TABLE address(
   id_address INT AUTO_INCREMENT,
   zip_code VARCHAR(50)  NOT NULL,
   city VARCHAR(50)  NOT NULL,
   number VARCHAR(50)  NOT NULL,
   street VARCHAR(100) ,
   id_country INT NOT NULL,
   id_type INT NOT NULL,
   PRIMARY KEY(id_address),
   FOREIGN KEY(id_country) REFERENCES country(id_country),
   FOREIGN KEY(id_type) REFERENCES address_type(id_type)
);

CREATE TABLE product(
   id_product INT AUTO_INCREMENT,
   code VARCHAR(20)  NOT NULL,
   name VARCHAR(100) ,
   purchase_price DECIMAL(15,2)  ,
   sale_price DECIMAL(15,2)  ,
   id_product_family INT NOT NULL,
   PRIMARY KEY(id_product),
   UNIQUE(code),
   FOREIGN KEY(id_product_family) REFERENCES product_family(id_product_family)
);

CREATE TABLE bill(
   id_bill INT AUTO_INCREMENT,
   bill_date DATE,
   fee DECIMAL(15,2)  ,
   is_payed INT NOT NULL,
   id_payement INT NOT NULL,
   id_sale_mode INT NOT NULL,
   PRIMARY KEY(id_bill),
   FOREIGN KEY(id_payement) REFERENCES payment_mode(id_payement),
   FOREIGN KEY(id_sale_mode) REFERENCES sale_mode(id_sale_mode)
);

CREATE TABLE stock(
   id_stock INT AUTO_INCREMENT,
   quantity INT,
   id_stock_type INT NOT NULL,
   PRIMARY KEY(id_stock),
   FOREIGN KEY(id_stock_type) REFERENCES stock_type(id_stock_type)
);

CREATE TABLE user_address(
   id_user INT,
   id_address INT,
   PRIMARY KEY(id_user, id_address),
   FOREIGN KEY(id_user) REFERENCES app_user(id_user),
   FOREIGN KEY(id_address) REFERENCES address(id_address)
);

CREATE TABLE line_order(
   id_user INT,
   id_product INT,
   id_bill INT,
   quantity INT,
   PRIMARY KEY(id_user, id_product, id_bill),
   FOREIGN KEY(id_user) REFERENCES app_user(id_user),
   FOREIGN KEY(id_product) REFERENCES product(id_product),
   FOREIGN KEY(id_bill) REFERENCES bill(id_bill)
);

CREATE TABLE product_stock(
   id_product INT,
   id_stock INT,
   PRIMARY KEY(id_product, id_stock),
   FOREIGN KEY(id_product) REFERENCES product(id_product),
   FOREIGN KEY(id_stock) REFERENCES stock(id_stock)
);
