-- MySQL Script generated by MySQL Workbench
-- Fri Jun 10 09:13:08 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bmxfreestyle
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bmxfreestyle
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bmxfreestyle` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bmxfreestyle` ;

-- -----------------------------------------------------
-- Table `bmxfreestyle`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bmxfreestyle`.`clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `cedula` CHAR(7) NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `apellidos` VARCHAR(50) NULL DEFAULT NULL,
  `genero` CHAR(2) NULL DEFAULT NULL,
  `estado` CHAR(2) NULL DEFAULT 'A',
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bmxfreestyle`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bmxfreestyle`.`productos` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `pVenta` DOUBLE NULL DEFAULT NULL,
  `pCompra` DOUBLE NULL DEFAULT NULL,
  `estado` CHAR(2) NULL DEFAULT 'A',
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bmxfreestyle`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bmxfreestyle`.`usuarios` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(50) NULL DEFAULT NULL,
  `clave` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bmxfreestyle`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bmxfreestyle`.`ventas` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `cliente` INT NULL DEFAULT NULL,
  `producto` INT NULL DEFAULT NULL,
  `cantidad` INT NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `ventas_ibfk_1`
    FOREIGN KEY (`cliente`)
    REFERENCES `bmxfreestyle`.`clientes` (`idClientes`),
  CONSTRAINT `ventas_ibfk_2`
    FOREIGN KEY (`producto`)
    REFERENCES `bmxfreestyle`.`productos` (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `cliente` ON `bmxfreestyle`.`ventas` (`cliente` ASC) VISIBLE;

CREATE INDEX `producto` ON `bmxfreestyle`.`ventas` (`producto` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
