select 	sisrme_value value_drug,
		obs_regime.value_coded formulacao_concept_id,
		obs_regime.obs_datetime package_datetime,
		'1-0-0' as posologia,
		obs_qty.value_numeric specified_qty,
		1 as calculated_qty
from  obs obs_regime 	
 		inner  join sesp_sisrme_metadata_mapping drug_src_ds 	on obs_regime.value_coded  		= sesp_value 										and drug_src_ds.mapping_group	= 'sesp_concept_to_sirme_drug' 
 		left  join obs obs_qty  								on obs_qty.encounter_id 		= ${aliases_prefix}_encounter_src_ds.encounter_id 	and obs_qty.concept_id 	= 165217 and obs_qty.voided = 0 		
where  	obs_regime.encounter_id 	= ${aliases_prefix}_encounter_src_ds.encounter_id
		and obs_regime.concept_id   = 165213
		and obs_regime.voided		= 0