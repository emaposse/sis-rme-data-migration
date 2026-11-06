select 	obs_proximo_levantamento.value_datetime next_pickup_date,		
		null dispense_mode_id
from 	encounter e
		left join obs obs_proximo_levantamento 	on obs_proximo_levantamento.encounter_id = ${aliases_prefix}_encounter_src_ds.encounter_id 	and obs_proximo_levantamento.concept_id = 165228 and obs_proximo_levantamento.voided = 0
where  e.encounter_id = ${aliases_prefix}_encounter_src_ds.encounter_id