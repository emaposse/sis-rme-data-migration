not exists (
				select * 
				from obs prep_type_obs 
				where 	prep_type_obs.encounter_id = encounter_for_tipo_prep_src_ds.encounter_id 
						and prep_type_obs.concept_id = @prep_type_concept_id  
						and prep_type_obs.voided = 0 
				limit 1
			)
	and exists (
					select * 
					from obs prep_regime_obs 
					where 	prep_regime_obs.encounter_id = encounter_for_tipo_prep_src_ds.encounter_id 
							and prep_regime_obs.concept_id = @prep_regime_concept_id
							and prep_regime_obs.value_coded in (165214, 165215)  
							and prep_regime_obs.voided = 0 limit 1
				)