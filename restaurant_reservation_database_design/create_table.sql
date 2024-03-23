-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restaurant_reservation
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restaurant_reservation
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurant_reservation` DEFAULT CHARACTER SET utf8 ;
USE `restaurant_reservation` ;

-- -----------------------------------------------------
-- Table `restaurant_reservation`.`Menu Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_reservation`.`Menu Table` (
  `id_menu` INT NOT NULL,
  `menu_name` VARCHAR(45) NULL,
  `description` TEXT(120) NULL,
  `price` FLOAT NULL,
  PRIMARY KEY (`id_menu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_reservation`.`Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_reservation`.`Table` (
  `idTable` INT NOT NULL,
  `table_number` INT NULL,
  `table_capacity` INT NULL,
  `table_status` ENUM('available', 'reserved', 'occupied') NULL,
  PRIMARY KEY (`idTable`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_reservation`.`Customer Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_reservation`.`Customer Table` (
  `idCustomer` INT NOT NULL,
  `customer_name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_reservation`.`Reservation Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_reservation`.`Reservation Table` (
  `id_reservation` INT NOT NULL,
  `id_customer` INT NULL,
  `id_table` INT NULL,
  `reservation_date` DATETIME NULL,
  `reservation_status` ENUM('reserved', 'prepared', 'completed') NULL,
  PRIMARY KEY (`id_reservation`),
  INDEX `id_customer_idx` (`id_customer` ASC) VISIBLE,
  INDEX `id_table_idx` (`id_table` ASC) VISIBLE,
  CONSTRAINT `id_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `restaurant_reservation`.`Customer Table` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_table`
    FOREIGN KEY (`id_table`)
    REFERENCES `restaurant_reservation`.`Table` (`idTable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_reservation`.`Order Detail Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_reservation`.`Order Detail Table` (
  `id_order_detail` INT NOT NULL,
  `id_reservation` INT NULL,
  `id_menu` INT NULL,
  `quantity` INT NULL,
  `unit_price` DECIMAL(8,2) NULL,
  `subtotal` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_order_detail`),
  INDEX `id_reservation_idx` (`id_reservation` ASC) VISIBLE,
  INDEX `id_menu_idx` (`id_menu` ASC) VISIBLE,
  CONSTRAINT `id_reservation`
    FOREIGN KEY (`id_reservation`)
    REFERENCES `restaurant_reservation`.`Reservation Table` (`id_reservation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_menu`
    FOREIGN KEY (`id_menu`)
    REFERENCES `restaurant_reservation`.`Menu Table` (`id_menu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Update unit_price and subtotal for records where id_reservation is 1
UPDATE `restaurant_reservation`.`Order Detail Table`
SET `unit_price` = 10, `subtotal` = 8
WHERE `id_reservation` = 1;


-- -----------------------------------------------------
-- Table `restaurant_reservation`.`Employee Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_reservation`.`Employee Table` (
  `id_employee` INT NOT NULL,
  `employee_name` VARCHAR(100) NULL,
  `position` VARCHAR(50) NULL,
  PRIMARY KEY (`id_employee`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
