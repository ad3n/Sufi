-- MySQL dump 10.16  Distrib 10.1.43-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: semart_sufi
-- ------------------------------------------------------
-- Server version	10.1.43-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `semart_angsuran`
--

DROP TABLE IF EXISTS `semart_angsuran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semart_angsuran` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `order_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `tanggal_angsuran` date NOT NULL,
  `jumlah` decimal(17,0) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7790400F8D9F6D38` (`order_id`),
  CONSTRAINT `FK_7790400F8D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `semart_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semart_angsuran`
--

LOCK TABLES `semart_angsuran` WRITE;
/*!40000 ALTER TABLE `semart_angsuran` DISABLE KEYS */;
INSERT INTO `semart_angsuran` VALUES ('023df695-361f-4da9-b8e6-fa846bb9a7a2','d7bfe09f-34e0-46b5-a048-12bb3648857d','2019-11-26',325000,NULL),('03561c71-2871-499e-ac45-3c92ee675d1d','aa5e9e5b-453b-45ee-bf21-9a812863e951','2019-11-26',600000,NULL),('0b20c63f-4dc5-415a-9d9a-73e9e05b3225','aa5e9e5b-453b-45ee-bf21-9a812863e951','2019-11-26',2300000,NULL),('0c586cd7-b889-499f-8a94-4003b3d05902','e6561a28-669e-4a82-ac93-314d0c5f4e21','2019-11-26',135000,NULL),('0d42ddeb-5c9d-4923-ba34-1e7f6fd58576','ba6b0d57-c685-4f87-902f-a5bed66193e7','2019-11-26',465000,NULL),('0dc813ff-0a3d-4e2c-9088-0545c77184b5','c69e819b-1479-43c6-af40-7cf089b3be58','2019-11-26',600000,NULL),('126ae503-1c42-4f39-a9e2-bb7e8c8b8a41','feee4271-d966-445c-93e1-d2478967aa7c','2019-12-04',335000,NULL),('14278e10-07d3-48ed-8ac4-2bbce787f0e5','e6bad299-09fe-48ed-b374-6f48bd9d1061','2019-11-26',600000,NULL),('1797ba65-327e-47ac-afd9-6529f8db4560','efc2e84e-24ae-4ec8-8342-3558c1e30ca9','2019-11-26',300000,NULL),('17bfa793-2ae8-4945-9ab3-c327ba41e5c5','d5b5c866-9440-4946-8901-3b51f26411fb','2019-11-26',275000,NULL),('1a38c3a3-115f-4c7c-97a7-093dd9ea72b2','9b3285d5-35c4-4913-ae39-6309aee81452','2019-11-26',500000,NULL),('1a41c93f-43a5-478d-8d6a-08236d128662','7bac991c-dc3f-462d-869c-ff9aed86d8f7','2019-11-26',200000,NULL),('1a8c248f-6d36-4ef0-be87-466595c72b57','a4dbf04f-8f70-49fa-9e8a-f898897d8714','2019-11-26',500000,NULL),('1d6aa152-d92e-4ada-b845-7e72e49538ef','e6561a28-669e-4a82-ac93-314d0c5f4e21','2019-11-26',335000,NULL),('200a8d05-76bf-487e-bcd3-de26ad8ef31b','9b3285d5-35c4-4913-ae39-6309aee81452','2019-11-26',500000,NULL),('22ca793f-1eb6-448d-aeda-0e1c12763711','a5d4866c-cfb9-45b7-b1db-d987224ec17b','2019-11-30',300000,NULL),('2a4b3125-1293-4baf-a0e2-6fb5ecd23943','c69e819b-1479-43c6-af40-7cf089b3be58','2019-11-26',300000,NULL),('2c037727-9101-457f-ad64-c8ccc33f7049','c69e819b-1479-43c6-af40-7cf089b3be58','2019-11-26',300000,NULL),('2da51beb-daf6-4f56-9714-ad775822755a','916267ff-aa6b-4de9-95f6-668c129a1633','2019-11-26',3000000,NULL),('30fc799d-0e5c-48f3-b8f6-3ba1858883ba','9b3285d5-35c4-4913-ae39-6309aee81452','2019-11-26',100000,NULL),('388fc5c7-863a-48b1-b8ea-cd26b7c24866','ba6b0d57-c685-4f87-902f-a5bed66193e7','2019-11-26',465000,NULL),('394e8575-6805-4ba7-a3b8-533850284596','67e663bc-f6e5-4ec3-a97a-47d304067ce9','2019-11-26',1000000,NULL),('395519f4-5eb3-411e-80f8-fecb6a806bb4','916267ff-aa6b-4de9-95f6-668c129a1633','2019-12-03',1500000,NULL),('3c00721b-5c4e-4a43-b871-7dfb1810316a','9b3285d5-35c4-4913-ae39-6309aee81452','2019-11-26',400000,NULL),('3e4494c7-1adf-433e-96f1-11915115c3b7','28e8f73c-a522-4293-ad75-a86431692ea5','2019-11-26',500000,NULL),('41130b43-8654-434f-bbf7-397c63e7cff2','ba6b0d57-c685-4f87-902f-a5bed66193e7','2019-11-26',465000,NULL),('42dd9c15-f4aa-4d4f-a3fc-0f19af5b7ccd','e6bad299-09fe-48ed-b374-6f48bd9d1061','2019-11-26',600000,NULL),('4855f565-3181-4118-8455-1bdfa47002bb','1494683e-ea17-4e9a-b742-ef81c9b13bc1','2019-11-26',325000,NULL),('4bcb8734-d659-477b-b22d-0e6e4b2484ba','142ef343-637f-44ed-b93c-9f0d37afe078','2019-11-26',300000,NULL),('53f858a6-59d4-43ab-a0ef-09bad7c60a75','e6561a28-669e-4a82-ac93-314d0c5f4e21','2019-11-26',335000,NULL),('59fa44da-d219-4740-a073-31123a7d7293','e6561a28-669e-4a82-ac93-314d0c5f4e21','2019-11-26',200000,NULL),('5bf2142e-decf-4a93-aef0-1265dc7696a5','dd140823-c44c-4199-9952-a28a8c7c2598','2019-11-26',800000,NULL),('5d28e67b-b2ae-4f05-b05c-34a77658bdc6','79c486fc-8d1b-4cee-87dc-8884ff1fadff','2019-11-26',2000000,NULL),('5e620df1-a306-4f8f-8e9e-56b62131fdb3','fd0cae9b-1443-4edc-a43b-8a7997204c5c','2019-11-26',300000,NULL),('615e8cd5-8b32-42d2-8af7-9d6c6b2ec1dc','67e663bc-f6e5-4ec3-a97a-47d304067ce9','2019-11-26',1000000,NULL),('61e44344-42d7-49a1-ba86-af0eb2a95351','1494683e-ea17-4e9a-b742-ef81c9b13bc1','2019-11-26',325000,NULL),('62d4e6bc-5c8c-4528-bb4c-21420db7cd45','ce67a794-3f79-4af8-9048-1f786b9478cc','2019-11-26',1250000,NULL),('6331b6b9-a454-4282-9010-2e9daa4f25a4','dd140823-c44c-4199-9952-a28a8c7c2598','2019-11-26',800000,NULL),('658eb360-ea2d-449c-ab08-f91065b0c14b','1494683e-ea17-4e9a-b742-ef81c9b13bc1','2019-11-26',325000,NULL),('684eff62-a01d-4093-aac4-9c58cdf6f922','fd0cae9b-1443-4edc-a43b-8a7997204c5c','2019-12-02',300000,NULL),('6a83ed06-0591-4bcb-9af8-5a413d838779','51f759a4-9de9-4284-94c7-62a9f1169b96','2019-12-02',200000,NULL),('723a0445-0e56-452b-8071-3e437be77d10','11bb0cf7-075a-4712-83d0-d7eb319ccfde','2019-11-26',1500000,NULL),('735cd360-7cfd-44f7-89b0-de919b15f838','142ef343-637f-44ed-b93c-9f0d37afe078','2019-11-26',400000,NULL),('769277a5-f42e-4096-92aa-91ddde08bad5','7bac991c-dc3f-462d-869c-ff9aed86d8f7','2019-11-26',300000,NULL),('78383da6-e896-4493-ae0b-b6c6550ba83c','fd0cae9b-1443-4edc-a43b-8a7997204c5c','2019-11-26',300000,NULL),('785b2bf4-e7bf-43b3-9154-51fbc118df47','c45a402b-c1d1-453c-8395-80485b0a1b2f','2019-11-30',200000,NULL),('797ac81b-93e6-4115-82df-eef77d76cd1d','9b3285d5-35c4-4913-ae39-6309aee81452','2019-11-26',500000,NULL),('7a154a2e-bc79-434d-badb-172f4bf5c18c','aa5e9e5b-453b-45ee-bf21-9a812863e951','2019-11-26',600000,NULL),('7cb71505-66c5-4df9-a1f1-2ba7eae38a58','04cfe49d-4de2-47a5-aa44-fae64685aff8','2019-11-26',400000,NULL),('7f5f257e-74d6-403c-83a3-58a1b546b51e','142ef343-637f-44ed-b93c-9f0d37afe078','2019-11-26',300000,NULL),('87d1b254-29c4-4bb0-81e2-1c189071b9b9','ba6b0d57-c685-4f87-902f-a5bed66193e7','2019-11-26',300000,NULL),('8d2be7f8-6b79-4bb2-905b-0459af6d335b','a4dbf04f-8f70-49fa-9e8a-f898897d8714','2019-11-26',600000,NULL),('8f6489cc-0095-4350-a6a2-63bff84c733b','142ef343-637f-44ed-b93c-9f0d37afe078','2019-11-26',200000,NULL),('91987953-5fdd-4803-af54-e290a29dc44d','ce67a794-3f79-4af8-9048-1f786b9478cc','2019-11-26',1000000,NULL),('91d7fea7-b5a0-4f76-bd9c-bd559414e64a','1494683e-ea17-4e9a-b742-ef81c9b13bc1','2019-11-26',325000,NULL),('92c14ad6-6618-4ce4-864f-e6a83e5126d5','ba6b0d57-c685-4f87-902f-a5bed66193e7','2019-11-26',465000,NULL),('950c09e6-39d8-47c9-8e78-1a30738b0643','67e663bc-f6e5-4ec3-a97a-47d304067ce9','2019-11-26',1000000,NULL),('952d1f1f-bfa3-456a-85e6-198e92c71fe2','d5b5c866-9440-4946-8901-3b51f26411fb','2019-11-26',275000,NULL),('96a6a85e-da91-4950-8d4d-dee9ef7c037b','51f759a4-9de9-4284-94c7-62a9f1169b96','2019-11-30',200000,NULL),('96c1e99d-5762-4084-9626-1229c3f54374','fd0cae9b-1443-4edc-a43b-8a7997204c5c','2019-11-26',300000,NULL),('a0cfc765-c2ad-442e-9dfb-7005cad56adb','142ef343-637f-44ed-b93c-9f0d37afe078','2019-11-26',300000,NULL),('a3e0a899-0be1-40c4-a916-ab60356ceb36','feee4271-d966-445c-93e1-d2478967aa7c','2019-11-26',335000,NULL),('a3e8610d-c7cd-44d8-8e3f-fda4f755ed22','e6561a28-669e-4a82-ac93-314d0c5f4e21','2019-11-26',300000,NULL),('a51819f6-4376-4976-9d6a-86afd2b6d123','67e663bc-f6e5-4ec3-a97a-47d304067ce9','2019-11-26',1000000,NULL),('a5e8efbc-0025-4de3-a291-cd34fc82125b','efc2e84e-24ae-4ec8-8342-3558c1e30ca9','2019-11-26',300000,NULL),('a72cd6de-76be-4cec-a9af-d77b999a2a71','d7bfe09f-34e0-46b5-a048-12bb3648857d','2019-11-26',325000,NULL),('a8be6f43-242b-40c7-839b-754af348ed46','11bb0cf7-075a-4712-83d0-d7eb319ccfde','2019-11-26',1500000,NULL),('aa488044-0eb8-4341-9ed9-358062f78dc5','e6561a28-669e-4a82-ac93-314d0c5f4e21','2019-11-26',335000,NULL),('ad94a3e8-d69e-423f-a869-7e58a2f992d0','67e663bc-f6e5-4ec3-a97a-47d304067ce9','2019-11-26',1000000,NULL),('ae0c6ffc-e53e-4666-b220-b958c99baebb','916267ff-aa6b-4de9-95f6-668c129a1633','2019-11-26',1500000,NULL),('af90633f-a1d8-4260-881a-5001c56c449a','dd140823-c44c-4199-9952-a28a8c7c2598','2019-11-30',800000,NULL),('b4ede2a6-4b26-4b0d-a4a2-c63c45285264','d5b5c866-9440-4946-8901-3b51f26411fb','2019-11-26',275000,NULL),('b595994d-517a-4eee-a4fe-b64f39dd279c','916267ff-aa6b-4de9-95f6-668c129a1633','2019-11-26',1500000,NULL),('b5fd4791-aaa3-4002-aa1c-98697cf707ee','ba6b0d57-c685-4f87-902f-a5bed66193e7','2019-11-26',465000,NULL),('b620db70-2b97-4092-b9b5-c1ebcb2d501b','af82398d-22af-461d-b6b8-526d109832bd','2019-11-30',200000,NULL),('bb9b0cbb-f5ad-4aec-aac9-925dea52c41a','9b3285d5-35c4-4913-ae39-6309aee81452','2019-11-26',500000,NULL),('bceb58d8-5f2b-479e-900c-c8974024dcc0','9b3285d5-35c4-4913-ae39-6309aee81452','2019-11-26',500000,NULL),('bd3c0767-544e-4c6c-a0cf-1cfcc0493051','d7bfe09f-34e0-46b5-a048-12bb3648857d','2019-11-26',325000,NULL),('bdb15dca-34b5-4ca2-a138-d124c1a97660','1494683e-ea17-4e9a-b742-ef81c9b13bc1','2019-11-26',325000,NULL),('be01e32b-df98-4333-944f-8b6b778b78ec','67e663bc-f6e5-4ec3-a97a-47d304067ce9','2019-11-26',1000000,NULL),('c10050e1-b6db-4206-8a65-70a44a72058f','11bb0cf7-075a-4712-83d0-d7eb319ccfde','2019-11-26',1600000,NULL),('c3a0898a-7706-4382-9c30-c4f772f4b23a','67e663bc-f6e5-4ec3-a97a-47d304067ce9','2019-11-26',1000000,NULL),('c8b1c28b-3139-402d-8d13-97481913c632','ae6432de-aef9-4e32-9dc6-5078fe19cefa','2019-11-26',3000000,NULL),('ca535eeb-7606-48e3-a315-954db6d2cf6a','e6561a28-669e-4a82-ac93-314d0c5f4e21','2019-11-26',335000,NULL),('ccc0fb69-42ed-4393-b56e-ac9a8b7aae23','04cfe49d-4de2-47a5-aa44-fae64685aff8','2019-11-26',500000,NULL),('cfe982e0-3f5d-476e-af22-f7495c51624d','67e663bc-f6e5-4ec3-a97a-47d304067ce9','2019-11-26',1000000,NULL),('d5fa24c5-5e31-4123-b55c-eec6f76623fd','67e663bc-f6e5-4ec3-a97a-47d304067ce9','2019-11-26',1000000,NULL),('d69db0aa-3ef4-4240-8100-f7cc1de9f5aa','c69e819b-1479-43c6-af40-7cf089b3be58','2019-11-26',300000,NULL),('d78dbee2-d38d-450f-949b-05178086ea81','c69e819b-1479-43c6-af40-7cf089b3be58','2019-11-26',300000,NULL),('d860cf24-0069-48c1-9785-6100517b11c2','c45a402b-c1d1-453c-8395-80485b0a1b2f','2019-12-02',300000,NULL),('debf7402-1e83-47ef-b0e3-fa883701b4a1','7bac991c-dc3f-462d-869c-ff9aed86d8f7','2019-11-26',300000,NULL),('df2534e7-8bf8-4a78-9c6d-446d8e390a09','1494683e-ea17-4e9a-b742-ef81c9b13bc1','2019-11-26',325000,NULL),('e09bec6e-c924-41c9-b3ac-1e015da2f1fe','c69e819b-1479-43c6-af40-7cf089b3be58','2019-11-26',300000,NULL),('e2091c6f-b74b-438d-bd16-a7ffa66e4fda','d5b5c866-9440-4946-8901-3b51f26411fb','2019-11-26',300000,NULL),('e31cb384-3de6-4a61-a532-31bd0f7399c2','67e663bc-f6e5-4ec3-a97a-47d304067ce9','2019-11-26',1000000,NULL),('e6cdaef4-67e9-4b5d-83bf-bf33e7c08fee','af82398d-22af-461d-b6b8-526d109832bd','2019-12-02',300000,NULL),('ea0a6444-5c43-4da0-a4eb-7095c0fa9147','142ef343-637f-44ed-b93c-9f0d37afe078','2019-11-26',300000,NULL),('eba2d6a5-cea9-44f2-911f-8b86bff87fb3','e6bad299-09fe-48ed-b374-6f48bd9d1061','2019-11-26',600000,NULL),('ec0ef5e8-8128-4e96-a356-6ee64db72c89','dd140823-c44c-4199-9952-a28a8c7c2598','2019-11-26',800000,NULL),('f1491381-8053-4bbb-a254-151527d045cb','28e8f73c-a522-4293-ad75-a86431692ea5','2019-11-26',400000,NULL),('f25e9ee4-79c6-4ddf-8836-4ce4120ec5db','fd0cae9b-1443-4edc-a43b-8a7997204c5c','2019-11-26',300000,NULL),('f69a2ccc-c615-401f-89c1-dda236e73453','d7bfe09f-34e0-46b5-a048-12bb3648857d','2019-11-26',325000,NULL),('f8af62ee-bbc1-4111-b4aa-f35e8ff5d6ac','e6561a28-669e-4a82-ac93-314d0c5f4e21','2019-11-26',335000,NULL),('fda2fbbe-ce1f-4086-a49b-07af374e463a','9b3285d5-35c4-4913-ae39-6309aee81452','2019-11-26',700000,NULL);
/*!40000 ALTER TABLE `semart_angsuran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semart_grup`
--

DROP TABLE IF EXISTS `semart_grup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semart_grup` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode` varchar(27) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(77) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_282AD538B2A11877` (`kode`),
  KEY `semart_grup_search_idx` (`kode`,`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semart_grup`
--

LOCK TABLES `semart_grup` WRITE;
/*!40000 ALTER TABLE `semart_grup` DISABLE KEYS */;
INSERT INTO `semart_grup` VALUES ('51b00367-f252-4fa1-ad67-bd95738bf4a1',NULL,NULL,'SPRADM','SUPER ADMINISTRATOR',NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28');
/*!40000 ALTER TABLE `semart_grup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semart_hak_akses`
--

DROP TABLE IF EXISTS `semart_hak_akses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semart_hak_akses` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `grup_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `menu_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `addable` tinyint(1) NOT NULL,
  `editable` tinyint(1) NOT NULL,
  `viewable` tinyint(1) NOT NULL,
  `deletable` tinyint(1) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DACCE96569AD2DE` (`grup_id`),
  KEY `IDX_DACCE96CCD7E912` (`menu_id`),
  CONSTRAINT `FK_DACCE96569AD2DE` FOREIGN KEY (`grup_id`) REFERENCES `semart_grup` (`id`),
  CONSTRAINT `FK_DACCE96CCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `semart_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semart_hak_akses`
--

LOCK TABLES `semart_hak_akses` WRITE;
/*!40000 ALTER TABLE `semart_hak_akses` DISABLE KEYS */;
INSERT INTO `semart_hak_akses` VALUES ('311ab1ed-d087-48d5-98bd-f09ce68a2726','51b00367-f252-4fa1-ad67-bd95738bf4a1','2d904988-95e5-4485-a45d-b173862bf8e7',1,1,1,1,NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('5d418b6f-8d95-4175-832f-f4684611f86e','51b00367-f252-4fa1-ad67-bd95738bf4a1','c927e56f-a0e3-4ef6-9581-68fcc4f83b4e',1,1,1,1,NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('78f85fad-1efa-4f7f-aa99-d1ef7a16fdcc','51b00367-f252-4fa1-ad67-bd95738bf4a1','16f31dad-aae6-44c3-a57c-cd0db22d0238',1,1,1,1,NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('7ec8ea18-8c13-4776-8e2d-cfd435437f08','51b00367-f252-4fa1-ad67-bd95738bf4a1','55aec3c9-7fc2-4372-9215-bce5397e1b05',1,1,1,1,NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('9ea88de1-6196-4f35-ac26-79985ada9d98','51b00367-f252-4fa1-ad67-bd95738bf4a1','b8b99ee3-2ffc-47e3-941a-2383f4f37818',1,1,1,1,NULL,NULL,NULL,'2019-11-26 14:28:16','2019-11-26 14:28:16'),('a730886a-b938-464c-807d-5a00f0bff799','51b00367-f252-4fa1-ad67-bd95738bf4a1','2114c2dd-19b4-468e-92ef-2bfca61ea353',1,1,1,1,NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('b458bcfb-a627-4854-b2e7-d000d212879b','51b00367-f252-4fa1-ad67-bd95738bf4a1','407d684e-6edf-4fa9-babe-61ef63947add',1,1,1,1,NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('b69b8d0e-1242-44da-b340-7155cb41d7d2','51b00367-f252-4fa1-ad67-bd95738bf4a1','8e70c681-176e-4e56-b0ea-4df644be1f1c',1,1,1,1,NULL,NULL,NULL,'2019-11-26 14:28:12','2019-11-26 14:28:12'),('f9d79201-b62d-4740-8db4-701dfa9ead64','51b00367-f252-4fa1-ad67-bd95738bf4a1','24962c91-50dc-4ef5-a3ff-271f613f8a9f',1,1,1,1,NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('faac7e09-c866-41a3-959a-7cd2600ed5e4','51b00367-f252-4fa1-ad67-bd95738bf4a1','4dfa8302-b15c-42bc-ac2f-80949ea36edc',1,1,1,1,NULL,NULL,NULL,'2019-11-26 14:28:08','2019-11-26 14:28:08');
/*!40000 ALTER TABLE `semart_hak_akses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semart_menu`
--

DROP TABLE IF EXISTS `semart_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semart_menu` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `induk_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `menu_order` int(11) DEFAULT NULL,
  `icon_class` varchar(27) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_rute` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `showable` tinyint(1) NOT NULL,
  `kode` varchar(27) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(77) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_87A2BFBCB2A11877` (`kode`),
  KEY `IDX_87A2BFBCA67F1D92` (`induk_id`),
  KEY `semart_menu_search_idx` (`kode`,`nama`),
  CONSTRAINT `FK_87A2BFBCA67F1D92` FOREIGN KEY (`induk_id`) REFERENCES `semart_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semart_menu`
--

LOCK TABLES `semart_menu` WRITE;
/*!40000 ALTER TABLE `semart_menu` DISABLE KEYS */;
INSERT INTO `semart_menu` VALUES ('16f31dad-aae6-44c3-a57c-cd0db22d0238','407d684e-6edf-4fa9-babe-61ef63947add',4,'bars','menus_index',1,'MENU','MENU',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('2114c2dd-19b4-468e-92ef-2bfca61ea353','407d684e-6edf-4fa9-babe-61ef63947add',2,'address-book','groups_index',1,'GROUP','GRUP',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('24962c91-50dc-4ef5-a3ff-271f613f8a9f','407d684e-6edf-4fa9-babe-61ef63947add',3,'users','users_index',1,'USER','PENGGUNA',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('2d904988-95e5-4485-a45d-b173862bf8e7','407d684e-6edf-4fa9-babe-61ef63947add',6,'database','queries_runner',1,'QUERY','QUERY',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('407d684e-6edf-4fa9-babe-61ef63947add',NULL,2,'shield','',1,'ADMIN','ADMINISTRATOR',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('4dfa8302-b15c-42bc-ac2f-80949ea36edc',NULL,1,NULL,'customers_index',1,'CUSTOMER','CUSTOMER',NULL,NULL,NULL,'2019-11-26 14:28:08','2019-11-26 14:28:08'),('55aec3c9-7fc2-4372-9215-bce5397e1b05','407d684e-6edf-4fa9-babe-61ef63947add',5,'cogs','settings_index',1,'SETTING','PENGATURAN',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('8e70c681-176e-4e56-b0ea-4df644be1f1c',NULL,1,NULL,'orders_index',1,'ORDER','ORDER',NULL,NULL,NULL,'2019-11-26 14:28:11','2019-11-26 14:28:11'),('b8b99ee3-2ffc-47e3-941a-2383f4f37818',NULL,1,NULL,'installments_index',0,'INSTALLMENT','ANGSURAN',NULL,'admin',NULL,'2019-11-26 14:28:16','2019-11-26 17:30:14'),('c927e56f-a0e3-4ef6-9581-68fcc4f83b4e',NULL,1,'home','home_dashboard',1,'HOME','HOME',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28');
/*!40000 ALTER TABLE `semart_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semart_order`
--

DROP TABLE IF EXISTS `semart_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semart_order` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `pelanggan_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `nama_produk` varchar(77) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` decimal(17,0) NOT NULL,
  `lama_cicilan` smallint(6) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `lunas` tinyint(1) NOT NULL,
  `keuntungan` decimal(17,0) NOT NULL,
  `cashback` decimal(17,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5E02094486F53117` (`pelanggan_id`),
  CONSTRAINT `FK_5E02094486F53117` FOREIGN KEY (`pelanggan_id`) REFERENCES `semart_pelanggan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semart_order`
--

LOCK TABLES `semart_order` WRITE;
/*!40000 ALTER TABLE `semart_order` DISABLE KEYS */;
INSERT INTO `semart_order` VALUES ('04cfe49d-4de2-47a5-aa44-fae64685aff8','909a3e51-741b-4b3e-b62d-761c9f692eb2','LED Monitor',1700000,6,NULL,0,0,0),('11bb0cf7-075a-4712-83d0-d7eb319ccfde','10ae52d4-b2af-4c36-a4e2-33825efeda3a','Laptop Second',4600000,3,NULL,1,0,0),('142ef343-637f-44ed-b93c-9f0d37afe078','8dcf85e6-3a34-4505-8aee-2e50c7e2eb40','Samsung A10',1800000,6,NULL,1,0,0),('1494683e-ea17-4e9a-b742-ef81c9b13bc1','caf43e80-0f4e-45e5-8af7-857e219da16b','Xiaomi S2',1950000,6,NULL,1,0,0),('28e8f73c-a522-4293-ad75-a86431692ea5','8dcf85e6-3a34-4505-8aee-2e50c7e2eb40','Samsung A20',2400000,6,NULL,0,0,0),('29534c35-7ed1-4fd1-97a6-1445f7a5895f','b9870ed8-baa8-455c-b4c8-32916e61c648','Hutang',5000000,1,NULL,0,0,0),('3ca7733a-a040-415c-8333-9923ad3a8628','ceb176ff-a652-44c6-96df-2bc5d5aa832e','Gadai BPKB',3000000,6,NULL,0,0,0),('51f759a4-9de9-4284-94c7-62a9f1169b96','cfbc840d-1bc9-4f98-a813-a3cb097ef3c4','Xiaomi Redmi Note 8 4/64',2400000,6,NULL,0,400000,143000),('67e663bc-f6e5-4ec3-a97a-47d304067ce9','068d1836-96e8-41e8-80ed-0106539a31d6','Samsung Note 9 Plus',13000000,12,NULL,0,0,0),('79c486fc-8d1b-4cee-87dc-8884ff1fadff','265ea996-9dda-4e7b-8d8f-8a9444792d06','Hutang',15000000,3,NULL,0,0,0),('7bac991c-dc3f-462d-869c-ff9aed86d8f7','8b1e6b0c-7382-48a0-a128-745f85b7301b','Samsung A30 Kayaknya',2600000,6,NULL,0,0,0),('916267ff-aa6b-4de9-95f6-668c129a1633','49e92956-cc55-4aae-994a-4485958f0333','Apple Macbook i7 17\"',17000000,12,NULL,0,0,0),('9b3285d5-35c4-4913-ae39-6309aee81452','a30f714d-1b77-4b7b-bd23-d811e4ba3db6','Samsung J6 Plus',3700000,6,NULL,1,0,0),('a4dbf04f-8f70-49fa-9e8a-f898897d8714','fda051de-f376-4a2c-8199-a9318b9a1404','Xiaomi Lupa',1800000,6,NULL,0,0,0),('a5d4866c-cfb9-45b7-b1db-d987224ec17b','da03ae63-1a00-4ea7-98a0-215056c7ab63','Kalung Emas',3000000,6,NULL,0,0,0),('a9c67dcd-e636-4020-909f-593151168d92','d98df3e5-c461-41a2-a0b6-95b38f987901','Hutang',8000000,12,NULL,0,0,0),('aa5e9e5b-453b-45ee-bf21-9a812863e951','461325aa-597a-4b47-94b7-77bccf9f3916','Nokia Lupa Seri',3500000,6,NULL,1,0,0),('ae6432de-aef9-4e32-9dc6-5078fe19cefa','efe9b31c-9957-4116-a233-86e933a52581','Logam Mulia 25 Gram',18255000,6,NULL,0,3945000,0),('af82398d-22af-461d-b6b8-526d109832bd','0a1698ba-be46-4929-a707-eaa7321a6269','Xiaomi Redmi Note 8 4/64',2400000,6,NULL,0,400000,143000),('ba6b0d57-c685-4f87-902f-a5bed66193e7','2720f79c-979f-4c38-aa09-289862ac9e0a','Vivo Y Lupa',3300000,6,NULL,0,0,0),('c45a402b-c1d1-453c-8395-80485b0a1b2f','9422c990-a8c2-462a-a56a-a3dbd4dee8a1','Xiaomi Redmi Note 8 4/64',2400000,6,NULL,0,400000,143000),('c69e819b-1479-43c6-af40-7cf089b3be58','da03ae63-1a00-4ea7-98a0-215056c7ab63','Xiaomi S2',2100000,6,NULL,1,0,0),('ce67a794-3f79-4af8-9048-1f786b9478cc','265ea996-9dda-4e7b-8d8f-8a9444792d06','Komputer Rakitan',4250000,6,NULL,0,0,0),('d5b5c866-9440-4946-8901-3b51f26411fb','b9870ed8-baa8-455c-b4c8-32916e61c648','Realme 3 Pro',3450000,6,NULL,0,0,0),('d7bfe09f-34e0-46b5-a048-12bb3648857d','96a50d54-8e54-463f-94c8-69934f179191','Samsung A10',1950000,6,NULL,0,0,0),('dd140823-c44c-4199-9952-a28a8c7c2598','ced701e2-c91b-41ae-8b6e-72c1f4cb73b4','Logam Mulia 10 Gram',8800000,6,NULL,0,0,0),('e6561a28-669e-4a82-ac93-314d0c5f4e21','a908c3ee-5595-4c37-974d-214d7f73fbf9','Xiaomi S2',2300000,6,NULL,1,0,0),('e6bad299-09fe-48ed-b374-6f48bd9d1061','10ae52d4-b2af-4c36-a4e2-33825efeda3a','Samsung LCD Monitor',1800000,3,NULL,1,0,0),('efc2e84e-24ae-4ec8-8342-3558c1e30ca9','402886e4-3b5c-4f6c-a611-319f0bbbbffa','Samsung A30',2600000,6,NULL,0,0,0),('fd0cae9b-1443-4edc-a43b-8a7997204c5c','18ac8fee-4c2a-4390-b3a9-bb7f2fb0a1c8','Xiaomi Note Lupa',3600000,12,NULL,0,0,0),('feee4271-d966-445c-93e1-d2478967aa7c','a908c3ee-5595-4c37-974d-214d7f73fbf9','Xiaomi S2',2010000,6,NULL,0,0,0);
/*!40000 ALTER TABLE `semart_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semart_pelanggan`
--

DROP TABLE IF EXISTS `semart_pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semart_pelanggan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `no_whatsapp` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(77) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `semart_pelanggan_idx` (`no_whatsapp`,`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semart_pelanggan`
--

LOCK TABLES `semart_pelanggan` WRITE;
/*!40000 ALTER TABLE `semart_pelanggan` DISABLE KEYS */;
INSERT INTO `semart_pelanggan` VALUES ('068d1836-96e8-41e8-80ed-0106539a31d6','08107','admin','admin','JULIAN',NULL,'2019-11-26 15:26:38','2019-11-26 15:26:38'),('0a1698ba-be46-4929-a707-eaa7321a6269','082322872041','admin','admin','PAK KEN - ABDUL JABAR',NULL,'2019-11-27 14:42:35','2019-11-27 14:42:35'),('10ae52d4-b2af-4c36-a4e2-33825efeda3a','08104','admin','admin','RIFQI',NULL,'2019-11-26 15:25:34','2019-11-26 15:25:34'),('18ac8fee-4c2a-4390-b3a9-bb7f2fb0a1c8','08110','admin','admin','ABDUL JABAR',NULL,'2019-11-26 15:27:31','2019-11-26 15:27:31'),('265ea996-9dda-4e7b-8d8f-8a9444792d06','08117','admin','admin','ABED',NULL,'2019-11-26 15:29:59','2019-11-26 15:29:59'),('2720f79c-979f-4c38-aa09-289862ac9e0a','08114','admin','admin','GUNTUR',NULL,'2019-11-26 15:28:33','2019-11-26 15:28:33'),('402886e4-3b5c-4f6c-a611-319f0bbbbffa','08119','admin','admin','MAS AYES',NULL,'2019-11-26 15:31:29','2019-11-26 15:31:29'),('461325aa-597a-4b47-94b7-77bccf9f3916','08101','admin','admin','USTADZ ROHIM',NULL,'2019-11-26 15:24:47','2019-11-26 15:24:47'),('49e92956-cc55-4aae-994a-4485958f0333','08115','admin','admin','AGUNG SETIAWAN',NULL,'2019-11-26 15:29:17','2019-11-26 15:29:17'),('8b1e6b0c-7382-48a0-a128-745f85b7301b','08111','admin','admin','MAS MIFTAH',NULL,'2019-11-26 15:27:52','2019-11-26 15:27:52'),('8dcf85e6-3a34-4505-8aee-2e50c7e2eb40','08103','admin','admin','KANG NAS',NULL,'2019-11-26 15:25:22','2019-11-26 15:25:22'),('909a3e51-741b-4b3e-b62d-761c9f692eb2','08120','admin','admin','FARIZ YOGA',NULL,'2019-11-26 15:31:47','2019-11-26 15:31:47'),('9422c990-a8c2-462a-a56a-a3dbd4dee8a1','085225142800','admin','admin','MAS UCOK - ABDUL JABAR',NULL,'2019-11-27 14:44:34','2019-11-27 14:44:34'),('96a50d54-8e54-463f-94c8-69934f179191','08108','admin','admin','MBAK RINA',NULL,'2019-11-26 15:26:52','2019-11-26 15:26:52'),('a30f714d-1b77-4b7b-bd23-d811e4ba3db6','08102','admin','admin','NASEH',NULL,'2019-11-26 15:25:05','2019-11-26 15:25:05'),('a908c3ee-5595-4c37-974d-214d7f73fbf9','08106','admin','admin','IIK',NULL,'2019-11-26 15:26:08','2019-11-26 15:26:08'),('b9870ed8-baa8-455c-b4c8-32916e61c648','08112','admin','admin','BEJO',NULL,'2019-11-26 15:28:15','2019-11-26 15:28:15'),('caf43e80-0f4e-45e5-8af7-857e219da16b','08105','admin','admin','IIS',NULL,'2019-11-26 15:25:51','2019-11-26 15:25:51'),('ceb176ff-a652-44c6-96df-2bc5d5aa832e','08118','admin','admin','RONDO KEMPLING - BPKB',NULL,'2019-11-26 15:30:21','2019-11-26 15:30:21'),('ced701e2-c91b-41ae-8b6e-72c1f4cb73b4','08113','admin','admin','MAGHFUR',NULL,'2019-11-26 15:29:00','2019-11-26 15:29:00'),('cfbc840d-1bc9-4f98-a813-a3cb097ef3c4','087710201690','admin','admin','MAS ISAK - ABDUL JABAR',NULL,'2019-11-27 14:41:35','2019-11-27 14:42:50'),('d98df3e5-c461-41a2-a0b6-95b38f987901','08122','admin','admin','TEGUH',NULL,'2019-11-26 15:37:19','2019-11-26 15:37:19'),('da03ae63-1a00-4ea7-98a0-215056c7ab63','08109','admin','admin','MBAK NITA',NULL,'2019-11-26 15:27:15','2019-11-26 15:27:15'),('efe9b31c-9957-4116-a233-86e933a52581','08121','admin','admin','TEMAN MAGHFUR - TANGGUNG JAWAB MAGHFUR',NULL,'2019-11-26 15:32:13','2019-11-26 15:32:13'),('fda051de-f376-4a2c-8199-a9318b9a1404','08116','admin','admin','MAS UCRIT',NULL,'2019-11-26 15:29:37','2019-11-26 15:29:37');
/*!40000 ALTER TABLE `semart_pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semart_pengguna`
--

DROP TABLE IF EXISTS `semart_pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semart_pengguna` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `grup_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `nama_lengkap` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_pengguna` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_profil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kata_sandi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9F91CD05192ACF9E` (`nama_pengguna`),
  KEY `IDX_9F91CD05569AD2DE` (`grup_id`),
  KEY `semart_pengguna_search_idx` (`nama_pengguna`),
  CONSTRAINT `FK_9F91CD05569AD2DE` FOREIGN KEY (`grup_id`) REFERENCES `semart_grup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semart_pengguna`
--

LOCK TABLES `semart_pengguna` WRITE;
/*!40000 ALTER TABLE `semart_pengguna` DISABLE KEYS */;
INSERT INTO `semart_pengguna` VALUES ('9b4ed552-b8fd-41a4-bb1c-01d6f8fd7f17','51b00367-f252-4fa1-ad67-bd95738bf4a1','SUPER ADMINISTRATOR','admin',NULL,'$argon2id$v=19$m=65536,t=4,p=1$AU+MujhMyIsBxqJxVnmHug$IsGyOCXfFL23pWMS+XyEHOyDWRcve4U5kLdp4ZxNcIg',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28');
/*!40000 ALTER TABLE `semart_pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semart_setting`
--

DROP TABLE IF EXISTS `semart_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semart_setting` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `parameter` varchar(27) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `semart_setting_search_idx` (`parameter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semart_setting`
--

LOCK TABLES `semart_setting` WRITE;
/*!40000 ALTER TABLE `semart_setting` DISABLE KEYS */;
INSERT INTO `semart_setting` VALUES ('3058cb14-8546-461c-a728-f53b9eb52732','THOUSAND_SEPARATOR',',',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('6efea737-0676-4170-b9f6-783526792dc8','PER_PAGE','9',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('840d897b-2469-410c-874a-3a003c74a701','CURRENCY_SURFIX','',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('9db50aa1-6a39-4b34-af17-a987bc9a7851','CURRENCY_PREFIX','Rp.',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('eab10133-2e65-42d0-bf82-7b80751018ee','UPLOAD_DIR','uploads',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('ec4c7490-027c-429d-ae69-b9bf989f4b24','DECIMAL_POINT','.',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28'),('f493ce84-90a4-465c-aa40-1d8981f55e57','DECIMAL_PRECISION','0',NULL,NULL,NULL,'2019-11-26 14:27:28','2019-11-26 14:27:28');
/*!40000 ALTER TABLE `semart_setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-05 15:43:06
