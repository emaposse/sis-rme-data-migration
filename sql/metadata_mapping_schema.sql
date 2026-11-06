CREATE TABLE `sesp_sisrme_metadata_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mapping_group` varchar(255) NOT NULL,
  `sesp_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `sisrme_staging_value` varchar(255) DEFAULT NULL,
  `sisrme_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapping_unq` (`mapping_group`,`sesp_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



drop table if EXISTS  sesp_sisrme_tmp ;

CREATE TABLE `sesp_sisrme_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sisrme_staging_value` varchar(255) NULL,
  `sisrme_value` varchar(255) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into sesp_sisrme_tmp(sisrme_staging_value, sisrme_value)
(select sisrme_staging_value, location_id
 from sesp_sisrme_metadata_mapping inner join data_migration_sis_rme_db.location on location.uuid  = sisrme_staging_value
 where mapping_group in ('district', 'country', 'helth-facility')
 );

update sesp_sisrme_metadata_mapping inner join sesp_sisrme_tmp using(sisrme_staging_value)
set sesp_sisrme_metadata_mapping.sisrme_value = sesp_sisrme_tmp.sisrme_value
where mapping_group <> 'helth-facility';

select * from sesp_sisrme_metadata_mapping ;
