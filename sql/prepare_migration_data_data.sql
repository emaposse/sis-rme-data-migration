SET SESSION sql_log_bin = 0;

drop table if exists `tmp_patient_to_remove`;

CREATE TABLE `tmp_patient_to_remove` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_uuid` char(38) NOT NULL,
  `patient_id` int NOT NULL,
  `flag` tinyint(1) NULL,
  UNIQUE KEY `unq_patient_uuid` (`patient_uuid`),
  UNIQUE KEY `unq_patient_id` (`patient_uuid`),
  PRIMARY KEY (id)
) ENGINE=InnoDB;


CREATE TABLE `tmp_obs_to_remove` (
  `id` int NOT NULL AUTO_INCREMENT,
  `obs_uuid` char(38) NOT NULL,
  `obst_id` int NOT NULL,
  `flag` tinyint(1) NULL,
  UNIQUE KEY `unq_obs_uuid` (`obs_uuid`),
  UNIQUE KEY `unq_obs_id` (`obs_uuid`),
  PRIMARY KEY (id)
) ENGINE=InnoDB;



set autocommit=0;


INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('001d6b3d-d352-4dad-b38d-ad2c22bf8c5c',22339,NULL),
	 ('00434550-cae2-4c84-8067-e1d2300aef01',22225,NULL),
	 ('005b0b20-9cc0-47b3-aad7-b0899ee90be2',22543,NULL),
	 ('00627ef1-ac4f-4284-81db-9111de7b3311',22499,NULL),
	 ('00764b92-9632-4bf9-994a-cec9cda957a2',22358,NULL),
	 ('007d247e-d8c5-4f71-8513-720e97695c1f',22259,NULL),
	 ('010fc022-1a9f-4458-98f9-2e7da77e9132',22491,NULL),
	 ('017b2c4e-d9eb-4180-bcf9-356faa2034cc',22307,NULL),
	 ('017c28ff-7146-4afd-a3cf-34040b422b56',22395,NULL),
	 ('01f1daa1-62cf-4175-b08d-b5cd278bf7d1',22226,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('038b0f83-86f9-4d9b-a74b-ac0ee5a6e1e7',22466,NULL),
	 ('039294ca-de06-4eee-9a68-ce31130ed6d5',22489,NULL),
	 ('040adfe2-8089-4aae-88fe-5ab265fb6a48',22422,NULL),
	 ('040bb7b1-c080-4a18-a35a-4ca838c6721b',22224,NULL),
	 ('0595bccb-095d-4b7b-8360-3fd7eb8d3ba3',22505,NULL),
	 ('0657fabe-cc25-4446-a61b-72e4780a4817',22494,NULL),
	 ('07e3733a-aa0d-4265-bb45-7cc01c80422d',22302,NULL),
	 ('08435934-47b3-4def-b295-6ec0ff478048',22482,NULL),
	 ('09083c96-4ca0-44be-abad-65797277423e',22298,NULL),
	 ('09230143-9029-44fc-b065-fd1c42cc7951',22576,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('092c531c-4ae7-4bd1-8220-6d0d58c8d83d',22530,NULL),
	 ('095d002b-803a-4b66-a8a0-05d122a7c51e',22315,NULL),
	 ('0afaecd9-af0b-48a7-9815-8684cf0c21b5',22282,NULL),
	 ('0b9c8c48-ce25-486c-bbf2-c561c605e344',22305,NULL),
	 ('0bf1c657-0b21-46f5-956e-ca96138fe875',22476,NULL),
	 ('0c84a4b6-fd6c-4fb4-9e1a-5a933fbba1cd',22374,NULL),
	 ('0dda630b-04b7-401d-a56a-6b5cb312f019',22371,NULL),
	 ('0e2c0599-0493-46ea-ab69-7508bdfbead4',22277,NULL),
	 ('0e5558a1-d478-40e3-bb76-d56676f5b0ec',22312,NULL),
	 ('0e813a40-971f-4217-8458-162d860161fe',22260,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('0ea1a249-2c4f-48fd-8ae1-d8e214176b3f',22503,NULL),
	 ('0ecf2146-5569-4437-a556-3a2f31d259ab',22435,NULL),
	 ('0ee4469c-25dc-40da-ab37-efde69770094',22478,NULL),
	 ('0f83a8b4-defa-409d-94ba-2491bb13b1f2',22444,NULL),
	 ('0fdcba7d-eb88-4f87-a3dd-80b32bec2f55',22488,NULL),
	 ('1019e369-a09f-4f54-a4d7-1848c9576dfc',22484,NULL),
	 ('1020a08a-d273-4a5f-ae51-6fd069bcc792',22481,NULL),
	 ('10e29f0c-7d32-4b3e-ac2a-a119c22e9cd1',22249,NULL),
	 ('11343711-2c1c-4186-b525-c755e3552291',22507,NULL),
	 ('11df51f8-dc83-4718-8c6f-fd519c8fbbd7',22333,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('14ef9640-d121-45a0-a977-046d8c93d5df',22308,NULL),
	 ('1592adbb-1362-4655-9bda-d619a6773ef3',22471,NULL),
	 ('15a27637-74d1-435f-8774-dd5e1bde4935',22284,NULL),
	 ('15b1996c-da19-4724-aa74-f7379075d03e',22455,NULL),
	 ('171b7767-ca69-4f0a-b716-b41a9eb72b49',22281,NULL),
	 ('181ff2b5-24d8-416b-9985-992e7715df52',22504,NULL),
	 ('182d8dff-8f66-43ce-9e68-66173da20701',22368,NULL),
	 ('191feac9-e294-485b-9bd8-3c68df34dce1',22382,NULL),
	 ('1923c434-adfb-4b56-bfbe-6620ec9ebf9f',22208,NULL),
	 ('1a65a1b5-f611-46d4-93a6-33ab994cc215',22313,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('1af6561e-2991-4ae7-acbf-46f5689f4fbb',22320,NULL),
	 ('1b3324c3-d9a7-4ade-8fa1-42dcdc887e1e',22373,NULL),
	 ('1b49cd67-fb3f-4f7b-b9b1-f2fe6401edb8',22365,NULL),
	 ('1bfef61a-b124-40b2-8799-893ed33c2286',22526,NULL),
	 ('1d7cbd8d-5f1a-4993-b6df-63f2992b1c63',22215,NULL),
	 ('204e9ade-16ec-40af-8000-a086a12a84bc',22271,NULL),
	 ('205cfddb-030c-44d1-83db-a828746c86c3',22317,NULL),
	 ('2086d785-8cef-4536-8aa4-4400ded72376',22275,NULL),
	 ('20a2eb36-1397-4bc3-bf9a-3c35249255e3',22434,NULL),
	 ('20d3de20-5f4f-4298-9083-043b2eac5aa7',22410,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('2315d0c4-84b9-402a-a357-7967d1f66e06',22581,NULL),
	 ('23cfb50a-1d57-467d-9061-e56dad1bb842',22461,NULL),
	 ('2407b7fd-06c4-44fd-a326-1040ded33245',22340,NULL),
	 ('24a6b277-6843-48ee-9023-03011029ed60',22388,NULL),
	 ('24fc17ab-0e81-4a7e-90d2-1bc83ffca905',22295,NULL),
	 ('25645c56-6c9c-45c0-93bc-702a59b44573',22218,NULL),
	 ('25c86f49-5528-446a-8dbd-8c2616f06bd2',22394,NULL),
	 ('27d47caf-cd90-4921-a236-08cb63d78de6',22248,NULL),
	 ('280e40ff-0678-44f7-8bae-d7906c4f8f92',22525,NULL),
	 ('281498a9-f151-4112-a998-20b05273073d',22442,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('28c5c325-b212-4532-8428-419ac94b086b',22346,NULL),
	 ('2a70bade-1162-48f7-b395-766c4ecb340a',22256,NULL),
	 ('2b6c3bc4-da6e-4c7e-9842-ed8164acc821',22214,NULL),
	 ('2bd05c2f-18aa-414c-965c-4eaf7a35ec9a',22430,NULL),
	 ('2c0ba285-4890-48a9-bce2-cb4bdd2ddbf4',22301,NULL),
	 ('2db56bc7-61e8-4ff7-beb5-83366105a86b',22288,NULL),
	 ('2deb784a-d884-470c-896d-4666584da566',22447,NULL),
	 ('2e02a9dd-f38b-4345-99b0-66afa13d5d21',22445,NULL),
	 ('2e1b2f59-b9e2-48e2-a478-9eb500ad8249',22517,NULL),
	 ('2ea83446-4e51-4680-a0cb-670979bc289e',22324,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('2f7c402e-5130-46d6-b154-9c9bd1faf2cd',22522,NULL),
	 ('2f807082-19c8-452f-bdc6-b0d209a112f8',22270,NULL),
	 ('3021f858-9639-4400-ad67-c135edc298c9',22316,NULL),
	 ('30b93bea-b87e-4542-8056-ed5a6640d7c0',22448,NULL),
	 ('3110d132-1bd3-4d06-9795-4be7d976ae7d',22236,NULL),
	 ('313f758c-af22-4043-89e6-57fb6b13973a',22486,NULL),
	 ('32561707-31bd-41b4-a114-70727d70a3a4',22349,NULL),
	 ('33bec6f3-c51b-486b-b0f5-14c607604072',22261,NULL),
	 ('33e90568-7235-443c-b32d-c4b34d95518e',22443,NULL),
	 ('34bc5aea-387b-4c93-b652-a5e8e3d6e506',22536,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('366f4eef-9b0c-41c0-be91-aece67aec437',22415,NULL),
	 ('36a053dd-7713-4859-84f8-bd750004d86b',22318,NULL),
	 ('38157c4e-c96e-4205-885d-4ddaf453a8b9',22389,NULL),
	 ('39940223-caf2-46a2-96aa-5b5ecfb9edd0',22299,NULL),
	 ('3c34426d-e43f-4ced-a953-fb0e7fdc6026',22266,NULL),
	 ('3c4d4965-4307-4e86-af35-098a375ea2fa',22345,NULL),
	 ('3d669477-386b-42b8-aa79-1ab667966962',22213,NULL),
	 ('3e23f16a-934d-4549-914c-455fe7a8ef96',22383,NULL),
	 ('4005309c-405d-400b-b4ac-02019647c603',22278,NULL),
	 ('4012f975-c387-4d39-b3ea-9a80d66c1699',22360,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('40e7e8dc-0b0c-4e0a-99fc-fb8f973b9811',22351,NULL),
	 ('41d3531e-808a-4697-b837-8f9b3341a716',22321,NULL),
	 ('421bf871-7a3b-4bae-b0f3-ad44744ff28c',22545,NULL),
	 ('4283ebd8-be5a-42af-af3a-66858d78a36b',22485,NULL),
	 ('42ac9f50-20c7-48a3-9b20-374e8810817f',22570,NULL),
	 ('42c5ae41-f73b-44a8-b3bc-5d9c6a217382',22252,NULL),
	 ('42ca7dfe-df97-4cc6-883d-a21291f1c524',22437,NULL),
	 ('440c71ce-76fa-46c7-ad6e-b4b0d086f8b2',22385,NULL),
	 ('4436cc98-dc76-4b84-9376-ee8bb88faec7',22546,NULL),
	 ('44755209-a799-4b78-be54-f700189419f0',22227,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('44bb3346-2f94-4833-bdbe-c849bf422cd9',22325,NULL),
	 ('455b91a6-e01e-41a5-892c-e9119b474357',22582,NULL),
	 ('45621eaf-7dc5-40a2-931e-4db3df0fb58c',22294,NULL),
	 ('45cc2f02-f033-4ffd-a3f9-f824a4ee9781',22462,NULL),
	 ('46877fda-1f4e-47da-84a2-a017683a7a72',22268,NULL),
	 ('46894810-7e5a-4c09-a5c9-e7954ba9674e',22234,NULL),
	 ('48fdaf5b-476f-4b35-b3e4-1f35d410afa4',22359,NULL),
	 ('495a29f8-0262-4af1-950c-ba6f7c8821c3',22370,NULL),
	 ('49e7e23f-a38d-4473-b25e-7ea24003a017',22567,NULL),
	 ('4b9258f2-d130-4d1c-a91b-a2a64175b716',22456,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('4dd59885-e48f-4fd0-a15f-ca7f9486df26',22274,NULL),
	 ('4f16d9fa-eadd-4cf0-975a-baea12f74ccf',22244,NULL),
	 ('4f8be082-761e-4bc1-8a0e-889bb4982d02',22263,NULL),
	 ('4fb72d29-a8d7-4474-8ab5-354fdd49fa85',22289,NULL),
	 ('4fbc95b3-fa30-4bc4-98db-954fbc052902',22557,NULL),
	 ('50956244-4d5f-4f6f-8f4b-d7ec76508e36',22555,NULL),
	 ('50d8f753-bcbf-4d11-a902-d90b925aad1b',22347,NULL),
	 ('51413b26-5c6d-44de-ae64-35fb3ad01077',22296,NULL),
	 ('51aa14fa-3bcc-4621-a1fc-82f592c3ebf9',22438,NULL),
	 ('52c69b04-1c38-4584-a609-a041ed959ddd',22332,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('54310d7c-71de-4972-a754-e7cb9ffde1ce',22400,NULL),
	 ('5450237d-98be-4e7d-875c-f5ce6918cfb5',22506,NULL),
	 ('56b620ab-aeec-4a07-bf5e-7ed8eee35f68',22431,NULL),
	 ('5798f584-8282-4106-955d-30cce5302a45',22393,NULL),
	 ('58058aba-eabb-4347-84d1-16f1a164964e',22472,NULL),
	 ('585f6d52-6412-4731-a91d-a29dcc3129f9',22269,NULL),
	 ('59d9078d-f013-49b5-bef1-0874fc93a2dd',22344,NULL),
	 ('59e2f609-0f41-4b7f-93bd-9fd449817b5c',22535,NULL),
	 ('59e75b76-e455-4d1b-9803-d45a386d0d7b',22303,NULL),
	 ('5a35b7f0-536f-4386-a95e-a473236250e5',22397,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('5b2ffc16-00d6-4dc8-bf27-ea328fd3338e',22427,NULL),
	 ('5bdfe488-33e1-4fd1-92b4-087f3e7593b0',22411,NULL),
	 ('5dde38da-f282-4c9a-b75a-8bc9071793a5',22241,NULL),
	 ('5e98a677-cb6f-4e76-9d9e-efc9c347502f',22372,NULL),
	 ('6186b18a-54d7-405c-a6f4-5ff077cb704b',22246,NULL),
	 ('62ad5eb9-a199-4388-bcda-f76c4c9d6d79',22396,NULL),
	 ('6510ef5d-2e50-4423-8609-fa231b070c9c',22243,NULL),
	 ('663a8645-468c-4565-8f70-45aa3013362f',22242,NULL),
	 ('66acd0ba-2ffa-4377-890f-604ee052b11e',22549,NULL),
	 ('6779a3a3-8fb5-45ae-b872-64418b29b4fe',22523,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('681a1e0c-6032-442f-bbb6-1a4a99145f79',22529,NULL),
	 ('68392942-c076-40f6-84fd-542d4fe514e3',22322,NULL),
	 ('686077f2-022f-44b6-ad98-069bc302c954',22309,NULL),
	 ('68711ce9-4c22-4f24-8d1e-6dd4e1d8bcd7',22542,NULL),
	 ('69b9565e-2c74-4a74-b32d-5c737a0be093',22413,NULL),
	 ('6aba9c12-370c-45e0-b131-c204d8d87aeb',22331,NULL),
	 ('6ae589b4-befc-4658-a18e-73e1bab2378a',22405,NULL),
	 ('6b8f9746-4e87-47b3-8f5c-54d913b1bf65',22500,NULL),
	 ('6ba7451c-78d1-4aac-b882-ed6c3cdeb961',22326,NULL),
	 ('6d0202a7-9be3-44de-88eb-5bcd4612739c',22398,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('6db69b97-b9d7-4639-bf2f-e2e9b3ff5e34',22575,NULL),
	 ('6e208c87-2250-4a0e-a9ac-c622997f9836',22279,NULL),
	 ('6ebc69ed-c448-40a3-843f-748e1a187716',22220,NULL),
	 ('6fab8f60-253b-427e-923c-4b232e2b5e34',22228,NULL),
	 ('7098d9ee-b5cc-4b01-83f7-9d0c803c2a16',22314,NULL),
	 ('70a898d5-5c89-49a2-a9d9-066936f4bbe9',22239,NULL),
	 ('7267d1c1-4258-47b8-82c6-f3ffe91c2f4e',22354,NULL),
	 ('732ee982-194f-47af-8974-a4a948957842',22292,NULL),
	 ('7384ddf5-3f77-470e-89d9-c58d2c6bcccc',22457,NULL),
	 ('7389a4fd-0af6-41bc-8c52-ce94d9c967bf',22579,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('73febeb1-1a82-4da8-b456-cebcbe65cfb0',22232,NULL),
	 ('743d9dc6-892e-4fa1-8483-99bf7976d0b4',22518,NULL),
	 ('7533575e-0056-49b2-83c3-4095449efdad',22247,NULL),
	 ('76d09767-0ba5-4083-a7d8-33e7e5ecebca',22353,NULL),
	 ('76e209fc-7ad3-4501-9e62-b56a5ec8c7a6',22341,NULL),
	 ('770e5ca9-2dae-47a3-8d02-784f64024280',22237,NULL),
	 ('77e58de8-5419-4761-9add-b35c9265eca3',22439,NULL),
	 ('79c1c1df-9a0e-4cca-9368-146f610ed6ff',22571,NULL),
	 ('7a9ce290-a8ff-4b5d-a2cd-e10c443b5910',22293,NULL),
	 ('7aac23cd-7f37-466f-aa96-fcedf5993338',22334,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('7ae8a4df-023d-4f47-96c8-2b467f9cff46',22568,NULL),
	 ('7af9871e-aa04-49ce-b65f-3d426b94520c',22425,NULL),
	 ('7bcf3679-9fb5-45b1-b559-8f6dd8c9ec2f',22469,NULL),
	 ('7bfd438b-de69-4a09-a681-f0c415360af7',22459,NULL),
	 ('7c1d6334-b188-426d-a43e-f1ab22912a60',22255,NULL),
	 ('7c40888e-7593-4c4c-b2e4-279b33488e30',22338,NULL),
	 ('7cba6de6-6e40-4b42-94a8-c5d85683ff3b',22493,NULL),
	 ('7d664ed2-c01f-4ad5-8590-704006283524',22418,NULL),
	 ('7e1af926-e995-4622-9170-376e5ed6cfc1',22441,NULL),
	 ('7f1efcaf-a7cd-4b38-b3e8-b26d13177b38',22559,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('7fe53299-4fbf-4fda-af0d-90c978bd8ef0',22569,NULL),
	 ('81500446-bf83-40ff-b9fe-3a7621978b74',22212,NULL),
	 ('81d03e1f-71a9-4ba5-a3e2-2b8368b956c6',22565,NULL),
	 ('81f2bc9b-b25a-4b8e-992b-ea9bbc366f2c',22540,NULL),
	 ('83c0f708-bbc7-4fee-96e1-77be938a36e4',22264,NULL),
	 ('84f5f5fe-6758-4b06-8704-a4aca53c7e8b',22548,NULL),
	 ('853a1882-55ba-4e48-b0c4-74ead838c9c0',22583,NULL),
	 ('856edae2-b42b-4f9c-9a0e-4464a92ccc11',22452,NULL),
	 ('857da47d-64af-4d34-8afb-dfc975765412',22387,NULL),
	 ('8645e910-f31e-4cb0-b678-3acaad58657e',22547,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('86622130-6540-48ea-aff7-506151941dd9',22554,NULL),
	 ('866282b6-a1af-4e90-a385-126b9903a302',22409,NULL),
	 ('8694cc4c-2b67-418a-b3ff-a9c043af2dc0',22497,NULL),
	 ('86edb34d-7a48-4822-95a5-c19680dd2ba0',22417,NULL),
	 ('87a3c02a-29e8-442c-b48c-b6bcab89dabb',22432,NULL),
	 ('87ffd8a4-4ada-4f34-beec-d031f4ce7a95',22501,NULL),
	 ('88a5cd37-38bf-455e-90a2-cd4736bb176e',22520,NULL),
	 ('8937db37-bd1c-4061-b751-3716b76bb85e',22402,NULL),
	 ('8979e5c1-108a-420b-9312-d227bc4a5734',22362,NULL),
	 ('8a8f3ca3-d36e-4e5c-b307-a3c79c06d481',22238,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('8ab7da42-29bc-49ae-8bf4-fa0e07efd8b2',22492,NULL),
	 ('8cbc5831-deea-4bac-9815-e5a503230168',22429,NULL),
	 ('8d1ec8e3-2c35-4c60-82f5-d43c7adbfdc9',22532,NULL),
	 ('8d9dfcd0-91ec-4774-9371-a3fb3823bfab',22534,NULL),
	 ('8f499b0d-302a-457c-889f-4b15dd34e9d3',22580,NULL),
	 ('8f59cea7-3df8-47de-a6c9-2fb8353f08c8',22361,NULL),
	 ('9037b4ab-5722-4108-b236-65e2d563b6df',22250,NULL),
	 ('9075000f-56c9-4ebb-8aef-c6825dd07cc4',22342,NULL),
	 ('923fd72c-7917-4f77-ad53-e28626151284',22283,NULL),
	 ('929f69cc-d556-4f08-a1ff-edbabee3eba7',22254,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('93702e79-3635-4530-9f17-f5f8e79456d1',22328,NULL),
	 ('93a1c81f-6767-4e59-89a5-a44d86af8f6e',22391,NULL),
	 ('946853a8-c595-4934-8dc9-b07ea05c03f5',22467,NULL),
	 ('9483db72-3b23-4457-b9d1-117a297649eb',22550,NULL),
	 ('99b46dad-d357-4a14-b2b7-9a3cb3e76db9',22378,NULL),
	 ('99bb5cbe-5938-47fe-a700-2b8ba562d488',22376,NULL),
	 ('9a2b0a99-a27f-44fa-accf-b3df5d221165',22364,NULL),
	 ('9a534dc8-0d86-4f91-8a9f-a280f321019b',22473,NULL),
	 ('9b190b53-6b98-4bbc-8f5b-3bca7a34604c',22475,NULL),
	 ('9c2c8c15-b4b5-42ca-a688-373ae7a33807',22245,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('9c8bad12-ca23-4605-b3a0-1afff1ced505',22521,NULL),
	 ('9d298d06-1232-4277-81da-8600e6436da5',22420,NULL),
	 ('9d94229e-e8ea-4dec-a19d-dad98ae01abf',22464,NULL),
	 ('9f9e721f-586f-42be-a739-2ec7b2f3aab4',22516,NULL),
	 ('9fa1ba8a-3e3a-4f33-be4d-32843c59625b',22558,NULL),
	 ('a39e543c-acce-48e0-bc6b-83f14b48f0a8',22319,NULL),
	 ('a488af5e-9370-41dd-a27c-6425efe9a083',22335,NULL),
	 ('a4a2837b-48f1-49b6-a1be-38947bdf8034',22240,NULL),
	 ('a56814b4-512e-4c82-9a72-be36cc2adae6',22230,NULL),
	 ('a5721c84-5eb1-4fab-815e-c7176ad53be8',22509,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('a783baba-3c6d-47ed-86e2-6fcba2d38ec2',22519,NULL),
	 ('a78f09d7-b4ff-40dd-912c-8a3b715d6745',22451,NULL),
	 ('a7aaee11-4854-4bbc-aa86-a1df82c37036',22386,NULL),
	 ('a969bbc1-f0df-48c1-baaf-7896b2d06232',22412,NULL),
	 ('aa79a74d-1214-4449-bca3-54f7022dfd8c',22495,NULL),
	 ('abae7435-26e2-44a2-b5fb-7e27605d5b85',22553,NULL),
	 ('ad5a6e55-0324-4e59-a9bc-13e935387a47',22257,NULL),
	 ('ad62a560-74cd-479f-aafd-67d23a21d004',22527,NULL),
	 ('ad6d75a7-12e9-4921-b20d-81d584f8e7cf',22502,NULL),
	 ('af52dfa6-7ade-402b-9e9f-191cac0b010d',22537,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('af58bdc7-954f-488c-a1ab-97fa6b2665c3',22336,NULL),
	 ('afa48fce-3073-4ead-bc7c-d30094ef453a',22311,NULL),
	 ('afc74db0-bab8-4483-a219-45fdec9a3dbc',22450,NULL),
	 ('b102d7f5-860a-4de7-a9cc-7e20fd69886c',22251,NULL),
	 ('b1aa7c71-8200-4410-a914-0b5e95366fea',22449,NULL),
	 ('b2c4c527-d77a-49c2-ba98-4e5099db4bf7',22474,NULL),
	 ('b2ebd4aa-bbfd-46cb-85bf-62d5e604f5ee',22355,NULL),
	 ('b46e02f3-4c37-43aa-9a18-8a9e1e309ec7',22563,NULL),
	 ('b4e1aa2a-7f5d-4409-92cb-0a5e8b322828',22498,NULL),
	 ('b5b2d29b-cc31-49f7-b810-68a33d6cd147',22323,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('b5b7deba-70ed-44d2-a721-97d363fe8225',22304,NULL),
	 ('b6b0180c-86f7-47e0-a897-a14467c3ea13',22207,NULL),
	 ('b89b3edf-de7d-412e-a345-24fa5c9278a2',22217,NULL),
	 ('ba53b015-b92d-4b13-9535-d7d3d5fce18d',22487,NULL),
	 ('bc263959-8a37-4d49-997c-eb03170366ff',22392,NULL),
	 ('bc615797-08aa-495a-b674-4ec90d4f270f',22524,NULL),
	 ('bc9048d2-38fc-4248-b504-bcd9dff67242',22416,NULL),
	 ('bd55a9d7-97ba-42fd-ae8d-a356cea7d84a',22343,NULL),
	 ('bdb4e2b6-b6cb-42ef-b7aa-28a65146b1d5',22560,NULL),
	 ('bdc8244e-219b-42f8-ab45-c057e4075101',22381,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('bee3f9db-3f94-4777-9bdd-f9d3364e6e53',22287,NULL),
	 ('bf5db0cc-c950-4f72-ab0c-d68b2f34d8cd',22406,NULL),
	 ('bf5dfa2c-e149-46d6-8bf2-9daa90b2530e',22446,NULL),
	 ('bf789124-6d36-4ec7-8339-e384af6bd18c',22290,NULL),
	 ('c168d9b3-997c-4125-b3fc-11926c2a9a8b',22419,NULL),
	 ('c1df74f8-9ad9-4d92-8747-5e7a1bfbbaca',22223,NULL),
	 ('c32bf83a-e231-49d9-8675-f62da1b7dbc1',22421,NULL),
	 ('c4555c1a-59a7-4953-84c8-178f7ac22cfd',22541,NULL),
	 ('c4d1a8aa-60d4-4e19-8d0e-e52261d1baf4',22577,NULL),
	 ('c4d1e5ab-572e-4de4-8852-9f3477769406',22258,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('c523359a-2e7d-4cc8-a0be-017f233b1922',22357,NULL),
	 ('c5f4311e-c142-4192-b6fa-99344f34268a',22348,NULL),
	 ('c644963d-1034-4bd8-bb01-02e703f0a71e',22356,NULL),
	 ('c64eac69-745e-4e59-861b-47fe08e38bf7',22531,NULL),
	 ('c77ff6c0-0641-4e8d-8db4-7511dc801ffb',22285,NULL),
	 ('cabbbfb2-59b0-44f8-8598-9e75203944be',22561,NULL),
	 ('caeb6603-d9e6-48a7-9f2f-62d58f9d29f1',22310,NULL),
	 ('cb9b5048-84c8-43b7-a097-461745b62e2b',22211,NULL),
	 ('cd14823d-3b92-428b-a3da-67a271d41b11',22578,NULL),
	 ('cd38df7f-34fc-4f43-bbff-f88cf3a07ce0',22276,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('ce268640-a7f0-4764-bc85-4aa626626d76',22352,NULL),
	 ('cf4ae23a-98bb-4455-a8d4-d50b5c4ce583',22222,NULL),
	 ('d01a7fb6-25c1-452d-ad22-0ab144ef6e69',22235,NULL),
	 ('d110a8db-2d83-4466-800a-7ca8c7e92adb',22424,NULL),
	 ('d189819c-2921-428d-a421-146ce89d5b61',22511,NULL),
	 ('d1fba019-6ecb-48d5-a9fe-51a3d020244e',22286,NULL),
	 ('d32c889a-e5d7-48d0-bc48-0fc62a503bed',22350,NULL),
	 ('d35a0192-7b32-4bc7-a885-910b52431bcb',22377,NULL),
	 ('d35e5c02-555e-462d-8649-f318f71624f8',22490,NULL),
	 ('d42249fa-d0d9-4adb-8fbc-34b4abfea4ee',22562,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('d4bbaa89-6d2b-4f3b-95e0-44b1abb0bace',22229,NULL),
	 ('d50a8671-35b5-4956-bfc3-48dcd77ce0d3',22515,NULL),
	 ('d55d9d6c-5175-4391-b0ec-d8d79cf0efb3',22384,NULL),
	 ('d5f7d011-c2d2-4d3a-ac74-3f74d71b61a8',22453,NULL),
	 ('d7116b83-c065-4e3b-b186-0c1b3ef2b425',22380,NULL),
	 ('d7718a48-f724-4412-a8ac-5118fd32d0b1',22479,NULL),
	 ('d7984ea9-3ad0-4ec3-bb89-548eb1c6711f',22552,NULL),
	 ('d7a003a1-cb40-42f5-8591-5cb4f71b2105',22440,NULL),
	 ('d7b32887-e1f1-458a-aa7b-83757d0b9680',22408,NULL),
	 ('d9867b6c-964a-4bbc-8245-a7893565152d',22216,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('d9f5de37-81bd-428d-aaa8-79d128021087',22209,NULL),
	 ('da054123-3e82-4f4f-9931-135939de0ca1',22514,NULL),
	 ('da18aab2-855e-4e78-8baa-78ca26501c1d',22297,NULL),
	 ('da7d48c6-9d6e-45c9-90e1-321978bbfecf',22403,NULL),
	 ('db591ba0-2b3d-4866-bd4e-25e02d2e2f1e',22483,NULL),
	 ('dbaccc0f-0c6c-4d09-a3e6-32b2def17b7f',22470,NULL),
	 ('dc0effdb-af33-46e2-ac63-3a2db4f49816',22291,NULL),
	 ('dc291cb8-06bc-46b2-912e-1a6ef926f1b7',22399,NULL),
	 ('dd0f73ce-6c06-4ec3-8213-d57e097bb56e',22423,NULL),
	 ('dd17ffea-56c2-486b-85ac-d290c08bcc46',22556,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('ddb0e09d-6cab-48e1-b267-9d84c5d01f61',22528,NULL),
	 ('ddbf7a2e-4316-48f9-8ae6-685b13d406ae',22327,NULL),
	 ('de172091-8161-40c0-ac38-920b3b9f9bbc',22573,NULL),
	 ('de39e24a-1de1-40e0-b089-05a7dd8f8e2d',22253,NULL),
	 ('deb3a46e-88bd-4b62-82c3-36e9e803eee4',22330,NULL),
	 ('dfd34f56-30e8-47fb-b2da-9919fcd65d74',22426,NULL),
	 ('e047445d-3fb2-4380-9aa9-81c12c67e593',22414,NULL),
	 ('e184638d-fdf9-4485-8481-8a1861419964',22367,NULL),
	 ('e18ba1e6-57e3-48ce-9c1b-59331d5c9621',22454,NULL),
	 ('e2689bb7-b6a0-46cb-8cf3-4ebac5cecf8d',22477,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('e280e960-7d98-4054-a37a-d5f5a9c191d4',22363,NULL),
	 ('e2e87caf-2c34-439b-95db-29b548aaa485',22267,NULL),
	 ('e4a3843f-c12c-4b97-8e39-643b9acc1ef8',22433,NULL),
	 ('e4e9add1-5634-4e88-96bb-c8ed940f42f0',22369,NULL),
	 ('e88a90da-4c91-4544-8af0-602228ed41ef',22465,NULL),
	 ('e8bc5387-780b-4b23-8835-29a7b84fe3fb',22574,NULL),
	 ('e9256243-8b37-4b77-83e6-45c35fd263e4',22375,NULL),
	 ('e9a4a7c2-e15f-4792-9d00-401ac8a942c1',22533,NULL),
	 ('e9ec4525-dacc-45f4-bcaf-b012b015af2d',22329,NULL),
	 ('e9fc42b9-0421-4b51-a74d-ad4da4798f26',22510,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('ea2b7243-67c8-4bb8-aabf-e969502cb25f',22221,NULL),
	 ('ea517b15-f227-4db2-abaf-a2d1b96e353c',22404,NULL),
	 ('ea7f9789-b91a-4db4-bf26-0b8ebb101622',22265,NULL),
	 ('eb3112aa-8ac7-454e-9896-e1fe4c1944b3',22566,NULL),
	 ('eeb4f5ae-41e0-4dc2-bb01-a742d3e4ab57',22390,NULL),
	 ('eec19235-2698-4d43-b88b-2d2d6c4a655c',22468,NULL),
	 ('ef9defa3-1cd3-4930-9993-f39b43e47de2',22219,NULL),
	 ('f114234c-4899-45aa-8ce8-ebc5151056d5',22210,NULL),
	 ('f13fef8e-7e46-4984-ab1c-57a2801c0ab9',22337,NULL),
	 ('f1a61d71-c316-499b-8115-4e48f0006562',22496,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('f213b79d-5ae4-49f5-8245-9c860c7a094f',22272,NULL),
	 ('f230ddcf-5707-4f58-8121-50b53dedfe04',22544,NULL),
	 ('f42557f3-4382-41ed-9a03-4966f9b82ec6',22206,NULL),
	 ('f472e6ad-5702-4c7d-a95b-6c3b4c5bc612',22231,NULL),
	 ('f507f835-bf83-49cb-b39d-ba0d461e35ef',22551,NULL),
	 ('f588e2cc-8c72-4aef-a885-2826a4e968ab',22366,NULL),
	 ('f59c202a-41d1-4b9e-88a0-367e58fa8c9b',22572,NULL),
	 ('f6ab8dd6-b0e3-4b9a-b56f-364cc970d6eb',22480,NULL),
	 ('f754547c-b1c9-4c98-9dbe-ce3b8ee55c57',22379,NULL),
	 ('f9442b41-b11a-44a4-82cd-d7698e24c2df',22513,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('f98a9da0-758a-4a01-8424-75f6c87aded2',22233,NULL),
	 ('fae3aba5-03ff-458f-8421-64a301fc35d0',22512,NULL),
	 ('fb4c9f02-4d98-491a-8055-34aabc99ffce',22428,NULL),
	 ('fb892694-52c4-49b0-bb60-7da76f6c2da8',22458,NULL),
	 ('fbf9f00c-1875-4e76-a27a-5210d216e588',22262,NULL),
	 ('fce2c1e5-164a-41f8-8928-9af2f8fe34e7',22280,NULL),
	 ('fd5673d3-367b-4f58-ae46-9d509d246833',22460,NULL),
	 ('fe103a91-de25-469d-be94-6f420683e892',22273,NULL),
	 ('fe500ccc-e3f9-4cd7-b26f-26915773ba91',22436,NULL),
	 ('feafd9cc-bb53-4d30-a693-fd654698629e',22538,NULL);
INSERT INTO tmp_patient_to_remove (patient_uuid,patient_id,flag) VALUES
	 ('fec1b56d-2073-44b7-a3aa-33fa108f51a4',22300,NULL),
	 ('fed0f1ca-1057-47a8-81fe-a8acde42e963',22401,NULL),
	 ('ff41aa92-4a63-4a58-aca2-5b3796d7c118',22564,NULL),
	 ('ff73940b-b206-4cd5-aeba-d5360b52b191',22539,NULL),
	 ('ff7837f5-64d0-4edb-8291-8e4d1fbdfcc9',22463,NULL);


delete
from person 
where person_id in (select patient_id  from tmp_patient_to_remove);	


INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('004dd856-1398-41ff-893c-83dd5e6034d6',830984,NULL),
	 ('007d670f-b9fa-438a-867e-38211c2f4693',830717,NULL),
	 ('01b525a2-675d-4871-9933-e9fc3e9571aa',830576,NULL),
	 ('01de7bb6-2891-484b-8314-2ab63f23443f',830702,NULL),
	 ('02282381-1b6f-4a03-b6af-fea18f5d902f',830912,NULL),
	 ('02bc7f4c-d295-440d-805f-bfd5eb257f4e',830948,NULL),
	 ('02f72fcb-aa56-41b7-bc50-06368d79572e',830812,NULL),
	 ('036dcb03-cca8-4a3a-9485-9839189c5c52',830603,NULL),
	 ('039c0536-737f-45a4-936b-4e4dba24418c',831002,NULL),
	 ('042a2ccc-aeab-449d-87a9-f5541408f478',830950,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('04a46083-15ee-4b49-a3e0-2f2bc4c027d0',1423296,NULL),
	 ('0575d528-891f-4b09-bf26-5e50e58cc922',830738,NULL),
	 ('05f6e38c-be6c-4177-8c6d-ceb0b3ab698c',830909,NULL),
	 ('0633e1d5-894f-45a1-abde-4033a3c04a5c',830954,NULL),
	 ('0697de44-2585-4910-92d0-089645bf012c',830968,NULL),
	 ('07168105-287c-4960-a09a-f070a3425864',830619,NULL),
	 ('0799ffbc-1315-4937-995a-8b24e0ec2c77',831070,NULL),
	 ('088105e7-1875-453a-82c4-1ccdc80b56d0',1423351,NULL),
	 ('08987f5d-e6dd-48b9-8e84-1096a14729b4',831035,NULL),
	 ('08b5e170-8481-42f0-8a0b-6d492f7c0f43',831050,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('09006fd2-25fc-4849-81ef-34ebcc1f8f60',830570,NULL),
	 ('0920ade6-2656-4d14-b703-939ef9ab4bee',830826,NULL),
	 ('098c6b80-47d7-4649-b3a9-78217bccbee7',831038,NULL),
	 ('09b53a55-50ae-49d3-8bd2-64534ce8e226',830638,NULL),
	 ('09c21758-0cda-4fac-bb19-d75ffac4fd2e',830887,NULL),
	 ('09eddd43-bc87-4ab3-8651-82e3f9d73555',1619728,NULL),
	 ('0aa4fc57-9cc8-46da-8491-0844d753ec34',830789,NULL),
	 ('0ac022b4-dd63-4a96-8571-dab4f3399a8e',830645,NULL),
	 ('0b30269b-4c52-48fb-8bd2-e6e253e707f1',830800,NULL),
	 ('0b548c53-b3c0-4d28-8716-e22e5dd84c6d',830634,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('0c9fc6ef-0c14-4827-886d-ba6303f87090',830624,NULL),
	 ('0cbeac5b-d865-490a-a7a8-0e90ef62012a',830739,NULL),
	 ('0d073a1c-125e-47e2-9f15-07ba45a29f3b',830997,NULL),
	 ('0d2c3982-c669-49a1-8313-278d8d7845fe',831078,NULL),
	 ('0d3d727c-7a50-49fc-b816-70bf48c7cb38',830883,NULL),
	 ('0d7b1166-e44f-4e23-abee-360284e2720a',830750,NULL),
	 ('0dee78ae-0289-4e5c-b319-eae333cea212',830723,NULL),
	 ('0dee8889-3a76-4ed7-835c-968fff2c3d68',830546,NULL),
	 ('0e1676f1-cece-4766-822e-cada7a90e029',830709,NULL),
	 ('0ea96d24-93cb-4c99-9cbf-a4cd754124ae',830923,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('0f008d70-7dc8-4372-821c-2f981d06e886',830803,NULL),
	 ('0f90f720-0681-4c2a-9166-1475504e16da',830575,NULL),
	 ('1105b1bf-2202-4c86-8d0d-c2676370829e',830706,NULL),
	 ('110a7155-f7c4-49b6-88b0-22c7cb40966d',830567,NULL),
	 ('11335310-c4b1-43a7-9946-948084a6d828',830989,NULL),
	 ('11e59639-acf4-491e-932b-2ed63adedaf9',830892,NULL),
	 ('1275bcc7-6814-4121-b99d-f18781793ab5',830623,NULL),
	 ('12ca573f-d65f-47ff-8cd7-ae43dfe5f13e',830620,NULL),
	 ('1395a72a-8cdf-49f9-a295-601abb943808',830922,NULL),
	 ('14dff1eb-ec45-4e51-9711-f0f877506a36',830778,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('156c9593-00b2-441c-808a-639ae96e22d9',830726,NULL),
	 ('16dc3bd6-844f-4500-a152-fc6269ddaba3',1423300,NULL),
	 ('17241460-3863-421d-8bc7-92f477c33dc8',830862,NULL),
	 ('173ff8a0-efad-4e8d-9031-1ba011116dd8',830653,NULL),
	 ('1760eef4-90bf-473b-af77-e7e0960fea65',831068,NULL),
	 ('180314cd-52b2-4bc4-a139-671139e9ef45',830692,NULL),
	 ('182cd585-5ef0-494b-8576-6aa799581e1f',830563,NULL),
	 ('1890beb9-815f-41d2-bb2d-b90b6c885061',831066,NULL),
	 ('1890c261-dcb8-4ee1-a9a2-bea3eebcbf8c',830827,NULL),
	 ('18cca7d8-e2a5-4c57-a064-b90d72bbbcd0',830540,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('19e55d4a-4950-40ff-abac-d1e308a3ab5a',830956,NULL),
	 ('19fb2aa7-57bf-4579-83ae-350fb526fcef',830724,NULL),
	 ('1a18250e-fd45-4c4e-959d-228e5f79b477',831019,NULL),
	 ('1b4f1a3a-7368-4faa-9e1f-6f924658a122',830590,NULL),
	 ('1c1d7691-d60a-492c-8723-6398577983e4',830914,NULL),
	 ('1c28bd95-69ca-460f-a97d-83ebbe92ae19',830588,NULL),
	 ('1c369e40-806e-4c25-9eb2-058242f5473a',830801,NULL),
	 ('1cf04e7f-bc92-49b1-bedc-0d4288f56de7',830704,NULL),
	 ('1d6418ac-1511-4485-9df0-df6e0f18b9c8',831047,NULL),
	 ('1d739bd8-d634-4168-85a2-b43acdc6f571',830897,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('1df2fc91-2c7a-4d2e-9941-0fe130d382df',1423353,NULL),
	 ('1e149c2f-3c06-42aa-9664-b794410ff067',830877,NULL),
	 ('1e4d4311-1821-4038-996c-84c5b0d3af3b',831046,NULL),
	 ('1e9ebd77-a206-41b4-b7cb-001b521f5a66',830710,NULL),
	 ('1f26ec5e-e867-46ed-afab-60d7d8ba4d98',831059,NULL),
	 ('1fa0a6f4-cde5-4ca9-89cd-10fe9f844305',831013,NULL),
	 ('20a2068e-d802-4ae8-aecb-171250144c09',830665,NULL),
	 ('215e7d3d-2bb6-4c9c-981b-45227defde15',831028,NULL),
	 ('21891b3d-5b45-4ae4-b0b0-5fb0a61023b7',831074,NULL),
	 ('21c1480a-f88b-4645-a5e6-7187233ceaaa',830863,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('21fa5708-b1c8-488e-80d7-67990a3b5ee2',830551,NULL),
	 ('2262b28e-00d1-492d-833d-189af4163be3',830793,NULL),
	 ('22731e82-3184-438e-92c7-3a64a7de76a3',830868,NULL),
	 ('2282f2fa-fecf-4f63-9047-af5929ef238b',1423280,NULL),
	 ('230e45b7-563c-4455-a2e3-9a800dcd93f7',830556,NULL),
	 ('23cfd9ea-70ab-4ed7-a51b-f67bf496a449',830990,NULL),
	 ('23d47ec6-a562-4d93-85b0-5e5c79163d59',830545,NULL),
	 ('2448913a-aabb-4085-89cb-37a4538cacc9',831027,NULL),
	 ('245535c0-607d-4e62-bb09-5595720c80eb',831053,NULL),
	 ('24d49ee4-1dcc-4ef4-9730-9731bd6fd7f5',830935,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('25afd34c-42de-4a20-8dc1-9ba39cae2afd',1423304,NULL),
	 ('261e5262-3e39-4e4e-bda3-7df33d808906',830644,NULL),
	 ('266f7cd0-1587-4580-b430-f54fd9fb9e7f',830833,NULL),
	 ('267a5e3c-6108-4841-82f1-4d8fd9b08651',830772,NULL),
	 ('28094b83-38d8-4c38-a5ff-eacc21a312b2',830924,NULL),
	 ('281966b5-6e70-4618-ae9d-f3c541dad4ac',830854,NULL),
	 ('283a8e07-3028-4103-9243-bcb37239056f',830851,NULL),
	 ('295e8b55-b44c-4561-8b17-29d490138957',830836,NULL),
	 ('29b0526e-cb3d-4140-a5e7-803319b234ce',830925,NULL),
	 ('29b25b60-50fb-428c-9825-c5789a739f95',830608,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('29c6a188-402a-416f-9421-2c661ee157b4',831079,NULL),
	 ('2a0f0fb7-07b2-4e07-aa42-ca86e2c99c12',1479086,NULL),
	 ('2a28e985-724d-4f1d-bb10-f20625c6add0',830938,NULL),
	 ('2a663a6a-1e92-47c6-b179-795f328ca3ca',830587,NULL),
	 ('2b66dd39-fa55-44c4-a592-c29beb45ce41',830705,NULL),
	 ('2bacb751-2682-415c-9374-04a3c67e3616',831076,NULL),
	 ('2c689a8f-68df-40fe-accf-8e83f080199c',831004,NULL),
	 ('2c888ef7-8df5-4595-968e-9434de3d2606',830527,NULL),
	 ('2cf4b8a3-876b-4016-94e7-9587b401bb6b',830944,NULL),
	 ('2d585d46-5c87-4004-9798-0b868ee1a2f4',830981,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('2d918985-c910-45c7-9c0c-c9014fcc9eaa',1619727,NULL),
	 ('2dfbd2f5-59ad-4eec-8131-617e843507ff',1423328,NULL),
	 ('2e63405f-1022-4072-af08-4f910aa081bb',830780,NULL),
	 ('2ec143bf-646e-4c80-8480-92e15d7efa5d',830971,NULL),
	 ('2ec868e8-33ff-4037-bb25-c4be009c8a96',830751,NULL),
	 ('2eca4fe5-2996-4f99-aa9a-944021e664db',830957,NULL),
	 ('2ff4c39e-91fa-497a-a5b0-53f6bb2b6f54',830693,NULL),
	 ('300c2552-fe65-45cf-bfb3-d44211a55a96',830641,NULL),
	 ('302c5c1e-028d-4dc5-a178-27ce12bbeb73',830663,NULL),
	 ('3072fd75-b62b-47c7-89e3-f64c2fab8197',830564,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('308ffd59-17b1-44d3-b0fc-19fb4a8f85f5',830574,NULL),
	 ('30f00b3f-6c19-4071-9cb4-723ca10fe714',830618,NULL),
	 ('310130ab-516f-4769-9c51-e04263d2ab7c',830698,NULL),
	 ('310b0c4d-68e2-401b-8c0a-18712ec1cd9f',1423350,NULL),
	 ('3128f2df-d495-488b-a67c-330264a1e551',1423316,NULL),
	 ('31405ff8-ec11-4486-8826-305cd3d2a9f3',831029,NULL),
	 ('314aec15-4dd1-4630-8753-16c759091294',830915,NULL),
	 ('317c888e-a2dc-4400-bdd4-560243c7cfd6',830891,NULL),
	 ('31b46d01-a779-4723-8c7f-c3c6a971d3a3',830934,NULL),
	 ('31bf3e91-674c-4fcf-bced-3286bacaa58e',830960,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('31f4511b-ac97-43d5-b955-a1709e8e56b1',830656,NULL),
	 ('32427c2a-53fb-491b-9ae1-e5fd14dc651e',830649,NULL),
	 ('33d198ae-db16-424a-8f48-78ee9ff11ef7',830910,NULL),
	 ('34e9eca1-f4e1-4910-bc5a-150c1ea98bc6',830526,NULL),
	 ('3514aa57-a1f6-4764-aade-b566715b8cdc',831055,NULL),
	 ('361700e8-421e-47bb-a334-91b8bff10683',830536,NULL),
	 ('3639760f-5f34-4717-814e-b343d300e71f',830940,NULL),
	 ('3666affc-d01e-48ef-9172-c2e396110aaf',830769,NULL),
	 ('3672e6c3-27f9-4332-bef3-b46e4d709e38',830582,NULL),
	 ('36d7bf10-cf68-4960-a29d-8a658d90dbfd',830917,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('374f947f-a87f-4fd6-9bdd-5a71304508b8',831025,NULL),
	 ('37af0770-f28d-4f6b-bbc5-cffdcfad154e',830875,NULL),
	 ('38197038-91ae-4189-b255-834a266934b3',1423334,NULL),
	 ('381a35a9-081b-4fe9-a14f-8d81c89991fb',831077,NULL),
	 ('38a99e03-226d-4e90-b68f-2bbf142c75a8',830822,NULL),
	 ('38bcec83-fe3d-4b8f-8f48-ab02dc2f6557',831075,NULL),
	 ('3900ef7b-120e-4747-8e6b-1599ee64f305',830816,NULL),
	 ('3955727f-ac28-4695-bd01-3e08ef6c5024',830722,NULL),
	 ('3959c343-d605-44b1-92a2-ae2d5940878f',830986,NULL),
	 ('399e279b-6e2d-48c3-bf23-f670c45e3402',830742,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('39d3c062-dc8a-4233-9a4a-2edd2f28df9b',830679,NULL),
	 ('3afe68b6-4861-407b-8366-01d194865f31',1423333,NULL),
	 ('3b5669ba-b7f9-455a-a97b-a93bd8363810',830838,NULL),
	 ('3b8a33a0-d4b5-427b-99a6-abb9af08e05d',830831,NULL),
	 ('3ca76b7d-6202-471c-b2f9-895ba34565fd',830985,NULL),
	 ('3cd52a15-7c59-4530-877d-10833ef5dfad',830689,NULL),
	 ('3d3e80be-87ce-4a5e-ba28-1f924f77be2d',830809,NULL),
	 ('3d801366-0a70-4817-b3f0-b943fbdb7e1c',830764,NULL),
	 ('3dd59cd5-9b8f-4427-aa60-e12a6c044969',831044,NULL),
	 ('3dda5717-4e7c-466f-b275-ea31c19a1d51',830534,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('3e1beeb3-29f3-4a74-a6e6-78771704b837',830746,NULL),
	 ('3ea86d31-6d40-432e-a40a-5a26a14630e5',830974,NULL),
	 ('3f153e98-75d2-494d-bcee-2da9aba4dd34',830664,NULL),
	 ('3f55fe0f-6c0a-45a1-82ff-444f45434b0a',830886,NULL),
	 ('4026b0e5-0e30-4d22-bd72-2f0d6da958ca',1423314,NULL),
	 ('40640554-c533-4295-b01e-f3138ce98a0d',830916,NULL),
	 ('4153eeaf-a9c7-4bbd-8296-2d40a75b17b8',830815,NULL),
	 ('41b141b2-8992-419f-b6be-3306f01f58d1',831069,NULL),
	 ('41fff9e4-af30-4041-882f-6f5f602eacff',1423339,NULL),
	 ('436f881c-3abf-4940-a421-cdcb96170d4a',830992,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('437a7bbd-b299-4a4f-a0e1-1c963410168c',830622,NULL),
	 ('43b261d9-26c0-4ed9-88bd-e7a1ac02a6ac',830674,NULL),
	 ('4455eedb-79d9-4109-b6ad-449e5f88aee8',831023,NULL),
	 ('4474cbad-5080-429e-bf9d-9d469bec875c',830966,NULL),
	 ('457a1ff0-38aa-41ae-ad51-59f054cc8d00',830669,NULL),
	 ('45e126d4-ad0c-4bcf-9d58-79fc7701ec5f',830614,NULL),
	 ('46b286d6-47e2-4d8d-b0cc-d0b80813f617',830837,NULL),
	 ('478348ef-8a7b-4d7b-8f49-3a076dd1e7fb',830566,NULL),
	 ('47b13337-a308-4b7c-a777-92f3391390e4',830824,NULL),
	 ('4852cbdc-3b79-4586-910c-da840e3e8492',830874,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('485fec8e-7637-42d6-9e85-3a1bba8241e1',830802,NULL),
	 ('486b3c86-780c-4c8b-8f7a-c34405ef98e0',1479090,NULL),
	 ('48af2534-a315-4a03-9b83-d1360249fe7b',1423294,NULL),
	 ('49cdfc76-ff16-4c20-ad17-b1d18407f6b9',830858,NULL),
	 ('49da52be-6bc5-447b-abfe-6af238990f2a',830864,NULL),
	 ('4a4d48ec-c85d-492d-be7a-0933eda693be',830735,NULL),
	 ('4adb03bf-3f85-45ef-bdb7-899bce272869',830839,NULL),
	 ('4b0be4a4-3ca1-4b1a-bedd-8eb35604a711',831008,NULL),
	 ('4b5770e8-a0ed-49d1-8402-b461ba4db894',830880,NULL),
	 ('4b7ccf12-b2f1-47d3-95cf-3086695a4032',830840,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('4bbfd154-ad0d-4eff-8ae7-33b65eb2458b',1423307,NULL),
	 ('4bfb0fd6-e679-4c77-8d04-7636c1480e0a',830758,NULL),
	 ('4cfd4e68-7dc6-4480-b7fd-5131debfbcee',830937,NULL),
	 ('4d11ef65-bd5a-4311-a369-de56cc5be934',830648,NULL),
	 ('4d5da27f-56c8-4fc9-920d-ad461f435fd5',1423299,NULL),
	 ('4d7e01da-8a45-489f-86b7-de8d7ea3e9ef',830994,NULL),
	 ('4e641235-9975-4f48-b53b-6c3ee2f92e90',830936,NULL),
	 ('4f1fb92f-b1f1-4fa4-beaa-254622adf5a1',830729,NULL),
	 ('4f7892a0-5f72-48d1-9561-2894251c0d8d',830525,NULL),
	 ('4faa939d-61af-45b2-8a7f-c21265e448aa',830561,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('4ffe6ddf-ce99-40cb-8cae-ea09608fdfa8',830688,NULL),
	 ('5000d272-786f-48db-ad64-bea0e3a30da4',830636,NULL),
	 ('50c791cc-86aa-42da-8c3a-b3e12f93e901',830951,NULL),
	 ('50e090c0-03d3-4ce4-a170-62c940cb80ef',1619730,NULL),
	 ('5118cff6-3e06-4c7c-a4d0-d81c6ccc14b0',831065,NULL),
	 ('514b5796-5085-4ebc-8c16-b12d486ad1fd',830629,NULL),
	 ('517191dd-bd23-4d26-a7ac-1e2976573d07',830896,NULL),
	 ('51749027-1568-4890-b0c8-c712c5b22222',830658,NULL),
	 ('51e5d811-f206-4380-9324-f3361a4527da',1423295,NULL),
	 ('52290459-8a0a-4227-b18f-ec3b322148cf',830830,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('52310d4b-d3a4-49b5-9d8d-67fe0c6afd13',830882,NULL),
	 ('52910290-b4f7-48ce-8279-38b74373b311',830554,NULL),
	 ('52a64d61-05e1-4dca-bde4-d36b6bfbf70c',831022,NULL),
	 ('52adac29-ed89-40eb-95df-1bd5a2d81cae',1423311,NULL),
	 ('52b5d59c-2230-4fb4-9cda-d718af018f21',1423290,NULL),
	 ('5341c75c-0be4-4dbf-9cf5-5f5e1a745f5f',830734,NULL),
	 ('53915106-4a65-4cda-8690-e71dc41e02fa',830549,NULL),
	 ('53d77763-ead5-4f4e-8b22-9d04a3369d8a',830871,NULL),
	 ('53db1333-3b19-407d-8526-4b2b2f62abd5',830850,NULL),
	 ('541fb492-6596-4aa5-b75c-9a2286808a5c',831071,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('543c6711-ca80-465b-bb74-1016da8839c0',831042,NULL),
	 ('549a4dec-82fe-48f7-8261-6219ba9ba08e',830731,NULL),
	 ('54d6e0f0-f6ac-40f9-b573-22e42b9b8475',1479087,NULL),
	 ('55ec6121-8007-4eb2-8702-74ecbbf7cc3b',830969,NULL),
	 ('567fc1c3-e7b2-41c5-a601-b7bec0f5075c',830806,NULL),
	 ('56bbd52a-0be7-4648-bb68-4c8de70271b8',830849,NULL),
	 ('56fc3355-e1cf-4365-99d5-e9943124c90c',830998,NULL),
	 ('57488f71-c92b-4925-a365-2c4e11f8dc19',831034,NULL),
	 ('5772506e-dbbd-4e82-aed3-2019242dac83',830528,NULL),
	 ('579b2a51-3d95-40ff-a204-365f20513001',831017,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('57acd65e-81f1-45c7-9d45-0c12b8ac5190',1423276,NULL),
	 ('57d0629f-7901-4885-ab36-bf3c409d79f3',830965,NULL),
	 ('57ef3ce5-92ee-43d3-9654-db1733501e7d',1423320,NULL),
	 ('580963bb-875e-451b-8ee5-ee3bb0e29abc',830628,NULL),
	 ('58a776df-e7aa-42d0-b61c-b952f86ba49c',830565,NULL),
	 ('58de538e-2f8f-4c02-9020-9448fbceb18c',830961,NULL),
	 ('58e66a86-a86a-4d1f-8e78-dbe4011d127c',830535,NULL),
	 ('592654b8-ce36-46f2-872e-6ee65650b352',830694,NULL),
	 ('5929d022-6c87-4eb8-8c6e-892cd2dd9a00',830529,NULL),
	 ('598ce87c-1c05-40e1-bf2d-e6d3f131920c',830707,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('5994eea2-5e55-400a-94c4-3fb3a940e8d8',830716,NULL),
	 ('59a524b5-632f-4158-8a32-4ce2c810f42f',1423332,NULL),
	 ('59d5fc93-45d5-47f9-b578-92f6ebf40fac',1423331,NULL),
	 ('5a1667c9-f371-4134-a6b5-4e4048d018e0',831024,NULL),
	 ('5a1ee9c8-b4ef-4c1c-a7f1-821ed66c46be',831036,NULL),
	 ('5a4455d2-d908-4e0b-a56c-1544aea4a930',1423284,NULL),
	 ('5aaa7b67-f8af-4399-9639-2d78bf17aa0a',831041,NULL),
	 ('5bc8dbf6-3401-49a1-bb48-632e78bd6924',830834,NULL),
	 ('5c8fa881-bd65-4d78-bf62-bf63a4389069',831045,NULL),
	 ('5ca24d60-5dc1-47f9-b5b1-9b92c71f2368',830671,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('5cb2e733-7a17-4c71-a36f-4c1ec8279410',830544,NULL),
	 ('5ccc0731-8515-4946-b6d7-954e845ecf7e',831006,NULL),
	 ('5cd9ae76-72b2-4d08-8ad6-920e231e9507',830660,NULL),
	 ('5d366597-1625-4080-b616-d70f2fed9882',830701,NULL),
	 ('5db04718-f746-48b6-bac7-801d86004c1b',1423335,NULL),
	 ('5dca7f09-b0c2-4608-9b19-231ce14ef46a',830560,NULL),
	 ('5e1a6b76-06c6-49e1-99a0-924728625736',831018,NULL),
	 ('5e574f9f-1070-44c6-81ce-46c408c0aa26',830637,NULL),
	 ('5ebfe71b-56ae-4d38-baf6-bd0018da5c75',830680,NULL),
	 ('5f1ec44b-c43d-4989-b4b9-2307bd5587fa',830814,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('5f5d27e2-fdfe-4011-bda1-5ae7d1fd0508',830791,NULL),
	 ('5f7043d1-ad83-43f8-8bbd-e45a9f8d846f',830557,NULL),
	 ('5f9f77bd-95dd-44bc-b78b-683302c7cfca',830558,NULL),
	 ('5ff8a911-406b-4ce8-ab40-0fb3a10612d4',831062,NULL),
	 ('6018369f-9a3d-4297-abd9-5a6e366f28a1',830670,NULL),
	 ('6037d920-10ba-45a9-b9e3-52977f0a0717',830788,NULL),
	 ('60fd0bbf-e75b-4d59-957b-151410c72fbf',830942,NULL),
	 ('6219edd0-9a57-4fdc-8ce8-cf0c55d025c2',830819,NULL),
	 ('62cc6e50-440e-4763-bf8e-4e4715f68630',830659,NULL),
	 ('63c774c1-1622-49b3-8de5-3e920c2ac974',831086,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('63e281b9-2d00-4e8a-be1f-66c62455c443',830970,NULL),
	 ('653fb457-cb9c-4d2f-9fdf-7c6ee4c67216',1479088,NULL),
	 ('66387a07-dc5a-4dc5-ab59-cf5f4d31e775',830569,NULL),
	 ('666a10c7-7811-4492-b41d-505fddde27a8',830835,NULL),
	 ('67093f9d-09ce-45d5-91b3-044f44231688',831054,NULL),
	 ('6712219f-28a1-46d8-bcff-8b7959400f24',830931,NULL),
	 ('67a437bb-a7bb-42a2-aecd-a9586611abd1',830568,NULL),
	 ('67eb34fb-b010-41b5-ab53-ab39559b2a5e',831030,NULL),
	 ('6812e943-1a88-46df-a0f2-754ba64bf5ed',830946,NULL),
	 ('6a361154-e076-454d-82f7-19e1b6138a46',831083,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('6b0a51ad-0e49-4709-b699-5914d2140714',830813,NULL),
	 ('6b39b2ce-3d37-40a3-b275-77c02a4034cc',830605,NULL),
	 ('6b43ddfd-93d8-426a-a293-d70af64418ab',1619729,NULL),
	 ('6c17bd93-0d53-4e3d-8adb-b96dc3e03928',831010,NULL),
	 ('6c3c9f3a-afeb-40a0-8425-4567d3f978c5',830842,NULL),
	 ('6ca8be9b-9cb8-41eb-bd85-f8556919d63f',830617,NULL),
	 ('6cb66dbf-4c7f-4e62-9a29-35b97bd7c69b',830690,NULL),
	 ('6e5ac34d-1235-4691-b5cf-372fc2bc3812',830736,NULL),
	 ('6ec14290-f973-4d0f-9950-ef0f60c108b6',830763,NULL),
	 ('6f301ff6-7a26-4691-aced-e8970cd986e7',830655,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('6f478c05-1e96-440c-8185-533273f2cc8b',831014,NULL),
	 ('6f5dff5b-8f17-403f-96b5-0ac34392f7b4',1423317,NULL),
	 ('6f8ec2f2-db64-4e1a-b457-1c8b4f5794fd',830855,NULL),
	 ('70b2bad5-6a81-4fad-8fe2-19b547d7f7f1',830673,NULL),
	 ('70f40bd1-9cc9-4fcd-88ee-aebb13f37e04',831031,NULL),
	 ('7183366f-1bce-4707-9d74-c07e06925a73',830785,NULL),
	 ('721018e2-cd58-4476-9af2-a4ad32397dc2',1423305,NULL),
	 ('72654f1a-ae46-4cd8-a4e1-7ead683db75b',831063,NULL),
	 ('733f9fe9-cbb3-43ad-8df9-3612c970e2c4',830604,NULL),
	 ('7371226c-a09f-48c7-9649-1e36dd1c0b97',830675,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('74016ed0-684c-45c7-a5b4-049a36ffec51',830745,NULL),
	 ('74b60587-cef1-47f2-a9b7-0577824ea9b8',1423298,NULL),
	 ('74b8f410-685f-4787-a188-74b74c160a15',830531,NULL),
	 ('750a9a0e-ce87-4289-af8c-55792beae7c1',830612,NULL),
	 ('753829a1-22c2-47c7-82f8-5546b7002872',830682,NULL),
	 ('759b3b49-2d81-4152-9535-d31d08cc3650',830762,NULL),
	 ('75f6be9b-cc7d-4f44-9981-f7e86d432335',830919,NULL),
	 ('761e427e-0390-47fc-9cf7-653045b40a55',830959,NULL),
	 ('7692e4ae-ea2e-462d-a650-5ce71c07cf24',830904,NULL),
	 ('76bbdff3-7190-4aa7-8861-0285b687cb66',830573,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('76d822e3-6f8a-4429-984b-81bdc08783e8',831084,NULL),
	 ('7857ea1a-4ef4-4e36-bbef-2bb54bc4086f',830626,NULL),
	 ('786b91aa-f343-45c5-a7ae-c99c539d1c96',831003,NULL),
	 ('787fe7b1-34d7-4a28-bf21-7f1160a5edc3',830844,NULL),
	 ('789f39b5-d3ca-4003-ba5a-8d70f5100054',1479085,NULL),
	 ('78a52509-1a32-469e-b891-dfb1b80c39ad',830662,NULL),
	 ('78b5a4f9-7ce0-4cbf-b0f8-05311de8c184',830695,NULL),
	 ('78bd73e9-3277-4d9c-912c-0783de1c163e',830975,NULL),
	 ('79553b0a-f0b6-4c5b-aef3-71ffaf98f57e',830753,NULL),
	 ('7b1d070a-3270-4b4f-9f7f-29cfb8c59895',830987,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('7b1ea838-a92c-4502-ac9b-274ceb16633f',830857,NULL),
	 ('7b5b51e7-003d-431d-bd20-e6ad3ab5aca1',831080,NULL),
	 ('7cda2c8d-c7ed-46f2-a76a-533a39246cf1',1619723,NULL),
	 ('7cffe59d-d404-4447-8e58-f4fdbad83892',831039,NULL),
	 ('7de27bad-6ec3-4267-8432-6ffab881b765',830906,NULL),
	 ('7e08a605-26ae-4ef2-b4f9-e77dc36af9fe',1423348,NULL),
	 ('7e292fca-eed1-427b-815b-3b569bea1f9e',830748,NULL),
	 ('7e3e6b35-e2f1-41d6-b021-3bcc37daeed9',830661,NULL),
	 ('7eed596d-ab53-470a-a7b6-4d7700df55cd',1423336,NULL),
	 ('7f43bb8b-bf24-4e9e-971d-a68f6c4e3790',830643,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('7f9fdf2a-b729-4e1e-ae44-e24ce14d925e',830775,NULL),
	 ('80216d48-48c3-4115-93ca-dcdd21985cf4',830825,NULL),
	 ('80329bdc-59a3-4199-8043-a0747f1936fc',831016,NULL),
	 ('8044d62a-3a65-434f-9752-e2b97be848cf',830794,NULL),
	 ('809437ad-cc68-43a0-b6a7-bcd96dfa38a0',830754,NULL),
	 ('80cd8994-a4e8-43dd-867c-36c46b1600ce',831015,NULL),
	 ('80f30ca2-fd85-47c8-8c6c-6f5b7afe6065',830625,NULL),
	 ('81c56a37-1008-4e09-a0df-cc4074e6c4d5',830890,NULL),
	 ('8232f6ef-cbf7-4962-a043-1d1058713447',830972,NULL),
	 ('82870ae6-32ca-4903-9362-17903d37d91f',830867,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('83d8a24e-c956-415e-bc2c-d29fd3854384',830755,NULL),
	 ('84340f8d-adde-40de-b60f-825a03dfa686',830993,NULL),
	 ('8458f94c-df40-4fd9-aefe-8b0185d44594',830749,NULL),
	 ('8492376c-ef1a-40ee-9f8c-8dfcea066d3f',830929,NULL),
	 ('8500f1b4-5fe3-4507-b7a7-8dc760c4dadd',830783,NULL),
	 ('85460c04-d51b-44cc-aa83-1712a416162d',1423318,NULL),
	 ('857eef5c-d746-4c54-8ccf-e6167e84b2d3',830718,NULL),
	 ('85cd64e0-4679-4acf-94cb-7bd6551613c6',830640,NULL),
	 ('85e3089b-47c1-46e4-9f4a-c73f76201e9e',830872,NULL),
	 ('862441f4-9f9f-495c-a453-c8eecbe2af2b',830597,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('86857b86-d618-445f-8ffe-39524c929d4a',831007,NULL),
	 ('86a352d0-2124-42ff-83d6-33ce75352527',831005,NULL),
	 ('874859a8-bb44-4836-95ac-64534005cf70',1423308,NULL),
	 ('87a605b8-b9bb-4a77-ac5e-4984dc20ca10',830708,NULL),
	 ('88467062-417d-40f2-8742-c17a91c03ee0',830807,NULL),
	 ('89242c22-752c-4a01-a53c-b5fb75e584cc',830647,NULL),
	 ('892bb272-26c9-43b7-8c29-9ec7cb435903',1423302,NULL),
	 ('893a1755-79d8-46de-bda4-d82c7f3dbdf3',830631,NULL),
	 ('895ef4ce-fb1a-4df2-b9c5-f4805fc1dc13',830532,NULL),
	 ('89b1d25b-d07e-40f1-bab3-ec4b39fd7cbd',831051,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('8a22db04-2498-4760-af8d-44d361df6abb',830537,NULL),
	 ('8a2867b3-4c2d-4534-bd8b-d6c65d29688e',830585,NULL),
	 ('8a48f068-dde0-4c39-bc71-c2f1014d4620',830756,NULL),
	 ('8a7c0375-a04e-4dc8-be08-14486f3794ac',1423312,NULL),
	 ('8a7eac7a-8fc4-4081-80fe-c722e68a66ab',1423309,NULL),
	 ('8b7f44ec-1245-4802-999e-e0f09be67853',830687,NULL),
	 ('8bfb2120-d069-46ce-8097-52fba793a40e',1423288,NULL),
	 ('8c6a864f-18fc-42d7-b494-3ea8afc75975',830829,NULL),
	 ('8caf125f-6652-42ae-8208-10b19e334dd1',830761,NULL),
	 ('8d7906da-1065-4449-8138-4f462cbd6e4f',830845,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('8d832445-3df5-4f20-bde5-2bcbe35e328c',830621,NULL),
	 ('8d9f05e7-19cb-4903-af16-351153becd56',830765,NULL),
	 ('8eac8bea-7e98-48dd-9012-4d8c77c50d16',830988,NULL),
	 ('8f27b445-6e31-452b-95da-ad7a04153d3f',830811,NULL),
	 ('8ff22e77-4015-45c8-9e68-80008cef5e8f',830654,NULL),
	 ('90e1f983-5b66-4f1d-9099-dc323fb9e77f',830927,NULL),
	 ('9166524d-dc70-40d7-8210-56eeee6bcfe7',830627,NULL),
	 ('928823f9-ccb0-4e56-a9e6-7a483ee5fdfc',830795,NULL),
	 ('92c931d4-919e-449b-aea4-cbf8199dd7f9',830779,NULL),
	 ('92fbe1a0-afb7-4d7f-ac54-3418ea03478e',831048,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('92fda4fb-5ed0-46a7-8968-c8fc189cb41a',830943,NULL),
	 ('93c5dcd4-a4ac-4b70-b7de-ae03fdb1e707',831060,NULL),
	 ('952c0d9b-9434-4cfe-8a67-1feaea733547',830899,NULL),
	 ('95520d41-301c-466f-b665-af9fe5879e0d',831033,NULL),
	 ('957d0b9f-7712-4128-8ef0-3267ac5964cb',830542,NULL),
	 ('9592f880-1264-4470-af16-fb37748a4cb1',830973,NULL),
	 ('95adae54-0dd8-4b67-b800-8bc048d0739a',830594,NULL),
	 ('9641c22c-e13e-4e59-b0d1-8deb5d8a0fdd',830728,NULL),
	 ('968dbc60-0659-4965-8d08-cccbf42e33ba',830616,NULL),
	 ('969435c2-854b-44a5-b462-a30e769e81d9',830865,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('96afb300-ea05-4f61-b1b2-fd3f3be79a54',830947,NULL),
	 ('9753ff79-2169-4c60-ab66-932614974ef6',1479091,NULL),
	 ('97b60dc5-6c7c-4ad9-b8c8-0258430f543d',830770,NULL),
	 ('97b997e9-1c0c-4d12-bdec-1c9209a910ec',830599,NULL),
	 ('97d0b535-3b9d-4f51-89d9-f0eb78516352',830963,NULL),
	 ('982aac7b-8d73-4eb7-b648-b9000d006b5e',830881,NULL),
	 ('98612fd4-8f76-4ba0-8c8f-33b453e30340',830596,NULL),
	 ('986f7856-587d-4de3-87d9-723a60fb03bb',830810,NULL),
	 ('98af0577-7537-4706-ab82-b4a58f21e238',830933,NULL),
	 ('98e27678-5b82-445a-82ee-5add4866818d',1423329,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('99020a83-be64-4f81-b146-1db2a6808b0e',830869,NULL),
	 ('99692fdb-f3b2-43ea-a62c-6c02e3f7c98d',830747,NULL),
	 ('99cce96e-1725-4a42-bb3b-39dda81ba769',831196,NULL),
	 ('9a213bf1-6aaa-4a12-90a7-639f6d96c018',830798,NULL),
	 ('9a32df32-1574-43e2-8287-1a2cd0d16954',1423321,NULL),
	 ('9b2c95cf-1030-4015-b607-646ac603508a',830964,NULL),
	 ('9b378a7f-cef2-4cbd-9cdc-a438a80a823f',830928,NULL),
	 ('9b514fd4-f30e-475e-accb-4d608abba53c',830686,NULL),
	 ('9b5e63da-e235-4eac-a853-712666d295ad',1423319,NULL),
	 ('9bbc17e4-efd1-42d7-8eb1-1fa4d9d900a0',830976,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('9c49f482-ba52-498c-b631-9a9bc9943530',831087,NULL),
	 ('9c59b745-17c3-4ed9-9612-35a220f6da05',830939,NULL),
	 ('9cb69e3c-b370-4101-bf3b-0bb3d18f0230',1423341,NULL),
	 ('9cd2d885-3753-4e7c-8aa8-46e72a187444',830905,NULL),
	 ('9d4f285c-bea6-4008-8a82-bc6b23956402',1423346,NULL),
	 ('9dd8c582-9f48-4c21-907a-10b55d1f3561',830804,NULL),
	 ('9e38844b-05aa-4970-b679-aa582519ce34',830578,NULL),
	 ('9e768645-2036-4487-a7fd-9d30c16d2fab',830583,NULL),
	 ('9ecc7210-b3f1-4623-9f5b-b70dd27ca6bd',830796,NULL),
	 ('9f9ac681-02dd-4310-b302-17f11dc14322',830979,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('a00676c4-8dfb-4544-bb0d-5334224c4254',830932,NULL),
	 ('a02c79d5-b8ec-4ab0-85b4-7e49f5f6d89f',830996,NULL),
	 ('a0b45cff-322a-4651-b69c-7f8fbda65d3a',830533,NULL),
	 ('a0e81ca7-ca05-4cb1-ad55-cad4c9a576cb',830894,NULL),
	 ('a108db3f-da23-4e84-8e39-5b66e1c90d30',830913,NULL),
	 ('a12cbe5b-0eb9-4718-b750-aa0fb7f1bfb5',830856,NULL),
	 ('a13b7c2d-e330-498d-a7cd-f0369a231f2d',831073,NULL),
	 ('a3689b98-e4e7-45bc-b916-f305bb1839cd',830651,NULL),
	 ('a372b35e-8fe2-4be4-8a50-13b8612f3667',830773,NULL),
	 ('a3e300ae-8eca-459c-a9eb-71c3d890a711',831000,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('a4abf22e-3901-453f-ae19-25c80b6c3ea6',830876,NULL),
	 ('a4e3514a-50f4-4208-a456-2eee192de184',830991,NULL),
	 ('a559e4dd-de22-4d46-8781-f097f2e34d48',831020,NULL),
	 ('a6e6f8c0-627c-4389-bd24-e4d797e4cb7f',1423323,NULL),
	 ('a734b87f-bc7f-42e1-8a5f-b2a012983f2f',830581,NULL),
	 ('a7411d2c-43e7-4aaa-b7b1-10e72f6989e6',1423285,NULL),
	 ('a790653a-4062-4c6b-9416-470a112ec1f4',830530,NULL),
	 ('a8291b2e-f305-48d1-8c57-e044b3179794',831012,NULL),
	 ('a8bfb30a-1001-47a9-9431-a6c04744df54',830553,NULL),
	 ('a96bc420-1e1d-4b35-8267-e6bd79533273',830677,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('a99b4a2f-836e-4f9d-a126-74119bbd6779',1423342,NULL),
	 ('aa346c2b-f368-4f09-bf20-3956b8637e02',831057,NULL),
	 ('aa844451-1483-4e89-bc20-c2388a500000',1423287,NULL),
	 ('aad81f96-7559-4afa-95d2-8e7bce6a6f50',830820,NULL),
	 ('aaf40e5d-90af-4e66-8f0b-bc0d5c301ecd',830787,NULL),
	 ('ab48246d-7e93-4640-b1d4-f27c5ed7eadd',830633,NULL),
	 ('ab6a0343-7088-4719-81dd-20f0f71e5922',830696,NULL),
	 ('ac8553ad-5d4c-4a95-8b51-8b037993f4cf',830595,NULL),
	 ('ad47101c-20cf-4866-b413-34f496d25ce5',830878,NULL),
	 ('ae3966e2-25da-41f0-a39c-299a08524575',831052,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('ae6a7a0f-43c1-4ace-9ad2-870977bd59f8',830888,NULL),
	 ('aea53279-255b-4c2f-a838-a7e8cb63f61d',1619725,NULL),
	 ('aeb7b4a3-dab6-4b86-b94a-0506de24a1da',830681,NULL),
	 ('aebb99bb-e72a-4f91-9cb9-9bf12a3332ba',830930,NULL),
	 ('aee68847-9b30-466f-8a12-7da217f2057b',831058,NULL),
	 ('af30fe24-f44f-4f45-b795-8969c354e98b',830768,NULL),
	 ('af718a67-503f-4cf4-b5ce-c4aeac200a4d',1423310,NULL),
	 ('afb53778-4347-4d84-a0eb-26ac941770fa',831040,NULL),
	 ('b07edf23-9ce1-4818-ae9d-5ef0b62a0f75',830524,NULL),
	 ('b0b41560-5486-4f5d-9c14-c1d5e2d9f02c',1423352,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('b0ea5c55-116e-4008-a0b3-73d2fd695a33',1423286,NULL),
	 ('b11bfc4a-117a-4f0d-add6-702dc8ddbb54',830911,NULL),
	 ('b1700881-6e3c-4a63-bfbd-c1d779558ac7',830908,NULL),
	 ('b20b7586-1a05-4275-8967-6ad4d3414929',830732,NULL),
	 ('b2105b2b-c788-4aad-b0de-a3b96bbddf31',831049,NULL),
	 ('b2a235d5-0aad-41e9-b5da-d65501cdcfcc',830593,NULL),
	 ('b2eea97f-f02c-4162-a5e8-21cad6dc751f',830995,NULL),
	 ('b339d6b9-ad3d-496f-a0ff-8c8fc3dd0827',830967,NULL),
	 ('b3c52aed-c9e5-41c1-811c-d706ece57458',830860,NULL),
	 ('b3e03485-e575-4133-8f44-c5b0cdb22569',1479084,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('b3f57b8b-0998-46c5-b89f-1c1a2d32b07f',830740,NULL),
	 ('b3f6b7da-ae9b-4ef6-959f-ae2bf0c51b88',831009,NULL),
	 ('b3ff12ec-083e-4988-b5fa-af2b26d45934',830895,NULL),
	 ('b471e033-7043-4c29-baac-9945c3af69c3',830982,NULL),
	 ('b4b64a24-44b4-415a-aa99-9d47ede550cf',1423315,NULL),
	 ('b5af275d-6079-47af-91de-19c783004cb6',830548,NULL),
	 ('b5fe5422-5df5-4817-a05f-9571a7a8b6da',830713,NULL),
	 ('b779e318-50d0-459c-b6cb-215ea90f8bb5',830843,NULL),
	 ('b7d02323-e12b-42c2-ab6d-b2c4a12cdc8e',830853,NULL),
	 ('b899ee3a-f50a-4642-a522-d2966fdd1f96',830847,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('b997b826-a68f-458a-91fa-0c8530a3e987',830828,NULL),
	 ('bb26dc4b-8640-4275-b28e-2ed1f5b94dad',830609,NULL),
	 ('bb2ad625-612c-4b15-910e-268b1a1f03ec',830760,NULL),
	 ('bba6c8cc-93ea-4896-a508-f81912614bae',830884,NULL),
	 ('bba8e359-2c9d-4a2e-8848-599620c9e673',1619726,NULL),
	 ('bc4f491c-dd74-4f12-844e-993f484a13bd',830848,NULL),
	 ('bc642dea-05d0-47da-a368-2d47ffeae2c7',830805,NULL),
	 ('bdbffbdc-691d-494b-a9ed-e8501e0c2224',1423345,NULL),
	 ('be0ff375-7ee0-450d-b368-a87ffdc40b91',830639,NULL),
	 ('be51c540-8998-4188-b5a1-f10b2a67e957',830584,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('be6ab6ff-d638-495c-a2cd-a9cc987e0c0e',830646,NULL),
	 ('beead9bf-00ad-4dc9-b52f-3edc7f9d3a76',830727,NULL),
	 ('bf59f7cc-b33c-4a77-a3a8-f19a8725d1c4',830777,NULL),
	 ('bf7167c3-4009-4533-92a5-e529991c0e78',830771,NULL),
	 ('bfd27fe9-48f8-4b2b-a0b9-432cacb6ae10',830889,NULL),
	 ('bfe3fcfa-dffc-4a0f-a973-d3253b8440f2',830592,NULL),
	 ('c04cd967-ce4c-4f4d-a702-abf4023e0d55',830552,NULL),
	 ('c07fec6c-90f1-4f4a-bd23-b1e5e808e287',1423337,NULL),
	 ('c08b2501-8050-454f-b8b1-4bd776d1ab61',1423293,NULL),
	 ('c09dbe21-0401-49ce-88f1-d7eabadbf178',830541,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('c1702f4a-43a4-48c0-993b-ff856c9fefa2',830691,NULL),
	 ('c1f788b0-f936-4776-b20f-dedbb51aff59',830902,NULL),
	 ('c3be9e6b-1034-4e16-8064-d473b457d0a0',830730,NULL),
	 ('c4a59e85-9811-4bb2-bf33-00da8428854c',830846,NULL),
	 ('c4ddda71-ece8-4ec7-854c-62d1a8aaaa38',830818,NULL),
	 ('c521f226-0418-4fda-a64d-2c5c1921ec04',830980,NULL),
	 ('c5a815ec-4c8b-452c-b943-1fd324851583',830539,NULL),
	 ('c5ba212a-9e8b-43ae-a6a0-9645e9e1a731',830733,NULL),
	 ('c5e26258-c229-495f-a052-fe4064e25ce8',1423343,NULL),
	 ('c6b05998-c04d-4ef9-96fd-d9d8fee3f2aa',831037,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('c6f1f7ed-06cf-466a-b21d-c455e99b5147',830999,NULL),
	 ('c6fb75df-a254-4942-bbd3-f69a0dc02bab',830776,NULL),
	 ('c7a3d535-92e0-4979-b67d-3360f929a9bc',831021,NULL),
	 ('c7c5e61c-afc9-49d9-ab5c-8f9d6e1d9d96',830685,NULL),
	 ('c8826596-3e48-4502-a4bc-2010ceb682f9',830699,NULL),
	 ('c88bdae7-3c49-4d2f-8896-97b9beecbd76',830952,NULL),
	 ('c88ebeee-acfc-4098-a005-76ea4bee532b',830610,NULL),
	 ('c8940ac7-1f72-49ff-88d0-0ac75d49b73f',830652,NULL),
	 ('c8d66760-94c2-4683-abb5-bff287be4c23',831085,NULL),
	 ('c8db6686-8e5a-44c4-8273-5652775f1a48',830714,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('c91351bc-5f21-48cd-8322-50c62e3df2a4',830666,NULL),
	 ('ca6d8e8b-810d-4da7-8fd4-9b45c31de183',831081,NULL),
	 ('caad3cd2-5dcd-4513-aba7-4c352d63b148',830774,NULL),
	 ('caf1bf7f-8d5f-437a-bd78-1a00eb4ac1c3',830879,NULL),
	 ('cb995f1f-1ed1-48df-aaf9-333350b10ba2',830790,NULL),
	 ('cbacff44-3d11-4f14-aca9-ad722daeebf2',831064,NULL),
	 ('cbca50a3-9734-4190-b8f5-b8951f531c93',830866,NULL),
	 ('cbf13ace-87f8-4969-9e2b-8fdc28eab166',830678,NULL),
	 ('cc8c6341-eeba-4716-afad-e658126bdd5b',1423349,NULL),
	 ('cca48134-61e1-4e47-b08c-8dfb80ac8956',830591,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('ccbd8113-ebc5-4e4c-87fd-9583a69b2b9b',830797,NULL),
	 ('cccf924c-f868-4820-b828-2f96d4637850',830538,NULL),
	 ('cd281d3b-b7f8-4367-81bc-884107a66ca6',830683,NULL),
	 ('cd6301da-a7c9-4e46-adc6-1d7cb8d82398',830757,NULL),
	 ('cda4db3d-a6e4-443e-9a2a-208d84633c99',830600,NULL),
	 ('cdd34f87-5f13-4e31-8f82-43d795f693e1',830821,NULL),
	 ('cde53b0b-ffd4-4ecd-99ba-581a6b7b1517',830602,NULL),
	 ('cf04fff5-8ef1-44dd-9eb4-68bbc783164e',1423344,NULL),
	 ('cf248737-adbf-4075-9640-7a7ba70fc5da',830598,NULL),
	 ('cf7cd351-3105-4b8a-b231-65826aabc577',831067,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('cf829ea0-c599-4b6f-80c2-8bb02c1882b0',830615,NULL),
	 ('cf92c320-cac7-418f-9ae4-cc955e2eedcf',830684,NULL),
	 ('cfa5dd40-0088-485e-9482-e72dfd187be9',830782,NULL),
	 ('d01feaec-7d11-4ff1-95f9-98f8c8318596',831001,NULL),
	 ('d08a0128-2848-4f09-9daa-ac8453896a3c',830832,NULL),
	 ('d0d15e4c-1d48-478f-bdb9-fdf923eece86',1423325,NULL),
	 ('d13b86e7-dea3-40ad-87cb-39175306e4af',1423283,NULL),
	 ('d15b6f27-e567-459b-96c1-440db31842b4',830870,NULL),
	 ('d1abdb9f-980e-4dc3-afce-ba22b863fa6f',830978,NULL),
	 ('d1af9e68-9845-4ed8-8489-f90a7550ccb5',1423306,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('d1db74c3-378a-4a1b-ba08-9816d5969c48',830580,NULL),
	 ('d3a477d1-bd36-4691-bf39-59eaec24bf64',830859,NULL),
	 ('d3c607f3-7f56-4fbe-8915-233b190d70d5',830918,NULL),
	 ('d3d72069-14f3-4aca-b99d-ce645ce4e6fe',830586,NULL),
	 ('d3f7d9fa-8853-49a6-b3e9-900324c5d60b',830606,NULL),
	 ('d408a63c-36b5-4657-a6bd-2e68c4d50002',830926,NULL),
	 ('d4605984-f4e6-42fd-9519-070a775109f0',1423330,NULL),
	 ('d49c80c4-e441-461f-8194-27c1f0648cd5',830667,NULL),
	 ('d54a6488-4e7f-423c-9090-6963d1f2dc62',830607,NULL),
	 ('d69e3da8-a4ab-4313-9982-6eebad0e02cd',830784,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('d6b5857b-2e44-4bc8-8a3a-0c63f9b4aa9e',830650,NULL),
	 ('d6ebaa71-8028-49fa-9bb6-aba2bbaf2ba0',830861,NULL),
	 ('d75405d8-dea9-4dc2-ae83-32f914ff99f3',830543,NULL),
	 ('d7b01afe-754e-4373-b581-596b6fbc4c1c',1423340,NULL),
	 ('d8f36206-6adc-453a-a0ba-d84dd0752116',1423297,NULL),
	 ('d941dda7-6d78-40b0-823b-7e05e23ee6cc',1423347,NULL),
	 ('d9683d20-251d-49fe-b64f-301c287d0ba8',830901,NULL),
	 ('d970eb79-681e-40cc-8701-19cb11ccbec2',830601,NULL),
	 ('d9a7dfbc-6a4b-4716-813f-d851295a433d',830808,NULL),
	 ('da6b4a09-4dcd-44ba-be37-d9eb7abeb453',830572,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('da84a25f-3816-4f6b-9e30-e52ffdd8b125',830721,NULL),
	 ('daa38bbf-f6e1-4bcb-a4c7-9e4daa086fa4',830792,NULL),
	 ('db19db2d-8537-4d37-97a8-2230e140f7f6',1423324,NULL),
	 ('db2918ce-ab6f-477c-8ef7-06b96457578b',830676,NULL),
	 ('db305316-56a2-44e5-a94a-5b74fc92474b',830719,NULL),
	 ('db56c386-20c1-4425-aa2e-dbe8989a54cd',830711,NULL),
	 ('dd6bbac6-5693-4b60-93d4-16ecde51f53c',830958,NULL),
	 ('ddb6d4e3-368f-4d4e-a63a-a31fe8ea53e2',830700,NULL),
	 ('ddda6632-07a2-4a60-aae7-fd8b8aad5b8c',830589,NULL),
	 ('ddef7b11-97ea-4b73-a793-bcbd526cdc88',830907,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('de82bed2-24c0-4ea3-bae8-cf0285333159',831026,NULL),
	 ('df00615f-cbfb-41ca-a5b1-2924fbcc50e3',830737,NULL),
	 ('df2e13b7-8be7-42a5-826e-d93148ccdf05',830562,NULL),
	 ('df3668d9-04b4-4f0c-83d8-4521e098c6d6',830817,NULL),
	 ('e17d6a92-8f26-41d3-b979-7815f89c1f46',830741,NULL),
	 ('e1c22e2f-d1cf-4539-8623-0cbb13929f95',830559,NULL),
	 ('e2048b82-6a9e-4825-b634-fb495b6eb4d2',830611,NULL),
	 ('e2ad3b80-4635-4545-a05d-d2d26dcc15bc',830613,NULL),
	 ('e33676d2-84ec-4f18-92e3-0f16c92175c6',830983,NULL),
	 ('e423e415-9fc4-4562-9692-b8f14bef8e5c',830852,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('e5eabe80-e6b7-420b-be03-6d221d6da5e6',830725,NULL),
	 ('e601405f-d6a7-4448-a528-1318b8bbde3c',830900,NULL),
	 ('e669638b-edfd-42c9-ba2b-e5499c918141',831043,NULL),
	 ('e67803c8-3438-4ad0-b6ac-7bd0186eeba6',830571,NULL),
	 ('e6c41ef2-c5cd-47c2-a435-63b85b553ceb',830759,NULL),
	 ('e6cd8008-be31-4fcb-9c05-b8186c3d076a',830953,NULL),
	 ('e6f76b70-2d79-49f9-9d8c-7953ab2df492',830955,NULL),
	 ('e7e29269-db91-4b5d-95c2-1dcbfa7d9096',831011,NULL),
	 ('e8adc8de-038f-4200-bc7c-2fdc81bfcd9a',830743,NULL),
	 ('e8b3b496-519f-4eeb-b43c-cfa70f8fec10',1423303,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('e902e7f7-eb5c-49a4-94c6-aa3003d90de3',830873,NULL),
	 ('e90a0859-5936-4bda-8285-1ca1e08f27f6',1479089,NULL),
	 ('e9814470-9347-41eb-b70f-bb78887ffcc2',830635,NULL),
	 ('e999c4c1-ec69-4bf7-911e-b93cf151a249',1423275,NULL),
	 ('e9c6584a-02f4-4baf-bb67-d75e891e0a49',1423281,NULL),
	 ('ea7d6b1a-db04-4d74-869e-94c11318c896',830720,NULL),
	 ('eb989b54-8c13-47ef-be3a-cec2caad40ad',830781,NULL),
	 ('eb9d8152-16b0-4291-a065-a0933ab3f17f',831056,NULL),
	 ('ecb0ef2a-3030-473c-8b87-e32a938411a4',831082,NULL),
	 ('ed1a4f14-bd12-4444-9dbc-eaea8dd8c456',1423313,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('edcd5dfb-371d-44dc-af8b-d5559f936012',830898,NULL),
	 ('edee43e9-c0c0-48d0-aaed-78178177a5eb',830668,NULL),
	 ('ee467d77-f73f-49a7-a691-0c4a065b393f',830577,NULL),
	 ('ee798316-f256-4f94-ae2f-928e046b402e',830823,NULL),
	 ('ee96657f-6676-4795-ae67-aded9da22e4c',830744,NULL),
	 ('eedf26df-5392-40ea-b91d-cdf332579018',830642,NULL),
	 ('ef1842c6-4bb7-408e-bba5-cba72a9783c3',830703,NULL),
	 ('ef9a5707-4b2e-4123-82aa-b6d67d97bc53',1423322,NULL),
	 ('efc8d211-2a03-4836-bb35-1fff73cd97dd',830697,NULL),
	 ('efcbda4e-8e34-4794-b3f0-d5482f45c1c7',830977,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('f0ad7fa6-68ca-47f6-b12c-f0338f4624df',830712,NULL),
	 ('f0ca4cfc-0a24-4475-ad3a-47745a3faca8',830630,NULL),
	 ('f0d01fbe-d160-4a16-b5e4-f47376b18676',1619724,NULL),
	 ('f12dcf26-82b2-4b97-a90e-806cc3f17576',1423326,NULL),
	 ('f1983df6-9df2-48fa-8ac6-52fad4437afb',830672,NULL),
	 ('f21a071b-cf37-419a-95bd-02db959a4333',830657,NULL),
	 ('f22777a3-eb9a-4fd8-87c3-5a17975417be',830767,NULL),
	 ('f23de824-bb8c-4824-9800-ea5f9032a274',830941,NULL),
	 ('f281260c-d310-4244-92be-ac211411e221',830555,NULL),
	 ('f2cead86-7e56-4c43-8131-0c21d4061a0e',830786,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('f300d95e-65e5-4b88-a8b9-ca8f75dc4bbd',830885,NULL),
	 ('f327989c-6eaa-4fde-8f14-82e762c5edfb',830579,NULL),
	 ('f3cf27b9-0fe5-43f2-be44-1bdece7d66f8',830893,NULL),
	 ('f4722e51-cfbd-4b02-a7ea-d883a47b7bfe',831061,NULL),
	 ('f53b82bd-96d2-427c-84eb-a751ec101701',1423282,NULL),
	 ('f67d3350-6882-45aa-bcb8-5f8f19e0a582',830766,NULL),
	 ('f760e4c5-4865-4971-84eb-12630ad1ed71',830752,NULL),
	 ('f7643aa1-d424-4f75-bfe1-cf20d8188313',830550,NULL),
	 ('f7d637c9-d5c5-4bdf-8299-4418b570e984',830962,NULL),
	 ('f7daf4bb-c708-4820-bdbc-b197d001955b',831032,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('f818147a-db7a-4a09-8b3a-db8885f20498',1423289,NULL),
	 ('f84b06de-6cb3-4373-a71a-3eb11b82606d',830949,NULL),
	 ('f90a5656-eaa5-4de0-b188-b8b1bdc4aea2',830921,NULL),
	 ('f95ea200-8e70-4dd2-987d-8158536afe53',1423338,NULL),
	 ('f97cadab-83cd-4e26-8a84-49f0b1b4ba2d',830841,NULL),
	 ('fa194f99-3121-4ba8-9c17-7840ddc1f185',1423291,NULL),
	 ('fa395abb-57cc-48e6-89d5-07e924bd7c35',830715,NULL),
	 ('fa9c6fea-b9f1-4737-947a-6b4efa41b0c4',830903,NULL),
	 ('faaa44f8-1dd9-4de1-8afd-fea66d44d7ce',831072,NULL),
	 ('fb223b10-d900-4452-b8ea-8aa64df71973',1423327,NULL);
INSERT INTO tmp_obs_to_remove (obs_uuid,obst_id,flag) VALUES
	 ('fb9ef53e-3909-4c0b-bdc6-c939c07829e0',1423292,NULL),
	 ('fbe6b658-01cf-4a27-b392-44cbe6bfbfba',830799,NULL),
	 ('fbe6d883-af1c-4c40-8aef-b85f185a83b3',830632,NULL),
	 ('fcafc522-bd79-4ffa-ae29-a89d9cbade0e',1619731,NULL),
	 ('fe9521f9-76a6-499e-818f-4c4f3a72eac5',1423301,NULL),
	 ('feceedfd-db3d-47ee-bb90-57ae9d2aaf91',830945,NULL),
	 ('fed6cfed-c6d6-419f-95fd-c4981fc340d4',830547,NULL),
	 ('ff192441-2c95-47a0-a96b-db13ca017f59',831088,NULL),
	 ('ffbdad73-706c-4d83-8248-2aa6ff1f7cc5',830920,NULL);


delete
from obs 
where uuid in (select uuid  from tmp_obs_to_remove);	
	 

	 