-- JOINING TABLES

-- Get a list of the sales that was made for each sales type.
SELECT name, invoice_number, price
FROM salestypes
LEFT JOIN sales
ON salestypes.sales_type_id = sales.sales_type_id
ORDER BY name ASC;

-- Get a list of sales with the VIN of the vehicle, the first name and last name of the customer, first name and last name of the employee who made the sale and the name, city and state of the dealership.
SELECT v.vin, c.first_name as customer_first_name, c.last_name as customer_last_name, e.first_name as employee_first_name, e.last_name as employee_last_name, d.business_name, d.city, d.state
FROM sales s
LEFT JOIN vehicles v ON s.vehicle_id = v.vehicle_id
LEFT JOIN employees e ON s.employee_id = e.employee_id
LEFT JOIN customers c ON s.customer_id = c.customer_id
LEFT JOIN dealerships d ON s.dealership_id = d.dealership_id;

-- Get a list of all the dealerships and the employees, if any, working at each one.
SELECT d.business_name, e.first_name, e.last_name
FROM dealerships d
LEFT JOIN dealershipemployees de
ON d.dealership_id = de.dealership_id
LEFT JOIN employees e
ON de.employee_id = e.employee_id
ORDER BY d.business_name ASC;

-- Get a list of vehicles with the names of the body type, make, model and color.
SELECT vbt.name as body_type, vma.name as make, vmo.name as model, v.exterior_color as color
FROM vehicles v
LEFT JOIN vehicletypes vt
ON v.vehicle_type_id = vt.vehicle_type_id
LEFT JOIN vehiclebodytypes vbt
ON vt.body_type_id = vbt.vehicle_body_type_id
LEFT JOIN vehiclemakes vma
ON vt.make_id = vma.vehicle_make_id
LEFT JOIN vehiclemodels vmo
ON vt.model_id = vmo.vehicle_model_id;