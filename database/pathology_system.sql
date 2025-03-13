-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2025 at 02:09 PM
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
-- Database: `pathology_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `pathologists`
--

CREATE TABLE `pathologists` (
  `id` int(11) NOT NULL,
  `p_id` varchar(20) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `contact` varchar(10) NOT NULL,
  `address` text NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `gender` enum('male','female','other') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pathologists`
--

INSERT INTO `pathologists` (`id`, `p_id`, `last_name`, `first_name`, `middle_name`, `contact`, `address`, `specialization`, `gender`) VALUES
(3, '103', 'patil', 'ankita', 'arun', '9087654321', 'Kolhapur', 'xyz', 'female'),
(4, '112', 'Joke', 'Pramod', 'Shahu', '9087654321', 'Dundage', 'molecular', 'male'),
(5, '123', 'Kadam ', 'Harsh', 'Suresh', '7057468260', 'gadhinglaj', 'bsc', 'male'),
(6, '124', 'Patil', 'Pragati', 'Hanamant', '9527757631', 'Pune', 'mbbs', 'female');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `age` int(11) NOT NULL,
  `test_first_name` varchar(100) NOT NULL,
  `test_last_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `first_name`, `last_name`, `gender`, `blood_group`, `phone_number`, `dob`, `age`, `test_first_name`, `test_last_name`, `created_at`) VALUES
(22, 'Virendra', 'Desai', 'Male', 'B+', '9834402542', '2001-04-28', 23, 'pqr', 'xyz', '2025-03-07 13:27:44'),
(35, 'Harsh', 'Kadam', 'Male', 'A+', '7057468260', '2001-04-30', 21, 'Harsh', 'Kadam', '2025-03-10 05:41:25'),
(38, 'Pramod', 'Joke', 'Male', 'B+', '9380531339', '2002-09-04', 22, 'Pramod', 'Joke', '2025-03-10 07:06:24'),
(40, 'Suraj', 'Valatkar', 'Male', 'A+', '9067886689', '2002-08-06', 22, 'Suraj', 'Valatkar', '2025-03-10 07:07:54'),
(41, 'Badri', 'Kokitkar', 'Male', 'B+', '9876542312', '2001-03-12', 23, 'Badri', 'Kokitkar', '2025-03-10 07:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `patient_samples`
--

CREATE TABLE `patient_samples` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `environment` varchar(100) NOT NULL,
  `collection_date` date NOT NULL,
  `blood_group` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patient_samples`
--

INSERT INTO `patient_samples` (`id`, `first_name`, `last_name`, `dob`, `gender`, `contact`, `email`, `address`, `environment`, `collection_date`, `blood_group`) VALUES
(2, 'Vaishnavi', 'Desai', '2005-03-25', 'female', '6789012345', 'xyz@gmail.com', 'Dundage', 'pqr', '2025-03-06', 'O-'),
(3, 'Vaishnavi', 'Desai', '2002-02-02', 'female', '8834402540', 'vsd@gmail.com', 'Dundage', 'pqr', '2025-06-25', 'O-'),
(7, 'Harsh', 'Kadam', '2001-04-30', 'male', '7057468260', 'kadam3042001@gmai.com', 'Gadhinglaj', 'xyz', '2022-02-20', 'A+'),
(10, 'Pragati', 'Patil', '2000-07-27', 'female', '9527757631', 'Patil2772000@gmai.com', 'Pune', 'pqr', '2022-02-20', 'A+'),
(11, 'Gauri', 'Shevale', '2000-02-12', 'female', '7030177415', 'Shevale1222000@gmai.com', 'Mumbai', 'abc', '2022-02-20', 'A+'),
(12, 'Supriya', 'Kumbhar', '2000-04-23', 'female', '9421052574', 'Kumbhar2342000@gmai.com', 'Kolhapur', 'abc', '2022-02-20', 'A+');

-- --------------------------------------------------------

--
-- Table structure for table `phiebotamist`
--

CREATE TABLE `phiebotamist` (
  `id` int(11) NOT NULL,
  `p_id` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `contact_no` varchar(10) NOT NULL,
  `address` text NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `phiebotamist`
--

INSERT INTO `phiebotamist` (`id`, `p_id`, `last_name`, `first_name`, `middle_name`, `contact_no`, `address`, `gender`) VALUES
(3, '2', 'xyz', 'abc', 'pqr', '1234567890', 'Gadhinglaj', 'Male'),
(4, '123', 'Kadam', 'Harsh', 'Suresh', '7057468260', 'Gadhinglaj', 'Male'),
(5, '124', 'Patil', 'Pragati', 'Hanamant', '9527757631', 'Pune', 'Female'),
(6, '125', 'Kumbhar', 'Supriya', 'Subhash', '7030177415', 'Kolhapur', 'Female'),
(8, '126', 'Shevale', 'Gauri', 'Vijay', '9421057514', 'Mumbai', 'Female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pathologists`
--
ALTER TABLE `pathologists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `p_id` (`p_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `patient_samples`
--
ALTER TABLE `patient_samples`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `phiebotamist`
--
ALTER TABLE `phiebotamist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `p_id` (`p_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pathologists`
--
ALTER TABLE `pathologists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `patient_samples`
--
ALTER TABLE `patient_samples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `phiebotamist`
--
ALTER TABLE `phiebotamist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
