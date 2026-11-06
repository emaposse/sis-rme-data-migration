1 = 1
and ${aliases_prefix}_encounter_src_ds.encounter_type in (${src_encounter_type_id})
and ${aliases_prefix}_encounter_src_ds.location_id in (${location_list})
and ${aliases_prefix}_encounter_src_ds.voided = 0
and 1 = (   select 1 
            from  obs as ${aliases_prefix}_inner_obs 
            where       ${aliases_prefix}_inner_obs.concept_id in (${concept_list}) 
                        and ${aliases_prefix}_inner_obs.encounter_id = encounter_id 
                        and ${aliases_prefix}_inner_obs.voided = 0 
            limit 1
      )
and ${extra_condition}