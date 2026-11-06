exists (select *  from encounter e1 inner join tmp_patient_with_no_c_inicial tmp on e1.patient_id = tmp.patient_id where e1.encounter_type in (147,6)  and e1.encounter_id = ep2.encounter_id)
and 1 != (	select 1 
			from encounter src_encounter inner join @dst_db.encounter dst_encounter on src_encounter.uuid = dst_encounter.uuid
									 	 inner join @dst_db.encounter_provider existing_ep on existing_ep.encounter_id = dst_encounter.encounter_id)