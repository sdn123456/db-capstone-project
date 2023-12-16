-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `Customer_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Contact` VARCHAR(45) NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `Booking_ID` INT NOT NULL,
  `Date` DATE NULL,
  `table_Number` INT NULL,
  `Customer_ID` INT NULL,
  PRIMARY KEY (`Booking_ID`),
  INDEX `Customer_ID_idx` (`Customer_ID` ASC) VISIBLE,
  CONSTRAINT `Customer_ID`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `LittleLemonDB`.`Customers` (`Customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Order Delivery Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Order Delivery Status` (
  `Order_Delivery_Status_ID` INT NOT NULL,
  `Delivery _Date` DATE NULL,
  `Delivery_Status` VARCHAR(45) NULL,
  PRIMARY KEY (`Order_Delivery_Status_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `Menu_Items_ID` INT NOT NULL,
  `Courses` VARCHAR(45) NULL,
  `Starters` VARCHAR(45) NULL,
  `Drinks` VARCHAR(45) NULL,
  `Desserts` VARCHAR(45) NULL,
  PRIMARY KEY (`Menu_Items_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `Menu_ID` INT NOT NULL,
  `Cuisines` VARCHAR(45) NULL,
  `Menu_Items_ID` INT NULL,
  PRIMARY KEY (`Menu_ID`),
  INDEX `Menu_Items_ID_idx` (`Menu_Items_ID` ASC) VISIBLE,
  CONSTRAINT `Menu_Items_ID`
    FOREIGN KEY (`Menu_Items_ID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`Menu_Items_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `Staff_ID` INT NOT NULL,
  `Role` VARCHAR(45) NULL,
  `Salary` DECIMAL NULL,
  PRIMARY KEY (`Staff_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `Orders_ID` INT NOT NULL,
  `Date` DATE NULL,
  `Quantity` INT NULL,
  `Cost` DECIMAL NULL,
  `Menu_ID` INT NULL,
  `Order_Delivery_Status_ID` INT NULL,
  `Booking_ID` INT NULL,
  `Staff_ID` INT NULL,
  PRIMARY KEY (`Orders_ID`),
  INDEX `Menu_ID_idx` (`Menu_ID` ASC) VISIBLE,
  INDEX `Order_Delivery_Status_ID_idx` (`Order_Delivery_Status_ID` ASC) VISIBLE,
  INDEX `Staff_ID_idx` (`Staff_ID` ASC) VISIBLE,
  INDEX `Booking_ID_idx` (`Booking_ID` ASC) VISIBLE,
  CONSTRAINT `Menu_ID`
    FOREIGN KEY (`Menu_ID`)
    REFERENCES `LittleLemonDB`.`Menu` (`Menu_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Order_Delivery_Status_ID`
    FOREIGN KEY (`Order_Delivery_Status_ID`)
    REFERENCES `LittleLemonDB`.`Order Delivery Status` (`Order_Delivery_Status_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Staff_ID`
    FOREIGN KEY (`Staff_ID`)
    REFERENCES `LittleLemonDB`.`Staff` (`Staff_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Booking_ID`
    FOREIGN KEY (`Booking_ID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`Booking_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
