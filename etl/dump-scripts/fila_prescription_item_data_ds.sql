select 	obs_formulacao.value_drug,
		obs_formulacao.value_coded formulacao_concept_id,
		obs_formulacao.obs_datetime package_datetime,
		obs_posologia.value_text posologia,
		obs_qty.value_numeric specified_qty,
		(dose_diaria.sisrme_value *  ROUND( DATEDIFF(${aliases_prefix}_header_data_src_ds.next_pickup_date, obs_formulacao.obs_datetime), -1)) as calculated_qty
from  obs obs_formulacao 						
		left  join obs obs_qty  							on obs_qty.obs_group_id 				= ${aliases_prefix}_groupping_obs_ds.obs_id 	and obs_qty.concept_id 			= 1715 								and obs_qty.voided 			= 0
 		left  join obs obs_posologia 						on obs_posologia.obs_group_id 			= ${aliases_prefix}_groupping_obs_ds.obs_id 	and obs_posologia.concept_id 	= 1711								and obs_posologia.voided 	= 0
 		left  join obs obs_outra_posologia 					on obs_outra_posologia.obs_group_id 	= ${aliases_prefix}_groupping_obs_ds.obs_id 	and obs_posologia.concept_id 	= 165263							and obs_outra_posologia.voided 	= 0
 		left  join sesp_sisrme_metadata_mapping dose_diaria on dose_diaria.mapping_group  			= 'dosing_daily_dose' 							and sesp_value 					= COALESCE(obs_outra_posologia.value_text, obs_posologia.value_text)
where  	obs_formulacao.obs_group_id 	= ${aliases_prefix}_groupping_obs_ds.obs_id
		and obs_formulacao.concept_id   = 165256
		and obs_formulacao.voided		= 0