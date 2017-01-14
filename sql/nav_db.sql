DROP DATABASE IF EXISTS `waze2`;
CREATE DATABASE `waze2`;
USE `waze2`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: nav_db
-- ------------------------------------------------------
-- Server version	5.7.9-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alerte_utilisateur`
--

DROP TABLE IF EXISTS `alerte_utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerte_utilisateur` (
  `alertes_iDalertes` int(11) NOT NULL AUTO_INCREMENT,
  `date_alerte` datetime NOT NULL,
  `utilisateur_iDutilisateur` int(11) NOT NULL,
  PRIMARY KEY (`alertes_iDalertes`,`utilisateur_iDutilisateur`,`date_alerte`),
  KEY `fk_alerte_utilisateur_alertes_idx` (`alertes_iDalertes`),
  KEY `fk_alerte_utilisateur_utilisateur1_idx` (`utilisateur_iDutilisateur`),
  CONSTRAINT `fk_alerte_utilisateur_utilisateur1` FOREIGN KEY (`utilisateur_iDutilisateur`) REFERENCES `utilisateur` (`iDutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerte_utilisateur`
--

LOCK TABLES `alerte_utilisateur` WRITE;
/*!40000 ALTER TABLE `alerte_utilisateur` DISABLE KEYS */;
INSERT INTO `alerte_utilisateur` (`alertes_iDalertes`, `date_alerte`, `utilisateur_iDutilisateur`) VALUES (1,'2016-10-11 16:05:14',1);
/*!40000 ALTER TABLE `alerte_utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alertes`
--

DROP TABLE IF EXISTS `alertes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alertes` (
  `iDalertes` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `nombre_notification` int(11) DEFAULT NULL,
  `date_alerte` datetime DEFAULT NULL,
  `type_alerte_iDtype_alerte` int(11) NOT NULL,
  PRIMARY KEY (`iDalertes`),
  KEY `fk_alertes_type_alerte1_idx` (`type_alerte_iDtype_alerte`),
  CONSTRAINT `fk_alertes_type_alerte1` FOREIGN KEY (`type_alerte_iDtype_alerte`) REFERENCES `type_alerte` (`iDtype_alerte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertes`
--

LOCK TABLES `alertes` WRITE;
/*!40000 ALTER TABLE `alertes` DISABLE KEYS */;
INSERT INTO `alertes` (`iDalertes`, `longitude`, `latitude`, `nombre_notification`, `type_alerte_iDtype_alerte`) VALUES (1,1.51716,43.5344,1,2);
/*!40000 ALTER TABLE `alertes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_alerte`
--

DROP TABLE IF EXISTS `type_alerte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_alerte` (
  `iDtype_alerte` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iDtype_alerte`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_alerte`
--

LOCK TABLES `type_alerte` WRITE;
/*!40000 ALTER TABLE `type_alerte` DISABLE KEYS */;
INSERT INTO `type_alerte` (`iDtype_alerte`, `nom`, `icon`) VALUES (1,'Accident','accident.png'),(2,'Bouchon','bouchon.png'),(3,'Radar','radar.png'),(4,'Police','police.png'),(5,'Travaux','travaux.png');
/*!40000 ALTER TABLE `type_alerte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `iDutilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mdp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iDutilisateur`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` (`iDutilisateur`, `nom`, `prenom`, `email`, `mdp`) VALUES (1,'Mboumba','Frane','frane@gmail.fr','user1'),(2,'Dumont','Jean','jean@gmail.fr','user2'),(3,'Dumas','arnaud','arnaud@gmail.com','bienvu'),(10,'Thomas','yann','yann@gmail.com','user4'),(11,'test','test','a','a');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'nav_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `getConUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,ALLOW_INVALID_DATES,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`waze2`@`localhost` PROCEDURE `getConUser`(
IN email_user varchar(50), mdp_user varchar(50),
OUT msg varchar (255) 
)
BEGIN
select utilisateur.email, utilisateur.mdp 
from utilisateur
where utilisateur.email = email_user and
mdp = mdp_user;


 if (select found_rows() )> 0 then
set msg ='ok';

else

set msg = 'ko' ;
end if;

/*A tester
if emailSaisi = email_user  && mdp_user != mdpSaisi then
set msg = 'Mot de passe incorrect' ;
end if;*/

/* A tester
if email_user != emailSaisi && mdp_user = mdpSaisi then
set msg = 'E-mail incorrect';
end if;*/

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_alertArea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`waze2`@`localhost` PROCEDURE `get_alertArea`(
IN longitude_user float(25),
IN latitude_user float(25)
)
BEGIN

  delete from alertes 
  where alertes.type_alerte_iDtype_alerte = 1
  and alertes.date_alerte <= date_sub(now(), interval 2 hour);

  delete from alertes 
  where alertes.type_alerte_iDtype_alerte = 2
  and alertes.date_alerte <= date_sub(now(), interval 1 hour);

  delete from alertes 
  where alertes.type_alerte_iDtype_alerte = 4
  and alertes.date_alerte <= date_sub(now(), interval 2 hour);

  delete from alertes 
  where alertes.type_alerte_iDtype_alerte = 5
  and alertes.date_alerte <= date_sub(now(), interval 1 day);

  /* récupère les alertes déjà présente dans un rayon de 1km avec comme paramètre la long et lat
  de l'utilisateur*/
  select alertes.longitude, alertes.latitude, type_alerte.nom, type_alerte.icon
  from alertes,type_alerte
  where alertes.type_alerte_iDtype_alerte = type_alerte.iDtype_alerte
  and alertes.longitude < longitude_user + 20/76
  and alertes.longitude > longitude_user -20/76
  and alertes.latitude < latitude_user +20/111
  and alertes.latitude > latitude_user -20/111;

      
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_alerts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,ALLOW_INVALID_DATES,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`waze2`@`localhost` PROCEDURE `get_alerts`()
BEGIN
select * from type_alerte;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_alerts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`waze2`@`localhost` PROCEDURE `insertAlert_area`(
IN longitude_user float(35),
IN latitude_user float(35),
IN email_user varchar(35),
IN id_typeAlert int(6),
OUT idAlert_user int(6),
OUT id_user int(6),
OUT msg varchar(55)
)
BEGIN


Select iDutilisateur into id_user from utilisateur where email = email_user;


    select  iDalertes 
    into idAlert_user
    from alertes
    where longitude< longitude_user + 1 /76 
    and longitude > longitude_user -1/76 
    and latitude < latitude_user +1 / 111
    and latitude > latitude_user -1/111
    and type_alerte_iDtype_alerte = id_typeAlert;

      if (select found_rows() )> 0 then

        Update alertes set nombre_notification = nombre_notification +1,
               date_alerte = CURRENT_TIMESTAMP
               where iDalertes =idAlert_user;

      else 
        
        Insert INTO alertes
                (longitude, latitude,nombre_notification,date_alerte,type_alerte_iDtype_alerte)
        Values (longitude_user,latitude_user,1,CURRENT_TIMESTAMP, id_typeAlert);

      end if;

    Insert INTO alerte_utilisateur
    (alertes_iDalertes, date_alerte, utilisateur_iDutilisateur)
    Values (idAlert_user, CURRENT_TIMESTAMP, id_user);

    if (select row_count() > 0) then
         
      set msg ='ok';

      else

      set msg = 'ko';

    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_teste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,ALLOW_INVALID_DATES,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`waze2`@`localhost` PROCEDURE `insert_user`(
IN nom_user varchar(45), 
IN prenom_user varchar(45),
IN email_user varchar(45), 
IN mdp_user varchar(45),
OUT msg varchar(255),
OUT emailRecup varchar(55)
 )
BEGIN

select utilisateur.email
into emailRecup
FROM utilisateur 
where utilisateur.email = email_user;


if emailRecup = email_user then
set msg = 'ko2';

else 

INSERT INTO utilisateur(nom, prenom, email, mdp)

VALUES (nom_user, prenom_user,email_user, mdp_user);

  if ROW_COUNT ()>0 then
    set msg = 'ok';
    else
    set msg = 'ko';
    end if;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testDeclare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
