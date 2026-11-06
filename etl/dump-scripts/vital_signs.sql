select      obs_temperatura.value_numeric temperature, 
            obs_tensao_sistotica.value_numeric blood_pressure_systolic, 
            obs_tensao_distolica.value_numeric blood_pressure_diastolic
from encounter    left join obs obs_temperatura       on encounter.encounter_id = obs_temperatura.encounter_id       and obs_temperatura.concept_id      = 5088 and obs_temperatura.voided 		= 0
                  left join obs obs_tensao_sistotica  on encounter.encounter_id = obs_tensao_sistotica.encounter_id  and obs_tensao_sistotica.concept_id = 5085 and obs_tensao_sistotica.voided = 0
                  left join obs obs_tensao_distolica  on encounter.encounter_id = obs_tensao_distolica.encounter_id  and obs_tensao_distolica.concept_id = 5086 and obs_tensao_distolica.voided = 0
where encounter.encounter_id = ${aliases_prefix}_encounter_src_ds.encounter_id
limit 1