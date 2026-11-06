select  encounter_for_enrollment_src_ds.encounter_datetime as date_enrolled,
		encounter_for_enrollment_src_ds.encounter_datetime as start_date,
		11 as state,
		6 as program_id,
		@dst_location_id as location_id
from dual