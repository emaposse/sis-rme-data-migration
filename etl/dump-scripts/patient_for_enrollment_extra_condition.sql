patient_for_enrollment_ds.voided = 0
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
						and pg.program_id in (1,2) 
						and pg.date_enrolled <= curdate() 
						and pg.location_id in (@location_to_migrate)
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
	)