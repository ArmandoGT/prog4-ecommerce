-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce2026
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'clientes');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,32);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Categoria',7,'add_categoria'),(26,'Can change Categoria',7,'change_categoria'),(27,'Can delete Categoria',7,'delete_categoria'),(28,'Can view Categoria',7,'view_categoria'),(29,'Can add produto',8,'add_produto'),(30,'Can change produto',8,'change_produto'),(31,'Can delete produto',8,'delete_produto'),(32,'Can view produto',8,'view_produto'),(33,'Can add pedido',9,'add_pedido'),(34,'Can change pedido',9,'change_pedido'),(35,'Can delete pedido',9,'delete_pedido'),(36,'Can view pedido',9,'view_pedido'),(37,'Can add Item Pedido',10,'add_itempedido'),(38,'Can change Item Pedido',10,'change_itempedido'),(39,'Can delete Item Pedido',10,'delete_itempedido'),(40,'Can view Item Pedido',10,'view_itempedido');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$6e6ZcZ8ZnHYG33HJbZLpae$oRUOwBQnkCBdvkGjhjgBd7npuputws88Ysv/3BAKiLA=','2026-03-27 01:16:45.148372',1,'admin','','','admin@admin.edu.br',1,1,'2026-02-20 02:10:59.555594'),(2,'pbkdf2_sha256$1000000$BqpvN02rO6RRedvL7FF4aI$loGJrk4Wpu66Rlt54uCYEUoInKSI0d18Yko/cfHH1hU=','2026-04-02 23:22:56.473662',0,'fulano','Fulano','Detal','fulano@detal.com.br',0,1,'2026-03-20 02:05:05.687189');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_categoria`
--

DROP TABLE IF EXISTS `catalogo_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogo_categoria_slug_903242f5` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_categoria`
--

LOCK TABLES `catalogo_categoria` WRITE;
/*!40000 ALTER TABLE `catalogo_categoria` DISABLE KEYS */;
INSERT INTO `catalogo_categoria` VALUES (1,'mouse óptico','mouse-optico'),(2,'teclado mecânico','teclado-mecanico'),(3,'memória DDR5','memoria-ddr5');
/*!40000 ALTER TABLE `catalogo_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_produto`
--

DROP TABLE IF EXISTS `catalogo_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_produto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `descricao` longtext NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `disponivel` tinyint(1) NOT NULL,
  `criado` datetime(6) NOT NULL,
  `atualizado` datetime(6) NOT NULL,
  `categoria_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogo_produto_categoria_id_773a9958_fk_catalogo_categoria_id` (`categoria_id`),
  KEY `catalogo_produto_slug_d4e0404e` (`slug`),
  CONSTRAINT `catalogo_produto_categoria_id_773a9958_fk_catalogo_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `catalogo_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_produto`
--

LOCK TABLES `catalogo_produto` WRITE;
/*!40000 ALTER TABLE `catalogo_produto` DISABLE KEYS */;
INSERT INTO `catalogo_produto` VALUES (1,'mouse adiouaod','mouse-adiouaod','pduifpao poi odaspi poijfadoipa sdopndsfioubn iuasd nun sdanvin aioun vuiasdnvuoinasdvouinasdvoinasvdoiun asv nasiuodv nas dv asdvui aoisvu',86.84,'get_upload_path/mouse1.jpg',1,'2026-02-27 00:02:12.554870','2026-02-27 00:02:12.554908',1),(2,'teclado mecânico duious','teclado-mecanico-duious','eopiw aqpoien bnckopmovbz aiupodohaughpzxc mbcmadpoi bmnopadsno av dsabuiva s dashuavs ahsiounv oiansd oivu',140.87,'get_upload_path/teclado1.jpg',1,'2026-02-27 00:02:55.712556','2026-02-27 00:02:55.712586',2),(3,'mouse óptico doadiopoap','mouse-optico-doadiopoap','difgiodigoidsa  igiasdiuogiueiuopp ga awg jhgp agwe awegngan oaien  nagewon vsdd nsvd mzxvmvopidav apoivm vsad zsdvuasvn asoivunasdo',70.31,'get_upload_path/mouse3.jpg',1,'2026-02-27 00:03:32.762380','2026-02-27 00:03:32.762408',1),(4,'memória DDR5 39802 doapa','memoria-ddr5-39802-doapa','poifaisod asdfpoiof pasmodsam m fasd opimdasf opim faosdn foasdn n asd fsda nnasdfpof nasdn faso dnfas',357.54,'get_upload_path/memoria3.jpg',1,'2026-02-27 00:04:05.553299','2026-02-27 00:04:05.553323',3),(5,'memória DDR5 981544 eiosidm ak','memoria-ddr5-981544-eiosidm-ak','pioadif asdfn pidsa fopi mweunvsdkn v anvoasdmp voipm vma sdvbas dvpnzxcvpas duvdado vasdnasd v',299.99,'get_upload_path/memoria2.jpg',1,'2026-02-27 00:04:52.339609','2026-02-27 00:04:52.339632',3),(6,'teclado mecânico djoi ads','teclado-mecanico-djoi-ads','dunaoi oui auio daouin fiuo naf ndaun zxcvon zxv avd uvahadv aine vuioaewnv oavn asnd vjk nasvdn sad ovnasdoiv asdon ve873  jn vasn',190.65,'produtos/teclado-mecanico-djoi-ads.jpg',1,'2026-02-27 00:05:49.377264','2026-02-27 02:03:17.150128',2),(7,'memória DDR5 dioisiiwu ei','memoria-ddr5-dioisiiwu-ei','dfaioasdiopf asdof asd fiopamsd fopim asdoipf nasiodbfuiasd foin asdnc dn uasn eiou davo asduivn basdivb asd vboasdbvabs divsadiov biasudn viasdbn uvn asdiouvn asdon vinasd vi basdyv basdo vonasd von asduoinv ausdio nvuias nvuin asdoivn asnd vo asuiv nasdoiu vasn voiuas nviou asuvi asdoiv asdiuov asdun vasd uvoua sdv',524.87,'',1,'2026-02-27 01:29:35.133367','2026-02-27 01:29:35.133387',3),(8,'teclado mecânico diosi diso','teclado-mecanico-diosi-diso','dasfdafdasfd asd ads fdasf as adsf asd fasdf asd fasdf asdf asdf asdf asdfasfd asf asfd',154.23,'catalogo.models.Produto.get_upload_path/teclado2.jpg',1,'2026-02-27 01:57:23.685205','2026-02-27 01:57:23.685230',2);
/*!40000 ALTER TABLE `catalogo_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-02-26 23:55:19.900644','1','mouse óptico',1,'[{\"added\": {}}]',7,1),(2,'2026-02-26 23:55:36.909556','2','teclado mecânico',1,'[{\"added\": {}}]',7,1),(3,'2026-02-26 23:55:46.587605','3','memória DDR5',1,'[{\"added\": {}}]',7,1),(4,'2026-02-27 00:02:12.556608','1','mouse adiouaod',1,'[{\"added\": {}}]',8,1),(5,'2026-02-27 00:02:55.713685','2','teclado mecânico duious',1,'[{\"added\": {}}]',8,1),(6,'2026-02-27 00:03:32.763651','3','mouse óptico doadiopoap',1,'[{\"added\": {}}]',8,1),(7,'2026-02-27 00:04:05.554330','4','memória DDR5 39802 doapa',1,'[{\"added\": {}}]',8,1),(8,'2026-02-27 00:04:52.340554','5','memória DDR5 981544 eiosidm ak',1,'[{\"added\": {}}]',8,1),(9,'2026-02-27 00:05:49.378308','6','teclado mecânico djoi ads',1,'[{\"added\": {}}]',8,1),(10,'2026-02-27 01:29:35.134489','7','memória DDR5 dioisiiwu ei',1,'[{\"added\": {}}]',8,1),(11,'2026-02-27 01:57:23.686497','8','teclado mecânico diosi diso',1,'[{\"added\": {}}]',8,1),(12,'2026-02-27 02:02:55.063538','6','teclado mecânico djoi ads',2,'[{\"changed\": {\"fields\": [\"Imagem\"]}}]',8,1),(13,'2026-02-27 02:03:17.151378','6','teclado mecânico djoi ads',2,'[{\"changed\": {\"fields\": [\"Imagem\"]}}]',8,1),(14,'2026-03-20 02:03:52.499686','1','clientes',1,'[{\"added\": {}}]',3,1),(15,'2026-03-27 01:24:44.469379','1','Pedido 1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Item Pedido\", \"object\": \"Item 1 do Pedido 1\"}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'catalogo','categoria'),(8,'catalogo','produto'),(5,'contenttypes','contenttype'),(10,'pedido','itempedido'),(9,'pedido','pedido'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-02-20 01:46:42.172195'),(2,'auth','0001_initial','2026-02-20 01:46:42.860828'),(3,'admin','0001_initial','2026-02-20 01:46:43.025631'),(4,'admin','0002_logentry_remove_auto_add','2026-02-20 01:46:43.032612'),(5,'admin','0003_logentry_add_action_flag_choices','2026-02-20 01:46:43.038795'),(6,'contenttypes','0002_remove_content_type_name','2026-02-20 01:46:43.160461'),(7,'auth','0002_alter_permission_name_max_length','2026-02-20 01:46:43.237416'),(8,'auth','0003_alter_user_email_max_length','2026-02-20 01:46:43.262459'),(9,'auth','0004_alter_user_username_opts','2026-02-20 01:46:43.269878'),(10,'auth','0005_alter_user_last_login_null','2026-02-20 01:46:43.334598'),(11,'auth','0006_require_contenttypes_0002','2026-02-20 01:46:43.339118'),(12,'auth','0007_alter_validators_add_error_messages','2026-02-20 01:46:43.345895'),(13,'auth','0008_alter_user_username_max_length','2026-02-20 01:46:43.425061'),(14,'auth','0009_alter_user_last_name_max_length','2026-02-20 01:46:43.513705'),(15,'auth','0010_alter_group_name_max_length','2026-02-20 01:46:43.533197'),(16,'auth','0011_update_proxy_permissions','2026-02-20 01:46:43.540650'),(17,'auth','0012_alter_user_first_name_max_length','2026-02-20 01:46:43.612562'),(18,'catalogo','0001_initial','2026-02-20 01:46:43.752431'),(19,'sessions','0001_initial','2026-02-20 01:46:43.793680'),(20,'pedido','0001_initial','2026-03-27 00:36:57.211001');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a5qk1namjpudsar2pycf6f427gvn6q5q','.eJxVjDkOgzAQAP-yNbJYX9gu0-cNaPHawUmEI44K8fcIiSJpZ0azQ0_bOvbbkua-MASQ0PyygeIrTafgJ02PKmKd1rkM4kzEZRdxr5zet6v9G4y0jBCAHFrvcTAavTJJRWSprdcaFaKzMucUWbXaknYmUuoMYWddyq41UmcPDRT-JC5cIagGIs0rhP04vu92Piw:1wAycU:wdQoz-j71MKx4AppUmZZhRwikvSF16eIxl3LZ6B9zn0','2026-04-23 23:17:06.658583'),('h2v29sck1pwz6wgw28rf1i95zqtx4t5a','.eJxVjEEOwiAQAP-yZ0OgYFt69N43kF12kaqBpLQn499Nkx70OjOZNwTctxz2JmtYGCYwcPllhPEp5RD8wHKvKtayrQupI1GnbWquLK_b2f4NMrYME_hE4lG0Jm-oR83JOC9uTEl6dyVvY2RntB2p15Zp8F1CsRhHnRiHzsHnCwetOL4:1vvlAw:Z0nz3Npc-1nhSpBC-shoQ6IHvCJOz67RUz8FJtn3408','2026-03-12 23:53:46.891055');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_itempedido`
--

DROP TABLE IF EXISTS `pedido_itempedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_itempedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `preco_unit` decimal(10,2) NOT NULL,
  `quantidade` int unsigned NOT NULL,
  `produto_id` bigint NOT NULL,
  `pedido_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_itempedido_produto_id_a5d1c607_fk_catalogo_produto_id` (`produto_id`),
  KEY `pedido_itempedido_pedido_id_15c6b42d_fk_pedido_pedido_id` (`pedido_id`),
  CONSTRAINT `pedido_itempedido_pedido_id_15c6b42d_fk_pedido_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_pedido` (`id`),
  CONSTRAINT `pedido_itempedido_produto_id_a5d1c607_fk_catalogo_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `catalogo_produto` (`id`),
  CONSTRAINT `pedido_itempedido_chk_1` CHECK ((`quantidade` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_itempedido`
--

LOCK TABLES `pedido_itempedido` WRITE;
/*!40000 ALTER TABLE `pedido_itempedido` DISABLE KEYS */;
INSERT INTO `pedido_itempedido` VALUES (1,53.52,4,3,1),(2,70.31,1,3,2),(3,299.99,1,5,3),(4,524.87,2,7,3);
/*!40000 ALTER TABLE `pedido_itempedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_pedido`
--

DROP TABLE IF EXISTS `pedido_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado` datetime(6) NOT NULL,
  `atualizado` datetime(6) NOT NULL,
  `pago` tinyint(1) NOT NULL,
  `cliente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_pedido_cliente_id_4f20d09c_fk_auth_user_id` (`cliente_id`),
  CONSTRAINT `pedido_pedido_cliente_id_4f20d09c_fk_auth_user_id` FOREIGN KEY (`cliente_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_pedido`
--

LOCK TABLES `pedido_pedido` WRITE;
/*!40000 ALTER TABLE `pedido_pedido` DISABLE KEYS */;
INSERT INTO `pedido_pedido` VALUES (1,'2026-03-27 01:24:44.467644','2026-03-27 01:24:44.467662',1,2),(2,'2026-04-03 00:04:45.428117','2026-04-03 00:04:45.428154',0,2),(3,'2026-04-03 00:06:27.807132','2026-04-03 00:06:27.807148',0,2);
/*!40000 ALTER TABLE `pedido_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-09 19:33:55
