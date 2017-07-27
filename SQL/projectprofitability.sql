-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2017 at 03:07 PM
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
('ONSITE', 'P1', '80000', 110000),
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
  `password` varchar(30) NOT NULL DEFAULT 'Techm@123$',
  `Role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginaccess`
--

INSERT INTO `loginaccess` (`FName`, `LName`, `username`, `password`, `Role`) VALUES
('Guduru,Swarup Lakshmi Saraswat', '', '103971', 'Techm@123$', 'PM'),
('Narayanan,Sudha', '', '119749', 'Techm@123$', 'IBU'),
('Bakshi,Hemant Laxman', '', '127177', 'Techm@123$', 'IBU'),
('Udupa,Srikanth Rajgopal', '', '1340', 'Techm@123$', 'IBG'),
('A,Raghavendra Rao', '', '19492', 'Techm@123$', 'IBU'),
('GAJJALA,VENKATESWARARAO', '', '200626', 'Techm@123$', 'IBG'),
('NAGUBANDI,HANUMANTHRAO', '', '201012', 'Techm@123$', 'IBU'),
('MISHRA,BASANTAKUMAR', '', '201907', 'Techm@123$', 'IBG'),
('SARIPELLA,SOMASUNDAR', '', '202099', 'Techm@123$', 'PM'),
('KUMAR,PRAKASH', '', '202232', 'Techm@123$', 'IBU'),
('SONI,SANJANA', '', '202390', 'Techm@123$', 'PGM'),
('Thakkolam,Srinivasa Krishnakum', '', '20240', 'Techm@123$', 'IBG'),
('PAVUSHETTI,RAMESH', '', '202834', 'Techm@123$', 'PGM'),
('ABBUPILLAI,GOVINDASWAMY', '', '203184', 'Techm@123$', 'IBU'),
('S,Prashanth', '', '205998', 'Techm@123$', 'IBU'),
('Dutta Roy,Arindam', '', '20609', 'Techm@123$', 'IBG'),
('PATURI,VENKATA', '', '206273', 'Techm@123$', 'IBG'),
('BATHEPU,NAGARAJU', '', '206955', 'Techm@123$', 'PM'),
('K,SRIRAM', '', '208022', 'Techm@123$', 'IBG'),
('NAYAK,DILIPKUMAR', '', '208171', 'Techm@123$', 'PGM'),
('Mahaboob,Habeeb Chandanaparamb', '', '208696', 'Techm@123$', 'IBG'),
('SATYA KAILASH,MUNTAVENKATA RAM', '', '209176', 'Techm@123$', 'PM'),
('KUMAR,BODHAYANAKRISHNA', '', '209317', 'Techm@123$', 'IBG'),
('NAYAK,MANMATH RAJ', '', '211076', 'Techm@123$', 'PM'),
('Parameswaran,Natesh', '', '211689', 'Techm@123$', 'IBU'),
('KOPPULA,SRIDHAR', '', '212095', 'Techm@123$', 'IBU'),
('DASH,DEBASIS', '', '212474', 'Techm@123$', 'PM'),
('NAGARAM,MADHUSUDANRAO', '', '214020', 'Techm@123$', 'PM'),
('KANAGARAJAN,PRABHAKAR', '', '214268', 'Techm@123$', 'IBU'),
('MURALI MOHAN,THAMMINENI', '', '215020', 'Techm@123$', 'PM'),
('SEERA,UMA MAHESWARRAO', '', '215179', 'Techm@123$', 'PM'),
('CHEDALAVADA,LAKSHMI NARAYANA', '', '215284', 'Techm@123$', 'PGM'),
('Buchi,DeviK Prasad', '', '215515', 'Techm@123$', 'PM'),
('KARYAMPUDI,VARAPRASADSRINIVASA', '', '217588', 'Techm@123$', 'PM'),
('MISHRA,HIMANSHUSHEKHAR', '', '218323', 'Techm@123$', 'PM'),
('KONDAPALLY,SARADA PRASADVENKAT', '', '218325', 'Techm@123$', 'PM'),
('MISHRA,SIBASISH', '', '219023', 'Techm@123$', 'PM'),
('Doddanavar,Ravi Ningappa', '', '220913', 'Techm@123$', 'PGM'),
('Janke,RamaChandra Reddy', '', '221209', 'Techm@123$', 'PGM'),
('Shanmughasundaram,Palanisarava', '', '223097', 'Techm@123$', 'PM'),
('Nayak,Lalitendu', '', '224001', 'Techm@123$', 'PM'),
('Reddy,VenkatRamiG', '', '225344', 'Techm@123$', 'PM'),
('Chilukuri,Rammohan', '', '226558', 'Techm@123$', 'PM'),
('UPADRASTA,DINAKAR', '', '227276', 'Techm@123$', 'PM'),
('Gavara,BhaskaraRao', '', '227951', 'Techm@123$', 'PM'),
('Das,Haraprasad', '', '228722', 'Techm@123$', 'PM'),
('Bollam,Harish', '', '229354', 'Techm@123$', 'PM'),
('VALLURI,BHUJANGARAO', '', '230293', 'Techm@123$', 'PM'),
('MAYILMURUGAN,VIJAY ANAND', '', '230497', 'Techm@123$', 'IBU'),
('MADADI,VENKATESHWARREDDY', '', '230599', 'Techm@123$', 'PGM'),
('Rangasamy,Prabhusankar', '', '230906', 'Techm@123$', 'PGM'),
('S.M.V,RAMANAN', '', '231145', 'Techm@123$', 'PGM'),
('VEMULAPALLI,RAGHAVENDRARAO', '', '231193', 'Techm@123$', 'IBU'),
('HUSSAIN,MOHAMMED ZAKIR', '', '231237', 'Techm@123$', 'PGM'),
('KOTAGIRI,RAMMOHAN RAO', '', '231502', 'Techm@123$', 'PM'),
('BYAHATTI,VINOD', '', '231519', 'Techm@123$', 'PGM'),
('CHOPPERLA,GOPAL GUPTA  V.S.H', '', '231811', 'Techm@123$', 'PM'),
('LAL,BRIJESHKUMAR', '', '232155', 'Techm@123$', 'PGM'),
('Chatti,PhaniKumar', '', '232303', 'Techm@123$', 'PM'),
('Komaragiri,SumanS', '', '232484', 'Techm@123$', 'PM'),
('Katta,SankaraKiran', '', '232554', 'Techm@123$', 'PM'),
('ARUMUGAM,RAJA MANJUNATHAN', '', '233207', 'Techm@123$', 'PM'),
('sarma,Dhulipala Kameswara', '', '233685', 'Techm@123$', 'PM'),
('Alampundi Chellappa,Kannan', '', '234792', 'Techm@123$', 'PM'),
('Tikoo,VijayB', '', '235280', 'Techm@123$', 'IBU'),
('Iyengar,VenkateshRajagopalan', '', '235568', 'Techm@123$', 'PGM'),
('Achary,VaraPrasad', '', '235882', 'Techm@123$', 'PGM'),
('SAHOO,MANORANJAN', '', '236167', 'Techm@123$', 'PM'),
('Patra,Jyotirmoy', '', '236693', 'Techm@123$', 'PM'),
('Ganesh Babu,Kampana Venkata Sa', '', '237705', 'Techm@123$', 'PM'),
('Shankarnarayan,Dineshkumar', '', '238043', 'Techm@123$', 'IBU'),
('Devarajan,Venkatesh', '', '239205', 'Techm@123$', 'IBU'),
('Muttineni,Suresh', '', '240902', 'Techm@123$', 'PM'),
('Paidisetti,Srinivasa Rao', '', '241439', 'Techm@123$', 'PGM'),
('Mittapally,SrinivasReddy', '', '242413', 'Techm@123$', 'PM'),
('Chada,Srilekha', '', '246744', 'Techm@123$', 'PGM'),
('Tadi,MeherPrasad Reddy', '', '248346', 'Techm@123$', 'PM'),
('MURATHOTY,REBECCA BABITHA', '', '254466', 'Techm@123$', 'PM'),
('RAGALA,BHANU KISHORE', '', '258299', 'Techm@123$', 'PM'),
('Palanisamy,Rajasekaran', '', '258447', 'Techm@123$', 'PM'),
('Chidambaram,Meenakshi Sundaram', '', '259275', 'Techm@123$', 'IBG'),
('KOKKULA,RAJENDER', '', '260007', 'Techm@123$', 'PM'),
('Singh,Jyoti Prakash', '', '268498', 'Techm@123$', 'PM'),
('DAVULURI,PAVANKUMAR', '', '272613', 'Techm@123$', 'PM'),
('DORNALA,NARASIMHA CHARY', '', '272684', 'Techm@123$', 'PM'),
('RAMASESHAN,DR S', '', '275000', 'Techm@123$', 'IBG'),
('ROY,RITTA', '', '275611', 'Techm@123$', 'PGM'),
('Guha,AshimP.', '', '276024', 'Techm@123$', 'IBU'),
('NARAYANAN,SARASWATHI', '', '276249', 'Techm@123$', 'IBU'),
('GANDREDDI,SREENIVAS RAO', '', '278400', 'Techm@123$', 'PM'),
('Gurusamy,Rajasekaran', '', '279138', 'Techm@123$', 'PGM'),
('BOLAR,PRAVINCHANDRA', '', '285158', 'Techm@123$', 'IBU'),
('SINGH,VIJAYBAHADUR', '', '286320', 'Techm@123$', 'PM'),
('NALLAPANENI,KRISHNAKISHORE', '', '286529', 'Techm@123$', 'PM'),
('SAHOO,SATYAJIT', '', '291012', 'Techm@123$', 'PM'),
('Brahmandabheri,Sudhakar', '', '294978', 'Techm@123$', 'PGM'),
('YEKKALDEVI,HARIBABU', '', '295334', 'Techm@123$', 'PM'),
('Kolluru,Pushpa Sowjanya', '', '296957', 'Techm@123$', 'PM'),
('PALOD,KAMAL', '', '299485', 'Techm@123$', 'PM'),
('Datta,Anik', '', '299872', 'Techm@123$', 'PM'),
('JOSHI,ANILMURLIDHAR', '', '301593', 'Techm@123$', 'IBU'),
('KADARLA,VINODKUMAR', '', '305057', 'Techm@123$', 'PM'),
('Kukunarapu,Suresh Gupta', '', '305238', 'Techm@123$', 'PM'),
('PAI,DR SATISH GOPALKRISHNA', '', '3250', 'Techm@123$', 'IBG'),
('Rajkumar,Stalin', '', '325338', 'Techm@123$', 'IBU'),
('Manchikanti,Krishna Chaitanya', '', '330700', 'Techm@123$', 'PM'),
('Krishnan,Sriram', '', '336174', 'Techm@123$', 'PM'),
('Harivilam,Kumuda', '', '337631', 'Techm@123$', 'PM'),
('Goparaju,Lakshmi Narasimha Rag', '', '338374', 'Techm@123$', 'PM'),
('Gupta,Vikas', '', '34052', 'Techm@123$', 'IBG'),
('Naqvi,Zafar Mehmood', '', '341661', 'Techm@123$', 'IBU'),
('Thandra,Srikanth', '', '342521', 'Techm@123$', 'PM'),
('Abburu,Sai Ravi Kiran', '', '344269', 'Techm@123$', 'PM'),
('Mumnadavarapu,Rajesh', '', '344579', 'Techm@123$', 'PM'),
('Singh,Tarunpreet', '', '352283', 'Techm@123$', 'IBU'),
('Gundaram,Vijaykumar', '', '352856', 'Techm@123$', 'PM'),
('Birari,Sandesh Kantilal', '', '35494', 'Techm@123$', 'PM'),
('Vasu,Madhusudhanan', '', '362595', 'Techm@123$', 'IBG'),
('Sarkar,Soumen', '', '39978', 'Techm@123$', 'PM'),
('Jakkaraju,Sridhar', '', '418712', 'Techm@123$', 'PGM'),
('Kapur,Charumati', '', '420201', 'Techm@123$', 'IBG'),
('S,Mangayar Karasi', '', '434909', 'Techm@123$', 'PM'),
('Kandimalla,Venugopal Reddy', '', '438154', 'Techm@123$', 'IBG'),
('Sanagavarapu,Srinivas', '', '451710', 'Techm@123$', 'PM'),
('Ashara,Paresh Natwarlal', '', '453518', 'Techm@123$', 'IBU'),
('Poureil,Valsaraj O', '', '454903', 'Techm@123$', 'IBG'),
('Darbha,Sri Venkata Ramsha', '', '462441', 'Techm@123$', 'PGM'),
('Ambati,Krishna Chaitanya', '', '494002', 'Techm@123$', 'PM'),
('Patil,Nilesh C', '', '496636', 'Techm@123$', 'IBU'),
('Kommera,Girish', '', '508955', 'Techm@123$', 'PGM'),
('Dalvi,Sarvesh', '', '510361', 'Techm@123$', 'PM'),
('Chandramouli,Karthi', '', '86343', 'Techm@123$', 'IBG'),
('TechMighty', ' Admin', 'admin', 'admin', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `passwordrequest`
--

CREATE TABLE `passwordrequest` (
  `EmployeeID` varchar(10) NOT NULL,
  `ExistingPassword` varchar(50) NOT NULL,
  `RequestedPassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('10010650', 'TIGAMS Legacy RTS', 'SUPPORT', '2016-05-01', '2018-07-29', 28, 3, ' ', ' ', ' ', ' ', 2, 0, 0, 0, 96.667, 0, 7050000, 'USD');

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
('10010650', 1, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 1, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 1, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 1, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 1, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 1, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 1, 'OFFSHORE', 'P1', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 85000, 1.206),
('10010650', 1, 'OFFSHORE', 'P2', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 150000, 2.128),
('10010650', 1, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 1, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 1, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 1, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 2, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'ONSITE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'ONSITE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'ONSITE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'ONSITE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'ONSITE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'ONSITE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'OFFSHORE', 'P1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'OFFSHORE', 'P2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'OFFSHORE', 'U1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'OFFSHORE', 'U2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'OFFSHORE', 'U3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('10010650', 3, 'OFFSHORE', 'U4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
