-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema custom
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema custom
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `custom` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Residence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Residence` (
  `RES_CODE` VARCHAR(10) NOT NULL,
  `RES_NAME` VARCHAR(20) NOT NULL,
  `RES_LOCATION` VARCHAR(20) NOT NULL,
  `RES_OCCUPANCY` INT NOT NULL,
  `RES_SROOM` INT NOT NULL COMMENT 'The number of people in single rooms.',
  `RES_DROOM` INT NOT NULL COMMENT 'The number of people in double rooms.',
  `RES_AVAILABLE_RMS` INT NOT NULL,
  PRIMARY KEY (`RES_CODE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Room` (
  `RM_NO` VARCHAR(7) NOT NULL,
  `RM_BUILDING` VARCHAR(40) NOT NULL,
  `RM_TYPE` VARCHAR(10) NOT NULL,
  `RM_AVAILABILITY` TINYINT NOT NULL,
  `RM_FLOOR_LEVEL` INT NOT NULL,
  `RM_BUILDING_BLOCK` VARCHAR(5) NOT NULL,
  `Residence_RES_CODE` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`RM_NO`),
  UNIQUE INDEX `RM_NO_UNIQUE` (`RM_NO` ASC) VISIBLE,
  INDEX `fk_Room_Residence1_idx` (`Residence_RES_CODE` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Residence1`
    FOREIGN KEY (`Residence_RES_CODE`)
    REFERENCES `mydb`.`Residence` (`RES_CODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `STD_NO` INT NOT NULL,
  `STD_FNAME` VARCHAR(35) NOT NULL,
  `STD_LNAME` VARCHAR(45) NOT NULL,
  `STD_EMAIL` VARCHAR(20) NOT NULL,
  `STD_AGE` INT NOT NULL,
  `STD_GENDER` CHAR(1) NOT NULL,
  `STD_ADDRESS` VARCHAR(80) NOT NULL,
  `STD_ROOM_NO` VARCHAR(20) NOT NULL,
  `STD_YR_OF_STUDY` INT(2) NOT NULL,
  `STD_LEVEL` INT(2) NOT NULL,
  `STD_CRS_DURATION` INT(2) NOT NULL,
  `STD_PASS` TINYINT NOT NULL,
  `STD_AVERAGE` FLOAT NOT NULL,
  `STD_PREFERRED_RES` VARCHAR(45) NOT NULL,
  `Room_RM_NO` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`STD_NO`),
  UNIQUE INDEX `STD_EMAIL_UNIQUE` (`STD_EMAIL` ASC) VISIBLE,
  INDEX `fk_Student_Room1_idx` (`Room_RM_NO` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Room1`
    FOREIGN KEY (`Room_RM_NO`)
    REFERENCES `mydb`.`Room` (`RM_NO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `STAFF_NO` VARCHAR(8) NOT NULL,
  `STAFF_FNAME` VARCHAR(30) NOT NULL,
  `STAFF_LNAME` VARCHAR(20) NOT NULL,
  `STAFF_EMAIL` VARCHAR(20) NOT NULL,
  `STAFF_DEPARTMENT` VARCHAR(25) NOT NULL,
  `STAFF_ROLE` VARCHAR(20) NOT NULL,
  `Residence_RES_CODE` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`STAFF_NO`),
  UNIQUE INDEX `STAFF_EMAIL_UNIQUE` (`STAFF_EMAIL` ASC) VISIBLE,
  INDEX `fk_Staff_Residence1_idx` (`Residence_RES_CODE` ASC) VISIBLE,
  CONSTRAINT `fk_Staff_Residence1`
    FOREIGN KEY (`Residence_RES_CODE`)
    REFERENCES `mydb`.`Residence` (`RES_CODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Event` (
  `EVENT_CODE` VARCHAR(10) NOT NULL,
  `EVENT_NAME` VARCHAR(30) NOT NULL,
  `EVENT_DESCRIPTION` LONGTEXT NOT NULL,
  `EVENT_DATE` DATE NOT NULL,
  `EVENT_LOCATION` VARCHAR(20) NOT NULL,
  `EVENT_POSTER` VARCHAR(45) NOT NULL,
  `Residence_RES_CODE` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`EVENT_CODE`),
  UNIQUE INDEX `EVENT_POSTER_UNIQUE` (`EVENT_POSTER` ASC) VISIBLE,
  INDEX `fk_Event_Residence1_idx` (`Residence_RES_CODE` ASC) VISIBLE,
  CONSTRAINT `fk_Event_Residence1`
    FOREIGN KEY (`Residence_RES_CODE`)
    REFERENCES `mydb`.`Residence` (`RES_CODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `custom` ;

-- -----------------------------------------------------
-- Table `custom`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `custom`.`customers` (
  `Cus_ID` VARCHAR(8) NULL DEFAULT NULL,
  `Name` VARCHAR(20) NULL DEFAULT NULL,
  `Surname` VARCHAR(20) NULL DEFAULT NULL,
  `Movie_Rentals` INT(2) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
