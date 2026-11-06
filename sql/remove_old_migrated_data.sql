SET AUTOCOMMIT=0;

START TRANSACTION;

ROLLBACK;

USE prod_sisrme_cs_polana_new_migrated_validated_data;

-- tabela temporária

DROP TEMPORARY TABLE IF EXISTS tmp_delete;

CREATE TEMPORARY TABLE tmp_delete (
    id INT NOT NULL AUTO_INCREMENT,
	encounter_id INT NOT NULL ,
    visit_id INT NOT NULL,
    encounter_type INT NOT NULL,
    encounter_datetime datetime NOT NULL,
    date_created datetime NOT NULL,
    `uuid` char(38) DEFAULT NULL,
  	UNIQUE KEY `uuid_index` (`uuid`),
  	UNIQUE KEY `encounter_unique_index` (`encounter_id`),
    PRIMARY KEY (`id`)
);

INSERT INTO tmp_delete (encounter_id, visit_id,encounter_type,encounter_datetime,date_created,uuid)
SELECT encounter_id,
       visit_id,
       encounter_type,
       encounter_datetime,
       date_created,
       encounter.uuid
FROM encounter
WHERE encounter_id < 144113
  AND encounter_type IN (17,108,113,116,117,129,169,202) AND date_created < '2026-05-21 08:59:04';


select max(encounter_datetime) from tmp_delete;


select count(*)
from tmp_delete
where not exists (select * from obs where obs.encounter_id = tmp_delete.encounter_id);



-- tipo 17
-- drug_order

DELETE d
FROM drug_order d
INNER JOIN orders o
        ON o.order_id = d.order_id
INNER JOIN tmp_delete t
        ON t.encounter_id = o.encounter_id;


DELETE tr
FROM test_result tr
INNER JOIN orders o
        ON o.order_id = tr.order_id
INNER JOIN tmp_delete t
        ON t.encounter_id = o.encounter_id;

-- tipos 116 e 169
-- test_order

DELETE tord
FROM test_order tord
INNER JOIN orders o
        ON o.order_id = tord.order_id
INNER JOIN tmp_delete t
        ON t.encounter_id = o.encounter_id;

-- tipo 17
-- pharmacy_packaged_drug

DELETE ppd
FROM pharmacy_packaged_drug ppd
INNER JOIN pharmacy_package pp
        ON pp.pharmacy_package_id = ppd.pharmacy_package_id
INNER JOIN tmp_delete t
        ON t.encounter_id = pp.prescription_encounter_id;

-- tipo 17
-- pharmacy_package

DELETE pp
FROM pharmacy_package pp
INNER JOIN tmp_delete t
        ON t.encounter_id = pp.prescription_encounter_id;

-- todos os tipos
-- obs por encounter

DELETE o
FROM obs o
INNER JOIN tmp_delete t
        ON t.encounter_id = o.encounter_id;

-- obs por order

DELETE o
FROM obs o
INNER JOIN orders ord
        ON ord.order_id = o.order_id
INNER JOIN tmp_delete t
        ON t.encounter_id = ord.encounter_id;
-- obs por order group

DELETE o
FROM obs o
INNER JOIN order_group og
        ON og.order_group_id = o.order_group_id
INNER JOIN tmp_delete t
        ON t.encounter_id = og.encounter_id;

-- tipo 108
-- encounter_diagnosis

DELETE ed
FROM encounter_diagnosis ed
INNER JOIN tmp_delete t
        ON t.encounter_id = ed.encounter_id;

-- tipo 113
-- vital_signs

DELETE vs
FROM vital_signs vs
INNER JOIN tmp_delete t
        ON t.encounter_id = vs.encounter_id;

-- conditions

DELETE c
FROM conditions c
INNER JOIN tmp_delete t
        ON t.encounter_id = c.encounter_id;

-- encounter provider

DELETE ep
FROM encounter_provider ep
INNER JOIN tmp_delete t
        ON t.encounter_id = ep.encounter_id;

-- encounter program

DELETE ep
FROM encounter_program ep
INNER JOIN tmp_delete t
        ON t.encounter_id = ep.encounter_id;

-- orders
-- (17,116,169)

DELETE o
FROM orders o
INNER JOIN tmp_delete t
        ON t.encounter_id = o.encounter_id;

-- order group
-- (17,116,169)

DELETE og
FROM order_group og
INNER JOIN tmp_delete t
        ON t.encounter_id = og.encounter_id;
-- 
-- encounter

DELETE e
FROM encounter e
INNER JOIN tmp_delete t
        ON t.encounter_id = e.encounter_id;

-- visit

DELETE v
FROM visit v
INNER JOIN tmp_delete t
        ON t.visit_id = v.visit_id
	AND NOT EXISTS (SELECT * FROM encounter e WHERE e.visit_id = v.visit_id);

DELETE pcad
FROM person_complex_attribute_detail pcad
WHERE pcad.person_complex_attribute_detail_id < 40824
  AND pcad.date_created < '2026-05-21 08:59:04';


DELETE pca
FROM person_complex_attribute pca
WHERE pca.person_complex_attribute_id < 13222
  		AND pca.date_created < '2026-05-21 08:59:04'
		AND  NOT EXISTS (
					SELECT *
					FROM person_complex_attribute_detail pcad
					WHERE pca.person_complex_attribute_id = pcad.person_complex_attribute_id
				 );


DELETE pa
FROM person_attribute pa
WHERE pa.person_attribute_id < 13222
  AND pa.date_created < '2026-05-21 08:59:04';


COMMIT;

