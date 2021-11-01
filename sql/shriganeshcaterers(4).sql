-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2021 at 03:49 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shriganeshcaterers`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(20) NOT NULL,
  `role_id` int(20) DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `auth_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `secret_key` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `access_key` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `refresh_key` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `verification_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `profile_video` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email_verify` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `mobile_number_verify` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `email_otp` int(6) DEFAULT NULL,
  `mobile_number_otp` int(6) DEFAULT NULL,
  `emergency_mobile_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('','Male','Female','Other') COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `religion_id` int(20) DEFAULT NULL,
  `about_me` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `society` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `role_id`, `status`, `status_at`, `created_at`, `updated_at`, `auth_key`, `secret_key`, `access_key`, `refresh_key`, `first_name`, `last_name`, `middle_name`, `username`, `email_id`, `mobile_number`, `password`, `password_reset_token`, `verification_token`, `avatar`, `profile_video`, `email_verify`, `mobile_number_verify`, `email_otp`, `mobile_number_otp`, `emergency_mobile_number`, `gender`, `birthdate`, `religion_id`, `about_me`, `description`, `society`, `ip_address`) VALUES
(1, 1, 'Active', NULL, NULL, NULL, '', '', '', '', 'Maulik', 'Patel', 'Bharatbhai', 'maulikpatel240', 'maulikpatel240@gmail.com', '6354800439', '$2y$13$P1O7LTo.IDHD2S5kkBGbpeVt8JKjKnjEsxxcC2ny3.hBEf/qs10Bi', '', '', '', '', 'Yes', 'Yes', NULL, NULL, '9624810855', 'Male', NULL, 2, '', '', '', NULL),
(2, 2, 'Active', NULL, NULL, NULL, '', '', '', '', 'dhruvil', 'Upadhyay', '', 'dhruvilup', 'dhruvilup@gmail.com', '9601609006', '$2y$13$5esTBvsAY69xfs1FNUW.6OkEMwtqfWzNAPhMzssAWXCPSy9j.pXJq', '', '', '', '', 'Yes', 'Yes', NULL, NULL, '9624810855', 'Male', NULL, 2, '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `booking_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `mobile` varchar(16) NOT NULL,
  `time_type` enum('Breakfast','Lunch','Dinner') DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `people` int(10) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Pending','Booked','Approved','Partial','Paid') NOT NULL DEFAULT 'Pending',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `menu` text NOT NULL,
  `total_price` float(10,2) DEFAULT NULL,
  `payment_type` enum('','Partial','Full') NOT NULL DEFAULT '',
  `partial_price` float(10,2) DEFAULT NULL,
  `total_pay_price` float(10,2) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `booking_id`, `name`, `email`, `phone`, `mobile`, `time_type`, `datetime`, `people`, `message`, `status`, `status_at`, `created_at`, `updated_at`, `menu`, `total_price`, `payment_type`, `partial_price`, `total_pay_price`, `paid_at`) VALUES
(1, 'GC0001', 'ketenbhai badshah', 'sgcvinod@gmail.com', '098-254-6897', '987-917-8091', NULL, '2021-10-23 06:00:00', 300, 'matrushri farm motavaracha', 'Booked', '2021-10-11 08:23:42', '2021-10-11 08:23:42', '2021-10-11 23:33:03', '20,21,25,30,4,9,22,10,11,12,14,15,16,17,19,23,24,26,27,28', 451.00, '', NULL, NULL, NULL),
(5, 'GC0005', 'pappubhai motavar', '', '971-293-3933', '971-293-3933', NULL, '2021-11-17 17:30:00', 400, 'motavaracha', 'Booked', '2021-10-14 15:20:31', '2021-10-14 15:20:31', '2021-10-14 15:20:31', '20,21,4,97,51,103,23,24,26,79', 94000.00, '', NULL, NULL, NULL),
(6, 'GC0006', 'ritesbhai bhatrijo', 'sgcvinod@gmail.com', '098-254-6897', '098-254-6897', NULL, '2021-10-21 11:00:00', 150, 'savare 11=00 am', 'Booked', '2021-10-14 23:04:43', '2021-10-14 23:04:43', '2021-10-19 09:55:53', '20,29,3,36,106,43,44,38,105', 175.00, '', NULL, NULL, NULL),
(7, 'GC0007', 'girishbhai karanpark hastak', '', '942-615-9922', '942-615-9922', NULL, '2021-10-27 18:00:00', 160, 'rasoi goddod rod telephon quaters ma banavi', 'Paid', '2021-10-16 08:52:55', '2021-10-16 08:52:55', '2021-10-16 08:55:12', '1,8,20,29,3,32,51,109,28,38,80', 225.00, 'Full', 0.00, 225.00, '2021-10-16 08:57:13'),
(10, 'GC0010', 'bharatbhai natali', '', '982-542-5490', '982-542-5490', NULL, '2021-11-21 12:30:00', 400, 'home', 'Booked', '2021-10-17 14:37:17', '2021-10-17 14:37:17', '2021-10-17 14:37:17', '8,25,39,40,154,156,114,115,131,155,153,26,28,139,113,128', 1.00, '', NULL, NULL, NULL),
(11, 'GC0011', 'saritbhai motavaracha', '', '982-510-7555', '982-510-7555', NULL, '2021-10-15 12:30:00', 100, 'dayalji ashram', 'Booked', '2021-10-17 19:43:13', '2021-10-17 19:43:13', '2021-10-17 19:43:13', '1,8,20,21,25,59,82,28,105', 12000.00, '', NULL, NULL, NULL),
(12, 'GC0012', 'test', 'test@gmail.com', '231-312-3213', '', NULL, '2021-10-13 02:33:00', 333, 'test', 'Pending', '2021-10-20 17:39:48', '2021-10-20 17:39:48', '2021-10-20 17:39:48', '1,29,3', 3000.00, '', NULL, NULL, NULL),
(13, 'GC0013', 'test', 'test@gmail.com', '231-312-3213', '', NULL, '2021-10-13 02:33:00', 333, 'test', 'Pending', '2021-10-20 17:40:53', '2021-10-20 17:40:53', '2021-10-20 17:40:53', '1,29,3', 3000.00, '', NULL, NULL, NULL),
(14, 'GC0014', 'test', 'test@gmail.com', '231-312-3213', '', NULL, '2021-10-13 02:33:00', 333, 'test', 'Pending', '2021-10-20 17:46:19', '2021-10-20 17:46:19', '2021-10-20 17:46:19', '1,29,3', 3000.00, '', NULL, NULL, NULL),
(15, 'GC0015', 'test', 'test@gmail.com', '231-312-3213', '', NULL, '2021-10-13 02:33:00', 333, 'test', 'Pending', '2021-10-20 17:46:49', '2021-10-20 17:46:49', '2021-10-20 17:46:49', '1,29,3', 3000.00, '', NULL, NULL, NULL),
(16, 'GC0016', 'test', 'test@gmail.com', '231-312-3213', '', NULL, '2021-10-13 02:33:00', 333, 'test', 'Booked', '2021-10-20 17:47:08', '2021-10-20 17:47:08', '2021-10-20 17:47:08', '1,29,3', 3000.00, '', NULL, NULL, NULL),
(17, 'GC0017', 'test', 'test@gmail.com', '231-312-3213', '', 'Dinner', '2021-10-13 02:33:00', 333, 'test', 'Booked', '2021-10-20 17:47:44', '2021-10-20 17:47:44', '2021-10-22 23:41:10', '3,1,29', 3000.00, '', NULL, NULL, NULL),
(18, 'GC0018', 'test', 'test@gmail.com', '231-312-3213', '', 'Lunch', '2021-10-13 02:33:00', 333, 'test', 'Booked', '2021-10-20 17:47:59', '2021-10-20 17:47:59', '2021-10-22 23:41:02', '3,1,25', 3000.00, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking_items`
--

CREATE TABLE `booking_items` (
  `id` int(20) NOT NULL,
  `booking_id` int(20) NOT NULL,
  `menu_category_id` int(20) DEFAULT NULL,
  `menu_id` int(20) DEFAULT NULL,
  `menu_list` text NOT NULL,
  `item_id` int(20) NOT NULL,
  `item_category_id` int(20) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `unit` enum('','Kilogram','Gram','Litre','Other') NOT NULL,
  `INR` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_items`
--

INSERT INTO `booking_items` (`id`, `booking_id`, `menu_category_id`, `menu_id`, `menu_list`, `item_id`, `item_category_id`, `weight`, `unit`, `INR`, `created_at`, `updated_at`) VALUES
(69, 1, NULL, NULL, '20- puri (puri),21- rotli (rotli)', 46, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(70, 1, NULL, NULL, '20- puri (puri),9- paneer chilli roll (paneer chilli roll),22- dil se (dil se),14- paneer kurkure (paneer kurkure),16- live ghevar (live ghevar)', 47, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(71, 1, NULL, NULL, '21- rotli (rotli),16- live ghevar (live ghevar),23- dal tadka (dal tadka),24- jeera rice (jeera rice)', 527, 3, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(72, 1, NULL, NULL, '25- papad (papad),14- paneer kurkure (paneer kurkure)', 138, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(73, 1, NULL, NULL, '30- methiya marcha (methiya marcha)', 157, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(74, 1, NULL, NULL, '30- methiya marcha (methiya marcha)', 158, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(75, 1, NULL, NULL, '30- methiya marcha (methiya marcha)', 374, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(76, 1, NULL, NULL, '4- Undhiyu (Undhiyu)', 41, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(77, 1, NULL, NULL, '4- Undhiyu (Undhiyu),22- dil se (dil se)', 73, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(78, 1, NULL, NULL, '4- Undhiyu (Undhiyu)', 74, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(79, 1, NULL, NULL, '4- Undhiyu (Undhiyu)', 310, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(80, 1, NULL, NULL, '4- Undhiyu (Undhiyu)', 311, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(81, 1, NULL, NULL, '4- Undhiyu (Undhiyu)', 313, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(82, 1, NULL, NULL, '4- Undhiyu (Undhiyu)', 314, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(83, 1, NULL, NULL, '4- Undhiyu (Undhiyu),22- dil se (dil se)', 318, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(84, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),22- dil se (dil se),16- live ghevar (live ghevar)', 48, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(85, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),11- green asian (green asian),12- khawse soup (khawse soup),14- paneer kurkure (paneer kurkure),15- cheese bollwith jelipino (cheese bollwith jelipino)', 50, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(86, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),22- dil se (dil se),12- khawse soup (khawse soup),14- paneer kurkure (paneer kurkure)', 62, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(87, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll)', 63, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(88, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),11- green asian (green asian)', 64, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(89, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),22- dil se (dil se),11- green asian (green asian),12- khawse soup (khawse soup)', 65, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(90, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),11- green asian (green asian),27- mexican salad (mexican salad)', 71, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(91, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),11- green asian (green asian),27- mexican salad (mexican salad)', 72, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(92, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),14- paneer kurkure (paneer kurkure),15- cheese bollwith jelipino (cheese bollwith jelipino)', 163, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(93, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),19- cheese paneer maala (cheese paneer masala),23- dal tadka (dal tadka),26- green salad (green salad)', 316, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(94, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),22- dil se (dil se),11- green asian (green asian),12- khawse soup (khawse soup),27- mexican salad (mexican salad)', 329, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(95, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),22- dil se (dil se),11- green asian (green asian),12- khawse soup (khawse soup),27- mexican salad (mexican salad)', 330, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(96, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),22- dil se (dil se),11- green asian (green asian),12- khawse soup (khawse soup),27- mexican salad (mexican salad)', 331, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(97, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll)', 336, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(98, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll)', 337, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(99, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),22- dil se (dil se),11- green asian (green asian)', 341, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(100, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll)', 232, 5, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(101, 1, NULL, NULL, '9- paneer chilli roll (paneer chilli roll),14- paneer kurkure (paneer kurkure)', 520, 3, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(102, 1, NULL, NULL, '22- dil se (dil se)', 18, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(103, 1, NULL, NULL, '22- dil se (dil se)', 67, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(104, 1, NULL, NULL, '22- dil se (dil se),11- green asian (green asian),15- cheese bollwith jelipino (cheese bollwith jelipino),27- mexican salad (mexican salad)', 69, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(105, 1, NULL, NULL, '22- dil se (dil se),11- green asian (green asian),15- cheese bollwith jelipino (cheese bollwith jelipino),27- mexican salad (mexican salad)', 70, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(106, 1, NULL, NULL, '22- dil se (dil se),27- mexican salad (mexican salad)', 86, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(107, 1, NULL, NULL, '22- dil se (dil se),19- cheese paneer maala (cheese paneer masala)', 100, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(108, 1, NULL, NULL, '22- dil se (dil se),10- fruit punch (fruit punch),14- paneer kurkure (paneer kurkure),15- cheese bollwith jelipino (cheese bollwith jelipino),27- mexican salad (mexican salad)', 114, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(109, 1, NULL, NULL, '22- dil se (dil se)', 161, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(110, 1, NULL, NULL, '22- dil se (dil se)', 320, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(111, 1, NULL, NULL, '22- dil se (dil se),27- mexican salad (mexican salad)', 335, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(112, 1, NULL, NULL, '22- dil se (dil se),11- green asian (green asian),26- green salad (green salad)', 342, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(113, 1, NULL, NULL, '10- fruit punch (fruit punch)', 51, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(114, 1, NULL, NULL, '10- fruit punch (fruit punch)', 133, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(115, 1, NULL, NULL, '10- fruit punch (fruit punch)', 165, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(116, 1, NULL, NULL, '10- fruit punch (fruit punch)', 348, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(117, 1, NULL, NULL, '10- fruit punch (fruit punch)', 353, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(118, 1, NULL, NULL, '10- fruit punch (fruit punch)', 375, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(119, 1, NULL, NULL, '10- fruit punch (fruit punch)', 376, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(120, 1, NULL, NULL, '10- fruit punch (fruit punch)', 397, 4, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(121, 1, NULL, NULL, '10- fruit punch (fruit punch)', 398, 4, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(122, 1, NULL, NULL, '10- fruit punch (fruit punch)', 406, 4, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(123, 1, NULL, NULL, '11- green asian (green asian)', 66, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(124, 1, NULL, NULL, '11- green asian (green asian)', 332, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(125, 1, NULL, NULL, '11- green asian (green asian)', 339, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(126, 1, NULL, NULL, '11- green asian (green asian)', 378, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(127, 1, NULL, NULL, '11- green asian (green asian),12- khawse soup (khawse soup)', 407, 4, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(128, 1, NULL, NULL, '11- green asian (green asian),12- khawse soup (khawse soup)', 488, 6, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(129, 1, NULL, NULL, '11- green asian (green asian),12- khawse soup (khawse soup),19- cheese paneer maala (cheese paneer masala)', 523, 3, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(130, 1, NULL, NULL, '11- green asian (green asian),12- khawse soup (khawse soup),19- cheese paneer maala (cheese paneer masala)', 528, 3, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(131, 1, NULL, NULL, '12- khawse soup (khawse soup)', 90, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(132, 1, NULL, NULL, '12- khawse soup (khawse soup)', 143, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(133, 1, NULL, NULL, '12- khawse soup (khawse soup)', 145, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(134, 1, NULL, NULL, '12- khawse soup (khawse soup)', 146, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(135, 1, NULL, NULL, '12- khawse soup (khawse soup)', 153, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(136, 1, NULL, NULL, '12- khawse soup (khawse soup),19- cheese paneer maala (cheese paneer masala),23- dal tadka (dal tadka)', 317, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(137, 1, NULL, NULL, '12- khawse soup (khawse soup),19- cheese paneer maala (cheese paneer masala),23- dal tadka (dal tadka)', 319, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(138, 1, NULL, NULL, '12- khawse soup (khawse soup)', 526, 3, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(139, 1, NULL, NULL, '14- paneer kurkure (paneer kurkure)', 91, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(140, 1, NULL, NULL, '14- paneer kurkure (paneer kurkure)', 160, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(141, 1, NULL, NULL, '14- paneer kurkure (paneer kurkure)', 421, 4, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(142, 1, NULL, NULL, '15- cheese bollwith jelipino (cheese bollwith jelipino)', 171, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(143, 1, NULL, NULL, '15- cheese bollwith jelipino (cheese bollwith jelipino)', 405, 4, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(144, 1, NULL, NULL, '16- live ghevar (live ghevar)', 25, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(145, 1, NULL, NULL, '16- live ghevar (live ghevar)', 27, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(146, 1, NULL, NULL, '16- live ghevar (live ghevar)', 28, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(147, 1, NULL, NULL, '16- live ghevar (live ghevar)', 29, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(148, 1, NULL, NULL, '16- live ghevar (live ghevar)', 147, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(149, 1, NULL, NULL, '16- live ghevar (live ghevar)', 228, 5, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(150, 1, NULL, NULL, '17- ras malai (ra malai)', 266, 5, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(151, 1, NULL, NULL, '19- cheese paneer maala (cheese paneer masala)', 103, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(152, 1, NULL, NULL, '19- cheese paneer maala (cheese paneer masala)', 104, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(153, 1, NULL, NULL, '19- cheese paneer maala (cheese paneer masala)', 105, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(154, 1, NULL, NULL, '19- cheese paneer maala (cheese paneer masala)', 106, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(155, 1, NULL, NULL, '19- cheese paneer maala (cheese paneer masala)', 108, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(156, 1, NULL, NULL, '19- cheese paneer maala (cheese paneer masala)', 109, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(157, 1, NULL, NULL, '19- cheese paneer maala (cheese paneer masala)', 110, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(158, 1, NULL, NULL, '19- cheese paneer maala (cheese paneer masala)', 111, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(159, 1, NULL, NULL, '19- cheese paneer maala (cheese paneer masala)', 518, 3, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(160, 1, NULL, NULL, '19- cheese paneer maala (cheese paneer masala)', 521, 3, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(161, 1, NULL, NULL, '23- dal tadka (dal tadka)', 37, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(162, 1, NULL, NULL, '23- dal tadka (dal tadka)', 38, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(163, 1, NULL, NULL, '23- dal tadka (dal tadka),24- jeera rice (jeera rice)', 101, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(164, 1, NULL, NULL, '23- dal tadka (dal tadka),24- jeera rice (jeera rice)', 102, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(165, 1, NULL, NULL, '24- jeera rice (jeera rice)', 59, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(166, 1, NULL, NULL, '24- jeera rice (jeera rice)', 75, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(167, 1, NULL, NULL, '26- green salad (green salad)', 343, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(168, 1, NULL, NULL, '26- green salad (green salad)', 344, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(169, 1, NULL, NULL, '26- green salad (green salad)', 345, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(170, 1, NULL, NULL, '27- mexican salad (mexican salad)', 45, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(171, 1, NULL, NULL, '27- mexican salad (mexican salad)', 371, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(172, 1, NULL, NULL, '28- keri nu athanu (keri nu athanu)', 180, 1, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(173, 1, NULL, NULL, '28- keri nu athanu (keri nu athanu)', 346, 2, '', '', '', '2021-10-11 23:33:03', '2021-10-11 23:33:03'),
(268, 5, NULL, NULL, '20- puri,21- rotli', 46, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(269, 5, NULL, NULL, '20- puri,97- tuvar vata ni ni kacori', 47, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(270, 5, NULL, NULL, '21- rotli,23- dal tadka,24- jeera rice', 527, 3, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(271, 5, NULL, NULL, '4- Undhiyu', 41, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(272, 5, NULL, NULL, '4- Undhiyu,97- tuvar vata ni ni kacori', 73, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(273, 5, NULL, NULL, '4- Undhiyu', 74, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(274, 5, NULL, NULL, '4- Undhiyu', 310, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(275, 5, NULL, NULL, '4- Undhiyu', 311, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(276, 5, NULL, NULL, '4- Undhiyu', 313, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(277, 5, NULL, NULL, '4- Undhiyu', 314, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(278, 5, NULL, NULL, '4- Undhiyu,97- tuvar vata ni ni kacori', 318, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(279, 5, NULL, NULL, '97- tuvar vata ni ni kacori', 17, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(280, 5, NULL, NULL, '97- tuvar vata ni ni kacori', 22, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(281, 5, NULL, NULL, '97- tuvar vata ni ni kacori', 23, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(282, 5, NULL, NULL, '97- tuvar vata ni ni kacori', 68, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(283, 5, NULL, NULL, '97- tuvar vata ni ni kacori', 312, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(284, 5, NULL, NULL, '97- tuvar vata ni ni kacori', 386, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(285, 5, NULL, NULL, '97- tuvar vata ni ni kacori', 224, 5, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(286, 5, NULL, NULL, '51- sitafal rabdi', 147, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(287, 5, NULL, NULL, '51- sitafal rabdi', 165, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(288, 5, NULL, NULL, '51- sitafal rabdi', 253, 5, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(289, 5, NULL, NULL, '51- sitafal rabdi', 526, 3, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(290, 5, NULL, NULL, '103- paneer angara,24- jeera rice', 75, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(291, 5, NULL, NULL, '103- paneer angara', 91, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(292, 5, NULL, NULL, '103- paneer angara', 100, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(293, 5, NULL, NULL, '103- paneer angara', 103, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(294, 5, NULL, NULL, '103- paneer angara', 104, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(295, 5, NULL, NULL, '103- paneer angara', 105, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(296, 5, NULL, NULL, '103- paneer angara', 108, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(297, 5, NULL, NULL, '103- paneer angara', 109, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(298, 5, NULL, NULL, '103- paneer angara', 110, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(299, 5, NULL, NULL, '103- paneer angara', 111, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(300, 5, NULL, NULL, '103- paneer angara', 153, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(301, 5, NULL, NULL, '103- paneer angara,23- dal tadka,26- green salad', 316, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(302, 5, NULL, NULL, '103- paneer angara,23- dal tadka,26- green salad', 317, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(303, 5, NULL, NULL, '103- paneer angara,23- dal tadka', 319, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(304, 5, NULL, NULL, '103- paneer angara', 258, 5, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(305, 5, NULL, NULL, '103- paneer angara', 518, 3, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(306, 5, NULL, NULL, '103- paneer angara', 520, 3, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(307, 5, NULL, NULL, '103- paneer angara', 523, 3, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(308, 5, NULL, NULL, '103- paneer angara', 528, 3, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(309, 5, NULL, NULL, '23- dal tadka', 37, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(310, 5, NULL, NULL, '23- dal tadka', 38, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(311, 5, NULL, NULL, '23- dal tadka,24- jeera rice', 101, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(312, 5, NULL, NULL, '23- dal tadka,24- jeera rice', 102, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(313, 5, NULL, NULL, '24- jeera rice', 59, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(314, 5, NULL, NULL, '26- green salad', 342, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(315, 5, NULL, NULL, '26- green salad', 343, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(316, 5, NULL, NULL, '26- green salad', 344, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(317, 5, NULL, NULL, '26- green salad', 345, 2, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(318, 5, NULL, NULL, '79- rosted papad', 138, 1, '', '', '', '2021-10-14 15:20:31', '2021-10-14 15:20:31'),
(319, 6, NULL, NULL, '20- puri', 46, 1, '7', 'Kilogram', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(413, 7, NULL, NULL, '1- dal', 38, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(414, 7, NULL, NULL, '1- dal', 39, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(415, 7, NULL, NULL, '1- dal', 40, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(416, 7, NULL, NULL, '1- dal,3- panchkutiyu', 41, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(417, 7, NULL, NULL, '1- dal', 42, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(418, 7, NULL, NULL, '8- bhaat', 60, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(419, 7, NULL, NULL, '8- bhaat,109- mohanthal', 527, 3, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(420, 7, NULL, NULL, '20- puri', 46, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(421, 7, NULL, NULL, '20- puri', 47, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(422, 7, NULL, NULL, '3- panchkutiyu', 73, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(423, 7, NULL, NULL, '3- panchkutiyu', 308, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(424, 7, NULL, NULL, '3- panchkutiyu', 311, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(425, 7, NULL, NULL, '3- panchkutiyu', 312, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(426, 7, NULL, NULL, '3- panchkutiyu', 313, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(427, 7, NULL, NULL, '3- panchkutiyu', 314, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(428, 7, NULL, NULL, '3- panchkutiyu', 316, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(429, 7, NULL, NULL, '29- janrel masala,3- panchkutiyu', 318, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(430, 7, NULL, NULL, '32- kela methi bhajiya', 19, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(431, 7, NULL, NULL, '32- kela methi bhajiya', 20, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(432, 7, NULL, NULL, '32- kela methi bhajiya', 48, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(433, 7, NULL, NULL, '32- kela methi bhajiya', 357, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(434, 7, NULL, NULL, '32- kela methi bhajiya', 539, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(435, 7, NULL, NULL, '51- sitafal rabdi', 147, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(436, 7, NULL, NULL, '51- sitafal rabdi', 165, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(437, 7, NULL, NULL, '51- sitafal rabdi', 253, 5, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(438, 7, NULL, NULL, '51- sitafal rabdi', 526, 3, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(439, 7, NULL, NULL, '29- janrel masala,109- mohanthal', 13, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(440, 7, NULL, NULL, '109- mohanthal', 28, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(441, 7, NULL, NULL, '109- mohanthal', 93, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(442, 7, NULL, NULL, '109- mohanthal', 222, 5, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(443, 7, NULL, NULL, '28- keri nu athanu', 180, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(444, 7, NULL, NULL, '28- keri nu athanu', 346, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(445, 7, NULL, NULL, '38- papad papdi', 138, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(446, 7, NULL, NULL, '80- kobij no sambharo', 341, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(447, 7, NULL, NULL, '80- kobij no sambharo', 342, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(448, 7, NULL, NULL, '80- kobij no sambharo', 343, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(449, 7, NULL, NULL, '80- kobij no sambharo', 352, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(450, 7, NULL, NULL, '80- kobij no sambharo', 356, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(451, 7, NULL, NULL, '80- kobij no sambharo', 374, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(452, 7, NULL, NULL, '29- janrel masala', 1, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(453, 7, NULL, NULL, '29- janrel masala', 2, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(454, 7, NULL, NULL, '29- janrel masala', 3, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(455, 7, NULL, NULL, '29- janrel masala', 4, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(456, 7, NULL, NULL, '29- janrel masala', 5, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(457, 7, NULL, NULL, '29- janrel masala', 6, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(458, 7, NULL, NULL, '29- janrel masala', 8, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(459, 7, NULL, NULL, '29- janrel masala', 9, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(460, 7, NULL, NULL, '29- janrel masala', 10, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(461, 7, NULL, NULL, '29- janrel masala', 11, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(462, 7, NULL, NULL, '29- janrel masala', 12, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(463, 7, NULL, NULL, '29- janrel masala', 14, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(464, 7, NULL, NULL, '29- janrel masala', 15, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(465, 7, NULL, NULL, '29- janrel masala', 16, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(466, 7, NULL, NULL, '29- janrel masala', 17, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(467, 7, NULL, NULL, '29- janrel masala', 18, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(468, 7, NULL, NULL, '29- janrel masala', 118, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(469, 7, NULL, NULL, '29- janrel masala', 119, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(470, 7, NULL, NULL, '29- janrel masala', 120, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(471, 7, NULL, NULL, '29- janrel masala', 121, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(472, 7, NULL, NULL, '29- janrel masala', 122, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(473, 7, NULL, NULL, '29- janrel masala', 123, 1, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(474, 7, NULL, NULL, '29- janrel masala', 320, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(475, 7, NULL, NULL, '29- janrel masala', 321, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(476, 7, NULL, NULL, '29- janrel masala', 322, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(477, 7, NULL, NULL, '29- janrel masala', 323, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(478, 7, NULL, NULL, '29- janrel masala', 324, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(479, 7, NULL, NULL, '29- janrel masala', 377, 2, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(480, 7, NULL, NULL, '29- janrel masala', 399, 4, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(481, 7, NULL, NULL, '29- janrel masala', 400, 4, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(482, 7, NULL, NULL, '29- janrel masala', 401, 4, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(483, 7, NULL, NULL, '29- janrel masala', 402, 4, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(484, 7, NULL, NULL, '29- janrel masala', 403, 4, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(485, 7, NULL, NULL, '29- janrel masala', 404, 4, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(486, 7, NULL, NULL, '29- janrel masala', 409, 4, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(487, 7, NULL, NULL, '29- janrel masala', 417, 4, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(488, 7, NULL, NULL, '29- janrel masala', 418, 4, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(489, 7, NULL, NULL, '29- janrel masala', 419, 4, '', '', '', '2021-10-16 08:55:12', '2021-10-16 08:55:12'),
(498, 10, NULL, NULL, '8- bhaat', 60, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(499, 10, NULL, NULL, '8- bhaat,39- kadhi,40- lachakodal', 527, 3, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(500, 10, NULL, NULL, '25- papad', 138, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(501, 10, NULL, NULL, '39- kadhi,154- chaa-coffee-tea', 28, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(502, 10, NULL, NULL, '39- kadhi', 48, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(503, 10, NULL, NULL, '39- kadhi', 101, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(504, 10, NULL, NULL, '39- kadhi', 102, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(505, 10, NULL, NULL, '39- kadhi', 326, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(506, 10, NULL, NULL, '39- kadhi,153- paneer resmi', 522, 3, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(507, 10, NULL, NULL, '40- lachakodal', 38, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(508, 10, NULL, NULL, '154- chaa-coffee-tea', 13, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(509, 10, NULL, NULL, '154- chaa-coffee-tea', 81, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(510, 10, NULL, NULL, '154- chaa-coffee-tea', 165, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(511, 10, NULL, NULL, '154- chaa-coffee-tea', 209, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(512, 10, NULL, NULL, '154- chaa-coffee-tea', 415, 4, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(513, 10, NULL, NULL, '156- flower bataka vatana', 41, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(514, 10, NULL, NULL, '156- flower bataka vatana,114- gugra tuvar vatana,115- patudi', 73, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(515, 10, NULL, NULL, '156- flower bataka vatana', 74, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(516, 10, NULL, NULL, '156- flower bataka vatana', 311, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(517, 10, NULL, NULL, '156- flower bataka vatana,114- gugra tuvar vatana', 312, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(518, 10, NULL, NULL, '156- flower bataka vatana,153- paneer resmi,26- green salad', 316, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(519, 10, NULL, NULL, '156- flower bataka vatana,114- gugra tuvar vatana', 318, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(520, 10, NULL, NULL, '156- flower bataka vatana,153- paneer resmi', 319, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(521, 10, NULL, NULL, '156- flower bataka vatana,153- paneer resmi', 329, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(522, 10, NULL, NULL, '156- flower bataka vatana', 363, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(523, 10, NULL, NULL, '114- gugra tuvar vatana', 17, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(524, 10, NULL, NULL, '114- gugra tuvar vatana', 22, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(525, 10, NULL, NULL, '114- gugra tuvar vatana', 23, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(526, 10, NULL, NULL, '114- gugra tuvar vatana,113- rawa menda puri', 47, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(527, 10, NULL, NULL, '114- gugra tuvar vatana', 51, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(528, 10, NULL, NULL, '114- gugra tuvar vatana', 68, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(529, 10, NULL, NULL, '114- gugra tuvar vatana,153- paneer resmi', 100, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(530, 10, NULL, NULL, '114- gugra tuvar vatana', 386, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(531, 10, NULL, NULL, '114- gugra tuvar vatana', 224, 5, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(532, 10, NULL, NULL, '115- patudi', 54, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(533, 10, NULL, NULL, '115- patudi', 290, 5, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(534, 10, NULL, NULL, '131- papdi gathiya', 374, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(535, 10, NULL, NULL, '131- papdi gathiya', 387, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(536, 10, NULL, NULL, '131- papdi gathiya', 220, 5, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(537, 10, NULL, NULL, '131- papdi gathiya', 409, 4, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(538, 10, NULL, NULL, '131- papdi gathiya', 412, 4, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(539, 10, NULL, NULL, '155- shrikhand', 257, 5, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(540, 10, NULL, NULL, '153- paneer resmi', 71, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(541, 10, NULL, NULL, '153- paneer resmi', 72, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(542, 10, NULL, NULL, '153- paneer resmi', 108, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(543, 10, NULL, NULL, '153- paneer resmi', 109, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(544, 10, NULL, NULL, '153- paneer resmi', 110, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(545, 10, NULL, NULL, '153- paneer resmi', 111, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(546, 10, NULL, NULL, '153- paneer resmi,26- green salad', 317, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(547, 10, NULL, NULL, '153- paneer resmi', 330, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(548, 10, NULL, NULL, '153- paneer resmi', 331, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(549, 10, NULL, NULL, '153- paneer resmi', 518, 3, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(550, 10, NULL, NULL, '153- paneer resmi', 521, 3, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(551, 10, NULL, NULL, '153- paneer resmi', 523, 3, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(552, 10, NULL, NULL, '153- paneer resmi', 528, 3, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(553, 10, NULL, NULL, '26- green salad', 342, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(554, 10, NULL, NULL, '26- green salad', 343, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(555, 10, NULL, NULL, '26- green salad', 344, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(556, 10, NULL, NULL, '26- green salad', 345, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(557, 10, NULL, NULL, '28- keri nu athanu', 180, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(558, 10, NULL, NULL, '28- keri nu athanu', 346, 2, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(559, 10, NULL, NULL, '139- icecream bar', 289, 5, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(560, 10, NULL, NULL, '113- rawa menda puri', 88, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(561, 10, NULL, NULL, '113- rawa menda puri', 156, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(562, 10, NULL, NULL, '113- rawa menda puri', 164, 1, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(563, 10, NULL, NULL, '128- pani bottel', 537, 5, '', '', '', '2021-10-17 14:37:17', '2021-10-17 14:37:17'),
(564, 11, NULL, NULL, '1- dal', 38, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(565, 11, NULL, NULL, '1- dal', 39, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(566, 11, NULL, NULL, '1- dal', 40, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(567, 11, NULL, NULL, '1- dal', 41, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(568, 11, NULL, NULL, '1- dal', 42, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(569, 11, NULL, NULL, '8- bhaat', 60, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(570, 11, NULL, NULL, '8- bhaat,21- rotli', 527, 3, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(571, 11, NULL, NULL, '20- puri,21- rotli', 46, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(572, 11, NULL, NULL, '20- puri', 47, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(573, 11, NULL, NULL, '25- papad', 138, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(574, 11, NULL, NULL, '59- dudhi chana', 37, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(575, 11, NULL, NULL, '59- dudhi chana', 318, 2, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(576, 11, NULL, NULL, '59- dudhi chana', 319, 2, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(577, 11, NULL, NULL, '59- dudhi chana', 381, 2, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(578, 11, NULL, NULL, '82- Khaman', 224, 5, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(579, 11, NULL, NULL, '82- Khaman', 245, 5, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(580, 11, NULL, NULL, '82- Khaman', 409, 4, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(581, 11, NULL, NULL, '82- Khaman', 412, 4, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(582, 11, NULL, NULL, '28- keri nu athanu', 180, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(583, 11, NULL, NULL, '28- keri nu athanu', 346, 2, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(584, 11, NULL, NULL, '105- masala chas', 88, 1, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(585, 11, NULL, NULL, '105- masala chas', 416, 4, '', '', '', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(586, 11, NULL, NULL, '105- masala chas', 525, 3, '50', 'Kilogram', '20', '2021-10-17 19:43:13', '2021-10-17 19:43:13'),
(587, 6, NULL, NULL, '20- puri', 47, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(588, 6, NULL, NULL, '29- janrel masala', 1, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(589, 6, NULL, NULL, '29- janrel masala', 2, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(590, 6, NULL, NULL, '29- janrel masala', 3, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(591, 6, NULL, NULL, '29- janrel masala', 4, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(592, 6, NULL, NULL, '29- janrel masala', 5, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(593, 6, NULL, NULL, '29- janrel masala', 6, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(594, 6, NULL, NULL, '29- janrel masala', 8, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(595, 6, NULL, NULL, '29- janrel masala', 9, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(596, 6, NULL, NULL, '29- janrel masala', 10, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(597, 6, NULL, NULL, '29- janrel masala', 11, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(598, 6, NULL, NULL, '29- janrel masala', 12, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(599, 6, NULL, NULL, '29- janrel masala', 13, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(600, 6, NULL, NULL, '29- janrel masala', 14, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(601, 6, NULL, NULL, '29- janrel masala', 15, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(602, 6, NULL, NULL, '29- janrel masala', 16, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(603, 6, NULL, NULL, '29- janrel masala', 17, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(604, 6, NULL, NULL, '29- janrel masala', 18, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(605, 6, NULL, NULL, '29- janrel masala', 118, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(606, 6, NULL, NULL, '29- janrel masala', 119, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(607, 6, NULL, NULL, '29- janrel masala', 120, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(608, 6, NULL, NULL, '29- janrel masala', 121, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(609, 6, NULL, NULL, '29- janrel masala', 122, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(610, 6, NULL, NULL, '29- janrel masala', 123, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(611, 6, NULL, NULL, '29- janrel masala,3- panchkutiyu,36- paneer lifafa', 318, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(612, 6, NULL, NULL, '29- janrel masala', 320, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(613, 6, NULL, NULL, '29- janrel masala', 321, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(614, 6, NULL, NULL, '29- janrel masala', 322, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(615, 6, NULL, NULL, '29- janrel masala', 323, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(616, 6, NULL, NULL, '29- janrel masala', 324, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(617, 6, NULL, NULL, '29- janrel masala', 377, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(618, 6, NULL, NULL, '29- janrel masala', 399, 4, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(619, 6, NULL, NULL, '29- janrel masala', 400, 4, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(620, 6, NULL, NULL, '29- janrel masala', 401, 4, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(621, 6, NULL, NULL, '29- janrel masala', 402, 4, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(622, 6, NULL, NULL, '29- janrel masala', 403, 4, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(623, 6, NULL, NULL, '29- janrel masala', 404, 4, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(624, 6, NULL, NULL, '29- janrel masala', 409, 4, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(625, 6, NULL, NULL, '29- janrel masala', 417, 4, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(626, 6, NULL, NULL, '29- janrel masala', 418, 4, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(627, 6, NULL, NULL, '29- janrel masala', 419, 4, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(628, 6, NULL, NULL, '3- panchkutiyu', 41, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(629, 6, NULL, NULL, '3- panchkutiyu', 73, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(630, 6, NULL, NULL, '3- panchkutiyu', 308, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(631, 6, NULL, NULL, '3- panchkutiyu,36- paneer lifafa,44- veg.biriyani', 311, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(632, 6, NULL, NULL, '3- panchkutiyu,36- paneer lifafa,44- veg.biriyani', 312, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(633, 6, NULL, NULL, '3- panchkutiyu', 313, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(634, 6, NULL, NULL, '3- panchkutiyu', 314, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(635, 6, NULL, NULL, '3- panchkutiyu,43- paneer tikka masala,44- veg.biriyani', 316, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(636, 6, NULL, NULL, '36- paneer lifafa', 48, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(637, 6, NULL, NULL, '36- paneer lifafa', 62, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(638, 6, NULL, NULL, '36- paneer lifafa', 63, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(639, 6, NULL, NULL, '36- paneer lifafa', 65, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(640, 6, NULL, NULL, '36- paneer lifafa', 67, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(641, 6, NULL, NULL, '36- paneer lifafa,43- paneer tikka masala,44- veg.biriyani', 329, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(642, 6, NULL, NULL, '36- paneer lifafa', 341, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(643, 6, NULL, NULL, '36- paneer lifafa,44- veg.biriyani', 342, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(644, 6, NULL, NULL, '36- paneer lifafa', 231, 5, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(645, 6, NULL, NULL, '36- paneer lifafa,43- paneer tikka masala', 520, 3, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(646, 6, NULL, NULL, '106- matho', 256, 5, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(647, 6, NULL, NULL, '43- paneer tikka masala,44- veg.biriyani', 75, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(648, 6, NULL, NULL, '43- paneer tikka masala', 91, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(649, 6, NULL, NULL, '43- paneer tikka masala', 100, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(650, 6, NULL, NULL, '43- paneer tikka masala,44- veg.biriyani', 101, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(651, 6, NULL, NULL, '43- paneer tikka masala,44- veg.biriyani', 102, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(652, 6, NULL, NULL, '43- paneer tikka masala', 103, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(653, 6, NULL, NULL, '43- paneer tikka masala', 104, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(654, 6, NULL, NULL, '43- paneer tikka masala', 105, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(655, 6, NULL, NULL, '43- paneer tikka masala', 106, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(656, 6, NULL, NULL, '43- paneer tikka masala', 108, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(657, 6, NULL, NULL, '43- paneer tikka masala', 109, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(658, 6, NULL, NULL, '43- paneer tikka masala', 110, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(659, 6, NULL, NULL, '43- paneer tikka masala', 111, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(660, 6, NULL, NULL, '43- paneer tikka masala', 153, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(661, 6, NULL, NULL, '43- paneer tikka masala,44- veg.biriyani', 317, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(662, 6, NULL, NULL, '43- paneer tikka masala,44- veg.biriyani', 319, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(663, 6, NULL, NULL, '43- paneer tikka masala', 523, 3, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(664, 6, NULL, NULL, '43- paneer tikka masala', 528, 3, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(665, 6, NULL, NULL, '44- veg.biriyani', 22, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(666, 6, NULL, NULL, '44- veg.biriyani', 23, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(667, 6, NULL, NULL, '44- veg.biriyani', 59, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(668, 6, NULL, NULL, '44- veg.biriyani', 99, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(669, 6, NULL, NULL, '44- veg.biriyani', 363, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(670, 6, NULL, NULL, '44- veg.biriyani', 364, 2, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(671, 6, NULL, NULL, '38- papad papdi', 138, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(672, 6, NULL, NULL, '105- masala chas', 88, 1, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(673, 6, NULL, NULL, '105- masala chas', 416, 4, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(674, 6, NULL, NULL, '105- masala chas', 525, 3, '', '', '', '2021-10-19 09:55:53', '2021-10-19 09:55:53'),
(675, 18, 14, 1, '', 38, 1, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(676, 18, 14, 1, '', 39, 1, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(677, 18, 14, 1, '', 40, 1, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(678, 18, 14, 1, '', 41, 1, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(679, 18, 14, 1, '', 42, 1, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(720, 18, 1, 3, '', 41, 1, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(721, 18, 1, 3, '', 73, 1, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(722, 18, 1, 3, '', 308, 2, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(723, 18, 1, 3, '', 311, 2, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(724, 18, 1, 3, '', 312, 2, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(725, 18, 1, 3, '', 313, 2, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(726, 18, 1, 3, '', 314, 2, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(727, 18, 1, 3, '', 316, 2, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02');
INSERT INTO `booking_items` (`id`, `booking_id`, `menu_category_id`, `menu_id`, `menu_list`, `item_id`, `item_category_id`, `weight`, `unit`, `INR`, `created_at`, `updated_at`) VALUES
(728, 18, 1, 3, '', 318, 2, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(729, 18, 14, 25, '', 138, 1, '', '', '', '2021-10-22 23:41:02', '2021-10-22 23:41:02'),
(730, 17, 1, 3, '', 41, 1, '', '', '', '2021-10-22 23:41:10', '2021-10-22 23:41:10'),
(731, 17, 1, 3, '', 73, 1, '', '', '', '2021-10-22 23:41:10', '2021-10-22 23:41:10'),
(732, 17, 1, 3, '', 308, 2, '', '', '', '2021-10-22 23:41:10', '2021-10-22 23:41:10'),
(733, 17, 1, 3, '', 311, 2, '', '', '', '2021-10-22 23:41:10', '2021-10-22 23:41:10'),
(734, 17, 1, 3, '', 312, 2, '', '', '', '2021-10-22 23:41:10', '2021-10-22 23:41:10'),
(735, 17, 1, 3, '', 313, 2, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(736, 17, 1, 3, '', 314, 2, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(737, 17, 1, 3, '', 316, 2, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(738, 17, 1, 3, '', 318, 2, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(739, 17, 14, 1, '', 38, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(740, 17, 14, 1, '', 39, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(741, 17, 14, 1, '', 40, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(742, 17, 14, 1, '', 41, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(743, 17, 14, 1, '', 42, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(744, 17, 14, 29, '', 1, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(745, 17, 14, 29, '', 2, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(746, 17, 14, 29, '', 3, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(747, 17, 14, 29, '', 4, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(748, 17, 14, 29, '', 5, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(749, 17, 14, 29, '', 6, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(750, 17, 14, 29, '', 8, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(751, 17, 14, 29, '', 9, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(752, 17, 14, 29, '', 10, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(753, 17, 14, 29, '', 11, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(754, 17, 14, 29, '', 12, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(755, 17, 14, 29, '', 13, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(756, 17, 14, 29, '', 14, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(757, 17, 14, 29, '', 15, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(758, 17, 14, 29, '', 16, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(759, 17, 14, 29, '', 17, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(760, 17, 14, 29, '', 18, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(761, 17, 14, 29, '', 118, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(762, 17, 14, 29, '', 119, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(763, 17, 14, 29, '', 120, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(764, 17, 14, 29, '', 121, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(765, 17, 14, 29, '', 122, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(766, 17, 14, 29, '', 123, 1, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(767, 17, 14, 29, '', 318, 2, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(768, 17, 14, 29, '', 320, 2, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(769, 17, 14, 29, '', 321, 2, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(770, 17, 14, 29, '', 322, 2, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(771, 17, 14, 29, '', 323, 2, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(772, 17, 14, 29, '', 324, 2, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(773, 17, 14, 29, '', 377, 2, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(774, 17, 14, 29, '', 399, 4, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(775, 17, 14, 29, '', 400, 4, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(776, 17, 14, 29, '', 401, 4, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(777, 17, 14, 29, '', 402, 4, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(778, 17, 14, 29, '', 403, 4, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(779, 17, 14, 29, '', 404, 4, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(780, 17, 14, 29, '', 409, 4, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(781, 17, 14, 29, '', 417, 4, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(782, 17, 14, 29, '', 418, 4, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11'),
(783, 17, 14, 29, '', 419, 4, '', '', '', '2021-10-22 23:41:11', '2021-10-22 23:41:11');

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `id` int(20) NOT NULL,
  `title_english` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description_english` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title_gujarati` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `title_hindi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description_gujarati` text COLLATE utf8_unicode_ci NOT NULL,
  `description_hindi` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(20) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `english` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gujarati` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hindi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `position`, `english`, `image`, `status`, `status_at`, `created_at`, `updated_at`, `gujarati`, `hindi`) VALUES
(1, 16, 'Gujarati Sabji', NULL, 'Active', '2021-10-08 22:46:31', '2021-10-08 22:46:31', '2021-10-09 22:30:46', 'ગુજરાતી સબ્જી', NULL),
(2, 8, 'Mexican', NULL, 'Active', '2021-10-09 22:26:54', '2021-10-09 22:26:54', '2021-10-09 22:28:39', 'મેક્સીકન', NULL),
(3, 7, 'Italian', NULL, 'Active', '2021-10-09 22:27:48', '2021-10-09 22:27:48', '2021-10-09 22:28:51', 'ઇટાલિયન', NULL),
(4, 14, 'Panjabi Sabji', NULL, 'Active', '2021-10-09 22:29:08', '2021-10-09 22:29:08', '2021-10-09 22:29:08', 'પંજાબી સબ્જી', NULL),
(5, 23, 'Salad', NULL, 'Active', '2021-10-09 22:29:24', '2021-10-09 22:29:24', '2021-10-09 22:29:24', 'સલાડ', NULL),
(6, 3, 'Soup Station', NULL, 'Active', '2021-10-09 22:29:38', '2021-10-09 22:29:38', '2021-10-09 22:29:38', 'સૂપ સ્ટેશન', NULL),
(7, 9, 'South Indian', NULL, 'Active', '2021-10-09 22:29:56', '2021-10-09 22:29:56', '2021-10-09 22:29:56', 'દક્ષિણ ભારતીય', NULL),
(8, 4, 'Sizller', NULL, 'Active', '2021-10-09 22:30:10', '2021-10-09 22:30:10', '2021-10-09 22:30:10', 'સિઝલર', NULL),
(9, 2, 'Starter', NULL, 'Active', '2021-10-09 22:30:22', '2021-10-09 22:30:22', '2021-10-09 22:30:22', 'સ્ટાર્ટર', NULL),
(10, 10, 'Sweet Parlor', NULL, 'Active', '2021-10-09 22:31:09', '2021-10-09 22:31:09', '2021-10-09 22:31:09', 'સ્વીટ પાર્લર', NULL),
(11, 5, 'Chatpata Chaat', NULL, 'Active', '2021-10-09 22:31:36', '2021-10-09 22:31:36', '2021-10-09 22:31:36', 'ચટપટા ચાટ', NULL),
(12, 19, 'Live Farsan', NULL, 'Active', '2021-10-09 22:32:22', '2021-10-09 22:32:22', '2021-10-09 22:32:22', 'લાઇવ ફરસાણ', NULL),
(13, 6, 'Chinese Counter', NULL, 'Active', '2021-10-09 22:32:36', '2021-10-09 22:32:36', '2021-10-09 22:32:36', 'ચાઇનીઝ કાઉન્ટર', NULL),
(14, 17, 'Gujarati Menu', NULL, 'Active', '2021-10-09 22:33:08', '2021-10-09 22:33:08', '2021-10-09 22:33:08', 'ગુજરાતી મેનુ', NULL),
(15, 1, 'Juice Mocktail', NULL, 'Active', '2021-10-09 22:33:28', '2021-10-09 22:33:28', '2021-10-09 22:33:28', 'જ્યૂસ મોકટેલ', NULL),
(16, 15, 'Punjabi Menu', NULL, 'Active', '2021-10-09 22:33:43', '2021-10-09 22:33:43', '2021-10-09 22:33:43', 'પંજાબી મેનુ', NULL),
(17, 18, 'Rajashtani Menu', NULL, 'Active', '2021-10-09 22:33:53', '2021-10-09 22:33:53', '2021-10-09 22:33:53', 'રાજસ્થાની મેનુ', NULL),
(20, 11, 'tawa sweet', NULL, 'Active', '2021-10-13 22:09:38', '2021-10-13 22:09:38', '2021-10-13 22:09:38', 'તવા સ્વીટ', NULL),
(21, 12, 'kaju sweet', NULL, 'Active', '2021-10-13 22:09:52', '2021-10-13 22:09:52', '2021-10-13 22:09:52', 'કાજુ સ્વીટ', NULL),
(22, 13, 'puri-roti', NULL, 'Active', '2021-10-13 22:10:21', '2021-10-13 22:10:21', '2021-10-13 22:10:21', 'પુરી-રોટી', NULL),
(23, 21, 'rise', NULL, 'Active', '2021-10-13 22:11:23', '2021-10-13 22:11:23', '2021-10-13 22:12:26', 'ભાત', NULL),
(24, 20, 'dal', NULL, 'Active', '2021-10-13 22:12:35', '2021-10-13 22:12:35', '2021-10-13 22:12:35', 'દાળ', NULL),
(25, 22, 'papad', NULL, 'Active', '2021-10-13 22:12:59', '2021-10-13 22:12:59', '2021-10-13 22:12:59', 'પાપડ', NULL),
(26, 24, 'Ice cream', NULL, 'Active', '2021-10-13 22:37:20', '2021-10-13 22:14:14', '2021-10-13 22:14:14', 'આઈસ્ક્રીમ', NULL),
(27, 25, 'mukhvas', NULL, 'Active', '2021-10-13 22:14:37', '2021-10-13 22:14:37', '2021-10-13 22:14:37', 'મુખવાસ', NULL),
(28, 22, 'mineral water', NULL, 'Active', '2021-10-13 22:37:28', '2021-10-13 22:18:56', '2021-10-13 22:18:56', 'મીનરલ વોટર', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `description` text NOT NULL,
  `type` enum('Text','Textarea','File','Date','Time','Datetime','Radio','Checkbox','Select','Other') NOT NULL DEFAULT 'Text',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gujarati` varchar(255) NOT NULL,
  `hindi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `name`, `value`, `description`, `type`, `status`, `status_at`, `created_at`, `updated_at`, `gujarati`, `hindi`) VALUES
(2, 'site_name', 'Shri ganesh cateres', '', 'Text', 'Active', '2021-08-04 22:33:30', '2021-08-04 22:33:30', '2021-09-05 12:50:50', 'શ્રી ગણેશ કેટર્સ', ''),
(3, 'logo', 'config_3_1628096966.jpg', '', 'File', 'Active', '2021-08-04 22:43:05', '2021-08-04 22:37:13', '2021-08-04 22:39:33', '', ''),
(5, 'language', '', '{\"en-IN\":\"English\",\"gu-IN\":\"ગુજરાતી\"}', 'Select', 'Active', '2021-08-04 22:58:53', '2021-08-04 22:58:53', '2021-09-05 12:50:42', '', ''),
(7, 'location', 'A108 Adam Street NY 535022, USA', '', 'Text', 'Active', '2021-09-04 21:16:22', '2021-09-04 21:16:22', '2021-09-04 21:20:42', '', ''),
(8, 'phone', '+1 5589 55488 55', '', 'Text', 'Active', '2021-09-04 21:24:58', '2021-09-04 21:20:01', '2021-09-04 21:20:47', '', ''),
(9, 'email', 'info@shreeganeshcateringservices.com', '', 'Text', 'Active', '2021-09-04 21:24:52', '2021-09-04 21:21:11', '2021-09-15 23:25:28', '', ''),
(10, 'facebook_url', '', '', 'Text', 'Active', '2021-09-04 21:23:53', '2021-09-04 21:23:53', '2021-09-04 21:23:53', '', ''),
(11, 'instagram_url', '', '', 'Text', 'Active', '2021-09-04 21:24:06', '2021-09-04 21:24:06', '2021-09-04 21:24:06', '', ''),
(12, 'twitter_url', '', '', 'Text', 'Active', '2021-09-04 21:24:21', '2021-09-04 21:24:21', '2021-09-04 21:24:21', '', ''),
(13, 'linkin_url', '', '', 'Text', 'Active', '2021-09-04 21:24:44', '2021-09-04 21:24:44', '2021-09-04 21:24:44', '', ''),
(14, 'welcome_video_url', 'https://www.youtube.com/watch?v=GlrxcuEDyF8', '', 'Text', 'Active', '2021-09-04 21:26:18', '2021-09-04 21:26:18', '2021-09-05 10:33:22', '', ''),
(15, 'owner_name', 'jhon smith', '', 'Text', 'Active', '2021-09-05 17:23:37', '2021-09-05 17:23:37', '2021-09-05 17:28:55', '', ''),
(16, 'owner_photo', 'config__1630842838.jpg', '', 'File', 'Active', '2021-09-05 17:23:58', '2021-09-05 17:23:58', '2021-09-05 17:23:58', '', ''),
(17, 'Vinodkumar f upadhyay', '', '', '', 'Active', '2021-09-13 22:52:03', '2021-09-13 22:52:03', '2021-09-13 22:52:03', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `custompages`
--

CREATE TABLE `custompages` (
  `id` int(20) NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `page_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `page_title_english` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `page_content_english` text COLLATE utf8_unicode_ci NOT NULL,
  `page_title_gujarati` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `page_content_gujarati` text COLLATE utf8_unicode_ci NOT NULL,
  `page_title_hindi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `page_content_hindi` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custompages`
--

INSERT INTO `custompages` (`id`, `image`, `page_name`, `page_title_english`, `page_content_english`, `page_title_gujarati`, `page_content_gujarati`, `page_title_hindi`, `page_content_hindi`, `status`, `status_at`, `created_at`, `updated_at`) VALUES
(1, 'page_1_1628525199.jpg', 'aboutus', 'About us', '<p>\r\n  <b>\r\n    <span style=\"font-family: &quot;Arial&quot;;\">\r\n\r\n    </span>\r\n    Voluptatem dignissimos pr\r\n    <span style=\"font-family: &quot;Verdana&quot;;\">\r\n\r\n    </span>\r\n    ovi\r\n    <span style=\"font-family: &quot;Arial&quot;;\">\r\n\r\n    </span>\r\n    dent quasi corporis voluptates sit assumenda.</b></p><p class=\"fst-italic\">\r\n                    Lorem ipsum dolor sit amet, consectetur adipiscing \r\nelit, sed do eiusmod tempor incididunt ut labore et dolore\r\n                    magna aliqua.\r\n                </p>\r\n                <ul><li> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li><li> Duis aute irure dolor in reprehenderit in voluptate velit.</li><li> Ullamco \r\nlaboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor \r\nin reprehenderit in voluptate trideta storacalaperda mastiro dolore eu \r\nfugiat nulla pariatur.</li></ul>\r\n                <p>\r\n                    Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate\r\n                    velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in\r\n                    culpa qui officia deserunt mollit anim id est laborum\r\n                </p><p><b><span style=\"font-family: &quot;Arial&quot;;\"></span><span style=\"font-family: &quot;Helvetica&quot;;\"></span><span style=\"font-family: &quot;Arial Black&quot;;\"></span></b></p>', 'અમારા વિશે', '<p><span class=\"VIiyi\" lang=\"gu\"><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"0\"><span>ઇંડાના દાંતને લાયક પ્રોબ આનંદ કારણ કે શરીરના આનંદો માનવામાં આવે છે.</span></span><span class=\"JLqJ4b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"1\"><span>\r\n\r\n</span></span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"2\"><span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed tempor and life, જેથી શ્રમ અને દુ: ખ, eiusmod કરવા માટે કેટલીક મહત્વની બાબતો.</span></span><span class=\"JLqJ4b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"3\"><span>\r\n\r\n    </span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"4\"><span>જો સ્કૂલ ડિસ્ટ્રિક્ટ એક સમસ્યા હોય તો ઉત્તેજનાના પ્રયત્નોનો ફાયદો તેનામાંથી બહાર કાો.</span></span><span class=\"JLqJ4b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"5\"><span>\r\n    </span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"6\"><span>કપિડાટટ ડ્યુઇસ વેલિટ ઉર્ના મેટસમાં પીડાની ખુશીમાં ટીકા કરવામાં આવી છે.</span></span><span class=\"JLqJ4b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"7\"><span>\r\n    </span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"8\"><span>જો સ્કૂલ ડિસ્ટ્રિક્ટ એક સમસ્યા હોય તો ઉત્તેજનાના પ્રયત્નોનો ફાયદો તેનામાંથી બહાર કાો.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"9\"><span>ડુઇસ ટીકા કરવામાં આવી છે કપિડાટટ માં પીડા કોઈ પરિણામી આનંદ પેદા કરે છે?</span></span><span class=\"JLqJ4b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"10\"><span>\r\n\r\n</span></span><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"11\"><span>જો સ્કૂલ ડિસ્ટ્રિક્ટ એક સમસ્યા હોય તો ઉત્તેજનાના પ્રયત્નોનો ફાયદો તેનામાંથી બહાર કાો.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"12\"><span>કપિડાટટ સિલમમાં પીડા બનવા માંગો છો તેની ડ્યુઇસ એટ ડોલોર મેગ્ના પલાયનમાં ટીકા કરવામાં આવી છે પરિણામે કોઈ આનંદ નથી.</span></span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"gu\" data-language-to-translate-into=\"la\" data-phrase-index=\"13\"><span>અપવાદરૂપ કપિડાટત કાળાઓ અપવાદરૂપ નથી, આત્માને શાંતિ આપનાર છે, એટલે કે, તેઓ મારી મહેનત છે, તેઓ જનરલને છોડી દે છે, સેવાઓ હોવી જોઈએ</span></span></span> </p>', '', '', 'Active', '2021-08-09 22:09:19', '2021-07-26 23:34:33', '2021-09-05 12:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(20) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('Backend','Website','App','Common') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Common',
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `code`, `title`, `subject`, `html`, `type`, `status`, `status_at`, `created_at`, `updated_at`) VALUES
(1, 'FORGOT_EMAIL', 'Forgot email', 'Forgot email', '<style type=\"text/css\" rel=\"stylesheet\" media=\"all\">\r\n\r\n  .htmltemplate a {\r\n  color: #414EF9;\r\n  }\r\n\r\n  /* Layout ------------------------------ */\r\n  .htmltemplate .email-wrapper {\r\n  width: 100%;\r\n  margin: 0;\r\n  padding: 0;\r\n  background-color: #F5F7F9;\r\n  }\r\n  .htmltemplate .email-content {\r\n  width: 100%;\r\n  margin: 0;\r\n  padding: 0;\r\n  }\r\n\r\n  /* Masthead ----------------------- */\r\n  .htmltemplate .email-masthead {\r\n  padding: 25px 0;\r\n  text-align: center;\r\n  }\r\n  .htmltemplate .email-masthead_logo {\r\n  max-width: 400px;\r\n  border: 0;\r\n  }\r\n  .htmltemplate .email-masthead_name {\r\n  font-size: 16px;\r\n  font-weight: bold;\r\n  color: #839197;\r\n  text-decoration: none;\r\n  text-shadow: 0 1px 0 white;\r\n  }\r\n\r\n  /* Body ------------------------------ */\r\n  .htmltemplate .email-body {\r\n  width: 100%;\r\n  margin: 0;\r\n  padding: 0;\r\n  border-top: 1px solid #E7EAEC;\r\n  border-bottom: 1px solid #E7EAEC;\r\n  background-color: #FFFFFF;\r\n  }\r\n  .htmltemplate .email-body_inner {\r\n  width: 570px;\r\n  margin: 0 auto;\r\n  padding: 0;\r\n  }\r\n  .htmltemplate .email-footer {\r\n  width: 570px;\r\n  margin: 0 auto;\r\n  padding: 0;\r\n  text-align: center;\r\n  }\r\n  .htmltemplate .email-footer p {\r\n  color: #839197;\r\n  }\r\n  .htmltemplate .body-action {\r\n  width: 100%;\r\n  margin: 30px auto;\r\n  padding: 0;\r\n  text-align: center;\r\n  }\r\n  .htmltemplate .body-sub {\r\n  margin-top: 25px;\r\n  padding-top: 25px;\r\n  border-top: 1px solid #E7EAEC;\r\n  }\r\n  .htmltemplate .content-cell {\r\n  padding: 35px;\r\n  }\r\n  .htmltemplate .align-right {\r\n  text-align: right;\r\n  }\r\n\r\n  /* Type ------------------------------ */\r\n  .htmltemplate h1 {\r\n  margin-top: 0;\r\n  color: #292E31;\r\n  font-size: 19px;\r\n  font-weight: bold;\r\n  text-align: left;\r\n  }\r\n  .htmltemplate h2 {\r\n  margin-top: 0;\r\n  color: #292E31;\r\n  font-size: 16px;\r\n  font-weight: bold;\r\n  text-align: left;\r\n  }\r\n  .htmltemplate h3 {\r\n  margin-top: 0;\r\n  color: #292E31;\r\n  font-size: 14px;\r\n  font-weight: bold;\r\n  text-align: left;\r\n  }\r\n  .htmltemplate p {\r\n  margin-top: 0;\r\n  color: #839197;\r\n  font-size: 16px;\r\n  line-height: 1.5em;\r\n  text-align: left;\r\n  }\r\n  .htmltemplate p.sub {\r\n  font-size: 12px;\r\n  }\r\n  .htmltemplate p.center {\r\n  text-align: center;\r\n  }\r\n\r\n  /* Buttons ------------------------------ */\r\n  .htmltemplate .button {\r\n  display: inline-block;\r\n  width: 200px;\r\n  background-color: #414EF9;\r\n  border-radius: 3px;\r\n  color: #ffffff;\r\n  font-size: 15px;\r\n  line-height: 45px;\r\n  text-align: center;\r\n  text-decoration: none;\r\n  -webkit-text-size-adjust: none;\r\n  mso-hide: all;\r\n  }\r\n  .htmltemplate .button--green {\r\n  background-color: #28DB67;\r\n  }\r\n  .htmltemplate .button--red {\r\n  background-color: #FF3665;\r\n  }\r\n  .htmltemplate .button--blue {\r\n  background-color: #414EF9;\r\n  }\r\n  .htmltemplate .button::hover {\r\n  color: #f9f9f9;\r\n  text-decoration: none;\r\n  }\r\n  .htmltemplate .cursor-pointer{\r\n  cursor: pointer;\r\n  }\r\n  /*Media Queries ------------------------------ */\r\n  @media only screen and (max-width: 600px) {\r\n  .htmltemplate .email-body_inner,\r\n  .htmltemplate .email-footer {\r\n  width: 100% !important;\r\n  }\r\n  }\r\n  @media only screen and (max-width: 500px) {\r\n  .htmltemplate .button {\r\n  width: 100% !important;\r\n  }\r\n  }\r\n</style>\r\n<div class=\"htmltemplate\">\r\n  <table class=\"email-wrapper\" style=\"width: 100%;\r\n                                      margin: 0;\r\n                                      padding: 0;\r\n                                      background-color: #F5F7F9;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n    <tbody>\r\n      <tr>\r\n        <td style=\";\" align=\"center\">\r\n          <table class=\"email-content\" style=\"width: 100%;\r\n                                              margin: 0;\r\n                                              padding: 0;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n            <!-- Logo -->\r\n            <tbody>\r\n              <tr>\r\n                <td class=\"email-masthead\" style=\"padding: 25px 0;\r\n                                                  text-align: center;\">\r\n                  <a href=\"{{site_url}}\" target=\"_blank\" class=\"email-masthead_name\" style=\"font-size: 16px;\r\n                                                                                            font-weight: bold;\r\n                                                                                            color: #839197;\r\n                                                                                            text-decoration: none;\r\n                                                                                            text-shadow: 0 1px 0 white;\">\r\n                    {{site_name}}\r\n                  </a>\r\n                </td>\r\n              </tr>\r\n              <!-- Email Body -->\r\n              <tr>\r\n                <td class=\"email-body\" style=\"width: 100%;\r\n                                              margin: 0;\r\n                                              padding: 0;\r\n                                              border-top: 1px solid #E7EAEC;\r\n                                              border-bottom: 1px solid #E7EAEC;\r\n                                              background-color: #FFFFFF;\" width=\"100%\">\r\n                  <table class=\"email-body_inner\" style=\"width: 570px;\r\n                                                         margin: 0 auto;\r\n                                                         padding: 0;;\" width=\"570\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n                    <!-- Body content -->\r\n                    <tbody>\r\n                      <tr>\r\n                        <td class=\"content-cell\" style=\"padding: 35px;\">\r\n                          <h1>\r\n                            Hi {{name}},\r\n                          </h1>\r\n                          <p>\r\n                            You recently requested to reset your password for your {{site_name}} account. Click the button below to reset it.\r\n                          </p>\r\n                          <!-- Action -->\r\n                          <table class=\"body-action\" style=\"width: 100%;\r\n                                                            margin: 30px auto;\r\n                                                            padding: 0;\r\n                                                            text-align: center;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n                            <tbody>\r\n                              <tr>\r\n                                <td align=\"center\">\r\n                                  <div>\r\n                                    <a href=\"{{action_url}}\" class=\"button button--red\" style=\"display: inline-block;\r\n                                                                                               width: 200px;\r\n                                                                                               background-color: #414EF9;\r\n                                                                                               border-radius: 3px;\r\n                                                                                               color: #ffffff;\r\n                                                                                               font-size: 15px;\r\n                                                                                               line-height: 45px;\r\n                                                                                               text-align: center;\r\n                                                                                               text-decoration: none;\r\n                                                                                               -webkit-text-size-adjust: none;\r\n                                                                                               mso-hide: all;\r\n                                                                                               background-color: #FF3665;\">\r\n                                      Reset your password\r\n                                    </a>\r\n                                  </div>\r\n                                </td>\r\n                              </tr>\r\n                            </tbody>\r\n                          </table>\r\n                          <p style=\"margin-top: 0;\r\n                                    color: #839197;\r\n                                    font-size: 16px;\r\n                                    line-height: 1.5em;\r\n                                    text-align: left;\">\r\n                            If you did not request a password reset, please ignore this email or reply to let us know. This password reset is only valid for the next 30 minutes.\r\n                          </p>\r\n                          <p style=\"margin-top: 0;\r\n                                    color: #839197;\r\n                                    font-size: 16px;\r\n                                    line-height: 1.5em;\r\n                                    text-align: left;\">\r\n                            Thanks,\r\n                            <br>\r\n                              {{site_name}} Team\r\n                              </p>\r\n                            <p style=\"margin-top: 0;\r\n                                      color: #839197;\r\n                                      font-size: 16px;\r\n                                      line-height: 1.5em;\r\n                                      text-align: left;\">\r\n                              <strong>\r\n                                P.S.\r\n                              </strong>\r\n                              We also love hearing from you and helping you with any issues you have. Please reply to this email if you want to ask a question or just say hi.\r\n                            </p>\r\n                            <!-- Sub copy -->\r\n                            <table class=\"body-sub\">\r\n                              <tbody>\r\n                                <tr>\r\n                                  <td>\r\n                                    <p class=\"sub\" style=\"margin-top: 0;\r\n                                                          color: #839197;\r\n                                                          font-size: 16px;\r\n                                                          line-height: 1.5em;\r\n                                                          text-align: left;\">\r\n                                      If you’re having trouble clicking the password reset button, copy and paste the URL below into your web browser.\r\n                                    </p>\r\n                                    <p class=\"sub\" style=\"font-size: 12px;margin-top: 0;\r\n                                                          color: #839197;\r\n                                                          font-size: 16px;\r\n                                                          line-height: 1.5em;\r\n                                                          text-align: left;\">\r\n                                      <a href=\"{{action_url}}\">\r\n                                        {{action_url}}\r\n                                      </a>\r\n                                    </p>\r\n                                  </td>\r\n                                </tr>\r\n                              </tbody>\r\n                            </table>\r\n                            </td>\r\n                          </tr>\r\n                        </tbody>\r\n                      </table>\r\n                    </td>\r\n                  </tr>\r\n                <tr>\r\n                  <td>\r\n                    <table class=\"email-footer\" width=\"570\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n                      <tbody>\r\n                        <tr>\r\n                          <td class=\"content-cell\">\r\n                            <p class=\"sub center\" style=\"font-size: 12px;margin-top: 0;\r\n                                                         color: #839197;\r\n                                                         font-size: 16px;\r\n                                                         line-height: 1.5em;\r\n                                                         text-align: center;\">\r\n                              © 2016 Canvas. All rights reserved.\r\n                            </p>\r\n                            <p class=\"sub center\" style=\"font-size: 12px;margin-top: 0;\r\n                                                         color: #839197;\r\n                                                         font-size: 16px;\r\n                                                         line-height: 1.5em;\r\n                                                         text-align: center;\">\r\n                              {{copyright_text}}\r\n                              <br>\r\n                                {{site_address}}\r\n                                </p>\r\n                              </td>\r\n                            </tr>\r\n                          </tbody>\r\n                        </table>\r\n                      </td>\r\n                    </tr>\r\n                  </tbody>\r\n                </table>\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n      </div>', 'Common', 'Active', '2019-04-01 05:12:17', '2019-04-01 05:12:17', '2021-07-18 05:59:01'),
(2, 'VERIFY_EMAIL_ADDRESS', 'Verify your email address', 'Verify your email address', '<style type=\"text/css\" rel=\"stylesheet\" media=\"all\">\r\n\r\n  .htmltemplate a {\r\n  color: #414EF9;\r\n  }\r\n\r\n  /* Layout ------------------------------ */\r\n  .htmltemplate .email-wrapper {\r\n  width: 100%;\r\n  margin: 0;\r\n  padding: 0;\r\n  background-color: #F5F7F9;\r\n  }\r\n  .htmltemplate .email-content {\r\n  width: 100%;\r\n  margin: 0;\r\n  padding: 0;\r\n  }\r\n\r\n  /* Masthead ----------------------- */\r\n  .htmltemplate .email-masthead {\r\n  padding: 25px 0;\r\n  text-align: center;\r\n  }\r\n  .htmltemplate .email-masthead_logo {\r\n  max-width: 400px;\r\n  border: 0;\r\n  }\r\n  .htmltemplate .email-masthead_name {\r\n  font-size: 16px;\r\n  font-weight: bold;\r\n  color: #839197;\r\n  text-decoration: none;\r\n  text-shadow: 0 1px 0 white;\r\n  }\r\n\r\n  /* Body ------------------------------ */\r\n  .htmltemplate .email-body {\r\n  width: 100%;\r\n  margin: 0;\r\n  padding: 0;\r\n  border-top: 1px solid #E7EAEC;\r\n  border-bottom: 1px solid #E7EAEC;\r\n  background-color: #FFFFFF;\r\n  }\r\n  .htmltemplate .email-body_inner {\r\n  width: 570px;\r\n  margin: 0 auto;\r\n  padding: 0;\r\n  }\r\n  .htmltemplate .email-footer {\r\n  width: 570px;\r\n  margin: 0 auto;\r\n  padding: 0;\r\n  text-align: center;\r\n  }\r\n  .htmltemplate .email-footer p {\r\n  color: #839197;\r\n  }\r\n  .htmltemplate .body-action {\r\n  width: 100%;\r\n  margin: 30px auto;\r\n  padding: 0;\r\n  text-align: center;\r\n  }\r\n  .htmltemplate .body-sub {\r\n  margin-top: 25px;\r\n  padding-top: 25px;\r\n  border-top: 1px solid #E7EAEC;\r\n  }\r\n  .htmltemplate .content-cell {\r\n  padding: 35px;\r\n  }\r\n  .htmltemplate .align-right {\r\n  text-align: right;\r\n  }\r\n\r\n  /* Type ------------------------------ */\r\n  .htmltemplate h1 {\r\n  margin-top: 0;\r\n  color: #292E31;\r\n  font-size: 19px;\r\n  font-weight: bold;\r\n  text-align: left;\r\n  }\r\n  .htmltemplate h2 {\r\n  margin-top: 0;\r\n  color: #292E31;\r\n  font-size: 16px;\r\n  font-weight: bold;\r\n  text-align: left;\r\n  }\r\n  .htmltemplate h3 {\r\n  margin-top: 0;\r\n  color: #292E31;\r\n  font-size: 14px;\r\n  font-weight: bold;\r\n  text-align: left;\r\n  }\r\n  .htmltemplate p {\r\n  margin-top: 0;\r\n  color: #839197;\r\n  font-size: 16px;\r\n  line-height: 1.5em;\r\n  text-align: left;\r\n  }\r\n  .htmltemplate p.sub {\r\n  font-size: 12px;\r\n  }\r\n  .htmltemplate p.center {\r\n  text-align: center;\r\n  }\r\n\r\n  /* Buttons ------------------------------ */\r\n  .htmltemplate .button {\r\n  display: inline-block;\r\n  width: 200px;\r\n  background-color: #414EF9;\r\n  border-radius: 3px;\r\n  color: #ffffff;\r\n  font-size: 15px;\r\n  line-height: 45px;\r\n  text-align: center;\r\n  text-decoration: none;\r\n  -webkit-text-size-adjust: none;\r\n  mso-hide: all;\r\n  }\r\n  .htmltemplate .button--green {\r\n  background-color: #28DB67;\r\n  }\r\n  .htmltemplate .button--red {\r\n  background-color: #FF3665;\r\n  }\r\n  .htmltemplate .button--blue {\r\n  background-color: #414EF9;\r\n  }\r\n  .htmltemplate .button::hover {\r\n  color: #f9f9f9;\r\n  text-decoration: none;\r\n  }\r\n  .htmltemplate .cursor-pointer{\r\n  cursor: pointer;\r\n  }\r\n  /*Media Queries ------------------------------ */\r\n  @media only screen and (max-width: 600px) {\r\n  .htmltemplate .email-body_inner,\r\n  .htmltemplate .email-footer {\r\n  width: 100% !important;\r\n  }\r\n  }\r\n  @media only screen and (max-width: 500px) {\r\n  .htmltemplate .button {\r\n  width: 100% !important;\r\n  }\r\n  }\r\n</style>\r\n<div class=\"htmltemplate\">\r\n  <table class=\"email-wrapper\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n    <tbody>\r\n      <tr>\r\n        <td align=\"center\">\r\n          <table class=\"email-content\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n            <!-- Logo -->\r\n            <tbody>\r\n              <tr>\r\n                <td class=\"email-masthead\">\r\n                  <a href=\"{{site_url}}\" target=\"_blank\" class=\"email-masthead_name\">\r\n                    {{site_name}}\r\n                  </a>\r\n                </td>\r\n              </tr>\r\n              <!-- Email Body -->\r\n              <tr>\r\n                <td class=\"email-body\" width=\"100%\">\r\n                  <table class=\"email-body_inner\" width=\"570\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n                    <!-- Body content -->\r\n                    <tbody>\r\n                      <tr>\r\n                        <td class=\"content-cell\">\r\n                          <h1>\r\n                            Verify your email address\r\n                          </h1>\r\n                          <p>\r\n                            Thanks for verify email for {{site_name}}! We\'re excited to have you as an early user.\r\n                          </p>\r\n                          <p>\r\n                            <span style=\"color: rgb(65, 64, 66); font-family: Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Here’s the code you need to continue with your email registration<br></span>Verification code : {{code}}\r\n                          </p>\r\n                          <!-- Action -->\r\n                          <table class=\"body-action\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n                            <tbody>\r\n                              <tr>\r\n                                <td align=\"center\">\r\n                                  <div>\r\n                                    <a href=\"{{action_url}}\" class=\"button button--blue cursor-pointer\">\r\n                                      Verify Email\r\n                                    </a>\r\n                                  </div>\r\n                                </td>\r\n                              </tr>\r\n                            </tbody>\r\n                          </table>\r\n                          <p>\r\n                            Thanks,\r\n                            <br>\r\n                              {{site_name}} Team\r\n                              </p>\r\n                            <!-- Sub copy -->\r\n                            <table class=\"body-sub\">\r\n                              <tbody>\r\n                                <tr>\r\n                                  <td>\r\n                                    <p class=\"sub\">\r\n                                      If you’re having trouble clicking the button, copy and paste the URL below into your web browser.\r\n                                    </p>\r\n                                    <p class=\"sub\">\r\n                                      <a href=\"{{action_url}}\">\r\n                                        {{action_url}}\r\n                                      </a>\r\n                                    </p>\r\n                                  </td>\r\n                                </tr>\r\n                              </tbody>\r\n                            </table>\r\n                            </td>\r\n                          </tr>\r\n                        </tbody>\r\n                      </table>\r\n                    </td>\r\n                  </tr>\r\n                <tr>\r\n                  <td>\r\n                    <table class=\"email-footer\" width=\"570\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n                      <tbody>\r\n                        <tr>\r\n                          <td class=\"content-cell\">\r\n                            <p class=\"sub center\">\r\n                              {{copyright_text}}\r\n                            </p>\r\n                            <p class=\"sub center\">\r\n                              {{site_name}}\r\n                              <br>\r\n                                {{site_address}}\r\n                                </p>\r\n                              </td>\r\n                            </tr>\r\n                          </tbody>\r\n                        </table>\r\n                      </td>\r\n                    </tr>\r\n                  </tbody>\r\n                </table>\r\n              </td>\r\n            </tr>\r\n          </tbody>\r\n        </table>\r\n      </div>', 'Common', 'Active', NULL, NULL, '2021-07-25 11:20:28');

-- --------------------------------------------------------

--
-- Table structure for table `event_categories`
--

CREATE TABLE `event_categories` (
  `id` int(20) NOT NULL,
  `english` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gujarati` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hindi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_english` text COLLATE utf8_unicode_ci NOT NULL,
  `description_gujarati` text COLLATE utf8_unicode_ci NOT NULL,
  `description_hindi` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_categories`
--

INSERT INTO `event_categories` (`id`, `english`, `image`, `status`, `status_at`, `created_at`, `updated_at`, `gujarati`, `hindi`, `description_english`, `description_gujarati`, `description_hindi`) VALUES
(1, 'Birthday parties', 'page_1_1630840903.jpg', 'Active', '2021-08-09 23:07:16', '2021-08-09 23:07:16', '2021-09-05 17:16:47', 'જન્મદિવસની પાર્ટીઓ', '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'લોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે. લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું પ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે. તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથે', ''),
(2, 'Private parties', 'page_2_1630840991.jpg', 'Active', '2021-08-09 23:07:42', '2021-08-09 23:07:42', '2021-09-05 17:16:51', 'ખાનગી પક્ષો', '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'લોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે. લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું પ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે. તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથે', ''),
(3, 'Custom parties', 'page_3_1630840997.jpg', 'Active', '2021-08-09 23:08:08', '2021-08-09 23:08:08', '2021-09-05 17:18:52', 'કસ્ટમ પાર્ટીઓ', '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'લોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે. લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું પ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે. તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથે\r\nલોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે. લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું પ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે. તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથે\r\nલોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે. લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું પ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે. તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથે', ''),
(4, 'Wedding parties', 'page_4_1630841006.jpg', 'Active', '2021-08-09 23:09:14', '2021-08-09 23:09:14', '2021-09-16 21:58:39', 'લગ્ન પક્ષો', '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'લોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે.\r\n\r\n લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું લોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે. લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું પ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે.\r\n\r\n તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથેલોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે. લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું પ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે. તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથેપ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે. તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથે', '');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(20) NOT NULL,
  `type` enum('Image','Video') COLLATE utf8_unicode_ci DEFAULT 'Image',
  `value` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `type`, `value`, `status`, `status_at`, `created_at`, `updated_at`) VALUES
(1, 'Image', 'gallery-6.jpg', 'Active', NULL, NULL, NULL),
(2, 'Image', 'gallery-6.jpg', 'Active', NULL, NULL, NULL),
(3, 'Image', 'gallery-1.jpg', 'Active', NULL, NULL, NULL),
(5, 'Image', 'gallery-3.jpg', 'Active', NULL, NULL, NULL),
(6, 'Image', 'gallery-4.jpg', 'Active', NULL, NULL, NULL),
(7, 'Image', 'gallery-5.jpg', 'Active', NULL, NULL, NULL),
(8, 'Image', 'gallery-6.jpg', 'Active', NULL, NULL, NULL),
(10, 'Image', 'gallery-8.jpg', 'Active', '2021-09-06 21:43:48', NULL, NULL),
(11, 'Image', 'gallery-1.jpg', 'Active', NULL, NULL, NULL),
(12, 'Image', 'gallery-2.jpg', 'Active', NULL, NULL, NULL),
(13, 'Image', 'gallery-3.jpg', 'Active', NULL, NULL, NULL),
(14, 'Image', 'gallery-4.jpg', 'Active', NULL, NULL, NULL),
(15, 'Image', 'gallery-5.jpg', 'Active', NULL, NULL, NULL),
(16, 'Image', 'gallery-6.jpg', 'Active', NULL, NULL, NULL),
(17, 'Image', 'gallery-7.jpg', 'Active', NULL, NULL, NULL),
(18, 'Image', 'gallery-8.jpg', 'Active', NULL, NULL, NULL),
(19, 'Image', 'gallery-1.jpg', 'Active', NULL, NULL, NULL),
(20, 'Image', 'gallery-2.jpg', 'Active', NULL, NULL, NULL),
(21, 'Image', 'gallery-3.jpg', 'Active', NULL, NULL, NULL),
(22, 'Image', 'gallery-4.jpg', 'Active', NULL, NULL, NULL),
(23, 'Image', 'gallery-5.jpg', 'Active', NULL, NULL, NULL),
(24, 'Image', 'gallery-6.jpg', 'Active', NULL, NULL, NULL),
(25, 'Image', 'gallery-7.jpg', 'Active', NULL, NULL, NULL),
(26, 'Image', 'gallery-8.jpg', 'Active', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(20) NOT NULL,
  `item_category_id` int(20) NOT NULL,
  `english` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gujarati` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hindi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_category_id`, `english`, `status`, `status_at`, `created_at`, `updated_at`, `gujarati`, `hindi`) VALUES
(1, 1, 'Tata salt', 'Active', '2021-10-07 22:56:58', '2021-10-07 22:56:58', '2021-10-07 22:56:58', 'ટાટા મીઠું ', ''),
(2, 1, 'Black salt', 'Active', '2021-10-07 22:56:58', '2021-10-07 22:56:58', '2021-10-07 22:56:58', 'કાળું મીઠું ', ''),
(3, 1, 'Cayenne', 'Active', '2021-10-07 22:56:58', '2021-10-07 22:56:58', '2021-10-07 22:56:58', 'લાલ મરચું ', ''),
(4, 1, 'Kashmiri Chili', 'Active', '2021-10-07 22:56:58', '2021-10-07 22:56:58', '2021-10-07 22:56:58', 'કાશ્મીરી મરચું ', ''),
(5, 1, 'Turmeric', 'Active', '2021-10-07 22:56:58', '2021-10-07 22:56:58', '2021-10-07 22:56:58', 'હળદર ', ''),
(6, 1, 'Hing', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'હિંગ ', ''),
(7, 1, 'Sanchoro', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સંચોરો ', ''),
(8, 1, 'Coriander', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ધાણાજીરૂ ', ''),
(9, 1, 'Chili without', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'વગાર ના મરચા ', ''),
(10, 1, 'Rye', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'રાઈ ', ''),
(11, 1, 'Fenugreek', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મેથી ', ''),
(12, 1, 'Cumin', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'જીરૂ ', ''),
(13, 1, 'Sugar', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ખાંડ ', ''),
(14, 1, 'Peanut oil', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સીંગતેલ ', ''),
(15, 1, 'Cottonseed oil', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કપાસિયાતેલ ', ''),
(16, 1, 'Copper', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કોપરખમણ ', ''),
(17, 1, 'Lemongrass', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'લીમ્બુફૂલ ', ''),
(18, 1, 'Try', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'અજમો ', ''),
(19, 1, 'Akhadhana', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'અખાધાણા ', ''),
(20, 1, 'Blackbird', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કાળામરી ', ''),
(21, 1, 'Pepper rice', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મરી તાંદલા ', ''),
(22, 1, 'Cashews', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કાજુટુકડા ', ''),
(23, 1, 'Red grapes', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'લાલદ્રાક્ષ ', ''),
(24, 1, 'Almonds', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બદામ ', ''),
(25, 1, 'Almonds', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બદામકતરી ', ''),
(26, 1, 'Pistachios', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'પિસ્તા ', ''),
(27, 1, 'Grinding', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'પીસતાકતરી ', ''),
(28, 1, 'Cardamom', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'એલચી ', ''),
(29, 1, 'Saffron', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કેસર ', ''),
(30, 1, 'Fig', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'અંજીર ', ''),
(31, 1, 'Nut nut', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'અખરોટમગજ ', ''),
(32, 1, 'Lapsi', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'લાપસી ', ''),
(33, 1, 'Mogardal of Mug', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મગ ની મોગરદાળ ', ''),
(34, 1, 'Mug lentils', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મગ ની છોડાવાળી દાળ ', ''),
(35, 1, 'Eno bottle', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ઈનો બોટલ ', ''),
(36, 1, 'Tata Soda', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ટાટા સોડા ', ''),
(37, 1, 'Chickpeas', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ચણા  દાળ  ', ''),
(38, 1, 'Toor dal', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'તુવેરદાળ ', ''),
(39, 1, 'Round', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ગોળ ', ''),
(40, 1, 'Ambli', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'આંબલી ', ''),
(41, 1, 'Peanuts', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સીંગદાણા ', ''),
(42, 1, 'Exactly', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ખારેક ', ''),
(43, 1, 'Adad dal', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'અડદ દાલ ', ''),
(44, 1, 'Black adad', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કાળા અડદ ', ''),
(45, 1, 'Kidney beans', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'રાજમા ', ''),
(46, 1, 'Ghannolot', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ધઉ નો લોટ ', ''),
(47, 1, 'Brain', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મેંદો ', ''),
(48, 1, 'Besan', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બેસન ', ''),
(49, 1, 'Crushed rice', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કવચી  ચોખાં ', ''),
(50, 1, 'Corn floor', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કોર્ન ફ્લોર ', ''),
(51, 1, 'Buru', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બુરૂ ', ''),
(52, 1, 'The. Sugar', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'દ. ખાંડ ', ''),
(53, 1, 'Soft round', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'નરમ ગોળ ', ''),
(54, 1, 'Copra crushed long', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કોપરા છીણ લાંબી ', ''),
(55, 1, 'Mug', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મગ ', ''),
(56, 1, 'Math', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મઠ ', ''),
(57, 1, 'Sela Knead', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સેલા કણકી ', ''),
(58, 1, 'Knead rice', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કણકી ચોખા ', ''),
(59, 1, 'Basmati rice', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બાસમતી ચોખા ', ''),
(60, 1, 'Column rice', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કોલમ ચોખા ', ''),
(61, 1, 'Noodles', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'નુડલ્સ ', ''),
(62, 1, 'Red chili sauce', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'રેડ  ચીલી  સોસ ', ''),
(63, 1, 'Soy sauce', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સોયા સોસ ', ''),
(64, 1, 'Vinegar', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'વિનેગર ', ''),
(65, 1, 'Ajinomoto', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'આજીનોમોટો ', ''),
(66, 1, 'Green chili sauce', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ગ્રીન ચીલી સોસ ', ''),
(67, 1, 'Nylon powder', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'નાયલોન પૌવા ', ''),
(68, 1, 'Thick powwow', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'જાડા પૌવા ', ''),
(69, 1, 'Chile flakes', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ચીલી ફ્લેક્સ ', ''),
(70, 1, 'Oregono', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ઓરોગોનો ', ''),
(71, 1, 'Maggie Cube Paddy', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મેગી ક્યુબ પડીકી ', ''),
(72, 1, 'Oromite spices', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ઓરોમીટ  મસાલા ', ''),
(73, 1, 'Sesame', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'તલ ', ''),
(74, 1, 'Poppy', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ખસખસ ', ''),
(75, 1, 'Tamalpatra', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'તમાલપત્ર ', ''),
(76, 1, 'Black olive bottle', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બ્લેક ઓલિવ બોટલ ', ''),
(77, 1, 'Green olive bottle', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ગ્રીન ઓલિવ બોટલ ', ''),
(78, 1, 'Tabasco', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'તબાસ્કો ', ''),
(79, 1, 'Chickpeas', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કાબુલી ચણા ', ''),
(80, 1, 'Pomegranate', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'અનારદાણા ', ''),
(81, 1, 'Jivraj tea', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'જીવરાજ ચા ', ''),
(82, 1, 'Dried mango', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સૂકા આંબળા ', ''),
(83, 1, 'Amchoor powder', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'આમચૂર પાવડર ', ''),
(84, 1, 'Ginger powder', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સુંઠ પાવડર ', ''),
(85, 1, 'Chola lentils', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ચોળા ની છોડાવાળી દાળ ', ''),
(86, 1, 'Tomato ketchup bottle', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ટામેટા કેચપ બોટલ ', ''),
(87, 1, 'Dates', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ખજૂર ', ''),
(88, 1, 'Ground cumin', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'દળેલુ જીરૂ ', ''),
(89, 1, 'Ground pepper powder', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'દળેલુ મરી પાવડર    ', ''),
(90, 1, 'Rice noodles', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'રાઈસ નુડલ્સ ', ''),
(91, 1, 'Orange red color', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ઓરેન્જ રેડ કલર ', ''),
(92, 1, 'Green color', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ગ્રીન કલર ', ''),
(93, 1, 'Orange color', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કેસરી કલર ', ''),
(94, 1, 'Lemon yellow color', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'લેમન યલો કલર ', ''),
(95, 1, 'Rose Essence', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'રોઝ એસન્સ ', ''),
(96, 1, 'Rose water', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ગુલાબ જળ ', ''),
(97, 1, 'Chhole masala', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'છોલે મસાલો ', ''),
(98, 1, 'Pavbhaji masala', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'પાવભાજી મસાલો ', ''),
(99, 1, 'Biryani masala', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બિરિયાની મસાલો ', ''),
(100, 1, 'Hot spices', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ગરમ મસાલો ', ''),
(101, 1, 'Cinnamon', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'તજ ', ''),
(102, 1, 'Cloves', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'લવિંગ ', ''),
(103, 1, 'Alcho', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'એલચો ', ''),
(104, 1, 'Badia', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બાદિયા ', ''),
(105, 1, 'Javantari', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'જાવન્તરિ ', ''),
(106, 1, 'Nutmeg', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'જાયફળ ', ''),
(107, 1, 'Dagger flower', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ડગર ફૂલ ', ''),
(108, 1, 'Kajukani', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કાજુકણી ', ''),
(109, 1, 'Brainstorming', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મગજતરી ', ''),
(110, 1, 'Kitchenking', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કિચેનકીંગ ', ''),
(111, 1, 'From Kasuri', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કસુરીમેંથી ', ''),
(112, 1, 'Garlic powder', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'લસણ પાવડર ', ''),
(113, 1, 'Onion powder', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કાંદા  પાવડર ', ''),
(114, 1, 'Chaat masala', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ચાટ મસાલા ', ''),
(115, 1, 'Jiralu', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'જીરાળુ', ''),
(116, 1, 'Desi chickpeas', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'દેશી ચણા', ''),
(117, 1, 'Panipuri masala', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'પાણીપુરી મસાલા', ''),
(118, 1, 'Hipolin powder', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'હિપોલીન પાવડર ', ''),
(119, 1, 'Masota', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મસોતા ', ''),
(120, 1, 'Matches', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'માચીસ ', ''),
(121, 1, 'Falcon ', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બાજ  ', ''),
(122, 1, 'Basket', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ટોપલી ', ''),
(123, 1, 'Baskets', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ટોપલા ', ''),
(124, 1, 'Mukhwas', 'Active', '2021-10-13 08:38:07', '2021-10-13 08:38:07', '2021-10-13 08:38:07', 'મુખવાસ પડીકી', NULL),
(125, 1, 'Plum', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'આલુ ', ''),
(126, 1, 'Cocoa powder', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કોકોપાવડર ', ''),
(127, 1, 'Drinking chocolate powder', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ડ્રિકિંગ ચોકલેટ પાવડર', ''),
(128, 1, 'Vanillastard', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'વેનીલાકસ્ટર્ડ ', ''),
(129, 1, 'Kdvococo', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ક્ડવોકોકો ', ''),
(130, 1, 'Chocolate sauce', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ચોલેટ સોસ ', ''),
(131, 1, 'Cherry', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ચેરી  ', ''),
(132, 1, 'Strawberry Crush', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સ્ટ્રોબેરી ક્રશ ', ''),
(133, 1, 'OrangeCrush', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ઓરેન્જક્રશ ', ''),
(134, 1, 'Kiwikrush', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કિવિક્રશ ', ''),
(135, 1, 'Black Current Crush', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બ્લેક કરેંટ ક્રશ ', ''),
(136, 1, 'Pineapple Crush', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'પાઈનેપલ ક્રશ ', ''),
(137, 1, 'Rhubarb crush', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'જમરૂખ ક્રશ ', ''),
(138, 1, 'Papad', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'પાપડ ', ''),
(139, 2, 'Papadi', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાપડી ', ''),
(140, 1, 'Samosa Fries', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સમોસા ફ્રાઇમ્સ ', ''),
(141, 1, 'Flattery', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ચપટાચણા ', ''),
(142, 1, 'Spice', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મસાલાચણા ', ''),
(143, 1, 'Saline', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ખારાદાણા ', ''),
(144, 1, 'Khichiyapapad', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'ખીચિયાપાપડ ', ''),
(145, 1, 'Milk powder', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મિલ્ક પાવડર    ', ''),
(146, 1, 'Coconut milk cans', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'કોકોનટ મિલ્ક ડબ્બા', ''),
(147, 1, 'Sweet sugar', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મધુર ખાંડ', ''),
(148, 1, 'Aretha', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'અરીઠા ', ''),
(149, 1, 'Corn flour', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મકાઈ લોટ ', ''),
(150, 1, 'Millet flour', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બાજરી લોટ ', ''),
(151, 1, 'Sorghum flour', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'જુવાર  લોટ', ''),
(152, 1, 'Peanuts', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મખાણા ', ''),
(153, 1, 'Silk chilli', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'રેશમપટ્ટા મરચા ', ''),
(154, 1, 'Bormarchan', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'બોરમરચાં ', ''),
(155, 1, 'Fermented salt', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સંચળ મીઠું ', ''),
(156, 1, 'Go away', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'રવો ', ''),
(157, 1, 'Rai Kuria', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'રાઈ કુરીયા ', ''),
(158, 1, 'Methi Kuria', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મેથી કુરીયા ', ''),
(159, 1, 'Mustard oil', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સરસવ તેલ ', ''),
(160, 1, 'Soychrach', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સોયાક્રચ ', ''),
(161, 1, 'Dahlia', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'દાળીયા ', ''),
(162, 1, 'Takmariya', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'તકમરીયા ', ''),
(163, 1, 'White pepper powder', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'સફેદમરી પાવડર ', ''),
(164, 1, 'Black pepper powder', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કાળા મરીપાવડર   ', ''),
(165, 1, 'Cat litter m', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'માંજરપાટ મીટર ', ''),
(166, 1, 'Ness coffee', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'નેસ કોફી ', ''),
(167, 1, 'Foil', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'વરખ ', ''),
(168, 1, 'Val Desi', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'વાલ દેશી ', ''),
(169, 1, 'Ranguniwal', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'રંગુનીવાલ ', ''),
(170, 1, 'Val Nidal', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'વાલ નીદાળ ', ''),
(171, 1, 'Jellipino', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'જેલિપિનો ', ''),
(172, 1, 'Babecusos', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બાબેક્યુસોસ ', ''),
(173, 1, 'Mustard sauce', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મસ્ટર્ડસોસ ', ''),
(174, 1, 'Oyster Sauce', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ઓસ્ટર્સ સોસ ', ''),
(175, 1, 'Garlicosos', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ગાર્લિકસોસ ', ''),
(176, 1, 'Cezvansos', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સેઝવાનસોસ ', ''),
(177, 1, 'Tomato puree', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ટામેટાપ્યુરી ', ''),
(178, 1, 'Selabasmati', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સેલાબાસમતી ', ''),
(179, 1, 'Olive oil', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ઓલીવ ઓઈલ ', ''),
(180, 1, 'Pickled sambar', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'અથાણાં સંભાર ', ''),
(181, 1, 'Sambhar masala', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સંભાર મસાલો ', ''),
(182, 1, 'Butter spice', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મખની મસાલો ', ''),
(183, 1, 'Chhas Nomsalo', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'છાસ નોમસાલો ', ''),
(184, 1, 'Green bodice', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લીલી ચોળી ', ''),
(185, 1, 'Redhead', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લાલચોળી  ', ''),
(186, 1, 'White chola', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સફેદ ચોળા ', ''),
(187, 1, 'Beans cans', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બીન્સ ડબ્બા ', ''),
(188, 1, 'Canapes', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કેનેપ્સ ', ''),
(189, 1, 'Macroni', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મેક્રોની ', ''),
(190, 1, 'Furfly pasta', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ફરફલી પાસ્તા ', ''),
(191, 1, 'Screw pasta', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સ્ક્રુ પાસ્તા ', ''),
(192, 1, 'Penny pasta', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પેની પાસ્તા ', ''),
(193, 1, 'The spice of the juice', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'જ્યુસ નો મસાલો ', ''),
(194, 1, 'Sandwich spice', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સેન્ડવીચ મસાલો ', ''),
(195, 1, 'Baking powder', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બેકીંગ પાવડર ', ''),
(196, 1, 'Orange Crush', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ઓરેંજ ક્રસ  ', ''),
(197, 1, 'Crush the toss', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ટોસ ભુકો ', ''),
(198, 1, 'Cocoa powder', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કોકો પાવડર   ', ''),
(199, 1, 'Kalajam Crush', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કાલાજામ ક્રસ ', ''),
(200, 1, 'Honey bottle', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મધબોટલ ', ''),
(201, 1, 'Rajgara flour', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'રાજગરા લોટ ', ''),
(202, 1, 'Morio', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મોરીયો ', ''),
(203, 1, 'Shingles flour', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'શીંગોડા લોટ ', ''),
(204, 1, 'Swaminarayanpuri Lot', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સ્વામીનારાયનપુરી લોટ', ''),
(205, 1, 'Gulkand', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ગુલકંદ ', ''),
(206, 1, 'Tutifuti', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ટુટીફૂટી ', ''),
(207, 1, 'Soybeans', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સોયાબીનવડી ', ''),
(208, 1, 'ThaiPaste', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'થાઈપેસ્ટ ', ''),
(209, 1, 'Tea spice', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ચાનો મસાલો ', ''),
(210, 1, 'Periphery sauce', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પેરીપેરી સોસ ', ''),
(211, 1, 'Mustard sauce', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મસ્ટર્ડ સોસ ', ''),
(212, 1, 'Capsico sauce', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કેપ્સીકો સોસ ', ''),
(213, 1, 'Salsasos', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સાલસાસોસ ', ''),
(214, 1, 'Saline seeds', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ખારા દાણા', ''),
(215, 1, 'Save Ratlami', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'રતલામી સેવ ', ''),
(216, 5, 'Jamkhabhaliya ghee', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'જામખભાલીયા ઘી ', ''),
(217, 5, 'Cheese slices', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ચીઝસ્લાઈસ ', ''),
(218, 5, 'Popcorn cheese', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પોપકોર્ન ચીઝ ', ''),
(219, 5, 'Idda Kheeru', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ઇદડા ખીરૂ', ''),
(220, 5, 'Papadi-nodules', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાપડી-ગાંઠીયા ', ''),
(221, 5, 'Handwa flour', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'હાંડવા નો લોટ ', ''),
(222, 5, 'Chickpea flour', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ચણા નોગગરો  લોટ   ', ''),
(223, 5, 'Wheat coarse flour', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ઘઉ નો જાડો લોટ', ''),
(224, 5, 'Jinisev Farsan', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'જીણીસેવ ફરસાણ ', ''),
(225, 5, 'Jadisev Farsan', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'જાડીસેવ ફરસાણ', ''),
(226, 5, 'East', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ઇસ્ટ ', ''),
(227, 5, 'Molomavo', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મોળોમાવો ', ''),
(228, 5, 'Klankandamavo', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ક્લાંકંદમાવો   ', ''),
(229, 5, 'Nachos', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'નાચોઝ ', ''),
(230, 5, 'Tacos', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ટાકોઝ ', ''),
(231, 5, 'Samospatti', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સમોસપટ્ટી ', ''),
(232, 5, 'Springrolrolly', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સ્પ્રિંગરોલરોટલી ', ''),
(233, 5, 'Frankinrotley', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ફ્રેનકિંરોટલી ', ''),
(234, 5, 'Pizza bread', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પીઝા બ્રેડ ', ''),
(235, 5, 'Garlic bread', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ગાર્લિક બ્રેડ ', ''),
(236, 5, 'Biscuitpie', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બિસ્કીટપાઇ ', ''),
(237, 5, 'Bread', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બ્રેડ ', ''),
(238, 5, 'Tosbiskit', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ટૉસબિસ્કિટ ', ''),
(239, 5, 'Toast sandwich', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ટોસ્ટ સેન્ડવીચ', ''),
(240, 5, 'Kulcha', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કુલચા ', ''),
(241, 5, 'Barbecue kulcha', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બાર્બેક્યુ કુલચા ', ''),
(242, 5, 'Pav Bhajina Pav', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાંવ  ભાજીના પાંવ', ''),
(243, 5, 'Brownie', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બ્રાઉની  ', ''),
(244, 5, 'Coconut shell', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'નાળીયેર ખમણ ', ''),
(245, 5, 'Khaman ready', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ખમણ તૈયાર ', ''),
(246, 5, 'Idla ready', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ઈદળા તૈયાર', ''),
(247, 5, 'Containers ready', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાતરા તૈયાર', ''),
(248, 5, 'Live Dhokla ready', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લાઈવ ઢોકળા તૈયાર', ''),
(249, 5, 'Soup steak', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સુપ સ્ટીક ', ''),
(250, 5, 'Grapes', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'અંગુર ', ''),
(251, 5, 'Cashew Sweet', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કાજુ સ્વીટ ', ''),
(252, 5, 'Bengali Sweet', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બંગાલી સ્વીટ ', ''),
(253, 5, 'Custard pulp', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સીતાફળ પલ્પ ', ''),
(254, 5, 'Peel an orange', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સંતરા માવો ', ''),
(255, 5, 'Cream salad ready', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ક્રીમ સલાડતૈયાર ', ''),
(256, 5, 'Monastery', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મઠો ', ''),
(257, 5, 'Shrikhad', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'શ્રીખડ', ''),
(258, 5, 'Coal', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કોલસા ', ''),
(259, 5, 'Canola pipe', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કેનલોની પાઇપ ', ''),
(260, 5, 'Pineapple Titbit', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાઈનેપલ ટિટબિટ ', ''),
(261, 5, 'Mango juice', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કેરી નો રસ ', ''),
(262, 5, 'Cans of juice', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'રસ ડબ્બા ', ''),
(263, 5, 'Tarofa cream', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'તરોફા મલાઈ ', ''),
(264, 5, 'Green coconut', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લીલા નાળિયેર ', ''),
(265, 5, 'Strawberry pieces', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સ્ટ્રોબેરી ટુકડા ', ''),
(266, 5, 'Juice cream', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'રસ મલાઈ ', ''),
(267, 5, 'Cream balls', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મલાઈ ગુલ્લાં ', ''),
(268, 5, 'Spoon of cream', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મલાઈ ચમચમ ', ''),
(269, 5, 'Lychee stalks', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લીચી ગુલ્લાં ', ''),
(270, 5, 'Lazania belt', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લઝાનિયા પટ્ટા ', ''),
(271, 5, 'Blue Lagoon', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બ્લુ લગૂન ', ''),
(272, 5, 'Mozito', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મોઝીટો ', ''),
(273, 5, 'Mirida colddrink', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મીરિડા કોલ્ડડ્રીંક', ''),
(274, 5, 'Spritecolddrink', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સ્પ્રાઈટકોલ્ડડ્રીંક', ''),
(275, 5, 'My colddrink', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'માઝા કોલ્ડડ્રીંક', ''),
(276, 5, 'Kalajam', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કાલાજામ ', ''),
(277, 5, 'Bread packets', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બ્રેડ પેકેટ ', ''),
(278, 5, 'Sekelasingadana', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સેકેલાસિંગદાણાં ', ''),
(279, 5, 'Salty', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'નમકીન ', ''),
(280, 5, 'Ice cream', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'આઈસક્રીમ ', ''),
(281, 5, 'Chanachor hot', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ચનાચોર ગરમ ', ''),
(282, 5, 'Popcorn', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પોપકોર્ન ', ''),
(283, 5, 'Sugarcandy', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સુગરકેન્ડી ', ''),
(284, 5, 'Jumping', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'જંપીગ ', ''),
(285, 5, 'Coffee machine', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કોફી મશીન ', ''),
(286, 5, 'Fruit Dis', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ફ્રુટ ડીસ  ', ''),
(287, 5, 'Coffee bar', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કોફીબાર ', ''),
(288, 5, 'Mocktail bar', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મોકટેઇલ બાર ', ''),
(289, 5, 'Ice cream bar', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'આઈસ્ક્રીમ બાર ', ''),
(290, 5, 'Patudi', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાટુડી ', ''),
(291, 5, 'Cheese spinach patudi', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ચીઝ પાલક પાટુડી ', ''),
(292, 5, 'Mother of cow\'s milk', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ગાય ના દુધ નો માવો ', ''),
(293, 5, 'Limca colddrink', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લિમ્કા કોલ્ડડ્રિન્ક ', ''),
(294, 5, 'Bruceta', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બ્રુસેટા ', ''),
(295, 5, 'Arc', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ચાપ ', ''),
(296, 5, 'Kulfi', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કુલ્ફી ', ''),
(297, 5, 'Pansot', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાનસોટ ', ''),
(298, 5, 'Nylonsave', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'નાયલોનસેવ ', ''),
(299, 5, 'Labor', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મજુરણ', ''),
(300, 5, 'The waiter', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'વેઈટર ', ''),
(301, 5, 'Valley', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ઘાટી ', ''),
(302, 5, 'Bombayboy', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બોમ્બેબોય ', ''),
(303, 5, 'P a o', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પી આ ઓ ', ''),
(304, 5, 'Rickshaw', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'રીક્ષા ', ''),
(305, 5, 'Tempo', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ટેમ્પો ', ''),
(306, 5, 'Decoration', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ડેકોરેશન', ''),
(307, 5, 'Spicy bundi', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'તીખી બુંદી ', ''),
(308, 2, 'Eggplant', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'રીંગણ', ''),
(309, 2, 'Billimora eggplant', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બીલીમોરા રીંગણ', ''),
(310, 2, 'Riganravaiyan', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'રીગણરવૈયાં ', ''),
(311, 2, 'Potatoes', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બટાકા ', ''),
(312, 2, 'Peas Shig', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'વટાણા શીગ ', ''),
(313, 2, 'Sweet potatoes', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'શક્કરિયા ', ''),
(314, 2, 'Round yam', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ગોળ રતાળુ ', ''),
(315, 2, 'Yam long', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'રતાળુ લાંબુ ', ''),
(316, 2, 'Tomatoes', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ટામેટા ', ''),
(317, 2, 'Onions', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કાંદા ', ''),
(318, 2, 'Green garlic curtains', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લીલુંલસણ પડદા ', ''),
(319, 2, 'Dry the garlic', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લસણ સુકુ ', ''),
(320, 2, 'Coriander curtains', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કોથમીર પડદા ', ''),
(321, 2, 'Neem', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લીમડો ', ''),
(322, 2, 'Lemon', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લીંબુ ', ''),
(323, 2, 'Ginger', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'આદુ ', ''),
(324, 2, 'Chili', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લીલામરચાં    ', ''),
(325, 2, 'Yellow turmeric', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પીળી હળદર', ''),
(326, 2, 'Mango', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'આંબાહળદર ', ''),
(327, 2, 'Turia', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'તુરીયા ', ''),
(328, 2, 'Patra Pan', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાતરા પાન ', ''),
(329, 2, 'Capsicum', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કેપ્સીકમ ', ''),
(330, 2, 'Red capsicum', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લાલ કેપ્સીકમ ', ''),
(331, 2, 'Yellow capsicum', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પીળા કેપ્સીકમ ', ''),
(332, 2, 'Broccoli', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બ્રોકલી ', ''),
(333, 2, 'Jukney Green', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'જુકની ગ્રીન ', ''),
(334, 2, 'Juke\'s Yellow', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'જુકની યલો ', ''),
(335, 2, 'Purple Cauliflower', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પર્પેલ કોબીઝ ', ''),
(336, 2, 'Celery leaves', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સેલરીપત્તા ', ''),
(337, 2, 'Freshbasil', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ફ્રેશબેસિલ ', ''),
(338, 2, 'Rosemary', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'રોઝમેરી ', ''),
(339, 2, 'Lemon grass', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લેમોન ગ્રાસ ', ''),
(340, 2, 'Lotus Gobi', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લોટ્સ ગોબી ', ''),
(341, 2, 'Cauliflower', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કોબીઝ ', ''),
(342, 2, 'Carrots', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ગાજર ', ''),
(343, 2, 'Cucumber', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કાકડી ', ''),
(344, 2, 'Bit', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બીટ ', ''),
(345, 2, 'Radish', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મૂળા ', ''),
(346, 2, 'Totapurikeri', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'તોતાપુરીકેરી ', ''),
(347, 2, 'Hafuskeri', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'હાફૂસકેરી ', ''),
(348, 2, 'Pineapple Nang', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાઈનેપલ નંગ ', ''),
(349, 2, 'Kiwi', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કિવિ ', ''),
(350, 2, 'Rhubarb', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'જમરૂખ ', ''),
(351, 2, 'Chiku', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ચિકુ ', ''),
(352, 2, 'Pomegranate', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'દાડમ ', ''),
(353, 2, 'Apple', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સફરજન ', ''),
(354, 2, 'Watermelon', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'તડબૂચ ', ''),
(355, 2, 'Black grapes', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કાળી દ્રાક્ષ ', ''),
(356, 2, 'Green grapes', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લીલી દ્રાક્ષ ', ''),
(357, 2, 'Bananas', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કેળા ', ''),
(358, 2, 'Greens', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લીલીચાપત્તી', ''),
(359, 2, 'Karela', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કારેલા ', ''),
(360, 2, 'Tindora', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ટીંડોરા ', ''),
(361, 2, 'Parvar', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પરવર ', ''),
(362, 2, 'Oysters', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ભીંડા ', ''),
(363, 2, 'Flower', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ફ્લાવર ', ''),
(364, 2, 'Trapped', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ફણસી ', ''),
(365, 2, 'Cheritameta', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ચેરીટામેટા ', ''),
(366, 2, 'Peeled garlic', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'છોલેલું લસણ ', ''),
(367, 2, 'Consecutive walnuts', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સળંગ વાલનીદાળ ', ''),
(368, 2, 'Mushroom', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મશરૂમ ', ''),
(369, 2, 'Babycorn', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'બેબીકોર્ન ', ''),
(370, 2, 'American Corn', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'અમેરિકન કોર્ન ', ''),
(371, 2, 'Corn', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મકાઈદાણા ', ''),
(372, 2, 'Arabic', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'અરબી     ', ''),
(373, 2, 'Wadhwani Chili', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'વઢવાણી મરચા ', ''),
(374, 2, 'Radish Chili', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મોળા મરચા ', ''),
(375, 2, 'Oranges', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સંતરા ', ''),
(376, 2, 'Citrus', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મોસંબી ', ''),
(377, 2, 'Mint curtains', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ફુદીના પડદા ', ''),
(378, 2, 'Guardian', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાલક ', ''),
(379, 2, 'pumpkin', 'Active', '2021-10-13 08:43:35', '2021-10-13 08:43:35', '2021-10-13 08:43:35', 'કોળું', NULL),
(380, 2, 'Pasley', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાસ્લે ', ''),
(381, 2, 'Milky striped', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'દૂધી પટ્ટીવાળી ', ''),
(382, 2, 'Cantola', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કંટોલા ', ''),
(383, 2, 'Guwarsingh', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ગુવારસીંગ', ''),
(384, 2, 'Green', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લીલવા', ''),
(385, 2, 'Green chickpeas', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'લીલા ચણા', ''),
(386, 2, 'Tuvardana', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'તુવરદાણા ', ''),
(387, 2, 'Raw papam', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કાચુ પપમ    ', ''),
(388, 2, 'Pakuppam', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાકુપપમ ', ''),
(389, 2, 'Mentho', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'મેંથો ', ''),
(390, 2, 'Sarsoki Bhaji', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સરસોકી ભાજી ', ''),
(391, 2, 'Sengta Sing', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સેંગટા સીંગ ', ''),
(392, 2, 'Kamarakh', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કમરખ ', ''),
(393, 2, 'Pineapple Nang', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાઇનેપલ નંગ ', ''),
(394, 2, 'Small potatoes', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'નાની બટાકી ', ''),
(395, 4, 'Papernapkin', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પેપરનેપકિન ', ''),
(396, 4, 'Glass of water', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'પાણી ના ગ્લાસ ', ''),
(397, 4, 'Glass of juice', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'જ્યુસ ના ગ્લાસ ', ''),
(398, 4, 'Small paper napkin', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'નાના પેપર નેપકીન ', ''),
(399, 4, 'Silver foil', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'સિલ્વર ફોઈલ ', ''),
(400, 4, 'Cream foil', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ક્રીમ ફોઈલ ', ''),
(401, 4, 'Garbage bag', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'ગાર્બેજ બેગ ', ''),
(402, 4, 'Name tag', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'નેઈમ ટેગ ', ''),
(403, 4, 'Marker pen', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'મારકર પેન ', ''),
(404, 4, 'Hand gloss', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'હેન્ડ ગ્લોઝ ', ''),
(405, 4, 'Toothpick can', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ટુથપીક ડબ્બી', ''),
(406, 4, 'Straw packet', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સ્ટ્રો પેકેટ', ''),
(407, 4, 'Soup spoon packet', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સૂપ ચમચી પેકેટ', ''),
(408, 4, ' Thermocolglass', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', ' થમોકોલગ્લાસ  ', ''),
(409, 4, 'Plastic spoon no', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પ્લાસ્ટીક ચમચી નંગ   ', ''),
(410, 4, 'Snack dish no', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'નાસ્તા ડીશ નંગ ', ''),
(411, 4, 'Thermocol Dadia Nang', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'થર્મોકોલ દડીયા નંગ', ''),
(412, 4, 'Thermocoldish Nang', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'થર્મોકોલડીશ નંગ ', ''),
(413, 4, 'Oatmeal sauce', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચટણી દળીયા ', ''),
(414, 4, 'Dessert bowl', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'મીઠાઈ કટોરી ', ''),
(415, 4, 'Tea glass no', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચા ગ્લાસ નંગ ', ''),
(416, 4, 'The glass of Chhas', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'છાસ ના ગ્લાસ ', ''),
(417, 4, 'Tuple paper napkins', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ટુપ્લાય પેપર નેપકીન       ', '');
INSERT INTO `items` (`id`, `item_category_id`, `english`, `status`, `status_at`, `created_at`, `updated_at`, `gujarati`, `hindi`) VALUES
(418, 4, ' Three plywood napkins', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', ' થ્રિ પ્લાયપેપરનેપકીન', ''),
(419, 4, 'Handgloss plastic', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'હેન્ડગ્લોઝ પ્લાસ્ટીક ', ''),
(420, 4, 'Spoon of thorns', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'કાંટા ચમચી ', ''),
(421, 4, 'Long stick', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'લાંબી સ્ટીક ', ''),
(422, 6, 'Aluminum Tapela Nang', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'એલ્યૂમીનિયમ તપેલા નંગ ', ''),
(423, 6, 'Brass Tapelanang', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પિત્તળ તપેલાનંગ ', ''),
(424, 6, 'Cathrot Nang', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'કથરોટ  નંગ', ''),
(425, 6, 'Kamandal', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'કમંડળ ', ''),
(426, 6, 'Bowl', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'બાઉલ ', ''),
(427, 6, 'Bucket', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ડોલ ', ''),
(428, 6, 'Bhatiyan', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ભાતીયાં ', ''),
(429, 6, 'Spoon', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચમચા ', ''),
(430, 6, 'Doya', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ડોયા ', ''),
(431, 6, 'Patli -Velan', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પાટલી -વેલણ ', ''),
(432, 6, 'Paddle', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચપ્પુ ', ''),
(433, 6, 'Ransom', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ખાંડણી -દસ્તો ', ''),
(434, 6, 'Pena', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પેણા', ''),
(435, 6, 'Frying pan', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'તવા ', ''),
(436, 6, 'Disset', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ડિસસેટ ', ''),
(437, 6, 'Wadaki', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'વાડકી ', ''),
(438, 6, 'Spoon', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચમચી ', ''),
(439, 6, 'Westtub', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'વેસ્ટટબ ', ''),
(440, 6, 'Steel jug', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સ્ટીલ જગ ', ''),
(441, 6, 'Steel Pavali', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સ્ટીલ પવાલી   ', ''),
(442, 6, 'Aluminum Pavli', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'એલ્યૂમીનિયમ પવાલી ', ''),
(443, 6, 'Warmer', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'વોર્મર ', ''),
(444, 6, 'Service Chipia', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સર્વિસ ચીપીયા ', ''),
(445, 6, 'Jalebi palm', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'જલેબી તાવડી ', ''),
(446, 6, 'Steel', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સ્ટીલકડાઈ ', ''),
(447, 6, 'Chinese cauldron', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચાઈનીઝ કડાઈ ', ''),
(448, 6, 'Can', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ડબ્બુ ', ''),
(449, 6, 'Palta', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પલ્ટા ', ''),
(450, 6, 'Chinese stoves', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચાઈનીઝ ચૂલો   ', ''),
(451, 6, 'Steel stove', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સ્ટીલ ચુલા ', ''),
(452, 6, 'Steel griddle', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સ્ટીલ તવા ', ''),
(453, 6, 'Iddanaovan', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ઈદડાંઓવન ', ''),
(454, 6, 'Bread kiln', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'રોટલી ભઠ્ઠા ', ''),
(455, 6, 'Salad plate', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સલાડ પ્લેટ ', ''),
(456, 6, 'Sauce bowl', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચટણી બાઉલ ', ''),
(457, 6, 'Glass Naboul', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'કાચ નાબાઉલ ', ''),
(458, 6, 'Brussels of glass', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'કાચ ના બ્રોસીલ ', ''),
(459, 6, 'Trough counter', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચાટ કાઉન્ટર', ''),
(460, 6, 'Pizza account', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પીઝા એકાઉન્ટ', ''),
(461, 6, 'Roti counter', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'રોટીકાઉન્ટર', ''),
(462, 6, 'Nonstick pen', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'નોનસ્ટિક પેન ', ''),
(463, 6, 'Penfry', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પેનફ્રાઇ ', ''),
(464, 6, 'Brick of glass', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'કાંચ ની ઈટ ', ''),
(465, 6, 'Service tray', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સર્વિસ ટ્રે ', ''),
(466, 6, 'Glass of juice', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'જ્યુસ ના  ગ્લાસ', ''),
(467, 6, 'Salad stand', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સલાડ સ્ટેન્ડ ', ''),
(468, 6, 'Nameboard stand', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'નેઈમબોર્ડ સ્ટેન્ડ ', ''),
(469, 6, 'Cheval Coconut Nang', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચેવલ નાળીયેર નંગ ', ''),
(470, 6, 'Rice plate', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'રાઇસ પ્લેટ ', ''),
(471, 6, 'Service Chipia', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સર્વિસ ચિપીયા ', ''),
(472, 6, 'Gravy machine', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ગ્રેવીમશીન ', ''),
(473, 6, 'Yam slicer', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'રતાળુ સ્લાઇસર ', ''),
(474, 6, 'Cutting machine', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'કટીંગ મશીન ', ''),
(475, 6, 'Tavetha', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'તવેથા ', ''),
(476, 6, 'Zara', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ઝારા ', ''),
(477, 6, 'Sandwich machine', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સેન્ડવિચ મશીન ', ''),
(478, 6, 'Pizza oven', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પીઝાઓવન ', ''),
(479, 6, 'Tikka fireplace', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ટીક્કા સગડી ', ''),
(480, 6, 'Dessert outpost', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'મીઠાઈ ચૌકી', ''),
(481, 6, 'Puri Live Stoves', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પુરી લાઈવ ચૂલો ', ''),
(482, 6, 'FarsanLive stoves', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ફરસાણલાઈવ ચૂલો', ''),
(483, 6, 'Chhina', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'છીણા', ''),
(484, 6, 'Alutikki counter', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'આલુટીક્કી કાઉન્ટર', ''),
(485, 6, 'Induction stove', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ઈન્ડેક્સન ચુલા ', ''),
(486, 6, 'Bread ovens', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'રોટલી ચૂલો ', ''),
(487, 6, 'Quarterplate', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ક્વાટેરપ્લેટ ', ''),
(488, 6, 'Soup bowl', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સુપ બાઉલ ', ''),
(489, 6, 'Pinipuri plate', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પીણીપુરી પ્લેટ ', ''),
(490, 6, 'Butter Knife', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'બટર નાઇફ ', ''),
(491, 6, 'Potato peel paddle', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'બટાકા છોલવાનું ચપ્પુ ', ''),
(492, 6, 'Matka Dalraisna', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'મટકા દાલરાઇસના ', ''),
(493, 6, 'For bucket bumps', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'બાલ્ટી દાલતડકા માટે ', ''),
(494, 6, 'Paneer vegetable bowl', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પનીર સબ્જીબાઉલ ', ''),
(495, 6, 'Sizzler plate', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સીઝલર પ્લેટ ', ''),
(496, 6, 'Sizzler stove', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સીઝલર ચુલા ', ''),
(497, 6, 'Ghebar true', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ઘેબર સાચાં ', ''),
(498, 6, 'Live vegetable counter', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'લાઈવ સબ્જી કાઉન્ટર ', ''),
(499, 6, 'Live Sweetcounter', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'લાઈવ સ્વીટકાઉન્ટર', ''),
(500, 6, 'Small bottle of gas', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'નાનાં બાટલા ગેસ', ''),
(501, 6, 'Gas bottle', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ગેસ બોટલ ', ''),
(502, 6, 'Pav Bhaji Pressure', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પાંવ ભાજી પ્રેશર', ''),
(503, 6, 'Iron scraper', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'લોખડ તવેથા ', ''),
(504, 6, 'Cutting thin', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'કટીંગ પાટલા ', ''),
(505, 6, 'Cutting paddle', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'કટીંગ ચપ્પુ ', ''),
(506, 6, 'Pizzacter', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પીઝાકટર  ', ''),
(507, 6, 'Gas stove', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ગેસ ચુલા ', ''),
(508, 6, 'Twenty five pages', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પંચીસ પાનું', ''),
(509, 6, 'Gas pipe', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ગેસ પાઇપ ', ''),
(510, 6, 'Kettle of tea', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચા ની કીટલી ', ''),
(511, 6, 'Cutless Biba', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'કટલેસ બીબા ', ''),
(512, 6, 'Trough bowl', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચાટ કટોરી ', ''),
(513, 6, 'Twister machine', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ટ્વિસ્ટર મશીન ', ''),
(514, 6, 'Tea leaves', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચાનુ  ગરણું ', ''),
(515, 6, 'Cabbage Grinding Machine', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'કોબીઝ છીણવા નુ મશીન   ', ''),
(516, 6, 'Trolley', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ટ્રોલી ', ''),
(517, 6, 'Spice box', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'મસાલા પેટી ', ''),
(518, 3, 'Cheese', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ચીઝ ', ''),
(519, 3, 'Cats', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'માંજરેલાંચીઝ ', ''),
(520, 3, 'Cheese', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પનીર ', ''),
(521, 3, 'Cream cheese', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'મલાઈ પનીર', ''),
(522, 3, 'Punjabi Yogurt', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પંજાબી દહીં  ', ''),
(523, 3, 'Butter', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'બટર ', ''),
(524, 3, 'White butter', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'સફેદ માખણ ', ''),
(525, 3, 'Chhas bundles', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'છાસ પોટલાં ', ''),
(526, 3, 'Liters of milk', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'દૂધ લિટર ', ''),
(527, 3, 'Ghee', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ઘી     ', ''),
(528, 3, 'Cream', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ક્રીમ ', ''),
(529, 3, 'Crisp for Tikka', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ટીકકા માટે કડકપનીર', ''),
(530, 3, 'Parmesan cheese', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'પરમેસન ચીઝ', ''),
(531, 3, 'Cow\'s milk', 'Active', '2021-10-07 22:57:01', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'ગાય નુ દુધ ', ''),
(532, 3, 'Cream', 'Active', '2021-10-07 22:59:20', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'મલાઈ ', ''),
(533, 1, 'variyali', 'Active', '2021-10-13 08:34:00', '2021-10-13 08:34:00', '2021-10-13 08:34:00', 'વરિયાળી', NULL),
(534, 1, 'faluda Sav ', 'Active', '2021-10-13 08:38:07', '2021-10-13 08:38:07', '2021-10-13 08:38:07', 'ફાલુદાની સેવ', NULL),
(535, 1, 'roj syrup', 'Active', '2021-10-13 08:38:07', '2021-10-13 08:38:07', '2021-10-13 08:38:07', 'રોજ સીરપ', NULL),
(536, 5, 'panipuri', 'Active', '2021-10-13 08:41:01', '2021-10-13 08:41:01', '2021-10-13 08:41:20', 'પાણીપુરી', NULL),
(537, 5, 'Water bottle ', 'Active', '2021-10-13 08:41:01', '2021-10-13 08:41:01', '2021-10-13 08:41:01', 'પાણીની બોટલ', NULL),
(538, 5, 'Water carba', 'Active', '2021-10-13 08:41:01', '2021-10-13 08:41:01', '2021-10-13 08:41:01', 'પાણીના કાર્બા', NULL),
(539, 2, 'Methini bhaji', 'Active', '2021-10-13 08:42:06', '2021-10-13 08:42:06', '2021-10-13 08:42:06', 'મેથીની ભાજી', NULL),
(540, 2, 'green onion', 'Active', '2021-10-13 08:43:35', '2021-10-13 08:43:35', '2021-10-13 13:45:21', 'લીલા કાંદા', NULL),
(541, 5, 'Orio', 'Active', '2021-10-18 21:23:09', '2021-10-18 21:23:09', '2021-10-18 21:23:09', 'ઓરિઓ', NULL),
(542, 5, 'Nutella', 'Active', '2021-10-18 21:24:05', '2021-10-18 21:24:05', '2021-10-18 21:24:05', 'ન્યુટેલા', NULL),
(543, 1, 'Spegati', 'Active', '2021-10-18 21:24:36', '2021-10-18 21:24:36', '2021-10-18 21:24:36', 'સ્પેગાટી', NULL),
(544, 3, 'Cheese slice', 'Active', '2021-10-18 21:24:52', '2021-10-18 21:24:52', '2021-10-18 21:24:52', 'ચીઝ સ્લાઇસ', NULL),
(545, 1, 'Peanut butter', 'Active', '2021-10-18 21:40:25', '2021-10-18 21:40:25', '2021-10-18 21:40:25', 'મગફળીનું માખણ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items_categories`
--

CREATE TABLE `items_categories` (
  `id` int(20) NOT NULL,
  `english` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gujarati` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hindi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items_categories`
--

INSERT INTO `items_categories` (`id`, `english`, `status`, `status_at`, `created_at`, `updated_at`, `gujarati`, `hindi`) VALUES
(1, 'Groceries', 'Active', '2021-08-11 22:16:17', '2021-08-11 22:15:53', '2021-08-11 22:15:53', 'કરિયાણું', ''),
(2, 'Vegetables', 'Active', '2021-09-11 23:20:39', '2021-08-11 22:16:53', '2021-08-11 22:16:53', 'શાકભાજી', ''),
(3, 'Dairy', 'Active', '2021-09-11 23:18:09', '2021-08-12 22:27:20', '2021-08-16 22:06:05', 'ડેરી', ''),
(4, 'Papernepkin', 'Active', '2021-09-13 21:00:32', '2021-09-13 20:51:33', '2021-09-13 20:51:33', 'પેપરનેપકીન', ''),
(5, 'Order', 'Active', '2021-09-13 21:01:53', '2021-09-13 21:01:53', '2021-09-13 21:01:53', 'ઓડર', ''),
(6, 'Kitchenware', 'Active', '2021-09-13 21:05:45', '2021-09-13 21:05:45', '2021-09-13 21:05:45', 'વાસણ', ''),
(7, 'General masala', 'Active', '2021-10-10 09:40:22', '2021-10-10 09:40:22', '2021-10-13 08:32:24', 'જનરલ મસાલો ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `langs`
--

CREATE TABLE `langs` (
  `id` int(20) NOT NULL,
  `lang_key` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('other','country','state','district','city','village','religion','group_name') COLLATE utf8_unicode_ci DEFAULT NULL,
  `english` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `gujarati` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `hindi` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(20) NOT NULL,
  `menu_category_id` int(20) NOT NULL,
  `english` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gujarati` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hindi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `description_english` text COLLATE utf8_unicode_ci NOT NULL,
  `description_gujarati` text COLLATE utf8_unicode_ci NOT NULL,
  `description_hindi` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `menu_category_id`, `english`, `image`, `status`, `status_at`, `created_at`, `updated_at`, `gujarati`, `hindi`, `items`, `description_english`, `description_gujarati`, `description_hindi`) VALUES
(1, 14, 'dal', NULL, 'Active', '2021-10-09 23:06:54', '2021-10-09 23:06:54', '2021-10-09 23:06:54', '', NULL, '38,39,40,41,42', '', '', ''),
(2, 1, 'ringan bataka', 'menu_2_1634480765.jpg', 'Active', '2021-10-10 10:19:49', '2021-10-10 10:19:49', '2021-10-17 19:56:05', '', NULL, '308,311,316,318', '', '', ''),
(3, 1, 'panchkutiyu', NULL, 'Active', '2021-10-10 10:33:10', '2021-10-10 10:33:10', '2021-10-14 09:06:19', '', NULL, '41,73,308,311,312,313,314,316,318', '', '', ''),
(4, 1, 'Undhiyu', NULL, 'Active', '2021-10-10 10:43:19', '2021-10-10 10:43:19', '2021-10-14 09:07:00', '', NULL, '41,73,74,310,311,313,314,318', '', '', ''),
(5, 1, 'ringan bharthu', NULL, 'Active', '2021-10-10 10:43:19', '2021-10-10 10:43:19', '2021-10-14 09:06:40', '', NULL, '309,316,317,318,319', '', '', ''),
(6, 1, 'lilva', NULL, 'Active', '2021-10-10 22:05:35', '2021-10-10 22:05:35', '2021-10-10 22:05:35', '', NULL, '22,23,89,318,378,384', '', '', ''),
(7, 1, 'turiyapatra', NULL, 'Active', '2021-10-10 22:05:35', '2021-10-10 22:05:35', '2021-10-10 22:05:35', '', NULL, '318,327,247', '', '', ''),
(8, 14, 'bhaat', NULL, 'Active', '2021-10-10 22:08:42', '2021-10-10 22:08:42', '2021-10-14 10:10:51', '', NULL, '60,527', '', '', ''),
(9, 12, 'paneer chilli roll', NULL, 'Active', '2021-10-10 22:17:28', '2021-10-10 22:17:28', '2021-10-14 10:08:34', '', NULL, '47,48,50,62,63,64,65,71,72,163,316,329,330,331,336,337,341,232,520', '', '', ''),
(10, 15, 'fruit punch', NULL, 'Active', '2021-10-10 22:26:40', '2021-10-10 22:26:40', '2021-10-14 10:13:53', '', NULL, '51,114,133,165,348,353,375,376,397,398,406', '', '', ''),
(11, 6, 'green asian soup', NULL, 'Active', '2021-10-10 22:47:19', '2021-10-10 22:47:19', '2021-10-14 09:14:21', '', NULL, '50,64,65,66,69,70,71,72,329,330,331,332,339,341,342,378,407,488,523,528', '', '', ''),
(12, 6, 'khawse soup', NULL, 'Active', '2021-10-10 22:47:19', '2021-10-10 22:47:19', '2021-10-14 09:16:35', '', NULL, '50,62,65,90,143,145,146,153,317,319,329,330,331,407,488,523,526,528', '', '', ''),
(13, 9, 'cheese ball with muhroom', NULL, 'Active', '2021-10-10 22:55:51', '2021-10-10 22:55:51', '2021-10-14 10:05:02', '', NULL, '163,368,405,518,520', '', '', ''),
(14, 9, 'paneer kurkure', NULL, 'Active', '2021-10-10 23:25:46', '2021-10-10 23:25:46', '2021-10-14 10:05:22', '', NULL, '47,50,62,91,114,138,160,163,421,520', '', '', ''),
(15, 9, 'cheese bollwith jelipino', NULL, 'Active', '2021-10-10 23:35:07', '2021-10-10 23:35:07', '2021-10-14 10:04:42', '', NULL, '50,69,70,114,163,171,405', '', '', ''),
(16, 10, 'live ghevar', NULL, 'Active', '2021-10-10 23:41:36', '2021-10-10 23:41:36', '2021-10-14 10:06:58', '', NULL, '25,27,28,29,47,48,147,228,527', '', '', ''),
(17, 10, 'ras malai', NULL, 'Active', '2021-10-10 23:44:19', '2021-10-10 23:44:19', '2021-10-14 10:07:20', '', NULL, '266', '', '', ''),
(18, 4, 'cheese paneer angoori', 'menu_18_1634310554.jpg', 'Active', '2021-10-10 23:51:38', '2021-10-10 23:51:38', '2021-10-15 20:39:14', '', NULL, '50,100,101,102,103,104,105,106,108,109,110,111,316,317,319,518,521,523,528', '', '', ''),
(19, 4, 'cheese paneer maala', 'menu_19_1634310380.jpg', 'Active', '2021-10-10 23:56:52', '2021-10-10 23:56:52', '2021-10-15 20:36:20', '', NULL, '100,103,104,105,106,108,109,110,111,316,317,319,518,521,523,528', '', '', ''),
(20, 14, 'puri', NULL, 'Active', '2021-10-11 00:01:15', '2021-10-11 00:01:15', '2021-10-14 10:14:29', '', NULL, '46,47', '', '', ''),
(21, 14, 'rotli', NULL, 'Active', '2021-10-11 00:01:15', '2021-10-11 00:01:15', '2021-10-14 10:14:11', '', NULL, '46,527', '', '', ''),
(22, 12, 'dil se', NULL, 'Active', '2021-10-11 00:10:57', '2021-10-11 00:10:57', '2021-10-14 10:08:11', '', NULL, '18,47,48,62,65,67,69,70,73,86,100,114,161,318,320,329,330,331,335,341,342', '', '', ''),
(23, 16, 'dal tadka', 'menu_23_1634315965.png', 'Active', '2021-10-11 00:18:41', '2021-10-11 00:18:41', '2021-10-15 22:09:25', '', NULL, '37,38,101,102,316,317,319,527', '', '', ''),
(24, 16, 'jeera rice', 'menu_24_1634316139.png', 'Active', '2021-10-11 00:18:41', '2021-10-11 00:18:41', '2021-10-15 22:12:19', '', NULL, '59,75,101,102,527', '', '', ''),
(25, 14, 'papad', NULL, 'Active', '2021-10-11 00:20:52', '2021-10-11 00:20:52', '2021-10-14 10:15:23', '', NULL, '138', '', '', ''),
(26, 5, 'green salad', NULL, 'Active', '2021-10-11 00:28:03', '2021-10-11 00:28:03', '2021-10-14 09:11:43', '', NULL, '316,317,342,343,344,345', '', '', ''),
(27, 5, 'mexican salad', NULL, 'Active', '2021-10-11 00:28:03', '2021-10-11 00:28:03', '2021-10-14 09:11:08', '', NULL, '45,69,70,71,72,86,114,329,330,331,335,371', '', '', ''),
(28, 5, 'keri nu athanu', NULL, 'Active', '2021-10-11 00:32:18', '2021-10-11 00:32:18', '2021-10-14 09:11:24', '', NULL, '180,346', '', '', ''),
(29, 14, 'janrel masala', NULL, 'Active', '2021-10-11 08:03:22', '2021-10-11 08:03:22', '2021-10-14 10:11:11', '', NULL, '1,2,3,4,5,6,8,9,10,11,12,13,14,15,16,17,18,118,119,120,121,122,123,318,320,321,322,323,324,377,399,400,401,402,403,404,409,417,418,419', '', '', ''),
(30, 14, 'methiya marcha', NULL, 'Active', '2021-10-11 08:07:36', '2021-10-11 08:07:36', '2021-10-14 10:15:05', '', NULL, '157,158,374', '', '', ''),
(31, 10, 'lapsi kesariya', NULL, 'Active', '2021-10-11 21:12:51', '2021-10-11 21:12:51', '2021-10-14 10:06:22', '', NULL, '13,22,23,24,28,29,32,101,102', '', '', ''),
(32, 12, 'kela methi bhajiya', NULL, 'Active', '2021-10-11 21:18:32', '2021-10-11 21:18:32', '2021-10-14 10:07:54', '', NULL, '19,20,48,357,539', '', '', ''),
(33, 5, 'raytu', NULL, 'Active', '2021-10-11 21:22:01', '2021-10-11 21:22:01', '2021-10-14 09:12:48', '', NULL, '157,343,352,522', '', '', ''),
(34, 4, 'pavbhaji', 'menu_34_1634311962.jpg', 'Active', '2021-10-11 22:21:02', '2021-10-11 22:21:02', '2021-10-15 21:02:42', '', NULL, '98,100,311,312,316,317,319,329,242,523', '', '', ''),
(35, 16, 'tawa pulov', NULL, 'Active', '2021-10-11 22:25:13', '2021-10-11 22:25:13', '2021-10-14 10:12:22', '', NULL, '99,178,312,316,317,329,342,363,364', '', '', ''),
(36, 12, 'paneer lifafa', NULL, 'Active', '2021-10-11 22:41:13', '2021-10-11 22:41:13', '2021-10-14 10:08:52', '', NULL, '48,62,63,65,67,311,312,318,329,341,342,231,520', '', '', ''),
(37, 12, 'kutles', NULL, 'Active', '2021-10-11 22:48:58', '2021-10-11 22:48:58', '2021-10-14 10:09:41', '', NULL, '17,50,51,68,311,312,342,364,238,298,511', '', '', ''),
(38, 5, 'papad papdi', NULL, 'Active', '2021-10-11 22:51:10', '2021-10-11 22:51:10', '2021-10-14 23:41:17', '', NULL, '138', '', '', ''),
(39, 14, 'kadhi', NULL, 'Active', '2021-10-11 22:54:43', '2021-10-11 22:54:43', '2021-10-14 10:11:30', '', NULL, '28,48,101,102,326,522,527', '', '', ''),
(40, 14, 'lachakodal', NULL, 'Active', '2021-10-11 22:57:22', '2021-10-11 22:57:22', '2021-10-14 10:11:46', '', NULL, '38,527', '', '', ''),
(41, 14, 'pulov', NULL, 'Active', '2021-10-11 23:00:23', '2021-10-11 23:00:23', '2021-10-14 10:14:47', '', NULL, '22,23,59,75,101,102,312,329,342,364,527', '', '', ''),
(42, 16, 'dal fry', NULL, 'Active', '2021-10-11 23:06:53', '2021-10-11 23:06:53', '2021-10-14 10:13:35', '', NULL, '33,37,38,43,100,101,102,316,317', '', '', ''),
(43, 4, 'paneer tikka masala', 'menu_43_1634311782.jpg', 'Active', '2021-10-11 23:12:14', '2021-10-11 23:12:14', '2021-10-15 20:59:42', '', NULL, '75,91,100,101,102,103,104,105,106,108,109,110,111,153,316,317,319,329,520,523,528', '', '', ''),
(44, 16, 'veg.biriyani', NULL, 'Active', '2021-10-11 23:19:20', '2021-10-11 23:19:20', '2021-10-14 10:12:04', '', NULL, '22,23,59,75,99,101,102,311,312,316,317,319,329,342,363,364', '', '', ''),
(45, 16, 'hydrabadi biriyani', 'menu_45_1634316284.png', 'Active', '2021-10-11 23:24:45', '2021-10-11 23:24:45', '2021-10-15 22:14:44', '', NULL, '59,75,92,99,100,101,102,111,312,316,317,319,329,363,364,378', '', '', ''),
(46, 12, 'ratalupuri', NULL, 'Active', '2021-10-11 23:33:29', '2021-10-11 23:33:29', '2021-10-14 10:10:33', '', NULL, '19,21,48,315,473', '', '', ''),
(47, 3, 'pizza', NULL, 'Active', '2021-10-12 07:54:34', '2021-10-12 07:54:34', '2021-10-14 09:09:20', '', NULL, '62,65,69,70,71,72,76,77,78,86,153,163,171,179,316,317,329,330,331,335,336,337,368,369,371,380,234,519,523', '', '', ''),
(48, 3, 'pasta', NULL, 'Active', '2021-10-12 07:54:34', '2021-10-12 07:54:34', '2021-10-14 09:08:42', '', NULL, '47,50,62,65,70,71,72,76,77,86,153,163,171,179,190,191,192,316,319,329,330,331,335,336,337,368,369,380', '', '', ''),
(49, 3, 'garlic bread', NULL, 'Active', '2021-10-12 07:59:22', '2021-10-12 07:59:22', '2021-10-14 09:08:22', '', NULL, '86,179,366,235,518,523', '', '', ''),
(50, 2, 'mexican roll', NULL, 'Active', '2021-10-12 08:05:26', '2021-10-12 08:05:26', '2021-10-14 09:07:38', '', NULL, '45,48,62,69,70,71,72,86,163,329,330,331,335,371,232,518,523', '', '', ''),
(51, 10, 'sitafal rabdi', NULL, 'Active', '2021-10-12 08:13:21', '2021-10-12 08:13:21', '2021-10-14 10:07:36', '', NULL, '147,165,253,526', '', '', ''),
(52, 10, 'dryfruit rabdi', NULL, 'Active', '2021-10-12 08:13:21', '2021-10-12 08:13:21', '2021-10-14 10:06:39', '', NULL, '25,27,28,29,147,165,526', '', '', ''),
(53, 10, 'anjeer rabdi', NULL, 'Active', '2021-10-12 08:13:21', '2021-10-12 08:13:21', '2021-10-14 10:06:04', '', NULL, '30,147,165,526', '', '', ''),
(54, 3, 'cenelloni', NULL, 'Active', '2021-10-12 08:22:37', '2021-10-12 08:22:37', '2021-10-14 09:07:56', '', NULL, '47,62,65,69,70,71,72,76,77,153,163,179,316,329,330,331,336,337,369,371,378,380,259,518,523,526', '', '', ''),
(55, 6, 'manchow soup', NULL, 'Active', '2021-10-12 08:33:50', '2021-10-12 08:33:50', '2021-10-14 10:10:07', '', NULL, '50,61,62,63,64,65,91,319,329,330,331,341,342,364,368', '', '', ''),
(56, 6, 'cheese corn tomato soup', NULL, 'Active', '2021-10-12 08:33:50', '2021-10-12 08:33:50', '2021-10-14 09:12:24', '', NULL, '47,165,316,371,518,523', '', '', ''),
(57, 6, 'green asion soup', NULL, 'Active', '2021-10-12 08:41:01', '2021-10-12 08:41:01', '2021-10-14 09:14:59', '', NULL, '50,64,65,66,69,70,71,72,318,319,329,330,331,332,333,334,342,364,368,378', '', '', ''),
(58, 2, 'mexican rice', NULL, 'Active', '2021-10-12 08:49:32', '2021-10-12 08:49:32', '2021-10-14 09:07:16', '', NULL, '45,59,62,65,69,70,71,72,86,89,165,186,187,213,329,330,331,520,523', '', '', ''),
(59, 1, 'dudhi chana', NULL, 'Active', '2021-10-12 08:54:17', '2021-10-12 08:54:17', '2021-10-14 09:05:59', '', NULL, '37,318,319,381', '', '', ''),
(60, 1, 'bhinda sambhariya', 'menu_60_1634480454.jpg', 'Active', '2021-10-12 08:59:18', '2021-10-12 08:59:18', '2021-10-17 19:50:54', '', NULL, '41,73,74,329,362', '', '', ''),
(61, 1, 'bataka capsicum', NULL, 'Active', '2021-10-12 08:59:18', '2021-10-12 08:59:18', '2021-10-14 09:05:40', '', NULL, '17,22,23,73,74,311,329', '', '', ''),
(62, 13, 'manchurian', NULL, 'Active', '2021-10-13 14:17:15', '2021-10-13 14:17:15', '2021-10-16 20:26:57', '', NULL, '47,50,62,63,64,65,317,319,329,341,540,411,420,474,483,515', '', '', ''),
(63, 13, 'paneer chilli', NULL, 'Active', '2021-10-12 09:07:46', '2021-10-12 09:07:46', '2021-10-13 14:18:11', '', NULL, '47,50,62,65,86,91,163,317,319,329,330,331,540,411,420', '', '', ''),
(64, 12, 'locho', NULL, 'Active', '2021-10-12 09:14:03', '2021-10-12 09:14:03', '2021-10-14 10:09:17', '', NULL, '35,36,37,68,409,412,453', '', '', ''),
(65, 8, 'chinese sizller', NULL, 'Active', '2021-10-12 09:58:53', '2021-10-12 09:58:53', '2021-10-14 10:05:42', '', NULL, '59,61,62,65,69,70,71,72,153,163,179,316,317,319,329,330,331,332,333,334,335,336,337,338,341,342,364,368,369,380,495,496,520,523', '', '', ''),
(66, 10, 'moogdal siro', NULL, 'Active', '2021-10-12 10:05:46', '2021-10-12 10:05:46', '2021-10-12 23:53:12', '', NULL, '13,22,23,25,27,28,29,33,526,527', '', '', ''),
(67, 10, 'akhrot halvo', NULL, 'Active', '2021-10-12 10:05:46', '2021-10-12 10:05:46', '2021-10-12 23:53:30', '', NULL, '22,23,25,27,31,228,527', '', '', ''),
(68, 10, 'kaju badam halvo', NULL, 'Active', '2021-10-12 10:15:28', '2021-10-12 10:15:28', '2021-10-12 23:53:46', '', NULL, '22,24,25,27,228,527', '', '', ''),
(69, 10, 'anjeer halvo', NULL, 'Active', '2021-10-12 10:15:28', '2021-10-12 10:15:28', '2021-10-12 23:54:05', '', NULL, '22,24,25,28,30,228,527', '', '', ''),
(70, 4, 'chole masala black', 'menu_70_1634316483.jpeg', 'Active', '2021-10-12 11:21:30', '2021-10-12 11:21:30', '2021-10-15 22:18:03', '', NULL, '75,79,80,82,83,97,103,104,165,311,316,317,319', '', '', ''),
(71, 4, 'chole masala red', 'menu_71_1634311083.jpg', 'Active', '2021-10-12 11:21:30', '2021-10-12 11:21:30', '2021-10-15 20:48:03', '', NULL, '75,79,80,97,103,104,108,109,110,111,316,317,319', '', '', ''),
(72, 5, 'gajar marcha athanu', NULL, 'Active', '2021-10-12 11:32:38', '2021-10-12 11:32:38', '2021-10-12 23:52:51', '', NULL, '157,158,159,180,342,374', '', '', ''),
(73, 16, 'aumrutari kulcha', NULL, 'Active', '2021-10-12 11:44:28', '2021-10-12 11:44:28', '2021-10-12 23:52:20', '', NULL, '46,47,165,195,311,258,520,522,523,526', '', '', ''),
(74, 22, 'laccha paratha', NULL, 'Active', '2021-10-17 14:07:43', '2021-10-17 14:07:43', '2021-10-17 14:07:43', '', NULL, '46,47,195,258,522,523,526,527', '', '', ''),
(75, 5, 'panjabi raytu', NULL, 'Active', '2021-10-12 11:50:08', '2021-10-12 11:50:08', '2021-10-12 23:51:39', '', NULL, '89,316,317,329,343,377,522', '', '', ''),
(76, 6, 'cream of tomato soup', NULL, 'Active', '2021-10-12 11:55:07', '2021-10-12 11:55:07', '2021-10-12 23:51:20', '', NULL, '47,86,163,165,316,518,528', '', '', ''),
(77, 10, 'jalebi', NULL, 'Active', '2021-10-12 11:58:26', '2021-10-12 11:58:26', '2021-10-12 23:51:02', '', NULL, '13,28,47,93,129,148,527', '', '', ''),
(78, 12, 'cheese paneer puff', NULL, 'Active', '2021-10-12 12:02:56', '2021-10-12 12:02:56', '2021-10-12 23:50:43', '', NULL, '48,62,65,69,70,71,72,163,329,330,331,335,231,518,520', '', '', ''),
(79, 5, 'rosted papad', NULL, 'Active', '2021-10-12 12:05:10', '2021-10-12 12:05:10', '2021-10-12 23:50:25', '', NULL, '138', '', '', ''),
(80, 5, 'kobij no sambharo', NULL, 'Active', '2021-10-12 12:10:00', '2021-10-12 12:10:00', '2021-10-12 23:50:05', '', NULL, '341,342,343,352,356,374', '', '', ''),
(81, 4, 'paneer maharaja', 'menu_81_1634313145.jpeg', 'Active', '2021-10-12 12:16:39', '2021-10-12 12:16:39', '2021-10-16 20:27:58', '', NULL, '100,101,102,105,106,108,109,110,111,152,316,317,319,518,520,523,528', '', '', ''),
(82, 12, 'Khaman', NULL, 'Active', '2021-10-12 15:07:58', '2021-10-12 15:07:58', '2021-10-12 23:49:03', '', NULL, '224,245,409,412', '', '', ''),
(83, 12, 'Idada taiyar', NULL, 'Active', '2021-10-12 15:18:28', '2021-10-12 15:18:28', '2021-10-12 23:48:44', '', NULL, '246', '', '', ''),
(84, 12, 'Patra taiyar', NULL, 'Active', '2021-10-12 15:22:58', '2021-10-12 15:22:58', '2021-10-12 23:48:28', '', NULL, '247', '', '', ''),
(85, 12, 'Live dhokla', NULL, 'Active', '2021-10-12 15:24:23', '2021-10-12 15:24:23', '2021-10-12 23:48:11', '', NULL, '248', '', '', ''),
(86, 3, 'Pitabread with english vegg.', NULL, 'Active', '2021-10-19 15:28:08', '2021-10-12 17:48:12', '2021-10-12 23:47:53', '', NULL, '62,69,70,71,72,153,163,179,319,329,330,331,332,333,334,337,368,369,380,241,518,520,523,528', '', '', ''),
(87, 11, 'panipuri', 'menu_87_1634312368.jpg', 'Active', '2021-10-12 22:57:53', '2021-10-12 22:57:53', '2021-10-15 21:09:28', '', NULL, '12,13,40,84,116,117,155,164,311,320,377,307', '', '', ''),
(88, 11, 'delhi chaat', 'menu_88_1634312441.jpg', 'Active', '2021-10-19 10:12:02', '2021-10-12 23:13:01', '2021-10-19 15:20:39', '', NULL, '13,18,33,39,40,43,47,55,56,84,87,114,161,311,320,352,377,378,224', '', '', ''),
(89, 7, 'jiniroll dosa', NULL, 'Active', '2021-10-12 23:26:09', '2021-10-12 23:26:09', '2021-10-12 23:46:52', '', NULL, '37,48,58,86,153,156,161,164,319,329,341,342,344', '', '', ''),
(90, 7, 'masala dosa', NULL, 'Active', '2021-10-12 23:26:09', '2021-10-12 23:26:09', '2021-10-12 23:46:30', '', NULL, '37,48,58,86,153,156,161,311,316,317', '', '', ''),
(91, 1, 'bataka chips', 'menu_91_1634480421.jpg', 'Active', '2021-10-13 13:41:00', '2021-10-13 13:41:00', '2021-10-17 19:50:21', '', NULL, '17,22,23,73,74,311', '', '', ''),
(92, 6, 'broccoli almond soup', NULL, 'Active', '2021-10-13 14:28:44', '2021-10-13 14:28:44', '2021-10-13 14:28:44', '', NULL, '24,50,66,71,72,92,163,329,330,331,332,407,488,523,528', '', '', ''),
(93, 13, 'potato honey chilli', NULL, 'Active', '2021-10-14 08:55:41', '2021-10-14 08:55:41', '2021-10-14 09:54:11', '', NULL, '47,50,62,65,164,200,311,329,330,331,412,420', '', '', ''),
(94, 13, 'paneer red cook', NULL, 'Active', '2021-10-14 09:26:28', '2021-10-14 09:26:28', '2021-10-14 09:53:22', '', NULL, '47,50,62,64,65,86,91,163,329,330,412,420,520', '', '', ''),
(95, 5, 'green chutney', NULL, 'Active', '2021-10-14 09:58:40', '2021-10-14 09:58:40', '2021-10-14 09:58:40', '', NULL, '161,320,377,378,522', '', '', ''),
(96, 5, 'red chutney', NULL, 'Active', '2021-10-14 10:03:26', '2021-10-14 10:03:26', '2021-10-14 10:03:26', '', NULL, '39,40,84,87,533', '', '', ''),
(97, 12, 'tuvar vata ni ni kacori', NULL, 'Active', '2021-10-14 10:25:51', '2021-10-14 10:25:51', '2021-10-14 10:25:51', '', NULL, '17,22,23,47,68,73,312,318,386,224', '', '', ''),
(98, 12, 'copra petis', NULL, 'Active', '2021-10-14 10:25:51', '2021-10-14 10:25:51', '2021-10-14 10:25:51', '', NULL, '17,22,23,48,50,51,67,533,311,318,224,244', '', '', ''),
(99, 4, 'mixveg.tawa', 'menu_99_1634311286.jpg', 'Active', '2021-10-14 10:30:34', '2021-10-14 10:30:34', '2021-10-15 20:51:26', '', NULL, '75,100,103,104,105,108,109,110,111,311,312,316,317,329,342,363,364,518,520,523,528', '', '', ''),
(100, 1, 'green gujarati', NULL, 'Active', '2021-10-14 10:34:52', '2021-10-14 10:34:52', '2021-10-14 10:34:52', '', NULL, '41,73,74,312,318,327,329,360,371,378,247', '', '', ''),
(101, 1, 'panchratna chips', NULL, 'Active', '2021-10-14 10:37:55', '2021-10-14 10:37:55', '2021-10-14 10:37:55', '', NULL, '17,22,23,51,73,74,311,314,329,342,360', '', '', ''),
(102, 4, 'veg.hydrabadi', 'menu_102_1634312212.jpg', 'Active', '2021-10-14 10:43:22', '2021-10-14 10:43:22', '2021-10-15 21:06:52', '', NULL, '75,100,103,104,105,108,109,110,111,312,316,317,319,329,330,331,332,334,335,342,362,364,378,518,521,528', '', '', ''),
(103, 4, 'paneer angara', 'menu_103_1634311730.jpg', 'Active', '2021-10-14 10:48:10', '2021-10-14 10:48:10', '2021-10-15 20:58:50', '', NULL, '75,91,100,103,104,105,108,109,110,111,153,316,317,319,258,518,520,523,528', '', '', ''),
(104, 12, 'patra', NULL, 'Active', '2021-10-14 10:52:03', '2021-10-14 10:52:03', '2021-10-14 10:52:03', '', NULL, '40,48,53,73,74,100,533,328', '', '', ''),
(105, 5, 'masala chas', NULL, 'Active', '2021-10-14 23:11:00', '2021-10-14 23:11:00', '2021-10-14 23:11:00', '', NULL, '88,416,525', '', '', ''),
(106, 10, 'matho', NULL, 'Active', '2021-10-14 23:12:11', '2021-10-14 23:12:11', '2021-10-14 23:12:11', '', NULL, '256', '', '', ''),
(107, 11, 'Paneer-65', 'menu_107_1634317147.jpeg', 'Active', '2021-10-15 17:00:51', '2021-10-15 17:00:51', '2021-10-15 22:29:07', '', NULL, '47,50,62,65,71,72,86,91,153,163,329,330,331,540,412,420,520,522', '', '', ''),
(108, 4, 'Paneer laziz', NULL, 'Active', '2021-10-16 08:06:51', '2021-10-16 08:06:51', '2021-10-16 08:06:51', '', NULL, '101,102,103,104,105,106,108,109,110,111,316,317,319,521,523,528', '', '', ''),
(109, 10, 'mohanthal', NULL, 'Active', '2021-10-16 08:41:31', '2021-10-16 08:41:31', '2021-10-16 08:41:31', '', NULL, '13,28,93,222,527', '', '', ''),
(110, 9, 'mexican sigar roll', NULL, 'Active', '2021-10-16 20:09:25', '2021-10-16 20:09:25', '2021-10-16 20:15:02', '', NULL, '48,86,163,186,187,329,330,331,335,341,368,370,371,232,405,518,520', '', '', ''),
(111, 6, 'thai coriander soup', NULL, 'Active', '2021-10-16 20:26:09', '2021-10-16 20:26:09', '2021-10-16 20:35:24', '', NULL, '50,69,70,145,146,163,208,320,329,330,331,332,333,334,339,368,369,407', '', '', ''),
(112, 5, 'schezwan chutney', NULL, 'Active', '2021-10-16 20:33:16', '2021-10-16 20:33:16', '2021-10-16 20:33:16', '', NULL, '62,65,86,153,319,329,330,331,336,337,380', '', '', ''),
(113, 22, 'rawa menda puri', NULL, 'Active', '2021-10-16 20:37:57', '2021-10-16 20:37:57', '2021-10-16 20:37:57', '', NULL, '47,88,156,164', '', '', ''),
(114, 12, 'gugra tuvar vatana', NULL, 'Active', '2021-10-16 20:41:57', '2021-10-16 20:41:57', '2021-10-16 20:50:31', '', NULL, '17,22,23,47,51,68,73,100,312,318,386,224', '', '', ''),
(115, 12, 'patudi', NULL, 'Active', '2021-10-16 20:49:33', '2021-10-16 20:49:33', '2021-10-16 20:49:33', '', NULL, '54,73,290', '', '', ''),
(116, 2, 'burrito boul', NULL, 'Active', '2021-10-16 21:54:48', '2021-10-16 21:54:48', '2021-10-16 21:54:48', '', NULL, '45,59,69,70,164,176,186,187,213,316,317,319,329,330,331,369,371,540,522', '', '', ''),
(117, 11, 'kachori chaat', NULL, 'Active', '2021-10-16 22:06:13', '2021-10-16 22:06:13', '2021-10-16 22:06:13', '', NULL, '13,39,40,47,48,87,100,101,102,114,161,533,320,352,377,378,224', '', '', ''),
(118, 2, 'grilled station', NULL, 'Active', '2021-10-16 22:12:00', '2021-10-16 22:12:00', '2021-10-16 22:12:00', '', NULL, '70,71,72,86,163,316,317,319,329,330,331,336,337,365,368,369,374,380,520', '', '', ''),
(119, 2, 'quesadilla', NULL, 'Active', '2021-10-16 22:23:52', '2021-10-16 22:23:52', '2021-10-16 22:23:52', '', NULL, '47,70,71,72,114,163,169,186,213,317,319,329,330,331,369,378,518,520', '', '', ''),
(120, 12, 'cheese palak patudi', NULL, 'Active', '2021-10-16 22:40:37', '2021-10-16 22:40:37', '2021-10-16 22:40:37', '', NULL, '73,291', '', '', ''),
(121, 12, 'ringan puri', NULL, 'Active', '2021-10-16 22:44:21', '2021-10-16 22:44:21', '2021-10-16 22:44:21', '', NULL, '19,21,48,309,340', '', '', ''),
(122, 22, 'garlic kulcha', NULL, 'Active', '2021-10-16 22:53:35', '2021-10-16 22:53:35', '2021-10-16 22:53:35', '', NULL, '47,165,195,319,258,522,523', '', '', ''),
(123, 22, 'rumali roti', NULL, 'Active', '2021-10-16 22:53:35', '2021-10-16 22:53:35', '2021-10-16 22:53:35', '', NULL, '47,165,195,258,522,523', '', '', ''),
(124, 3, 'enchilada', NULL, 'Active', '2021-10-17 05:52:08', '2021-10-17 05:52:08', '2021-10-17 06:14:14', '', NULL, '47,62,65,69,70,71,72,76,77,86,149,163,165,171,179,319,329,330,331,335,217,518,519,520,528', '', '', ''),
(125, 4, 'paneer aumrutsari', NULL, 'Active', '2021-10-17 05:57:20', '2021-10-17 05:57:20', '2021-10-17 05:57:20', '', NULL, '75,100,105,106,108,109,110,111,316,317,319,518,520,522,523,528', '', '', ''),
(126, 4, 'veg.nawabi', NULL, 'Active', '2021-10-17 06:01:52', '2021-10-17 06:01:52', '2021-10-17 06:01:52', '', NULL, '312,316,317,319,329,330,331,332,333,334,342,363,369,518,522,523,526,528', '', '', ''),
(127, 12, 'ratalu kand', NULL, 'Active', '2021-10-17 06:04:55', '2021-10-17 06:04:55', '2021-10-17 06:04:55', '', NULL, '164,314,322,405,412', '', '', ''),
(128, 28, 'pani bottel', NULL, 'Active', '2021-10-17 06:07:34', '2021-10-17 06:07:34', '2021-10-17 06:07:34', '', NULL, '537', '', '', ''),
(129, 28, 'pani na kerba', NULL, 'Active', '2021-10-17 06:10:24', '2021-10-17 06:10:24', '2021-10-17 06:10:24', '', NULL, '538', '', '', ''),
(130, 5, 'mukvas', NULL, 'Active', '2021-10-17 06:11:50', '2021-10-17 06:11:50', '2021-10-17 06:11:50', '', NULL, '124', '', '', ''),
(131, 12, 'papdi gathiya', NULL, 'Active', '2021-10-17 06:18:39', '2021-10-17 06:18:39', '2021-10-17 06:18:39', '', NULL, '374,387,220,409,412', '', '', ''),
(132, 5, 'besan chutney', NULL, 'Active', '2021-10-17 06:22:22', '2021-10-17 06:22:22', '2021-10-17 06:22:22', '', NULL, '48,413,525', '', '', ''),
(133, 1, 'salang val ni dal', NULL, 'Active', '2021-10-17 06:26:10', '2021-10-17 06:26:10', '2021-10-17 06:26:10', '', NULL, '22,23,164,319,367', '', '', ''),
(134, 10, 'dal ni vedmi', NULL, 'Active', '2021-10-17 06:28:40', '2021-10-17 06:28:40', '2021-10-17 06:28:40', '', NULL, '13,28,38,47,527', '', '', ''),
(135, 4, 'paneer lasaniya', NULL, 'Active', '2021-10-17 06:34:09', '2021-10-17 06:34:09', '2021-10-17 06:34:09', '', NULL, '75,103,104,108,109,110,111,316,317,319,518,521,523,527,528', '', '', ''),
(136, 12, 'dal na patra', NULL, 'Active', '2021-10-17 06:37:03', '2021-10-17 06:37:03', '2021-10-17 06:37:03', '', NULL, '34,85,100,322', '', '', ''),
(137, 5, 'fruitdish', NULL, 'Active', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '', NULL, '286', '', '', ''),
(138, 5, 'coffeebar', NULL, 'Active', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '', NULL, '287', '', '', ''),
(139, 5, 'icecream bar', NULL, 'Active', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '', NULL, '289', '', '', ''),
(140, 5, 'jumping', NULL, 'Active', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '', NULL, '284', '', '', ''),
(141, 5, 'mocktail bar', NULL, 'Active', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '', NULL, '288', '', '', ''),
(142, 5, 'popcorn', NULL, 'Active', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '', NULL, '282', '', '', ''),
(143, 5, 'suger candi', NULL, 'Active', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '', NULL, '283', '', '', ''),
(144, 5, 'chana chor garam', NULL, 'Active', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '2021-10-17 06:42:03', '', NULL, '281', '', '', ''),
(145, 10, 'badampista krunch', NULL, 'Active', '2021-10-17 06:45:44', '2021-10-17 06:45:44', '2021-10-17 06:45:44', '', NULL, '251', '', '', ''),
(146, 9, 'thai paneer therdd', NULL, 'Active', '2021-10-17 06:50:34', '2021-10-17 06:50:34', '2021-10-17 06:50:34', '', NULL, '520', '', '', ''),
(147, 1, 'ringan bhadthu', NULL, 'Active', '2021-10-17 06:54:38', '2021-10-17 06:54:38', '2021-10-17 06:54:38', '', NULL, '309,316,317,318,319,540', '', '', ''),
(148, 1, 'sev tameta', NULL, 'Active', '2021-10-17 06:54:38', '2021-10-17 06:54:38', '2021-10-17 06:54:38', '', NULL, '316,319,225', '', '', ''),
(149, 1, 'lasaniya bataka', NULL, 'Active', '2021-10-17 06:54:38', '2021-10-17 06:54:38', '2021-10-17 06:54:38', '', NULL, '17,22,23,311,318,319', '', '', ''),
(150, 22, 'tepla', NULL, 'Active', '2021-10-17 06:57:07', '2021-10-17 06:57:07', '2021-10-17 06:57:07', '', NULL, '46,73,319,381,389,522', '', '', ''),
(151, 15, 'kiwi paineapple mocktail', NULL, 'Active', '2021-10-17 13:29:27', '2021-10-17 13:29:27', '2021-10-17 13:29:27', '', NULL, '92,134,136,377,293,406,466', '', '', ''),
(152, 15, 'coconut apple juice', NULL, 'Active', '2021-10-17 13:37:25', '2021-10-17 13:37:25', '2021-10-17 13:37:25', '', NULL, '353,263,264', '', '', ''),
(153, 4, 'paneer resmi', NULL, 'Active', '2021-10-17 13:53:38', '2021-10-17 13:53:38', '2021-10-17 13:53:38', '', NULL, '71,72,100,108,109,110,111,316,317,319,329,330,331,518,521,522,523,528', '', '', ''),
(154, 14, 'chaa-coffee-tea', NULL, 'Active', '2021-10-17 14:02:26', '2021-10-17 14:02:26', '2021-10-17 14:02:26', '', NULL, '13,28,81,165,209,415', '', '', ''),
(155, 10, 'shrikhand', NULL, 'Active', '2021-10-17 14:17:59', '2021-10-17 14:17:59', '2021-10-17 14:29:25', '', NULL, '257', '', '', ''),
(156, 1, 'flower bataka vatana', NULL, 'Active', '2021-10-17 14:28:23', '2021-10-17 14:28:23', '2021-10-17 14:28:23', '', NULL, '41,73,74,311,312,316,318,319,329,363', '', '', ''),
(157, 4, 'dum aloo', NULL, 'Active', '2021-10-17 20:08:12', '2021-10-17 20:08:12', '2021-10-17 20:08:12', '', NULL, '100,106,108,109,110,316,317,319,394,522', '', '', ''),
(158, 6, 'american garden soup', NULL, 'Active', '2021-10-17 20:16:41', '2021-10-17 20:16:41', '2021-10-17 20:16:41', '', NULL, '50,62,64,65,71,72,78,163,171,172,208,211,311,319,329,330,331,332,333,334,335,336,337,339,340,342,368,369,380,540', '', '', ''),
(159, 1, 'tindora bataka', NULL, 'Active', '2021-10-17 21:15:03', '2021-10-17 21:15:03', '2021-10-17 21:15:03', '', NULL, '311,360', '', '', ''),
(160, 4, 'tawa sabji', NULL, 'Active', '2021-10-17 21:19:30', '2021-10-17 21:19:30', '2021-10-17 21:19:30', '', NULL, '75,98,100,101,102,103,104,108,109,110,111,310,311,316,317,319,329,359,361,362,363,372', '', '', ''),
(161, 4, 'paneer mogalai', NULL, 'Active', '2021-10-17 21:25:51', '2021-10-17 21:25:51', '2021-10-17 21:27:54', '', NULL, '47,50,104,105,106,108,109,110,111,152,533,316,317,319,518,521,522,523,526,528', '', '', ''),
(162, 15, 'Orio nuterla milk shek', NULL, 'Active', '2021-10-18 23:37:33', '2021-10-18 23:37:33', '2021-10-18 23:37:33', '', NULL, '541,542,526', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(20) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `functionality` enum('crud','singleview','other','none') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crud',
  `type` enum('Menu','Submenu','Subsubmenu','Navigation','Modules','Pages','Other') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Menu',
  `menu_id` int(11) NOT NULL DEFAULT 0,
  `parent_menu_id` int(11) NOT NULL DEFAULT 0,
  `parent_submenu_id` int(11) NOT NULL DEFAULT 0,
  `menu_position` int(11) NOT NULL,
  `submenu_position` int(11) NOT NULL,
  `display` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1- Show  0-hide in datatablelist only',
  `hiddden` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '1- sidemenu Module hide & direct url worked',
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `title`, `controller`, `action`, `icon`, `functionality`, `type`, `menu_id`, `parent_menu_id`, `parent_submenu_id`, `menu_position`, `submenu_position`, `display`, `hiddden`, `status`, `status_at`, `created_at`, `updated_at`) VALUES
(1, 'Navigation', '', '', '', 'none', 'Navigation', 0, 0, 0, 0, 0, '0', '0', 'Active', NULL, NULL, NULL),
(2, 'Modules', '', '', '', 'none', 'Modules', 0, 0, 0, 0, 0, '0', '0', 'Active', NULL, NULL, NULL),
(3, 'Pages', '', '', '', 'none', 'Pages', 0, 0, 0, 0, 0, '0', '0', 'Active', NULL, NULL, NULL),
(4, 'Other', '', '', '', 'none', 'Other', 0, 0, 0, 0, 0, '0', '0', 'Active', NULL, NULL, NULL),
(5, 'Dashboard', 'site', 'index', 'fas fa-tachometer-alt', 'crud', 'Menu', 1, 0, 0, 1, 0, '0', '0', 'Active', NULL, NULL, NULL),
(6, 'Back Management', '', '', 'fas fa-users-cog', 'other', 'Menu', 4, 0, 0, 5, 0, '1', '0', 'Active', '2021-06-26 10:58:34', '2021-06-26 10:58:34', '2021-06-26 10:58:34'),
(7, 'Modules', 'modules', 'index', 'far fa-circle', 'crud', 'Submenu', 4, 6, 0, 0, 1, '0', '0', 'Active', NULL, NULL, NULL),
(8, 'Permissions', 'permission', 'index', 'far fa-circle', 'crud', 'Submenu', 4, 6, 0, 0, 2, '0', '0', 'Active', NULL, NULL, '2021-06-26 16:11:42'),
(9, 'Roles', 'role', 'index', 'far fa-circle', 'crud', 'Submenu', 4, 6, 0, 0, 3, '0', '0', 'Active', NULL, NULL, '2021-06-26 16:11:35'),
(10, 'Templates', '', '', 'fas fa-envelope-open-text', 'crud', 'Menu', 2, 0, 0, 2, 0, '1', '0', 'Active', NULL, NULL, '2021-07-18 06:25:40'),
(11, 'Email Templates', 'email-templates', 'index', 'far fa-circle', 'crud', 'Submenu', 2, 10, 0, 0, 1, '1', '0', 'Active', NULL, NULL, '2021-07-18 06:25:40'),
(12, 'SMS Templates', 'sms-templates', 'index', 'far fa-circle', 'crud', 'Submenu', 2, 10, 0, 0, 2, '1', '0', 'Inactive', '2021-07-25 11:24:55', NULL, '2021-07-18 06:25:40'),
(13, 'Languages', 'langs', 'index', 'fas fa-language', 'crud', 'Menu', 2, 0, 0, 3, 0, '1', '0', 'Inactive', '2021-07-25 18:29:00', NULL, NULL),
(14, 'Categories', '', '', 'fas fa-th-list', 'crud', 'Menu', 2, 0, 0, 0, 0, '1', '0', 'Active', '2021-07-04 11:14:52', '2021-07-04 11:14:52', '2021-07-25 11:50:19'),
(15, 'Menu Categories', 'categories', 'index', 'far fa-circle', 'crud', 'Submenu', 2, 14, 0, 0, 0, '1', '0', 'Active', '2021-07-04 16:22:23', '2021-07-04 16:22:23', '2021-07-25 11:52:52'),
(16, 'Carousel', 'carousel', 'index', 'fas fa-th-list', 'crud', 'Menu', 2, 0, 0, 0, 0, '1', '0', 'Active', '2021-07-25 21:10:10', '2021-07-25 21:10:10', '2021-07-25 21:10:19'),
(17, 'Settings', 'settings', 'index', 'fas fa-cog', 'crud', 'Menu', 2, 0, 0, 0, 0, '1', '0', 'Active', '2021-07-26 22:02:19', '2021-07-26 22:02:19', '2021-07-26 22:02:19'),
(18, 'Custom Pages', 'custom-pages', 'index', 'fas fa-file', 'crud', 'Menu', 2, 0, 0, 0, 0, '1', '0', 'Active', '2021-07-26 22:03:12', '2021-07-26 22:03:12', '2021-07-26 22:11:11'),
(19, 'Event Categories', 'event-categories', 'index', 'far fa-circle', 'crud', 'Submenu', 2, 14, 0, 0, 3, '1', '0', 'Active', '2021-08-09 22:49:33', '2021-08-09 22:49:33', '2021-08-09 22:49:33'),
(20, 'Manage Menu', '', '', 'fas fa-file', 'crud', 'Menu', 2, 0, 0, 0, 0, '1', '0', 'Active', '2021-08-09 23:14:29', '2021-08-09 23:14:29', '2021-08-09 23:14:29'),
(21, 'Menu', 'menu', 'index', 'far fa-circle', 'crud', 'Submenu', 2, 20, 0, 0, 0, '1', '0', 'Active', '2021-08-09 23:15:08', '2021-08-09 23:15:08', '2021-08-09 23:15:08'),
(22, 'Events', 'events', 'index', 'far fa-circle', 'crud', 'Submenu', 2, 20, 0, 0, 0, '1', '0', 'Active', '2021-08-09 23:15:44', '2021-08-09 23:15:44', '2021-08-09 23:15:44'),
(23, 'Items Categories', 'items-categories', 'index', 'far fa-circle', 'crud', 'Submenu', 2, 14, 0, 0, 2, '1', '0', 'Active', '2021-08-11 21:21:04', '2021-08-11 21:21:04', '2021-08-12 23:07:08'),
(24, 'Items', 'items', 'index', 'far fa-circle', 'crud', 'Submenu', 2, 20, 0, 0, 0, '1', '0', 'Active', '2021-08-12 22:34:55', '2021-08-12 22:34:55', '2021-08-12 22:34:55'),
(25, 'Booking', 'booking', 'index', 'fab fa-first-order', 'crud', 'Menu', 2, 0, 0, 0, 0, '1', '0', 'Active', '2021-09-05 19:45:40', '2021-09-05 19:45:40', '2021-09-05 19:45:40'),
(26, 'Gallery', 'gallery', 'index', 'fas fa-images', 'crud', 'Menu', 2, 0, 0, 0, 0, '1', '0', 'Active', '2021-09-05 21:48:54', '2021-09-05 21:48:54', '2021-09-05 21:48:54'),
(27, 'Review', 'review', 'index', 'fas fa-star', 'crud', 'Menu', 2, 0, 0, 0, 0, '1', '0', 'Active', '2021-09-06 23:31:54', '2021-09-06 23:31:54', '2021-09-06 23:31:54'),
(28, 'Orders', 'orders', 'index', 'fab fa-first-order', 'crud', 'Menu', 2, 0, 0, 0, 0, '1', '0', 'Active', '2021-10-24 12:41:57', '2021-10-24 12:41:57', '2021-10-24 12:41:57');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `mobile` varchar(16) NOT NULL,
  `time_type` enum('Breakfast','Lunch','Dinner') DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `people` int(10) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `phone`, `mobile`, `time_type`, `datetime`, `people`, `message`, `status`, `status_at`, `created_at`, `updated_at`) VALUES
(1, 'test', '', '321-342-4324', '432-432-4324', 'Lunch', '2021-10-05 00:23:00', 500, 'sad sad', 'Active', '2021-10-24 13:05:18', '2021-10-24 13:01:35', '2021-10-24 13:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(20) NOT NULL,
  `type` enum('Backend','Frontend','App') COLLATE utf8_unicode_ci NOT NULL,
  `module_id` int(20) DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `type`, `module_id`, `title`, `name`, `controller`, `action`) VALUES
(1, 'Backend', 7, 'List', 'list', 'modules', 'index'),
(2, 'Backend', 7, 'Create', 'create', 'modules', 'create'),
(3, 'Backend', 7, 'Update', 'update', 'modules', 'update'),
(4, 'Backend', 7, 'View', 'view', 'modules', 'view'),
(5, 'Backend', 7, 'Delete', 'delete', 'modules', 'delete'),
(6, 'Backend', 7, 'Status', 'status', 'modules', 'statusupdate'),
(7, 'Backend', 9, 'List', 'list', 'role', 'index'),
(8, 'Backend', 9, 'Create', 'create', 'role', 'create'),
(9, 'Backend', 9, 'Update', 'update', 'role', 'update'),
(10, 'Backend', 9, 'View', 'view', 'role', 'view'),
(11, 'Backend', 9, 'Delete', 'delete', 'role', 'delete'),
(12, 'Backend', 9, 'Status', 'status', 'role', 'statusupdate'),
(13, 'Backend', 9, 'Access', 'access', 'role', 'access'),
(14, 'Backend', 8, 'List', 'list', 'permission', 'index'),
(15, 'Backend', 8, 'Create', 'create', 'permission', 'create'),
(16, 'Backend', 8, 'Update', 'update', 'permission', 'update'),
(17, 'Backend', 8, 'Delete', 'delete', 'permission', 'delete'),
(18, 'Backend', 7, 'Export', 'export', 'modules', 'export'),
(19, 'Backend', 9, 'Export', 'export', 'role', 'export'),
(20, 'Backend', 8, 'Export', 'export', 'permission', 'export'),
(21, 'Backend', 5, 'List', 'list', 'site', 'index'),
(22, 'Backend', 11, 'List', 'list', 'email-templates', 'index'),
(23, 'Backend', 11, 'Create', 'create', 'email-templates', 'create'),
(24, 'Backend', 11, 'Update', 'update', 'email-templates', 'update'),
(25, 'Backend', 11, 'View', 'view', 'email-templates', 'view'),
(26, 'Backend', 11, 'Delete', 'delete', 'email-templates', 'delete'),
(27, 'Backend', 11, 'Status', 'status', 'email-templates', 'statusupdate'),
(28, 'Backend', 13, 'List', 'list', 'langs', 'index'),
(29, 'Backend', 13, 'Create', 'create', 'langs', 'create'),
(30, 'Backend', 13, 'Update', 'update', 'langs', 'update'),
(31, 'Backend', 13, 'View', 'view', 'langs', 'view'),
(32, 'Backend', 13, 'Delete', 'delete', 'langs', 'delete'),
(33, 'Backend', 15, 'List', 'list', 'categories', 'index'),
(34, 'Backend', 15, 'Create', 'create', 'categories', 'create'),
(35, 'Backend', 15, 'Update', 'update', 'categories', 'update'),
(36, 'Backend', 15, 'View', 'view', 'categories', 'view'),
(37, 'Backend', 15, 'Delete', 'delete', 'categories', 'delete'),
(38, 'Backend', 15, 'Status', 'status', 'categories', 'statusupdate'),
(39, 'Backend', 12, 'List', 'list', 'sms-templates', 'index'),
(40, 'Backend', 12, 'Create', 'create', 'sms-templates', 'create'),
(41, 'Backend', 12, 'Update', 'update', 'sms-templates', 'update'),
(42, 'Backend', 12, 'View', 'view', 'sms-templates', 'view'),
(43, 'Backend', 12, 'Delete', 'delete', 'sms-templates', 'delete'),
(44, 'Backend', 12, 'Status', 'statusupdate', 'sms-templates', 'statusupdate'),
(45, 'Backend', 16, 'List', 'list', 'carousel', 'index'),
(46, 'Backend', 16, 'Create', 'create', 'carousel', 'create'),
(47, 'Backend', 16, 'Update', 'update', 'carousel', 'update'),
(48, 'Backend', 16, 'View', 'view', 'carousel', 'view'),
(49, 'Backend', 16, 'Delete', 'delete', 'carousel', 'delete'),
(50, 'Backend', 16, 'Status', 'status', 'carousel', 'statusupdate'),
(53, 'Backend', 18, 'List', 'list', 'custom-pages', 'index'),
(54, 'Backend', 18, 'Create', 'create', 'custom-pages', 'create'),
(55, 'Backend', 18, 'Update', 'update', 'custom-pages', 'update'),
(56, 'Backend', 18, 'View', 'view', 'custom-pages', 'view'),
(57, 'Backend', 18, 'Delete', 'delete', 'custom-pages', 'delete'),
(58, 'Backend', 18, 'Status', 'status', 'custom-pages', 'statusupdate'),
(59, 'Backend', 17, 'List', 'list', 'settings', 'index'),
(60, 'Backend', 17, 'Create', 'create', 'settings', 'create'),
(61, 'Backend', 17, 'Update', 'update', 'settings', 'update'),
(62, 'Backend', 17, 'View', 'view', 'settings', 'view'),
(63, 'Backend', 17, 'Delete', 'delete', 'settings', 'delete'),
(64, 'Backend', 17, 'Status', 'status', 'settings', 'statusupdate'),
(65, 'Backend', 19, 'List', 'list', 'event-categories', 'index'),
(66, 'Backend', 19, 'Create', 'create', 'event-categories', 'create'),
(67, 'Backend', 19, 'Update', 'update', 'event-categories', 'update'),
(68, 'Backend', 19, 'View', 'view', 'event-categories', 'view'),
(69, 'Backend', 19, 'Delete', 'delete', 'event-categories', 'delete'),
(70, 'Backend', 19, 'Status', 'status', 'event-categories', 'statusupdate'),
(71, 'Backend', 21, 'List', 'list', 'menu', 'index'),
(72, 'Backend', 21, 'Create', 'create', 'menu', 'create'),
(73, 'Backend', 21, 'Update', 'update', 'menu', 'update'),
(74, 'Backend', 21, 'View', 'view', 'menu', 'view'),
(75, 'Backend', 21, 'Delete', 'delete', 'menu', 'delete'),
(76, 'Backend', 21, 'Status', 'status', 'menu', 'statusupdate'),
(77, 'Backend', 22, 'List', 'list', 'events', 'index'),
(78, 'Backend', 22, 'Create', 'create', 'events', 'create'),
(79, 'Backend', 22, 'Update', 'update', 'events', 'update'),
(80, 'Backend', 22, 'View', 'view', 'events', 'view'),
(81, 'Backend', 22, 'Delete', 'delete', 'events', 'delete'),
(82, 'Backend', 22, 'Status', 'status', 'events', 'statusupdate'),
(83, 'Backend', 23, 'List', 'list', 'items-categories', 'index'),
(84, 'Backend', 23, 'Create', 'create', 'items-categories', 'create'),
(85, 'Backend', 23, 'Update', 'update', 'items-categories', 'update'),
(86, 'Backend', 23, 'View', 'view', 'items-categories', 'view'),
(87, 'Backend', 23, 'Delete', 'delete', 'items-categories', 'delete'),
(88, 'Backend', 23, 'Status', 'status', 'items-categories', 'statusupdate'),
(89, 'Backend', 24, 'List', 'list', 'items', 'index'),
(90, 'Backend', 24, 'Create', 'create', 'items', 'create'),
(91, 'Backend', 24, 'Update', 'update', 'items', 'update'),
(92, 'Backend', 24, 'View', 'view', 'items', 'view'),
(93, 'Backend', 24, 'Delete', 'delete', 'items', 'delete'),
(94, 'Backend', 24, 'Status', 'status', 'items', 'statusupdate'),
(95, 'Backend', 25, 'List', 'list', 'booking', 'index'),
(96, 'Backend', 25, 'Create', 'create', 'booking', 'create'),
(97, 'Backend', 25, 'Update', 'update', 'booking', 'update'),
(98, 'Backend', 25, 'View', 'view', 'booking', 'view'),
(99, 'Backend', 25, 'Delete', 'delete', 'booking', 'delete'),
(100, 'Backend', 25, 'Status', 'status', 'booking', 'statusupdate'),
(101, 'Backend', 26, 'List', 'list', 'gallery', 'index'),
(102, 'Backend', 26, 'Create', 'create', 'gallery', 'create'),
(103, 'Backend', 26, 'Update', 'update', 'gallery', 'update'),
(104, 'Backend', 26, 'View', 'view', 'gallery', 'view'),
(105, 'Backend', 26, 'Delete', 'delete', 'gallery', 'delete'),
(106, 'Backend', 26, 'Status', 'status', 'gallery', 'statusupdate'),
(107, 'Backend', 27, 'List', 'list', 'review', 'index'),
(108, 'Backend', 27, 'Create', 'create', 'review', 'create'),
(109, 'Backend', 27, 'Update', 'update', 'review', 'update'),
(110, 'Backend', 27, 'View', 'view', 'review', 'view'),
(111, 'Backend', 27, 'Delete', 'delete', 'review', 'delete'),
(112, 'Backend', 27, 'Status', 'status', 'review', 'statusupdate'),
(113, 'Backend', 28, 'List', 'list', 'orders', 'index'),
(114, 'Backend', 28, 'Create', 'create', 'orders', 'create'),
(115, 'Backend', 28, 'Update', 'update', 'orders', 'update'),
(116, 'Backend', 28, 'View', 'view', 'orders', 'view'),
(117, 'Backend', 28, 'Delete', 'delete', 'orders', 'delete'),
(118, 'Backend', 28, 'Status', 'status', 'orders', 'statusupdate');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `rating` int(5) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `name`, `email`, `subject`, `message`, `rating`, `status`, `status_at`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@gmail.com', 'test', 'test t', 2, 'Active', '2021-09-07 00:25:48', '2021-09-07 00:20:12', '2021-09-07 00:25:25'),
(2, 'test2', 'test2@gmail.com', 'test', 'test', 2, 'Active', '2021-09-07 21:37:30', '2021-09-07 21:37:30', '2021-09-07 21:37:30');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(20) NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `panel` enum('Backend','Frontend') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Backend'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `status`, `status_at`, `created_at`, `updated_at`, `name`, `panel`) VALUES
(1, 'Active', '2020-05-09 12:05:32', '2020-05-09 12:05:32', '2020-05-09 12:05:32', 'Superadmin', 'Backend'),
(2, 'Active', '2020-05-09 12:05:32', '2020-05-09 12:05:32', '2020-05-09 12:05:32', 'Admin', 'Backend'),
(3, 'Active', '2020-05-09 12:05:32', '2020-05-09 12:05:32', '2020-05-09 12:05:32', 'Subadmin', 'Backend'),
(4, 'Active', '2020-05-09 12:05:32', '2020-05-09 12:05:32', '2020-05-09 12:05:32', 'User', 'Frontend');

-- --------------------------------------------------------

--
-- Table structure for table `role_access`
--

CREATE TABLE `role_access` (
  `id` int(20) NOT NULL,
  `role_id` int(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `access` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_access`
--

INSERT INTO `role_access` (`id`, `role_id`, `permission_id`, `access`, `created_at`) VALUES
(1, 1, 1, '1', '2021-10-24 12:42:35'),
(2, 1, 2, '1', '2021-10-24 12:42:35'),
(3, 1, 3, '1', '2021-10-24 12:42:35'),
(4, 1, 4, '1', '2021-10-24 12:42:35'),
(5, 1, 5, '1', '2021-10-24 12:42:35'),
(6, 1, 6, '1', '2021-10-24 12:42:35'),
(7, 1, 7, '1', '2021-10-24 12:42:35'),
(8, 1, 8, '1', '2021-10-24 12:42:35'),
(9, 1, 9, '1', '2021-10-24 12:42:35'),
(10, 1, 10, '1', '2021-10-24 12:42:35'),
(11, 1, 11, '1', '2021-10-24 12:42:35'),
(12, 1, 12, '1', '2021-10-24 12:42:35'),
(13, 1, 13, '1', '2021-10-24 12:42:35'),
(14, 1, 14, '1', '2021-10-24 12:42:35'),
(15, 1, 15, '1', '2021-10-24 12:42:35'),
(16, 1, 16, '1', '2021-10-24 12:42:35'),
(17, 1, 17, '1', '2021-10-24 12:42:35'),
(18, 1, 18, '1', '2021-10-24 12:42:35'),
(19, 1, 19, '1', '2021-10-24 12:42:35'),
(20, 1, 20, '1', '2021-10-24 12:42:35'),
(21, 1, 21, '1', '2021-10-24 12:42:35'),
(22, 1, 23, '1', '2021-10-24 12:42:35'),
(23, 1, 26, '1', '2021-10-24 12:42:35'),
(24, 1, 22, '1', '2021-10-24 12:42:35'),
(25, 1, 27, '1', '2021-10-24 12:42:35'),
(26, 1, 24, '1', '2021-10-24 12:42:35'),
(27, 1, 25, '1', '2021-10-24 12:42:35'),
(28, 1, 29, '1', '2021-10-24 12:42:35'),
(29, 1, 32, '1', '2021-10-24 12:42:35'),
(30, 1, 28, '1', '2021-10-24 12:42:35'),
(31, 1, 30, '1', '2021-10-24 12:42:35'),
(32, 1, 31, '1', '2021-10-24 12:42:35'),
(33, 1, 34, '1', '2021-10-24 12:42:35'),
(34, 1, 37, '1', '2021-10-24 12:42:35'),
(35, 1, 33, '1', '2021-10-24 12:42:35'),
(36, 1, 38, '1', '2021-10-24 12:42:35'),
(37, 1, 35, '1', '2021-10-24 12:42:35'),
(38, 1, 36, '1', '2021-10-24 12:42:35'),
(39, 1, 40, '0', '2021-10-24 12:42:35'),
(40, 1, 43, '0', '2021-10-24 12:42:35'),
(41, 1, 39, '0', '2021-10-24 12:42:35'),
(42, 1, 44, '0', '2021-10-24 12:42:35'),
(43, 1, 41, '0', '2021-10-24 12:42:35'),
(44, 1, 42, '0', '2021-10-24 12:42:35'),
(45, 1, 46, '1', '2021-10-24 12:42:35'),
(46, 1, 49, '1', '2021-10-24 12:42:35'),
(47, 1, 45, '1', '2021-10-24 12:42:35'),
(48, 1, 50, '1', '2021-10-24 12:42:35'),
(49, 1, 47, '1', '2021-10-24 12:42:35'),
(50, 1, 48, '1', '2021-10-24 12:42:35'),
(53, 1, 54, '1', '2021-10-24 12:42:35'),
(54, 1, 53, '1', '2021-10-24 12:42:35'),
(55, 1, 57, '1', '2021-10-24 12:42:35'),
(56, 1, 58, '1', '2021-10-24 12:42:35'),
(57, 1, 55, '1', '2021-10-24 12:42:35'),
(58, 1, 56, '1', '2021-10-24 12:42:35'),
(59, 1, 60, '1', '2021-10-24 12:42:35'),
(60, 1, 63, '1', '2021-10-24 12:42:35'),
(61, 1, 59, '1', '2021-10-24 12:42:35'),
(62, 1, 64, '1', '2021-10-24 12:42:35'),
(63, 1, 61, '1', '2021-10-24 12:42:35'),
(64, 1, 62, '1', '2021-10-24 12:42:35'),
(65, 1, 66, '1', '2021-10-24 12:42:35'),
(66, 1, 69, '1', '2021-10-24 12:42:35'),
(67, 1, 65, '1', '2021-10-24 12:42:35'),
(68, 1, 70, '1', '2021-10-24 12:42:35'),
(69, 1, 67, '1', '2021-10-24 12:42:35'),
(70, 1, 68, '1', '2021-10-24 12:42:35'),
(71, 1, 72, '1', '2021-10-24 12:42:35'),
(72, 1, 75, '1', '2021-10-24 12:42:35'),
(73, 1, 71, '1', '2021-10-24 12:42:35'),
(74, 1, 76, '1', '2021-10-24 12:42:35'),
(75, 1, 73, '1', '2021-10-24 12:42:35'),
(76, 1, 74, '1', '2021-10-24 12:42:35'),
(77, 1, 78, '0', '2021-10-24 12:42:35'),
(78, 1, 81, '0', '2021-10-24 12:42:35'),
(79, 1, 77, '0', '2021-10-24 12:42:35'),
(80, 1, 82, '0', '2021-10-24 12:42:35'),
(81, 1, 79, '0', '2021-10-24 12:42:35'),
(82, 1, 80, '0', '2021-10-24 12:42:35'),
(83, 1, 84, '1', '2021-10-24 12:42:35'),
(84, 1, 87, '1', '2021-10-24 12:42:35'),
(85, 1, 83, '1', '2021-10-24 12:42:35'),
(86, 1, 88, '1', '2021-10-24 12:42:35'),
(87, 1, 85, '1', '2021-10-24 12:42:35'),
(88, 1, 86, '1', '2021-10-24 12:42:35'),
(89, 1, 90, '1', '2021-10-24 12:42:35'),
(90, 1, 93, '1', '2021-10-24 12:42:35'),
(91, 1, 89, '1', '2021-10-24 12:42:35'),
(92, 1, 94, '1', '2021-10-24 12:42:35'),
(93, 1, 91, '1', '2021-10-24 12:42:35'),
(94, 1, 92, '1', '2021-10-24 12:42:35'),
(95, 1, 96, '1', '2021-10-24 12:42:35'),
(96, 1, 99, '1', '2021-10-24 12:42:35'),
(97, 1, 95, '1', '2021-10-24 12:42:35'),
(98, 1, 100, '1', '2021-10-24 12:42:35'),
(99, 1, 97, '1', '2021-10-24 12:42:35'),
(100, 1, 98, '1', '2021-10-24 12:42:35'),
(101, 1, 102, '1', '2021-10-24 12:42:35'),
(102, 1, 105, '1', '2021-10-24 12:42:35'),
(103, 1, 101, '1', '2021-10-24 12:42:35'),
(104, 1, 106, '1', '2021-10-24 12:42:35'),
(105, 1, 103, '0', '2021-10-24 12:42:35'),
(106, 1, 104, '0', '2021-10-24 12:42:35'),
(107, 1, 108, '1', '2021-10-24 12:42:35'),
(108, 1, 111, '1', '2021-10-24 12:42:35'),
(109, 1, 107, '1', '2021-10-24 12:42:35'),
(110, 1, 112, '1', '2021-10-24 12:42:35'),
(111, 1, 109, '1', '2021-10-24 12:42:35'),
(112, 1, 110, '1', '2021-10-24 12:42:35'),
(113, 2, 21, '1', '2021-09-11 22:27:54'),
(114, 2, 2, '0', '2021-09-11 22:27:54'),
(115, 2, 5, '0', '2021-09-11 22:27:54'),
(116, 2, 18, '0', '2021-09-11 22:27:54'),
(117, 2, 1, '0', '2021-09-11 22:27:54'),
(118, 2, 6, '0', '2021-09-11 22:27:54'),
(119, 2, 3, '0', '2021-09-11 22:27:54'),
(120, 2, 4, '0', '2021-09-11 22:27:54'),
(121, 2, 15, '0', '2021-09-11 22:27:54'),
(122, 2, 17, '0', '2021-09-11 22:27:54'),
(123, 2, 20, '0', '2021-09-11 22:27:54'),
(124, 2, 14, '0', '2021-09-11 22:27:54'),
(125, 2, 16, '0', '2021-09-11 22:27:54'),
(126, 2, 13, '0', '2021-09-11 22:27:54'),
(127, 2, 8, '0', '2021-09-11 22:27:54'),
(128, 2, 11, '0', '2021-09-11 22:27:54'),
(129, 2, 19, '0', '2021-09-11 22:27:54'),
(130, 2, 7, '0', '2021-09-11 22:27:54'),
(131, 2, 12, '0', '2021-09-11 22:27:54'),
(132, 2, 9, '0', '2021-09-11 22:27:54'),
(133, 2, 10, '0', '2021-09-11 22:27:54'),
(134, 2, 23, '0', '2021-09-11 22:27:54'),
(135, 2, 26, '0', '2021-09-11 22:27:54'),
(136, 2, 22, '0', '2021-09-11 22:27:54'),
(137, 2, 27, '0', '2021-09-11 22:27:54'),
(138, 2, 24, '0', '2021-09-11 22:27:54'),
(139, 2, 25, '0', '2021-09-11 22:27:54'),
(140, 2, 40, '0', '2021-09-11 22:27:54'),
(141, 2, 43, '0', '2021-09-11 22:27:54'),
(142, 2, 39, '0', '2021-09-11 22:27:54'),
(143, 2, 44, '0', '2021-09-11 22:27:54'),
(144, 2, 41, '0', '2021-09-11 22:27:54'),
(145, 2, 42, '0', '2021-09-11 22:27:54'),
(146, 2, 29, '0', '2021-09-11 22:27:54'),
(147, 2, 32, '0', '2021-09-11 22:27:54'),
(148, 2, 28, '0', '2021-09-11 22:27:54'),
(149, 2, 30, '0', '2021-09-11 22:27:54'),
(150, 2, 31, '0', '2021-09-11 22:27:54'),
(151, 2, 34, '1', '2021-09-11 22:27:54'),
(152, 2, 37, '1', '2021-09-11 22:27:54'),
(153, 2, 33, '1', '2021-09-11 22:27:54'),
(154, 2, 38, '1', '2021-09-11 22:27:54'),
(155, 2, 35, '1', '2021-09-11 22:27:54'),
(156, 2, 36, '1', '2021-09-11 22:27:54'),
(157, 2, 46, '0', '2021-09-11 22:27:54'),
(158, 2, 49, '0', '2021-09-11 22:27:54'),
(159, 2, 45, '0', '2021-09-11 22:27:54'),
(160, 2, 50, '0', '2021-09-11 22:27:54'),
(161, 2, 47, '0', '2021-09-11 22:27:54'),
(162, 2, 48, '0', '2021-09-11 22:27:54'),
(163, 2, 60, '1', '2021-09-11 22:27:54'),
(164, 2, 63, '1', '2021-09-11 22:27:54'),
(165, 2, 59, '1', '2021-09-11 22:27:54'),
(166, 2, 64, '1', '2021-09-11 22:27:54'),
(167, 2, 61, '1', '2021-09-11 22:27:54'),
(168, 2, 62, '1', '2021-09-11 22:27:54'),
(169, 2, 54, '1', '2021-09-11 22:27:54'),
(170, 2, 57, '1', '2021-09-11 22:27:54'),
(171, 2, 53, '1', '2021-09-11 22:27:54'),
(172, 2, 58, '1', '2021-09-11 22:27:54'),
(173, 2, 55, '1', '2021-09-11 22:27:54'),
(174, 2, 56, '1', '2021-09-11 22:27:54'),
(175, 2, 66, '1', '2021-09-11 22:27:54'),
(176, 2, 69, '1', '2021-09-11 22:27:54'),
(177, 2, 65, '1', '2021-09-11 22:27:54'),
(178, 2, 70, '1', '2021-09-11 22:27:54'),
(179, 2, 67, '1', '2021-09-11 22:27:54'),
(180, 2, 68, '1', '2021-09-11 22:27:54'),
(181, 2, 72, '1', '2021-09-11 22:27:54'),
(182, 2, 75, '1', '2021-09-11 22:27:54'),
(183, 2, 71, '1', '2021-09-11 22:27:54'),
(184, 2, 76, '1', '2021-09-11 22:27:54'),
(185, 2, 73, '1', '2021-09-11 22:27:54'),
(186, 2, 74, '1', '2021-09-11 22:27:54'),
(187, 2, 78, '0', '2021-09-11 22:27:54'),
(188, 2, 81, '0', '2021-09-11 22:27:54'),
(189, 2, 77, '0', '2021-09-11 22:27:54'),
(190, 2, 82, '0', '2021-09-11 22:27:54'),
(191, 2, 79, '0', '2021-09-11 22:27:54'),
(192, 2, 80, '0', '2021-09-11 22:27:54'),
(193, 2, 84, '1', '2021-09-11 22:27:54'),
(194, 2, 87, '1', '2021-09-11 22:27:54'),
(195, 2, 83, '1', '2021-09-11 22:27:54'),
(196, 2, 88, '1', '2021-09-11 22:27:54'),
(197, 2, 85, '1', '2021-09-11 22:27:54'),
(198, 2, 86, '1', '2021-09-11 22:27:54'),
(199, 2, 90, '1', '2021-09-11 22:27:54'),
(200, 2, 93, '1', '2021-09-11 22:27:54'),
(201, 2, 89, '1', '2021-09-11 22:27:54'),
(202, 2, 94, '1', '2021-09-11 22:27:54'),
(203, 2, 91, '1', '2021-09-11 22:27:54'),
(204, 2, 92, '1', '2021-09-11 22:27:54'),
(205, 2, 96, '1', '2021-09-11 22:27:54'),
(206, 2, 99, '1', '2021-09-11 22:27:54'),
(207, 2, 95, '1', '2021-09-11 22:27:54'),
(208, 2, 100, '1', '2021-09-11 22:27:54'),
(209, 2, 97, '1', '2021-09-11 22:27:54'),
(210, 2, 98, '1', '2021-09-11 22:27:54'),
(211, 2, 102, '1', '2021-09-11 22:27:54'),
(212, 2, 105, '1', '2021-09-11 22:27:54'),
(213, 2, 101, '1', '2021-09-11 22:27:54'),
(214, 2, 106, '1', '2021-09-11 22:27:54'),
(215, 2, 103, '0', '2021-09-11 22:27:54'),
(216, 2, 104, '1', '2021-09-11 22:27:54'),
(217, 2, 108, '1', '2021-09-11 22:27:54'),
(218, 2, 111, '1', '2021-09-11 22:27:54'),
(219, 2, 107, '1', '2021-09-11 22:27:54'),
(220, 2, 112, '1', '2021-09-11 22:27:54'),
(221, 2, 109, '1', '2021-09-11 22:27:54'),
(222, 2, 110, '1', '2021-09-11 22:27:54'),
(223, 1, 114, '1', '2021-10-24 12:42:35'),
(224, 1, 117, '1', '2021-10-24 12:42:35'),
(225, 1, 113, '1', '2021-10-24 12:42:35'),
(226, 1, 118, '1', '2021-10-24 12:42:35'),
(227, 1, 115, '1', '2021-10-24 12:42:35'),
(228, 1, 116, '1', '2021-10-24 12:42:35');

-- --------------------------------------------------------

--
-- Table structure for table `templatefield`
--

CREATE TABLE `templatefield` (
  `id` int(20) NOT NULL,
  `email_template_id` int(20) NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `is_default` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `templatefield`
--

INSERT INTO `templatefield` (`id`, `email_template_id`, `field`, `description`, `is_default`, `created_at`) VALUES
(1, 1, '{{logo}}', 'Web site logo image required', '1', '2021-05-30 18:38:50'),
(2, 1, '{{site_url}}', 'Web site url example. https://example.com', '1', '2021-05-30 18:38:50'),
(3, 1, '{{site_name}}', 'Web site name required', '1', '2021-05-30 18:38:50'),
(4, 1, '{{site_address}}', 'Web site address or location', '1', '2021-05-30 18:38:50'),
(5, 1, '{{copyright}}', 'copyright text required', '1', '2021-05-30 18:38:50'),
(6, 1, '{{name}}', 'Receive email user name required', '1', '2021-05-30 18:38:50'),
(7, 2, '{{logo}}', 'Web site logo image required', '1', '2021-05-30 18:38:50'),
(8, 2, '{{site_url}}', 'Web site url example. https://example.com', '1', '2021-05-30 18:38:50'),
(9, 2, '{{site_name}}', 'Web site name required', '1', '2021-05-30 18:38:50'),
(10, 2, '{{site_address}}', 'Web site address or location', '1', '2021-05-30 18:38:50'),
(11, 2, '{{copyright}}', 'copyright text required', '1', '2021-05-30 18:38:50'),
(12, 2, '{{name}}', 'Receive email user name required', '1', '2021-05-30 18:38:50'),
(13, 1, '{{action_url}}', 'Web site address or location', '0', '2021-07-17 00:00:00'),
(14, 2, '{{action_url}}', ' Web site address or location\n', '0', '2021-07-18 00:00:00'),
(15, 2, '{{code}}', 'verify email code', '0', '2021-07-18 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email_id` (`email_id`),
  ADD UNIQUE KEY `mobile_number` (`mobile_number`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `religion_id` (`religion_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_items`
--
ALTER TABLE `booking_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_category_id` (`item_category_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `menu_category_id` (`menu_category_id`);

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title_english`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `english` (`english`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `custompages`
--
ALTER TABLE `custompages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_name` (`page_name`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_categories`
--
ALTER TABLE `event_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `english` (`english`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gujarati` (`gujarati`),
  ADD KEY `items_ibfk_1` (`item_category_id`);

--
-- Indexes for table `items_categories`
--
ALTER TABLE `items_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `english` (`english`);

--
-- Indexes for table `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lang_key` (`lang_key`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `english` (`english`),
  ADD KEY `menu_category_id` (`menu_category_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_access`
--
ALTER TABLE `role_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `templatefield`
--
ALTER TABLE `templatefield`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_template_id` (`email_template_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `booking_items`
--
ALTER TABLE `booking_items`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=784;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `custompages`
--
ALTER TABLE `custompages`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_categories`
--
ALTER TABLE `event_categories`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=546;

--
-- AUTO_INCREMENT for table `items_categories`
--
ALTER TABLE `items_categories`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `langs`
--
ALTER TABLE `langs`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_access`
--
ALTER TABLE `role_access`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `templatefield`
--
ALTER TABLE `templatefield`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `booking_items`
--
ALTER TABLE `booking_items`
  ADD CONSTRAINT `booking_items_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_items_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_items_ibfk_4` FOREIGN KEY (`item_category_id`) REFERENCES `items_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_items_ibfk_5` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_items_ibfk_6` FOREIGN KEY (`menu_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`item_category_id`) REFERENCES `items_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`menu_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_access`
--
ALTER TABLE `role_access`
  ADD CONSTRAINT `role_access_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_access_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `templatefield`
--
ALTER TABLE `templatefield`
  ADD CONSTRAINT `templatefield_ibfk_1` FOREIGN KEY (`email_template_id`) REFERENCES `email_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
