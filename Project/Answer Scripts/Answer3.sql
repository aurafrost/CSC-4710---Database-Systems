SELECT tbl_customer.first_name,tbl_customer.last_name
FROM tbl_customer_vehicle
INNER JOIN tbl_customer ON tbl_customer_vehicle.customer_id=tbl_customer.customer_id
GROUP BY first_name
HAVING count(*)>2
;
