
CREATE TABLE IF not EXISTS sesp_sisrme_index_update_staging (
    id              BIGINT NOT NULL AUTO_INCREMENT,
    resource_type   VARCHAR(100) NOT NULL,
    record_uuid     VARCHAR(38) NOT NULL,
    operation_type   enum('UPDATE', 'DELETE', 'REINDEX') NOT NULL DEFAULT 'REINDEX',
    processing_state enum('PROCESSING', 'NOT_PROCESSED', 'FULL_LOADED','PARTIALY_LOADED','NOT_LOADED_DUE_ERRORS','NOT_LOADED') NOT NULL DEFAULT 'NOT_PROCESSED',
    processing_date  DATETIME,
    processing_error TEXT,
    retry_count     INT NOT NULL DEFAULT 0,
    date_created    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `index_unq_record` (`record_uuid`),
    KEY `resource_type_idx` (`resource_type`),
    KEY `processing_state_idx` (`processing_state`)
);