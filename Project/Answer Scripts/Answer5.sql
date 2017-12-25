SELECT tbl_service.service_id, tbl_service.name, COUNT(tbl_order_service.service_id), tbl_service.part_cost*COUNT(tbl_order_service.service_id)
FROM tbl_service
INNER JOIN tbl_order_service ON tbl_service.service_id=tbl_order_service.service_id
GROUP BY tbl_service.service_id
;