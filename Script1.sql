CREATE SCHEMA IF NOT EXISTS storeDB DEFAULT CHARACTER SET utf8 ;
USE storeDB ;

-- -----------------------------------------------------
-- Table 'storeDB'.'document_type'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS storeDB.document_type (
  doc_id INT NOT NULL AUTO_INCREMENT,
  doc_type VARCHAR(4) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (doc_id),
  UNIQUE INDEX doc_type_UNIQUE (doc_type ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table 'storeDB'.'customer'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS storeDB.customer (
  id_customer INT NOT NULL AUTO_INCREMENT,
  document_type_doc_id INT NOT NULL,
  number_document INT NOT NULL,
  created_at DATETIME NOT NULL,
  update_at DATETIME NULL,
  delete_at DATETIME NULL,
  PRIMARY KEY (id_customer, document_type_doc_id),
  INDEX fk_customer_document_type1_idx (document_type_doc_id ASC) VISIBLE,
  UNIQUE INDEX number_document_UNIQUE (number_document ASC, document_type_doc_id ASC) VISIBLE,
  CONSTRAINT fk_customer_document_type1
    FOREIGN KEY (document_type_doc_id)
    REFERENCES storeDB.document_type (doc_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table 'storeDB'.'seller'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS storeDB.seller (
  id_seller INT NOT NULL AUTO_INCREMENT,
  name_seller VARCHAR(45) NOT NULL,
  created_at DATETIME NOT NULL,
  update_at DATETIME NULL,
  delete_at DATETIME NULL,
  PRIMARY KEY (id_seller))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table 'storeDB'.'supplier'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS storeDB.supplier (
  id_supplier INT NOT NULL AUTO_INCREMENT,
  name_supplier VARCHAR(45) NOT NULL,
  created_at DATETIME NOT NULL,
  update_at DATETIME NULL,
  delete_at DATETIME NULL,
  PRIMARY KEY (id_supplier))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table 'storeDB'.'product'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS storeDB.product (
  id_products INT NOT NULL AUTO_INCREMENT,
  id_supplier INT NOT NULL,
  name_pro VARCHAR(70) NOT NULL,
  price_pro DECIMAL NOT NULL,
  quantity_pro INT NOT NULL,
  created_at DATETIME NOT NULL,
  update_at DATETIME NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (id_products, id_supplier),
  INDEX fk_products_supplier1_idx (id_supplier ASC) VISIBLE,
  CONSTRAINT fk_products_supplier1
    FOREIGN KEY (id_supplier)
    REFERENCES storeDB.supplier (id_supplier)
    ON DELETE NO action
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table 'storeDB'.'sale'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS storeDB.sale (
  id_sale INT NOT NULL AUTO_INCREMENT,
  customer_id_customer INT NOT NULL,
  seller_id_seller INT NOT NULL,
  status_sale TINYINT NOT NULL,
  created_at DATETIME NOT NULL,
  deleted_at DATETIME,
  PRIMARY KEY (id_sale, customer_id_customer, seller_id_seller),
  INDEX fk_sale_customer1_idx (customer_id_customer ASC) VISIBLE,
  INDEX fk_sale_seller1_idx (seller_id_seller ASC) VISIBLE,
  CONSTRAINT fk_sale_customer1
    FOREIGN KEY (customer_id_customer)
    REFERENCES storeDB.customer (id_customer)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_sale_seller1
    FOREIGN KEY (seller_id_seller)
    REFERENCES storeDB.seller (id_seller)
    ON DELETE NO action
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table 'storeDB'.'sale_has_product'
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS storeDB.sale_has_product (
  sale_id_sale INT NOT NULL,
  product_id_products INT NOT NULL,
  PRIMARY KEY (sale_id_sale, product_id_products),
  INDEX fk_sale_has_product_product1_idx (product_id_products ASC) VISIBLE,
  INDEX fk_sale_has_product_sale1_idx (sale_id_sale ASC) VISIBLE,
  CONSTRAINT fk_sale_has_product_sale1
    FOREIGN KEY (sale_id_sale)
    REFERENCES storeDB.sale (id_sale)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_sale_has_product_product1
    FOREIGN KEY (product_id_products)
    REFERENCES storeDB.product (id_products)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- DATA
-- -----------------------------------------------------

INSERT INTO document_type (doc_type,created_at)
VALUES ('CC',now());
INSERT INTO document_type (doc_type,created_at)
VALUES ('TI',now());
INSERT INTO document_type (doc_type,created_at)
VALUES ('CE',now());

INSERT INTO supplier (name_supplier,created_at)
VALUES ('Variedades el Paisa',now());
INSERT INTO supplier (name_supplier,created_at)
VALUES ('Almacen La Cosecha',now());
INSERT INTO supplier (name_supplier,created_at)
VALUES ('Todo Center',now());
INSERT INTO supplier (name_supplier,created_at)
VALUES ('Mercancentro',now());

INSERT INTO seller (name_seller,created_at)
VALUES ('Magola Zambrano',now());

INSERT INTO customer (document_type_doc_id,number_document,created_at)
VALUES (1,88669335,now());
INSERT INTO customer (document_type_doc_id,number_document,created_at)
VALUES (2,10789564,now());
INSERT INTO customer (document_type_doc_id,number_document,created_at)
VALUES (1,35896741,now());
INSERT INTO customer (document_type_doc_id,number_document,created_at)
VALUES (3,56877796,now());
INSERT INTO customer (document_type_doc_id,number_document,created_at)
VALUES (1,25489637,now());
INSERT INTO customer (document_type_doc_id,number_document,created_at)
VALUES (1,58741235,now());
INSERT INTO customer (document_type_doc_id,number_document,created_at)
VALUES (3,6598742,now());

INSERT INTO product (id_supplier,name_pro,price_pro,quantity_pro,created_at)
VALUES (1,"Guitarra acustica",150000,5,now());
INSERT INTO product (id_supplier,name_pro,price_pro,quantity_pro,created_at)
VALUES (3,"Violin",290000,2,now());
INSERT INTO product (id_supplier,name_pro,price_pro,quantity_pro,created_at)
VALUES (2,"Caja vallenata",98000,6,now());
INSERT INTO product (id_supplier,name_pro,price_pro,quantity_pro,created_at)
VALUES (1,"Melodica",75000,1,now());
INSERT INTO product (id_supplier,name_pro,price_pro,quantity_pro,created_at)
VALUES (4,"Pandereta",40000,8,now());
INSERT INTO product (id_supplier,name_pro,price_pro,quantity_pro,created_at)
VALUES (2,"Guitarra electrica",600000,1,now());
INSERT INTO product (id_supplier,name_pro,price_pro,quantity_pro,created_at)
VALUES (2,"Bateria",1370000,2,now());
INSERT INTO product (id_supplier,name_pro,price_pro,quantity_pro,created_at)
VALUES (3,"Acordeon",1900000,1,now());


INSERT INTO sale (customer_id_customer,seller_id_seller,status_sale,created_at)
VALUES (2,1,1,now());
INSERT INTO sale (customer_id_customer,seller_id_seller,status_sale,created_at)
VALUES (3,1,1,now());
INSERT INTO sale (customer_id_customer,seller_id_seller,status_sale,created_at)
VALUES (1,1,1,now());
INSERT INTO sale (customer_id_customer,seller_id_seller,status_sale,created_at)
VALUES (4,1,1,now());
INSERT INTO sale (customer_id_customer,seller_id_seller,status_sale,created_at)
VALUES (1,1,1,now());
INSERT INTO sale (customer_id_customer,seller_id_seller,status_sale,created_at)
VALUES (4,1,1,now());
INSERT INTO sale (customer_id_customer,seller_id_seller,status_sale,created_at)
VALUES (2,1,1,now());
INSERT INTO sale (customer_id_customer,seller_id_seller,status_sale,created_at)
VALUES (6,1,1,now());
INSERT INTO sale (customer_id_customer,seller_id_seller,status_sale,created_at)
VALUES (7,1,1,now());
INSERT INTO sale (customer_id_customer,seller_id_seller,status_sale,created_at)
VALUES (5,1,1,now());



INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (1,3);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (1,2);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (2,1);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (3,6);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (3,7);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (3,2);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (4,6);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (5,4);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (6,1);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (6,5);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (7,1);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (7,2);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (8,1);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (8,5);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (9,1);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (9,2);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (10,1);
INSERT INTO sale_has_product (sale_id_sale,product_id_products)
VALUES (10,3);



UPDATE sale SET deleted_at = now() WHERE id_sale=1;
UPDATE sale SET deleted_at = now() WHERE id_sale=4;

DELETE FROM sale where id_sale=2;
DELETE FROM sale where id_sale=6;

UPDATE product SET id_supplier = 3, name_pro = "Maracas",quantity_pro=12,update_at=now() WHERE id_products=5;
UPDATE product SET id_supplier = 1, name_pro = "Arpa",quantity_pro=1,update_at=now() WHERE id_products=6;