-- This is a database for an online shop dedicated to selling print-on artwork.
-- It's for artists who want to sell their graphic designs as prints on variety of items.
-- This database has tables for artists, and their images, customers, customer orders,
-- stock of blank items ready for art to be printed on them, stock ordering

-- create database for a UK online shop dedicated to selling print-on artwork
CREATE DATABASE art_print_final;

USE art_print_final;

-- table with customer details, email address set to be unique for each customer to avoid duplicates
CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
    customer_first_name VARCHAR(100) NOT NULL,
    customer_last_name VARCHAR(100) NOT NULL,
    customer_email_address VARCHAR(100) UNIQUE NOT NULL,
    customer_phone_number VARCHAR(20)
);

-- separate table for customer addresses so that one customer can have multiple addresses
CREATE TABLE customer_addresses(
	customer_address_id INT PRIMARY KEY,
	customer_id INT NOT NULL, -- this will be foreign key to table customers
    building_num_or_name VARCHAR(50) NOT NULL,
    street_name VARCHAR(100) NOT NULL,
    post_town VARCHAR(100) NOT NULL,
    postcode VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- table with details of artists who create the artwork images, email address is set to UNIQUE
CREATE TABLE artists(
	artist_id INT PRIMARY KEY,
	artist_first_name VARCHAR(100) NOT NULL,
    artist_last_name VARCHAR(100) NOT NULL,
    artist_alias VARCHAR(100) UNIQUE,
    artist_email_address VARCHAR(100) UNIQUE NOT NULL,
    artist_phone_number VARCHAR(20),
    artist_bio VARCHAR(200)
);

-- table listing the artwork images created by artists
CREATE TABLE images(
	image_id INT PRIMARY KEY,
    artist_id INT NOT NULL, -- this will be foreign key to table artists
    image_title VARCHAR(100) NOT NULL,
    image_description VARCHAR(200),
    image_url VARCHAR(100) NOT NULL UNIQUE, -- url address of where the image is stored
    image_creation_date DATE NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- table of blank stock items, on which the images can be printed, such as mugs, coasters, water bottles
CREATE TABLE stock_items(
	stock_item_id INT PRIMARY KEY,
    stock_item_name VARCHAR(100) UNIQUE NOT NULL,
    stock_item_description VARCHAR(200),
    stock_item_cost DECIMAL(6, 2) NOT NULL, -- it's the cost of the item for stock orders
    stock_item_price DECIMAL(6, 2) NOT NULL, -- it's the selling price for customer orders
    stock_item_quantity_available INT NOT NULL
);

-- create table with order statuses which then can be refrenced in both customer orders and stock orders tables
CREATE TABLE order_statuses(
	order_status_id INT PRIMARY KEY,
    order_status_name VARCHAR(50) UNIQUE NOT NULL
);

-- table of customer orders, it will store information about customer oders for artwork
-- the table doesn't include total amount because that will be combination of prices of all items ordered 
-- those items and their prices are stored in order_items table
CREATE TABLE customer_orders(
	customer_order_id INT PRIMARY KEY,
    customer_id INT NOT NULL, -- this will be foreign key to table customers
    customer_address_id INT NOT NULL, -- this will be foreign key to table customer addresses
    customer_order_date DATE NOT NULL,
    order_status_id INT DEFAULT 1, -- this will be foreign key to table order_statuses, 1 will be "pending" which is the default value
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (customer_address_id) REFERENCES customer_addresses(customer_address_id),
    FOREIGN KEY (order_status_id) REFERENCES order_statuses(order_status_id)
);

-- table for specific items ordered by customer orders, this will track the stock used, images used, the prices at the time of order, and commission rate
CREATE TABLE order_items(
	order_item_id INT PRIMARY KEY,
    customer_order_id INT NOT NULL, -- this will be foreign key to table customer_orders
    image_id INT NOT NULL, -- this will be foreign key to table images
    stock_item_id INT NOT NULL, -- this will be foreign key to talbe stock_items
    quantity INT NOT NULL,
    -- There's already price at stock_items table, but as it can change in the future, I am adding price here to track historic prices
    item_unit_price DECIMAL(6, 2) NOT NULL,
    artist_commission_rate DECIMAL(6, 2) NOT NULL, -- later I will create a function that can set commission rate based on quantity of items ordered
    CONSTRAINT check_quantity CHECK (quantity > 0), -- adding CHECK constraint to make sure quantity is not below 1
	FOREIGN KEY (customer_order_id) REFERENCES customer_orders(customer_order_id),
    FOREIGN KEY (image_id) REFERENCES images(image_id),
    FOREIGN KEY (stock_item_id) REFERENCES stock_items(stock_item_id)
);

-- create table for orders of stock items
CREATE TABLE stock_orders(
	stock_order_id INT PRIMARY KEY,
    stock_item_id INT NOT NULL, -- this will be foreign key to table stock_items
    stock_order_date DATE NOT NULL,
    stock_order_quantity INT NOT NULL,
    stock_order_total DECIMAL(6, 2) NOT NULL, -- the total here is to have a record of cost at the time of order should it change in the future
    order_status_id INT DEFAULT 1, -- this will be foreign key to table order_statuses, 1 will be "pending" which is the default value
    CONSTRAINT check_stock_quantity CHECK (stock_order_quantity > 0), -- adding CHECK constraint to make sure quantity is not below 1
    FOREIGN KEY (stock_item_id) REFERENCES stock_items(stock_item_id),
    FOREIGN KEY (order_status_id) REFERENCES order_statuses(order_status_id)
);
	