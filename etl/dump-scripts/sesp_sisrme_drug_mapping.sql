select map.sisrme_value as drug_id, d.concept_id as concept_id 
from sesp_sisrme_metadata_mapping map inner join ${dst_db}.drug d on map.sisrme_value = d.drug_id 
where mapping_group = 'drug' and sesp_value =  ${aliases_prefix}_item_data_src_ds.value_drug