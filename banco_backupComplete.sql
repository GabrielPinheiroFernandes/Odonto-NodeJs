-- MySQL Script generated by MySQL Workbench
-- Fri Jun 14 19:14:46 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE= 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CONSULTORIO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS CONSULTORIO DEFAULT CHARACTER SET utf8 ;
USE CONSULTORIO ;

-- -----------------------------------------------------
-- Table CONSULTORIO.PACIENTE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.PACIENTE (
   CODIGO  INT NOT NULL AUTO_INCREMENT,
   NOME  VARCHAR(45) NOT NULL,
   DATA_NASCIMENTO  DATE NOT NULL,
   SEXO  CHAR(1) NOT NULL,
   EMAIL  VARCHAR(45) NULL,
   PLANO_SAUDE  CHAR(1) NOT NULL,
   OBSERVACAO  VARCHAR(200) NULL,
   PRIMARY KEY ( CODIGO )
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table CONSULTORIO.DOUTOR
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.DOUTOR (
   `CODIGO` INT(11) NOT NULL AUTO_INCREMENT,
   `NOME` VARCHAR(45) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `CRO` INT(9) NULL DEFAULT NULL,
   `HORA_ENTRADA` TIME NULL DEFAULT NULL,
   `HORA_SAIDA` TIME NULL DEFAULT NULL,
   `OBSERVACAO` VARCHAR(45) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   PRIMARY KEY (`CODIGO`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table CONSULTORIO.ESPECIALIDADE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.ESPECIALIDADE (
   ID  INT NOT NULL,
   NOME_ESPECIALIDADE  VARCHAR(45) NULL,
   OBSERVACAO  VARCHAR(45) NULL,
   PRIMARY KEY ( ID )
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table CONSULTORIO.CONTA_RECEBER
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.CONTA_RECEBER (
   COD  INT NOT NULL AUTO_INCREMENT,
   VALOR  DECIMAL(11) NULL,
   PRIMARY KEY ( COD )
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table CONSULTORIO.CARGO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.CARGO  (
   ID  INT NOT NULL AUTO_INCREMENT,
   DESCRICAO  VARCHAR(45) NULL,
   PRIMARY KEY ( ID )
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table CONSULTORIO.ESTOQUE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.ESTOQUE (
   COD_MATERIAL  INT NOT NULL AUTO_INCREMENT,
   NOME  VARCHAR(45) NOT NULL,
   QTD  DECIMAL(11) NOT NULL,
   VALOR  DECIMAL(11) NOT NULL,
   PRIMARY KEY ( COD_MATERIAL )
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table CONSULTORIO.FUNCIONARIO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.FUNCIONARIO  (
   CODIGO  INT NOT NULL AUTO_INCREMENT,
   NOME  VARCHAR(45) NULL,
   cargo_ID  INT NOT NULL,
   EMAIL  VARCHAR(45) NULL,
   GERENTE  VARCHAR(45) NULL,
   conta_receber_COD  INT NOT NULL,
   PRIMARY KEY ( CODIGO ,  cargo_ID ,  conta_receber_COD ),
   INDEX  fk_funcionario_cargo1_idx  ( cargo_ID  ASC) ,
   INDEX  fk_funcionario_conta_receber1_idx  ( conta_receber_COD  ASC) 
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table CONSULTORIO.AGENDAMENTO_CONSULTA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.AGENDAMENTO_CONSULTA (
   CODIGO  INT NOT NULL,
   DATA_CONSULTA  DATETIME NULL,
   OBSERVACAO  VARCHAR(200) NULL,
   Paciente_CODIGO  INT NOT NULL,
   doutor_CODIGO  INT NOT NULL,
   PRIMARY KEY ( CODIGO ,  Paciente_CODIGO ,  doutor_CODIGO ),
   INDEX  fk_agendamento_consulta_Paciente1_idx  ( Paciente_CODIGO  ASC) ,
   INDEX  fk_agendamento_consulta_doutor1_idx  ( doutor_CODIGO  ASC) 
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table CONSULTORIO.CONSULTA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.CONSULTA (
	`COD` INT(11) NOT NULL AUTO_INCREMENT,
	`DATA_CONSULTA` DATETIME NOT NULL,
	`STATUS` CHAR(2) NOT NULL COLLATE 'utf8mb3_general_ci',
	`OBSERVACAO_MEDICA` VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`Paciente_CODIGO` INT(11) NOT NULL,
	`doutor_CODIGO` INT(11) NOT NULL,
	PRIMARY KEY (`COD`, `Paciente_CODIGO`, `agendamento_consulta_CODIGO`, `agendamento_consulta_Paciente_CODIGO`, `doutor_CODIGO`, `conta_receber_COD`) USING BTREE,
	INDEX `fk_consulta_agendamento_consulta1_idx` (`agendamento_consulta_CODIGO`, `agendamento_consulta_Paciente_CODIGO`) USING BTREE,
	INDEX `fk_consulta_doutor1_idx` (`doutor_CODIGO`) USING BTREE,
	INDEX `fk_consulta_conta_receber1_idx` (`conta_receber_COD`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=3
;

-- -----------------------------------------------------
-- Table CONSULTORIO.HISTORICO_ODONTOLOGICO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.HISTORICO_ODONTOLOGICO (
   consulta_COD  INT NOT NULL,
   consulta_Paciente_CODIGO  INT NOT NULL,
   PRONTUARIO  VARCHAR(500) NOT NULL,
   PRIMARY KEY ( consulta_COD ,  consulta_Paciente_CODIGO )
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table CONSULTORIO.ESPECIALIDADE_DOUTOR 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.ESPECIALIDADE_DOUTOR  (
   doutor_CODIGO  INT NOT NULL,
   especialidade_ID  INT NOT NULL,
   OBSERVACAO  VARCHAR(45) NULL,
   PRIMARY KEY ( doutor_CODIGO ,  especialidade_ID ),
   INDEX  fk_doutor_has_especialidade_especialidade1_idx  ( especialidade_ID  ASC) ,
   INDEX  fk_doutor_has_especialidade_doutor1_idx  ( doutor_CODIGO  ASC) 
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table CONSULTORIO.PACIENTE_ESTOQUE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTORIO.PACIENTE_ESTOQUE (
   paciente_codigo  INT NOT NULL,
   material_codigo  INT NOT NULL,
   QTD  DECIMAL(11) NOT NULL,
   PRIMARY KEY ( paciente_codigo ,  material_codigo ),
   INDEX  fk_paciente_has_estoque_material1_idx  ( material_codigo  ASC) ,
   INDEX  fk_paciente_has_estoque_paciente1_idx  ( paciente_codigo  ASC) 
) ENGINE = InnoDB;
