DELIMITER $$

SET @col_exists = (
  SELECT COUNT(*) 
  FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'person_complex_attribute'
    AND COLUMN_NAME = 'uuid'
);

SET @sql_script = IF(
  @col_exists = 0,
  'ALTER TABLE person_complex_attribute 
     ADD COLUMN `uuid` VARCHAR(38) NOT NULL,
     ADD UNIQUE KEY `p_complex_att_uuid` (`uuid`)',
  'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql_script;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*) 
  FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'pharmacy_batch'
    AND COLUMN_NAME = 'uuid'
);

SET @sql_script = IF(
  @col_exists = 0,
  'ALTER TABLE pharmacy_batch 
     ADD COLUMN `uuid` VARCHAR(38) NOT NULL,
     ADD UNIQUE KEY `pharmacy_batch_unq_uuid` (`uuid`)',
  'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql_script;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*) 
  FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'pharmacy_package'
    AND COLUMN_NAME = 'uuid'
);

SET @sql_script = IF(
  @col_exists = 0,
  'ALTER TABLE pharmacy_package 
     ADD COLUMN `uuid` VARCHAR(38) NOT NULL,
     ADD UNIQUE KEY `pharmacy_package_unq_uuid` (`uuid`)',
  'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql_script;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @col_exists = (
  SELECT COUNT(*) 
  FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'pharmacy_packaged_drug'
    AND COLUMN_NAME = 'uuid'
);


SET @sql_script = IF(
  @col_exists = 0,
  'ALTER TABLE pharmacy_packaged_drug 
     ADD COLUMN `uuid` VARCHAR(38) ,
     ADD UNIQUE KEY `pharmacy_packaged_drug_unq_uuid` (`uuid`)',
  'SELECT "Column already exists"'
);


PREPARE stmt FROM @sql_script;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @col_exists = (
  SELECT COUNT(*) 
  FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'pharmacy_transaction'
    AND COLUMN_NAME = 'uuid'
);

SET @sql_script = IF(
  @col_exists = 0,
  'ALTER TABLE pharmacy_transaction 
     ADD COLUMN `uuid` VARCHAR(38) NOT NULL,
     ADD UNIQUE KEY `pharmacy_transaction_unq_uuid` (`uuid`)',
  'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql_script;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*) 
  FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'person_complex_attribute_detail'
    AND COLUMN_NAME = 'uuid'
);

SET @sql_script = IF(
  @col_exists = 0,
  'ALTER TABLE person_complex_attribute_detail 
     ADD COLUMN `uuid` VARCHAR(38) NOT NULL,
     ADD UNIQUE KEY `p_complex_att_destails_uuid` (`uuid`)',
  'SELECT "Column already exists"'
);

PREPARE stmt FROM @sql_script;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

$$
DELIMITER ;