-- INVENTORY REPORTS
-- For these exercises, I interpreted 'inventory' to mean vehicles that have not been sold

-- Which model of vehicle has the lowest current inventory? This will help dealerships know which models the purchase from manufacturers.
SELECT mo.name as model, COUNT (mo.name) as inventory
FROM vehicles v
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclemodels mo ON vt.model_id = mo.vehicle_model_id
FULL JOIN sales s ON v.vehicle_id = s.vehicle_id
WHERE s.vehicle_id IS NULL
GROUP BY model
ORDER BY inventory ASC;

-- Which model of vehicle has the highest current inventory? This will help dealerships know which models are, perhaps, not selling.
SELECT mo.name as model, COUNT (mo.name) as inventory
FROM vehicles v
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclemodels mo ON vt.model_id = mo.vehicle_model_id
FULL JOIN sales s ON v.vehicle_id = s.vehicle_id
WHERE s.vehicle_id IS NULL
GROUP BY model
ORDER BY inventory DESC;

-- Which dealerships are currently selling the least number of vehicle models? This will let dealerships market vehicle models more effectively per region.
SELECT d.business_name, COUNT (mo.name) as models_sold
FROM dealerships d
JOIN sales s ON d.dealership_id = s.dealership_id
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclemodels mo ON vt.model_id = mo.vehicle_model_id
GROUP BY d.dealership_id
ORDER BY models_sold

-- Which dealerships are currently selling the highest number of vehicle models? This will let dealerships know which regions have either a high population, or less brand loyalty.
SELECT d.business_name, COUNT (mo.name) as models_sold
FROM dealerships d
JOIN sales s ON d.dealership_id = s.dealership_id
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclemodels mo ON vt.model_id = mo.vehicle_model_id
GROUP BY d.dealership_id
ORDER BY models_sold DESC