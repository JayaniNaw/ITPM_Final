-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2021 at 08:00 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `Tags(session1)` varchar(30) NOT NULL,
  `Tags(session2)` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `consecutivesessionroom`
--

CREATE TABLE `consecutivesessionroom` (
  `id` int(11) NOT NULL,
  `conSessionID` int(11) NOT NULL,
  `conSessionRoom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(184, 'ishani', '000012', 'Computing', 'IT', 'Monday ', '6:05 PM', '7:05 PM', 'Malabe', 'M1_A Block', 2, '2.000012');

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
  `Timefrom` time NOT NULL,
  `Timeto` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notavailablelecture`
--

INSERT INTO `notavailablelecture` (`id`, `Lecturer`, `mgroup`, `SubGroup`, `SessionID`, `Date`, `Timefrom`, `Timeto`) VALUES
(6, '000008', 'Y1.S2.12', 'Y1.S2.12.1', 'Dr.Nuwan Kodagoda-IT2030-DS-Lecture-Y1.S1.IT.01-120-2', '2021-05-18', '08:30:00', '21:00:00'),
(7, '000012', 'Y1.S2.12', 'Y1.S2.12.1', 'Dr.Nuwan Kodagoda-IT2030-DS-Lecture-Y1.S1.IT.01-120-2', '2021-05-17', '01:30:00', '19:00:00'),
(8, '000008', 'Y1.S2.12', 'Y1.S2.12.5', 'Dr.Nuwan Kodagoda-IT2030-DS-Lecture-Y1.S1.IT.01-120-2', '2021-05-27', '11:30:00', '12:30:00'),
(9, '000012', 'Y1.S2.12', 'Y1.S2.12.1', 'Dr.Nuwan Kodagoda-IT2030-DS-Lecture-Y1.S1.IT.01-120-2', '2021-05-11', '01:30:00', '19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `notavailablelocations`
--

CREATE TABLE `notavailablelocations` (
  `id` int(11) NOT NULL,
  `roomName` varchar(100) NOT NULL,
  `datefrom` date NOT NULL,
  `dateto` date NOT NULL,
  `startT` time NOT NULL,
  `endT` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notavailablelocations`
--

INSERT INTO `notavailablelocations` (`id`, `roomName`, `datefrom`, `dateto`, `startT`, `endT`) VALUES
(2, 'opw', '2021-05-04', '2021-05-31', '08:30:00', '17:30:00'),
(3, 'opw', '2021-05-05', '2021-05-06', '09:30:00', '12:30:00');

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
  `Tags(session1)` varchar(30) NOT NULL,
  `Tag(session2)` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `Tags(session1)` varchar(30) NOT NULL,
  `Tag(session2)` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefertime`
--

CREATE TABLE `prefertime` (
  `id` int(11) NOT NULL,
  `sessionID` varchar(200) NOT NULL,
  `preferDay` varchar(20) NOT NULL,
  `preferDate` date NOT NULL,
  `startT` time NOT NULL,
  `endT` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prefertime`
--

INSERT INTO `prefertime` (`id`, `sessionID`, `preferDay`, `preferDate`, `startT`, `endT`) VALUES
(1, 'Dr.Nuwan Kodagoda-IT2030-DS-Lecture-Y1.S1.IT.01-120-2', 'Tuesday', '2021-05-17', '09:30:00', '18:00:00'),
(2, 'Ms.Sathmini-IT1020-PAF-Tutorial-Y1.S1.IT.01-60-1', 'Thursday', '2021-05-11', '08:30:00', '09:30:00');

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
  `SubjectCode` varchar(10) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `GroupID` varchar(30) NOT NULL,
  `Tag` varchar(20) NOT NULL,
  `NoOfStudents` int(11) NOT NULL,
  `Duration` varchar(10) NOT NULL,
  `sessionID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`ID`, `Lecturer1`, `Lecturer2`, `AdditionalLecturer1`, `AdditionalLecturer2`, `SubjectCode`, `Subject`, `GroupID`, `Tag`, `NoOfStudents`, `Duration`, `sessionID`) VALUES
(1, 'Dr.Nuwan Kodagoda', 'Mr.Perera', 'Mrs.Silva', 'Mrs.Sanjeewani', 'IT2030', 'DS', 'Y1.S1.IT.01', 'Lecture', 120, '2', 'Dr.Nuwan Kodagoda-IT2030-DS-Lecture-Y1.S1.IT.01-120-2'),
(2, 'Ms.Sathmini', 'Ms.Bassnayaka', 'Mr.Mendis', 'Ms.Bowaththa', 'IT1020', 'PAF', 'Y1.S1.IT.01', 'Tutorial', 120, '1', 'Ms.Sathmini-IT1020-PAF-Tutorial-Y1.S1.IT.01-60-1');

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
(1, '', '', 'Y1.S2.12', 'Y1.S2.12.1', '', ''),
(2, '', '', 'Y1.S2.12', 'Y1.S2.12.5', '', '');

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
(1, 1, 1, 'DS', '3030', 2, 2, 2, 2),
(2, 1, 1, 'ESD', '9090', 1, 1, 2, 2),
(3, 3, 1, 'NDM', '2050', 1, 2, 2, 2),
(12, 3, 2, 'jjj', '2345', 1, 1, 1, 1),
(13, 1, 1, 'ESD', '9090', 1, 1, 2, 2),
(14, 1, 1, 'o', '9', 2, 2, 2, 2),
(15, 3, 2, 'TT', '7878', 2, 2, 2, 2),
(16, 2, 1, 'TTT', '7676', 2, 2, 2, 2),
(17, 4, 1, 'EE', '1234', 2, 1, 2, 1),
(19, 1, 1, 'OOP', 'IT1010', 2, 2, 2, 1),
(20, 2, 1, 'MS', 'AS1212', 2, 2, 2, 2),
(28, 2, 2, 'SSS', 'SS1111', 2, 2, 2, 2),
(30, 2, 2, 'lll', 'pp00', 2, 2, 2, 2),
(31, 2, 2, 'MADD', 'IT2340', 2, 2, 2, 2),
(32, 1, 1, 'Accounting', 'BM1200', 2, 1, 2, 1),
(33, 2, 2, 'BM', 'IT1111', 2, 1, 2, 1),
(38, 2, 2, 'ppp', '01', 2, 2, 2, 2),
(39, 2, 1, 'ioio', '000009', 2, 2, 2, 2),
(41, 1, 1, 'IT', 'IT1919', 1, 1, 1, 1),
(42, 2, 1, 'oop', 'IT1212', 1, 1, 1, 1),
(43, 1, 1, 'QQQ', 'QQ1223', 2, 2, 1, 1),
(46, 2, 2, 'OO', 'MM0000', 1, 1, 1, 1),
(47, 1, 1, 'MADD', 'IT2345', 1, 1, 1, 1),
(49, 3, 2, 'BM', 'BM0101', 1, 1, 1, 1),
(50, 2, 1, 'IR', 'IR1900', 1, 1, 1, 1),
(51, 1, 2, 'QW', 'WE9090', 1, 1, 1, 1),
(53, 2, 2, 'IT', 'IT0002', 2, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `ID` int(11) NOT NULL,
  `TagName` varchar(30) NOT NULL,
  `RelatedTag` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 2, '', '08:30:00', '17:30:00', 60, 4);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `conSessionID` (`conSessionID`);

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
-- Indexes for table `parallel`
--
ALTER TABLE `parallel`
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consecutivesessionroom`
--
ALTER TABLE `consecutivesessionroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `notavailablelecture`
--
ALTER TABLE `notavailablelecture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notavailablelocations`
--
ALTER TABLE `notavailablelocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notoverlapping`
--
ALTER TABLE `notoverlapping`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parallel`
--
ALTER TABLE `parallel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prefertime`
--
ALTER TABLE `prefertime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sessionroom`
--
ALTER TABLE `sessionroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `studentgroups`
--
ALTER TABLE `studentgroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

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

--
-- Constraints for table `consecutivesessionroom`
--
ALTER TABLE `consecutivesessionroom`
  ADD CONSTRAINT `consecutivesessionroom_ibfk_1` FOREIGN KEY (`conSessionID`) REFERENCES `consecutive` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
