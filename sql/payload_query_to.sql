# QUERY FOR PATHERN

SELECT DISTINCT msg.*
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg AS msg
INNER JOIN JSON_TABLE(
    msg.payload,
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        column_value INT PATH '$.value'
    )
) AS col
    ON col.column_name = 'encounter_type'
   AND col.column_value = 17
WHERE JSON_VALID(msg.payload);



SELECT DISTINCT msg.*
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg AS msg
INNER JOIN JSON_TABLE(
    msg.payload,
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        column_value INT PATH '$.value'
    )
) AS col
    ON col.column_name = 'concept_id'
   AND col.column_value = in (234012,165185)
WHERE JSON_VALID(msg.payload);


# QUERY FOR ERROR

SELECT
    REGEXP_SUBSTR(
        REGEXP_SUBSTR(processing_error, '\\[concept: [0-9]+\\]'),
        '[0-9]+'
    ) AS concept_id
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg
WHERE processing_error LIKE '%[concept:%';