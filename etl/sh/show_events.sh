#!/bin/bash

echo "============================================"
echo "RESUMO POR PROCESSING_STATUS"
echo "============================================"

docker exec -i refapp-db mysql -uroot -proot -N -e "
SELECT processing_status, COUNT(*) AS total
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg
GROUP BY processing_status
UNION ALL
SELECT 'TOTAL', COUNT(*)
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg;
" 2>/dev/null | while read status total
do
    printf "%-30s : %10s\n" "$status" "$total"

    if [ "$status" != "TOTAL" ]; then
        printf "%42s\n" "--"
    fi
done

echo "============================================"
echo
echo "============================================"
echo "ESTADO DA OPERACAO ETL"
echo "============================================"

docker exec -i refapp-db mysql -uroot -proot -N -e "
SELECT status
FROM openmrs_event_receiver_mgt.table_operation_progress_info
WHERE operation_name='etl_on_etl_on_cs_inhagoia_using_sis_rme_sesp_sync'
GROUP BY status;
" 2>/dev/null | while read status
do
    printf "%-30s : %s\n" "ESTADO" "$status"
done

echo "============================================"
