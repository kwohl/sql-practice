-- CARNIVAL SALES
-- Practices with aggregation, subqueries, and CTE

-- Write a query that shows the total purchase sales income per dealership.
SELECT d.business_name, SUM (s.price) as total_purchase_sales
FROM dealerships d
LEFT JOIN sales s on d.dealership_id = s.dealership_id
WHERE s.sales_type_id = 1
GROUP BY d.business_name
ORDER BY d.business_name;

-- Write a query that shows the purchase sales income per dealership for the current month.
SELECT d.business_name, SUM (s.price) as total_purchase_sales
FROM dealerships d
LEFT JOIN sales s on d.dealership_id = s.dealership_id
WHERE s.sales_type_id = 1
AND s.purchase_date > '2020-08-31'
GROUP BY d.business_name
ORDER BY d.business_name;

-- Write a query that shows the purchase sales income per dealership for the current year.
SELECT d.business_name, SUM (s.price) as total_purchase_sales
FROM dealerships d
LEFT JOIN sales s on d.dealership_id = s.dealership_id
WHERE s.sales_type_id = 1
AND s.purchase_date > '2019-12-31'
GROUP BY d.business_name
ORDER BY d.business_name;

-- Write a query that shows the total lease income per dealership.
SELECT d.business_name, SUM (s.price) as total_lease_sales
FROM dealerships d
LEFT JOIN sales s on d.dealership_id = s.dealership_id
WHERE s.sales_type_id = 2
GROUP BY d.business_name
ORDER BY d.business_name;

-- Write a query that shows the lease income per dealership for the current month.
SELECT d.business_name, SUM (s.price) as total_lease_sales
FROM dealerships d
LEFT JOIN sales s on d.dealership_id = s.dealership_id
WHERE s.sales_type_id = 2
AND s.purchase_date > '2020-08-31'
GROUP BY d.business_name
ORDER BY d.business_name;

-- Write a query that shows the lease income per dealership for the current year.
SELECT d.business_name, SUM (s.price) as total_lease_sales
FROM dealerships d
LEFT JOIN sales s on d.dealership_id = s.dealership_id
WHERE s.sales_type_id = 2
AND s.purchase_date > '2019-12-31'
GROUP BY d.business_name
ORDER BY d.business_name;

-- Write a query that shows the total income (purchase and lease) per employee.
SELECT CONCAT (e.first_name, ' ', e.last_name) as employee_name, SUM (s.price) as total_income
FROM employees e
LEFT JOIN sales s on e.employee_id = s.employee_id
GROUP BY employee_name
ORDER BY total_income DESC;