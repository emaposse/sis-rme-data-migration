alter table data_migration_sis_rme_db.users  modify `date_created` datetime NOT NULL ;
alter table data_migration_sis_rme_db.users add  UNIQUE KEY `user_uuid_index` (`uuid`);

alter table data_migration_sis_rme_db.orders  modify `date_created` datetime NOT NULL ;

ALTER TABLE data_migration_sis_rme_db.orders
DROP FOREIGN KEY FKC3DF62E572D27098;

alter table data_migration_sis_rme_db.person_complex_attribute  add (`uuid` varchar(38) NULL) ;
alter table data_migration_sis_rme_db.person_complex_attribute add  UNIQUE KEY `p_complex_att_uuid` (`uuid`);

alter table data_migration_sis_rme_db.person_complex_attribute_detail  add (`uuid` varchar(38) NULL) ;
alter table data_migration_sis_rme_db.person_complex_attribute_detail add  UNIQUE KEY `p_complex_att_destails_uuid` (`uuid`);

INSERT INTO data_migration_sis_rme_db.providermanagement_provider_role (name,description,creator,date_created,changed_by,date_changed,retired,retired_by,date_retired,retire_reason,uuid) VALUES
	 ('Clinical Doctor',NULL,1,'2013-07-26 00:36:02',NULL,NULL,0,NULL,NULL,NULL,'c110f9bc-c65f-44a2-a028-2af7e8fff534'),
	 ('Clerk',NULL,1,'2013-08-14 17:52:16',NULL,NULL,0,NULL,NULL,NULL,'87d2122b-691c-4e06-9366-111f5ab2f526'),
	 ('Nurse',NULL,1,'2013-07-26 00:36:09',NULL,NULL,0,NULL,NULL,NULL,'da13814f-f560-46df-8bb2-219e146c2811');

INSERT INTO data_migration_sis_rme_db.provider (provider_id, encounter_role_id,person_id,name,identifier,creator,date_created,changed_by,date_changed,retired,retired_by,date_retired,retire_reason,uuid,provider_role_id,role_id,speciality_id) VALUES
	 (1, 1,1,'Default Provider','1981-674-2_674',1,'2026-03-23 10:52:47',NULL,NULL,0,1,'2026-03-04 14:00:00','Default Provider','b67c76bf-2753-11f1-a529-caf8fbbde20f',NULL,NULL,NULL);
