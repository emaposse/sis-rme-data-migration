ROLLBACK; 

SET AUTOCOMMIT = 0;

START TRANSACTION;

DROP TEMPORARY TABLE IF EXISTS tmp_obs_1369_comments;

CREATE TEMPORARY TABLE tmp_obs_1369_comments (
    encounter_id BIGINT NOT NULL,
    target_obs_id BIGINT NOT NULL,
    source_obs_id BIGINT NOT NULL,
    comments TEXT,
    
    PRIMARY KEY (encounter_id),
    UNIQUE KEY uk_target_obs_id (target_obs_id),
    UNIQUE KEY uk_source_obs_id (source_obs_id)
);


INSERT INTO tmp_obs_1369_comments (
    encounter_id,
    target_obs_id,
    source_obs_id,
    comments
)
SELECT
    target.encounter_id,
    target.obs_id,
    source.obs_id,
    source.comments
FROM obs AS target

INNER JOIN obs AS source
    ON source.encounter_id = target.encounter_id
   AND source.concept_id = target.concept_id
   AND source.obs_id <> target.obs_id
   AND (source.obs_datetime >= '2026-04-20' or source.obs_datetime='2023-09-27 00:00:00')

WHERE target.concept_id = 1369
  AND target.voided = 0
  AND source.voided = 0

  AND (
        target.comments IS NULL
        OR TRIM(target.comments) = ''
      )

  AND source.comments IS NOT NULL
  AND TRIM(source.comments) <> ''
  AND (target.obs_datetime >= '2026-04-20' or target.obs_datetime='2023-09-27 00:00:00');


/*
 * VALIDAR ANTES DO UPDATE
 */
SELECT
    tmp.encounter_id,

    tmp.target_obs_id,
    target.value_coded AS target_value_coded,
    target.obs_datetime AS target_obs_datetime,
    target.comments AS old_target_comments,

    tmp.source_obs_id,
    source.value_coded AS source_value_coded,
    source.obs_datetime AS source_obs_datetime,
    source.comments AS source_comments

FROM tmp_obs_1369_comments AS tmp

INNER JOIN obs AS target
    ON target.obs_id = tmp.target_obs_id

INNER JOIN obs AS source
    ON source.obs_id = tmp.source_obs_id

ORDER BY tmp.encounter_id;


/*
 * COPIAR COMMENTS PARA A OBS QUE SERÁ PRESERVADA
 */
UPDATE obs AS target

INNER JOIN tmp_obs_1369_comments AS tmp
    ON tmp.target_obs_id = target.obs_id

SET target.comments = tmp.comments;


/*
 * VALIDAR O UPDATE
 */
SELECT
    tmp.encounter_id,
    tmp.target_obs_id,
    target.value_coded,
    target.comments,
    tmp.source_obs_id

FROM tmp_obs_1369_comments AS tmp

INNER JOIN obs AS target
    ON target.obs_id = tmp.target_obs_id

ORDER BY tmp.encounter_id;


/*
 * APAGAR AS OBS QUE ORIGINALMENTE
 * CONTINHAM O COMMENT
 */
DELETE source
FROM obs AS source

INNER JOIN tmp_obs_1369_comments AS tmp
    ON tmp.source_obs_id = source.obs_id;


/*
 * VALIDAR O RESULTADO FINAL
 */
SELECT
    o.encounter_id,
    o.obs_id,
    o.person_id,
    o.concept_id,
    o.value_coded,
    o.comments,
    o.obs_datetime

FROM obs AS o

INNER JOIN tmp_obs_1369_comments AS tmp
    ON tmp.encounter_id = o.encounter_id

WHERE o.concept_id = 1369
  AND o.voided = 0

ORDER BY
    o.encounter_id,
    o.obs_id;


COMMIT;

SET AUTOCOMMIT = 1;