create table openmrs_cs_polana.tmp_apss_max(
	patient_id int(11) not null,
	max_apss_date datetime not null,
	PRIMARY KEY (`patient_id`)
);

insert ignore into openmrs_cs_polana.tmp_apss_max(patient_id, max_apss_date)
(select patient_id, max(encounter_datetime)
from openmrs_cs_polana.encounter
where voided = 0 and encounter_type = 18
group by patient_id
);


use moz_emr_api;

INSERT INTO moz_emr_api.pharmacy_batch(drug_id, batch_number, expiry_date, quantity, balance, location_id, creator, date_created, voided, uuid)
(SELECT drug_id, concat('mig_batch_', drug_id) , '2030-01-01', 0, 0, 900006, 1, now(), 0, uuid()
 FROM moz_emr_api.drug
);