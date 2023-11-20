-- creating a view that will show details of each order_item ordered by artist id
-- this mean it's easier to query on those details like sales per artist, commission amount for each order_item
-- view is created by using inner join on 5 tables
CREATE VIEW vw_artist_orders_details AS
SELECT 
	a.artist_id, 
    a.artist_first_name, 
    a.artist_last_name, 
    i.image_id, 
    i.image_title, 
    c.customer_order_id,
    c.customer_order_date, 
    o.stock_item_id,
	s.stock_item_name,
    o.item_unit_price,
    o.quantity, 
    o.artist_commission_rate,
    ROUND(o.item_unit_price * o.quantity, 2) AS subtotal,   -- calculating order item subtotal by  multiplying quantity by price
    ROUND(o.artist_commission_rate * o.quantity * o.item_unit_price, 2) AS artist_commission_amount -- calculating commission amount
FROM customer_orders AS c
INNER JOIN order_items AS o
ON c.customer_order_id = o.customer_order_id
INNER JOIN stock_items AS s
ON o.stock_item_id = s.stock_item_id
INNER JOIN images AS i
ON o.image_id = i.image_id
INNER JOIN artists as a
ON i.artist_id = a.artist_id
ORDER BY a.artist_id;

-- using the view to display all orders for artist with id 1
SELECT * 
FROM vw_artist_orders_details
WHERE artist_id = 1;

-- query to show total sales per artist in descending order
SELECT artist_id, artist_first_name, artist_last_name, SUM(subtotal) AS total_sales -- using SUM aggregate function to total sales
FROM vw_artist_orders_details
GROUP BY artist_id
ORDER BY total_sales DESC;

-- query to show total commission amount per artist in decending order, 
-- the order differs slightly to total sales because the commission amount depends on number of the same items sold
SELECT artist_id, artist_first_name, artist_last_name, SUM(artist_commission_amount) AS total_commission -- using SUM aggregate function to total sales
FROM vw_artist_orders_details
GROUP BY artist_id
ORDER BY total_commission DESC;

-- query to show artists with more than 5 sales
SELECT artist_id, artist_first_name, artist_last_name, COUNT(quantity) AS number_of_sales -- using COUNT aggregate function to calculate number of items sold
FROM vw_artist_orders_details
GROUP BY artist_id
HAVING number_of_sales > 5
ORDER BY number_of_sales DESC;

-- create a view to show total amount for each customer order, view uses one inner join
CREATE VIEW vw_order_total AS
SELECT co.customer_order_id, co.customer_id, co.customer_order_date, SUM(subtotal) AS total_amount
FROM customer_orders AS co
INNER JOIN vw_artist_orders_details AS od
ON co.customer_order_id = od.customer_order_id
GROUP BY od.customer_order_id
ORDER BY co.customer_order_id;

-- using the view to show total of customer order id 6
SELECT *
FROM vw_order_total
WHERE customer_order_id = 6;

-- other queries
-- query with subqueries to show aritsts with no sales
SELECT a.artist_id, a.artist_first_name, a.artist_last_name
FROM artists AS a
WHERE artist_id IN(
	SELECT artist_id
    FROM images
    WHERE image_id NOT IN(
		SELECT image_id
        FROM order_items));

        
-- show order history for a specific customer
SELECT c.*
FROM customer_orders AS c
WHERE c.customer_id = 5
ORDER BY c.customer_order_date;

-- query to show status name for each customer order using left join
SELECT c.*, o.order_status_name 
FROM customer_orders AS c
LEFT JOIN order_statuses AS o
ON c.order_status_id = o.order_status_id
ORDER BY c.order_status_id; -- this order will show pending, processing, and shipped orders at the top

-- query to show status name for each stock order using left join
SELECT s.*, o.order_status_name 
FROM stock_orders AS s
LEFT JOIN order_statuses AS o
ON s.order_status_id = o.order_status_id
ORDER BY s.order_status_id; -- this order will show pending, processing, and shipped orders at the top

-- query to insert a new customer address and then delete it
INSERT INTO customer_addresses (customer_address_id, customer_id, building_num_or_name, street_name, post_town, postcode)
VALUES
    (13, 9, '1', 'Oak Avenue', 'London', 'SW1A 1BA');

-- checking address has been added
SELECT * 
FROM customer_addresses;

-- delete customer address with id 13    
DELETE
FROM customer_addresses
WHERE customer_address_id = 13;

-- checking address has been deleted
SELECT * 
FROM customer_addresses;

-- using GROUP CONCAT built-in function to display full address with id 1
SELECT GROUP_CONCAT(
	c.building_num_or_name, ' ', 
	c.street_name, ', ', 
    c.post_town, ', ', 
    c.postcode ) 
    AS customer_full_address
FROM customer_addresses AS c
WHERE customer_address_id = 1;

-- using CHAR_LENGTH built-in function to display number of characters of each customer's phone number as a quick way to check if it's of expected length
SELECT 
	customer_id, 
    customer_phone_number, 
    CHAR_LENGTH(customer_phone_number) AS phone_number_length
FROM customers
ORDER BY customer_id;

-- based on that query checking if there are customers where phone numbers length isn't 11
-- I'll add some some extra data first, so that the query displays some results
INSERT INTO customers (customer_id, customer_first_name, customer_last_name, customer_email_address, customer_phone_number)
VALUES
    (11, 'Roberta', 'Rock', 'roberta.rock@example.com', '1'),
    (12, 'Bob', 'Smith', 'bob.smith@example.com', NULL);

-- query that will display customers where phone number's lenght isn't 11 or the value is NULL. 
-- this way we can have a list of customers who didn't add a phone number or added an incorrect one
-- this is correct with table constraints as there's no constraint on customer_phone_number because it's not required for any operations
-- the query could be used if I wanted to add that constraint in the future
SELECT 
	customer_id, 
    customer_phone_number, 
    CHAR_LENGTH(customer_phone_number) AS phone_number_length
FROM customers
WHERE CHAR_LENGTH(customer_phone_number) != 11
OR customer_phone_number IS NULL
ORDER BY customer_id;

