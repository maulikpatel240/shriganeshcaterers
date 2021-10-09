-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2021 at 09:10 AM
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
(1, 1, 'Active', NULL, NULL, NULL, '', '', '', '', 'Maulik', 'Patel', 'Bharatbhai', 'maulikpatel240', 'maulikpatel240@gmail.com', '6354800439', '$2y$13$J0MzFM5xfGFV4p2k5e5IMeLayM/SsI7QFItBD5YkmAejySN/UtsRm', '', '', '', '', 'Yes', 'Yes', NULL, NULL, '9624810855', 'Male', NULL, 2, '', '', '', NULL),
(2, 2, 'Active', NULL, NULL, NULL, '', '', '', '', 'dhruvil', 'Upadhyay', '', 'dhruvilup', 'dhruvilup@gmail.com', '9601609006', '$2y$13$J0MzFM5xfGFV4p2k5e5IMeLayM/SsI7QFItBD5YkmAejySN/UtsRm', '', '', '', '', 'Yes', 'Yes', NULL, NULL, '9624810855', 'Male', NULL, 2, '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(20) NOT NULL,
  `booking_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `mobile` varchar(16) NOT NULL,
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

INSERT INTO `booking` (`id`, `booking_id`, `name`, `email`, `phone`, `mobile`, `datetime`, `people`, `message`, `status`, `status_at`, `created_at`, `updated_at`, `menu`, `total_price`, `payment_type`, `partial_price`, `total_pay_price`, `paid_at`) VALUES
(1, 'GC0001', 'maulik', 'patel', '635-480-0439', '', '2021-05-04 02:52:00', 500, 'test', 'Paid', '2021-10-08 00:15:18', '2021-10-08 00:15:18', '2021-10-08 01:00:00', '10,11,12', 7000.00, 'Partial', 0.00, 7000.00, '2021-10-08 01:08:08'),
(2, 'GC0002', 'maulik', 'patel', '635-480-0439', '', '2021-10-08 03:22:00', 500, 'd', 'Paid', '2021-10-08 01:05:03', '2021-10-08 01:05:03', '2021-10-08 01:05:03', '4', 7000.00, 'Full', 0.00, 7000.00, '2021-10-08 01:07:48'),
(3, 'GC0003', 'manharbhai', '', '454-545-4545', '454-545-4545', '2021-10-06 00:01:00', 500, 'test', 'Booked', '2021-10-08 22:36:05', '2021-10-08 22:36:05', '2021-10-08 23:15:15', '1,2,3,9', NULL, '', NULL, NULL, NULL),
(4, 'GC0004', 'manharbhai', '', '454-545-4545', '454-545-4545', '2021-10-13 02:13:00', 500, 'dsad', 'Paid', '2021-10-08 23:17:42', '2021-10-08 23:17:42', '2021-10-08 23:22:54', '2,4,11', 50000.00, 'Full', 0.00, 50000.00, '2021-10-08 23:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `booking_items`
--

CREATE TABLE `booking_items` (
  `id` int(20) NOT NULL,
  `booking_id` int(20) NOT NULL,
  `menu_id` int(20) NOT NULL,
  `category_id` int(20) NOT NULL,
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

INSERT INTO `booking_items` (`id`, `booking_id`, `menu_id`, `category_id`, `item_id`, `item_category_id`, `weight`, `unit`, `INR`, `created_at`, `updated_at`) VALUES
(19, 1, 10, 9, 363, 2, '200', 'Kilogram', '', '2021-10-08 00:57:21', '2021-10-08 00:57:21'),
(20, 1, 10, 9, 311, 2, '12', 'Kilogram', '', '2021-10-08 00:57:21', '2021-10-08 00:57:21'),
(21, 1, 10, 9, 312, 2, '33', 'Litre', '', '2021-10-08 00:57:21', '2021-10-08 00:57:21'),
(22, 1, 10, 9, 329, 2, '', '', '', '2021-10-08 00:57:21', '2021-10-08 00:57:21'),
(23, 1, 10, 9, 316, 2, '', '', '', '2021-10-08 00:57:21', '2021-10-08 00:57:21'),
(24, 1, 10, 9, 424, 6, '', '', '', '2021-10-08 00:57:21', '2021-10-08 00:57:21'),
(25, 1, 10, 9, 426, 6, '', '', '', '2021-10-08 00:57:21', '2021-10-08 00:57:21'),
(26, 1, 10, 9, 429, 6, '', '', '', '2021-10-08 00:57:21', '2021-10-08 00:57:21'),
(27, 1, 10, 9, 451, 6, '', '', '', '2021-10-08 00:57:21', '2021-10-08 00:57:21'),
(28, 1, 10, 9, 452, 6, '', '', '', '2021-10-08 00:57:21', '2021-10-08 00:57:21'),
(35, 1, 11, 9, 114, 1, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(36, 1, 12, 9, 178, 1, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(37, 1, 12, 9, 329, 2, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(38, 1, 12, 9, 364, 2, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(39, 1, 12, 9, 342, 2, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(40, 1, 12, 9, 341, 2, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(41, 1, 12, 9, 62, 1, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(42, 1, 12, 9, 63, 1, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(43, 1, 12, 9, 64, 1, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(44, 1, 12, 9, 65, 1, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(45, 1, 12, 9, 317, 2, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(46, 1, 12, 9, 330, 2, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(47, 1, 12, 9, 331, 2, '', '', '', '2021-10-08 00:59:28', '2021-10-08 00:59:28'),
(48, 3, 1, 9, 38, 1, '', '', '', '2021-10-08 23:15:15', '2021-10-08 23:15:15'),
(49, 3, 1, 9, 13, 1, '', '', '', '2021-10-08 23:15:15', '2021-10-08 23:15:15'),
(50, 3, 1, 9, 47, 1, '', '', '', '2021-10-08 23:15:15', '2021-10-08 23:15:15'),
(51, 3, 1, 9, 527, 3, '', '', '', '2021-10-08 23:15:15', '2021-10-08 23:15:15'),
(52, 3, 1, 9, 28, 1, '', '', '', '2021-10-08 23:15:15', '2021-10-08 23:15:15'),
(53, 3, 1, 9, 106, 1, '', '', '', '2021-10-08 23:15:15', '2021-10-08 23:15:15'),
(54, 3, 2, 9, 43, 1, '', '', '', '2021-10-08 23:15:15', '2021-10-08 23:15:15'),
(55, 3, 2, 9, 33, 1, '', '', '', '2021-10-08 23:15:15', '2021-10-08 23:15:15'),
(56, 3, 2, 9, 13, 1, '', '', '', '2021-10-08 23:15:15', '2021-10-08 23:15:15'),
(57, 3, 2, 9, 39, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(58, 3, 2, 9, 40, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(59, 3, 2, 9, 87, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(60, 3, 2, 9, 522, 3, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(61, 3, 2, 9, 114, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(62, 3, 2, 9, 12, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(63, 3, 2, 9, 2, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(64, 3, 2, 9, 320, 2, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(65, 3, 2, 9, 322, 2, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(66, 3, 2, 9, 377, 2, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(67, 3, 2, 9, 378, 2, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(68, 3, 2, 9, 161, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(69, 3, 2, 9, 411, 4, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(70, 3, 2, 9, 409, 4, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(71, 3, 2, 9, 84, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(72, 3, 2, 9, 164, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(73, 3, 3, 9, 43, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(74, 3, 3, 9, 33, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(75, 3, 3, 9, 13, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(76, 3, 3, 9, 39, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(77, 3, 3, 9, 40, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(78, 3, 3, 9, 87, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(79, 3, 3, 9, 522, 3, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(80, 3, 3, 9, 114, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(81, 3, 3, 9, 12, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(82, 3, 3, 9, 2, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(83, 3, 3, 9, 320, 2, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(84, 3, 3, 9, 322, 2, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(85, 3, 3, 9, 377, 2, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(86, 3, 3, 9, 378, 2, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(87, 3, 3, 9, 161, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(88, 3, 3, 9, 47, 1, '200', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(89, 3, 3, 9, 411, 4, '500', 'Kilogram', '41', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(90, 3, 3, 9, 409, 4, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(91, 3, 3, 9, 55, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(92, 3, 3, 9, 56, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(93, 3, 3, 9, 224, 5, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(94, 3, 3, 9, 352, 2, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(95, 3, 3, 9, 84, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(96, 3, 3, 9, 164, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(97, 3, 3, 9, 412, 4, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(98, 3, 9, 9, 38, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(99, 3, 9, 9, 43, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(100, 3, 9, 9, 33, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(101, 3, 9, 9, 317, 2, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(102, 3, 9, 9, 316, 2, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(103, 3, 9, 9, 100, 1, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(104, 3, 9, 9, 527, 3, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(105, 3, 9, 9, 423, 6, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(106, 3, 9, 9, 425, 6, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(107, 3, 9, 9, 430, 6, '321', 'Gram', '32', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(108, 3, 9, 9, 443, 6, '231', 'Kilogram', '32', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(109, 3, 9, 9, 451, 6, '321', 'Litre', '312', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(110, 3, 9, 9, 448, 6, '', '', '', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(111, 3, 9, 9, 449, 6, '232', 'Gram', '200', '2021-10-08 23:15:16', '2021-10-08 23:15:16'),
(112, 4, 2, 9, 43, 1, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(113, 4, 2, 9, 33, 1, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(114, 4, 2, 9, 13, 1, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(115, 4, 2, 9, 39, 1, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(116, 4, 2, 9, 40, 1, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(117, 4, 2, 9, 87, 1, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(118, 4, 2, 9, 522, 3, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(119, 4, 2, 9, 114, 1, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(120, 4, 2, 9, 12, 1, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(121, 4, 2, 9, 2, 1, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(122, 4, 2, 9, 320, 2, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(123, 4, 2, 9, 322, 2, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(124, 4, 2, 9, 377, 2, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(125, 4, 2, 9, 378, 2, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(126, 4, 2, 9, 161, 1, '', '', '', '2021-10-08 23:17:42', '2021-10-08 23:17:42'),
(127, 4, 2, 9, 411, 4, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(128, 4, 2, 9, 409, 4, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(129, 4, 2, 9, 84, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(130, 4, 2, 9, 164, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(131, 4, 4, 9, 394, 2, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(132, 4, 4, 9, 523, 3, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(133, 4, 4, 9, 528, 3, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(134, 4, 4, 9, 317, 2, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(135, 4, 4, 9, 316, 2, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(136, 4, 4, 9, 108, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(137, 4, 4, 9, 109, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(138, 4, 4, 9, 110, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(139, 4, 4, 9, 111, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(140, 4, 4, 9, 100, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(141, 4, 4, 9, 423, 6, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(142, 4, 4, 9, 425, 6, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(143, 4, 4, 9, 443, 6, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(144, 4, 4, 9, 429, 6, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(145, 4, 4, 9, 451, 6, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(146, 4, 4, 9, 452, 6, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(147, 4, 4, 9, 522, 3, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(148, 4, 4, 9, 75, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(149, 4, 4, 9, 101, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(150, 4, 4, 9, 102, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(151, 4, 4, 9, 103, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(152, 4, 4, 9, 104, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(153, 4, 4, 9, 105, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(154, 4, 4, 9, 106, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43'),
(155, 4, 11, 9, 114, 1, '', '', '', '2021-10-08 23:17:43', '2021-10-08 23:17:43');

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

INSERT INTO `categories` (`id`, `english`, `image`, `status`, `status_at`, `created_at`, `updated_at`, `gujarati`, `hindi`) VALUES
(1, 'Gujarati', 'category_1_1632676272.jpg', 'Active', '2021-07-25 19:00:56', '2021-07-25 12:42:31', '2021-09-26 22:41:12', 'ગુજરાતી', ''),
(2, 'Punjabi', '', 'Active', '2021-07-25 18:42:51', '2021-07-25 12:43:22', '2021-07-25 12:44:03', 'પંજાબી', ''),
(3, 'South indian', '', 'Active', '2021-07-25 18:42:51', '2021-07-25 12:46:11', '2021-07-25 18:26:41', 'દક્ષિણ ભારતીય', ''),
(4, 'Chinese', '', 'Active', '2021-07-25 19:01:50', '2021-07-25 18:45:16', '2021-07-25 18:45:16', 'ચાઇનીઝ', ''),
(5, 'Maxican', 'category_5_1627582946.jpg', 'Active', '2021-07-25 18:46:54', '2021-07-25 18:46:54', '2021-07-29 23:52:26', 'મેક્સીકન', ''),
(6, 'Italian', 'category_6_1627582634.jpeg', 'Active', '2021-07-25 19:01:43', '2021-07-25 18:47:19', '2021-07-29 23:47:36', 'ઇટાલિયન', ''),
(8, 'Salads', 'category_8_1632676166.jpg', 'Active', '2021-09-05 13:37:01', '2021-09-05 13:37:01', '2021-09-26 22:39:26', 'સલાડ', ''),
(9, 'Sweet', NULL, 'Active', '2021-10-07 23:46:50', '2021-10-07 23:46:50', '2021-10-07 23:46:50', 'સ્વીટ', NULL);

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
(9, 'email', 'info@example.com', '', 'Text', 'Active', '2021-09-04 21:24:52', '2021-09-04 21:21:11', '2021-09-04 21:21:11', '', ''),
(10, 'facebook_url', '', '', 'Text', 'Active', '2021-09-04 21:23:53', '2021-09-04 21:23:53', '2021-09-04 21:23:53', '', ''),
(11, 'instagram_url', '', '', 'Text', 'Active', '2021-09-04 21:24:06', '2021-09-04 21:24:06', '2021-09-04 21:24:06', '', ''),
(12, 'twitter_url', '', '', 'Text', 'Active', '2021-09-04 21:24:21', '2021-09-04 21:24:21', '2021-09-04 21:24:21', '', ''),
(13, 'linkin_url', '', '', 'Text', 'Active', '2021-09-04 21:24:44', '2021-09-04 21:24:44', '2021-09-04 21:24:44', '', ''),
(14, 'welcome_video_url', 'https://www.youtube.com/watch?v=GlrxcuEDyF8', '', 'Text', 'Active', '2021-09-04 21:26:18', '2021-09-04 21:26:18', '2021-09-05 10:33:22', '', ''),
(15, 'owner_name', 'jhon smith', '', 'Text', 'Active', '2021-09-05 17:23:37', '2021-09-05 17:23:37', '2021-09-05 17:28:55', '', ''),
(16, 'owner_photo', 'config__1630842838.jpg', '', 'File', 'Active', '2021-09-05 17:23:58', '2021-09-05 17:23:58', '2021-09-05 17:23:58', '', '');

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
(4, 'Wedding parties1', 'page_4_1630841006.jpg', 'Active', '2021-08-09 23:09:14', '2021-08-09 23:09:14', '2021-09-11 22:45:45', 'લગ્ન પક્ષો', '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'લોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે.\r\n\r\n લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું લોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે. લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું પ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે.\r\n\r\n તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથેલોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે. લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું પ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે. તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથેપ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે. તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથે', '');

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
  `english` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gujarati` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(124, 1, 'The mask fell off', 'Active', '2021-10-07 22:56:59', '2021-10-07 22:56:59', '2021-10-07 22:56:59', 'મુખવાસ પડીકી ', ''),
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
(379, 2, 'Pumpkin', 'Active', '2021-10-07 22:57:00', '2021-10-07 22:57:00', '2021-10-07 22:57:00', 'કોળું ', ''),
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
(532, 3, 'Cream', 'Active', '2021-10-07 22:59:20', '2021-10-07 22:57:01', '2021-10-07 22:57:01', 'મલાઈ ', '');

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
(6, 'Kitchenware', 'Active', '2021-09-13 21:05:45', '2021-09-13 21:05:45', '2021-09-13 21:05:45', 'વાસણ', '');

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
(1, 9, 'lapsi', NULL, 'Active', '2021-10-08 00:01:32', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '38,13,47,527,28,106', '', '', ''),
(2, 9, 'moogdal siro', NULL, 'Active', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '43,33,13,39,40,87,522,114,12,2,320,322,377,378,161,411,409,84,164', '', '', ''),
(3, 9, 'akhrot halvo', NULL, 'Active', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '43,33,13,39,40,87,522,114,12,2,320,322,377,378,161,47,411,409,55,56,224,352,84,164,409,412', '', '', ''),
(4, 9, 'badam halvo', NULL, 'Active', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '394,523,528,317,316,108,109,110,111,100,423,425,443,429,451,452,522,75,101,102,103,104,105,106', '', '', ''),
(5, 9, 'dudhpak', NULL, 'Active', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '311,329,73,62,63,64,65,316,317,330,331,336,337,342,409,412', '', '', ''),
(6, 9, 'malpuda', NULL, 'Active', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '528,27,25,22,23,31,51', '', '', ''),
(7, 9, 'anjeer rabdi', NULL, 'Active', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '526,13,27,25,22,28,29', '', '', ''),
(8, 9, 'Angoor rabdi', NULL, 'Active', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '381,318', '', '', ''),
(9, 9, 'dal ni vedmi', NULL, 'Active', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '38,43,33,317,316,100,527,423,425,430,443,451,448,449', '', '', ''),
(10, 9, 'dudhi no halvo', NULL, 'Active', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '363,311,312,329,316,424,426,429,451,452', '', '', ''),
(11, 9, 'dryfruit cream salad', NULL, 'Active', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '114', '', '', ''),
(12, 9, 'dryfruit rabdi', NULL, 'Active', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '2021-10-07 23:58:16', '', '', '178,329,364,342,341,62,63,64,65,317,330,331', '', '', ''),
(13, 9, 'gor na ladu ', NULL, 'Active', '2021-10-07 23:58:17', '2021-10-07 23:58:17', '2021-10-07 23:58:17', '', '', '223,53,216,73,74,54', '', '', '');

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
(27, 'Review', 'review', 'index', 'fas fa-star', 'crud', 'Menu', 2, 0, 0, 0, 0, '1', '0', 'Active', '2021-09-06 23:31:54', '2021-09-06 23:31:54', '2021-09-06 23:31:54');

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
(112, 'Backend', 27, 'Status', 'status', 'review', 'statusupdate');

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
(1, 1, 1, '1', '2021-09-06 23:33:20'),
(2, 1, 2, '1', '2021-09-06 23:33:19'),
(3, 1, 3, '1', '2021-09-06 23:33:20'),
(4, 1, 4, '1', '2021-09-06 23:33:20'),
(5, 1, 5, '1', '2021-09-06 23:33:19'),
(6, 1, 6, '1', '2021-09-06 23:33:20'),
(7, 1, 7, '1', '2021-09-06 23:33:20'),
(8, 1, 8, '1', '2021-09-06 23:33:20'),
(9, 1, 9, '1', '2021-09-06 23:33:20'),
(10, 1, 10, '1', '2021-09-06 23:33:20'),
(11, 1, 11, '1', '2021-09-06 23:33:20'),
(12, 1, 12, '1', '2021-09-06 23:33:20'),
(13, 1, 13, '1', '2021-09-06 23:33:20'),
(14, 1, 14, '1', '2021-09-06 23:33:20'),
(15, 1, 15, '1', '2021-09-06 23:33:20'),
(16, 1, 16, '1', '2021-09-06 23:33:20'),
(17, 1, 17, '1', '2021-09-06 23:33:20'),
(18, 1, 18, '1', '2021-09-06 23:33:20'),
(19, 1, 19, '1', '2021-09-06 23:33:20'),
(20, 1, 20, '1', '2021-09-06 23:33:20'),
(21, 1, 21, '1', '2021-09-06 23:33:19'),
(22, 1, 23, '1', '2021-09-06 23:33:20'),
(23, 1, 26, '1', '2021-09-06 23:33:20'),
(24, 1, 22, '1', '2021-09-06 23:33:20'),
(25, 1, 27, '1', '2021-09-06 23:33:20'),
(26, 1, 24, '1', '2021-09-06 23:33:20'),
(27, 1, 25, '1', '2021-09-06 23:33:20'),
(28, 1, 29, '1', '2021-09-06 23:33:20'),
(29, 1, 32, '1', '2021-09-06 23:33:20'),
(30, 1, 28, '1', '2021-09-06 23:33:20'),
(31, 1, 30, '1', '2021-09-06 23:33:20'),
(32, 1, 31, '1', '2021-09-06 23:33:20'),
(33, 1, 34, '1', '2021-09-06 23:33:20'),
(34, 1, 37, '1', '2021-09-06 23:33:20'),
(35, 1, 33, '1', '2021-09-06 23:33:20'),
(36, 1, 38, '1', '2021-09-06 23:33:20'),
(37, 1, 35, '1', '2021-09-06 23:33:20'),
(38, 1, 36, '1', '2021-09-06 23:33:20'),
(39, 1, 40, '0', '2021-09-06 23:33:20'),
(40, 1, 43, '0', '2021-09-06 23:33:20'),
(41, 1, 39, '0', '2021-09-06 23:33:20'),
(42, 1, 44, '0', '2021-09-06 23:33:20'),
(43, 1, 41, '0', '2021-09-06 23:33:20'),
(44, 1, 42, '0', '2021-09-06 23:33:20'),
(45, 1, 46, '1', '2021-09-06 23:33:20'),
(46, 1, 49, '1', '2021-09-06 23:33:20'),
(47, 1, 45, '1', '2021-09-06 23:33:20'),
(48, 1, 50, '1', '2021-09-06 23:33:20'),
(49, 1, 47, '1', '2021-09-06 23:33:20'),
(50, 1, 48, '1', '2021-09-06 23:33:20'),
(53, 1, 54, '1', '2021-09-06 23:33:20'),
(54, 1, 53, '1', '2021-09-06 23:33:20'),
(55, 1, 57, '1', '2021-09-06 23:33:20'),
(56, 1, 58, '1', '2021-09-06 23:33:20'),
(57, 1, 55, '1', '2021-09-06 23:33:20'),
(58, 1, 56, '1', '2021-09-06 23:33:20'),
(59, 1, 60, '1', '2021-09-06 23:33:20'),
(60, 1, 63, '1', '2021-09-06 23:33:20'),
(61, 1, 59, '1', '2021-09-06 23:33:20'),
(62, 1, 64, '1', '2021-09-06 23:33:20'),
(63, 1, 61, '1', '2021-09-06 23:33:20'),
(64, 1, 62, '1', '2021-09-06 23:33:20'),
(65, 1, 66, '1', '2021-09-06 23:33:20'),
(66, 1, 69, '1', '2021-09-06 23:33:20'),
(67, 1, 65, '1', '2021-09-06 23:33:20'),
(68, 1, 70, '1', '2021-09-06 23:33:20'),
(69, 1, 67, '1', '2021-09-06 23:33:20'),
(70, 1, 68, '1', '2021-09-06 23:33:20'),
(71, 1, 72, '1', '2021-09-06 23:33:20'),
(72, 1, 75, '1', '2021-09-06 23:33:20'),
(73, 1, 71, '1', '2021-09-06 23:33:20'),
(74, 1, 76, '1', '2021-09-06 23:33:20'),
(75, 1, 73, '1', '2021-09-06 23:33:20'),
(76, 1, 74, '1', '2021-09-06 23:33:20'),
(77, 1, 78, '0', '2021-09-06 23:33:20'),
(78, 1, 81, '0', '2021-09-06 23:33:20'),
(79, 1, 77, '0', '2021-09-06 23:33:20'),
(80, 1, 82, '0', '2021-09-06 23:33:20'),
(81, 1, 79, '0', '2021-09-06 23:33:20'),
(82, 1, 80, '0', '2021-09-06 23:33:20'),
(83, 1, 84, '1', '2021-09-06 23:33:20'),
(84, 1, 87, '1', '2021-09-06 23:33:20'),
(85, 1, 83, '1', '2021-09-06 23:33:20'),
(86, 1, 88, '1', '2021-09-06 23:33:20'),
(87, 1, 85, '1', '2021-09-06 23:33:20'),
(88, 1, 86, '1', '2021-09-06 23:33:20'),
(89, 1, 90, '1', '2021-09-06 23:33:20'),
(90, 1, 93, '1', '2021-09-06 23:33:20'),
(91, 1, 89, '1', '2021-09-06 23:33:20'),
(92, 1, 94, '1', '2021-09-06 23:33:20'),
(93, 1, 91, '1', '2021-09-06 23:33:20'),
(94, 1, 92, '1', '2021-09-06 23:33:20'),
(95, 1, 96, '1', '2021-09-06 23:33:20'),
(96, 1, 99, '1', '2021-09-06 23:33:20'),
(97, 1, 95, '1', '2021-09-06 23:33:20'),
(98, 1, 100, '1', '2021-09-06 23:33:20'),
(99, 1, 97, '1', '2021-09-06 23:33:20'),
(100, 1, 98, '1', '2021-09-06 23:33:20'),
(101, 1, 102, '1', '2021-09-06 23:33:20'),
(102, 1, 105, '1', '2021-09-06 23:33:20'),
(103, 1, 101, '1', '2021-09-06 23:33:20'),
(104, 1, 106, '1', '2021-09-06 23:33:20'),
(105, 1, 103, '0', '2021-09-06 23:33:20'),
(106, 1, 104, '0', '2021-09-06 23:33:20'),
(107, 1, 108, '1', '2021-09-06 23:33:20'),
(108, 1, 111, '1', '2021-09-06 23:33:20'),
(109, 1, 107, '1', '2021-09-06 23:33:20'),
(110, 1, 112, '1', '2021-09-06 23:33:20'),
(111, 1, 109, '1', '2021-09-06 23:33:20'),
(112, 1, 110, '1', '2021-09-06 23:33:20'),
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
(215, 2, 103, '1', '2021-09-11 22:27:54'),
(216, 2, 104, '1', '2021-09-11 22:27:54'),
(217, 2, 108, '1', '2021-09-11 22:27:54'),
(218, 2, 111, '1', '2021-09-11 22:27:54'),
(219, 2, 107, '1', '2021-09-11 22:27:54'),
(220, 2, 112, '1', '2021-09-11 22:27:54'),
(221, 2, 109, '1', '2021-09-11 22:27:54'),
(222, 2, 110, '1', '2021-09-11 22:27:54');

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
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_category_id` (`item_category_id`),
  ADD KEY `category_id` (`category_id`);

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `booking_items`
--
ALTER TABLE `booking_items`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `custompages`
--
ALTER TABLE `custompages`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

--
-- AUTO_INCREMENT for table `items_categories`
--
ALTER TABLE `items_categories`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `langs`
--
ALTER TABLE `langs`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

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
  ADD CONSTRAINT `booking_items_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_items_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_items_ibfk_4` FOREIGN KEY (`item_category_id`) REFERENCES `items_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_items_ibfk_5` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
