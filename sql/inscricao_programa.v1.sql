SELECT
    patient_id,
    min(initialDate) as initialDate
FROM
(
    SELECT
    p.patient_id,
    MIN(o.value_datetime) AS initialDate
FROM
    patient p
INNER JOIN encounter e ON
    e.patient_id = p.patient_id
INNER JOIN obs o on
    o.encounter_id = e.encounter_id
WHERE
    e.voided = 0
    AND o.voided = 0
    AND e.encounter_type = 53
    AND o.value_datetime IS NOT NULL
    AND o.concept_id = 23808
    AND e.location_id IN(${location_list})
GROUP BY
    p.patient_id
UNION 
            SELECT
    p.patient_id,
    min(e.encounter_datetime) AS initialDate
FROM
    patient p
INNER JOIN encounter e ON
    e.patient_id = p.patient_id
INNER JOIN obs o on
    o.encounter_id = e.encounter_id
WHERE
    e.voided = 0
    AND o.voided = 0
    AND e.encounter_type IN(5, 7)
    AND e.location_id IN(${location_list})
GROUP BY
    p.patient_id
UNION  
            SELECT
    pg.patient_id,
    min(pg.date_enrolled) AS initialDate
FROM
    patient p
INNER JOIN patient_program pg on
    pg.patient_id = p.patient_id
WHERE
    pg.program_id in(1, 2)
    AND pg.voided = 0
    AND pg.location_id IN(${location_list})

GROUP BY
    patient_id
    )artInitialDate
    GROUP BY patient_id
