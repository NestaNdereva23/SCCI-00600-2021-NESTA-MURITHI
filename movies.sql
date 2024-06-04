-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2024 at 03:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movies`
--

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE `directors` (
  `directorid` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `d.o.b` date NOT NULL,
  `photo` varchar(100) NOT NULL,
  `nationalityid` int(11) NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` date NOT NULL,
  `deletedby` int(11) NOT NULL,
  `dateadded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `languageid` int(11) NOT NULL,
  `languagename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `moviecast`
--

CREATE TABLE `moviecast` (
  `castid` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `starid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `roledescription` varchar(1000) NOT NULL,
  `castname` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movielanguages`
--

CREATE TABLE `movielanguages` (
  `id` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `languageid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movieratings`
--

CREATE TABLE `movieratings` (
  `ratingid` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deletedby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movieid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `releasedate` date NOT NULL,
  `runningtime` time NOT NULL,
  `synopsis` varchar(100) NOT NULL,
  `cover` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `directorid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nationalities`
--

CREATE TABLE `nationalities` (
  `nationalityid` int(11) NOT NULL,
  `nationname` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `ratingid` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `addedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

CREATE TABLE `stars` (
  `starid` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `nationalityid` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `alist` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `systemadmin` tinyint(1) NOT NULL,
  `accountactive` tinyint(1) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`directorid`),
  ADD KEY `nationalityid` (`nationalityid`,`addedby`,`deletedby`),
  ADD KEY `deletedby` (`deletedby`),
  ADD KEY `addedby` (`addedby`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`languageid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `moviecast`
--
ALTER TABLE `moviecast`
  ADD PRIMARY KEY (`castid`),
  ADD KEY `movieid` (`movieid`,`starid`,`roleid`,`addedby`,`deletedby`),
  ADD KEY `deletedby` (`deletedby`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `roleid` (`roleid`),
  ADD KEY `starid` (`starid`);

--
-- Indexes for table `movielanguages`
--
ALTER TABLE `movielanguages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addedby` (`addedby`,`deletedby`),
  ADD KEY `movieid` (`movieid`,`languageid`),
  ADD KEY `languageid` (`languageid`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `movieratings`
--
ALTER TABLE `movieratings`
  ADD PRIMARY KEY (`ratingid`),
  ADD KEY `movieid` (`movieid`,`userid`,`addedby`,`deletedby`),
  ADD KEY `userid` (`userid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `userid` (`userid`,`directorid`),
  ADD KEY `directorid` (`directorid`);

--
-- Indexes for table `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`nationalityid`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`ratingid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleid`),
  ADD KEY `addedby` (`addedby`,`deletedby`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `stars`
--
ALTER TABLE `stars`
  ADD PRIMARY KEY (`starid`),
  ADD KEY `nationalityid` (`nationalityid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `addedby` (`addedby`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `directorid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `languageid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moviecast`
--
ALTER TABLE `moviecast`
  MODIFY `castid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movielanguages`
--
ALTER TABLE `movielanguages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movieratings`
--
ALTER TABLE `movieratings`
  MODIFY `ratingid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `nationalityid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `ratingid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roleid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stars`
--
ALTER TABLE `stars`
  MODIFY `starid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `directors`
--
ALTER TABLE `directors`
  ADD CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`nationalityid`) REFERENCES `nationalities` (`nationalityid`),
  ADD CONSTRAINT `directors_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `directors_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `languages_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `moviecast`
--
ALTER TABLE `moviecast`
  ADD CONSTRAINT `moviecast_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `moviecast_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `moviecast_ibfk_3` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `moviecast_ibfk_4` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`),
  ADD CONSTRAINT `moviecast_ibfk_5` FOREIGN KEY (`starid`) REFERENCES `stars` (`starid`);

--
-- Constraints for table `movielanguages`
--
ALTER TABLE `movielanguages`
  ADD CONSTRAINT `movielanguages_ibfk_1` FOREIGN KEY (`languageid`) REFERENCES `languages` (`languageid`),
  ADD CONSTRAINT `movielanguages_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movielanguages_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `movieratings`
--
ALTER TABLE `movieratings`
  ADD CONSTRAINT `movieratings_ibfk_1` FOREIGN KEY (`ratingid`) REFERENCES `ratings` (`ratingid`),
  ADD CONSTRAINT `movieratings_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movieratings_ibfk_3` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movieratings_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movieratings_ibfk_5` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`);

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movies_ibfk_3` FOREIGN KEY (`directorid`) REFERENCES `directors` (`directorid`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `stars`
--
ALTER TABLE `stars`
  ADD CONSTRAINT `stars_ibfk_1` FOREIGN KEY (`nationalityid`) REFERENCES `nationalities` (`nationalityid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
