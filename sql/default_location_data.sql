
INSERT INTO location (location_id,name,description,address1,address2,city_village,state_province,postal_code,country,latitude,longitude,creator,date_created,county_district,address3,address6,address5,address4,retired,retired_by,date_retired,retire_reason,parent_location,uuid,changed_by,date_changed,address7,address8,address9,address10,address11,address12,address13,address14,address15,location_type_concept_id) VALUES
	 (900000,'PNCT','PNCT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2026-06-08 12:08:21',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1487,'7911998f-4546-4eed-945c-59b7d44be0e6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	 (900001,'Serviços de Urgências (EMR)','Serviços de Urgências (EMR)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2026-06-08 12:08:21',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1487,'6d960146-3369-4c12-97b3-66a583b33f9f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	 (900005,'Saúde Materno-Infantil (SMI)','Saúde Materno-Infantil (SMI)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2026-06-08 12:08:22',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1487,'5c148df1-dec6-4710-b454-296b463f52e3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	 (900006,'Vírus da Imunodeficiência Humana (HIV)','Vírus da Imunodeficiência Humana (HIV)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2026-06-08 12:08:23',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1487,'d7125fb1-e6dd-4ed7-a71d-a85a1765da80',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO location_tag_map (location_id,location_tag_id) VALUES
	 (900000,1),
	 (900001,1),
	 (900005,1),
	 (900006,1);

INSERT INTO location_attribute (location_attribute_id,location_id,attribute_type_id,value_reference,uuid,creator,date_created,changed_by,date_changed,voided,voided_by,date_voided,void_reason) VALUES
	 (2083,900000,26,'1','cda604b3-af98-42e9-b99c-1552970e8de7',1,'2026-06-08 12:08:21',1,'2026-06-08 12:08:21',0,NULL,NULL,NULL),
	 (2084,900000,27,'1','3f8a5c3d-53a5-4826-8672-436e2a8a2912',1,'2026-06-08 12:08:21',1,'2026-06-08 12:08:21',0,NULL,NULL,NULL),
	 (2085,900000,25,'1414','5677605e-09be-4965-baeb-b53129bb0737',1,'2026-06-08 12:08:21',1,'2026-06-08 12:08:21',0,NULL,NULL,NULL),
	 (2086,900000,24,'0','cd3499fa-45ca-4421-bbb8-e76790786833',1,'2026-06-08 12:08:21',1,'2026-06-08 12:08:21',0,NULL,NULL,NULL),
	 (2087,900000,18,'1782','a68136b4-ab2c-4f96-bf85-42a2124ba25b',1,'2026-06-08 12:08:21',1,'2026-06-08 12:08:21',0,NULL,NULL,NULL),
	 (2088,900001,26,'1','3f2c8f4d-6f6e-4322-be4e-756cf64b0e13',1,'2026-06-08 12:08:21',1,'2026-06-08 12:08:21',0,NULL,NULL,NULL),
	 (2089,900001,27,'0','e4e49204-e100-4401-97f6-a9e18b4c9e87',1,'2026-06-08 12:08:21',1,'2026-06-08 12:08:21',0,NULL,NULL,NULL),
	 (2090,900001,25,'233590','dfecddaa-844c-4e88-9f8d-3326bb277a08',1,'2026-06-08 12:08:21',1,'2026-06-08 12:08:21',0,NULL,NULL,NULL),
	 (2091,900001,24,'0','72551700-6685-439d-8096-f014fa0c7818',1,'2026-06-08 12:08:21',1,'2026-06-08 12:08:21',0,NULL,NULL,NULL),
	 (2092,900001,18,'201961','d143dabb-5ff6-49be-a096-accc3a86cefd',1,'2026-06-08 12:08:21',1,'2026-06-08 12:08:21',0,NULL,NULL,NULL);
INSERT INTO location_attribute (location_attribute_id,location_id,attribute_type_id,value_reference,uuid,creator,date_created,changed_by,date_changed,voided,voided_by,date_voided,void_reason) VALUES
	 (2093,900001,18,'201962','fb77dc40-d8d7-4e0c-beaf-75f79384354c',1,'2026-06-08 12:08:21',1,'2026-06-08 12:08:21',1,1,'2026-06-08 12:08:21','Created as inactive'),
	 (2094,900001,18,'201966','ffaaa771-c9d3-48a1-8fa5-cdf5e752cb15',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',1,1,'2026-06-08 12:08:22','Created as inactive'),
	 (2095,900001,18,'201987','1fced6e5-8490-43e9-a2bf-46878f35c928',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',1,1,'2026-06-08 12:08:22','Created as inactive'),
	 (2096,900001,18,'201989','52c438a7-7d2d-4bf1-be1d-0350c8738ef0',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',1,1,'2026-06-08 12:08:22','Created as inactive'),
	 (2097,900001,18,'201990','2ecaf82c-20a6-4adb-91ea-eb216c298a32',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',1,1,'2026-06-08 12:08:22','Created as inactive'),
	 (2098,900001,18,'201991','c8bcb0a5-b70c-417f-94fa-b4c5083f1e0a',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',1,1,'2026-06-08 12:08:22','Created as inactive'),
	 (2099,900001,18,'202016','2bdef855-c2a5-4fe5-8f6c-ff831dd74084',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',1,1,'2026-06-08 12:08:22','Created as inactive'),
	 (2100,900001,18,'231637','fa397834-c8d5-432f-9276-1e324343d219',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',1,1,'2026-06-08 12:08:22','Created as inactive'),
	 (2101,900001,18,'201962','90ded861-3cea-4181-b42b-31d452a131f5',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',0,NULL,NULL,NULL),
	 (2102,900001,18,'201966','8084fcd4-281c-4a74-a2d6-230ea156c79b',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',0,NULL,NULL,NULL);
INSERT INTO location_attribute (location_attribute_id,location_id,attribute_type_id,value_reference,uuid,creator,date_created,changed_by,date_changed,voided,voided_by,date_voided,void_reason) VALUES
	 (2103,900001,18,'201987','3a9dfe5d-9a7d-4cf9-9cc5-c652660bdbab',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',0,NULL,NULL,NULL),
	 (2104,900001,18,'201989','5a15c851-06f6-472b-83ab-4b10fce67e58',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',0,NULL,NULL,NULL),
	 (2105,900001,18,'201990','22d50acf-8480-49c7-8721-448e7d93b7b1',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',0,NULL,NULL,NULL),
	 (2106,900001,18,'201991','8122abd0-3c21-4bce-bd0d-25b4056f2c54',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',0,NULL,NULL,NULL),
	 (2107,900001,18,'202016','a4f2cc4d-bd15-4fc3-991e-9f2685b16588',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',0,NULL,NULL,NULL),
	 (2108,900001,18,'231637','2402912f-584f-4edf-b612-ae1072980ddb',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',0,NULL,NULL,NULL),
	 (2109,900005,26,'1','60d4a6f9-e4df-47eb-a537-05474d0b298d',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',0,NULL,NULL,NULL),
	 (2110,900005,27,'1','46e12d0b-fd33-45a8-a53e-2445c4a40d9f',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',0,NULL,NULL,NULL),
	 (2111,900005,25,'233594','c9352978-ccb4-4071-aeba-5bce1bb8348b',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:22',0,NULL,NULL,NULL),
	 (2112,900005,24,'0','b0db4997-2874-4097-b302-e08401a5b968',1,'2026-06-08 12:08:22',1,'2026-06-08 12:08:23',0,NULL,NULL,NULL);
INSERT INTO location_attribute (location_attribute_id,location_id,attribute_type_id,value_reference,uuid,creator,date_created,changed_by,date_changed,voided,voided_by,date_voided,void_reason) VALUES
	 (2113,900005,18,'1872','84dc6f95-7b75-41eb-8e80-8c36dad2ba51',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',1,1,'2026-06-08 12:08:23','Created as inactive'),
	 (2114,900005,18,'5271','bbd5b59c-d559-4748-857f-2059acda7183',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',1,1,'2026-06-08 12:08:23','Created as inactive'),
	 (2115,900005,18,'6423','bbfee9c6-7e1f-4768-9d74-c69ac4b9e0a2',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',0,NULL,NULL,NULL),
	 (2116,900005,18,'23869','03231628-1bfe-4461-9b90-89da92915077',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',1,1,'2026-06-08 12:08:23','Created as inactive'),
	 (2117,900005,18,'23878','b30274ca-e335-44ee-aa9d-cc1377067f2d',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',0,NULL,NULL,NULL),
	 (2118,900005,18,'165595','68b1f3e2-f108-4eb4-a7e0-8abd28ac2711',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',0,NULL,NULL,NULL),
	 (2119,900005,18,'231567','ff8b8a21-21e8-4066-b211-8897a8aa5010',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',0,NULL,NULL,NULL),
	 (2120,900006,26,'1','45dd776d-37d5-4826-aa80-dfbee4af7923',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',0,NULL,NULL,NULL),
	 (2121,900006,27,'1','87b66aca-6575-49ee-a77e-5ea951e31f84',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',0,NULL,NULL,NULL),
	 (2122,900006,25,'233595','740282eb-dd47-4f52-b62d-98a9d28060e4',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',0,NULL,NULL,NULL);
INSERT INTO location_attribute (location_attribute_id,location_id,attribute_type_id,value_reference,uuid,creator,date_created,changed_by,date_changed,voided,voided_by,date_voided,void_reason) VALUES
	 (2123,900006,24,'0','1a715065-6cb8-4133-9af5-4b88d1c4dcfc',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',0,NULL,NULL,NULL),
	 (2124,900006,18,'6274','07ee9630-444a-425d-9dca-d29a0ad8747f',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',0,NULL,NULL,NULL),
	 (2125,900006,18,'23894','ca0f935f-3ac7-4af0-8c3e-9ca2e7f37bc2',1,'2026-06-08 12:08:23',1,'2026-06-08 12:08:23',1,1,'2026-06-08 12:08:23','Created as inactive');


