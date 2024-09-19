-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ISINFO-003
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ISINFO-003` ;

-- -----------------------------------------------------
-- Schema ISINFO-003
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ISINFO-003` DEFAULT CHARACTER SET utf8 ;
USE `ISINFO-003` ;

-- -----------------------------------------------------
-- Table `ISINFO-003`.`REFREGION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`REFREGION` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`REFREGION` (
  `region_id` INT(4) NOT NULL,
  `region_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`region_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`DIM_OPREGION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`DIM_OPREGION` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`DIM_OPREGION` (
  `opregion_id` INT(4) NOT NULL,
  PRIMARY KEY (`opregion_id`),
  CONSTRAINT `FK12_001`
    FOREIGN KEY (`opregion_id`)
    REFERENCES `ISINFO-003`.`REFREGION` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`DIM_SALESREP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`DIM_SALESREP` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`DIM_SALESREP` (
  `salesrep_id` INT(4) NOT NULL,
  `salesrep_fname` VARCHAR(45) NULL,
  `salesrep_lname` VARCHAR(45) NULL,
  `opregion_id` INT(4) NULL,
  PRIMARY KEY (`salesrep_id`),
  INDEX `FK03_001_idx` (`opregion_id` ASC) VISIBLE,
  CONSTRAINT `FK03_001`
    FOREIGN KEY (`opregion_id`)
    REFERENCES `ISINFO-003`.`DIM_OPREGION` (`opregion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`DIM_CUSTREGION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`DIM_CUSTREGION` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`DIM_CUSTREGION` (
  `custregion_id` INT(4) NOT NULL,
  PRIMARY KEY (`custregion_id`),
  CONSTRAINT `FK10_001`
    FOREIGN KEY (`custregion_id`)
    REFERENCES `ISINFO-003`.`REFREGION` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`REFORDERSTATUS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`REFORDERSTATUS` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`REFORDERSTATUS` (
  `orderstatus_id` INT(1) NOT NULL,
  `orderstatus_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`orderstatus_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`DIM_ORDERSTATUS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`DIM_ORDERSTATUS` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`DIM_ORDERSTATUS` (
  `orderstatus_id` INT(1) NOT NULL,
  PRIMARY KEY (`orderstatus_id`),
  CONSTRAINT `FK09_001`
    FOREIGN KEY (`orderstatus_id`)
    REFERENCES `ISINFO-003`.`REFORDERSTATUS` (`orderstatus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`DIM_QUARTER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`DIM_QUARTER` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`DIM_QUARTER` (
  `quarter_id` INT(1) NOT NULL,
  PRIMARY KEY (`quarter_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`DIM_MONTH`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`DIM_MONTH` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`DIM_MONTH` (
  `month_id` INT(2) NOT NULL,
  `month_desc` VARCHAR(45) NULL,
  `quarter_id` INT(1) NULL,
  PRIMARY KEY (`month_id`),
  INDEX `FK02_001_idx` (`quarter_id` ASC) VISIBLE,
  CONSTRAINT `FK02_001`
    FOREIGN KEY (`quarter_id`)
    REFERENCES `ISINFO-003`.`DIM_QUARTER` (`quarter_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`DIM_YEAR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`DIM_YEAR` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`DIM_YEAR` (
  `year_id` INT(4) NOT NULL,
  PRIMARY KEY (`year_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`DIM_SALETYPE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`DIM_SALETYPE` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`DIM_SALETYPE` (
  `saletype_id` INT(1) NOT NULL,
  `saletype_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`saletype_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`DIM_MONTHYEAR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`DIM_MONTHYEAR` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`DIM_MONTHYEAR` (
  `monthyear_id` INT(6) ZEROFILL NOT NULL,
  `month_id` INT(2) NULL,
  `year_id` INT(4) NULL,
  PRIMARY KEY (`monthyear_id`),
  INDEX `FK06_001_idx` (`month_id` ASC) VISIBLE,
  INDEX `FK06_002_idx` (`year_id` ASC) VISIBLE,
  CONSTRAINT `FK06_001`
    FOREIGN KEY (`month_id`)
    REFERENCES `ISINFO-003`.`DIM_MONTH` (`month_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK06_002`
    FOREIGN KEY (`year_id`)
    REFERENCES `ISINFO-003`.`DIM_YEAR` (`year_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`FC01_Financial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`FC01_Financial` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`FC01_Financial` (
  `salesrep_id` INT(4) NOT NULL,
  `custregion_id` INT(4) NOT NULL,
  `orderstatus_id` INT(4) NOT NULL,
  `monthyear_id` INT(6) ZEROFILL NOT NULL,
  `ts_orders` DECIMAL(9,2) NULL,
  `ts_services` DECIMAL(9,2) NULL,
  `te_orders` DECIMAL(9,2) NULL,
  `te_services` DECIMAL(9,2) NULL,
  `avg_sales` DECIMAL(9,2) NULL,
  `min_sales` DECIMAL(9,2) NULL,
  `max_sales` DECIMAL(9,2) NULL,
  `no_sales` INT(5) NULL,
  `avg_expenses` DECIMAL(9,2) NULL,
  `min_expenses` DECIMAL(9,2) NULL,
  `max_expenses` DECIMAL(9,2) NULL,
  `median_sales` DECIMAL(9,2) NULL,
  PRIMARY KEY (`salesrep_id`, `orderstatus_id`, `monthyear_id`, `custregion_id`),
  INDEX `FK01_002_idx` (`custregion_id` ASC) VISIBLE,
  INDEX `FK01_003_idx` (`salesrep_id` ASC) VISIBLE,
  INDEX `FK01_004_idx` (`orderstatus_id` ASC) VISIBLE,
  INDEX `FK01_005_idx` (`monthyear_id` ASC) VISIBLE,
  CONSTRAINT `FK01_002`
    FOREIGN KEY (`custregion_id`)
    REFERENCES `ISINFO-003`.`DIM_CUSTREGION` (`custregion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK01_003`
    FOREIGN KEY (`salesrep_id`)
    REFERENCES `ISINFO-003`.`DIM_SALESREP` (`salesrep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK01_004`
    FOREIGN KEY (`orderstatus_id`)
    REFERENCES `ISINFO-003`.`DIM_ORDERSTATUS` (`orderstatus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK01_005`
    FOREIGN KEY (`monthyear_id`)
    REFERENCES `ISINFO-003`.`DIM_MONTHYEAR` (`monthyear_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`FC02_Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`FC02_Customer` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`FC02_Customer` (
  `salesrep_id` INT(4) NOT NULL,
  `custregion_id` INT(4) NOT NULL,
  `orderstatus_id` INT(4) NOT NULL,
  `monthyear_id` INT(6) ZEROFILL NOT NULL,
  `saletype_id` INT(1) NOT NULL,
  `total_customers` INT(4) NULL,
  `avg_satisfaction` INT(1) NULL,
  `avg_customers` INT(4) NULL,
  `min_customers` INT(4) NULL,
  `max_customers` INT(4) NULL,
  PRIMARY KEY (`salesrep_id`, `custregion_id`, `orderstatus_id`, `monthyear_id`, `saletype_id`),
  INDEX `FK01_002_idx` (`custregion_id` ASC) VISIBLE,
  INDEX `FK01_003_idx` (`salesrep_id` ASC) VISIBLE,
  INDEX `FK01_004_idx` (`orderstatus_id` ASC) VISIBLE,
  INDEX `FK01_005_idx` (`monthyear_id` ASC) VISIBLE,
  INDEX `FK01_0060_idx` (`saletype_id` ASC) VISIBLE,
  CONSTRAINT `FK01_0020`
    FOREIGN KEY (`custregion_id`)
    REFERENCES `ISINFO-003`.`DIM_CUSTREGION` (`custregion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK01_0030`
    FOREIGN KEY (`salesrep_id`)
    REFERENCES `ISINFO-003`.`DIM_SALESREP` (`salesrep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK01_0040`
    FOREIGN KEY (`orderstatus_id`)
    REFERENCES `ISINFO-003`.`DIM_ORDERSTATUS` (`orderstatus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK01_0050`
    FOREIGN KEY (`monthyear_id`)
    REFERENCES `ISINFO-003`.`DIM_MONTHYEAR` (`monthyear_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK01_0060`
    FOREIGN KEY (`saletype_id`)
    REFERENCES `ISINFO-003`.`DIM_SALETYPE` (`saletype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`FC03_Internal Processes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`FC03_Internal Processes` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`FC03_Internal Processes` (
  `opregion_id` INT(4) NOT NULL,
  `salesrep_id` INT(4) NOT NULL,
  `custregion_id` INT(4) NOT NULL,
  `monthyear_id` INT(6) ZEROFILL NOT NULL,
  `orderstatus_id` INT(1) NOT NULL,
  `avg_orderturnarounddays` INT(3) NULL,
  `min_orderturnarounddays` INT(3) NULL,
  `max_orderturnarounddays` INT(3) NULL,
  PRIMARY KEY (`opregion_id`, `salesrep_id`, `custregion_id`, `monthyear_id`, `orderstatus_id`),
  INDEX `FK07_002_idx` (`salesrep_id` ASC) VISIBLE,
  INDEX `FK07_003_idx` (`custregion_id` ASC) VISIBLE,
  INDEX `FK07_004_idx` (`monthyear_id` ASC) VISIBLE,
  INDEX `FK07_005_idx` (`orderstatus_id` ASC) VISIBLE,
  CONSTRAINT `FK07_001`
    FOREIGN KEY (`opregion_id`)
    REFERENCES `ISINFO-003`.`DIM_OPREGION` (`opregion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK07_002`
    FOREIGN KEY (`salesrep_id`)
    REFERENCES `ISINFO-003`.`DIM_SALESREP` (`salesrep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK07_003`
    FOREIGN KEY (`custregion_id`)
    REFERENCES `ISINFO-003`.`DIM_CUSTREGION` (`custregion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK07_004`
    FOREIGN KEY (`monthyear_id`)
    REFERENCES `ISINFO-003`.`DIM_MONTHYEAR` (`monthyear_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK07_005`
    FOREIGN KEY (`orderstatus_id`)
    REFERENCES `ISINFO-003`.`DIM_ORDERSTATUS` (`orderstatus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ISINFO-003`.`FC04_Organizational Capacity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ISINFO-003`.`FC04_Organizational Capacity` ;

CREATE TABLE IF NOT EXISTS `ISINFO-003`.`FC04_Organizational Capacity` (
  `salesrep_id` INT(4) NOT NULL,
  `monthyear_id` INT(6) ZEROFILL NOT NULL,
  `no_training` INT(4) NULL,
  `longevity` INT(4) NULL,
  PRIMARY KEY (`salesrep_id`, `monthyear_id`),
  INDEX `FK08_002_idx` (`monthyear_id` ASC) VISIBLE,
  CONSTRAINT `FK08_001`
    FOREIGN KEY (`salesrep_id`)
    REFERENCES `ISINFO-003`.`DIM_SALESREP` (`salesrep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK08_002`
    FOREIGN KEY (`monthyear_id`)
    REFERENCES `ISINFO-003`.`DIM_MONTHYEAR` (`monthyear_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `ISINFO-003`.`REFORDERSTATUS`
-- -----------------------------------------------------
START TRANSACTION;
USE `ISINFO-003`;
INSERT INTO `ISINFO-003`.`REFORDERSTATUS` (`orderstatus_id`, `orderstatus_desc`) VALUES (1, 'Pending');
INSERT INTO `ISINFO-003`.`REFORDERSTATUS` (`orderstatus_id`, `orderstatus_desc`) VALUES (2, 'Complete');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ISINFO-003`.`DIM_ORDERSTATUS`
-- -----------------------------------------------------
START TRANSACTION;
USE `ISINFO-003`;
INSERT INTO `ISINFO-003`.`DIM_ORDERSTATUS` (`orderstatus_id`) VALUES (1);
INSERT INTO `ISINFO-003`.`DIM_ORDERSTATUS` (`orderstatus_id`) VALUES (2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ISINFO-003`.`DIM_QUARTER`
-- -----------------------------------------------------
START TRANSACTION;
USE `ISINFO-003`;
INSERT INTO `ISINFO-003`.`DIM_QUARTER` (`quarter_id`) VALUES (1);
INSERT INTO `ISINFO-003`.`DIM_QUARTER` (`quarter_id`) VALUES (2);
INSERT INTO `ISINFO-003`.`DIM_QUARTER` (`quarter_id`) VALUES (3);
INSERT INTO `ISINFO-003`.`DIM_QUARTER` (`quarter_id`) VALUES (4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ISINFO-003`.`DIM_MONTH`
-- -----------------------------------------------------
START TRANSACTION;
USE `ISINFO-003`;
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (1, 'January', 1);
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (2, 'February', 1);
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (3, 'March', 1);
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (4, 'April', 2);
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (5, 'May', 2);
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (6, 'June', 2);
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (7, 'July', 3);
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (8, 'August', 3);
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (9, 'September', 3);
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (10, 'October', 4);
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (11, 'November', 4);
INSERT INTO `ISINFO-003`.`DIM_MONTH` (`month_id`, `month_desc`, `quarter_id`) VALUES (12, 'December', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ISINFO-003`.`DIM_SALETYPE`
-- -----------------------------------------------------
START TRANSACTION;
USE `ISINFO-003`;
INSERT INTO `ISINFO-003`.`DIM_SALETYPE` (`saletype_id`, `saletype_desc`) VALUES (0, 'Order');
INSERT INTO `ISINFO-003`.`DIM_SALETYPE` (`saletype_id`, `saletype_desc`) VALUES (1, 'Service');

COMMIT;

