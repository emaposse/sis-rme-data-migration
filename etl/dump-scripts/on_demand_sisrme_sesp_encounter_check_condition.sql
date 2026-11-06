encounter_id = (
					select	distinct(encounter_id) 
					from	encounter e 
					where 	e.encounter_type=53 
							and e.patient_id=condition_obs_dst_ds.person_id 
							and encounter_datetime=condition_obs_dst_ds.obs_datetime limit 1
				)