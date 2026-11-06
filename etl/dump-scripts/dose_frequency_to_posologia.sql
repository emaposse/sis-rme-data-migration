SELECT
CASE drug_order_order_frequency_src_ds.frequency_per_day
    WHEN 1 THEN
        CONCAT(CAST(drug_order_src_ds.dose AS UNSIGNED), '-0-0')
    WHEN 2 THEN
        CONCAT(CAST(drug_order_src_ds.dose AS UNSIGNED), '-0-', CAST(drug_order_src_ds.dose AS UNSIGNED))
    WHEN 3 THEN
        CONCAT(CAST(drug_order_src_ds.dose AS UNSIGNED), '-', CAST(drug_order_src_ds.dose AS UNSIGNED), '-', CAST(drug_order_src_ds.dose AS UNSIGNED))
    ELSE
        CONCAT(CAST(drug_order_src_ds.dose AS UNSIGNED), '-', CAST(drug_order_src_ds.dose AS UNSIGNED), '-', CAST(drug_order_src_ds.dose AS UNSIGNED)) 
END as posologia;