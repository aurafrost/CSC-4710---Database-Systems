SELECT ve.vehicle_id,ve.year,ve.make,ve.model,ve.mileage,vehicleTotalCost.orderNumber,vehicleTotalCost.vehicleSum
FROM tbl_vehicle AS ve
LEFT JOIN
	(SELECT vehicleTotal.vehicle_id, COUNT(vehicleTotal.order_id) AS orderNumber,SUM(vehicleTotal.cost) AS vehicleSum
	FROM(
		SELECT veor.vehicle_id,veor.order_id,(part_cost+labor_hour*labor_cost_per_hour) AS cost
		FROM tbl_vehicle_order AS veor
		LEFT JOIN tbl_order_service AS orse ON orse.order_id=veor.order_id
		LEFT JOIN tbl_service AS se ON se.service_id=orse.service_id
		LEFT JOIN tbl_rate AS ra ON ra.rate_id=se.rate_id
	)AS vehicleTotal
GROUP BY vehicleTotal.vehicle_id
)AS vehicleTotalCost on vehicleTotalCost.vehicle_id=ve.vehicle_id
;