-- MySQL Script generated by MySQL Workbench
-- 05/04/15 11:11:04
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema dbwebanw_sose15_09
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbwebanw_sose15_09
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbwebanw_sose15_09` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `dbwebanw_sose15_09` ;

-- -----------------------------------------------------
-- Table `dbwebanw_sose15_09`.`Geschäftsstelle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbwebanw_sose15_09`.`Geschäftsstelle` (
  `Geschäftsstellennummer` INT NOT NULL AUTO_INCREMENT,
  `Ort` VARCHAR(45) NULL,
  `PLZ` INT NULL,
  PRIMARY KEY (`Geschäftsstellennummer`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Geschäftsstellennummer_UNIQUE` ON `dbwebanw_sose15_09`.`Geschäftsstelle` (`Geschäftsstellennummer` ASC);


-- -----------------------------------------------------
-- Table `dbwebanw_sose15_09`.`Fahrzeug`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbwebanw_sose15_09`.`Fahrzeug` (
  `Fahrzeugnummer` INT NOT NULL AUTO_INCREMENT,
  `Hersteller` VARCHAR(45) NULL DEFAULT 'Unbekannt',
  `Laufleistung` INT NULL,
  `Fahrzeugtyp` VARCHAR(45) NULL,
  `Anzahl Sitzplätze` INT NULL,
  `Nummernschild` VARCHAR(45) NULL,
  `FGeschäftsstellennummer` INT NULL,
  PRIMARY KEY (`Fahrzeugnummer`),
  CONSTRAINT `FrzGeschäftsstellennummer`
    FOREIGN KEY (`FGeschäftsstellennummer`)
    REFERENCES `dbwebanw_sose15_09`.`Geschäftsstelle` (`Geschäftsstellennummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `FNummer_UNIQUE` ON `dbwebanw_sose15_09`.`Fahrzeug` (`Fahrzeugnummer` ASC);

CREATE INDEX `Geschäftsstellennummer_idx` ON `dbwebanw_sose15_09`.`Fahrzeug` (`FGeschäftsstellennummer` ASC);


-- -----------------------------------------------------
-- Table `dbwebanw_sose15_09`.`Kunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbwebanw_sose15_09`.`Kunde` (
  `Kundennummer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Adresse` VARCHAR(45) NULL,
  PRIMARY KEY (`Kundennummer`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Kundennummer_UNIQUE` ON `dbwebanw_sose15_09`.`Kunde` (`Kundennummer` ASC);


-- -----------------------------------------------------
-- Table `dbwebanw_sose15_09`.`Termin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbwebanw_sose15_09`.`Termin` (
  `Starttag` DATE NOT NULL,
  `Endtag` DATE NOT NULL,
  `Terminnummer` INT NOT NULL,
  `TKundennummer` INT NOT NULL,
  PRIMARY KEY (`Terminnummer`),
  CONSTRAINT `TerKundennummer`
    FOREIGN KEY (`TKundennummer`)
    REFERENCES `dbwebanw_sose15_09`.`Kunde` (`Kundennummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Terminnummer_UNIQUE` ON `dbwebanw_sose15_09`.`Termin` (`Terminnummer` ASC);

CREATE INDEX `Kundennummer_idx` ON `dbwebanw_sose15_09`.`Termin` (`TKundennummer` ASC);


-- -----------------------------------------------------
-- Table `dbwebanw_sose15_09`.`Mitarbeiter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbwebanw_sose15_09`.`Mitarbeiter` (
  `Mitarbeiternummer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Gehalt` FLOAT NULL,
  `Adresse` VARCHAR(45) NULL,
  `IBAN` VARCHAR(45) NULL,
  `Geburtsdatum` DATE NULL,
  `MitGeschäftsstellennummer` INT NOT NULL,
  `MitTerminnummer` INT NOT NULL,
  `MitFahrzeugnummer` INT NOT NULL,
  `Mitarbeitercol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Mitarbeiternummer`),
  CONSTRAINT `MitGeschäftsstellennummer`
    FOREIGN KEY (`MitGeschäftsstellennummer`)
    REFERENCES `dbwebanw_sose15_09`.`Geschäftsstelle` (`Geschäftsstellennummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MitTerminnummer`
    FOREIGN KEY (`MitTerminnummer`)
    REFERENCES `dbwebanw_sose15_09`.`Termin` (`Terminnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MitFahrzeugnummer`
    FOREIGN KEY (`MitFahrzeugnummer`)
    REFERENCES `dbwebanw_sose15_09`.`Fahrzeug` (`Fahrzeugnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Mitarbeiternummer_UNIQUE` ON `dbwebanw_sose15_09`.`Mitarbeiter` (`Mitarbeiternummer` ASC);

CREATE INDEX `Geschaftsstellennummer_idx` ON `dbwebanw_sose15_09`.`Mitarbeiter` (`MitGeschäftsstellennummer` ASC);

CREATE INDEX `Terminnummer_idx` ON `dbwebanw_sose15_09`.`Mitarbeiter` (`MitTerminnummer` ASC);

CREATE INDEX `Fahrzeugnummer_idx` ON `dbwebanw_sose15_09`.`Mitarbeiter` (`MitFahrzeugnummer` ASC);


-- -----------------------------------------------------
-- Table `dbwebanw_sose15_09`.`Rechnung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbwebanw_sose15_09`.`Rechnung` (
  `Rechnungsnummer` INT NOT NULL AUTO_INCREMENT,
  `Anzahl Tage` INT NOT NULL,
  `Rechnungsbetrag` INT NULL,
  `RKundennummer` INT NOT NULL,
  PRIMARY KEY (`Rechnungsnummer`),
  CONSTRAINT `RechKundennummer`
    FOREIGN KEY (`RKundennummer`)
    REFERENCES `dbwebanw_sose15_09`.`Kunde` (`Kundennummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Rechnungsnummer_UNIQUE` ON `dbwebanw_sose15_09`.`Rechnung` (`Rechnungsnummer` ASC);

CREATE INDEX `Kundennummer_idx` ON `dbwebanw_sose15_09`.`Rechnung` (`RKundennummer` ASC);


-- -----------------------------------------------------
-- Table `dbwebanw_sose15_09`.`Terminmanagement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbwebanw_sose15_09`.`Terminmanagement` (
  `MTerminnummer` INT NOT NULL,
  `MRechnungsnummer` INT NOT NULL,
  `MFahrzeugnummer` INT NOT NULL,
  PRIMARY KEY (`MTerminnummer`, `MRechnungsnummer`, `MFahrzeugnummer`),
  CONSTRAINT `MngFahrzeugnummer`
    FOREIGN KEY (`MFahrzeugnummer`)
    REFERENCES `dbwebanw_sose15_09`.`Fahrzeug` (`Fahrzeugnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MngTerminnummer`
    FOREIGN KEY (`MTerminnummer`)
    REFERENCES `dbwebanw_sose15_09`.`Termin` (`Terminnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MngRechnungsnummer`
    FOREIGN KEY (`MRechnungsnummer`)
    REFERENCES `dbwebanw_sose15_09`.`Rechnung` (`Rechnungsnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Fahrzeugnummer_idx` ON `dbwebanw_sose15_09`.`Terminmanagement` (`MFahrzeugnummer` ASC);

CREATE INDEX `Rechnungsnummer_idx` ON `dbwebanw_sose15_09`.`Terminmanagement` (`MRechnungsnummer` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;