DROP TABLE IF EXISTS sesp_sisrme_tmp_encounter;

CREATE TABLE sesp_sisrme_tmp_encounter (
    id INT NOT NULL AUTO_INCREMENT,
    patient_id INT NOT NULL,
    encounter_id INT NOT NULL,
    encounter_datetime DATETIME NOT NULL,
    voided TINYINT(1) NOT NULL,

    /*
     * Quantidade original de OBS do encounter
     */
    obs_count INT NOT NULL DEFAULT 0,

    /*
     * 0 = preservar
     * 1 = eliminar
     */
    deletable TINYINT(1) NOT NULL DEFAULT 0,

    PRIMARY KEY (id),

    UNIQUE KEY unq_tmp_encounter_id (encounter_id),

    KEY idx_tmp_patient_datetime_deletable (
        patient_id,
        encounter_datetime,
        deletable
    ),

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


/*
 * ============================================================
 * 1. IDENTIFICAR OS ENCOUNTERS DUPLICADOS
 *
 * IMPORTANTE:
 * Encounters contendo OBS com comments='IDMED'
 * são completamente excluídos antes do agrupamento.
 * ============================================================
 */
INSERT INTO sesp_sisrme_tmp_encounter (
    patient_id,
    encounter_id,
    encounter_datetime,
    voided,
    obs_count,
    deletable
)
SELECT
    e.patient_id,
    e.encounter_id,
    e.encounter_datetime,
    e.voided,

    (
        SELECT COUNT(*)
        FROM obs AS o
        WHERE o.encounter_id = e.encounter_id
          AND o.voided = 0
    ) AS obs_count,

    /*
     * voided = 1 -> eliminar
     * voided = 0 -> preservar
     */
    CASE
        WHEN e.voided = 1 THEN 1
        ELSE 0
    END AS deletable

FROM encounter AS e

INNER JOIN (

    /*
     * Aqui identificamos os grupos APÓS
     * excluir encounters IDMED.
     */
    SELECT
        e2.patient_id,
        e2.encounter_datetime

    FROM encounter AS e2

    WHERE e2.encounter_type = 6
      AND e2.encounter_datetime >= '2026-05-22'

    GROUP BY
        e2.patient_id,
        e2.encounter_datetime

    /*
     * Depois de retirar IDMED,
     * ainda tem que existir pelo menos:
     *
     * 1 encounter ativo
     * 1 encounter voided
     */
    HAVING SUM(e2.voided = 0) > 0
       AND SUM(e2.voided = 1) > 0

) AS duplicated
    ON duplicated.patient_id = e.patient_id
   AND duplicated.encounter_datetime = e.encounter_datetime

WHERE e.encounter_type = 6
  AND e.encounter_datetime >= '2026-05-22'


/*
 * ============================================================
 * 2. VISUALIZAR O QUE SERÁ PROCESSADO
 * ============================================================
 */
SELECT
    patient_id,
    encounter_id,
    encounter_datetime,
    voided,
    obs_count,
    deletable,

    CASE
        WHEN deletable = 1 THEN 'ELIMINAR'
        ELSE 'PRESERVAR'
    END AS action

FROM sesp_sisrme_tmp_encounter

ORDER BY
    patient_id,
    encounter_datetime,
    voided,
    encounter_id;


/*
 * ============================================================
 * 3. VALIDAÇÃO
 *
 * Deve existir exatamente UM encounter ativo para receber
 * as OBS.
 *
 * Esta query deve retornar ZERO linhas.
 * ============================================================
 */
SELECT
    patient_id,
    encounter_datetime,

    COUNT(*) AS total_encounters,

    SUM(voided = 0) AS active_encounters,

    SUM(voided = 1) AS voided_encounters,

    SUM(obs_count) AS total_obs

FROM sesp_sisrme_tmp_encounter

GROUP BY
    patient_id,
    encounter_datetime

HAVING SUM(voided = 0) <> 1;

SELECT * 
FROM encounter 
where patient_id = 15376 and encounter_datetime = '2026-07-07 00:00:00' and encounter_type  = 6
and not exists (select * from obs where encounter.encounter_id = obs.encounter_id )


DELETE FROM encounter where encounter_id in (1172228, 1172235, 1174374, 1174375,1173373);

select * from patient_identifier where patient_id = 15376;

select * from person_name where person_id = 15376;


/*
 * ============================================================
 * 4. VISUALIZAR AS TRANSFERÊNCIAS
 *
 * Antes de executar o UPDATE, conseguimos ver:
 *
 * source -> target
 * ============================================================
 */
SELECT
    duplicate_encounter.patient_id,
    duplicate_encounter.encounter_datetime,

    duplicate_encounter.encounter_id
        AS source_encounter_id,

    duplicate_encounter.obs_count
        AS source_obs_count,

    preserved_encounter.encounter_id
        AS target_encounter_id,

    preserved_encounter.obs_count
        AS target_obs_count,

    duplicate_encounter.obs_count
        + preserved_encounter.obs_count
        AS expected_target_obs_count

FROM sesp_sisrme_tmp_encounter AS duplicate_encounter

INNER JOIN sesp_sisrme_tmp_encounter AS preserved_encounter
    ON preserved_encounter.patient_id =
       duplicate_encounter.patient_id

   AND preserved_encounter.encounter_datetime =
       duplicate_encounter.encounter_datetime

   AND preserved_encounter.deletable = 0

WHERE duplicate_encounter.deletable = 1

ORDER BY
    duplicate_encounter.patient_id,
    duplicate_encounter.encounter_datetime;


/*
 * ============================================================
 * 5. MOVER AS OBS
 *
 * voided encounter
 *        |
 *        v
 * active encounter
 * ============================================================
 */
UPDATE obs AS o

INNER JOIN sesp_sisrme_tmp_encounter AS duplicate_encounter
    ON duplicate_encounter.encounter_id = o.encounter_id
   AND duplicate_encounter.deletable = 1

INNER JOIN sesp_sisrme_tmp_encounter AS preserved_encounter
    ON preserved_encounter.patient_id =
       duplicate_encounter.patient_id

   AND preserved_encounter.encounter_datetime =
       duplicate_encounter.encounter_datetime

   AND preserved_encounter.deletable = 0

SET o.encounter_id = preserved_encounter.encounter_id;


/*
 * ============================================================
 * 6. REMOVER ENCOUNTER_PROVIDER DOS ENCOUNTERS A ELIMINAR
 * ============================================================
 */
DELETE ep
FROM encounter_provider AS ep

INNER JOIN sesp_sisrme_tmp_encounter AS tmp
    ON tmp.encounter_id = ep.encounter_id

WHERE tmp.deletable = 1;


/*
 * ============================================================
 * 7. ELIMINAR OS ENCOUNTERS DUPLICADOS
 * ============================================================
 */
DELETE e
FROM encounter AS e

INNER JOIN sesp_sisrme_tmp_encounter AS tmp
    ON tmp.encounter_id = e.encounter_id

WHERE tmp.deletable = 1;


/*
 * ============================================================
 * 8. FINALIZAR
 * ============================================================
 */
COMMIT;

SET AUTOCOMMIT = 1;

DROP TABLE IF EXISTS sesp_sisrme_tmp_encounter;