
select * from migration_data_dump_stage_area.record_with_default_parents; 

select src_table_name, count(*)
from migration_data_dump_stage_area.record_with_default_parents
group by src_table_name ; 

update migration_data_dump_stage_area.record_with_default_parents
set status = 'PENDING', last_err=null, inconsistent_parent = -1;


select * 
from migration_data_dump_stage_area.record_with_default_parents
where src_table_name = 'orders';

select * 
from prod_sisrme_cs_polana.encounter 
where encounter_id = 79730;

select *
from sis_rme_cs_polana_new_data.encounter
where uuid = 'ef9973fc-577c-11f1-9e9b-1a4da297e2ba';

select * from prod_sisrme_cs_polana.encounter where encounter_id = 80211;

select * 
from migration_data_dump_stage_area.table_operation_progress_info 
where operation_id like '%encounter%'
	  or operation_id like '%order_group%'
	  or operation_id like '%vital_signs%'
	  or operation_id like '%conditions%'
	  or operation_id like '%encounter_diagnosis%'
	  or operation_id like '%orders%'
	  or operation_id like '%test_result%';
	  

delete
from migration_data_dump_stage_area.table_operation_progress_info 
where  operation_id like '%person_attribute%'
	  or operation_id like '%person_complex%';



SELECT * 
FROM prod_sisrme_cs_polana.person src_ inner join prod_sisrme_cs_polana.patient on src_.person_id = patient.patient_id 
WHERE not exists (select * from sis_rme_cs_polana_new_data.person dst_ WHERE  src_.uuid  = dst_.uuid);

set autocommit=0;

SET FOREIGN_KEY_CHECKS = 0;

SELECT count(*)
FROM sis_rme_cs_polana_new_data.person src_
WHERE person_id < 23745
	  AND EXISTS (	SELECT * 
					FROM prod_sisrme_after_clean_db.person dst_ where src_.uuid  = dst_.uuid)
	
delete 
FROM sis_rme_cs_polana_new_data.person src_
WHERE  person_id < 23745
	   AND EXISTS (	SELECT * 
					FROM prod_sisrme_after_clean_db.person dst_ where src_.uuid  = dst_.uuid)
					

select * 
from prod_sisrme_after_clean_db.person 
where uuid = 'f42557f3-4382-41ed-9a03-4966f9b82ec6'
order by person_id desc ;

select * 
from prod_sisrme_after_clean_db.person 
order by person_id desc ;

select * from sis_rme_cs_polana_new_data.patient ;


SELECT * 
FROM sis_rme_cs_polana_new_data.patient src_patient
WHERE not exists (	select * 
					from sis_rme_cs_polana_new_data.person dst_person
					WHERE dst_person.person_id = src_patient.patient_id);

					
					
DELETE
FROM sis_rme_cs_polana_new_data.patient src_patient
WHERE not exists (	select * 
					from sis_rme_cs_polana_new_data.person dst_person
					WHERE dst_person.person_id = src_patient.patient_id);


select count(*)
FROM sis_rme_cs_polana_new_data.users src_
WHERE  EXISTS (	SELECT * 
					FROM prod_sisrme_after_clean_db.users dst_ where src_.uuid  = dst_.uuid)
				

delete
FROM sis_rme_cs_polana_new_data.users src_
WHERE  EXISTS (	SELECT * 
					FROM prod_sisrme_after_clean_db.users dst_ where src_.uuid  = dst_.uuid)
									
commit;

select * 
from sis_rme_cs_polana_new_data.pharmacy_batch src_
where not exists (select * from prod_sisrme_after_clean_db.pharmacy_batch dst_ where dst_.batch_id = src_.batch_id);

delete 
from sis_rme_cs_polana_new_data.pharmacy_batch src_
where exists (select * from prod_sisrme_after_clean_db.pharmacy_batch dst_ where dst_.batch_id = src_.batch_id);

select *
from sis_rme_cs_polana_new_data.encounter  src_
where exists (select * from prod_sisrme_after_clean_db.encounter dst_ where dst_.uuid = src_.uuid);
 
delete
from sis_rme_cs_polana_new_data.encounter  src_
where exists (select * from prod_sisrme_after_clean_db.encounter dst_ where dst_.uuid = src_.uuid);

select uuid
from sis_rme_cs_polana_new_data.obs  src_
where exists (select * from prod_sisrme_after_clean_db.obs dst_ where dst_.uuid = src_.uuid);

select count(*)
from sis_rme_cs_polana_new_data.conditions  src_
where exists (select * from prod_sisrme_after_clean_db.conditions  dst_ where dst_.uuid = src_.uuid);


delete from sis_rme_cs_polana_new_data.conditions  src_
where exists (select * from prod_sisrme_after_clean_db.conditions  dst_ where dst_.uuid = src_.uuid);


delete from sis_rme_cs_polana_new_data.encounter_diagnosis  src_
where exists (select * from prod_sisrme_after_clean_db.encounter_diagnosis  dst_ where dst_.uuid = src_.uuid);

delete from sis_rme_cs_polana_new_data.vital_signs   src_
where exists (select * from prod_sisrme_after_clean_db.vital_signs dst_ where dst_.uuid = src_.uuid);


select * from sis_rme_cs_polana_new_data.users;

commit;

CREATE TABLE `sis_rme_cs_polana_new_data`.`tmp_obs_to_remove` (
  `id` int NOT NULL AUTO_INCREMENT,
  `obs_uuid` char(38) NOT NULL,
  `obst_id` int NOT NULL,
  `flag` tinyint(1) NULL,
  UNIQUE KEY `unq_obs_uuid` (`obs_uuid`),
  UNIQUE KEY `unq_obs_id` (`obs_uuid`),
  PRIMARY KEY (id)
) ENGINE=InnoDB;


INSERT INTO sis_rme_cs_polana_new_data.tmp_obs_to_remove
(obs_uuid, obst_id)
select uuid, obs_id
from sis_rme_cs_polana_new_data.obs  src_
where exists (select * from prod_sisrme_after_clean_db.obs dst_ where dst_.uuid = src_.uuid);


select * from sis_rme_cs_polana_new_data.tmp_obs_to_remove;


