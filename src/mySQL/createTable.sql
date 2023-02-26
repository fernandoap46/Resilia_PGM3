SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema escola
-- ----------------------------------------------------- -- -----------------------------------------------------
-- Schema escola
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `escola` ;
-- Table `escola`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`cliente` (
`id` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(255) NOT NULL,
`cpf` varchar(11) NOT NULL,
`email` VARCHAR(255) NULL DEFAULT NULL,
`cep` INT NOT NULL,
`cidade` VARCHAR(255) NULL DEFAULT NULL,
`estado` VARCHAR(255) NULL DEFAULT NULL,
`endereco` VARCHAR(255) NULL DEFAULT NULL,
`numero` INT NOT NULL,
`complemento` VARCHAR(255) NULL DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `escola`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`curso` (
`id` INT NOT NULL AUTO_INCREMENT,
`nome_curso` VARCHAR(255) NULL DEFAULT NULL,
`descricao` VARCHAR(255) NULL DEFAULT NULL,
`duracao` float(5,1) NULL DEFAULT NULL,
`preco` FLOAT(4,2) NULL DEFAULT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `escola`.`certificados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`certificados` (
`id_cliente` INT NOT NULL,
`id_curso` INT NOT NULL,
PRIMARY KEY (`id_cliente`, `id_curso`),
INDEX `id_curso` (`id_curso` ASC) VISIBLE,
CONSTRAINT `certificados_ibfk_1`
FOREIGN KEY (`id_cliente`)
REFERENCES `escola`.`cliente` (`id`),
CONSTRAINT `certificados_ibfk_2`
FOREIGN KEY (`id_curso`)
REFERENCES `escola`.`curso` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `escola`.`dados_cartao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`dados_cartao` (
`id` INT NOT NULL AUTO_INCREMENT,
`id_cliente` INT NOT NULL,
`bandeira_cartao` VARCHAR(255) NOT NULL,
`numero_cartao` VARCHAR(15) NOT NULL,
`codigo_seguranca` INT NOT NULL,
`cpf` varchar(11) NOT NULL,
`vencimento_cartao` INT NOT NULL,
`nome_cartao` VARCHAR(255) NOT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
UNIQUE INDEX `id` (`id` ASC) VISIBLE,
CONSTRAINT `dados_cartao_ibfk_1`
FOREIGN KEY (`id_cliente`)
REFERENCES `escola`.`cliente` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `escola`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`pedido` (
`id` INT NOT NULL AUTO_INCREMENT,
`id_cliente` INT NULL DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` (`id` ASC) VISIBLE,
INDEX `id_cliente` (`id_cliente` ASC) VISIBLE,
CONSTRAINT `pedido_ibfk_1`
FOREIGN KEY (`id_cliente`)
REFERENCES `escola`.`cliente` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `escola`.`itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`itens` (
`id_pedido` INT NOT NULL,
`id_curso` INT NOT NULL,
PRIMARY KEY (`id_pedido`, `id_curso`),
INDEX `id_pedido` (`id_pedido` ASC) VISIBLE,
INDEX `itens_curso_fk_idx` (`id_curso` ASC) VISIBLE,
CONSTRAINT `itens_ibfk_1`
FOREIGN KEY (`id_pedido`)
REFERENCES `escola`.`pedido` (`id`),
CONSTRAINT `itens_curso_fk`
FOREIGN KEY (`id_curso`)
REFERENCES `escola`.`curso` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `escola`.`pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`pagamento` (
`id` INT NOT NULL AUTO_INCREMENT,
`forma_pagamento` VARCHAR(25) NULL DEFAULT NULL,
`autenticacao` INT NULL DEFAULT NULL,
`status` VARCHAR(25) NULL DEFAULT NULL,
`id_pedido` INT NOT NULL,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` (`id` ASC) VISIBLE,
INDEX `fk_pagamento_pedido1_idx` (`id_pedido` ASC) VISIBLE,
CONSTRAINT `fk_pagamento_pedido1`
FOREIGN KEY (`id_pedido`)
REFERENCES `escola`.`pedido` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;