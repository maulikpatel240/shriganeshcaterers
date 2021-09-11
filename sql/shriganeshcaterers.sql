-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2021 at 07:09 PM
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
(1, 1, 'Active', NULL, NULL, NULL, '', '', '', '', 'Maulik', 'Patel', 'Bharatbhai', 'maulikpatel240', 'maulikpatel240@gmail.com', '6354800439', '$2y$13$J0MzFM5xfGFV4p2k5e5IMeLayM/SsI7QFItBD5YkmAejySN/UtsRm', '', '', '', '', 'Yes', 'Yes', NULL, NULL, '9624810855', 'Male', NULL, 2, '', '', '', NULL);

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
  `datetime` datetime NOT NULL,
  `people` int(10) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Approved','Pending','Partial','Paid') NOT NULL DEFAULT 'Pending',
  `status_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `total_price` float(10,2) NOT NULL,
  `payment_type` enum('','Partial','Full') NOT NULL DEFAULT '',
  `partial_price` float(10,2) NOT NULL,
  `total_pay_price` float(10,2) NOT NULL,
  `paid_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `booking_id`, `name`, `email`, `phone`, `datetime`, `people`, `message`, `status`, `status_at`, `created_at`, `updated_at`, `total_price`, `payment_type`, `partial_price`, `total_pay_price`, `paid_at`) VALUES
(4, 'GC0004', 'maulik', 'maulik@gmail.com', '9624810855', '2021-09-05 02:12:00', 500, 'sdas', 'Approved', '2021-09-07 22:21:26', '2021-09-05 20:57:12', '2021-09-07 22:36:15', 2000.00, 'Full', 0.00, 2000.00, '2021-09-08 00:23:55'),
(5, 'GC0005', 'maulik', 'maulik@gmail.com', '9624810855', '2021-09-07 00:01:00', 500, 'sa', 'Paid', '2021-09-07 22:21:22', '2021-09-05 21:00:25', '2021-09-07 22:36:13', 3000.00, 'Full', 0.00, 3000.00, '2021-09-08 00:27:54');

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
(1, 'Gujarati', '', 'Active', '2021-07-25 19:00:56', '2021-07-25 12:42:31', '2021-07-25 12:43:10', 'ગુજરાતી', ''),
(2, 'Punjabi', '', 'Active', '2021-07-25 18:42:51', '2021-07-25 12:43:22', '2021-07-25 12:44:03', 'પંજાબી', ''),
(3, 'South indian', '', 'Active', '2021-07-25 18:42:51', '2021-07-25 12:46:11', '2021-07-25 18:26:41', 'દક્ષિણ ભારતીય', ''),
(4, 'Chinese', '', 'Active', '2021-07-25 19:01:50', '2021-07-25 18:45:16', '2021-07-25 18:45:16', 'ચાઇનીઝ', ''),
(5, 'Maxican', 'category_5_1627582946.jpg', 'Active', '2021-07-25 18:46:54', '2021-07-25 18:46:54', '2021-07-29 23:52:26', 'મેક્સીકન', ''),
(6, 'Italian', 'category_6_1627582634.jpeg', 'Active', '2021-07-25 19:01:43', '2021-07-25 18:47:19', '2021-07-29 23:47:36', 'ઇટાલિયન', ''),
(8, 'Salads', NULL, 'Active', '2021-09-05 13:37:01', '2021-09-05 13:37:01', '2021-09-05 13:37:01', 'સલાડ', '');

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
(4, 'Wedding parties', 'page_4_1630841006.jpg', 'Active', '2021-08-09 23:09:14', '2021-08-09 23:09:14', '2021-09-05 17:20:44', 'લગ્ન પક્ષો', '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'લોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે.\r\n\r\n લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું લોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે. લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું પ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે.\r\n\r\n તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથેલોરેમ ઇપ્સમ એ છાપકામ અને ટાઇપસેટીંગ ઉદ્યોગનું ખાલી બનાવટી લખાણ છે. લોરેમ ઇપ્સમ 1500 ના દાયકાથી ઉદ્યોગનું પ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે. તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથેપ્રમાણભૂત બનાવટી લખાણ રહ્યું છે, જ્યારે એક અજાણ્યા પ્રિન્ટરે પ્રકારનો ગેલી લીધો અને તેને એક પ્રકારનો નમૂનો પુસ્તક બનાવવા માટે ઘસડ્યો. તે માત્ર પાંચ સદીઓ જ ટકી નથી, પણ ઇલેક્ટ્રોનિક ટાઇપસેટિંગમાં છલાંગ લગાવી, અનિવાર્યપણે યથાવત છે. તે 1960 ના દાયકામાં લોરેમ ઇપ્સમ પેસેજ ધરાવતી લેટ્રાસેટ શીટ્સના પ્રકાશન સાથે લોકપ્રિય બન્યું હતું, અને તાજેતરમાં જ એલ્ડસ પેજમેકર જેવા ડેસ્કટોપ પ્રકાશન સ softwareફ્ટવેર સાથે લોરેમ ઇપ્સમના સંસ્કરણો સાથે', '');

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
(6, 1, 't11', 'Active', '2021-08-31 20:44:11', '2021-08-31 20:43:19', '2021-08-31 20:43:35', 't12', 't13'),
(7, 2, 't1v', 'Active', '2021-08-31 21:46:21', '2021-08-31 21:46:21', '2021-08-31 21:46:21', 't2v', 't3v'),
(8, 2, 't11v', 'Active', '2021-08-31 21:46:21', '2021-08-31 21:46:21', '2021-08-31 21:46:21', 't12v', 't13v');

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
(2, 'Vegetables', 'Active', '2021-08-11 22:16:53', '2021-08-11 22:16:53', '2021-08-11 22:16:53', 'શાકભાજી', ''),
(3, 'Milk Product', 'Active', '2021-08-12 23:10:08', '2021-08-12 22:27:20', '2021-08-16 22:06:05', 'દૂધ ઉત્પાદન', '');

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
(2, 2, 'test', 'menu_2_1630689809.jpg', 'Active', '2021-09-03 23:19:56', '2021-09-03 22:53:29', '2021-09-05 15:12:51', '', '', '7,8', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n    Ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n    Duis aute irure dolor in reprehenderit in voluptate velit.\r\n    Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.', '', ''),
(3, 2, 'vww', 'menu_3_1630691893.jpg', 'Active', '2021-09-03 22:53:29', '2021-09-03 22:53:29', '2021-09-05 15:12:45', '', '', '6,7', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n    Ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n    Duis aute irure dolor in reprehenderit in voluptate velit.\r\n    Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.', '', '');

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
(112, 1, 110, '1', '2021-09-06 23:33:20');

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
  ADD UNIQUE KEY `english` (`english`),
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
  MODIFY `admin_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `items_categories`
--
ALTER TABLE `items_categories`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `langs`
--
ALTER TABLE `langs`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

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
