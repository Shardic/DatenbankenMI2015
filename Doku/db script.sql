-- MySQL Script generated by MySQL Workbench
-- 05/04/15 10:47:25
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Geschäftsstelle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Geschäftsstelle` (
  `Geschäftsstellennummer` INT NOT NULL AUTO_INCREMENT,
  `Ort` VARCHAR(45) NULL,
  `PLZ` INT NULL,
  PRIMARY KEY (`Geschäftsstellennummer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fahrzeug`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fahrzeug` (
  `Fahrzeugnummer` INT NOT NULL AUTO_INCREMENT,
  `Hersteller` VARCHAR(45) NULL DEFAULT 'Unbekannt',
  `Laufleistung` INT NULL,
  `Fahrzeugtyp` VARCHAR(45) NULL,
  `Anzahl Sitzplätze` INT NULL,
  `Nummernschild` VARCHAR(45) NULL,
  `Geschäftsstellennummer` INT NULL,
  PRIMARY KEY (`Fahrzeugnummer`),
  CONSTRAINT `Geschäftsstellennummer`
    FOREIGN KEY (`Geschäftsstellennummer`)
    REFERENCES `mydb`.`Geschäftsstelle` (`Geschäftsstellennummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `FNummer_UNIQUE` ON `mydb`.`Fahrzeug` (`Fahrzeugnummer` ASC);

CREATE INDEX `Geschäftsstellennummer_idx` ON `mydb`.`Fahrzeug` (`Geschäftsstellennummer` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Kunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kunde` (
  `Kundennummer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Adresse` VARCHAR(45) NULL,
  PRIMARY KEY (`Kundennummer`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Kundennummer_UNIQUE` ON `mydb`.`Kunde` (`Kundennummer` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Termin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Termin` (
  `Starttag` DATE NOT NULL,
  `Endtag` DATE NOT NULL,
  `Terminnummer` INT NOT NULL,
  `Kundennummer` INT NOT NULL,
  PRIMARY KEY (`Terminnummer`),
  CONSTRAINT `Kundennummer`
    FOREIGN KEY (`Kundennummer`)
    REFERENCES `mydb`.`Kunde` (`Kundennummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Terminnummer_UNIQUE` ON `mydb`.`Termin` (`Terminnummer` ASC);

CREATE INDEX `Kundennummer_idx` ON `mydb`.`Termin` (`Kundennummer` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Mitarbeiter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mitarbeiter` (
  `Mitarbeiternummer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Gehalt` FLOAT NULL,
  `Adresse` VARCHAR(45) NULL,
  `IBAN` VARCHAR(45) NULL,
  `Geburtsdatum` DATE NULL,
  `Geschäftsstellennummer` INT NOT NULL,
  `Terminnummer` INT NOT NULL,
  `Fahrzeugnummer` INT NOT NULL,
  PRIMARY KEY (`Mitarbeiternummer`),
  CONSTRAINT `Geschäftsstellennummer`
    FOREIGN KEY (`Geschäftsstellennummer`)
    REFERENCES `mydb`.`Geschäftsstelle` (`Geschäftsstellennummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Terminnummer`
    FOREIGN KEY (`Terminnummer`)
    REFERENCES `mydb`.`Termin` (`Terminnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fahrzeugnummer`
    FOREIGN KEY (`Fahrzeugnummer`)
    REFERENCES `mydb`.`Fahrzeug` (`Fahrzeugnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Mitarbeiternummer_UNIQUE` ON `mydb`.`Mitarbeiter` (`Mitarbeiternummer` ASC);

CREATE INDEX `Geschaftsstellennummer_idx` ON `mydb`.`Mitarbeiter` (`Geschäftsstellennummer` ASC);

CREATE INDEX `Terminnummer_idx` ON `mydb`.`Mitarbeiter` (`Terminnummer` ASC);

CREATE INDEX `Fahrzeugnummer_idx` ON `mydb`.`Mitarbeiter` (`Fahrzeugnummer` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Rechnung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rechnung` (
  `Rechnungsnummer` INT NOT NULL AUTO_INCREMENT,
  `Anzahl Tage` INT NOT NULL,
  `Rechnungsbetrag` INT NULL,
  `Kundennummer` INT NOT NULL,
  PRIMARY KEY (`Rechnungsnummer`),
  CONSTRAINT `Kundennummer`
    FOREIGN KEY (`Kundennummer`)
    REFERENCES `mydb`.`Kunde` (`Kundennummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Rechnungsnummer_UNIQUE` ON `mydb`.`Rechnung` (`Rechnungsnummer` ASC);

CREATE INDEX `Kundennummer_idx` ON `mydb`.`Rechnung` (`Kundennummer` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Terminmanagement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Terminmanagement` (
  `Terminnummer` INT NOT NULL,
  `Rechnungsnummer` INT NOT NULL,
  `Fahrzeugnummer` INT NOT NULL,
  PRIMARY KEY (`Terminnummer`, `Rechnungsnummer`, `Fahrzeugnummer`),
  CONSTRAINT `Fahrzeugnummer`
    FOREIGN KEY (`Fahrzeugnummer`)
    REFERENCES `mydb`.`Fahrzeug` (`Fahrzeugnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Terminnummer`
    FOREIGN KEY (`Terminnummer`)
    REFERENCES `mydb`.`Termin` (`Terminnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rechnungsnummer`
    FOREIGN KEY (`Rechnungsnummer`)
    REFERENCES `mydb`.`Rechnung` (`Rechnungsnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Terminnummer_UNIQUE` ON `mydb`.`Terminmanagement` (`Terminnummer` ASC);

CREATE INDEX `Fahrzeugnummer_idx` ON `mydb`.`Terminmanagement` (`Fahrzeugnummer` ASC);

CREATE INDEX `Rechnungsnummer_idx` ON `mydb`.`Terminmanagement` (`Rechnungsnummer` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
