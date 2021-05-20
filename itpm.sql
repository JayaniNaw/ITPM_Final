-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2021 at 07:57 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itpm`
--

-- --------------------------------------------------------

--
-- Table structure for table `addsessionroom`
--

CREATE TABLE `addsessionroom` (
  `ID` int(11) NOT NULL,
  `availbleSessionID` int(11) NOT NULL,
  `sessionRoom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `consecutive`
--

CREATE TABLE `consecutive` (
  `ID` int(11) NOT NULL,
  `Lecturer1` varchar(100) NOT NULL,
  `Lecturer2` varchar(100) NOT NULL,
  `SubjectCode` varchar(30) NOT NULL,
  `Subject` varchar(30) NOT NULL,
  `GroupID` varchar(30) NOT NULL,
  `Tag` varchar(30) NOT NULL,
  `Duration` varchar(30) NOT NULL,
  `sessionID` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consecutive`
--

INSERT INTO `consecutive` (`ID`, `Lecturer1`, `Lecturer2`, `SubjectCode`, `Subject`, `GroupID`, `Tag`, `Duration`, `sessionID`) VALUES
(15, 'Dr.Nuwan Kodagoda', 'Mr.Perera', 'IT2030', 'OOP', 'Y2.S1.IT.01', 'Lecture', '09:30 - 18:00', 'Dr.Nuwan Kodagoda-IT2030-DS-Lecture-Y1.S1.IT.01-120-2'),
(16, 'Mr. Prasanna S Haddela', '', 'IT3020', 'DS', 'Y3.S1.IT.12', 'Lecture', '14:00 - 16:00', 'Mr.Prasanna S Haddela-IT3020-DS-Lecture-Y1.S1.IT.12-60-2'),
(17, 'Mr. Prasanna S Haddela', '', 'IT3020', 'DS', 'Y3.S1.IT.12', 'Tutorial', '16:00 - 17:00', 'Mr.Prasanna S Haddela-IT3020-DS-Lecture-Y1.S1.IT.12-60-1'),
(20, 'Ms.Kavindi Gunashinghe', '', 'IT1020', 'CS', 'Y1.S1.IT.01', 'Lecture', '10:30 - 12:30', 'Ms.Kavindi Gunashinghe-IT1020-CS-Lecture-Y1.S1.IT.01-80-2'),
(21, 'Ms.Shashika Lokuliyana', 'Ms.Sasini', 'IT3010', 'NDM', 'Y3.S1.IT.05', 'Lecture', '11:30 - 14:30', 'Ms.Shashika Lokuliyana-IT3010-NDM-Lecture-Y3.S1.IT.05-60-2'),
(22, 'Ms.Shashika Lokuliyana', 'Ms.Sasini', 'IT3010', 'NDM', 'Y3.S1.IT.05', 'Tutorial', '14:30 - 15:30', 'Ms.Shashika Lokuliyana-IT3010-NDM-Tutorial-Y3.S1.IT.05-60-2'),
(23, 'Mr. Kashyapa Karunarathne', '', 'IT3010', 'NDM', 'Y3.S1.IT.05.01', 'Practical', '10:30 - 12:30', 'Mr.Kashyapa Karunarathne-IT3010-NDM-Practical-Y3.S1.IT.05.01-30-2'),
(24, 'Ms. Thamali Dissanayake', '', 'IT3020', 'DS', 'Y3S1.12.01(IT)	', 'Practical', '08:30 - 10:30', 'Ms.Thamali Dissanayake-IT3020-DS-Practical-Y1.S1.IT.12-30-2'),
(26, 'Mr. Senura Diwantha', '', 'IT1030', 'MC', 'Y1.S1.IT.01', 'Tutorial', '17:00 - 18:00', 'Ms.Kavindi Gunashinghe-IT1020-CS-Tutorial-Y1.S1.IT.01-80-1');

-- --------------------------------------------------------

--
-- Table structure for table `consecutivesessionroom`
--

CREATE TABLE `consecutivesessionroom` (
  `ID` int(11) NOT NULL,
  `conSessionID` varchar(100) NOT NULL,
  `conSessionRoom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consecutivesessionroom`
--

INSERT INTO `consecutivesessionroom` (`ID`, `conSessionID`, `conSessionRoom`) VALUES
(1, 'Dr.NuwanKodagoda-IT2030-DS-Lecture-Y1.S1.IT.01-120', 'A502'),
(2, 'DeshaniMalsha-IT3050-ESD-Lecture-Y3.S1.SE.1-120-2', 'A402');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `empID` varchar(30) NOT NULL,
  `faculty` varchar(30) NOT NULL,
  `department` varchar(30) NOT NULL,
  `activeDays` varchar(100) NOT NULL,
  `activeHours1` varchar(100) NOT NULL,
  `activeHours2` varchar(100) NOT NULL,
  `center` varchar(100) NOT NULL,
  `building` varchar(100) NOT NULL,
  `level` int(11) NOT NULL,
  `rank` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`ID`, `name`, `empID`, `faculty`, `department`, `activeDays`, `activeHours1`, `activeHours2`, `center`, `building`, `level`, `rank`) VALUES
(183, 'manudi sathmini', '000008', 'Computing', 'DS', 'Monday Tuesday Wednesday Thursday ', '10:03 PM', '10:03 PM', 'Jaffna', 'J_C Block', 2, '2.000008'),
(185, 'Sajith Perera', '190505', 'Computing', 'IT', 'Monday Tuesday Wednesday Thursday Friday ', '8:50 AM', '11:50 AM', 'Kandy', 'K1_A Block', 3, '3.190505'),
(186, 'Chathurika Pinnaduwa', '909090', 'Computing', 'DS', 'Monday Tuesday Wednesday ', '9:00 AM', '5:00 PM', 'Kandy', 'K1_C Block', 4, '4.909090'),
(188, 'Mr.Perera', '101011', 'Computing', 'IT', 'Monday ', '9:00 PM', '11:00 PM', 'Jaffna', 'J_A Block', 2, '2.101011'),
(189, 'Ms.manudi', '009090', 'Buisness', 'BA', 'Monday ', '9:10 PM', '12:10 PM', 'Malabe', 'M1_A Block', 2, '2.009090'),
(190, 'Mr.N o', '909099', 'Buisness', 'BM', 'Monday ', '9:20 PM', '12:20 PM', 'Malabe', 'M1_A Block', 3, '3.909099'),
(191, 'Mr.Nayantha Lochana', '909096', 'Computing', 'IT', 'Monday ', '9:21 PM', '12:21 PM', 'Kurunegala', 'K2_A Block', 2, '2.909096'),
(192, 'Mr.Nuwan Kodagoda', '101018', 'Buisness', 'BM', 'Monday Wednesday ', '9:00 AM', '11:00 AM', 'Malabe', 'M1_A Block', 3, '3.101010'),
(193, 'Mr.Peries', '111111', 'Architecture', 'Arciture', 'Monday Tuesday ', '9:00 AM', '3:00 PM', 'Kurunegala', 'K2_A Block', 2, '2.111111'),
(194, 'Mrs.Madara', '121212', 'Buisness', 'BA', 'Monday Saturday Sunday ', '12:00 PM', '2:00 PM', 'Jaffna', 'J_A Block', 5, '5.121212');

-- --------------------------------------------------------

--
-- Table structure for table `notavailablelecture`
--

CREATE TABLE `notavailablelecture` (
  `id` int(11) NOT NULL,
  `Lecturer` varchar(100) NOT NULL,
  `mgroup` varchar(100) NOT NULL,
  `SubGroup` varchar(100) NOT NULL,
  `SessionID` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `Time_from` time NOT NULL,
  `Time_to` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notavailablelecture`
--

INSERT INTO `notavailablelecture` (`id`, `Lecturer`, `mgroup`, `SubGroup`, `SessionID`, `Date`, `Time_from`, `Time_to`) VALUES
(1, 'Mr.Manjula sirisena', 'Y1.S2.03', 'Y1.S2.03.6', 'A502', '2021-05-12', '08:30:00', '09:30:00'),
(2, 'Ms.kavindi Gunasinghe', 'Y1.S2.02', 'Y1.S2.02.1', 'A503', '2021-05-12', '09:00:00', '03:30:00'),
(3, 'Mr.Perera', 'Y2.01', 'Y2.01.01', 'Mr.Perera-Y2.01', '2021-05-19', '08:30:00', '09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `notavailablelocations`
--

CREATE TABLE `notavailablelocations` (
  `id` int(11) NOT NULL,
  `roomId` varchar(100) NOT NULL,
  `datefrom` date NOT NULL,
  `dateto` date NOT NULL,
  `startT` time NOT NULL,
  `endT` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notavailablelocations`
--

INSERT INTO `notavailablelocations` (`id`, `roomId`, `datefrom`, `dateto`, `startT`, `endT`) VALUES
(1, 'A502', '2021-05-12', '2021-05-31', '08:30:00', '17:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `notoverlapping`
--

CREATE TABLE `notoverlapping` (
  `ID` int(11) NOT NULL,
  `Lecturer1` varchar(100) NOT NULL,
  `Lecturer2` varchar(100) NOT NULL,
  `SubjectCode` varchar(30) NOT NULL,
  `Subject` varchar(30) NOT NULL,
  `GroupID` varchar(30) NOT NULL,
  `Tag` varchar(30) NOT NULL,
  `Duration` varchar(30) NOT NULL,
  `sessionID` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notoverlapping`
--

INSERT INTO `notoverlapping` (`ID`, `Lecturer1`, `Lecturer2`, `SubjectCode`, `Subject`, `GroupID`, `Tag`, `Duration`, `sessionID`) VALUES
(9, 'Dr.Nuwan Kodagoda', 'Mr.Perera', 'IT2030', 'OOP', 'Y2.S1.IT.01', 'Lecture', '09:30 - 18:00', 'Dr.Nuwan Kodagoda-IT2030-DS-Lecture-Y1.S1.IT.01-120-2'),
(10, 'Mr. Kashyapa Karunarathne', '', 'IT3010', 'NDM', 'Y3.S1.IT.05.01', 'Practical', '10:30 - 12:30', 'Mr.Kashyapa Karunarathne-IT3010-NDM-Practical-Y3.S1.IT.05.01-30-2'),
(11, 'Ms.Kavindi Gunashinghe', '', 'IT1020', 'CS', 'Y1.S1.IT.01', 'Lecture', '10:30 - 12:30', 'Ms.Kavindi Gunashinghe-IT1020-CS-Lecture-Y1.S1.IT.01-80-2'),
(16, 'Mr. Senura Diwantha', '', 'IT1030', 'MC', 'Y1.S1.IT.01', 'Tutorial', '17:00 - 18:00', 'Ms.Kavindi Gunashinghe-IT1020-CS-Tutorial-Y1.S1.IT.01-80-1'),
(17, 'Ms.Shashika Lokuliyana', 'Ms.Sasini', 'IT3010', 'NDM', 'Y3.S1.IT.05', 'Tutorial', '14:30 - 15:30', 'Ms.Shashika Lokuliyana-IT3010-NDM-Tutorial-Y3.S1.IT.05-60-2');

-- --------------------------------------------------------

--
-- Table structure for table `notoverlappingsessionroom`
--

CREATE TABLE `notoverlappingsessionroom` (
  `ID` int(11) NOT NULL,
  `SessionID` varchar(100) NOT NULL,
  `RoomName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notoverlappingsessionroom`
--

INSERT INTO `notoverlappingsessionroom` (`ID`, `SessionID`, `RoomName`) VALUES
(4, 'RashiniDinelka-IT3050-ESD-Lecture-Y2.S2.IT.1-120-2', 'A602'),
(5, 'RanjikaKumari-IT2010-OOP-Lecture-Y2.S1.IT.1-120-1', 'B603');

-- --------------------------------------------------------

--
-- Table structure for table `parallel`
--

CREATE TABLE `parallel` (
  `ID` int(11) NOT NULL,
  `Lecturer1` varchar(100) NOT NULL,
  `Lecturer2` varchar(100) NOT NULL,
  `SubjectCode` varchar(10) NOT NULL,
  `Subject` varchar(30) NOT NULL,
  `GroupID` varchar(30) NOT NULL,
  `Tag` varchar(30) NOT NULL,
  `Duration` varchar(30) NOT NULL,
  `sessionID` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parallel`
--

INSERT INTO `parallel` (`ID`, `Lecturer1`, `Lecturer2`, `SubjectCode`, `Subject`, `GroupID`, `Tag`, `Duration`, `sessionID`) VALUES
(11, 'Dr.Nuwan Kodagoda', 'Mr.Perera', 'IT2030', 'OOP', 'Y2.S1.IT.01', 'Lecture', '09:30 - 18:00', 'Dr.Nuwan Kodagoda-IT2030-DS-Lecture-Y1.S1.IT.01-120-2'),
(12, 'Mr. Prasanna S Haddela', '', 'IT3020', 'DS', 'Y3.S1.IT.12', 'Tutorial', '16:00 - 17:00', 'Mr.Prasanna S Haddela-IT3020-DS-Lecture-Y1.S1.IT.12-60-1'),
(13, 'Ms.Shashika Lokuliyana', 'Ms.Sasini', 'IT3010', 'NDM', 'Y3.S1.IT.05', 'Tutorial', '14:30 - 15:30', 'Ms.Shashika Lokuliyana-IT3010-NDM-Tutorial-Y3.S1.IT.05-60-2'),
(14, 'Ms.Shashika Lokuliyana', 'Ms.Sasini', 'IT3010', 'NDM', 'Y3.S1.IT.05', 'Lecture', '11:30 - 14:30', 'Ms.Shashika Lokuliyana-IT3010-NDM-Lecture-Y3.S1.IT.05-60-2'),
(20, 'Mr. Kashyapa Karunarathne', '', 'IT3010', 'NDM', 'Y3.S1.IT.05.01', 'Practical', '10:30 - 12:30', 'Mr.Kashyapa Karunarathne-IT3010-NDM-Practical-Y3.S1.IT.05.01-30-2'),
(21, 'Ms. Thamali Dissanayake', '', 'IT3020', 'DS', 'Y3S1.12.01(IT)	', 'Practical', '08:30 - 10:30', 'Ms.Thamali Dissanayake-IT3020-DS-Practical-Y1.S1.IT.12-30-2'),
(22, 'Mr. Prasanna S Haddela', '', 'IT3020', 'DS', 'Y3.S1.IT.12', 'Lecture', '14:00 - 16:00', 'Mr.Prasanna S Haddela-IT3020-DS-Lecture-Y1.S1.IT.12-60-2'),
(23, 'Ms.Kavindi Gunashinghe', '', 'IT1020', 'CS', 'Y1.S1.IT.01', 'Lecture', '10:30 - 12:30', 'Ms.Kavindi Gunashinghe-IT1020-CS-Lecture-Y1.S1.IT.01-80-2');

-- --------------------------------------------------------

--
-- Table structure for table `parallelsesionroom`
--

CREATE TABLE `parallelsesionroom` (
  `ID` int(11) NOT NULL,
  `SessionID` varchar(100) NOT NULL,
  `RoomName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parallelsesionroom`
--

INSERT INTO `parallelsesionroom` (`ID`, `SessionID`, `RoomName`) VALUES
(1, 'HimaliSiriwardana-IT3040-DS-Lecture-Y2.S2.IT.1-120-2', 'B403'),
(2, 'NirmalaSiriwardana-IT3020-DS-Lecture-Y3.S2.SE.1-120-2', 'B503');

-- --------------------------------------------------------

--
-- Table structure for table `prefertime`
--

CREATE TABLE `prefertime` (
  `id` int(11) NOT NULL,
  `sessionID` varchar(100) NOT NULL,
  `preferDay` varchar(20) NOT NULL,
  `preferDate` date NOT NULL,
  `startT` time NOT NULL,
  `endT` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prefertime`
--

INSERT INTO `prefertime` (`id`, `sessionID`, `preferDay`, `preferDate`, `startT`, `endT`) VALUES
(1, 'Dr.Perera-SE-IT8900-Y1S2.IT-2-60', 'Monday', '2021-05-17', '09:30:00', '18:00:00'),
(2, 'Dr.Nuwan Kodagoda-IT-IT9090-Y1S1.IT.1-120', 'Tuesday', '2021-05-10', '03:30:00', '05:30:00'),
(3, 'manudi sathmini-IT1010-OOP-Y2.S2.05-120-2', 'Wednesday', '2021-05-12', '03:00:00', '05:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sessionroom`
--

CREATE TABLE `sessionroom` (
  `id` int(11) NOT NULL,
  `sessionID` varchar(100) NOT NULL,
  `sessionRoom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `ID` int(11) NOT NULL,
  `Lecturer1` varchar(50) NOT NULL,
  `Lecturer2` varchar(50) NOT NULL,
  `AdditionalLecturer1` varchar(50) NOT NULL,
  `AdditionalLecturer2` varchar(50) NOT NULL,
  `Tag` varchar(20) NOT NULL,
  `GroupID` varchar(30) NOT NULL,
  `SubGroupID` varchar(30) NOT NULL,
  `SubjectCode` varchar(10) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `NoOfStudents` int(11) NOT NULL,
  `Duration` varchar(10) NOT NULL,
  `sessionID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`ID`, `Lecturer1`, `Lecturer2`, `AdditionalLecturer1`, `AdditionalLecturer2`, `Tag`, `GroupID`, `SubGroupID`, `SubjectCode`, `Subject`, `NoOfStudents`, `Duration`, `sessionID`) VALUES
(9, 'manudi sathmini', 'Mrs.Madara', 'Sajith Perera', 'Mr.Nuwan Kodagoda', 'Lecture', 'Y2.S2.05', 'null', 'IT1010', 'OOP', 120, '2', 'manudi sathmini-IT1010-OOP-Y2.S2.05-120-2'),
(10, 'Chathurika Pinnaduwa', 'Mr.Perera', 'Sajith Perera', 'Mr.Peries', 'Tute', 'Y2.S2.05', 'null', 'IT1010', 'OOP', 120, '2', 'manudi sathmini-IT1010-OOP-Y2.S2.05-120-2'),
(11, 'Mrs.Madara', 'Mr.Perera', 'Mr.N o', 'Mr.Nuwan Kodagoda', 'Tute', 'Y2.S2.05', 'null', 'IT1010', 'OOP', 120, '1', 'Chathurika Pinnaduwa-IT1010-OOP-Y2.S2.05-120-1'),
(12, 'Mr.Nuwan Kodagoda', 'Mr.Peries', 'Mr.N o', 'Mr.Perera', 'Tute', 'Y2.S2.05', 'null', 'MM0000', 'OO', 60, '2', 'Mr.Nuwan Kodagoda-IT1212-oop-Y2.S2.05.03-60-2'),
(13, 'Mr.Peries', 'Mr.Nuwan Kodagoda', 'Mr.Perera', 'Ms.manudi', 'Lecture', 'Y2.S2.05', 'null', 'IT2340', 'MADD', 120, '2', 'Mr.Peries-IT2340-MADD-Y2.S2.05-120-2'),
(14, 'Sajith Perera', 'Mrs.Madara', 'Mr.Perera', 'Ms.manudi', 'Tute', 'Y2.S2.05', 'null', 'WE9090', 'QW', 120, '2', 'Sajith Perera-WE9090-QW-Y2.S2.05-120-2'),
(15, 'Ms.manudi', 'Sajith Perera', 'Mr.N o', 'Mr.Nuwan Kodagoda', 'Tute', 'Y2.S2.05', 'null', 'WE9090', 'QW', 120, '2', 'Ms.manudi-IT1212-oop-Y2.S2.05-120-2'),
(16, 'Mr.Nayantha Lochana', 'Sajith Perera', 'Mr.Peries', 'Ms.manudi', 'Tute', 'Y1.S2.03', 'null', 'BM0101', 'BM', 120, '1', 'Mr.Nayantha Lochana-BM0101-BM-Y1.S2.03-120-1');

-- --------------------------------------------------------

--
-- Table structure for table `studentgroups`
--

CREATE TABLE `studentgroups` (
  `ID` int(11) NOT NULL,
  `YearAndSem` varchar(10) NOT NULL,
  `Programme` varchar(20) NOT NULL,
  `GroupNo` varchar(10) NOT NULL,
  `SubGroupNo` varchar(10) NOT NULL,
  `GroupID` varchar(20) NOT NULL,
  `SubGroupID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentgroups`
--

INSERT INTO `studentgroups` (`ID`, `YearAndSem`, `Programme`, `GroupNo`, `SubGroupNo`, `GroupID`, `SubGroupID`) VALUES
(1, 'Y2.S2', 'IT', '5', '3', 'Y2.S2.05', 'Y2.S2.05.03'),
(2, 'Y1.S2', 'IT', '3', '6', 'Y1.S2.03', 'Y1.S2.03.06');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `ID` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `noOfLecture` int(11) NOT NULL,
  `noOfTute` int(11) NOT NULL,
  `noOfLab` int(11) NOT NULL,
  `noOfEva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`ID`, `year`, `semester`, `name`, `code`, `noOfLecture`, `noOfTute`, `noOfLab`, `noOfEva`) VALUES
(19, 1, 1, 'OOP', 'IT1010', 2, 2, 2, 1),
(20, 2, 1, 'MS', 'AS1212', 2, 2, 2, 2),
(28, 2, 2, 'SSS', 'SS1111', 2, 2, 2, 2),
(31, 2, 2, 'MADD', 'IT2340', 2, 2, 2, 2),
(32, 1, 1, 'Accounting', 'BM1200', 2, 1, 2, 1),
(33, 2, 2, 'BM', 'IT1111', 2, 1, 2, 1),
(41, 1, 1, 'IT', 'IT1919', 1, 1, 1, 1),
(43, 1, 1, 'QQQ', 'QQ1223', 2, 2, 1, 1),
(46, 2, 2, 'OO', 'MM0000', 1, 1, 1, 1),
(49, 3, 2, 'BM', 'BM0101', 1, 1, 1, 1),
(50, 2, 1, 'IR', 'IR1900', 1, 1, 1, 1),
(51, 1, 2, 'QW', 'WE9090', 1, 1, 1, 1),
(53, 2, 2, 'IT', 'IT0002', 2, 2, 1, 1),
(54, 3, 1, 'PAF', 'IT3030', 2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `ID` int(11) NOT NULL,
  `TagName` varchar(30) NOT NULL,
  `RelatedTag` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`ID`, `TagName`, `RelatedTag`) VALUES
(1, 'Tute', 'Tute'),
(2, 'Lecture', 'Lecture'),
(4, 'Practical', 'Practical');

-- --------------------------------------------------------

--
-- Table structure for table `tbllocation`
--

CREATE TABLE `tbllocation` (
  `LocationID` int(11) NOT NULL,
  `BuildingName` varchar(100) NOT NULL,
  `RoomName` varchar(100) NOT NULL,
  `RoomType` varchar(100) NOT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllocation`
--

INSERT INTO `tbllocation` (`LocationID`, `BuildingName`, `RoomName`, `RoomType`, `Capacity`) VALUES
(17, 'as', 'opw', 'Lecture hall', 903);

-- --------------------------------------------------------

--
-- Table structure for table `ws`
--

CREATE TABLE `ws` (
  `id` int(11) NOT NULL,
  `numberOfDays` int(11) NOT NULL,
  `days` text NOT NULL,
  `startT` time NOT NULL,
  `endT` time NOT NULL,
  `slot` int(11) NOT NULL,
  `breakcount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ws`
--

INSERT INTO `ws` (`id`, `numberOfDays`, `days`, `startT`, `endT`, `slot`, `breakcount`) VALUES
(1, 2, 'monday tuesday', '08:30:00', '17:30:00', 30, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addsessionroom`
--
ALTER TABLE `addsessionroom`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `availbleSessionID` (`availbleSessionID`);

--
-- Indexes for table `consecutive`
--
ALTER TABLE `consecutive`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `consecutivesessionroom`
--
ALTER TABLE `consecutivesessionroom`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `notavailablelecture`
--
ALTER TABLE `notavailablelecture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notavailablelocations`
--
ALTER TABLE `notavailablelocations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notoverlapping`
--
ALTER TABLE `notoverlapping`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `notoverlappingsessionroom`
--
ALTER TABLE `notoverlappingsessionroom`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `parallel`
--
ALTER TABLE `parallel`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `parallelsesionroom`
--
ALTER TABLE `parallelsesionroom`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prefertime`
--
ALTER TABLE `prefertime`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessionroom`
--
ALTER TABLE `sessionroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `studentgroups`
--
ALTER TABLE `studentgroups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbllocation`
--
ALTER TABLE `tbllocation`
  ADD PRIMARY KEY (`LocationID`);

--
-- Indexes for table `ws`
--
ALTER TABLE `ws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addsessionroom`
--
ALTER TABLE `addsessionroom`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consecutive`
--
ALTER TABLE `consecutive`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `consecutivesessionroom`
--
ALTER TABLE `consecutivesessionroom`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `notavailablelecture`
--
ALTER TABLE `notavailablelecture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notavailablelocations`
--
ALTER TABLE `notavailablelocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notoverlapping`
--
ALTER TABLE `notoverlapping`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `notoverlappingsessionroom`
--
ALTER TABLE `notoverlappingsessionroom`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parallel`
--
ALTER TABLE `parallel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `parallelsesionroom`
--
ALTER TABLE `parallelsesionroom`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prefertime`
--
ALTER TABLE `prefertime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sessionroom`
--
ALTER TABLE `sessionroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `studentgroups`
--
ALTER TABLE `studentgroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbllocation`
--
ALTER TABLE `tbllocation`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ws`
--
ALTER TABLE `ws`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addsessionroom`
--
ALTER TABLE `addsessionroom`
  ADD CONSTRAINT `addsessionroom_ibfk_1` FOREIGN KEY (`availbleSessionID`) REFERENCES `notavailablelecture` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
