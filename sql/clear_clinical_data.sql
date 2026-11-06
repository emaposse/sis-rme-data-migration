
use moz_emr_api;

set autocommit = 0;

delete from pharmacy_transaction;
delete from pharmacy_packaged_drug;
delete from pharmacy_package;
delete from pharmacy_batch;

delete from obs where obs_group_id is not null;
delete from obs;
delete from drug_order;
delete from test_order;
delete from orders;
delete from order_group;
delete from encounter_diagnosis;
delete from conditions; 
delete from encounter_program; 
delete from encounter_provider ;
delete from vital_signs;
delete from encounter;
delete from patient_queue_history;
delete from patient_queue;
delete from visit;

COMMIT;
