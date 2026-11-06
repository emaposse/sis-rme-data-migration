INSERT INTO sis_rme_sync_msg_processed_rec
(table_name, identifier, origin_site_uuid, entity_payload, operation, date_created, date_sent, date_received, message_uuid, processing_status, processing_date, processing_error, retry_count)
(
	SELECT 	table_name, identifier, origin_site_uuid, entity_payload, operation, date_created, date_sent, date_received, message_uuid, processing_status, processing_date, processing_error, retry_count
	FROM 	sis_rme_sync_msg
	WHERE 	operation = 'D' or identifier in ('6e1d6028-e21f-4719-aa22-76a6a7dcdb7a','d09c60f5-3515-4179-abb4-820678c234f5')
);

DELETE
FROM sis_rme_sync_msg
WHERE operation = 'D' or identifier in ('6e1d6028-e21f-4719-aa22-76a6a7dcdb7a','d09c60f5-3515-4179-abb4-820678c234f5', 'a81325b9-01c8-49ed-9e5d-13243ce1e7bb', '57b8b801-566e-11f1-9cb2-7a72ed72ce5f');

delete from table_operation_progress_info where table_name = 'sis_rme_sync_msg_1_to_sis_rme_sync_msg_001' and operation_id like 'etl%';