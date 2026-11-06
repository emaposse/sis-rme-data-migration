order_group_id = (
	select distinct(order_group_id)
	from encounter e inner join order_group og on og.encounter_id = e.encounter_id
	where e.encounter_type=${dst_order_encounter_type_id} and encounter.patient_id=${patient_id} and encounter_datetime=${order_date}
	limit 1
)