DROP TABLE IF EXISTS sesp_sisrme_tmp_encounter;

CREATE TABLE sesp_sisrme_tmp_encounter (
    id INT NOT NULL AUTO_INCREMENT,
    patient_id INT NOT NULL,
    encounter_id INT NOT NULL,
    deletable TINYINT(1) NOT NULL DEFAULT 1,

    PRIMARY KEY (id),

    UNIQUE KEY unq_tmp_encounter_id (encounter_id),
    KEY idx_tmp_patient_deletable (patient_id, deletable),

    CONSTRAINT tmp_encounter_fk
        FOREIGN KEY (encounter_id)
        REFERENCES encounter (encounter_id)
        ON DELETE CASCADE,

    CONSTRAINT tmp_patient_fk
        FOREIGN KEY (patient_id)
        REFERENCES patient (patient_id)
        ON DELETE CASCADE
);

SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO sesp_sisrme_tmp_encounter (
    patient_id,
    encounter_id
)
SELECT
    e.patient_id,
    e.encounter_id
FROM encounter AS e
INNER JOIN (
    SELECT patient_id
    FROM encounter
    WHERE encounter_type = 53
      AND encounter_datetime >= '2026-05-22'
    GROUP BY patient_id
    HAVING COUNT(*) > 1
) AS duplicated_patients
    ON duplicated_patients.patient_id = e.patient_id
WHERE e.encounter_type = 53
  AND e.encounter_datetime >= '2026-05-22';

UPDATE sesp_sisrme_tmp_encounter AS tmp
INNER JOIN (
    SELECT
        patient_id,
        MAX(encounter_id) AS encounter_id_to_keep
    FROM sesp_sisrme_tmp_encounter
    GROUP BY patient_id
) AS preserved
    ON preserved.patient_id = tmp.patient_id
   AND preserved.encounter_id_to_keep = tmp.encounter_id
SET tmp.deletable = 0;

UPDATE obs AS o
INNER JOIN sesp_sisrme_tmp_encounter AS duplicate_encounter
    ON duplicate_encounter.encounter_id = o.encounter_id
   AND duplicate_encounter.deletable = 1
INNER JOIN sesp_sisrme_tmp_encounter AS preserved_encounter
    ON preserved_encounter.patient_id = duplicate_encounter.patient_id
   AND preserved_encounter.deletable = 0
SET o.encounter_id = preserved_encounter.encounter_id;  
							
delete from encounter_provider where encounter_id in (select tmp.encounter_id from sesp_sisrme_tmp_encounter tmp where tmp.deletable = 1);

DELETE e
FROM encounter AS e
INNER JOIN sesp_sisrme_tmp_encounter AS tmp ON tmp.encounter_id = e.encounter_id
WHERE tmp.deletable = 1;

COMMIT;

SET AUTOCOMMIT = 0;

DROP TABLE IF EXISTS sesp_sisrme_tmp_encounter;

