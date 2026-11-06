

select stage_record_id, count(*)
from data_migation_stage_area.encounter_dst_stage 
group by stage_record_id  
having count(*) > 1

select *
from data_migation_stage_area.encounter_dst_stage 
where dst_compacted_object_uk is not null;


select * 
from data_migration_small_sesp_db.users 
where uuid  = '5d2bda86-9c95-42fd-9165-7339f27a6e18';


SELECT  *
FROM data_migration_sis_rme_db.encounter dst inner join data_migration_small_sesp_db.encounter src on src.uuid  = dst.uuid ;

select *
from data_migration_small_sesp_db.encounter 
where encounter_type = 90

update data_migration_small_sesp_db.users set
password = '36e1180a69e3cd18a269651b76cb9f2715131b2f1cfb096f35ad39a8d02a75d4ea75df9ee45e4e75424ce2b4139bc418cb9e53867cca7238817d008ce40e624e',
salt = '4f8b0d10010228239a4d0106c4944a2d7afec4f5066a20c787f3d18ddececc1cf6e861b99413638ef7df75b9fd12f98938c1fda3fb2a2eb4ff0afee136e9426c'
where system_id = 'admin';

select *
from data_migration_sis_rme_db.person_attribute ;

select *
from  data_migation_stage_area.table_operation_progress_info
where table_name = 'users_to_users_on_etl_on_testing_site_using_patient_demografic_migration_001';


SET AUTOCOMMIT = 0;

update data_migation_stage_area.table_operation_progress_info
set table_name = concat(table_name, '_001')
where table_name not like '%_00%'

select * from  data_migation_stage_area.orders_dst_stage ;

update data_migation_stage_area.orders_dst_stage 
set src_stage_table_name = concat(src_stage_table_name, '_001')
where src_stage_table_name not like '%_00%'


commit;

select *
from data_migation_stage_area.record_with_default_parents 
where src_table_name not in ('users');

alter table data_migation_stage_area.record_with_default_parents add (resolved tinyint(1) default 0);

set autocommit = 0;

delete 
from data_migation_stage_area.record_with_default_parents
where src_table_name='patient_program'
	and not exists ( select * from data_migration_sis_rme_db.patient_program where dst_rec_id = patient_program_id);

commit;


delete
from data_migration_sis_rme_db.patient_state ;

delete
from data_migration_sis_rme_db.patient_program;


select * from data_migration_sis_rme_db.location where name like '%luabo%'

select value_reference from data_migration_sis_rme_db.location_attribute where attribute_type_id = 25 and location_id = 900006;


alter table data_migation_stage_area.table_operation_progress_info modify `table_name` varchar(200) NOT NULL;

update data_migation_stage_area.table_operation_progress_info
set status='RUNNING',
total_processed_records=0, total_records=0, min_record_id=0, max_record_id =0
where table_name in ('encounter_to_encounter_on_etl_on_testing_site_using_ficha_resumo_migration_002', 'encounter_to_encounter_on_etl_on_testing_site_using_ficha_resumo_migration_003', 'encounter_to_encounter_on_etl_on_testing_site_using_ficha_clinica_migration_005', 'encounter_to_encounter_on_etl_on_testing_site_using_ficha_clinica_migration_006');

select * from data_migration_sis_rme_db.users;

select * from data_migation_stage_area.table_operation_progress_info;

select orders.patient_id, orders.encounter_id, orders.order_group_id, orders.order_id, order_group.patient_id, order_group.encounter_id
from data_migration_sis_rme_db.orders inner join data_migration_sis_rme_db.order_group on orders.order_group_id =  order_group.order_group_id 
order by orders.order_group_id ;
	
select * from data_migration_sis_rme_db.location where name like '%luab%';

use data_migration_sis_rme_db;

SELECT encounter_type , encounter_datetime, concept_id, encounter.patient_id   
from data_migration_sis_rme_db.orders inner join data_migration_sis_rme_db.encounter on orders.encounter_id = encounter.encounter_id 
where 1=1
order by encounter_datetime ;


select * from data_migration_sis_rme_db.service_visit_type_resolver where service_concept_gp_or_uuid like '%tarv%';

select * from data_migration_sis_rme_db.encounter_type where uuid = 'e278f956-1d5f-11e0-b929-000c29ad1d07';

select * from data_migration_sis_rme_db.visit_type where uuid = 'b0255591-632e-41d9-8197-686a87d8447f';

select * from data_migation_stage_area.relationship_dst_stage  ;

select * from data_migration_sis_rme_db.global_property  where property  = 'tarv.visit_type.uuid';

tarv.visit_type.uuid

update data_migration_sis_rme_db.visit set visit_type_id = 48;

select * 
from data_migration_sis_rme_db.visit inner join data_migration_sis_rme_db.visit_type on visit.visit_type_id  = visit_type.visit_type_id 
where visit_id = 164409;


use data_migation_stage_area;


select * from obs_dst_stage;

update obs_dst_stage set src_stage_table_name = 'obs_stage' where src_stage_table_name is NULL ;


SELECT * 
from data_migration_small_sesp_db.person
where person_id in (2830,90644)


SELECT * 
from data_migration_small_sesp_db.encounter 
where visit_id = 4;

SELECT * 
from data_migration_small_sesp_db.visit  
where visit_id = 4;


select * 
from data_migation_stage_area.person_address_dst_stage ;

select record_origin_location_code, key_value person_attribute_id, last_sync_try_err, migration_status    
from data_migation_stage_area.person_attribute_stage inner join data_migation_stage_area.person_attribute_stage_src_unique_keys on stage_record_id = person_attribute_stage.id and key_name = 'pk' 


select * from data_migation_stage_area.person_attribute_stage_src_unique_keys;

select address1, city_village   from data_migration_small_sesp_db.person_address ;

select * 
from sis_rme_migrated_db_test.person_attribute ;

select *
from data_migration_small_sesp_db.person 
where person_id = 1;

select *
from data_migration_sis_rme_db.patient  
where patient_id  = 114179;


select min(encounter_id )
from data_migration_small_sesp_db.encounter 
where encounter_type = 53;


select *
from data_migration_small_sesp_db.obs 
where obs_id = 195549020;

select value_coded  
from data_migration_small_sesp_db.obs
where concept_id  = 23761;


select name, concept_id
from data_migration_small_sesp_db.concept_name 
where concept_id in (23722, 23860) and locale = 'pt' and locale_preferred = 1;



select name, uuid
from data_migration_small_sesp_db.location
where location_id in (627,611)

select * from data_migration_small_sesp_db.sesp_sisrme_metadata_mapping;

select * from data_migration_small_sesp_db.encounter  where encounter_id = 39730743;

update data_migration_small_sesp_db.encounter  
set visit_id = null
where encounter_id = 39730743;

update data_migration_small_sesp_db.encounter  
set visit_id = 19385961
where encounter_id = 39730743;

select * 
from data_migration_small_sesp_db.encounter_provider   
where encounter_id = 24513228;


select *
from data_migration_sis_rme_db.obs ;


select *
from data_migration_sis_rme_db.person_complex_attribute_detail  ;

select *
from data_migration_sis_rme_db.location_tag_map 
where location_tag_id =1;


select * from data_migration_sis_rme_db.global_property where property like '%specia%'

delete
from data_migration_sis_rme_db.location_tag_map 
where location_tag_id =1;


delete 
from data_migration_sis_rme_db.location 
where location_id in (900000,
900001,
900002,
900003,
900004,
900005,
900006,
900007)




selfect *
from data_migation_stage_area.default_generated_object_key ;

select cs.*, name 
from data_migration_sis_rme_db.clinical_service cs inner join data_migration_sis_rme_db.concept_name c on c.concept_id = cs.service_concept_id 
where name like '%TARV%';

select *
from data_migration_sis_rme_db.clinical_service 
where clinical_service_id  = 87;


select *
from data_migration_sis_rme_db.encounter

select *
from data_migration_sis_rme_db.appointment ;



USE data_migration_sis_rme_db;



select table_name, total_records , total_processed_records, status, operation_id    
from data_migation_stage_area.table_operation_progress_info 
WHERE 1=1;

select visit_id, count(*) 
from data_migration_sis_rme_db.encounter 
group by visit_id
having count(*) > 1;

select *
from data_migration_sis_rme_db.encounter  
where visit_id = 159404;

select * 
from data_migration_sis_rme_db.location inner join data_migration_sis_rme_db.location_tag_map using(location_id)
where location_tag_id = 1;

select name, uuid, location_id
from data_migration_sis_rme_db.location 
where name in ('CS Nante', 'CS Moneia')

select name, value_coded,value_text, concept_id 
from data_migration_small_sesp_db.obs inner join data_migration_small_sesp_db.concept_name using(concept_id)   
where obs_id in (353282528)


select concept.concept_id, name
from data_migration_sis_rme_db.concept inner join concept_name using(concept_id)
where class_id = 42;


select * from data_migration_sis_rme_db.encounter where encounter_type = 147;

select * from  data_migration_sis_rme_db.encounter_diagnosis;

set autocommit = 0;

select * from data_migration_sis_rme_db.person_attribute_type where person_attribute_type_id = 55;


select * from data_migration_sis_rme_db.person_attribute where person_attribute_type_id  = 60;

select * 
from data_migration_sis_rme_db.encounter 
where location_id = 1;


update data_migration_sis_rme_db.obs
set location_id = 900006
where location_id = 1;


select COALESCE(condition_id, condition_coded)
from data_migration_sis_rme_db.conditions   ;

select  obs_datetime , orders.patient_id, orders.encounter_id, name, orders.order_id, obs_id, obs.concept_id, obs.value_coded, obs.value_numeric, obs.value_text   
from data_migration_sis_rme_db.orders  left join data_migration_sis_rme_db.obs using (order_id)
									   left join data_migration_sis_rme_db.concept_name cn on cn.concept_id = obs.concept_id and locale='pt' and cn.locale_preferred = 1
order by patient_id, encounter_id 


select  patient_id, encounter_id, count(*)
from data_migration_sis_rme_db.orders  left join data_migration_sis_rme_db.obs using (order_id)
group by patient_id, encounter_id 
having count(*) > 1;

COMMIT ;

select * from data_migration_sis_rme_db.concept_name  where concept_id = 1766;

select * from data_migration_sis_rme_db.encounter_type where encounter_type_id  = 129

select operation_id , total_records , total_processed_records , status 
from data_migation_stage_area.table_operation_progress_info ;

update data_migation_stage_area.table_operation_progress_info 
set status='RUNNING', total_processed_records =0
where operation_id = 'etl_on_etl_on_testing_site_using_startup_encounter_to_encounter_on_etl_on_testing_site_using_startup_001'

select patient_id  from data_migration_small_sesp_db.orders;

 SELECT *
 FROM data_migration_small_sesp_db.obs cd4_encounter_ds_src_obs 
 WHERE encounter_id = 134 AND (concept_id in (2) and voided = 0)

select * 
from data_migration_small_sesp_db.obs  inner join data_migration_small_sesp_db.encounter using (encounter_id) 
where concept_id in (6258) and encounter_type = 6
order by encounter.encounter_id ;

select * from data_migration_small_sesp_db.patient_state where state in (0);

select * from data_migration_small_sesp_db.patient_program where location_id is not null ;

select * from data_migration_sis_rme_db.patient_program where location_id is not null ;

select * from data_migration_sis_rme_db.order_type where name like '%rapi%';


select * from data_migration_sis_rme_db.entity_extension ;


select person.uuid, obs_lactante.*
from data_migration_small_sesp_db.obs obs_lactante inner join data_migration_small_sesp_db.person using(person_id)
												   inner join data_migration_small_sesp_db.encounter using (encounter_id)	
where obs_lactante.concept_id = 6332 and obs_lactante.value_coded = 1065 and encounter_type = 53;

select person.uuid, obs_efeitos_colaterais.*
from data_migration_small_sesp_db.obs obs_efeitos_colaterais inner join data_migration_small_sesp_db.person using(person_id)
												   inner join data_migration_small_sesp_db.encounter using (encounter_id)	
where obs_efeitos_colaterais .concept_id = 2015 and encounter_type = 53;


		concept_id in (2015, 6332,23783)

select * from data_migration_small_sesp_db.person where uuid = '420e025f-9d3c-4f73-9bba-9912a1d044b0';
		

select * from data_migration_small_sesp_db.concept_name where concept_id = 21275;

select * from data_migration_sis_rme_db.concept_name where concept_id = 21275;

select * from data_migration_sis_rme_db.person_attribute_type where name like '%tarv%'


select * from data_migration_sesp_cs_polana_cimento.obs where person_id = 1 and concept_id = 1740;

select * from data_migration_sis_rme_db.person where person_id = 1;

select * from data_migration_sis_rme_db.person_attribute;

select * 
from data_migration_sis_rme_db.obs  inner join data_migration_sis_rme_db.encounter using (encounter_id) 
where concept_id in (730)
order by encounter.encounter_id ;

select * from data_migration_sis_rme_db.clinical_service ;

INSERT INTO testing_db.visit (patient_id,visit_type_id,date_started,location_id, creator,date_created,voided,indication_concept_id, uuid)
(SELECT patient_id ,48,now(),900007,1,now(),0,1,uuid()
FROM testing_db.patient)

INSERT INTO pharmacy_batch
(drug_id, batch_number, expiry_date, quantity, balance, location_id, creator, date_created, voided, void_reason, voided_by, uuid)
(select drug_id, CONCAT(drug_id, '-mig-package'), '2030-12-31', 0, 0, 900007, 1, now(), 0, null, null, uuid() 
from drug )


select *
from 
(select max(visit_id) visit_id from visit ) v 
		left join (select max(encounter_id) encounter_id from encounter) e
			left join (select max(encounter_program_id) encounter_program_id) ep
				left join (select max(obs_id) from obs ) o;

select * from data_migration_sis_rme_db.person_attribute_type where name like '%tarv%';

alter table data_migration_sesp_cs_polana_cimento.users add  UNIQUE KEY `user_unq_uuid` (`uuid`);

select * from data_migration_sis_rme_db.location_tag_map where location_tag_id = 1;

select * 
from  data_migration_sis_rme_db.encounter 
where encounter_type  = 147;  

select * from  data_migration_sis_rme_db.visit_type   where visit_type_id = 42;

delete from  data_migration_sis_rme_db.visit   where visit_type_id = 42;


select * from data_migration_sis_rme_db.encounter where encounter_type = 117;

select * 
from data_migration_sis_rme_db.obs 
where concept_id = 233767;

select * from data_migration_sis_rme_db.obs where obs_group_id in (769356)



select *
from data_migation_stage_area.table_operation_progress_info ;

select * 
from data_migration_sis_rme_db.obs 
where uuid = '44085315-4b17-4fdc-8cf3-808660c6be54';

select * 
from data_migration_small_sesp_db.obs 
where uuid = '44085315-4b17-4fdc-8cf3-808660c6be54';




select * 
from data_migration_small_sesp_db.obs 
where obs_group_id = 609049;


select * 
from data_migration_sis_rme_db.person_complex_attribute_detail  
where person_complex_attribute_id = 2116;

select * 
from data_migration_sis_rme_db.person_attribute 
where person_attribute_type_id = 78 and value = 2116;

select * 
from data_migation_stage_area.obs_dst_stage
where dst_table_name like '%person_complex_attribute_detail%'
and dst_compacted_object_uk like '%person_complex_attribute_detail_id:6065%';

select * 
from data_migation_stage_area.obs_stage 
where id=8084;

select obs.concept_id, concept.*
from data_migration_small_sesp_db.obs left join data_migration_sis_rme_db.concept using(concept_id)
where encounter_id = 57847;

select *
from data_migration_small_sesp_db.concept_name 
where concept_id  = 165349;


select state_province, county_district  
from data_migration_small_sesp_db.person_address 

select * from data_migration_small_sesp_db.address_hierarchy_entry where level_id = 2 ;

select name, uuid, location_id
from data_migration_sis_rme_db.location inner join data_migration_sis_rme_db.location_tag_map  using(location_id)
where location_tag_id = 15;


select * from data_migration_sis_rme_db.location_tag ;


select *
from data_migration_small_sesp_db.obs 
where encounter_id  = 46862089 and concept_id = 23777;

select comments, value_datetime, value_text from data_migration_small_sesp_db.obs where concept_id = 23808;

select * from data_migration_small_sesp_db.concept_name where concept_id = 23897;

select * from data_migration_small_sesp_db.encounter where encounter_id in (10095002, 19399822);

select * from data_migration_small_sesp_db.encounter where encounter_id in (24414184);

select * from data_migration_small_sesp_db.person where person_id = 647384;

select * from data_migration_sis_rme_db.person where uuid = '8278911b-eabc-4574-8167-402c272b97df';


select * 
from data_migration_sis_rme_db.person_attribute_type 
where person_attribute_type_id = 92 ;

set @concept_id = 23761;
set @tb_condition_concept_id=23761; 
set @value_coded=1256;



select * 
from data_migration_small_sesp_db.obs inner join data_migration_small_sesp_db.encounter on obs.encounter_id  = encounter.encounter_id 
where concept_id in (1369) and encounter_type = 53 and encounter.voided = 0;



select name, obs.* 
from data_migration_small_sesp_db.obs inner join data_migration_small_sesp_db.encounter on obs.encounter_id  = encounter.encounter_id 
									inner join data_migration_small_sesp_db.concept_name on concept_name.concept_id  = obs.concept_id and locale = 'pt'
where encounter.encounter_id = 4548;




select * 
from data_migration_small_sesp_db.encounter_provider   
where encounter_id = 24957281
order by encounter_id ;

select * from data_migration_sis_rme_db.encounter_role ;

select *
from data_migration_sis_rme_db.encounter_type where name like '%tarv%' ;

select encounter_id, encounter_program.program_id 
from data_migration_sis_rme_db.encounter  left join data_migration_sis_rme_db.encounter_program using(encounter_id)


select * from data_migration_small_sesp_db.obs where obs_id  in (204081752);

use data_migration_sis_rme_db;

select * from person where uuid = 'ab7d6235-2d5f-48f8-8060-dcf5e64e42b2';

select * from encounter_type where uuid = 'e278f956-1d5f-11e0-b929-000c29ad1d07';

commit;

select *
from data_migation_stage_area.encounter_dst_stage 
where last_sync_try_err is not null;

select * from data_migration_small_sesp_db.encounter_provider ;

select * 
from encounter 
where encounter_type =17;


select * 
from encounter inner join encounter_program using(encounter_id)
where encounter_type =17;



select * 
from encounter inner join encounter_provider  using(encounter_id)
where encounter_type =17;


select obs.* 
from encounter inner join obs  on obs.encounter_id = encounter.encounter_id 
where encounter_type =17;


select * from encounter_type where encounter_type_id = 17;

select * 
from encounter inner join encounter_program using(encounter_id)
			   inner join program on program.program_id = 	encounter_program.program_id
where patient_id = 129207;


use data_migration_sis_rme_db;

select * from encounter where encounter_type = 108;

select * from conditions where encounter_type = 108;

select * from  data_migration_sesp_db.obs where  obs_id = 575524 ;

select * from data_migration_sis_rme_db.person_attribute_type where name like 'Gaac%' order by 1;
		
select * 
from data_migration_small_sesp_db.concept_name 
where concept_id in (1695 ,730 ,165515 ,23952 ,165362 ,23951 ,165185 ,1185 ,1372 ,1185 ,1185 ,1185 ,1185 ,1185 ,2094 ,703 ,23761 ,23761 ,23761 ,23761 ,23761 ,23761 ,23761 ,23761 ,165332 ,165332 ,165332 ,165332 ,165332 ,165332 ,165332 ,165332 ,1294 ,1294 ,1294 ,1294 ,1294 ,1294 ,1294 ,1294 ,165371 ,165371 ,165371 ,165371 ,165371 ,165371 ,165371 ,165371 ,204 ,204 ,204 ,204 ,204 ,204 ,204 ,204 ,5333 ,5333 ,5333 ,5333 ,5333 ,5333 ,5333 ,5333 ,7180 ,7180 ,7180 ,7180 ,7180 ,7180 ,7180 ,7180 ,6990 ,6990 ,6990 ,6990 ,6990 ,6990 ,6990 ,6990 ,5344 ,5344 ,5344 ,5344 ,5344 ,5344 ,5344 ,5344 ,5018 ,5018 ,5018 ,5018 ,5018 ,5018 ,5018 ,5018 ,14656 ,14656 ,14656 ,14656 ,14656 ,14656 ,14656 ,14656 ,1406 ,1406 ,1406 ,1406 ,1406 ,1406 ,1406 ,1406 ,165427 ,165427 ,165427 ,165427 ,165427 ,165427 ,165427 ,165427 ,165433 ,165433 ,165433 ,165433 ,165433 ,165433 ,165433 ,165433 ,165434 ,165434 ,165434 ,165434 ,165434 ,165434 ,165434 ,165434 ,507)
and locale = 'pt';




select * 
from data_migration_small_sesp_db.encounter inner join data_migration_small_sesp_db.obs using(encounter_id)
where value_coded = 730
		and encounter_type = 90;


INSERT INTO data_migration_sis_rme_db.visit (patient_id,visit_type_id,date_started,location_id, creator,date_created,voided,uuid)
(SELECT patient_id ,48,now(),900006,1,now(),0,uuid()
FROM data_migration_sis_rme_db.patient)


select *
from data_migration_sis_rme_db.encounter
where encounter_type = 53;

select *
from data_migration_sis_rme_db.patient_program ;

select * 
from data_migation_stage_area.table_operation_progress_info ;
(incricao_on_demand_encounter_src_ds.patient_id in (patient_for_enrollment_ds.patient_id) or false) 
and (incricao_on_demand_encounter_src_ds.encounter_type in (0) or true) 
and (incricao_on_demand_encounter_src_ds.location_id in (0) or true)  
and incricao_on_demand_encounter_src_ds.voided = 0
and (true or 1 = (	select 1 
										from 	obs as incricao_inner_obs 
										where 	incricao_inner_obs.concept_id in (0) 
												and incricao_inner_obs.encounter_id = incricao_on_demand_encounter_src_ds.encounter_id 
												and incricao_inner_obs.voided = 0 
										limit 1
									)
	)



select dst.person_id, county_district 
from  data_migration_sesp_cs_polana_cimento.person src inner join data_migration_sesp_cs_polana_cimento.person_address using(person_id)
													inner join data_migration_sis_rme_db.person dst on dst.uuid = src.uuid  
where county_district is not NULL;

select * from data_migration_sis_rme_db.person_address where person_id = 141017;


select * from data_migation_stage_area.obs_dst_stage where migration_status <> 2;


select * from data_migation_stage_area.person_attribute_stage where id = 29  ;
select * from data_migation_stage_area.person_attribute_dst_stage where stage_record_id  = 29  ;


select stage_record_id , count(*)
from data_migation_stage_area.obs_dst_stage 
group by stage_record_id 
having count(*) > 1


select * 
from data_migration_small_sesp_db.person_attribute  
where person_attribute_id = 162453 and value  <> '';


select * 
from data_migration_small_sesp_db.visit 
where visit_id = 1196748513;

select * from data_migration_small_sesp_db.encounter  where visit_id = 12741210;


set foreign_key_checks=0;

update data_migration_small_sesp_db.encounter 
set visit_id = 253225821
where encounter_id in (24414990, 25322582);


select * 
from data_migration_small_sesp_db.obs 
where encounter_id   = 24388866
and concept_id in (856, 1305, 1695, 730, 165515, 1692, 1694, 1693, 887, 1011, 1299, 23723, 23774, 165349, 23951, 165185, 23952, 165520, 307, 165185, 12, 2094, 703, 1649);



select * from data_migration_small_sesp_db.encounter where encounter_type = 35;

select * from data_migration_small_sesp_db.encounter_provider  where encounter_id   = 51146046;


select obs.* 
from data_migration_small_sesp_db.encounter inner join data_migration_small_sesp_db.obs on encounter.encounter_id = obs.encounter_id 
where encounter_type = 35
and concept_id in (23703)
order by encounter_id ;

select obs.* 
from data_migration_sis_rme_db.encounter inner join data_migration_sis_rme_db.obs on encounter.encounter_id = obs.encounter_id 
where encounter_type = 6
and concept_id in (23703)
order by encounter_id ;


 SELECT obs_apss_ds.obs_id obs_apss_ds_obs_id, obs_apss_ds.person_id obs_apss_ds_person_id, obs_apss_ds.concept_id obs_apss_ds_concept_id, obs_apss_ds.encounter_id obs_apss_ds_encounter_id, obs_apss_ds.order_id obs_apss_ds_order_id, obs_apss_ds.obs_datetime obs_apss_ds_obs_datetime, obs_apss_ds.location_id obs_apss_ds_location_id, obs_apss_ds.obs_group_id obs_apss_ds_obs_group_id, obs_apss_ds.accession_number obs_apss_ds_accession_number, obs_apss_ds.value_group_id obs_apss_ds_value_group_id, obs_apss_ds.value_coded obs_apss_ds_value_coded, obs_apss_ds.value_coded_name_id obs_apss_ds_value_coded_name_id, obs_apss_ds.value_drug obs_apss_ds_value_drug, obs_apss_ds.value_datetime obs_apss_ds_value_datetime, obs_apss_ds.value_numeric obs_apss_ds_value_numeric, obs_apss_ds.value_modifier obs_apss_ds_value_modifier, obs_apss_ds.value_text obs_apss_ds_value_text, obs_apss_ds.comments obs_apss_ds_comments, obs_apss_ds.creator obs_apss_ds_creator, obs_apss_ds.date_created obs_apss_ds_date_created, obs_apss_ds.voided obs_apss_ds_voided, obs_apss_ds.voided_by obs_apss_ds_voided_by, obs_apss_ds.date_voided obs_apss_ds_date_voided, obs_apss_ds.void_reason obs_apss_ds_void_reason, obs_apss_ds.value_complex obs_apss_ds_value_complex, obs_apss_ds.uuid obs_apss_ds_uuid, obs_apss_ds.previous_version obs_apss_ds_previous_version, obs_apss_ds.form_namespace_and_path obs_apss_ds_form_namespace_and_path, obs_apss_ds.status obs_apss_ds_status, obs_apss_ds.interpretation obs_apss_ds_interpretation 
 FROM data_migration_small_sesp_db.obs obs_apss_ds 
 WHERE encounter_id = 40448337 
 AND (concept_id in (6340,  6193,  6317,  6318,  6319,  6320,  5271,  6321,  6322,  23887,  23704,  23709,  979,  23716,  6223,  165463,  6315) and voided = 0)

 select * from data_migration_small_sesp_db.encounter where encounter_id  = 40448337;
 
select encounter_id, person_id,count(*) 
from data_migration_sis_rme_db.obs
where concept_id in (1695, 1649)
group by encounter_id, person_id 
having count(*) > 1;


select *
from data_migration_sis_rme_db.obs
where encounter_id = 39883;

select * 
from data_migration_sis_rme_db.encounter ;

use data_migration_small_sesp_db;

select  dose_diaria.sisrme_value, ROUND( DATEDIFF(obs_next_pickup.value_datetime, obs_posologia.obs_datetime  ) , -1) duration,   dose_diaria.sisrme_value *  ROUND( DATEDIFF(obs_next_pickup.value_datetime, obs_posologia.obs_datetime  ) , -1) qty
from sesp_sisrme_metadata_mapping dose_diaria 
					inner join obs obs_posologia on obs_posologia.value_text = dose_diaria.sesp_value and obs_posologia.concept_id = 1711
					inner join obs obs_next_pickup on obs_next_pickup.concept_id = 5096 and obs_posologia.encounter_id = obs_next_pickup.encounter_id 
where dose_diaria.mapping_group='dosing_daily_dose'


select * from data_migration_sis_rme_db.drug where drug_id = 221;

select * from data_migration_small_sesp_db.sesp_sisrme_metadata_mapping ;

select * from data_migration_sis_rme_db.orders;


select (dose_diaria.sisrme_value * ROUND( DATEDIFF(null, null ), -1)) as qty_levantada from sesp_sisrme_metadata_mapping dose_diaria where dose_diaria.mapping_group='dosing_daily_dose' and sesp_value = null


select * from data_migration_small_sesp_db.obs where obs_id = 7645;

select * from data_migration_sis_rme_db.visit;

select * from data_migration_sis_rme_db.visit limit 1;

delete from data_migration_sis_rme_db.visit where visit_id = 61306;

select * from data_migration_sis_rme_db.encounter  ;

select * from data_migration_sis_rme_db.order_group   ;


select * from data_migration_sis_rme_db.pharmacy_batch ;

select * from data_migration_sis_rme_db.pharmacy_transaction     ;

select distinct(order_group_id)
from data_migration_sis_rme_db.encounter inner join data_migration_sis_rme_db.order_group on order_group.encounter_id = encounter.encounter_id
where encounter_type = 17 
group by encounter.patient_id, encounter_datetime
having count(*) > 1



select * from data_migration_small_sesp_db.patient_program ;

select * from data_migration_+sis_rme_db.encounter ;

select drug_id, value_drug 
from data_migration_small_sesp_db.obs inner join data_migration_sis_rme_db.drug on obs.concept_id = drug.concept_id
where value_drug is not NULL ;


select 'drug' mapping_group, sesp.drug_id sesp_value,  sesp.drug_id sisrme_staging_value, sisrme.drug_id sisrme_value, sesp.name, sesp.concept_id    
from data_migration_small_sesp_db.drug  sesp left join data_migration_sis_rme_db.drug  sisrme on sesp.name = sisrme.name
where sisrme.drug_id is null and sesp.drug_id  in (26,46, 51, 52,54, 55) ;

select * 
from data_migration_sis_rme_db.concept_name  
where concept_id  = 23786



select*
from data_migration_sis_rme_db.drug 
where concept_id = 23786;

select*
from data_migration_sis_rme_db.concept  
where concept_id = 23786;





select * from data_migration_sis_rme_db.person where uuid = 'bd6235a0-5485-4c54-8a58-581b2287c593';


select * from data_migration_sis_rme_db.concept where uuid = '06bb05dd-0854-4623-a2d8-db25d2a7f07c';

select * from data_migration_sis_rme_db.drug where drug_id = 12;
commit;


select * from data_migration_small_sesp_db.obs ;

use data_migration_small_sesp_db;

select concept_name.name, obs.value_coded, value_text , value_numeric, answer.name  
from data_migration_small_sesp_db.obs inner join data_migration_small_sesp_db.concept_name  on obs.concept_id = concept_name.concept_id and locale = 'pt' 
								   left join data_migration_small_sesp_db.concept_name answer on answer.concept_id = obs.value_coded  and answer.locale  = 'pt'								   
where obs.concept_id = 1649;

show processlist;

select * from data_migration_sis_rme_db.concept_name where concept_id  = 5622;

select * from data_migation_stage_area.table_operation_progress_info where operation_id like '%startup%';

select * from select * from data_migration_small_sesp_db.patient_program ;

select * from data_migration_sis_rme_db.location ;

select * from data_migration_sis_rme_db.encounter_type where encounter_type_id = 116;

select encounter.patient_id , encounter.encounter_id, encounter.encounter_datetime , order_group.order_group_id, orders.order_id, orders.encounter_id order_encounter_id, drug_order.drug_id, pharmacy_packaged_drug.pharmacy_packaged_drug_id, pharmacy_package.pharmacy_package_id ,  pharmacy_transaction.pharmacy_transaction_id ,  pharmacy_batch.batch_id 
from data_migration_sis_rme_db.visit 	inner join encounter on encounter.visit_id = visit.visit_id 
										inner join order_group on order_group.encounter_id = encounter.encounter_id
										inner join orders on orders.order_group_id  = order_group.order_group_id 
										inner join drug_order on drug_order.order_id  = orders.order_id 
										inner join pharmacy_packaged_drug on pharmacy_packaged_drug.order_id =  orders.order_id 
										inner join pharmacy_package on pharmacy_package.pharmacy_package_id = pharmacy_packaged_drug.pharmacy_package_id 
										inner join pharmacy_transaction on pharmacy_transaction.pharmacy_transaction_id =  pharmacy_packaged_drug.pharmacy_transaction_id 
									    inner join pharmacy_batch on pharmacy_batch.batch_id  = pharmacy_transaction.batch_id 
order by encounter.patient_id, encounter.encounter_datetime 

select * 
from data_migration_sis_rme_db.encounter;

select * 
from data_migration_sis_rme_db.patient;

select * 
from data_migration_sis_rme_db.person_attribute
where person_attribute_type_id = 111;

//delete from data_migration_sis_rme_db.person_attribute where person_attribute_type_id = 111;

delete from data_migration_sis_rme_db.patient;

select date_format(now(), '')

select * from data_migration_sis_rme_db.concept where uuid = '618fc87d-7b1e-4030-899e-bdf97cd07b3b';


select * from data_migration_sis_rme_db.concept_name where concept_id in (1695 ,730 ,165349 ,856 ,1305 ,23951 ,165502 ,1030 , 23952 ,165515, 165185) and locale = 'pt';

use data_migration_small_sesp_db;

select encounter.encounter_type
from obs inner join encounter on obs.encounter_id = encounter.encounter_id
where concept_id in (5088,5085,5086)
group by encounter_type

select * from encounter_type where encounter_type_id in (80,81)


select concept_id, value_coded, COALESCE(obs_datetime, '2018-03-01' - 7) obs_datetime 
from obs where value_coded = 1695 and person_id = 8899 and concept_id = 23722 and obs_datetime < '2018-03-01'


select * 
from data_migration_sis_rme_db.order_group  
where 1=1

select * 
from data_migration_sis_rme_db.orders
where 1=1

select * 
from data_migration_sis_rme_db.obs  
where 1=1




select obs.encounter_id,  obs.obs_id, obs.concept_id,   concept_name.name, obs.value_coded, value_text , value_numeric, answer.name  
from data_migration_sis_rme_db.obs inner join data_migration_sis_rme_db.concept_name  on obs.concept_id = concept_name.concept_id and locale = 'pt' 
								   inner join data_migration_sis_rme_db.encounter on encounter.encounter_id = obs.encounter_id  
									left join data_migration_sis_rme_db.concept_name answer on answer.concept_id = obs.value_coded  and answer.locale  = 'pt'
								   
where encounter_type = 6 and obs.concept_id = 165323 and obs_id > 52013;

select * from data_migration_sis_rme_db.obs where obs_group_id = 101471 or encounter_id = 53313;


select * from data_migration_sis_rme_db.encounter_type  ;

select * 
from data_migation_stage_area.encounter_stage 
where compacted_object_uk like '%59fe16ed-6d59-4dcf-bb26-f3475769cc8c%'




select * 
from data_migation_stage_area.encounter_dst_stage  
where stage_record_id = 44370

134


select * 
from data_migration_small_sesp_db.obs 
where encounter_id = 134;


select * 
from data_migration_small_sesp_db.obs 
where concept_id = 23703 and location_id in (627,611);

select * 
from data_migration_sis_rme_db.obs  
where uuid='6b9302bf-d90f-4c2b-a9fd-482a708e76fa';


select uuid from data_migration_sis_rme_db.provider  where uuid = 'f7ed7764-db3b-41cd-b9c9-2eb5d6d53c11';

select * from data_migration_sis_rme_db.concept_name where concept_id = 234068;

 select * 
 from data_migation_stage_area.obs_stage 
 where last_sync_try_err is not null;
 
select * from data_migation_stage_area.table_operation_progress_info;


 
select id, operation_id, total_records , total_processed_records 
from data_migation_stage_area.table_operation_progress_info
where operation_id like 'etl%resumo%'
order by id;


select encounter_type , count(*)
from data_migration_sis_rme_db.encounter 
group by encounter_type ;


select *
from data_migration_sis_rme_db.encounter 
where encounter_type = 147;


select *
from data_migration_sis_rme_db.encounter inner join  data_migration_sis_rme_db.person_attribute on person_attribute.person_id = patient_id 
										 inner join data_migration_sis_rme_db.person_address on person_address.person_id = patient_id 
where encounter_type = 147 and person_attribute_type_id = 111 and address1 is not null;

select * from data_migration_sis_rme_db.person_address where address1 is not null;


select * from data_migration_sis_rme_db.person_complex_attribute ;
select * from data_migration_sis_rme_db.person_complex_attribute_detail;

select * 
from data_migration_sis_rme_db.person_attribute
where person_attribute_type_id = 111;



select * from data_migration_sesp_cs_polana_cimento.location where location_id >= 900000;

select * from data_migration_sis_rme_db.location_tag_map  where location_id  >= 900000;

select * from data_migration_sis_rme_db.location_attribute  where location_id  = 900007;




select * from data_migration_sis_rme_db.person_complex_attribute_detail where person_complex_attribute_id = 64000 ;
select * from data_migration_sis_rme_db.person_attribute where value = '64000' ;


select * from data_migration_sis_rme_db.person where person_id = 163031;
select * from data_migration_small_sesp_db.person where uuid = '83dded41-66b6-41a4-9794-6fe9ccbf540b';

select location.uuid
from data_migration_small_sesp_db.patient_program  left join data_migration_small_sesp_db.location on location.location_id = patient_program.location_id 
where patient_id = 8641;

select *
from data_migration_small_sesp_db.location 
where uuid = '6d960146-3369-4c12-97b3-66a583b33f9f';

select *
from data_migration_sis_rme_db.location 
where name like '%luabo%';


select * from data_migration_small_sesp_db.sesp_sisrme_metadata_mapping where sisrme_value  ='03484a20-0d8f-11f1-834f-eee0cfb2831d';

select uuid,location_id  from data_migration_small_sesp_db.location where uuid in ('8c88d5b5-1dec-439b-bdbc-bab4eb1995d2', '8c80f828-1dfc-452b-8887-5bbff03d4705');

select * from data_migration_sis_rme_db.allergy ;

select * from data_migration_small_sesp_db.patient where patient_id =  295554

select * 
from data_migration_small_sesp_db.sesp_sisrme_metadata_mapping; 

select * from data_migration_sis_rme_db.encounter ;

select * 
from data_migration_small_sesp_db.location 
where location_id  in (611, 627) 

select *
from data_migration_sis_rme_db.location 
where name like '%Monei%'

use data_migration_sis_rme_db;

delete 
from encounter_program 
where exists (
	select * 
	from encounter 
	where encounter_type in (116, 117)
	and encounter_program.encounter_id = encounter.encounter_id
);

delete 
from obs
where exists (
	select * 
	from encounter 
	where encounter_type in (116, 117)
	and obs.encounter_id = encounter.encounter_id
);


delete 
from encounter_provider
where exists (
	select * 
	from encounter 
	where encounter_type in (116, 117)
	and encounter_provider.encounter_id = encounter.encounter_id
);


delete from test_order;

delete from orders;

delete from order_group;

delete 
from encounter 
where encounter_type in (116, 117)

 SELECT *
 FROM data_migration_small_sesp_db.obs obs_orders_01_01 
 WHERE encounter_id = 5
 AND (concept_id in (1695,730,165515))
 

 SELECT *
 FROM data_migration_small_sesp_db.encounter 
 WHERE encounter_id = 5
 
use data_migration_sis_rme_db;

use data_migration_small_sesp_db;
 

set @location_to_migrate = 2;

select *  
from patient patient_for_enrollment_ds
where patient_for_enrollment_ds.voided = 0
and ( 
		(1 = (	select 1 
		  		from 	encounter e
		  		where 	e.patient_id = patient_for_enrollment_ds.patient_id 
						and e.voided = 0 
						and e.encounter_type in (5,7) 
						and e.encounter_datetime<=curdate() 
						and e.location_id in (@location_to_migrate) 
		  		limit 0)
		) 

		OR 
		
		( 1 = (	select 1
				from 	patient_program pg
				where 	pg.patient_id = patient_for_enrollment_ds.patient_id
						and pg.voided = 0 
						and program_id in (1,2) 
						and date_enrolled <= curdate() 
						and location_id in (@location_to_migrate)
				limit 1)
		)

		OR

		( 1 = (	select 1	
				from 	encounter e inner join obs o on e.encounter_id = o.encounter_id
				where 	e.patient_id = patient_for_enrollment_ds.patient_id
						and e.voided = 0 
						and o.voided = 0 
						and e.encounter_type	=  53 
						and o.concept_id     	=  23891 
						and o.value_datetime is not null 
						and o.value_datetime 	<= curdate() 
						and e.location_id in (@location_to_migrate)
				limit 1)
		)
	);
 
 
 select * 
 from data_migration_small_sesp_db.obs inner join data_migration_small_sesp_db.encounter using (encounter_id)
 where concept_id = 1040 and encounter_type = 53;
 
 select * from encounter_type where name like '%rapi%';
 


  SELECT * 
 FROM INFORMATION_SCHEMA.TABLES
 WHERE 	1 = 1
 		AND  TABLE_SCHEMA = 'data_migation_stage_area'
		AND  TABLE_NAME = 'visit_stage';
  

  
 select  * 
 from data_migation_stage_area.default_generated_object_key 


  SELECT default_generated_object_key.id default_generated_object_key_id,
		default_generated_object_key.table_name default_generated_object_key_table_name,
		default_generated_object_key.column_name default_generated_object_key_column_name,
		default_generated_object_key.key_value default_generated_object_key_key_value
FROM data_migation_stage_area.default_generated_object_key 
WHERE 	(default_generated_object_key.table_name = 'wq'  AND default_generated_object_key.column_name = 'dsd' )	

select *
from data_migation_stage_area.default_generated_object_key ;

 