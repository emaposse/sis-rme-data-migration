
SET AUTOCOMMIT = 0;

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        person_complex_attribute_detail_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'person_complex_attribute_detail_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'person_complex_attribute_detail'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.person_complex_attribute_detail pcad
      WHERE pcad.person_complex_attribute_detail_id = jt.person_complex_attribute_detail_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        person_complex_attribute_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'person_complex_attribute_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'person_complex_attribute'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.person_complex_attribute pca
      WHERE pca.person_complex_attribute_id = jt.person_complex_attribute_id
  );



DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        person_attribute_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'person_attribute_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'person_attribute'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.person_attribute pa
      WHERE pa.person_attribute_id = jt.person_attribute_id
  );



DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        person_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'person_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'person'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.person p
      WHERE p.person_id = jt.person_id
  );



DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        user_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'user_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'users'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.users u
      WHERE u.user_id = jt.user_id
  );


DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        person_address_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'person_address_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'person_address'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.person_address pa
      WHERE pa.person_address_id = jt.person_address_id
  );


DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        person_name_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'person_name_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'person_name'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.person_name pn
      WHERE pn.person_name_id = jt.person_name_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        patient_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'patient_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'patient'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.patient pat
      WHERE pat.patient_id = jt.patient_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        patient_identifier_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'patient_identifier_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'patient_identifier'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.patient_identifier pi
      WHERE pi.patient_identifier_id = jt.patient_identifier_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        patient_program_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'patient_program_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'patient_program'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.patient_program pp
      WHERE pp.patient_program_id = jt.patient_program_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        patient_state_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'patient_state_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'patient_state'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.patient_state ps
      WHERE ps.patient_state_id = jt.patient_state_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        visit_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'visit_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'visit'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.visit v
      WHERE v.visit_id = jt.visit_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        encounter_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'encounter_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'encounter'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.encounter e
      WHERE e.encounter_id = jt.encounter_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        encounter_provider_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'encounter_provider_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'encounter_provider'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.encounter_provider ep
      WHERE ep.encounter_provider_id = jt.encounter_provider_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        encounter_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'encounter_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'encounter_program'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.encounter_program epr
      WHERE epr.encounter_id = jt.encounter_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        order_group_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'order_group_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'order_group'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.order_group og
      WHERE og.order_group_id = jt.order_group_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        order_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'order_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'orders'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.orders o
      WHERE o.order_id = jt.order_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        order_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'order_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'drug_order'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.drug_order dro
      WHERE dro.order_id = jt.order_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        order_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'order_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'test_order'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.test_order to1
      WHERE to1.order_id = jt.order_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        test_result_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'test_result_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'test_result'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.test_result tr
      WHERE tr.test_result_id = jt.test_result_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        condition_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'condition_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'conditions'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.conditions c
      WHERE c.condition_id = jt.condition_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        diagnosis_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'diagnosis_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'encounter_diagnosis'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.encounter_diagnosis ed
      WHERE ed.diagnosis_id = jt.diagnosis_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        vital_signs_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'vital_signs_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'vital_signs'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.vital_signs vs
      WHERE vs.vital_signs_id = jt.vital_signs_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        obs_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'obs_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'obs'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.obs ob
      WHERE ob.obs_id = jt.obs_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        batch_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'batch_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'pharmacy_batch'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.pharmacy_batch pb
      WHERE pb.batch_id = jt.batch_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        pharmacy_transaction_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'pharmacy_transaction_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'pharmacy_transaction'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.pharmacy_transaction pt
      WHERE pt.pharmacy_transaction_id = jt.pharmacy_transaction_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        pharmacy_package_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'pharmacy_package_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'pharmacy_package'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.pharmacy_package ppkg
      WHERE ppkg.pharmacy_package_id = jt.pharmacy_package_id
  );

DELETE msg
FROM openmrs_event_receiver_mgt.sis_rme_sync_msg msg
INNER JOIN JSON_TABLE(
    IF(
        JSON_VALID(msg.entity_payload),
        msg.entity_payload,
        '{"columns":[]}'
    ),
    '$.columns[*]'
    COLUMNS (
        column_name VARCHAR(100) PATH '$.name',
        pharmacy_packaged_drug_id BIGINT PATH '$.value' NULL ON EMPTY NULL ON ERROR
    )
) AS jt
    ON jt.column_name = 'pharmacy_packaged_drug_id'
WHERE msg.operation IN ('I', 'U')
  AND msg.table_name = 'pharmacy_packaged_drug'
  AND NOT EXISTS (
      SELECT 1
      FROM prod_sisrme_cs_polana_2026_10_27.pharmacy_packaged_drug ppd
      WHERE ppd.pharmacy_packaged_drug_id = jt.pharmacy_packaged_drug_id
  );


DELETE
from openmrs_event_receiver_mgt.sis_rme_sync_msg 
WHERE operation = 'I'
AND date_created < '2026-05-20';


DELETE FROM openmrs_event_receiver_mgt.sis_rme_sync_msg WHERE operation = 'D';


SET @offset = (SELECT MAX(id) FROM openmrs_event_receiver_mgt.sis_rme_sync_msg);

UPDATE openmrs_event_receiver_mgt.sis_rme_sync_msg
SET id = id + @offset;


SET @new_id = 0;

UPDATE openmrs_event_receiver_mgt.sis_rme_sync_msg
SET id = (@new_id := @new_id + 1)
ORDER BY id;

ALTER TABLE openmrs_event_receiver_mgt.sis_rme_sync_msg AUTO_INCREMENT = 1;


UPDATE openmrs.obs
SET status = 'FINAL'
WHERE status = 'CANCELLED';


COMMIT;
