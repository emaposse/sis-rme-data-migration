select 	obs_proximo_levantamento.value_datetime next_pickup_date,		
		obs_modo_dispensa.value_coded dispense_mode_id
from 	encounter e
		left join obs obs_proximo_levantamento 	on obs_proximo_levantamento.encounter_id = ${aliases_prefix}_encounter_src_ds.encounter_id 	and obs_proximo_levantamento.concept_id = 5096 		and obs_proximo_levantamento.voided = 0
		left join obs obs_modo_dispensa  		on obs_modo_dispensa.encounter_id 		 = ${aliases_prefix}_encounter_src_ds.encounter_id 	and obs_modo_dispensa.concept_id        = 165174	and obs_modo_dispensa.voided = 0
where  e.encounter_id = ${aliases_prefix}_encounter_src_ds.encounter_id