SELECT name_pro from product inner join sale_has_product on sale_has_product.product_id_products = product.id_products inner join sale on sale.id_sale = sale_has_product.sale_id_sale inner join
customer on customer.id_customer = sale.customer_id_customer where document_type_doc_id=1 and number_document=88669335;
SELECT name_pro from product inner join sale_has_product on sale_has_product.product_id_products = product.id_products inner join sale on sale.id_sale = sale_has_product.sale_id_sale inner join
customer on customer.id_customer = sale.customer_id_customer where document_type_doc_id=3 and number_document=56877796;


SELECT name_pro,name_supplier from product inner join supplier on supplier.id_supplier = product.id_supplier where name_pro="Guitarra acustica" or name_pro="Bateria";
SELECT name_pro,name_supplier from product inner join supplier on supplier.id_supplier = product.id_supplier where name_pro="Acordeon";

SELECT name_pro,count(name_pro) from product inner join sale_has_product on sale_has_product.product_id_products = product.id_products inner join sale on sale.id_sale = sale_has_product.sale_id_sale where sale.deleted_at is null group by name_pro order by count(name_pro) desc;