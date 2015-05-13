-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sscm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sscm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sscm` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sscm` ;

-- -----------------------------------------------------
-- Table `sscm`.`table1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sscm`.`table1` ;

CREATE TABLE IF NOT EXISTS `sscm`.`table1` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
