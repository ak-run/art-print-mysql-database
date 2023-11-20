-- a trigger that updates the stock_item_quantity_available column in the stock_items table 
-- when a new row is inserted into the order_items table
DELIMITER //
CREATE TRIGGER order_item_insert_trigger
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE stock_items
    SET stock_item_quantity_available = stock_item_quantity_available - NEW.quantity
    WHERE stock_item_id = NEW.stock_item_id;
END;
//
DELIMITER ;

-- let's test it
-- checking stock quantity of stock item 1
SELECT stock_item_quantity_available
FROM stock_items
WHERE stock_item_id = 1;

-- call our stored procedure to insert new row in customer_orders, and then in order_item table.
-- the insertion of a row in order_item_table should update stock_item_quantity available
CALL insert_customer_order(22, 2, 2, '2023-10-02', 1);
CALL insert_order_item(40, 22, 10, 1, 2, 17.50); -- order for 2 stock_items of stock_item_id 2

-- checking stock quantity of stock item 1 again, and it's 2 fewer available
SELECT stock_item_quantity_available
FROM stock_items
WHERE stock_item_id = 1;

-- a similar trigger to update the stock_item_quantity_available column in the stock_items table
-- when a new row is inserted into stock_orders but only if order_status is Delivered (4)
DELIMITER //

CREATE TRIGGER stock_order_insert_trigger
AFTER INSERT ON stock_orders
FOR EACH ROW
BEGIN
    DECLARE order_status INT;
    
    SELECT order_status_id INTO order_status
    FROM order_statuses
    WHERE order_status_id = NEW.order_status_id;
    
    IF order_status = 4 THEN
        UPDATE stock_items
        SET stock_item_quantity_available = stock_item_quantity_available + NEW.stock_order_quantity
        WHERE stock_item_id = NEW.stock_item_id;
    END IF;
END;
//

DELIMITER ;

-- I also need another trigger where if stock_oder status is changed to Delivered (4), then stock_order_quantity is updated
DELIMITER //

CREATE TRIGGER stock_order_status_update_trigger
AFTER UPDATE ON stock_orders
FOR EACH ROW
BEGIN
    DECLARE new_status INT;
    DECLARE old_status INT;
    DECLARE total_order_quantity INT;
    
    SELECT NEW.order_status_id INTO new_status;
    SELECT OLD.order_status_id INTO old_status;
    
    IF new_status = 4 AND old_status != 4 THEN
        -- Calculate the total quantity of items in the order
        SELECT stock_order_quantity INTO total_order_quantity
        FROM stock_orders
        WHERE stock_order_id = NEW.stock_order_id;
        
        -- Update the stock_item_quantity_available
        UPDATE stock_items
        SET stock_item_quantity_available = stock_item_quantity_available + total_order_quantity
        WHERE stock_item_id = NEW.stock_item_id;
    END IF;
END;
//

DELIMITER ;


-- checking the other trigger by inserting data in stock_oder table using instert_stock_order procedure
-- first checking availability of stock_item_id 2 (mug):
SELECT stock_item_quantity_available
FROM stock_items
WHERE stock_item_id = 2;

CALL insert_stock_order(32, 2, '2023-10-04', 50, 200.00, 1); -- ordering 50 mugs (stock_id 2)

-- checking that stock_item_quantity_available shouldn't increase yet, because order status is not 4:
SELECT stock_item_quantity_available
FROM stock_items
WHERE stock_item_id = 2;

-- I'm going to update order status to be 4
UPDATE stock_orders
SET order_status_id = 4
WHERE stock_order_id = 32;

-- now the stock_item_quantity of item with id 2 increased by 50
SELECT stock_item_quantity_available
FROM stock_items
WHERE stock_item_id = 2;