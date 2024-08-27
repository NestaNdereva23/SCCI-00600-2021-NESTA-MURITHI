/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - movies
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movies` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `movies`;

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `countries` */

insert  into `countries`(`countryid`,`countryname`) values 
(1,'United States of America');

/*Table structure for table `moviecategories` */

DROP TABLE IF EXISTS `moviecategories`;

CREATE TABLE `moviecategories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviecategories` */

insert  into `moviecategories`(`categoryid`,`categoryname`,`description`,`dateadded`,`addedby`,`deleted`,`datedeleted`,`deletedby`) values 
(1,'Action','Motion pictures with a lot of action','2024-07-24 08:46:48',1,0,NULL,NULL),
(2,'Drama','Motion pictures based on real life events and captivating','2024-07-24 08:50:56',1,0,NULL,NULL),
(3,'Comedy','Motion pictures that are funny, updated!','2024-07-24 08:51:10',1,1,'2024-07-24 08:54:10',1),
(4,'True Story','','2024-07-24 11:12:08',1,1,'2024-07-24 11:24:55',1),
(5,'Animation','Catoons and animated pictures','2024-07-24 11:13:44',1,0,NULL,NULL);

/*Table structure for table `moviestars` */

DROP TABLE IF EXISTS `moviestars`;

CREATE TABLE `moviestars` (
  `starid` int(11) NOT NULL AUTO_INCREMENT,
  `referenceno` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mugshot` varchar(50) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`starid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviestars` */

insert  into `moviestars`(`starid`,`referenceno`,`firstname`,`middlename`,`lastname`,`gender`,`dob`,`mugshot`,`nationality`,`dateadded`,`addedby`,`deleted`,`datedeleted`,`deletedby`) values 
(1,'HOL001','Tobey','Maguire','','Male','1979-01-01','',1,'2024-07-24 09:17:07',1,0,NULL,NULL),
(2,'HOL002','Jeremy','Irons','','Male','1979-01-01','',1,'2024-07-24 09:17:46',1,1,'2024-07-24 09:23:03',1),
(3,'HOL003','Nicholas','Cage','','Male','1979-01-01','',1,'2024-07-24 09:17:57',1,0,NULL,NULL),
(4,'HOL003','Kirsten','Dunst','','Female','1983-06-10','',1,'2024-07-24 09:18:26',1,0,NULL,NULL);

/*Table structure for table `movietitles` */

DROP TABLE IF EXISTS `movietitles`;

CREATE TABLE `movietitles` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `movietitle` varchar(60) DEFAULT NULL,
  `director` varchar(50) DEFAULT NULL,
  `releaseyear` int(11) DEFAULT NULL,
  `rating` decimal(5,2) DEFAULT NULL,
  `synopsis` varchar(50) DEFAULT NULL,
  `dateadded` date DEFAULT NULL,
  `moviestatus` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`moviestatus` in ('upcoming','released','cancelled'))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movietitles` */

insert  into `movietitles`(`movieid`,`movietitle`,`director`,`releaseyear`,`rating`,`synopsis`,`dateadded`,`moviestatus`,`deleted`,`addedby`) values 
(1,'The pelikan Brief','Donald Magnum',2010,5.20,'A trial of an army soldier ','2010-01-05','released',0,1),
(2,'Spiderman','Sam Raimi',2002,9.80,'A yoiung man gets stung by a spider and gains supe','2024-06-05','released',0,2),
(3,'Bruce Almighty','Delroy Lindo',1998,7.50,'A man blames God fo all his misfortunes until God ','2024-06-05','released',0,NULL),
(4,'Exit Wounds','Stephen Seagull',1998,9.50,'A man blames God fo all his misfortunes until God ','2024-06-05','released',0,2);

/*Table structure for table `productioncompanies` */

DROP TABLE IF EXISTS `productioncompanies`;

CREATE TABLE `productioncompanies` (
  `companyid` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(50) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productioncompanies` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `middlname` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `systemadmin` tinyint(1) DEFAULT 0,
  `dateadded` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `accountactive` tinyint(1) DEFAULT 1,
  `reasondeactivated` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`userid`,`username`,`firstname`,`lastname`,`middlname`,`password`,`salt`,`systemadmin`,`dateadded`,`addedby`,`accountactive`,`reasondeactivated`) values 
(1,'admin','system','administrator','',NULL,NULL,0,NULL,NULL,1,NULL),
(2,'support','user','support',NULL,NULL,NULL,0,NULL,NULL,1,NULL),
(3,'richard','Richard','Akello',NULL,NULL,NULL,0,NULL,NULL,1,NULL),
(4,'robert','Robert','Marley',NULL,NULL,NULL,0,NULL,NULL,1,NULL),
(5,'richard','Richard','Akello',NULL,NULL,NULL,0,NULL,NULL,1,NULL),
(6,'richard1','Richard','Akello',NULL,NULL,NULL,0,NULL,NULL,1,NULL);

/* Procedure structure for procedure `sp_checkmoviecategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkmoviecategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkmoviecategory`($categoryid int,$categoryname varchar(50))
BEGIN
		select * 
		from `moviecategories`
		where `categoryid`!=$categoryid and `categoryname`=$categoryname
		and `deleted`=0;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkmoviestar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkmoviestar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkmoviestar`($starid int,$referenceno varchar(50))
BEGIN
		select * 
		from `moviestars`
		where `starid`!=$starid and `referenceno`=$referenceno;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletemoviecategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletemoviecategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletemoviecategory`($categoryid int,$userid int)
BEGIN
		update `moviecategories`
		set `deleted`=1,`datedeleted`=now(),`deletedby`=$userid
		where `categoryid`=$categoryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletemoviestar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletemoviestar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletemoviestar`($starid int,$userid int)
BEGIN
		update `moviestars`
		set `deleted`=1,`datedeleted`=now(),`deletedby`=$userid
		where `starid`=$starid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getmoviecategories` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getmoviecategories` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getmoviecategories`()
BEGIN
		select c.*,concat(`firstname`,' ',`middlname`,' ',`lastname`) addedbyname
		from `moviecategories` c 
		join `users` s on s.`userid`=c.`addedby`
		where `deleted`=0
		order by `categoryname`;
		
		/*SELECT c.*,CONCAT(`firstname`,' ',`middlname`,' ',`lastname`) addedby
		FROM `moviecategories` c ,`users` s
		where s.`userid`=c.`addedby`*/
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getmoviecategorydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getmoviecategorydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getmoviecategorydetails`($categoryid int)
BEGIN
		select * 
		from `moviecategories`
		where `categoryid`=$categoryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getmoviestardetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getmoviestardetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getmoviestardetails`($starid int)
BEGIN
		select * 
		from `moviestars`
		where `starid`=$starid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getmoviestars` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getmoviestars` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getmoviestars`()
BEGIN
		select s.*, countryname,concat(u.`firstname`,' ',u.`middlname`,' ',u.`lastname`) addedbyname
		from `moviestars` s
		join `users` u on u.userid=s.addedby
		join `countries` c on c.countryid=s.nationality
		where s.deleted=0
		order by `firstname`,`middlename`,`lastname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savemoviecategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savemoviecategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savemoviecategory`($categoryid int,$categoryname varchar(50),$categorydescription varchar(1000),$userid int)
BEGIN
		if $categoryid=0 then 
			insert into `moviecategories`(`categoryname`,`description`,`dateadded`,`addedby`)
			values($categoryname,$categorydescription,now(),$userid);
		else
			update `moviecategories`
			set `categoryname`=$categoryname, `description`=$categorydescription
			where `categoryid`=$categoryid;
		end if;	
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savemoviestar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savemoviestar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savemoviestar`($starid int,$referenceno varchar(50),$firstname varchar(50),$middlename varchar(50),$lastname varchar(50),
	$gender varchar(50),$dob date,$mugshot varchar(1000),$nationality int,$userid int)
BEGIN
		if $starid=0 then
			insert into `moviestars`(`referenceno`,`firstname`,`middlename`,`lastname`,`gender`,`dob`,
			`mugshot`,`nationality`,`dateadded`,`addedby`)
			values($referenceno,$firstname,$middlename,$lastname,$gender,$dob,
			$mugshot,$nationality,now(),$userid);
		else
			update `moviestars`
			set `referenceno`=$referenceno,`firstname`=$firstname,`middlename`=$middlename,`lastname`=$lastname,
			`gender`=$gender,`dob`=$dob,`nationality`=$nationality
			where `starid`=$starid;
		end if;
	END */$$
DELIMITER ;

/*Table structure for table `vwmovietitleswithusers` */

DROP TABLE IF EXISTS `vwmovietitleswithusers`;

/*!50001 DROP VIEW IF EXISTS `vwmovietitleswithusers` */;
/*!50001 DROP TABLE IF EXISTS `vwmovietitleswithusers` */;

/*!50001 CREATE TABLE  `vwmovietitleswithusers`(
 `movieid` int(11) ,
 `movietitle` varchar(60) ,
 `director` varchar(50) ,
 `releaseyear` int(11) ,
 `rating` decimal(5,2) ,
 `synopsis` varchar(50) ,
 `dateadded` date ,
 `moviestatus` varchar(50) ,
 `deleted` tinyint(1) ,
 `addedby` int(11) ,
 `addedbyname` varchar(101) 
)*/;

/*View structure for view vwmovietitleswithusers */

/*!50001 DROP TABLE IF EXISTS `vwmovietitleswithusers` */;
/*!50001 DROP VIEW IF EXISTS `vwmovietitleswithusers` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwmovietitleswithusers` AS (select `m`.`movieid` AS `movieid`,`m`.`movietitle` AS `movietitle`,`m`.`director` AS `director`,`m`.`releaseyear` AS `releaseyear`,`m`.`rating` AS `rating`,`m`.`synopsis` AS `synopsis`,`m`.`dateadded` AS `dateadded`,`m`.`moviestatus` AS `moviestatus`,`m`.`deleted` AS `deleted`,`m`.`addedby` AS `addedby`,ifnull(concat(`u`.`firstname`,' ',`u`.`lastname`),'<Unavailable>') AS `addedbyname` from (`movietitles` `m` left join `users` `u` on(`u`.`userid` = `m`.`addedby`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
