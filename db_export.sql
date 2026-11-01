
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
DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `method` varchar(10) NOT NULL,
  `route` varchar(2048) NOT NULL,
  `total_results` int NOT NULL,
  `client_ip` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES ('GET','/api/fruits',49,'127.0.0.1','2026-11-01 19:31:32'),('GET','/api/search/app',3,'127.0.0.1','2026-11-01 19:32:51'),('GET','/api/search/APP',3,'127.0.0.1','2026-11-01 19:32:54'),('GET','/api/search/Apple',3,'127.0.0.1','2026-11-01 19:32:56'),('GET','/api/search/zzzz',0,'127.0.0.1','2026-11-01 19:32:59'),('GET','/api/calories/25',4,'127.0.0.1','2026-11-01 19:34:48'),('GET','/api/calories/24',2,'127.0.0.1','2026-11-01 19:34:51'),('GET','/api/calories/0',0,'127.0.0.1','2026-11-01 19:34:53'),('GET','/api/calories/abc',0,'127.0.0.1','2026-11-01 19:34:56'),('GET','/api/calories/-1',0,'127.0.0.1','2026-11-01 19:34:58'),('GET','/api/calories/1000',49,'127.0.0.1','2026-11-01 19:35:00'),('GET','/api/nothing',0,'127.0.0.1','2026-11-01 19:35:03'),('GET','/api/fruits',0,'127.0.0.1','2026-11-01 19:36:28'),('GET','/api/fruits',49,'127.0.0.1','2026-11-01 19:36:34'),('GET','/api/search/app',3,'127.0.0.1','2026-11-01 19:36:35'),('GET','/api/search/zzzz',0,'127.0.0.1','2026-11-01 19:36:35'),('GET','/api/calories/25',4,'127.0.0.1','2026-11-01 19:36:36'),('GET','/api/calories/0',0,'127.0.0.1','2026-11-01 19:36:36'),('GET','/api/calories/abc',0,'127.0.0.1','2026-11-01 19:36:37');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

