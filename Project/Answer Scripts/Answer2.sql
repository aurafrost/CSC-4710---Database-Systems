SELECT order_id,count(service_id) FROM tbl_order_service
GROUP BY order_id
;