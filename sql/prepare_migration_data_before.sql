SELECT *
FROM (
    SELECT 'users' AS table_name, 'user_id' AS primary_key, COALESCE(MAX(`user_id`), 0) AS maximum_value
    FROM `sis_rme_cs_polana_new_data`.`users`

    UNION ALL
    SELECT 'person', 'person_id', COALESCE(MAX(`person_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`person`

    UNION ALL
    SELECT 'person_address', 'person_address_id', COALESCE(MAX(`person_address_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`person_address`

    UNION ALL
    SELECT 'person_attribute', 'person_attribute_id', COALESCE(MAX(`person_attribute_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`person_attribute`

    UNION ALL
    SELECT 'person_complex_attribute', 'person_complex_attribute_id', COALESCE(MAX(`person_complex_attribute_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`person_complex_attribute`

    UNION ALL
    SELECT 'person_complex_attribute_detail', 'person_complex_attribute_detail_id', COALESCE(MAX(`person_complex_attribute_detail_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`person_complex_attribute_detail`

    UNION ALL
    SELECT 'person_name', 'person_name_id', COALESCE(MAX(`person_name_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`person_name`

    UNION ALL
    SELECT 'patient', 'patient_id', COALESCE(MAX(`patient_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`patient`

    UNION ALL
    SELECT 'patient_identifier', 'patient_identifier_id', COALESCE(MAX(`patient_identifier_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`patient_identifier`

    UNION ALL
    SELECT 'patient_program', 'patient_program_id', COALESCE(MAX(`patient_program_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`patient_program`

    UNION ALL
    SELECT 'patient_state', 'patient_state_id', COALESCE(MAX(`patient_state_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`patient_state`

    UNION ALL
    SELECT 'visit', 'visit_id', COALESCE(MAX(`visit_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`visit`

    UNION ALL
    SELECT 'encounter', 'encounter_id', COALESCE(MAX(`encounter_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`encounter`

    UNION ALL
    SELECT 'encounter_program', 'encounter_id', COALESCE(MAX(`encounter_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`encounter_program`

    UNION ALL
    SELECT 'encounter_provider', 'encounter_provider_id', COALESCE(MAX(`encounter_provider_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`encounter_provider`

    UNION ALL
    SELECT 'obs', 'obs_id', COALESCE(MAX(`obs_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`obs`

    UNION ALL
    SELECT 'vital_signs', 'vital_signs_id', COALESCE(MAX(`vital_signs_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`vital_signs`

    UNION ALL
    SELECT 'conditions', 'condition_id', COALESCE(MAX(`condition_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`conditions`

    UNION ALL
    SELECT 'encounter_diagnosis', 'diagnosis_id', COALESCE(MAX(`diagnosis_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`encounter_diagnosis`

    UNION ALL
    SELECT 'order_group', 'order_group_id', COALESCE(MAX(`order_group_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`order_group`

    UNION ALL
    SELECT 'orders', 'order_id', COALESCE(MAX(`order_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`orders`

    UNION ALL
    SELECT 'drug_order', 'order_id', COALESCE(MAX(`order_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`drug_order`

    UNION ALL
    SELECT 'test_order', 'order_id', COALESCE(MAX(`order_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`test_order`

    UNION ALL
    SELECT 'test_result', 'test_result_id', COALESCE(MAX(`test_result_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`test_result`

    UNION ALL
    SELECT 'pharmacy_batch', 'batch_id', COALESCE(MAX(`batch_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`pharmacy_batch`

    UNION ALL
    SELECT 'pharmacy_transaction', 'pharmacy_transaction_id', COALESCE(MAX(`pharmacy_transaction_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`pharmacy_transaction`

    UNION ALL
    SELECT 'pharmacy_package', 'pharmacy_package_id', COALESCE(MAX(`pharmacy_package_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`pharmacy_package`

    UNION ALL
    SELECT 'pharmacy_packaged_drug', 'pharmacy_packaged_drug_id', COALESCE(MAX(`pharmacy_packaged_drug_id`), 0)
    FROM `sis_rme_cs_polana_new_data`.`pharmacy_packaged_drug`
) AS table_maximums
ORDER BY table_name;


alter table `sis_rme_cs_polana_new_data`.`encounter` modify column encounter_datetime datetime not null, modify column date_created datetime not null;

alter table `sis_rme_cs_polana_new_data`.`patient` modify column date_created datetime not null;

alter table `sis_rme_cs_polana_new_data`.`patient_program` modify column date_created datetime not null;

alter table `sis_rme_cs_polana_new_data`.`patient_state` modify column date_created datetime not null;

alter table `sis_rme_cs_polana_new_data`.`person_address` modify column date_created datetime not null;

alter table `sis_rme_cs_polana_new_data`.`person_attribute` modify column date_created datetime not null;


ALTER TABLE `sis_rme_cs_polana_new_data`.`conditions`
    AUTO_INCREMENT = 28470;

ALTER TABLE `sis_rme_cs_polana_new_data`.`drug_order`
    AUTO_INCREMENT = 43022;

ALTER TABLE `sis_rme_cs_polana_new_data`.`encounter`
    AUTO_INCREMENT = 429557;

ALTER TABLE `sis_rme_cs_polana_new_data`.`encounter_diagnosis`
    AUTO_INCREMENT = 28245;

ALTER TABLE `sis_rme_cs_polana_new_data`.`encounter_program`
    AUTO_INCREMENT = 429557;

ALTER TABLE `sis_rme_cs_polana_new_data`.`encounter_provider`
    AUTO_INCREMENT = 428750;

ALTER TABLE `sis_rme_cs_polana_new_data`.`obs`
    AUTO_INCREMENT = 830524;

ALTER TABLE `sis_rme_cs_polana_new_data`.`order_group`
    AUTO_INCREMENT = 25451;

ALTER TABLE `sis_rme_cs_polana_new_data`.`orders`
    AUTO_INCREMENT = 43022;

ALTER TABLE `sis_rme_cs_polana_new_data`.`patient`
    AUTO_INCREMENT = 23745;

ALTER TABLE `sis_rme_cs_polana_new_data`.`patient_identifier`
    AUTO_INCREMENT = 78536;

ALTER TABLE `sis_rme_cs_polana_new_data`.`patient_program`
    AUTO_INCREMENT = 24243;

ALTER TABLE `sis_rme_cs_polana_new_data`.`patient_state`
    AUTO_INCREMENT = 23083;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person`
    AUTO_INCREMENT = 23745;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person_address`
    AUTO_INCREMENT = 22614;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person_attribute`
    AUTO_INCREMENT = 105001;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person_complex_attribute`
    AUTO_INCREMENT = 20555;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person_complex_attribute_detail`
    AUTO_INCREMENT = 70173;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person_name`
    AUTO_INCREMENT = 27015;

ALTER TABLE `sis_rme_cs_polana_new_data`.`pharmacy_batch`
    AUTO_INCREMENT = 3188;

ALTER TABLE `sis_rme_cs_polana_new_data`.`pharmacy_package`
    AUTO_INCREMENT = 9515;

ALTER TABLE `sis_rme_cs_polana_new_data`.`pharmacy_packaged_drug`
    AUTO_INCREMENT = 11711;

ALTER TABLE `sis_rme_cs_polana_new_data`.`pharmacy_transaction`
    AUTO_INCREMENT = 11898;

ALTER TABLE `sis_rme_cs_polana_new_data`.`test_order`
    AUTO_INCREMENT = 45521;

ALTER TABLE `sis_rme_cs_polana_new_data`.`test_result`
    AUTO_INCREMENT = 7367;

ALTER TABLE `sis_rme_cs_polana_new_data`.`users`
    AUTO_INCREMENT = 2935;

ALTER TABLE `sis_rme_cs_polana_new_data`.`visit`
    AUTO_INCREMENT = 306864;

ALTER TABLE `sis_rme_cs_polana_new_data`.`vital_signs`
    AUTO_INCREMENT = 7235;




SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`pharmacy_packaged_drug`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`pharmacy_package`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`pharmacy_transaction`;

TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`test_result`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`test_order`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`drug_order`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`orders`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`order_group`;

TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`encounter_diagnosis`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`conditions`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`vital_signs`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`obs`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`encounter_provider`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`encounter_program`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`encounter`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`visit`;

TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`patient_state`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`patient_program`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`patient_identifier`;

TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`person_complex_attribute_detail`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`person_complex_attribute`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`person_attribute`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`person_address`;
TRUNCATE TABLE `sis_rme_cs_polana_new_data`.`person_name`;


SET FOREIGN_KEY_CHECKS = 1;


ALTER TABLE `sis_rme_cs_polana_new_data`.`conditions`
    AUTO_INCREMENT = 28470;

ALTER TABLE `sis_rme_cs_polana_new_data`.`drug_order`
    AUTO_INCREMENT = 43022;

ALTER TABLE `sis_rme_cs_polana_new_data`.`encounter`
    AUTO_INCREMENT = 429557;

ALTER TABLE `sis_rme_cs_polana_new_data`.`encounter_diagnosis`
    AUTO_INCREMENT = 28245;

ALTER TABLE `sis_rme_cs_polana_new_data`.`encounter_program`
    AUTO_INCREMENT = 429557;

ALTER TABLE `sis_rme_cs_polana_new_data`.`encounter_provider`
    AUTO_INCREMENT = 428750;

ALTER TABLE `sis_rme_cs_polana_new_data`.`obs`
    AUTO_INCREMENT = 830524;

ALTER TABLE `sis_rme_cs_polana_new_data`.`order_group`
    AUTO_INCREMENT = 25451;

ALTER TABLE `sis_rme_cs_polana_new_data`.`orders`
    AUTO_INCREMENT = 43022;

ALTER TABLE `sis_rme_cs_polana_new_data`.`patient`
    AUTO_INCREMENT = 23745;

ALTER TABLE `sis_rme_cs_polana_new_data`.`patient_identifier`
    AUTO_INCREMENT = 78536;

ALTER TABLE `sis_rme_cs_polana_new_data`.`patient_program`
    AUTO_INCREMENT = 24243;

ALTER TABLE `sis_rme_cs_polana_new_data`.`patient_state`
    AUTO_INCREMENT = 23083;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person`
    AUTO_INCREMENT = 23745;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person_address`
    AUTO_INCREMENT = 22614;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person_attribute`
    AUTO_INCREMENT = 105001;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person_complex_attribute`
    AUTO_INCREMENT = 20555;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person_complex_attribute_detail`
    AUTO_INCREMENT = 70173;

ALTER TABLE `sis_rme_cs_polana_new_data`.`person_name`
    AUTO_INCREMENT = 27015;

ALTER TABLE `sis_rme_cs_polana_new_data`.`pharmacy_batch`
    AUTO_INCREMENT = 3188;

ALTER TABLE `sis_rme_cs_polana_new_data`.`pharmacy_package`
    AUTO_INCREMENT = 9515;

ALTER TABLE `sis_rme_cs_polana_new_data`.`pharmacy_packaged_drug`
    AUTO_INCREMENT = 11711;

ALTER TABLE `sis_rme_cs_polana_new_data`.`pharmacy_transaction`
    AUTO_INCREMENT = 11898;

ALTER TABLE `sis_rme_cs_polana_new_data`.`test_order`
    AUTO_INCREMENT = 45521;

ALTER TABLE `sis_rme_cs_polana_new_data`.`test_result`
    AUTO_INCREMENT = 7367;

ALTER TABLE `sis_rme_cs_polana_new_data`.`users`
    AUTO_INCREMENT = 2935;

ALTER TABLE `sis_rme_cs_polana_new_data`.`visit`
    AUTO_INCREMENT = 306864;

ALTER TABLE `sis_rme_cs_polana_new_data`.`vital_signs`
    AUTO_INCREMENT = 7235;


update sis_rme_cs_polana_new_data.users
set username = 'admin2'
where username = 'admin';


DROP DATABASE IF EXISTS migration_data_dump_stage_area;


select * from prod_sisrme_cs_polana.person_attribute_type ;

INSERT INTO sis_rme_cs_polana_new_data.person_attribute_type (person_attribute_type_id, name,description,format,foreign_key,searchable,creator,date_created,changed_by,date_changed,retired,retired_by,date_retired,retire_reason,edit_privilege,uuid,sort_weight) VALUES
	 (117, 'Data Inicio PRep','Data Inicio PRep','java.lang.String',NULL,0,1,'2007-05-04 09:59:23',1,'2020-08-13 11:38:15',0,NULL,NULL,NULL,NULL,'7f65d656-c943-11f1-91bf-c263341192bf',11.0);

commit;


select *  from sis_rme_cs_polana_new_data.person where person_id > 24119-3500;