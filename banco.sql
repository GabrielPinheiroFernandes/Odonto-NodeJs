-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.3.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for consultorio
DROP DATABASE IF EXISTS `consultorio`;
CREATE DATABASE IF NOT EXISTS `consultorio` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `consultorio`;

-- Dumping structure for table consultorio.consulta
DROP TABLE IF EXISTS `consulta`;
CREATE TABLE IF NOT EXISTS `consulta` (
  `COD` int(11) NOT NULL AUTO_INCREMENT,
  `DATA_CONSULTA` datetime NOT NULL,
  `STATUS` char(2) NOT NULL DEFAULT 'PD' COMMENT 'AT = atendido | PD = pendente',
  `OBSERVACAO_MEDICA` varchar(500) DEFAULT NULL,
  `Paciente_CODIGO` int(11) NOT NULL,
  `doutor_CODIGO` int(11) NOT NULL,
  PRIMARY KEY (`COD`,`Paciente_CODIGO`,`doutor_CODIGO`) USING BTREE,
  KEY `fk_consulta_doutor1_idx` (`doutor_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table consultorio.doutor
DROP TABLE IF EXISTS `doutor`;
CREATE TABLE IF NOT EXISTS `doutor` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(45) DEFAULT NULL,
  `CRO` int(9) DEFAULT NULL,
  `HORA_ENTRADA` time DEFAULT NULL,
  `HORA_SAIDA` time DEFAULT NULL,
  `OBSERVACAO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table consultorio.paciente
DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(45) NOT NULL,
  `DATA_NASCIMENTO` date NOT NULL,
  `SEXO` char(1) NOT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `PLANO_SAUDE` char(1) NOT NULL,
  `OBSERVACAO` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
