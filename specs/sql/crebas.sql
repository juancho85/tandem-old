SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`user` (
  `userId` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(60) NULL ,
  `lastname` VARCHAR(60) NULL ,
  `birthdate` DATE NULL ,
  `gender` VARCHAR(2) NULL ,
  PRIMARY KEY (`userId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`avatar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`avatar` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`avatar` (
  `avatarId` INT NOT NULL ,
  `mimeType` VARCHAR(45) NULL ,
  `fileSize` VARCHAR(45) NULL ,
  `height` DECIMAL(3,2) NULL ,
  `width` DECIMAL(3,2) NULL ,
  `path` VARCHAR(500) NULL ,
  PRIMARY KEY (`avatarId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`userToAvatar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`userToAvatar` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`userToAvatar` (
  `userId` INT NULL ,
  `avatarId` INT NULL ,
  CONSTRAINT `fk_userToAvatar_userId`
    FOREIGN KEY (`userId` )
    REFERENCES `mydb`.`user` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userToAvatar_avatarId`
    FOREIGN KEY (`avatarId` )
    REFERENCES `mydb`.`avatar` (`avatarId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `userId_idx` ON `mydb`.`userToAvatar` (`userId` ASC) ;

CREATE INDEX `avatarId_idx` ON `mydb`.`userToAvatar` (`avatarId` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`login` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`login` (
  `userId` INT NOT NULL ,
  `password` VARCHAR(500) NULL ,
  PRIMARY KEY (`userId`) ,
  CONSTRAINT `fk_login_userId`
    FOREIGN KEY (`userId` )
    REFERENCES `mydb`.`user` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`languages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`languages` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`languages` (
  `langId` INT NOT NULL ,
  `isoCode` VARCHAR(10) NULL ,
  `langNameEn` VARCHAR(45) NULL ,
  PRIMARY KEY (`langId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`langLevel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`langLevel` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`langLevel` (
  `levelId` INT NOT NULL ,
  `levelCode` VARCHAR(60) NULL ,
  PRIMARY KEY (`levelId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`userToLearnLang`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`userToLearnLang` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`userToLearnLang` (
  `userId` INT NULL ,
  `langId` INT NULL ,
  `langLevelId` INT NULL ,
  CONSTRAINT `fk_userToLearnLang_userId`
    FOREIGN KEY (`userId` )
    REFERENCES `mydb`.`user` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userToLearnLang_langId`
    FOREIGN KEY (`langId` )
    REFERENCES `mydb`.`languages` (`langId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userToLearnLang_langLevelId`
    FOREIGN KEY (`langLevelId` )
    REFERENCES `mydb`.`langLevel` (`levelId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_userToLearnLang_userId_idx` ON `mydb`.`userToLearnLang` (`userId` ASC) ;

CREATE INDEX `fk_userToLearnLang_langId_idx` ON `mydb`.`userToLearnLang` (`langId` ASC) ;

CREATE INDEX `fk_userToLearnLang_langLevelId_idx` ON `mydb`.`userToLearnLang` (`langLevelId` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`userToTeachLang`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`userToTeachLang` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`userToTeachLang` (
  `userId` INT NULL ,
  `langId` INT NULL ,
  `langLevelId` INT NULL ,
  CONSTRAINT `fk_userToTeachLang_userId`
    FOREIGN KEY (`userId` )
    REFERENCES `mydb`.`user` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userToTeachLang_langId`
    FOREIGN KEY (`langId` )
    REFERENCES `mydb`.`languages` (`langId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userToTeachLang_langLevel`
    FOREIGN KEY (`langLevelId` )
    REFERENCES `mydb`.`langLevel` (`levelId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_userToTeachLang_userId_idx` ON `mydb`.`userToTeachLang` (`userId` ASC) ;

CREATE INDEX `fk_userToTeachLang_langId_idx` ON `mydb`.`userToTeachLang` (`langId` ASC) ;

CREATE INDEX `fk_userToTeachLang_langLevel_idx` ON `mydb`.`userToTeachLang` (`langLevelId` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`availability`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`availability` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`availability` (
  `availabilityId` INT NOT NULL ,
  `userId` INT NULL ,
  `mondayMorning` BINARY NULL DEFAULT 1 ,
  `mondayAfternoon` BINARY NULL DEFAULT 1 ,
  `mondayEvening` BINARY NULL DEFAULT 1 ,
  `mondayNight` BINARY NULL DEFAULT 1 ,
  `tuesdayMorning` BINARY NULL DEFAULT 1 ,
  `tuesdayAfternoon` BINARY NULL DEFAULT 1 ,
  `tuesdayEvening` BINARY NULL DEFAULT 1 ,
  `tuesdayNight` BINARY NULL DEFAULT 1 ,
  `wednesdayMorning` BINARY NULL DEFAULT 1 ,
  `wednesdayAfternoon` BINARY NULL DEFAULT 1 ,
  `wednesdayEvening` BINARY NULL DEFAULT 1 ,
  `wednesdayNight` BINARY NULL DEFAULT 1 ,
  `thursdayMorning` BINARY NULL DEFAULT 1 ,
  `thursdayAfternoon` BINARY NULL DEFAULT 1 ,
  `thursdayEvening` BINARY NULL DEFAULT 1 ,
  `thursdayNight` BINARY NULL DEFAULT 1 ,
  `fridayMorning` BINARY NULL DEFAULT 1 ,
  `fridayAfternoon` BINARY NULL DEFAULT 1 ,
  `fridayEvening` BINARY NULL DEFAULT 1 ,
  `fridayNight` BINARY NULL DEFAULT 1 ,
  `saturdayMorning` BINARY NULL DEFAULT 1 ,
  `saturdayAfternoon` BINARY NULL DEFAULT 1 ,
  `saturdayEvening` BINARY NULL DEFAULT 1 ,
  `saturdayNight` BINARY NULL DEFAULT 1 ,
  `sundayMorning` BINARY NULL DEFAULT 1 ,
  `sundayAfternoon` BINARY NULL DEFAULT 1 ,
  `sundayEvening` BINARY NULL DEFAULT 1 ,
  `sundayNight` BINARY NULL DEFAULT 1 ,
  PRIMARY KEY (`availabilityId`) ,
  CONSTRAINT `userId`
    FOREIGN KEY (`userId` )
    REFERENCES `mydb`.`user` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `userId_idx` ON `mydb`.`availability` (`userId` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`location` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`location` (
  `locationId` INT NOT NULL ,
  `alias` VARCHAR(45) NULL ,
  `latitude` DECIMAL(10,5) NULL ,
  `longitude` DECIMAL(10,5) NULL ,
  PRIMARY KEY (`locationId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`userToLocation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`userToLocation` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`userToLocation` (
  `userId` INT NULL ,
  `locationId` INT NULL ,
  CONSTRAINT `fk_userToLocation_userId`
    FOREIGN KEY (`userId` )
    REFERENCES `mydb`.`user` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userToLocation_locationId`
    FOREIGN KEY (`locationId` )
    REFERENCES `mydb`.`location` (`locationId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_userToLocation_userId_idx` ON `mydb`.`userToLocation` (`userId` ASC) ;

CREATE INDEX `fk_userToLocation_locationId_idx` ON `mydb`.`userToLocation` (`locationId` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`userRelationship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`userRelationship` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`userRelationship` (
  `userId1` INT NULL ,
  `userId2` INT NULL ,
  CONSTRAINT `fk_userRelationship_userId1`
    FOREIGN KEY (`userId1` )
    REFERENCES `mydb`.`user` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userRelationship_userId2`
    FOREIGN KEY (`userId2` )
    REFERENCES `mydb`.`user` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_userRelationship_userId1_idx` ON `mydb`.`userRelationship` (`userId1` ASC) ;

CREATE INDEX `fk_userRelationship_userId2_idx` ON `mydb`.`userRelationship` (`userId2` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Notification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Notification` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Notification` (
  `notificationId` INT NOT NULL ,
  `creationDate` DATE NULL ,
  `userIdFrom` INT NULL ,
  `userIdTo` INT NULL ,
  `subject` VARCHAR(100) NULL ,
  `message` VARCHAR(3000) NULL ,
  PRIMARY KEY (`notificationId`) ,
  CONSTRAINT `fk_notification_userIdFrom`
    FOREIGN KEY (`userIdFrom` )
    REFERENCES `mydb`.`user` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notification_userIdTo`
    FOREIGN KEY (`userIdTo` )
    REFERENCES `mydb`.`user` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_notification_userIdFrom_idx` ON `mydb`.`Notification` (`userIdFrom` ASC) ;

CREATE INDEX `fk_notification_userIdTo_idx` ON `mydb`.`Notification` (`userIdTo` ASC) ;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
