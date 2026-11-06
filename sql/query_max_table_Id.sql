SELECT
'person' AS table_name,
MAX(person_id) AS max_id,
MAX(date_created) AS max_date_created
FROM person

UNION ALL

SELECT
'patient' AS table_name,
MAX(patient_id) AS max_id,
MAX(date_created) AS max_date_created
FROM patient

UNION ALL

SELECT
'encounter' AS table_name,
MAX(encounter_id) AS max_id,
MAX(date_created) AS max_date_created
FROM encounter

UNION ALL

SELECT
'encounter_provider' AS table_name,
MAX(encounter_provider_id) AS max_id,
MAX(date_created) AS max_date_created
FROM encounter_provider

UNION ALL

SELECT
'obs',
MAX(obs_id),
MAX(date_created)
FROM obs

UNION ALL

SELECT
'orders',
MAX(order_id),
MAX(date_created)
FROM orders

UNION ALL

SELECT
'order_group',
MAX(order_group_id),
MAX(date_created)
FROM order_group

UNION ALL

SELECT
'visit',
MAX(visit_id),
MAX(date_created)
FROM visit

UNION ALL

SELECT
'person_complex_attribute_detail',
MAX(person_complex_attribute_detail_id),
MAX(date_created)
FROM person_complex_attribute_detail

UNION ALL

SELECT
'person_complex_attribute',
MAX(person_complex_attribute_id),
MAX(date_created)
FROM person_complex_attribute

UNION ALL

SELECT
'person_attribute',
MAX(person_attribute_id),
MAX(date_created)
FROM person_attribute



UNION ALL

SELECT
'pharmacy_batch',
MAX(batch_id),
MAX(date_created)
FROM pharmacy_batch



UNION ALL



SELECT
'pharmacy_transaction',
MAX(pharmacy_transaction_id),
MAX(date_created)
FROM pharmacy_transaction





UNION ALL



SELECT
'person_name',
MAX(person_name_id),
MAX(date_created)
FROM person_name

UNION ALL



SELECT
'person_address',
MAX(person_address_id),
MAX(date_created)
FROM person_address



UNION ALL

SELECT
'patient_identifier',
MAX(patient_identifier_id),
MAX(date_created)
FROM patient_identifier





UNION ALL



SELECT
'patient_program',
MAX(patient_program_id),
MAX(date_created)
FROM patient_program

UNION ALL

SELECT
'patient_state',
MAX(patient_state_id),
MAX(date_created)
FROM patient_state

UNION ALL

SELECT
'pharmacy_package',
MAX(pharmacy_package_id),
MAX(date_created)
FROM pharmacy_package

UNION ALL

SELECT
'pharmacy_packaged_drug_id',
MAX(pharmacy_packaged_drug_id),
MAX(date_created)
FROM pharmacy_packaged_drug;


# OUTPUT
# ------------------------------------------------------------
"table_name","max_id","max_date_created"
person,20418,"2026-09-22 11:57:31"
patient,20418,"2026-09-22 11:57:31"
encounter,311026,"2026-09-22 11:59:48"
obs,562723,"2026-09-22 11:59:48"
orders,29302,"2026-09-22 11:55:49"
order_group,17758,"2026-09-22 11:55:49"
visit,253955,"2026-09-22 11:59:26"
person_complex_attribute_detail,53114,"2026-09-22 11:50:17"
person_complex_attribute,15243,"2026-09-22 11:50:17"
person_attribute,89089,"2026-09-22 11:57:31"