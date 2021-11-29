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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tb_usuário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_usuário` (
  `id_usuário` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `nickname` VARCHAR(45) NULL,
  `avatar` VARCHAR(45) NULL,
  `profissão` VARCHAR(45) NULL,
  PRIMARY KEY (`id_usuário`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_temas` (
  `id_temas` INT NOT NULL,
  `Culinária` VARCHAR(45) NULL,
  `Tecnologia` VARCHAR(45) NULL,
  `Economia` VARCHAR(45) NULL,
  PRIMARY KEY (`id_temas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_postagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_postagem` (
  `id_post` INT NOT NULL,
  `comentário` VARCHAR(45) NULL,
  `imagem` VARCHAR(45) NULL,
  `tb_temas_id_temas` INT NOT NULL,
  `tb_usuário_id_usuário` INT NOT NULL,
  PRIMARY KEY (`id_post`, `tb_temas_id_temas`, `tb_usuário_id_usuário`),
  INDEX `fk_tb_postagem_tb_temas_idx` (`tb_temas_id_temas` ASC) VISIBLE,
  INDEX `fk_tb_postagem_tb_usuário1_idx` (`tb_usuário_id_usuário` ASC) VISIBLE,
  CONSTRAINT `fk_tb_postagem_tb_temas`
    FOREIGN KEY (`tb_temas_id_temas`)
    REFERENCES `mydb`.`tb_temas` (`id_temas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_postagem_tb_usuário1`
    FOREIGN KEY (`tb_usuário_id_usuário`)
    REFERENCES `mydb`.`tb_usuário` (`id_usuário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
