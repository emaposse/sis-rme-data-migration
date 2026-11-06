select  COALESCE(prep_enrollment_date_obs.value_datetime, encounter_for_enrollment_src_ds.encounter_datetime) as date_enrolled,
		prep_enrollment_date_obs.value_datetime as start_date,
		112 as state,
		25 as program_id,
		@dst_location_id as location_id
from (select encounter_for_enrollment_src_ds.encounter_id from dual) encounter_src_ds  
		left join obs prep_enrollment_date_obs on prep_enrollment_date_obs.concept_id = 165211 and prep_enrollment_date_obs.encounter_id = encounter_for_enrollment_src_ds.encounter_id and prep_enrollment_date_obs.voided = 0
		left join obs prep_initial_state_obs on prep_initial_state_obs.concept_id = 165296 and prep_initial_state_obs.encounter_id = encounter_for_enrollment_src_ds.encounter_id and prep_initial_state_obs.voided = 0
limit 1