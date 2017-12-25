SELECT cus.first_name, cus.last_name, costSum.customer_id, costSum.costCount from
(
	SELECT customer_id, sum(cost) AS costCount
	FROM
	(
		SELECT cu.customer_id,(part_cost+labor_hour*labor_cost_per_hour) AS cost
		FROM tbl_customer_vehicle AS cu
		LEFT JOIN tbl_vehicle_order AS ve ON ve.vehicle_id = cu.vehicle_id
		LEFT JOIN tbl_order_service AS ord ON ord.order_id = ve.order_id
		LEFT JOIN tbl_service AS se ON se.service_id = ord.service_id
		LEFT JOIN tbl_rate AS ra ON ra.rate_id = se.rate_id
	) AS customerCost
	GROUP BY customer_id
) AS costSum
LEFT JOIN tbl_customer AS cus ON cus.customer_id = costSum.customer_id
ORDER BY costSum.costcount DESC
LIMIT 1
;