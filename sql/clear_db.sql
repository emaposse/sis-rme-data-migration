

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
delete from visit_attribute;	
delete from visit;
delete from allergy_reaction ;
delete from allergy;



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
delete from allergy_reaction ;
delete from allergy;




delete from person_attribute;
delete from person_name ;
delete from person_address;
delete from person_complex_attribute_detail ;
delete from person_complex_attribute;
delete from provider_attribute; 
delete from provider where provider_id <> 1 ;
delete from relationship;
delete from patient_identifier ;
delete from patient_state; 
delete from patient_program;
delete from patient ;
delete from user_role where user_id in (select user_id from users where username <> 'admin');
set foreign_key_checks = 0;
delete from users where user_id <> 1;
set foreign_key_checks = 1;
delete from person where person_id <> 1;

commit;
