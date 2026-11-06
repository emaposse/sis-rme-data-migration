SELECT 
    COALESCE(sisrme_value, o.concept_id) concept_id,
    COALESCE(sisrme_value, o.concept_id) value_coded,
    COALESCE(
        (
            SELECT oor.obs_datetime
            FROM obs oor
            WHERE oor.value_coded in (730, 1695) 
              AND oor.person_id = o.person_id
              AND oor.obs_datetime < o.obs_datetime
              AND oor.concept_id = 23722
            ORDER BY oor.obs_datetime DESC
            LIMIT 1
        ),
        o.obs_datetime
    ) AS obs_datetime
FROM obs o left join sesp_sisrme_metadata_mapping on sesp_value = o.concept_id and mapping_group = 'concept'
WHERE o.obs_id = ${aliases_prefix}_result_obs_src_ds.obs_id