-- table customers
INSERT INTO customers (customer_id, customer_first_name, customer_last_name, customer_email_address, customer_phone_number)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '1234 567890'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '9876 543210'),
    (3, 'David', 'Wilson', 'david.wilson@example.com', '7654 321098'),
    (4, 'Sarah', 'Brown', 'sarah.brown@example.com', '2345 678901'),
    (5, 'Michael', 'Taylor', 'michael.taylor@example.com', '8765 432109'),
    (6, 'Emily', 'Johnson', 'emily.johnson@example.com', '3456 789012'),
    (7, 'James', 'Anderson', 'james.anderson@example.com', '6543 210987'),
    (8, 'Olivia', 'Clark', 'olivia.clark@example.com', '1234 567890'),
    (9, 'William', 'Bow', 'william.bow@example.com', '9876 543210'),
    (10, 'Sophia', 'Lee', 'sophia.lee@example.com', '7654 321098');
    
-- table customer_addresses    
INSERT INTO customer_addresses (customer_address_id, customer_id, building_num_or_name, street_name, post_town, postcode)
VALUES
    (1, 1, '12', 'High Street', 'London', 'SW1A 1AA'),
    (2, 2, '45', 'Park Avenue', 'Manchester', 'M1 2AB'),
    (3, 3, '78', 'Baker Street', 'Birmingham', 'B2 3CD'),
    (4, 4, '33', 'Church Road', 'Liverpool', 'L3 4EF'),
    (5, 5, '56A', 'Main Street', 'Edinburgh', 'EH1 5FG'),
    (6, 6, '8', 'Queensway', 'Glasgow', 'G2 6HI'),
    (7, 7, '22', 'Market Square', 'Leeds', 'LS1 7JK'),
    (8, 8, '14', 'Green Lane', 'Bristol', 'BS2 8LM'),
    (9, 9, '67', 'Kings Road', 'Sheffield', 'S4 9NO'),
    (10, 10, '9', 'Elm Street', 'Newcastle', 'NE3 0PQ'),
	(11, 1, '25B', "Queen's Road", 'London', 'SW1B 2XY'),  -- second address for customer id 1
    (12, 2, '7', 'Hillside Lane', 'Manchester', 'M1 3YZ'); -- second address for customer id 2
    
-- table artists (based on characters from Spaced)
INSERT INTO artists (artist_id, artist_first_name, artist_last_name, artist_alias, artist_email_address, artist_phone_number, artist_bio)
VALUES
	(1, 'Tim', 'Bisley', 'Timbo', 'tim.bisley@example.com', '123 456 7890', 'A struggling comic book artist.'),
	(2, 'Daisy', 'Steenkamp', 'Daisy', 'daisy.steenkamp@example.com', '987 654 3210', 'An aspiring writer and aspiring everything else.'),
	(3, 'Brian', 'Topp', 'Brian', 'brian.topp@example.com', '765 432 1098', 'An eccentric artist.'),
	(4, 'Mike', 'Watt', 'Mike', 'mike.watt@example.com', '555 123 4567', 'A weapon enthusiast and lover of military hardware.'),
	(5, 'Marsha', 'Klein', 'Marsha', 'marsha.klein@example.com', '222 333 4444', 'A quirky landlady with a taste for alcohol.'),
	(6, 'Tyres', "O'Leary", 'Tyres', 'tyres.oleary@example.com', '777 888 9999', 'A hyperactive bicycle messenger.'),
	(7, 'Sophie', 'Challis', 'Sophie', 'sophie.challis@example.com', NULL, NULL),
	(8, 'Twist', 'Morgan', 'Twist', 'twist.morgan@example.com', '123 987 6543', 'Fashionable and trendy.'),
	(9, 'Duane', 'Benzie', 'Duane', 'duane.benzie@example.com', '987 654 1234', 'An eccentric conceptual artist.'),
	(10, 'Molly', 'Parker', 'Molly', 'molly.parker@example.com', '555 789 1234', 'A free-spirited musician and artist.');

-- table images (based on characters from Spaced)
-- Images for Tim Bisley (artist_id: 1)
INSERT INTO images (image_id, artist_id, image_title, image_description, image_url, image_creation_date)
VALUES
(1, 1, 'Comic Artwork', 'A comic book illustration', 'https://example.com/tim/comic1.jpg', '2023-03-15'),
(2, 1, 'Character Sketch', 'A character design sketch', 'https://example.com/tim/sketch1.jpg', '2023-04-20'),
(3, 1, 'Comic Cover', 'Cover art', 'https://example.com/tim/cover1.jpg', '2023-05-10');

-- Images for Daisy Steenkamp (artist_id: 2)
INSERT INTO images (image_id, artist_id, image_title, image_description, image_url, image_creation_date)
VALUES
(4, 2, 'Writing Inspiration', 'An inspirational writing space', 'https://example.com/daisy/writing.jpg', '2023-02-10'),
(5, 2, 'Author Portrait', "Author's profile picture", 'https://example.com/daisy/author.jpg', '2023-03-25');

-- Images for Brian Topp (artist_id: 3)
INSERT INTO images (image_id, artist_id, image_title, image_description, image_url, image_creation_date)
VALUES
(6, 3, 'Zombie Butterflies', 'An image of zombie butterflies', 'https://example.com/brian/exhibition.jpg', '2023-05-05'),
(14, 3, 'Abstract Painting', 'Brian''s abstract artwork', 'https://example.com/brian/abstract.jpg', '2023-06-10');

-- Images for Mike Watt (artist_id: 4)
INSERT INTO images (image_id, artist_id, image_title, image_description, image_url, image_creation_date)
VALUES
(7, 4, 'Weapons Collection', "Mike's collection of military weapons", 'https://example.com/mike/weapons1.jpg', '2023-04-01'),
(8, 4, 'Firearms Training', 'Mike practicing shooting', 'https://example.com/mike/firearms.jpg', '2023-05-12');

-- Images for Marsha Klein (artist_id: 5)
INSERT INTO images (image_id, artist_id, image_title, image_description, image_url, image_creation_date)
VALUES
(9, 5, 'Pub Night', 'Marsha enjoying a night at the pub', 'https://example.com/marsha/pub.jpg', '2023-03-20');

-- Images for Tyres O'Leary (artist_id: 6)
INSERT INTO images (image_id, artist_id, image_title, image_description, image_url, image_creation_date)
VALUES
(10, 6, 'Bike Messenger', 'Tyres riding through the city', 'https://example.com/tyres/bike1.jpg', '2023-04-05'),
(11, 6, 'BMX Tricks', 'Tyres performing BMX tricks', 'https://example.com/tyres/bmx.jpg', '2023-05-15'),
(12, 6, 'Rave', 'Tyres on a rave', 'https://example.com/tyres/rave.jpg', '2023-06-05');

-- Images for Sophie Challis (artist_id: 7)
INSERT INTO images (image_id, artist_id, image_title, image_description, image_url, image_creation_date)
VALUES
(13, 7, 'Buttons', 'Colourful buttons', 'https://example.com/sophie/buttons.jpg', '2023-05-12'),
(15, 7, 'Portrait', "Sophie's artistic self-portrait", 'https://example.com/sophie/portrait.jpg', '2023-06-01');

-- Images for Twist Morgan (artist_id: 8)
INSERT INTO images (image_id, artist_id, image_title, image_description, image_url, image_creation_date)
VALUES
(16, 8, 'Fashion Photography', "Twist's fashion photography", 'https://example.com/twist/fashion1.jpg', '2023-06-05');

-- Images for Duane Benzie (artist_id: 9)
INSERT INTO images (image_id, artist_id, image_title, image_description, image_url, image_creation_date)
VALUES
(18, 9, 'Sarah', 'Portrait of Sarah', 'https://example.com/duane/sculpture.jpg', '2023-07-01');

-- table stock_items
INSERT INTO stock_items (stock_item_id, stock_item_name, stock_item_description, stock_item_cost, stock_item_price, stock_item_quantity_available)
VALUES
(1, 'mouse pad', 'mouse pad for your home office', 8.00, 17.50, 90),
(2, 'mug', 'classic mug for your cuppa', 4.00, 9.00, 20),
(3, 'hardcover journal', 'A5 size hardcover journal', 7.00, 15.00, 51),
(4, 'tote bag', 'cotton tote bag', 6.50, 14.50, 120),
(5, 'face mask', 'adult size face mask', 3.00, 6.00, 48),
(6, 'kids mask', 'kid size face mask', 2.00, 5.00, 89),
(7, 'scarf', 'cotton scarf', 10.00, 24.50, 37),
(8, 'passport cover', 'cover for one passport', 2.00, 6.50, 99),
(9, 'water bottle', 'aluminium water bottle', 5.00, 11.00, 49),
(10, 'throw blanket', 'king size blanket', 20.00, 38.00, 67);

INSERT INTO order_statuses (order_status_id, order_status_name) VALUES
    (1, 'Pending'),
    (2, 'Processing'),
    (3, 'Shipped'),
    (4, 'Delivered'),
    (5, 'Cancelled');
    
-- table customer_orders    
-- Delivered Orders (10)
INSERT INTO customer_orders (customer_order_id, customer_id, customer_address_id, customer_order_date, order_status_id)
VALUES
    (1, 1, 1, '2023-07-10', 4),
    (2, 2, 2, '2023-07-15', 4),
    (3, 3, 3, '2023-07-20', 4),
    (4, 4, 4, '2023-07-25', 4), 
    (5, 5, 5, '2023-07-30', 4),
    (6, 6, 6, '2023-08-05', 4),
    (7, 7, 7, '2023-08-10', 4),
    (8, 8, 8, '2023-08-15', 4), 
    (9, 9, 9, '2023-08-20', 4),
    (10, 10, 10, '2023-08-25', 4);

-- Processing Order (1)
INSERT INTO customer_orders (customer_order_id, customer_id, customer_address_id, customer_order_date, order_status_id)
VALUES
    (11, 1, 11, '2023-09-01', 2);

-- Shipped Orders (2)
INSERT INTO customer_orders (customer_order_id, customer_id, customer_address_id, customer_order_date, order_status_id)
VALUES
    (12, 2, 12, '2023-09-03', 5),
    (13, 3, 3, '2023-09-05', 5);

-- Pending Order (1)
INSERT INTO customer_orders (customer_order_id, customer_id, customer_address_id, customer_order_date, order_status_id)
VALUES
    (14, 4, 4, '2023-09-06', 1);

-- Cancelled Order (1)
INSERT INTO customer_orders (customer_order_id, customer_id, customer_address_id, customer_order_date, order_status_id)
VALUES
    (15, 5, 5, '2023-08-15', 3);   -- Cancelled

-- before inserting data into order_items, I'm creating a function that will calculate commission of each row in order_items
-- creating a function that will calculate artist's commission based on order quantity and price
DELIMITER //
CREATE FUNCTION set_commission_rate (
	quantity INT) -- items quantity is a parameter
RETURNS DECIMAL(6, 2) -- the function will return commission rate
DETERMINISTIC 
BEGIN
    DECLARE artist_commission_rate DECIMAL(6, 2);
    IF quantity >= 5 THEN
		SET artist_commission_rate = 0.1; -- 10% commission if 5 or more items ordered
	ELSEIF (quantity >= 3 AND quantity <= 4) THEN
		SET artist_commission_rate = 0.09; -- 9% commission if 3 or 4 items ordered
	ELSEIF quantity < 3 THEN	
		SET artist_commission_rate = 0.08; -- 8% commission if fewer than 3 items ordered
	END IF;
    RETURN (artist_commission_rate);
END//
DELIMITER ;

-- table order_items
INSERT INTO order_items (order_item_id, customer_order_id, image_id, stock_item_id, quantity, item_unit_price, artist_commission_rate)
VALUES
    (1, 1, 1, 1, 3, 17.50, set_commission_rate(quantity)),
    (2, 1, 2, 2, 2, 9.00, set_commission_rate(quantity)),
    (3, 2, 3, 3, 1, 15.00, set_commission_rate(quantity)),
    (4, 3, 4, 4, 4, 14.50, set_commission_rate(quantity)),
    (5, 4, 5, 5, 5, 6.00, set_commission_rate(quantity)),
    (6, 5, 6, 6, 3, 5.00, set_commission_rate(quantity)),
    (7, 6, 7, 7, 2, 24.50, set_commission_rate(quantity)),
    (8, 7, 8, 8, 1, 6.50, set_commission_rate(quantity)),
    (9, 8, 9, 9, 4, 11.00, set_commission_rate(quantity)),
    (10, 9, 10, 10, 5, 38.00, set_commission_rate(quantity)),
    (11, 10, 11, 1, 2, 17.50, set_commission_rate(quantity)),
    (12, 11, 12, 2, 3, 9.00, set_commission_rate(quantity)),
    (13, 12, 13, 3, 1, 15.00, set_commission_rate(quantity)),
    (14, 13, 14, 4, 2, 14.50, set_commission_rate(quantity)),
    (15, 14, 15, 5, 4, 6.00, set_commission_rate(quantity)),
    (16, 15, 1, 6, 5, 5.00, set_commission_rate(quantity)),
    (17, 1, 2, 7, 3, 24.50, set_commission_rate(quantity)),
    (18, 2, 3, 8, 2, 6.50, set_commission_rate(quantity)),
    (19, 3, 4, 9, 1, 11.00, set_commission_rate(quantity)),
    (20, 4, 5, 10, 4, 38.00, set_commission_rate(quantity)),
    (21, 5, 6, 1, 3, 17.50, set_commission_rate(quantity)),
    (22, 6, 7, 2, 2, 9.00, set_commission_rate(quantity)),
    (23, 7, 8, 3, 1, 15.00, set_commission_rate(quantity)),
    (24, 8, 9, 4, 4, 14.50, set_commission_rate(quantity)),
    (25, 9, 10, 5, 5, 6.00, set_commission_rate(quantity)),
    (26, 10, 11, 6, 3, 5.00, set_commission_rate(quantity)),
    (27, 1, 12, 7, 2, 24.50, set_commission_rate(quantity)),
    (28, 2, 13, 8, 1, 6.50, set_commission_rate(quantity)),
    (29, 3, 14, 9, 4, 11.00, set_commission_rate(quantity)),
    (30, 4, 15, 10, 5, 38.00, set_commission_rate(quantity));

-- table stock orders
INSERT INTO stock_orders (stock_order_id, stock_item_id, stock_order_date, stock_order_quantity, stock_order_total, order_status_id)
VALUES
    (1, 1, '2023-06-05', 50, 400.00, 4),
    (2, 2, '2023-06-15', 50, 200.00, 4),
    (3, 3, '2023-07-10', 50, 350.00, 4),
    (4, 4, '2023-07-15', 50, 325.00, 4),
    (5, 5, '2023-08-05', 50, 150.00, 4),
    (6, 6, '2023-08-15', 50, 100.00, 4),
    (7, 7, '2023-09-01', 50, 500.00, 4),
    (8, 8, '2023-09-02', 50, 100.00, 4),
    (9, 9, '2023-09-03', 50, 250.00, 4),
    (10, 10, '2023-09-04', 50, 1000.00, 4),
    (11, 1, '2023-09-05', 50, 400.00, 4),
    (12, 2, '2023-09-06', 50, 200.00, 4),
    (13, 3, '2023-09-07', 50, 350.00, 4),
    (14, 4, '2023-09-08', 50, 325.00, 4),
    (15, 5, '2023-09-09', 50, 150.00, 4),
    (16, 6, '2023-09-10', 50, 100.00, 4),
    (17, 7, '2023-09-11', 50, 500.00, 4),
    (18, 8, '2023-09-12', 50, 100.00, 4),
    (19, 9, '2023-09-13', 50, 250.00, 4),
    (20, 10, '2023-09-14', 50, 1000.00, 4),
    (21, 1, '2023-09-15', 50, 400.00, 4),
    (22, 2, '2023-09-16', 50, 200.00, 4),
    (23, 3, '2023-09-17', 50, 350.00, 4),
    (24, 4, '2023-09-18', 50, 325.00, 4),
    (25, 5, '2023-09-19', 50, 150.00, 4),
    (26, 6, '2023-09-20', 50, 100.00, 4),
    (27, 7, '2023-09-21', 50, 500.00, 4),
    (28, 8, '2023-09-22', 50, 100.00, 4),
    (29, 9, '2023-09-23', 50, 250.00, 4),
    (30, 2, '2023-10-03', 50, 200, 3);
