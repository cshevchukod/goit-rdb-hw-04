USE goit_rdb_hw_03;

-- 4.1. Count the number of rows
SELECT COUNT(*) AS total_rows
FROM order_details AS od
INNER JOIN orders AS o
    ON od.order_id = o.id
INNER JOIN customers AS c
    ON o.customer_id = c.id
INNER JOIN products AS p
    ON od.product_id = p.id
INNER JOIN categories AS cat
    ON p.category_id = cat.id
INNER JOIN employees AS e
    ON o.employee_id = e.employee_id
INNER JOIN shippers AS sh
    ON o.shipper_id = sh.id
INNER JOIN suppliers AS s
    ON p.supplier_id = s.id;

-- 4.2. Replace INNER JOIN with LEFT JOIN
SELECT COUNT(*) AS total_rows
FROM order_details AS od
LEFT JOIN orders AS o
    ON od.order_id = o.id
LEFT JOIN customers AS c
    ON o.customer_id = c.id
LEFT JOIN products AS p
    ON od.product_id = p.id
LEFT JOIN categories AS cat
    ON p.category_id = cat.id
LEFT JOIN employees AS e
    ON o.employee_id = e.employee_id
LEFT JOIN shippers AS sh
    ON o.shipper_id = sh.id
LEFT JOIN suppliers AS s
    ON p.supplier_id = s.id;

-- 4.3. Filter by employee_id
SELECT *
FROM order_details AS od
INNER JOIN orders AS o
    ON od.order_id = o.id
INNER JOIN customers AS c
    ON o.customer_id = c.id
INNER JOIN products AS p
    ON od.product_id = p.id
INNER JOIN categories AS cat
    ON p.category_id = cat.id
INNER JOIN employees AS e
    ON o.employee_id = e.employee_id
INNER JOIN shippers AS sh
    ON o.shipper_id = sh.id
INNER JOIN suppliers AS s
    ON p.supplier_id = s.id
WHERE o.employee_id > 3 AND o.employee_id <= 10;

-- 4.4. Group by category
SELECT
    cat.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(od.quantity) AS average_quantity
FROM order_details AS od
INNER JOIN orders AS o
    ON od.order_id = o.id
INNER JOIN customers AS c
    ON o.customer_id = c.id
INNER JOIN products AS p
    ON od.product_id = p.id
INNER JOIN categories AS cat
    ON p.category_id = cat.id
INNER JOIN employees AS e
    ON o.employee_id = e.employee_id
INNER JOIN shippers AS sh
    ON o.shipper_id = sh.id
INNER JOIN suppliers AS s
    ON p.supplier_id = s.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
GROUP BY cat.name;

-- 4.5. Filter groups with average quantity > 21
SELECT
    cat.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(od.quantity) AS average_quantity
FROM order_details AS od
INNER JOIN orders AS o
    ON od.order_id = o.id
INNER JOIN customers AS c
    ON o.customer_id = c.id
INNER JOIN products AS p
    ON od.product_id = p.id
INNER JOIN categories AS cat
    ON p.category_id = cat.id
INNER JOIN employees AS e
    ON o.employee_id = e.employee_id
INNER JOIN shippers AS sh
    ON o.shipper_id = sh.id
INNER JOIN suppliers AS s
    ON p.supplier_id = s.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
GROUP BY cat.name
HAVING AVG(od.quantity) > 21;

-- 4.6. Sort by row count descending
SELECT
    cat.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(od.quantity) AS average_quantity
FROM order_details AS od
INNER JOIN orders AS o
    ON od.order_id = o.id
INNER JOIN customers AS c
    ON o.customer_id = c.id
INNER JOIN products AS p
    ON od.product_id = p.id
INNER JOIN categories AS cat
    ON p.category_id = cat.id
INNER JOIN employees AS e
    ON o.employee_id = e.employee_id
INNER JOIN shippers AS sh
    ON o.shipper_id = sh.id
INNER JOIN suppliers AS s
    ON p.supplier_id = s.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
GROUP BY cat.name
HAVING AVG(od.quantity) > 21
ORDER BY total_rows DESC;

-- 4.7. Skip the first row and return 4 rows
SELECT
    cat.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(od.quantity) AS average_quantity
FROM order_details AS od
INNER JOIN orders AS o
    ON od.order_id = o.id
INNER JOIN customers AS c
    ON o.customer_id = c.id
INNER JOIN products AS p
    ON od.product_id = p.id
INNER JOIN categories AS cat
    ON p.category_id = cat.id
INNER JOIN employees AS e
    ON o.employee_id = e.employee_id
INNER JOIN shippers AS sh
    ON o.shipper_id = sh.id
INNER JOIN suppliers AS s
    ON p.supplier_id = s.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
GROUP BY cat.name
HAVING AVG(od.quantity) > 21
ORDER BY total_rows DESC
LIMIT 4 OFFSET 1;