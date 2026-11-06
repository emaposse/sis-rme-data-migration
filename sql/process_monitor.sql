SELECT 
    id,
    REPLACE(
        table_name,
        'on_etl_on_cs_polana_prod_using_ficha_clinica_migration_',
        ''
    ) AS table_name,
    record_origin_location_code,
    last_refresh_at,
    min_record_id,
    max_record_id,
    total_records,
    total_processed_records,
    status
FROM data_migation_stage_area.table_operation_progress_info
WHERE operation_id LIKE 'etl%clini%'
  AND record_origin_location_code = 'cs_polana_prod'
ORDER BY table_name;