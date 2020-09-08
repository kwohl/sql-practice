-- EMPLOYEE REPORTS

-- How many emloyees are there for each role?
SELECT et.name as employee_type, COUNT (e.employee_id) as number_of_employees
FROM employeetypes et
LEFT JOIN employees e ON et.employee_type_id = e.employee_type_id
GROUP BY et.name
ORDER BY number_of_employees;

-- How many finance managers work at each dealership?
SELECT et.name as employee_type, COUNT (e.employee_id) as number_of_employees
FROM employeetypes et
LEFT JOIN employees e ON et.employee_type_id = e.employee_type_id
WHERE et.name = 'Finance Manager'
GROUP BY et.name
ORDER BY number_of_employees;

-- Get the names of the top 3 employees who work shifts at the most dealerships?
SELECT CONCAT (e.first_name, ' ', e.last_name) as employee_name, COUNT (d.dealership_id) as number_of_dealerships
FROM employees e
JOIN dealershipemployees de ON e.employee_id = de.employee_id
JOIN dealerships d ON de.dealership_id = d.dealership_id
GROUP BY employee_name
ORDER BY number_of_dealerships DESC
LIMIT 3;

-- Get a report on the top two employees who has made the most sales through leasing vehicles.
SELECT CONCAT (e.first_name, ' ', e.last_name) as employee_name, COUNT (s.sale_id) as number_of_lease_sales
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
WHERE s.sales_type_id = 2
GROUP BY employee_name
ORDER BY number_of_lease_sales DESC
LIMIT 2;