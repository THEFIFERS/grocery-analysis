CREATE DATABASE GroceryStoreDB;
USE GroceryStoreDB;

CREATE TABLE IF NOT EXISTS supplier (
    sup_id TINYINT PRIMARY KEY,
    sup_name VARCHAR(255),
    address TEXT
);

CREATE TABLE IF NOT EXISTS categories (
    cat_id TINYINT PRIMARY KEY,
    cat_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS employees (
    emp_id TINYINT PRIMARY KEY,
    emp_name VARCHAR(255),
    hire_date VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS customers (
    cust_id SMALLINT PRIMARY KEY,
    cust_name VARCHAR(255),
    address TEXT
);

CREATE TABLE IF NOT EXISTS products (
    prod_id TINYINT PRIMARY KEY,
    prod_name VARCHAR(255),
    sup_id TINYINT,
    cat_id TINYINT,
    price DECIMAL(10,2),
    FOREIGN KEY (sup_id) REFERENCES supplier(sup_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (cat_id) REFERENCES categories(cat_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS orders (
    ord_id SMALLINT PRIMARY KEY,
    cust_id SMALLINT,
    emp_id TINYINT,
    order_date VARCHAR(255),
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
          FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS order_details (
    ord_detID SMALLINT AUTO_INCREMENT PRIMARY KEY,
    ord_id SMALLINT,
    prod_id TINYINT,
    quantity TINYINT,
    each_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    FOREIGN KEY (ord_id) REFERENCES orders(ord_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (prod_id) REFERENCES products(prod_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO supplier (sup_id, sup_name, address) VALUES
(1, 'Aarav Sharma', '33 Main Street, Madhya Pradesh, India'),
(2, 'Sai ', '108 Main Street, Telangana, India'),
(3, 'Aarya', '166 Main Street, Uttar Pradesh, India'),
(4, 'Suresh', '163 Main Street, Andhra Pradesh, India'),
(5, 'Karthik', '182 Main Street, West Bengal, India');

INSERT INTO categories (cat_id, cat_name) VALUES
(1, 'Beverages'),
(2, 'Snacks'),
(3, 'Dairy'),
(4, 'Bakery'),
(5, 'Fruits & Vegetables'),
(6, 'Frozen Foods'),
(7, 'Personal Care'),
(8, 'Household Items');
INSERT INTO employees (emp_id, emp_name, hire_date) VALUES
(1, 'Aarav Kumar 1', '2/3/2021'),
(2, 'Aditya Singh 1', '1/8/2021'),
(3, 'Pari Kumar 1', '11/12/2021'),
(4, 'Aditya Verma 1', '1/9/2021'),
(5, 'Pari Sharma 1', '2/9/2021'),
(6, 'Zara Verma 1', '10/16/2021'),
(7, 'Vihaan Singh 1', '8/26/2020'),
(8, 'Diya Sharma 1', '8/21/2021'),
(9, 'Arjun Kumar 1', '5/29/2021'),
(10, 'Arjun Verma 1', '4/14/2021');

INSERT INTO customers (cust_id, cust_name, address) VALUES
(1, 'Amit Sharma', 'Hyderabad, Telangana'),
(2, 'Priya Reddy', 'Bangalore, Karnataka'),
(3, 'Rahul Verma', 'Mumbai, Maharashtra'),
(4, 'Sneha Kapoor', 'Delhi, India'),
(5, 'Arjun Singh', 'Chennai, Tamil Nadu'),
(6, 'Neha Gupta', 'Pune, Maharashtra'),
(7, 'Kiran Kumar', 'Hyderabad, Telangana'),
(8, 'Anjali Mehta', 'Ahmedabad, Gujarat'),
(9, 'Vikram Rao', 'Vijayawada, Andhra Pradesh'),
(10, 'Pooja Nair', 'Kochi, Kerala');

INSERT INTO products (prod_id, prod_name, sup_id, cat_id, price) VALUES
(1, 'Coca Cola 1L', 1, 1, 45.00),
(2, 'Pepsi 500ml', 1, 1, 30.00),
(3, 'Lays Chips', 2, 2, 20.00),
(4, 'Kurkure', 2, 2, 25.00),
(5, 'Amul Milk 1L', 3, 3, 60.00),
(6, 'Paneer 200g', 3, 3, 80.00),
(7, 'Brown Bread', 4, 4, 40.00),
(8, 'Cake Slice', 4, 4, 50.00),
(9, 'Apple 1kg', 5, 5, 120.00),
(10, 'Banana Dozen', 5, 5, 60.00),
(11, 'Frozen Peas', 6, 6, 90.00),
(12, 'Ice Cream', 6, 6, 150.00),
(13, 'Shampoo', 7, 7, 180.00),
(14, 'Soap Pack', 7, 7, 70.00),
(15, 'Detergent Powder', 8, 8, 220.00);

INSERT INTO supplier (sup_id, sup_name, address) VALUES
(1, 'Coca Cola Supplier', 'Hyderabad'),
(2, 'Snack Distributor', 'Mumbai'),
(3, 'Dairy Supplier', 'Gujarat'),
(4, 'Bakery Supplier', 'Delhi'),
(5, 'Fruits Supplier', 'Vijayawada'),
(6, 'Frozen Foods Supplier', 'Bangalore'),
(7, 'Personal Care Supplier', 'Chennai'),
(8, 'Household Supplier', 'Pune');

INSERT INTO supplier (sup_id, sup_name, address) VALUES
(6, 'Frozen Foods Supplier', 'Bangalore'),
(7, 'Personal Care Supplier', 'Chennai'),
(8, 'Household Supplier', 'Pune');
SELECT * FROM categories;
INSERT INTO orders (ord_id, cust_id, emp_id, order_date) VALUES
(1, 1, 1, '2023-01-10'),
(2, 2, 1, '2023-01-12'),
(3, 3, 2, '2023-01-15'),
(4, 4, 2, '2023-01-18'),
(5, 5, 3, '2023-02-01'),
(6, 6, 3, '2023-02-05'),
(7, 7, 4, '2023-02-10'),
(8, 8, 4, '2023-02-12'),
(9, 9, 5, '2023-03-01'),
(10, 10, 5, '2023-03-05');

INSERT INTO order_details (ord_id, prod_id, quantity, each_price, total_price) VALUES
(1, 1, 2, 45.00, 90.00),
(1, 3, 1, 20.00, 20.00),

(2, 2, 3, 30.00, 90.00),
(2, 4, 2, 25.00, 50.00),

(3, 5, 1, 60.00, 60.00),
(3, 6, 2, 80.00, 160.00),

(4, 7, 1, 40.00, 40.00),
(4, 8, 2, 50.00, 100.00),

(5, 9, 2, 120.00, 240.00),
(5, 10, 1, 60.00, 60.00),

(6, 11, 2, 90.00, 180.00),
(6, 12, 1, 150.00, 150.00),

(7, 13, 1, 180.00, 180.00),
(7, 14, 2, 70.00, 140.00),

(8, 15, 1, 220.00, 220.00),
(8, 1, 2, 45.00, 90.00),

(9, 2, 1, 30.00, 30.00),
(9, 3, 3, 20.00, 60.00),

(10, 4, 2, 25.00, 50.00),
(10, 5, 1, 60.00, 60.00);
SELECT * FROM orders;
SELECT * FROM products;
SELECT COUNT(DISTINCT cust_id) AS total_customers
FROM orders;
SELECT c.cust_name, COUNT(o.ord_id) AS total_orders
FROM customers c
JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_name
ORDER BY total_orders DESC;
SELECT c.cust_name,
       SUM(od.total_price) AS total_spent,
       AVG(od.total_price) AS avg_spent
FROM customers c
JOIN orders o ON c.cust_id = o.cust_id
JOIN order_details od ON o.ord_id = od.ord_id
GROUP BY c.cust_name;
SELECT c.cust_name,
       SUM(od.total_price) AS total_spent
FROM customers c
JOIN orders o ON c.cust_id = o.cust_id
JOIN order_details od ON o.ord_id = od.ord_id
GROUP BY c.cust_name
ORDER BY total_spent DESC
LIMIT 5;
SELECT cat.cat_name, COUNT(p.prod_id) AS total_products
FROM categories cat
LEFT JOIN products p ON cat.cat_id = p.cat_id
GROUP BY cat.cat_name;
SELECT cat.cat_name, AVG(p.price) AS avg_price
FROM categories cat
JOIN products p ON cat.cat_id = p.cat_id
GROUP BY cat.cat_name;
SELECT p.prod_name, SUM(od.quantity) AS total_quantity
FROM products p
JOIN order_details od ON p.prod_id = od.prod_id
GROUP BY p.prod_name
ORDER BY total_quantity DESC;

SELECT p.prod_name, SUM(od.total_price) AS total_revenue
FROM products p
JOIN order_details od ON p.prod_id = od.prod_id
GROUP BY p.prod_name
ORDER BY total_revenue DESC;
SELECT cat.cat_name, s.sup_name,
       SUM(od.total_price) AS total_sales
FROM order_details od
JOIN products p ON od.prod_id = p.prod_id
JOIN categories cat ON p.cat_id = cat.cat_id
JOIN supplier s ON p.sup_id = s.sup_id
GROUP BY cat.cat_name, s.sup_name
ORDER BY total_sales DESC;
SELECT COUNT(*) AS total_orders
FROM orders;
SELECT AVG(order_total) AS avg_order_value
FROM (
    SELECT ord_id, SUM(total_price) AS order_total
    FROM order_details
    GROUP BY ord_id
) t;
SELECT order_date, COUNT(*) AS total_orders
FROM orders
GROUP BY order_date
ORDER BY total_orders DESC;
SELECT 
    MONTH(STR_TO_DATE(order_date, '%Y-%m-%d')) AS month,
    COUNT(ord_id) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;
SELECT 
    MONTH(STR_TO_DATE(o.order_date, '%Y-%m-%d')) AS month,
    COUNT(DISTINCT o.ord_id) AS total_orders,
    SUM(od.total_price) AS total_revenue
FROM orders o
JOIN order_details od ON o.ord_id = od.ord_id
GROUP BY month
ORDER BY month;
SELECT 
    CASE 
        WHEN DAYOFWEEK(STR_TO_DATE(order_date, '%Y-%m-%d')) IN (1,7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS total_orders
FROM orders
GROUP BY day_type;
SELECT COUNT(*) FROM supplier;

SELECT s.sup_name, COUNT(p.prod_id) AS total_products
FROM supplier s
JOIN products p ON s.sup_id = p.sup_id
GROUP BY s.sup_name
ORDER BY total_products DESC;
SELECT s.sup_name, AVG(p.price) AS avg_price
FROM supplier s
JOIN products p ON s.sup_id = p.sup_id
GROUP BY s.sup_name;
SELECT s.sup_name, SUM(od.total_price) AS total_revenue
FROM supplier s
JOIN products p ON s.sup_id = p.sup_id
JOIN order_details od ON p.prod_id = od.prod_id
GROUP BY s.sup_name
ORDER BY total_revenue DESC;
SELECT COUNT(DISTINCT emp_id) FROM orders;
SELECT e.emp_name, COUNT(o.ord_id) AS total_orders
FROM employees e
JOIN orders o ON e.emp_id = o.emp_id
GROUP BY e.emp_name
ORDER BY total_orders DESC;

SELECT e.emp_name, SUM(od.total_price) AS total_sales
FROM employees e
JOIN orders o ON e.emp_id = o.emp_id
JOIN order_details od ON o.ord_id = od.ord_id
GROUP BY e.emp_name;
SELECT e.emp_name,
       AVG(order_total) AS avg_order_value
FROM employees e
JOIN (
    SELECT o.emp_id, od.ord_id, SUM(od.total_price) AS order_total
    FROM orders o
    JOIN order_details od ON o.ord_id = od.ord_id
    GROUP BY o.emp_id, od.ord_id
) t ON e.emp_id = t.emp_id
GROUP BY e.emp_name;
GROUP BY quantity;
SELECT p.prod_name, AVG(od.quantity) AS avg_qty
FROM products p
JOIN order_details od ON p.prod_id = od.prod_id
GROUP BY p.prod_name;
SELECT prod_id,
       MIN(each_price) AS min_price,
       MAX(each_price) AS max_price
FROM order_details
GROUP BY prod_id;

SELECT COUNT(DISTINCT cust_id) AS total_customers
FROM orders;

SELECT c.cust_id, c.cust_name,
       SUM(od.total_price) AS total_spent
FROM customers c
JOIN orders o ON c.cust_id = o.cust_id
JOIN order_details od ON o.ord_id = od.ord_id
GROUP BY c.cust_id, c.cust_name
ORDER BY total_spent DESC
LIMIT 2;
SELECT AVG(customer_total) AS avg_customer_spend
FROM (
    SELECT c.cust_id,
           SUM(od.total_price) AS customer_total
    FROM customers c
    JOIN orders o ON c.cust_id = o.cust_id
    JOIN order_details od ON o.ord_id = od.ord_id
    GROUP BY c.cust_id
) t;

SELECT c.cust_name,
       COUNT(o.ord_id) AS total_orders
FROM customers c
JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_name
ORDER BY total_orders DESC;
