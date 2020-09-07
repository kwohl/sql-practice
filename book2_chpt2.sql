--FILTERING DATA

-- Write a query that returns the business name, city, state, and website for each dealership. Use an alias for the Dealerships table.
SELECT business_name, city, state, website
FROM dealerships d;

-- Write a query that returns the first name, last name, and email address of every customer. Use an alias for the Customers table.
SELECT first_name, last_name, email
FROM customers c;

-- Get a list of sales records where the sale was a lease.
SELECT * FROM sales
WHERE sales_type_id = 2;

-- Get a list of sales where the purchase date is within the last two years.
SELECT * FROM sales
WHERE purchase_date BETWEEN '2018-08-31' AND '2020-08-31';

-- Get a list of sales where the deposit was above 5000 or the customer payed with American Express.
SELECT * FROM sales
WHERE deposit > 5000 OR payment_method = 'americanexpress';

-- Get a list of employees whose first names start with "M" or ends with "E".
SELECT * FROM employees
WHERE first_name LIKE 'M%' OR first_name LIKE '%e';

-- Get a list of employees whose phone numbers have the 600 area code.
SELECT * FROM employees
WHERE phone LIKE '600%';
