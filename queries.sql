a) SELECT, WHERE, ORDER BY, GROUP BY

-- SELECT + WHERE
SELECT customerName, country
FROM customers
WHERE country = 'USA';

-- ORDER BY
SELECT customerName, creditLimit
FROM customers
ORDER BY creditLimit DESC;

-- GROUP BY
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;

b) JOINS (INNER, LEFT, RIGHT)

-- INNER JOIN
SELECT customers.customerName, orders.orderNumber
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber;

-- LEFT JOIN
SELECT customers.customerName, orders.orderNumber
FROM customers
LEFT JOIN orders
ON customers.customerNumber = orders.customerNumber;

-- RIGHT JOIN
SELECT customers.customerName, orders.orderNumber
FROM customers
RIGHT JOIN orders
ON customers.customerNumber = orders.customerNumber;

c) SUBQUERY

SELECT customerName
FROM customers
WHERE customerNumber IN (
    SELECT customerNumber
    FROM orders
    GROUP BY customerNumber
    HAVING COUNT(orderNumber) > 5
);


d) AGGREGATE FUNCTIONS (SUM, AVG)

-- Total sales
SELECT SUM(amount) AS total_sales
FROM payments;

-- Average payment
SELECT AVG(amount) AS avg_payment
FROM payments;

e) CREATE VIEW

CREATE VIEW customer_orders AS
SELECT customers.customerName, orders.orderNumber
FROM customers
JOIN orders
ON customers.customerNumber = orders.customerNumber;

f) CREATE INDEX (Optimization)

CREATE INDEX idx_customerNumber
ON orders(customerNumber);

