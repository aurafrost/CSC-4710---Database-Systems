SELECT customer_id FROM mydb.tbl_customer_vehicle
GROUP BY customer_id
HAVING count(*)>2
;