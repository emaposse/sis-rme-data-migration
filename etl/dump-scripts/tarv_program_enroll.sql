select 	errolment.date_enrolled date_enrolled,
		errolment.date_enrolled start_date,
		transfere.date_transferred date_transferred,
		91 state,
		2 program_id,
		@dst_location_id location_id,
		transferred_from_location_uuid,
		1065 yes_concept_id
from 
(
	select errolment.patient_id, min(date_enrolled) date_enrolled
	from 
	(
		select 	e.patient_id, 
				min(e.encounter_datetime) date_enrolled 
		from 	encounter e
		where 	e.patient_id = @patient_id 
				and e.voided = 0 
				and e.encounter_type in (5,7) 
				and e.encounter_datetime<=curdate() 
				and e.location_id in (@location_to_migrate) 
		group by e.patient_id

		union

		select 	pg.patient_id,
				min(date_enrolled) date_enrolled
		from 	patient_program pg
		where 	pg.patient_id = @patient_id 
				and pg.voided = 0 
				and program_id in (1,2) 
				and date_enrolled <= curdate() 
				and location_id in (@location_to_migrate)
		group by pg.patient_id

		union

		Select 	e.patient_id, 
				min(o.value_datetime) date_enrolled
		from 	encounter e inner join obs o on e.encounter_id = o.encounter_id
		where 	e.patient_id = @patient_id 
				and e.voided = 0 
				and o.voided = 0 
				and e.encounter_type	=  53 
				and o.concept_id     	=  23891 
				and o.value_datetime is not null 
				and o.value_datetime 	<= curdate() 
				and e.location_id in (@location_to_migrate)
		group by e.patient_id
	) errolment
	group by errolment.patient_id
) errolment

left join 
(
	select transfere.patient_id, max(minStateDate) date_transferred, transferred_from_location_uuid
	from 
	(
		Select 	e.patient_id, 
				min(obsTrans.obs_datetime) as minStateDate,
				null transferred_from_location_uuid
		from 	encounter e inner join obs obsTrans on e.encounter_id = obsTrans.encounter_id and obsTrans.voided = 0 and obsTrans.concept_id = 1369 and obsTrans.value_coded = 1065
		where 	e.patient_id = @patient_id 
				and e.voided			= 0 
				and e.encounter_type	= 53 
				and e.location_id in (@location_to_migrate) 
				and obsTrans.obs_datetime <= curdate()
		group by e.patient_id, null
				
		union 	
				
		select minState.patient_id, minState.minStateDate, transferred_from_location_uuid 
		from  (
					SELECT 	pg.patient_id, 
							pg.patient_program_id, MIN(ps.start_date) as minStateDate,
							location.uuid transferred_from_location_uuid
					FROM 	patient_program pg 
							inner join patient_state ps on pg.patient_program_id=ps.patient_program_id 
							left join location on location.location_id = pg.location_id
					WHERE 	pg.patient_id = @patient_id 
							and pg.voided		= 0 
							and ps.voided		= 0 
							and pg.program_id 	= 2 
							and pg.location_id in (@location_to_migrate)  
							and ps.start_date<=curdate() 

					GROUP BY pg.patient_id, pg.patient_program_id
			) minState inner join patient_state ps on ps.patient_program_id = minState.patient_program_id 
			where 	ps.start_date 	= minState.minStateDate 
					and ps.state 	= 29 
					and ps.voided	= 0 
	) transfere
	group by transfere.patient_id, transfere.transferred_from_location_uuid
) transfere on transfere.patient_id = errolment.patient_id