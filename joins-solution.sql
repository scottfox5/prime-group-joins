-- Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses ON customers.id = addresses.customer_id
-- Get all orders and their line items.
SELECT * FROM orders
JOIN line_items on orders.id = line_items.order_id
-- Which warehouses have cheetos?
SELECT * FROM warehouse
JOIN warehouse_product on warehouse.id = warehouse_product.warehouse_id
JOIN products on warehouse_product.product_id = products.id
WHERE products.description = 'cheetos';
-- Warehouse Delta has the cheetos
-- Which warehouses have diet pepsi?
SELECT * FROM warehouse
JOIN warehouse_product on warehouse.id = warehouse_product.warehouse_id
JOIN products on warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi';
-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT COUNT(*), customers.first_name, customers.last_name FROM orders
JOIN addresses on orders.address_id = addresses.id
JOIN customers on addresses.customer_id = customers.id
GROUP BY customers.id;
-- How many customers do we have?
SELECT COUNT(*) FROM customers
-- How many products do we carry?
SELECT COUNT(*) FROM products
-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand) FROM warehouse_product
JOIN products on warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi';
--92 Diet Pepsis on hand
