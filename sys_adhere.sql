-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2021 at 06:27 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sys_adhere`
--

-- --------------------------------------------------------

--
-- Table structure for table `allergic_conditions`
--

CREATE TABLE `allergic_conditions` (
  `patient_id` int(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL DEFAULT current_timestamp(),
  `is_allergy` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allergic_conditions`
--

INSERT INTO `allergic_conditions` (`patient_id`, `description`, `start_date`, `end_date`, `is_allergy`) VALUES
(20213554, 'Allergy to Bee Venom', '2209-02-22', '0000-00-00', 1),
(20213554, 'Otitis media', '2008-02-22', '0000-00-00', 0),
(20213555, 'Allergy to Fish', '1990-08-18', '0000-00-00', 1),
(20213555, 'Acute allergic reaction', '1990-08-18', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(20) NOT NULL,
  `patient_id` int(20) NOT NULL,
  `doctor_id` int(20) NOT NULL,
  `appointment_type` varchar(30) NOT NULL,
  `is_followup` tinyint(1) NOT NULL,
  `appointment_Dtime` datetime(6) NOT NULL,
  `doctor_charges` int(10) NOT NULL,
  `description` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `patient_id`, `doctor_id`, `appointment_type`, `is_followup`, `appointment_Dtime`, `doctor_charges`, `description`) VALUES
(3, 20213533, 206, 'Outpatient', 0, '2021-11-17 11:00:00.000000', 900, 'Problem in Chest'),
(4, 20213533, 206, 'Urgentcare', 1, '2021-11-17 11:45:00.000000', 900, 'Problem in Chest again'),
(5, 20213533, 206, 'Ambulatory', 1, '2021-11-17 10:15:00.000000', 900, 'Problem in breathing');

-- --------------------------------------------------------

--
-- Table structure for table `clinic`
--

CREATE TABLE `clinic` (
  `clinic_id` int(20) NOT NULL,
  `clinic_name` varchar(30) NOT NULL,
  `clinic_email` varchar(30) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `address` varchar(70) NOT NULL,
  `zip` int(10) NOT NULL,
  `city` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clinic`
--

INSERT INTO `clinic` (`clinic_id`, `clinic_name`, `clinic_email`, `contact_no`, `address`, `zip`, `city`) VALUES
(1, 'AIIMS Delhi', 'aiimsdelhi@gmail.com', '8545756986', 'Ansari Nagar East', 110029, 'Delhi'),
(2, 'Soni Hospital', 'sonihospitalbhl@gmail.com', '8574857859', 'Shastri Nagar', 311001, 'Bhilwara'),
(3, 'MG Hospital', 'mgh@gmail.com', '8574858968', 'MG road opp Mahalaxmi complex', 311001, 'Bhilwara');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(20) NOT NULL,
  `clinic_id` int(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `charges` int(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `degree` varchar(20) NOT NULL,
  `specialization` varchar(20) NOT NULL,
  `contact_no` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `clinic_id`, `first_name`, `last_name`, `email`, `password`, `charges`, `gender`, `degree`, `specialization`, `contact_no`) VALUES
(205, 2, 'Navdeep', 'Singh', 'navdeep@gmail.com', '$2a$08$r7Y9nmAjgIqxynqBn/4Vvu0', 500, '', 'MS', 'ENT', 8574858968),
(206, 3, 'Jainy', 'Sachdeva', 'jainy@gmail.com', '$2a$08$pFFO13Si54wO22LIRhrKOu7', 900, '', 'MS', 'ENT', 8574858968);

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `prescription_id` int(20) NOT NULL,
  `medicine` varchar(30) NOT NULL,
  `cost` int(10) NOT NULL,
  `breakfast` tinyint(1) NOT NULL,
  `lunch` tinyint(1) NOT NULL,
  `dinner` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`prescription_id`, `medicine`, `cost`, `breakfast`, `lunch`, `dinner`) VALUES
(1, 'Vitamin-C', 50, 1, 0, 1),
(1, 'dolo', 50, 0, 1, 0),
(1, 'Vitamin-C', 50, 1, 0, 1),
(1, 'Vitamin-C', 50, 1, 0, 1),
(1, 'rfreger', 50, 1, 1, 1),
(1, 'rrrrr', 50, 1, 0, 1),
(1, 'ppppp', 50, 1, 1, 1),
(18, 'Paracetamol', 30, 0, 1, 0),
(18, 'Calcium', 80, 1, 0, 1),
(19, 'Flexon', 40, 1, 0, 1),
(21, 'revotril-340', 40, 1, 0, 1),
(22, 'bp controler', 90, 1, 1, 1),
(23, 'dolo', 40, 1, 0, 1),
(24, 'paracetaamol', 50, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `operations`
--

CREATE TABLE `operations` (
  `patient_id` int(20) NOT NULL,
  `doctor_id` int(20) NOT NULL,
  `operation_date` date DEFAULT NULL,
  `operation_desc` text NOT NULL,
  `operation_cost` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`patient_id`, `doctor_id`, `operation_date`, `operation_desc`, `operation_cost`) VALUES
(20213537, 205, NULL, 'Blood Test', 334),
(20213532, 205, NULL, 'Blood Test', 300),
(20213532, 205, NULL, 'Urine Test', 300),
(20213531, 205, NULL, 'Blood Test', 300),
(20213531, 205, NULL, 'Urine Test', 300),
(20213544, 205, NULL, 'Blood Test', 300),
(20213544, 205, NULL, 'Urine Test', 300),
(20213541, 205, NULL, 'Blood Test', 400),
(20213541, 205, NULL, 'Stool Test', 400),
(20213538, 205, NULL, 'Blood Test', 500),
(20213555, 205, NULL, 'Blood Test', 300),
(20213555, 205, NULL, 'Blood Test', 300),
(20213555, 205, NULL, 'Urine Test', 300),
(20213532, 205, NULL, 'Blood Test', 500),
(20213533, 205, NULL, 'reger', 500),
(20213555, 205, NULL, 'rrrrr', 550),
(20213555, 205, NULL, 'ppppp', 550),
(20213555, 205, NULL, 'X-Ray', 400),
(20213555, 205, NULL, 'MRI', 600),
(20213555, 205, NULL, 'x-ray', 400),
(20213555, 205, NULL, 'MRI', 500),
(20213555, 205, NULL, 'x-ray', 400),
(20213537, 205, NULL, 'bp test', 200),
(20213537, 205, NULL, 'Blood Test', 400),
(20213537, 205, NULL, 'Blood Test', 400);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `age` int(3) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `alt_contact` bigint(20) NOT NULL,
  `address` varchar(70) NOT NULL,
  `city` varchar(20) NOT NULL,
  `county` varchar(20) NOT NULL,
  `marital_status` varchar(20) NOT NULL,
  `race` varchar(20) NOT NULL,
  `ethnicity` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `healthcare_coverage` int(20) NOT NULL,
  `healthcare_expense` int(20) NOT NULL,
  `caregiver_fname` varchar(20) NOT NULL,
  `caregiver_lname` varchar(20) NOT NULL,
  `caregiver_contact` bigint(20) NOT NULL,
  `caregiver_email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `first_name`, `last_name`, `age`, `email`, `password`, `contact_no`, `alt_contact`, `address`, `city`, `county`, `marital_status`, `race`, `ethnicity`, `gender`, `healthcare_coverage`, `healthcare_expense`, `caregiver_fname`, `caregiver_lname`, `caregiver_contact`, `caregiver_email`) VALUES
(20213529, 'Chirag ', 'Sawarn', 21, 'csawarn@gmail.com', '$2a$08$/FIucryfA5HODYSVvUaM/uhVmGUKeuFEk', 9857451256, 9854263524, 'Thapar Institute of Engineering and Technology', 'Delhi', 'Nantucket', 'single', 'asian', 'hispanic', 'Male', 0, 0, '', '', 0, ''),
(20213530, 'eer', 'rrr', 32, 'rohan@gmail.com', '$2a$08$fRGQ0UdGc276v4iigEw/h.MfH77I/6HGj', 2222222222, 3333333333, 'Qutub Vihar', 'Delhi', 'Norfolk', 'single', 'native', 'hispanic', 'Male', 0, 0, '', '', 0, ''),
(20213531, 'Priya', 'Hazare', 54, 'priya@gmail.com', '$2a$08$rAshQO7h1Q/X5eqvfUBC8.WaE7KNBZw4s', 8574589656, 7854859685, 'Qutub Vihar phase 2', 'Bhopal', 'Middlesex', 'single', 'white', 'hispanic', 'Female', 0, 0, '', '', 0, ''),
(20213532, 'Riya', 'Jain', 29, 'riya@gmail.com', '$2a$08$G2PH5u6GpST0ywZX3dgQBe2kaHQB8VC1f', 8574857859, 7548578963, 'C-60, Jahangir Nagar', 'Faridabad', 'Hampden', 'married', 'black', 'hispanic', 'Female', 0, 0, '', '', 0, ''),
(20213533, 'Rudransh', 'Joshi', 21, 'rudranshj95@gmail.com', '$2a$08$2T0MzWdcVwS8jk7ajymIHulBBV0d23vqx', 8949643569, 0, 'H-458 Shastri Nagar', 'Bhilwara', 'Middlesex', 'single', 'asian', 'hispanic', 'Male', 0, 0, '', '', 0, ''),
(20213534, 'Aman', 'Sisodia', 29, 'aman@gmail.com', '$2a$08$E9IhJaxRKUK9iSZGBjKLE.BSdqVUMlKUI', 7858785896, 0, 'T-90, Rohini East', 'Delhi', 'Middlesex', 'married', 'black', 'non-hispanic', 'Male', 0, 0, '', '', 0, ''),
(20213535, 'Manish', 'Sisodia', 24, 'manish@gmail.com', '$2a$08$XGkBSFLmc34AKmZp3mSOBu.EG3Bb1dZWP', 6949643569, 0, 'H-458 Shastri Nagar', 'Patiala', 'Hampshire', 'single', 'asian', 'hispanic', 'Male', 0, 0, 'Sheena', 'Chhabra', 8574857859, 'Sheena@gmail.com'),
(20213536, 'Monila', 'Singh', 21, 'monila@gmail.com', '$2a$08$rkPPJ./HwbsxvTUhEUbciu1NtscAVU7s0', 8574589656, 0, 'Rohini East, C-90', 'Delhi', 'Bristol', 'single', 'asian', 'non-hispanic', 'Female', 200000, 100000, 'Manjeet', 'Singh', 8574857859, 'manjeet@gmail.coms'),
(20213537, 'Shristhi', 'Joshi', 25, 'sj@gmail.com', '$2a$08$FPlfaWrI5R8Lo85idGpf1.0RGXhjLXm81', 8574857859, 0, 'H-458 Shastri Nagar', 'Bhilwara', 'Hampshire', 'married', 'asian', 'non-hispanic', 'Female', 5000000, 200000, 'Rudransh', 'Joshi', 8949643569, 'rudranshj95@gmail.com'),
(20213538, 'Shri', 'Joshi', 25, 'shri@gmail.com', '$2a$08$94IGGRXs03Dq3GGi0OTA3ueyTRRY.Ts6p', 8574857859, 0, 'H-458 Shastri Nagar', 'Bhilwara', 'Essex', 'married', 'white', 'non-hispanic', 'Female', 300000, 200000, 'Jignesh', 'Jain', 875485785, 'jig@gmail.com'),
(20213539, 'sdsd', 'ewdwed', 21, 'wewe@gmail.com', '$2a$08$.GHR0slRd.qdAlq6V2INouHUCKxY3p5Y.', 3333333333, 0, 'H-458 Shastri Nagar', 'Patiala', 'Hampden', 'single', 'black', 'non-hispanic', 'Female', 3333, 33, 'er', 'rerer', 8949643569, 'john@gmail.com'),
(20213540, 'dede', 'dede', 21, 'emma@gmail.com', '$2a$08$ds9DontDBCYOHio3erJE0OcuXwP0gJdjg', 8949643569, 0, 'H-458 Shastri Nagar', 'Bhilwara', 'Franklin', 'married', 'asian', 'non-hispanic', 'Male', 33333, 3, 'dede', 'dee', 2222222222, 'ee@gmail.com'),
(20213541, 'dvdfvdvdv', 'dfvdfvdfvd', 21, 'varun@gmail.com', '$2a$08$vJVY3z6/YrDqNbtyT4lH4OZrlq/Nci9Jz', 8949643569, 0, 'H-458 Shastri Nagar', 'Patiala', 'Bristol', 'single', 'asian', 'hispanic', 'Male', 3333, 3, 'dsadasd', 'sdadasda', 5555555555, 'rudranshj95@gmail.com'),
(20213542, 'eeeeeeee', 'Joshi', 21, 'john@gmail.com', '$2a$08$uSdMVym3BrzoI89yH2Zu9O26jDqv6R2b5', 8949643569, 0, 'H-458 Shastri Nagar', 'Patiala', 'Barnstable', 'single', 'black', 'hispanic', 'Female', 333, 33, 'dededed', 'dedede', 3333333333, 'priya@gmail.com'),
(20213543, 'edfef', 'fefefe', 32, 'f@gmail.com', '$2a$08$v/w2Ak6Muf95s69R9On..OhykxweRKrSe', 2222222222, 0, 'H-458 Shastri Nagar', 'Delhi', 'Middlesex', 'single', 'asian', 'hispanic', 'Male', 33333, 333, 'Rudransh', 'Joshi', 918949643569, 'priya@gmail.com'),
(20213544, 'gg', 'hh', 34, 'gg@gmail.com', '$2a$08$7GZXFKmb80/EfpqeUA9K1eDp1uWz9Ij6V', 8574589656, 0, 'Thapar Institute of Engineering and Technology', 'Delhi', 'Middlesex', 'single', 'asian', 'hispanic', 'Female', 44444, 444, 'deded', 'dede', 8574589656, 'aisha@gmail.com'),
(20213554, 'dd', 'dd', 21, 'vv@gmail.com', '$2a$08$dOpjdddh7RZPj50zkrhaBesoLWtV0hrbP', 2222222222, 0, 'Thapar Institute of Engineering and Technology', 'Bhilwara', 'Essex', 'single', 'asian', 'hispanic', 'Male', 2222, 22, 'frfer', 'frfr', 2222222222, 'priya@gmail.com'),
(20213555, 'Padma ', 'Joshi', 45, 'sanidhiyafirefox123@gmail.com', '$2a$08$uQxQIIhbmI0qCFOMkihrweC41j5O0edOH', 8306294976, 0, 'H-458 Shastri Nagar', 'Bhilwara', 'Hampden', 'married', 'asian', 'non-hispanic', 'Female', 500000, 200000, 'Manoj', 'Joshi', 9414279099, 'manoj@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `patient_id` int(20) NOT NULL,
  `doctor_id` int(20) NOT NULL,
  `prescription_start` date NOT NULL,
  `prescription_end` date NOT NULL,
  `prescription_id` int(20) NOT NULL,
  `symptoms` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`patient_id`, `doctor_id`, `prescription_start`, `prescription_end`, `prescription_id`, `symptoms`) VALUES
(20213555, 205, '2021-11-15', '2021-11-30', 1, 'Fever'),
(20213555, 205, '2021-02-22', '2021-02-28', 18, 'Joint Pain'),
(20213555, 205, '2021-03-04', '2021-03-10', 19, 'Muscle pain'),
(20213555, 205, '2021-08-20', '2021-08-25', 20, 'Vomiting'),
(20213555, 205, '2021-03-31', '2021-04-06', 21, 'Feet pain'),
(20213537, 205, '2021-02-22', '0000-00-00', 22, 'HIgh BP'),
(20213537, 205, '2021-02-02', '2021-02-06', 23, 'Head pain'),
(20213537, 205, '2021-03-31', '2021-04-16', 24, 'BP');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `patient_id` int(20) NOT NULL,
  `initial_scan_date` date NOT NULL,
  `scanned_bodysite` varchar(20) NOT NULL,
  `scan_type` varchar(30) NOT NULL,
  `report_doc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allergic_conditions`
--
ALTER TABLE `allergic_conditions`
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `clinic`
--
ALTER TABLE `clinic`
  ADD PRIMARY KEY (`clinic_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `clinic_id` (`clinic_id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD KEY `prescription_id` (`prescription_id`);

--
-- Indexes for table `operations`
--
ALTER TABLE `operations`
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD KEY `patient_id` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clinic`
--
ALTER TABLE `clinic`
  MODIFY `clinic_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20213556;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `prescription_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allergic_conditions`
--
ALTER TABLE `allergic_conditions`
  ADD CONSTRAINT `allergic_conditions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medicines`
--
ALTER TABLE `medicines`
  ADD CONSTRAINT `medicines_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`prescription_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `operations`
--
ALTER TABLE `operations`
  ADD CONSTRAINT `operations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operations_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
