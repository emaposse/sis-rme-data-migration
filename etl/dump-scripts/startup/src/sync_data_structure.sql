
CREATE TABLE IF not EXISTS `sis_rme_sync_msg` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `origin_site_uuid` varchar(38) NULL,
  `entity_payload` text NOT NULL,
  `operation` varchar(20) NOT NULL, 
  `date_created` datetime(3) NOT NULL,
  `date_sent` datetime NOT NULL,
  `date_received` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message_uuid` varchar(38) NOT NULL,  
  `processing_status` enum('PROCESSING', 'NOT_PROCESSED', 'FULL_LOADED','PARTIALY_LOADED','NOT_LOADED_DUE_ERRORS','NOT_LOADED') NULL DEFAULT 'NOT_PROCESSED',
  `processing_date` datetime NULL,
  `processing_error` text,
  `retry_count` int NULL DEFAULT '0',
  KEY `idx_sis_rme_sync_msg_processed_rec_processing_status` (`processing_status`),
  KEY `idx_sis_rme_sync_msg_processed_rec_retry_count` (`retry_count`),
  KEY `sync_msg_site_fk` (`origin_site_uuid`),
  KEY `sync_msg_table` (`table_name`),
  UNIQUE KEY `unq_sync_message` (`message_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;