-- credentials and database name should be changes for production instances
-- this following scripts should be run separately from the DB table and DATA scripts as ROOT

create database personalrolodex default character set utf8 default collate utf8_general_ci;
create user personalrolodex;
grant all on personalrolodex.* to personalrolodex@localhost identified by 'personalrolodex';



--  tables and database scripts
--  should be run as the user created from the above step

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "-05:00";
SET names utf8;

--
-- Table structure for table `users`
--
CREATE TABLE IF NOT EXISTS users (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11)  DEFAULT 0,
  `email` varchar(128)  DEFAULT NULL,
  `password` varchar(128)  DEFAULT NULL,
  `Company` varchar(64) DEFAULT NULL,
  `FirstName` varchar(64) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Address1` varchar(64) DEFAULT NULL,
  `Address2` varchar(64) DEFAULT NULL,
  `City` varchar(64) DEFAULT NULL,
  `Province` varchar(64) DEFAULT NULL,
  `Postal` varchar(16) DEFAULT NULL,
  `AccountType` char(1) DEFAULT,
  `LastLoginDt` timestamp DEFAULT '0000-00-00 00:00:00',
  `CreateDt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` varchar(32) DEFAULT NULL,
  `UpdateDt` timestamp '0000-00-00 00:00:00',
  `UpdateBy` varchar(32) DEFAULT NULL,
  PRIMARY KEY ('uid'),
  KEY `onEmail` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

INSERT INTO `users` (`uid`, `rid`, `email`, `password`) VALUES
(1, 1, 'nic@285solutions.com', '6b7650c2bf078561af2489fb5dfbaf47');

--
-- Table structure for table `roles`
--
CREATE TABLE IF NOT EXISTS `roles` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(32)  DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

INSERT INTO roles ('rid','Description') VALUES
(1, 'Admin'),
(2, 'User');

--
-- Table structure for table `images`
--
CREATE TABLE IF NOT EXISTS `rolodex` (
  `roid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT 0,
  `Company` varchar(64) DEFAULT NULL,
  `Address1` varchar(64)  DEFAULT NULL,
  `Address2` varchar(64)  DEFAULT NULL,
  `City` varchar(64)  DEFAULT NULL,
  `Province` varchar(64)  DEFAULT NULL,
  `Postal` varchar(16)  DEFAULT NULL,
  `Email` varchar(128)  DEFAULT NULL,
  `Phone` varchar(32)  DEFAULT NULL,
  `Fax` varchar(32)  DEFAULT NULL,
  `Mobile` varchar(32)  DEFAULT NULL,
  `Salutation` varchar(16) DEFAULT NULL,
  `FirstName` varchar(64) DEFAULT NULL,
  `MiddleName` varchar(64) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Title` varchar(64) DEFAULT NULL,
  `FIMG_Path` varchar(256) DEFAULT NULL,
  `FIMG_URL` varchar(256) DEFAULT NULL,
  `BIMG_Path` varchar(256) DEFAULT NULL,
  `BIMG_URL` varchar(256) DEFAULT NULL,
  `CreateDt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` varchar(32) DEFAULT NULL,
  `UpdateDt` timestamp DEFAULT '0000-00-00 00:00:00',
  `UpdateBy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`roid`),
  KEY `on_uid` (`uid`),
  key 'on_company' ('company'),
  key 'on_lastname' ('lastname')
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;