-- stored procedure to create new customer order
DELIMITER //

CREATE PROCEDURE insert_customer_order(
    IN customer_order_id INT,
    IN customer_id INT,
    IN customer_address_id INT,
    IN customer_order_date DATE,
    IN order_status_id INT
)
BEGIN
    INSERT INTO customer_orders (customer_order_id, customer_id, customer_address_id, customer_order_date, order_status_id)
    VALUES (customer_order_id, customer_id, customer_address_id, customer_order_date, order_status_id);
END;
//

DELIMITER ;

-- example of usage of stored procedure
CALL insert_customer_order(16, 5, 5, '2023-10-02', 1);

SELECT * 
FROM customer_orders
WHERE customer_order_id = 16;

DELETE 
FROM customer_orders
WHERE customer_order_id = 16;

-- creating similar procedure for order_items, I'm using earlier defined function set_commission_rate to insert the right commission rate
DELIMITER //

CREATE PROCEDURE insert_order_item(
    IN order_item_id INT,
    IN customer_order_id INT,
    IN image_id INT,
    IN stock_item_id INT,
    IN quantity INT,
    IN item_unit_price DECIMAL(6, 2)
)
BEGIN
    DECLARE artist_commission_rate DECIMAL(6, 2);
    SET artist_commission_rate = set_commission_rate(quantity);
    
    INSERT INTO order_items (order_item_id, customer_order_id, image_id, stock_item_id, quantity, item_unit_price, artist_commission_rate)
    VALUES (order_item_id, customer_order_id, image_id, stock_item_id, quantity, item_unit_price, artist_commission_rate);
END;
//

DELIMITER ;

-- calling newly created procedure to insert new row of data
CALL insert_order_item(35, 11, 5, 6, 4, 5.00);

SELECT *
FROM order_items
WHERE order_item_id = 35;

DELETE
FROM order_items
WHERE order_item_id = 35;

-- creating similar procedure for stock orders
DELIMITER //

CREATE PROCEDURE insert_stock_order(
    IN stock_order_id INT,
    IN stock_item_id INT,
    IN stock_order_date DATE,
    IN stock_order_quantity INT,
    IN stock_order_total DECIMAL(6, 2),
    IN order_status_id INT
)
BEGIN
    INSERT INTO stock_orders (stock_order_id, stock_item_id, stock_order_date, stock_order_quantity, stock_order_total, order_status_id)
    VALUES (stock_order_id, stock_item_id, stock_order_date, stock_order_quantity, stock_order_total, order_status_id);
END;
//

DELIMITER ;

-- I will test this procedure after I've created my triggers. 
