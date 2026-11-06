select patient_id, DATE_FORMAT(data_inicio_tarv,'%Y-%m-%dT%H:%i:%s.000Z') data_inicio_tarv
from (
	select patient_id,data_inicio_tarv from
	(
		  select patient_id, min(data_inicio_tarv) data_inicio_tarv
		  from
				(
					select e.patient_id, min(e.encounter_datetime) data_inicio_tarv
					from 	encounter e inner join obs o on o.encounter_id=e.encounter_id
					where 	e.patient_id = @patient_id
					  		and e.voided=0 
					  		and o.voided=0 
					  		and e.encounter_type in (18,6,9)
							and o.concept_id=1255 
							and o.value_coded=1256 and e.encounter_datetime<=now() 
							and e.location_id=@location_to_migrate
					group by e.patient_id
					  
					union
					
					select  e.patient_id, min(value_datetime) data_inicio_tarv
					from 	encounter e inner join obs o on e.encounter_id=o.encounter_id
					where  	e.patient_id = @patient_id
							and e.voided=0 
					  		and o.voided=0 
					  		and e.encounter_type in (18,6,9,53)
							and o.concept_id=1190 
							and o.value_datetime is not null and o.value_datetime<=now() 
							and e.location_id=@location_to_migrate
					group by e.patient_id
					
					union
		
					select  pg.patient_id, min(date_enrolled) data_inicio_tarv
					from 	patient_program pg
					where 	pg.patient_id = @patient_id
							and pg.voided=0 
					  		and  program_id=2 
					  		and date_enrolled<=now() 
					  		and location_id=@location_to_migrate
					group by pg.patient_id
					
					union
	
					select 	e.patient_id, min(e.encounter_datetime) as data_inicio_tarv
					from	encounter e
					where  	e.patient_id = @patient_id
							and e.encounter_type=18 
							and e.voided=0 
							and e.encounter_datetime<=now() 
							and e.location_id=@location_to_migrate
					group by e.patient_id
					
					union
		
					select  e.patient_id, min(value_datetime) data_inicio_tarv
					from 	encounter e inner join obs o on e.encounter_id=o.encounter_id
					where  	e.patient_id = @patient_id
							and e.voided=0 
							and o.voided=0 
							and e.encounter_type=52
							and o.concept_id=23866 
							and o.value_datetime is not null 
							and o.value_datetime<=now() 
							and e.location_id=@location_to_migrate
					group by e.patient_id
				)
		  art_start group by patient_id
	) tx_new where data_inicio_tarv <= now() and data_inicio_tarv < '2023-12-21'
	
	union
	
	select tx_new.patient_id, tx_new.data_inicio_tarv
	from
	(
		  select tx_new.patient_id, tx_new.data_inicio_tarv
		  from
		  (
				select patient_id, data_inicio_tarv from
				(
					  select patient_id, min(data_inicio_tarv) data_inicio_tarv
					  from
							(
								select 	e.patient_id, min(e.encounter_datetime) as data_inicio_tarv
								from  	encounter e
								where  	e.patient_id = @patient_id
								  			and e.encounter_type=18 
								  			and e.voided=0 
								  			and e.encounter_datetime<=now() 
								  			and e.location_id=@location_to_migrate
								group by e.patient_id
								
								union
					
								select  e.patient_id, min(value_datetime) data_inicio_tarv
								from 	encounter e inner join obs o on e.encounter_id=o.encounter_id
								where  	e.patient_id = @patient_id
										and e.voided=0 
										and o.voided=0 
										and e.encounter_type=52
										and o.concept_id=23866 
										and o.value_datetime is not null 
										and o.value_datetime<=now() 
										and e.location_id=@location_to_migrate
								group by e.patient_id
							)
					  art_start group by patient_id
				) tx_new where data_inicio_tarv <= now() and data_inicio_tarv >= '2023-12-21'
		  ) tx_new
		  left join
		  (
				select patient_id from
				(
					  select patient_id, min(data_inicio_tarv) data_inicio_tarv
					  from
							(
								select e.patient_id, min(e.encounter_datetime) data_inicio_tarv
								from encounter e inner join obs o on o.encounter_id=e.encounter_id
								where 	e.patient_id = @patient_id 
								  		and e.voided=0 
								  		and o.voided=0 
								  		and  e.encounter_type in (18,6,9)
										and o.concept_id=1255 
										and o.value_coded=1256 
										and e.encounter_datetime<=now() 
										and e.location_id=@location_to_migrate
								group by e.patient_id
								  
								union
								
								select 	e.patient_id, min(value_datetime) data_inicio_tarv
								from 	encounter e inner join obs o on e.encounter_id=o.encounter_id
								where  	e.patient_id = @patient_id 
										and e.voided=0 
										and o.voided=0 
										and e.encounter_type in (18,6,9,53)
										and o.concept_id=1190 
										and o.value_datetime is not null 
										and o.value_datetime<=now() 
										and e.location_id=@location_to_migrate
								group by e.patient_id
								
								union
					
								select 	pg.patient_id, min(date_enrolled) data_inicio_tarv
								from 	patient_program pg
								where 	pg.patient_id = @patient_id 
										and pg.voided=0 
										and  program_id=2 
										and date_enrolled<=now() 
										and location_id=@location_to_migrate
								group by pg.patient_id
							)
					  art_start group by patient_id
				) tx_new where data_inicio_tarv < '2023-12-21'
		  ) tx_new_period_anterior on tx_new.patient_id = tx_new_period_anterior.patient_id
		   where tx_new_period_anterior.patient_id is null
	) tx_new
) inicio