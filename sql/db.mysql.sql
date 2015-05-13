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
-- Table `sscm`.`part_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sscm`.`part_types` ;

CREATE TABLE IF NOT EXISTS `sscm`.`part_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `decsription` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sscm`.`places`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sscm`.`places` ;

CREATE TABLE IF NOT EXISTS `sscm`.`places` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `is_shop` BIT NOT NULL,
  `address` TEXT NOT NULL,
  `remark` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sscm`.`parts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sscm`.`parts` ;

CREATE TABLE IF NOT EXISTS `sscm`.`parts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `part_type_id` INT UNSIGNED NOT NULL,
  `quantity` INT NOT NULL,
  `place_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_parts_part_types_idx` (`part_type_id` ASC),
  INDEX `fk_parts_places1_idx` (`place_id` ASC),
  CONSTRAINT `fk_parts_part_types`
    FOREIGN KEY (`part_type_id`)
    REFERENCES `sscm`.`part_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_parts_places1`
    FOREIGN KEY (`place_id`)
    REFERENCES `sscm`.`places` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sscm`.`transactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sscm`.`transactions` ;

CREATE TABLE IF NOT EXISTS `sscm`.`transactions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_order` DATE NOT NULL,
  `date_awaited` DATE NOT NULL,
  `date_arrival` DATE NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` TEXT NOT NULL,
  `place_from_id` INT UNSIGNED NOT NULL,
  `place_to_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transactions_places1_idx` (`place_from_id` ASC),
  INDEX `fk_transactions_places2_idx` (`place_to_id` ASC),
  CONSTRAINT `fk_transactions_places1`
    FOREIGN KEY (`place_from_id`)
    REFERENCES `sscm`.`places` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_places2`
    FOREIGN KEY (`place_to_id`)
    REFERENCES `sscm`.`places` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
