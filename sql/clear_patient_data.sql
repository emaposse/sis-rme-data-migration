use moz_emr_api;

set autocommit = 0;


select *
from person_name 
where given_name  = 'Jorge' and family_name = 'Boane'


select * from patient where patient_id = 15382;

select * from patient_queue; 

delete from obs where obs_group_id is not null and person_id = 15382;
delete from obs where  person_id = 15382;
delete from encounter_program where encounter_id in (select encounter_id from encounter where patient_id = 15382); 
delete from encounter_provider where encounter_id in (select encounter_id from encounter where patient_id = 15382);
delete from encounter where patient_id = 15382;
delete 
from patient_queue_history 
where patient_queue_id in (	select patient_queue.patient_queue_id 
							from patient_queue 
							where  visit_id in (select visit_id 
												from visit 
												where patient_id = 15382);

delete from patient_queue;
delete from visit;


delete from person_attribute where person_id = 15382;
delete from person_name where person_id = 15382 ;
delete from person_address where person_id = 15382;
delete from person_complex_attribute_detail where person_id = 15382 ;
delete from person_complex_attribute where person_id = 15382; 
delete from provider_attribute  where person_id = 15382; 
delete from relationship  where person_b = 15382;
delete from patient_identifier where patient_id = 15382;
delete from allergy_reaction where patient_id = 15382;
delete from allergy  where patient_id = 15382;
delete from patient_state where patient_id = 15382; 
delete from patient_program where patient_id = 15382;
delete from patient  where patient_id = 15382;

set foreign_key_checks = 0;
delete from users where user_id <> 1;
set foreign_key_checks = 1;
delete from person where person_id <> 1;

commit;
