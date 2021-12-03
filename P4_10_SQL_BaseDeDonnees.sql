-- MySQL Script generated by MySQL Workbench
-- Thu Nov 25 12:02:03 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ExpressFood
-- -----------------------------------------------------
-- Base de données ExpressFood - livraison de plat de qualité à domicile
DROP SCHEMA IF EXISTS `ExpressFood` ;

-- -----------------------------------------------------
-- Schema ExpressFood
--
-- Base de données ExpressFood - livraison de plat de qualité à domicile
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ExpressFood` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `ExpressFood` ;

-- -----------------------------------------------------
-- Table `ExpressFood`.`utilisateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ExpressFood`.`utilisateur` ;

CREATE TABLE IF NOT EXISTS `ExpressFood`.`utilisateur` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(40) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(40) NULL,
  `nom` VARCHAR(40) NULL,
  `prenom` VARCHAR(40) NULL,
  `telephone` VARCHAR(15) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `login_UNIQUE` ON `ExpressFood`.`utilisateur` (`login` ASC);

CREATE UNIQUE INDEX `email_UNIQUE` ON `ExpressFood`.`utilisateur` (`email` ASC);


-- -----------------------------------------------------
-- Table `ExpressFood`.`gestionnaire`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ExpressFood`.`gestionnaire` ;

CREATE TABLE IF NOT EXISTS `ExpressFood`.`gestionnaire` (
  `utilisateur_id` INT NOT NULL AUTO_INCREMENT,
  `fonction` VARCHAR(40) NULL,
  PRIMARY KEY (`utilisateur_id`),
  CONSTRAINT `fk_gestionnaire_utilisateur1`
    FOREIGN KEY (`utilisateur_id`)
    REFERENCES `ExpressFood`.`utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_gestionnaire_utilisateur1_idx` ON `ExpressFood`.`gestionnaire` (`utilisateur_id` ASC);


-- -----------------------------------------------------
-- Table `ExpressFood`.`livreur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ExpressFood`.`livreur` ;

CREATE TABLE IF NOT EXISTS `ExpressFood`.`livreur` (
  `utilisateur_id` INT NOT NULL AUTO_INCREMENT,
  `statut_disponibilite` ENUM("libre", "reapprovisionnement", "en_cours_livraison", "indisponible") NULL DEFAULT 'indisponible',
  `latitude` DECIMAL(10,7) NULL,
  `longitude` DECIMAL(10,7) NULL,
  `quantite_stock_livreur` INT NULL,
  PRIMARY KEY (`utilisateur_id`),
  CONSTRAINT `fk_livreur_utilisateur1`
    FOREIGN KEY (`utilisateur_id`)
    REFERENCES `ExpressFood`.`utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_livreur_utilisateur1_idx` ON `ExpressFood`.`livreur` (`utilisateur_id` ASC);


-- -----------------------------------------------------
-- Table `ExpressFood`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ExpressFood`.`client` ;

CREATE TABLE IF NOT EXISTS `ExpressFood`.`client` (
  `utilisateur_id` INT NOT NULL AUTO_INCREMENT,
  `adresse_facturation` VARCHAR(70) NULL,
  `complement_adresse_facturation` VARCHAR(70) NULL,
  `code_postal_facturation` VARCHAR(6) NULL,
  `ville_facturation` VARCHAR(40) NULL,
  PRIMARY KEY (`utilisateur_id`),
  CONSTRAINT `fk_client_utilisateur1`
    FOREIGN KEY (`utilisateur_id`)
    REFERENCES `ExpressFood`.`utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_client_utilisateur1_idx` ON `ExpressFood`.`client` (`utilisateur_id` ASC);


-- -----------------------------------------------------
-- Table `ExpressFood`.`categorie_plat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ExpressFood`.`categorie_plat` ;

CREATE TABLE IF NOT EXISTS `ExpressFood`.`categorie_plat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `libelle_categorie_plat` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExpressFood`.`plat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ExpressFood`.`plat` ;

CREATE TABLE IF NOT EXISTS `ExpressFood`.`plat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom_plat` VARCHAR(40) NULL,
  `date_creation_plat` DATETIME NULL,
  `description_plat` MEDIUMTEXT NULL,
  `photo_plat` VARCHAR(255) NULL,
  `gestionnaire_utilisateur_id` INT NOT NULL,
  `categorie_plat_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Plat_gestionnaire1`
    FOREIGN KEY (`gestionnaire_utilisateur_id`)
    REFERENCES `ExpressFood`.`gestionnaire` (`utilisateur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plat_categorie_plat1`
    FOREIGN KEY (`categorie_plat_id`)
    REFERENCES `ExpressFood`.`categorie_plat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_plat_gestionnaire1_idx` ON `ExpressFood`.`plat` (`gestionnaire_utilisateur_id` ASC);

CREATE INDEX `fk_plat_categorie_plat1_idx` ON `ExpressFood`.`plat` (`categorie_plat_id` ASC);


-- -----------------------------------------------------
-- Table `ExpressFood`.`plat_du_jour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ExpressFood`.`plat_du_jour` ;

CREATE TABLE IF NOT EXISTS `ExpressFood`.`plat_du_jour` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_publication_plat_du_jour` DATE NULL,
  `prix_unitaire_plat_du_jour` DECIMAL(5,2) NULL,
  `quantite_stock` INT NULL,
  `plat_id` INT NOT NULL,
  `gestionnaire_utilisateur_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_plat_du_jour_plat1`
    FOREIGN KEY (`plat_id`)
    REFERENCES `ExpressFood`.`plat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plat_du_jour_gestionnaire1`
    FOREIGN KEY (`gestionnaire_utilisateur_id`)
    REFERENCES `ExpressFood`.`gestionnaire` (`utilisateur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_plat_du_jour_plat1_idx` ON `ExpressFood`.`plat_du_jour` (`plat_id` ASC);

CREATE INDEX `fk_plat_du_jour_gestionnaire1_idx` ON `ExpressFood`.`plat_du_jour` (`gestionnaire_utilisateur_id` ASC);


-- -----------------------------------------------------
-- Table `ExpressFood`.`adresse_livraison`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ExpressFood`.`adresse_livraison` ;

CREATE TABLE IF NOT EXISTS `ExpressFood`.`adresse_livraison` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `adresse` VARCHAR(70) NULL,
  `complement_adresse` VARCHAR(70) NULL,
  `code_postal` VARCHAR(6) NULL,
  `ville` VARCHAR(40) NULL,
  `client_utilisateur_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_adresse_livraison_client1`
    FOREIGN KEY (`client_utilisateur_id`)
    REFERENCES `ExpressFood`.`client` (`utilisateur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_adresse_livraison_client1_idx` ON `ExpressFood`.`adresse_livraison` (`client_utilisateur_id` ASC);


-- -----------------------------------------------------
-- Table `ExpressFood`.`commande`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ExpressFood`.`commande` ;

CREATE TABLE IF NOT EXISTS `ExpressFood`.`commande` (
  `numero_commande` INT NOT NULL AUTO_INCREMENT,
  `date_commande` DATETIME NULL,
  `statut_commande` ENUM("Payée", "En attente", "Annulée") NULL DEFAULT 'En attente',
  `date_livraison` DATETIME NULL,
  `date_estimation_livraison` DATETIME NULL,
  `statut_livraison` ENUM("En attente", "Pris en charge", "Livré", "Annulée") NULL DEFAULT 'En attente',
  `livreur_utilisateur_id` INT NULL,
  `client_utilisateur_id` INT NOT NULL,
  `adresse_livraison_id` INT NULL,
  PRIMARY KEY (`numero_commande`),
  CONSTRAINT `fk_commande_livreur1`
    FOREIGN KEY (`livreur_utilisateur_id`)
    REFERENCES `ExpressFood`.`livreur` (`utilisateur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commande_client1`
    FOREIGN KEY (`client_utilisateur_id`)
    REFERENCES `ExpressFood`.`client` (`utilisateur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commande_adresse_livraison1`
    FOREIGN KEY (`adresse_livraison_id`)
    REFERENCES `ExpressFood`.`adresse_livraison` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';

CREATE INDEX `fk_commande_livreur1_idx` ON `ExpressFood`.`commande` (`livreur_utilisateur_id` ASC);

CREATE INDEX `fk_commande_client1_idx` ON `ExpressFood`.`commande` (`client_utilisateur_id` ASC);

CREATE INDEX `fk_commande_adresse_livraison1_idx` ON `ExpressFood`.`commande` (`adresse_livraison_id` ASC);


-- -----------------------------------------------------
-- Table `ExpressFood`.`plat_du_jour_commande`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ExpressFood`.`plat_du_jour_commande` ;

CREATE TABLE IF NOT EXISTS `ExpressFood`.`plat_du_jour_commande` (
  `plat_du_jour_id` INT NOT NULL,
  `commande_numero_commande` INT NOT NULL,
  `quantite_commande` INT NULL,
  PRIMARY KEY (`plat_du_jour_id`, `commande_numero_commande`),
  CONSTRAINT `fk_plat_du_jour_commande_plat_du_jour1`
    FOREIGN KEY (`plat_du_jour_id`)
    REFERENCES `ExpressFood`.`plat_du_jour` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plat_du_jour_commande_commande1`
    FOREIGN KEY (`commande_numero_commande`)
    REFERENCES `ExpressFood`.`commande` (`numero_commande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_plat_du_jour_commande_commande1_idx` ON `ExpressFood`.`plat_du_jour_commande` (`commande_numero_commande` ASC);

CREATE INDEX `fk_plat_du_jour_commande_plat_du_jour1_idx` ON `ExpressFood`.`plat_du_jour_commande` (`plat_du_jour_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;