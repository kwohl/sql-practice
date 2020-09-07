-- COMPLEX JOINS

-- Produce a report that lists every dealership, the number of purchases done by each, and the number of leases done by each.

SELECT d.business_name, COUNT(sp.sales_type_id) as purchase_number, COUNT(sl.sales_type_id) as lease_number
FROM dealerships d
LEFT JOIN sales sp ON d.dealership_id = sp.dealership_id
AND sp.sales_type_id = 1
LEFT JOIN sales sl ON d.dealership_id = sl.dealership_id
AND sl.sales_type_id = 2
GROUP BY d.business_name;

-- Produce a report that determines the most popular vehicle model that is leased.
SELECT vm.name as model, COUNT (vm.name) as number_leased
FROM vehiclemodels vm
JOIN vehicletypes vt ON vm.vehicle_model_id = vt.model_id
JOIN vehicles v ON vt.vehicle_type_id = v.vehicle_type_id
JOIN sales s ON v.vehicle_id = s.vehicle_id
JOIN salestypes st ON s.sales_type_id = st.sales_type_id
AND st.sales_type_id = 2
GROUP BY vm.name
ORDER BY number_leased DESC;

-- What is the most popular vehicle make in terms of number of sales?
SELECT vm.name as make, COUNT (vm.name) as number_sold
FROM vehiclemakes vm
JOIN vehicletypes vt ON vm.vehicle_make_id = vt.make_id
JOIN vehicles v ON vt.vehicle_type_id = v.vehicle_type_id
JOIN sales s ON v.vehicle_id = s.vehicle_id
JOIN salestypes st ON s.sales_type_id = st.sales_type_id
AND st.sales_type_id = 2
GROUP BY vm.name
ORDER BY number_sold DESC;

-- Which employee type sold the most of that make?
