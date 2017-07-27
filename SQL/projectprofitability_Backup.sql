-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2017 at 07:58 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectprofitability`
--

-- --------------------------------------------------------

--
-- Table structure for table `actualprojectresources`
--

CREATE TABLE `actualprojectresources` (
  `ProjectID` varchar(30) NOT NULL,
  `Year` int(11) NOT NULL,
  `Location` enum('OFFSHORE','ONSITE','','') NOT NULL,
  `Band` enum('P2','P1','U4','U3','U2','U1') NOT NULL,
  `M1` int(11) NOT NULL,
  `M2` int(11) NOT NULL,
  `M3` int(11) NOT NULL,
  `M4` int(11) NOT NULL,
  `M5` int(11) NOT NULL,
  `M6` int(11) NOT NULL,
  `M7` int(11) NOT NULL,
  `M8` int(11) NOT NULL,
  `M9` int(11) NOT NULL,
  `M10` int(11) NOT NULL,
  `M11` int(11) NOT NULL,
  `M12` int(11) NOT NULL,
  `HeadCount` int(11) NOT NULL,
  `Rate` int(11) NOT NULL,
  `Contribution` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actualprojectresources`
--

INSERT INTO `actualprojectresources` (`ProjectID`, `Year`, `Location`, `Band`, `M1`, `M2`, `M3`, `M4`, `M5`, `M6`, `M7`, `M8`, `M9`, `M10`, `M11`, `M12`, `HeadCount`, `Rate`, `Contribution`) VALUES
('1002', 1, 'OFFSHORE', 'U4', 34, 43, 43, 23, 23, 4, 43, 54, 56, 76, 5, 77, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bandsal`
--

CREATE TABLE `bandsal` (
  `Location` enum('OFFSHORE','ONSITE','') NOT NULL,
  `Band` varchar(2) NOT NULL,
  `minSal` varchar(7) NOT NULL,
  `maxSal` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bandsal`
--

INSERT INTO `bandsal` (`Location`, `Band`, `minSal`, `maxSal`) VALUES
('OFFSHORE', 'P1', '70000', 100000),
('OFFSHORE', 'P2', '100000', 200000),
('OFFSHORE', 'U1', '20000', 40000),
('OFFSHORE', 'U2', '30000', 50000),
('OFFSHORE', 'U3', '40000', 60000),
('OFFSHORE', 'U4', '60000', 80000),
('ONSITE', 'P1', '80000', 11000),
('ONSITE', 'P2', '110000', 210000),
('ONSITE', 'U1', '30000', 50000),
('ONSITE', 'U2', '40000', 60000),
('ONSITE', 'U3', '50000', 70000),
('ONSITE', 'U4', '70000', 90000);

-- --------------------------------------------------------

--
-- Table structure for table `loginaccess`
--

CREATE TABLE `loginaccess` (
  `FName` varchar(30) NOT NULL,
  `LName` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `Role` varchar(10) NOT NULL,
  `band` varchar(5) NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginaccess`
--

INSERT INTO `loginaccess` (`FName`, `LName`, `username`, `password`, `Role`, `band`, `location`) VALUES
('Test', '', '007', 'Techm123$', 'IBU', 'U3', 'Offshore'),
('abc', 'wtg', '1234567', 'Techmahindra@123$', 'IBG', 'P1', 'Onsite'),
('Giri', '', '308', '308', 'Admin', 'E2', 'Offshore'),
('TechMighty', '', 'admin', 'admin', 'Admin', 'none', ''),
('Pawan', '', 'gg0c70458', 'Qwerty@1234$', 'Admin', 'U1', 'Onsite'),
('ibg', '', 'ibg', 'ibg', 'IBG', 'n', ''),
('DEF', '', 'ibu', 'ibu', 'IBU', 'n', ''),
('rahul', '', 'mn0c70456', 'Outlook@123', 'IBU', 'P1', 'Offshore'),
('pgm', '', 'pgm', 'pgm', 'PGM', 'n', ''),
('pm', 'pm', 'pm', 'pm', 'PM', 'U3', ''),
('Sri', '', 'sd0c70557', 'Tejadomala@123$', 'Admin', 'U1', 'Onsite'),
('Sachin', 'V', 'sv0c70460', 'Techmahindra@123$', 'Admin', 'U1', 'Onsite'),
('Sri Teja', 'Domala', 'Teja518', 'Tejadomala@123$', 'Admin', 'U1', 'Offshore');

-- --------------------------------------------------------

--
-- Table structure for table `passwordrequest`
--

CREATE TABLE `passwordrequest` (
  `EmployeeID` varchar(10) NOT NULL,
  `ExistingPassword` varchar(50) NOT NULL,
  `RequestedPassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passwordrequest`
--

INSERT INTO `passwordrequest` (`EmployeeID`, `ExistingPassword`, `RequestedPassword`) VALUES
('sd0c70557', 'Tejadomala@123$', 'Techmahindra@123$');

-- --------------------------------------------------------

--
-- Table structure for table `profilerequest`
--

CREATE TABLE `profilerequest` (
  `EmployeeID` varchar(10) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Band` enum('P2','P1','U4','U3','U2','U1') NOT NULL,
  `Code` bigint(10) NOT NULL,
  `Mobile` bigint(10) NOT NULL,
  `Extension` int(10) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profileview`
--

CREATE TABLE `profileview` (
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `ID` varchar(10) NOT NULL,
  `Band` varchar(2) NOT NULL,
  `Telecode` varchar(50) NOT NULL,
  `Mobile` bigint(10) NOT NULL,
  `Extension` int(10) NOT NULL,
  `Email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profileview`
--

INSERT INTO `profileview` (`FirstName`, `LastName`, `ID`, `Band`, `Telecode`, `Mobile`, `Extension`, `Email`) VALUES
('abc', 'wtg', '1234567', 'P1', '297', 4575687685, 23432, '1234567'),
('Giri', 'G', 'gg0c70458', 'U1', '91', 1234056789, 78945, 'gg0c70458'),
('pm', 'pm', 'pm', 'U3', '91', 654987123, 12345, ''),
('Sri', 'Domala', 'sd0c70557', 'U1', '91', 2147483647, 74111, '');

-- --------------------------------------------------------

--
-- Table structure for table `projectdetails`
--

CREATE TABLE `projectdetails` (
  `ProjectID` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Type` enum('DEVELOPMENT','SUPPORT','','') NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `NoOfMonths` tinyint(3) NOT NULL,
  `NoOfYears` tinyint(3) NOT NULL,
  `IBGHead` varchar(50) NOT NULL,
  `IBUHead` varchar(50) NOT NULL,
  `ProgramManager` varchar(50) NOT NULL,
  `ProjectManager` varchar(50) NOT NULL,
  `PlannedOffshoreHeadCount` int(11) NOT NULL,
  `PlannedOnsiteHeadCount` int(11) NOT NULL,
  `ActualOffshoreHeadCount` int(11) NOT NULL,
  `ActualOnsiteHeadCount` int(11) NOT NULL,
  `PlannedContribution` float NOT NULL,
  `ActualContribution` float NOT NULL,
  `Revenue` int(11) NOT NULL,
  `Currency` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectdetails`
--

INSERT INTO `projectdetails` (`ProjectID`, `Name`, `Type`, `StartDate`, `EndDate`, `NoOfMonths`, `NoOfYears`, `IBGHead`, `IBUHead`, `ProgramManager`, `ProjectManager`, `PlannedOffshoreHeadCount`, `PlannedOnsiteHeadCount`, `ActualOffshoreHeadCount`, `ActualOnsiteHeadCount`, `PlannedContribution`, `ActualContribution`, `Revenue`, `Currency`) VALUES
('1002', 'Flipkart', 'DEVELOPMENT', '2017-07-02', '2018-07-30', 14, 2, 'ibg', 'rahul', 'pgm', 'pm', 517, 9, 0, 0, 1.5105, 0, 2000000000, 'INR'),
('1005', 'J', 'SUPPORT', '2017-07-10', '2019-08-09', 26, 3, '400003', 'ibu', '200004', 'pm', 26, 22, 0, 0, 0, 0, 2147483647, 'INR'),
('1006', 'est', 'SUPPORT', '2017-07-09', '2018-08-13', 14, 2, 'ibg', '300003', '200001', '100002', 517, 0, 0, 0, 2, 0, 2147483647, 'INR'),
('45612', 'Sample', 'DEVELOPMENT', '2017-07-22', '2018-05-30', 11, 1, 'Giri ', 'Test ', 'Sri ', 'Sri Teja Domala', 5, 13, 0, 0, 0.173692, 0, 2147483647, 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `projectdetailsrequest`
--

CREATE TABLE `projectdetailsrequest` (
  `ProjectID` varchar(30) NOT NULL,
  `ProjectName` varchar(50) NOT NULL,
  `IBGHead` varchar(50) NOT NULL,
  `IBUHeadID` varchar(50) NOT NULL,
  `ProgramManagerID` varchar(50) NOT NULL,
  `ProjectManagerID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projectresources`
--

CREATE TABLE `projectresources` (
  `ProjectID` varchar(30) NOT NULL,
  `Year` tinyint(2) NOT NULL DEFAULT '1',
  `Location` enum('ONSITE','OFFSHORE','','') NOT NULL,
  `Band` varchar(2) NOT NULL,
  `M1` tinyint(3) NOT NULL DEFAULT '0',
  `M2` tinyint(3) NOT NULL DEFAULT '0',
  `M3` int(3) NOT NULL DEFAULT '0',
  `M4` tinyint(3) NOT NULL DEFAULT '0',
  `M5` tinyint(3) NOT NULL DEFAULT '0',
  `M6` tinyint(3) NOT NULL DEFAULT '0',
  `M7` tinyint(3) NOT NULL DEFAULT '0',
  `M8` tinyint(3) NOT NULL DEFAULT '0',
  `M9` tinyint(3) NOT NULL DEFAULT '0',
  `M10` int(3) NOT NULL DEFAULT '0',
  `M11` int(3) NOT NULL DEFAULT '0',
  `M12` int(3) NOT NULL DEFAULT '0',
  `HeadCount` int(11) NOT NULL,
  `Rate` int(11) NOT NULL,
  `Contribution` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectresources`
--

INSERT INTO `projectresources` (`ProjectID`, `Year`, `Location`, `Band`, `M1`, `M2`, `M3`, `M4`, `M5`, `M6`, `M7`, `M8`, `M9`, `M10`, `M11`, `M12`, `HeadCount`, `Rate`, `Contribution`) VALUES
('1002', 1, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 1, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 420000, 0.021),
('1002', 1, 'ONSITE', 'U1', 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 4, 200000, 0.01),
('1002', 1, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 1, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 1, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 1, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 34, 34, 3400000, 0.17),
('1002', 1, 'OFFSHORE', 'P2', 0, 0, 0, 0, 3, 0, 5, 0, 0, 0, 0, 0, 8, 1600000, 0.08),
('1002', 1, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 1, 'OFFSHORE', 'U2', 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 4, 16, 800000, 0.04),
('1002', 1, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 1, 'OFFSHORE', 'U4', 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 240000, 0.012),
('1002', 2, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 2, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 2, 'ONSITE', 'U1', 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 150000, 0.0075),
('1002', 2, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 2, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 2, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 2, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 2, 'OFFSHORE', 'P2', 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 800000, 0.04),
('1002', 2, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 2, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 2, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1002', 2, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 1, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 1, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 0, 0),
('1005', 1, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 4, 0, 0),
('1005', 1, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0),
('1005', 1, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 1, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 5, 0, 0, 4, 0, 0, 9, 0, 0),
('1005', 1, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 4, 0, 0),
('1005', 1, 'OFFSHORE', 'P2', 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0),
('1005', 1, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0),
('1005', 1, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 4, 0, 0),
('1005', 1, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 1, 'OFFSHORE', 'U4', 0, 0, 0, 0, 5, 0, 0, 0, 4, 0, 0, 0, 9, 0, 0),
('1005', 2, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 2, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 2, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 2, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 2, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 2, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 2, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 2, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 2, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 2, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 2, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 2, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1005', 3, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 1, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1006', 2, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 1, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1234', 2, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 1, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12345', 2, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 1, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('13245', 2, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('45612', 1, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('45612', 1, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 13, 0, 0, 0, 0, 0, 0, 13, 2730000, 0.127126),
('45612', 1, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('45612', 1, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('45612', 1, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('45612', 1, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('45612', 1, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('45612', 1, 'OFFSHORE', 'P2', 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 5, 1000000, 0.0465661),
('45612', 1, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('45612', 1, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('45612', 1, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('45612', 1, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `revenuerequest`
--

CREATE TABLE `revenuerequest` (
  `ProjectID` bigint(20) NOT NULL,
  `NewRevenue` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actualprojectresources`
--
ALTER TABLE `actualprojectresources`
  ADD PRIMARY KEY (`ProjectID`,`Year`,`Location`,`Band`);

--
-- Indexes for table `bandsal`
--
ALTER TABLE `bandsal`
  ADD PRIMARY KEY (`Location`,`Band`);

--
-- Indexes for table `loginaccess`
--
ALTER TABLE `loginaccess`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `passwordrequest`
--
ALTER TABLE `passwordrequest`
  ADD UNIQUE KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `profilerequest`
--
ALTER TABLE `profilerequest`
  ADD UNIQUE KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `profileview`
--
ALTER TABLE `profileview`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Mobile` (`Mobile`);

--
-- Indexes for table `projectdetails`
--
ALTER TABLE `projectdetails`
  ADD PRIMARY KEY (`ProjectID`);

--
-- Indexes for table `projectdetailsrequest`
--
ALTER TABLE `projectdetailsrequest`
  ADD UNIQUE KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `projectresources`
--
ALTER TABLE `projectresources`
  ADD PRIMARY KEY (`ProjectID`,`Year`,`Location`,`Band`);

--
-- Indexes for table `revenuerequest`
--
ALTER TABLE `revenuerequest`
  ADD UNIQUE KEY `ProjectID` (`ProjectID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
