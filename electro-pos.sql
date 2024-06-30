-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2024 at 11:26 AM
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
-- Database: `electro-pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` bigint(20) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `debit` decimal(12,2) DEFAULT NULL,
  `credit` decimal(12,2) DEFAULT NULL,
  `balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `account_id`, `branch_id`, `reference_id`, `purpose`, `debit`, `credit`, `balance`, `note`, `created_at`, `updated_at`) VALUES
(192, 23, 1, NULL, 'Deposit', NULL, 20000.00, 20000.00, NULL, '2024-06-26 04:02:25', '2024-06-26 04:02:25'),
(193, 24, 1, NULL, 'Deposit', NULL, 2000.00, 2000.00, NULL, '2024-06-26 04:02:52', '2024-06-26 04:02:52'),
(194, 23, 1, 32, 'Purchase', 1500.00, NULL, 18500.00, NULL, '2024-06-25 18:00:00', '2024-06-26 04:11:49'),
(195, 23, 1, 33, 'Purchase', 500.00, NULL, 19500.00, NULL, '2024-06-25 18:00:00', '2024-06-26 04:12:58'),
(196, 23, 1, 34, 'Purchase', 4000.00, NULL, 16000.00, NULL, '2024-06-25 18:00:00', '2024-06-26 04:14:07'),
(197, 23, 1, 35, 'Purchase', 500.00, NULL, 19500.00, NULL, '2024-06-25 18:00:00', '2024-06-26 04:22:10'),
(198, 23, 1, 42, 'Purchase', 3900.00, NULL, 16100.00, NULL, '2024-06-26 04:34:17', '2024-06-26 04:34:17'),
(199, 24, 1, 43, 'Purchase', 500.00, NULL, 1500.00, NULL, '2024-06-26 04:35:26', '2024-06-26 04:35:26'),
(200, 24, 1, 44, 'Purchase', 1400.00, NULL, 100.00, NULL, '2024-06-26 04:36:15', '2024-06-26 04:36:15'),
(201, 23, 1, 45, 'Purchase', 1800.00, NULL, 14300.00, NULL, '2024-06-26 04:39:06', '2024-06-26 04:39:06'),
(202, 23, 1, 46, 'Purchase', 1800.00, NULL, 12500.00, NULL, '2024-06-26 04:47:01', '2024-06-26 04:47:01'),
(203, 23, 1, 153, 'Sale', NULL, 10.00, 12510.00, NULL, '2024-06-26 04:56:54', '2024-06-26 04:56:54'),
(204, 23, 1, 154, 'Sale', NULL, 2300.00, 14810.00, NULL, '2024-06-26 04:57:25', '2024-06-26 04:57:25'),
(205, 23, 1, 155, 'Sale', NULL, 1200.00, 16010.00, NULL, '2024-06-26 05:00:31', '2024-06-26 05:00:31'),
(206, 23, 1, 156, 'Sale', NULL, 2400.00, 18410.00, NULL, '2024-06-26 05:07:08', '2024-06-26 05:07:08'),
(207, 23, 1, 157, 'Sale', NULL, 750.00, 19160.00, NULL, '2024-06-26 05:50:05', '2024-06-26 05:50:05'),
(208, 23, 1, 158, 'Sale', NULL, 300.00, 19460.00, NULL, '2024-06-26 06:56:30', '2024-06-26 06:56:30'),
(209, 23, 1, 159, 'Sale', NULL, 850.00, 20310.00, NULL, '2024-06-26 06:57:17', '2024-06-26 06:57:17'),
(210, 24, 1, 160, 'Sale', NULL, 200.00, 300.00, NULL, '2024-06-26 21:35:46', '2024-06-26 21:35:46'),
(211, 23, 1, 161, 'Sale', NULL, 600.00, 20910.00, NULL, '2024-06-26 21:37:10', '2024-06-26 21:37:10'),
(212, 24, 1, 162, 'Sale', NULL, 600.00, 900.00, NULL, '2024-06-26 21:37:56', '2024-06-26 21:37:56'),
(213, 23, 1, 163, 'Sale', NULL, 1800.00, 22710.00, NULL, '2024-06-26 21:38:53', '2024-06-26 21:38:53'),
(214, 23, 1, 47, 'Purchase', 1900.00, NULL, 20810.00, NULL, '2024-06-26 22:16:11', '2024-06-26 22:16:11'),
(215, 23, 1, 164, 'Sale', NULL, 700.00, 21510.00, NULL, '2024-06-26 22:44:25', '2024-06-26 22:44:25'),
(216, 23, 1, 165, 'Sale', NULL, 100.00, 21610.00, NULL, '2024-06-26 22:45:00', '2024-06-26 22:45:00'),
(217, 23, 1, 166, 'Sale', NULL, 400.00, 22010.00, NULL, '2024-06-26 22:47:12', '2024-06-26 22:47:12'),
(218, 23, 1, 167, 'Sale', NULL, 0.00, 22010.00, NULL, '2024-06-26 23:24:19', '2024-06-26 23:24:19'),
(219, 23, 1, 3, 'Purchase', 1000.00, NULL, 22010.00, NULL, '2024-06-27 04:27:26', '2024-06-27 04:27:26'),
(220, 23, 1, 4, 'Purchase', 2000.00, NULL, 22010.00, NULL, '2024-06-27 04:28:10', '2024-06-27 04:28:10'),
(221, 23, 1, 6, 'Via Purchase', 3000.00, NULL, 19010.00, NULL, '2024-06-27 05:14:08', '2024-06-27 05:14:08'),
(222, 23, 1, 7, 'Via Purchase', NULL, NULL, 19010.00, NULL, '2024-06-27 05:14:55', '2024-06-27 05:14:55'),
(223, 23, 1, 7, 'Via Payment', 3000.00, NULL, 19010.00, NULL, '2024-06-27 05:16:02', '2024-06-27 05:16:02'),
(224, 23, 1, 8, 'Via Purchase', NULL, NULL, 19010.00, NULL, '2024-06-27 05:17:13', '2024-06-27 05:17:13'),
(225, 23, 1, 9, 'Via Purchase', NULL, NULL, 19010.00, NULL, '2024-06-27 05:19:20', '2024-06-27 05:19:20'),
(226, 23, 1, 9, 'Via Payment', 500.00, NULL, 18510.00, NULL, '2024-06-27 05:20:51', '2024-06-27 05:20:51'),
(227, 23, 1, 9, 'Via Payment', 1500.00, NULL, 17010.00, NULL, '2024-06-27 05:21:14', '2024-06-27 05:21:14'),
(228, 24, 1, 10, 'Via Purchase', 30000.00, NULL, -29100.00, NULL, '2024-06-27 05:24:36', '2024-06-27 05:24:36'),
(229, 25, 1, NULL, 'Bank', NULL, 1000.00, 1000.00, NULL, '2024-06-27 05:26:50', '2024-06-27 05:26:50'),
(230, 25, 1, 11, 'Via Purchase', NULL, NULL, 1000.00, NULL, '2024-06-27 05:27:19', '2024-06-27 05:27:19'),
(231, 23, 1, 11, 'Via Payment', 5000.00, NULL, 12010.00, NULL, '2024-06-27 06:00:41', '2024-06-27 06:00:41'),
(232, 23, 1, 12, 'Via Purchase', NULL, NULL, 12010.00, NULL, '2024-06-27 06:01:46', '2024-06-27 06:01:46'),
(233, 23, 1, 12, 'Via Payment', 300.00, NULL, 11710.00, NULL, '2024-06-27 06:02:44', '2024-06-27 06:02:44'),
(234, 23, 1, 168, 'Sale', NULL, 1500.00, 13210.00, NULL, '2024-06-29 22:29:42', '2024-06-29 22:29:42'),
(235, 23, 1, 169, 'Sale', NULL, 0.00, 13210.00, NULL, '2024-06-29 22:31:56', '2024-06-29 22:31:56'),
(236, 23, 1, 170, 'Sale', NULL, 0.00, 13210.00, NULL, '2024-06-29 22:34:30', '2024-06-29 22:34:30'),
(237, 23, 1, 171, 'Sale', NULL, 0.00, 13210.00, NULL, '2024-06-29 22:35:13', '2024-06-29 22:35:13'),
(238, 23, 1, 12, 'Via Payment', 700.00, NULL, 12510.00, NULL, '2024-06-29 22:56:15', '2024-06-29 22:56:15'),
(239, 23, 1, 13, 'Via Purchase', 250.00, NULL, 12260.00, NULL, '2024-06-29 23:43:46', '2024-06-29 23:43:46'),
(240, 23, 1, 14, 'Via Purchase', NULL, NULL, 12260.00, NULL, '2024-06-29 23:50:19', '2024-06-29 23:50:19'),
(241, 23, 1, 14, 'Via Payment', 500.00, NULL, 11760.00, NULL, '2024-06-29 23:51:48', '2024-06-29 23:51:48'),
(242, 23, 1, 172, 'Sale', NULL, 0.00, 11760.00, NULL, '2024-06-30 00:22:05', '2024-06-30 00:22:05'),
(243, 23, 1, 173, 'Sale', NULL, 100.00, 11860.00, NULL, '2024-06-30 00:26:40', '2024-06-30 00:26:40'),
(244, 23, 1, 15, 'Via Purchase', NULL, NULL, 11860.00, NULL, '2024-06-30 00:35:28', '2024-06-30 00:35:28'),
(245, 23, 1, 16, 'Via Purchase', 1000.00, NULL, 10860.00, NULL, '2024-06-30 00:42:12', '2024-06-30 00:42:12'),
(246, 23, 1, 174, 'Sale', NULL, 0.00, 10860.00, NULL, '2024-06-30 00:42:41', '2024-06-30 00:42:41'),
(247, 23, 1, 15, 'Via Payment', 2000.00, NULL, 8860.00, NULL, '2024-06-30 01:00:15', '2024-06-30 01:00:15'),
(248, 23, 1, 17, 'Via Purchase', NULL, NULL, 8860.00, NULL, '2024-06-30 01:02:29', '2024-06-30 01:02:29'),
(249, 23, 1, 18, 'Via Purchase', NULL, NULL, 8860.00, NULL, '2024-06-30 02:43:41', '2024-06-30 02:43:41'),
(250, 23, 1, 19, 'Via Purchase', NULL, NULL, 8860.00, NULL, '2024-06-30 02:44:51', '2024-06-30 02:44:51'),
(251, 23, 1, 20, 'Via Purchase', NULL, NULL, 8860.00, NULL, '2024-06-30 02:45:57', '2024-06-30 02:45:57'),
(252, 23, 1, 175, 'Sale', NULL, 0.00, 8860.00, NULL, '2024-06-30 02:46:01', '2024-06-30 02:46:01'),
(253, 23, 1, 21, 'Via Purchase', NULL, NULL, 8860.00, NULL, '2024-06-30 02:49:10', '2024-06-30 02:49:10'),
(254, 23, 1, 176, 'Sale', NULL, 0.00, 8860.00, NULL, '2024-06-30 02:49:17', '2024-06-30 02:49:17'),
(255, 23, 1, 21, 'Via Payment', 1500.00, NULL, 7360.00, NULL, '2024-06-30 02:50:11', '2024-06-30 02:50:11'),
(256, 23, 1, 20, 'Via Payment', 500.00, NULL, 6860.00, NULL, '2024-06-30 02:52:50', '2024-06-30 02:52:50'),
(257, 23, 1, 177, 'Sale', NULL, 1230.00, 8090.00, NULL, '2024-06-30 02:54:52', '2024-06-30 02:54:52'),
(258, 23, 1, 178, 'Sale', NULL, 1200.00, 9290.00, NULL, '2024-06-30 02:55:45', '2024-06-30 02:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `actual_payments`
--

CREATE TABLE `actual_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` enum('receive','pay') NOT NULL,
  `payment_method` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `date` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `actual_payments`
--

INSERT INTO `actual_payments` (`id`, `branch_id`, `payment_type`, `payment_method`, `customer_id`, `supplier_id`, `amount`, `date`, `note`, `created_at`, `updated_at`) VALUES
(152, 1, 'pay', 21, NULL, 11, 4200.00, '2024-06-26', NULL, '2024-06-26 03:48:51', '2024-06-26 03:48:51'),
(153, 1, 'pay', 21, NULL, 12, 900.00, '2024-06-26', NULL, '2024-06-26 03:52:21', '2024-06-26 03:52:21'),
(154, 1, 'pay', 22, NULL, 12, 5000.00, '2024-06-26', NULL, '2024-06-26 03:53:13', '2024-06-26 03:53:13'),
(155, 1, 'pay', 23, NULL, 13, 1500.00, '2024-06-26', NULL, '2024-06-26 04:04:46', '2024-06-26 04:04:46'),
(156, 1, 'pay', 23, NULL, 13, 1500.00, '2024-06-26', NULL, '2024-06-26 04:04:52', '2024-06-26 04:04:52'),
(157, 1, 'pay', 23, NULL, 13, 1500.00, '2024-06-26', NULL, '2024-06-26 04:04:59', '2024-06-26 04:04:59'),
(158, 1, 'pay', 23, NULL, 13, 1500.00, '2024-06-26', NULL, '2024-06-26 04:08:12', '2024-06-26 04:08:12'),
(159, 1, 'pay', 23, NULL, 13, 1500.00, '2024-06-26', NULL, '2024-06-26 04:11:49', '2024-06-26 04:11:49'),
(160, 1, 'pay', 23, NULL, 14, 500.00, '2024-06-26', NULL, '2024-06-26 04:12:58', '2024-06-26 04:12:58'),
(161, 1, 'pay', 23, NULL, 14, 4000.00, '2024-06-26', NULL, '2024-06-26 04:14:07', '2024-06-26 04:14:07'),
(162, 1, 'pay', 23, NULL, 13, 500.00, '2024-06-26', NULL, '2024-06-26 04:22:10', '2024-06-26 04:22:10'),
(163, 1, 'pay', 23, NULL, 13, 3400.00, '2024-06-26', NULL, '2024-06-26 04:23:30', '2024-06-26 04:23:30'),
(164, 1, 'pay', 23, NULL, 13, 3400.00, '2024-06-26', NULL, '2024-06-26 04:23:48', '2024-06-26 04:23:48'),
(165, 1, 'pay', 23, NULL, 13, 2400.00, '2024-06-26', NULL, '2024-06-26 04:25:07', '2024-06-26 04:25:07'),
(166, 1, 'pay', 23, NULL, 13, 2400.00, '2024-06-26', NULL, '2024-06-26 04:26:10', '2024-06-26 04:26:10'),
(167, 1, 'pay', 23, NULL, 13, 2400.00, '2024-06-26', NULL, '2024-06-26 04:28:04', '2024-06-26 04:28:04'),
(168, 1, 'pay', 23, NULL, 13, 2400.00, '2024-06-26', NULL, '2024-06-26 04:28:58', '2024-06-26 04:28:58'),
(169, 1, 'pay', 23, NULL, 13, 3900.00, '2024-06-26', NULL, '2024-06-26 04:34:17', '2024-06-26 04:34:17'),
(170, 1, 'pay', 24, NULL, 14, 500.00, '2024-06-26', NULL, '2024-06-26 04:35:26', '2024-06-26 04:35:26'),
(171, 1, 'pay', 24, NULL, 14, 1400.00, '2024-06-26', NULL, '2024-06-26 04:36:15', '2024-06-26 04:36:15'),
(172, 1, 'pay', 23, NULL, 14, 1800.00, '2024-06-26', NULL, '2024-06-26 04:39:06', '2024-06-26 04:39:06'),
(173, 1, 'pay', 23, NULL, 13, 1800.00, '2024-06-26', NULL, '2024-06-26 04:47:01', '2024-06-26 04:47:01'),
(174, 1, 'receive', 23, 12, NULL, 500.00, '2024-06-26', NULL, '2024-06-26 04:48:18', '2024-06-26 04:48:18'),
(175, 1, 'receive', 23, 11, NULL, 10.00, '2024-06-26', NULL, '2024-06-26 04:54:10', '2024-06-26 04:54:10'),
(176, 1, 'receive', 23, 11, NULL, 10.00, '2024-06-26', NULL, '2024-06-26 04:55:39', '2024-06-26 04:55:39'),
(177, 1, 'receive', 23, 11, NULL, 10.00, '2024-06-26', NULL, '2024-06-26 04:56:54', '2024-06-26 04:56:54'),
(178, 1, 'receive', 23, 11, NULL, 2300.00, '2024-06-26', NULL, '2024-06-26 04:57:25', '2024-06-26 04:57:25'),
(179, 1, 'receive', 23, 11, NULL, 1200.00, '2024-06-26', NULL, '2024-06-26 05:00:31', '2024-06-26 05:00:31'),
(180, 1, 'receive', 23, 11, NULL, 2400.00, '2024-06-26', NULL, '2024-06-26 05:07:08', '2024-06-26 05:07:08'),
(181, 1, 'receive', 23, 11, NULL, 750.00, '2024-06-26', NULL, '2024-06-26 05:50:05', '2024-06-26 05:50:05'),
(182, 1, 'receive', 23, 11, NULL, 300.00, '2024-06-26', NULL, '2024-06-26 06:56:30', '2024-06-26 06:56:30'),
(183, 1, 'receive', 23, 11, NULL, 850.00, '2024-06-26', NULL, '2024-06-26 06:57:17', '2024-06-26 06:57:17'),
(184, 1, 'receive', 24, 12, NULL, 200.00, '2024-06-27', NULL, '2024-06-26 21:35:46', '2024-06-26 21:35:46'),
(185, 1, 'receive', 23, 11, NULL, 600.00, '2024-06-27', NULL, '2024-06-26 21:37:10', '2024-06-26 21:37:10'),
(186, 1, 'receive', 24, 12, NULL, 600.00, '2024-06-27', NULL, '2024-06-26 21:37:56', '2024-06-26 21:37:56'),
(187, 1, 'receive', 23, 11, NULL, 1800.00, '2024-06-27', NULL, '2024-06-26 21:38:53', '2024-06-26 21:38:53'),
(188, 1, 'pay', 23, NULL, 14, 1900.00, '2024-06-27', NULL, '2024-06-26 22:16:11', '2024-06-26 22:16:11'),
(189, 1, 'receive', 23, 11, NULL, 700.00, '2024-06-27', NULL, '2024-06-26 22:44:25', '2024-06-26 22:44:25'),
(190, 1, 'receive', 23, 12, NULL, 100.00, '2024-06-27', NULL, '2024-06-26 22:45:00', '2024-06-26 22:45:00'),
(191, 1, 'receive', 23, 12, NULL, 400.00, '2024-06-27', NULL, '2024-06-26 22:47:12', '2024-06-26 22:47:12'),
(192, 1, 'receive', 23, 12, NULL, 0.00, '2024-06-27', NULL, '2024-06-26 23:24:18', '2024-06-26 23:24:18'),
(193, 1, 'receive', 23, 11, NULL, 1500.00, '2024-06-30', NULL, '2024-06-29 22:29:42', '2024-06-29 22:29:42'),
(194, 1, 'receive', 23, 11, NULL, 0.00, '2024-06-30', NULL, '2024-06-29 22:31:56', '2024-06-29 22:31:56'),
(195, 1, 'receive', 23, 11, NULL, 0.00, '2024-06-30', NULL, '2024-06-29 22:34:30', '2024-06-29 22:34:30'),
(196, 1, 'receive', 23, 11, NULL, 0.00, '2024-06-30', NULL, '2024-06-29 22:35:13', '2024-06-29 22:35:13'),
(197, 1, 'receive', 23, 11, NULL, 0.00, '2024-06-30', NULL, '2024-06-30 00:22:05', '2024-06-30 00:22:05'),
(198, 1, 'receive', 23, 12, NULL, 100.00, '2024-06-30', NULL, '2024-06-30 00:26:40', '2024-06-30 00:26:40'),
(199, 1, 'receive', 23, 11, NULL, 0.00, '2024-06-30', NULL, '2024-06-30 00:42:41', '2024-06-30 00:42:41'),
(200, 1, 'receive', 23, 11, NULL, 0.00, '2024-06-30', NULL, '2024-06-30 02:46:01', '2024-06-30 02:46:01'),
(201, 1, 'receive', 23, 11, NULL, 0.00, '2024-06-30', NULL, '2024-06-30 02:49:17', '2024-06-30 02:49:17'),
(202, 1, 'receive', 23, 11, NULL, 1230.00, '2024-06-30', NULL, '2024-06-30 02:54:52', '2024-06-30 02:54:52'),
(203, 1, 'receive', 23, 11, NULL, 1200.00, '2024-06-30', NULL, '2024-06-30 02:55:45', '2024-06-30 02:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `branch_name` varchar(150) DEFAULT NULL,
  `manager_name` varchar(150) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `opening_balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `branch_name`, `manager_name`, `phone_number`, `account`, `email`, `opening_balance`, `created_at`, `updated_at`) VALUES
(23, 'cash', NULL, NULL, NULL, NULL, NULL, 20000.00, '2024-06-26 04:02:25', '2024-06-26 04:02:25'),
(24, 'A Bank', 'sd', NULL, NULL, NULL, NULL, 2000.00, '2024-06-26 04:02:52', '2024-06-26 04:02:52'),
(25, 'hello', NULL, NULL, NULL, NULL, NULL, 1000.00, '2024-06-27 05:26:50', '2024-06-27 05:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `manager_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `address`, `phone`, `email`, `logo`, `manager_id`, `created_at`, `updated_at`) VALUES
(1, 'Eclipse Blends and Blossom', 'House 41, Road 6, Block E, Banasree, Rampura, Dhaka, Bangladesh', '0191734426', 'ebb@gmail.com', '1357397012.jpg', NULL, '2024-05-06 03:15:55', '2024-05-19 23:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Local Brand', 'local-brand', NULL, NULL, '2024-05-06 03:40:22', '2024-05-06 03:40:22'),
(2, 'Hatil', 'hatil', NULL, NULL, '2024-05-06 03:40:29', '2024-05-06 03:40:29'),
(3, 'Walton', 'walton', NULL, NULL, '2024-05-06 03:40:37', '2024-05-06 03:40:37'),
(4, 'Samsung', 'samsung', NULL, NULL, '2024-05-06 03:40:44', '2024-05-06 03:40:44'),
(5, 'Apple', 'apple', NULL, NULL, '2024-05-06 03:40:59', '2024-05-06 03:40:59'),
(6, 'Easy', 'easy', NULL, 'Easy Fashion Ltd. | The Most Loved & Top Pioneer Fashion .', '2024-05-27 00:39:49', '2024-05-27 00:39:49'),
(7, 'Via Sell', 'via-sell', NULL, NULL, '2024-06-09 06:08:42', '2024-06-09 06:08:42');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Food', 'food', '477315216.png', 1, '2024-05-06 03:35:55', '2024-06-02 04:38:33'),
(3, 'Electronics', 'electronics', NULL, 1, '2024-05-06 03:36:17', '2024-05-06 03:36:19'),
(4, 'Fashion', 'fashion', NULL, 1, '2024-05-06 03:36:39', '2024-05-06 03:36:41'),
(5, 'Furniture', 'furniture', NULL, 1, '2024-05-06 03:37:55', '2024-06-02 03:19:10'),
(6, 'Sports', 'sports', NULL, 1, '2024-05-27 00:34:51', '2024-05-27 00:34:57'),
(7, 'Sweet Dreams', 'sweet-dreams', '443991656.png', 1, '2024-06-02 03:34:20', '2024-06-02 03:34:33'),
(8, 'Via Sell', 'via-sell', NULL, 1, '2024-06-09 06:00:12', '2024-06-26 02:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `company_balances`
--

CREATE TABLE `company_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deposit` decimal(12,2) NOT NULL,
  `withdraw` decimal(12,2) NOT NULL,
  `current_balance` decimal(12,2) NOT NULL,
  `closing_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `opening_receivable` decimal(12,2) DEFAULT NULL,
  `opening_payable` decimal(12,2) DEFAULT NULL,
  `wallet_balance` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_receivable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_payable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `branch_id`, `name`, `email`, `phone`, `address`, `opening_receivable`, `opening_payable`, `wallet_balance`, `total_receivable`, `total_payable`, `created_at`, `updated_at`) VALUES
(11, 1, 'Jhon Wick', 'ebb@gmail.com', '01723343865', 'Nihil velit distinct', 0.00, 0.00, 0.00, 5790.00, 5790.00, '2024-06-26 03:07:16', '2024-06-30 02:55:45'),
(12, 1, 'Kishor', 'user@gmail.com', '+1 (902) 627-1635', 'Aliquam est nulla ac', 0.00, 0.00, 0.00, 1130.00, 1130.00, '2024-06-26 03:07:30', '2024-06-30 00:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `main_unit_qty` int(11) DEFAULT NULL,
  `sub_unit_qty` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `nid` varchar(20) DEFAULT NULL,
  `pic` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `salary` decimal(12,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `branch_id`, `full_name`, `address`, `phone`, `email`, `nid`, `pic`, `designation`, `salary`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jack paul', 'Bangladesh', '01933496741', 'jalepaul@gmail.oom', '532323', NULL, 'Nihil voluptatibus', 20000.00, '0', '2024-05-19 01:08:22', '2024-05-19 01:08:22'),
(2, 1, 'Jack User', 'Bangladesh', '0193396741', 'user@gmail.oom', '532323', '566940484.jpg', 'Nihil voluptatibus', 20000.00, '0', '2024-05-19 02:23:07', '2024-05-19 02:23:07');

-- --------------------------------------------------------

--
-- Table structure for table `employee_salaries`
--

CREATE TABLE `employee_salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `debit` decimal(12,2) DEFAULT NULL COMMENT 'Submit Salary',
  `creadit` decimal(12,2) DEFAULT NULL COMMENT 'Employee Salary on Employee Salary Table',
  `balance` decimal(12,2) NOT NULL COMMENT 'creadit - debit',
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `expense_date` date NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `spender` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `bank_account_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'New', '2024-05-15 03:20:52', '2024-05-15 03:20:52'),
(2, 'Vara', '2024-05-27 04:19:21', '2024-05-27 04:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_21_060106_create_categories_table', 1),
(6, '2024_03_23_041120_create_sub_categories_table', 1),
(7, '2024_03_24_040653_create_brands_table', 1),
(8, '2024_03_24_041239_create_branches_table', 1),
(9, '2024_03_24_045439_create_customers_table', 1),
(10, '2024_03_25_034000_create_suppliers_table', 1),
(11, '2024_03_27_040311_create_units_table', 1),
(12, '2024_03_27_050102_create_psizes_table', 1),
(13, '2024_03_30_062219_create_banks_table', 1),
(14, '2024_03_30_070215_create_employees_table', 1),
(15, '2024_03_31_035725_create_expense_categories_table', 1),
(16, '2024_03_31_035749_create_expenses_table', 1),
(17, '2024_03_31_075613_create_products_table', 1),
(18, '2024_04_02_043320_create_purchases_table', 1),
(20, '2024_04_02_045010_create_purchase_items_table', 1),
(21, '2024_04_02_051218_create_payment_methods_table', 1),
(22, '2024_04_02_051435_create_actual_payments_table', 1),
(23, '2024_04_02_051856_create_taxes_table', 1),
(25, '2024_04_03_051500_create_transactions_table', 1),
(26, '2024_04_18_084751_create_sales_table', 1),
(27, '2024_04_18_090501_create_sale_items_table', 1),
(28, '2024_04_18_091047_create_pos_settings_table', 1),
(29, '2024_04_18_091250_create_damages_table', 1),
(30, '2024_04_24_063523_create_employee_salaries_table', 1),
(31, '2024_04_30_042330_create_sms_table', 1),
(32, '2024_04_30_043422_create_sms_categories_table', 1),
(33, '2024_04_30_085908_create_jobs_table', 1),
(34, '2024_05_05_094007_create_account_transactions_table', 1),
(35, '2024_04_02_044525_create_promotions_table', 2),
(36, '2024_04_02_062515_create_promotion_details_table', 2),
(37, '2024_05_20_084233_create_permission_tables', 3),
(38, '2024_05_29_044927_create_returns_table', 4),
(39, '2024_05_29_045256_create_return_items_table', 4),
(40, '2024_06_20_063121_create_company_balances_table', 5),
(41, '2024_06_27_045531_create_via_sales_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 14),
(9, 'App\\Models\\User', 19),
(11, 'App\\Models\\User', 20),
(11, 'App\\Models\\User', 23),
(12, 'App\\Models\\User', 21),
(13, 'App\\Models\\User', 24);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(17, 'pos.menu', 'web', 'pos', '2024-05-22 07:07:59', '2024-05-22 07:07:59'),
(18, 'pos-manage.menu', 'web', 'pos-manage', '2024-05-22 07:08:44', '2024-05-22 07:08:44'),
(19, 'pos-manage.invoice', 'web', 'pos-manage', '2024-05-22 07:10:03', '2024-05-22 07:10:03'),
(20, 'pos-manage.edit', 'web', 'pos-manage', '2024-05-22 07:10:12', '2024-05-22 07:10:12'),
(21, 'pos-manage.delete', 'web', 'pos-manage', '2024-05-22 07:10:22', '2024-05-22 07:10:22'),
(22, 'products.menu', 'web', 'products', '2024-05-22 07:12:08', '2024-05-22 07:12:08'),
(23, 'products.list', 'web', 'products', '2024-05-22 07:12:22', '2024-05-22 07:12:22'),
(24, 'products.edit', 'web', 'products', '2024-05-22 07:13:26', '2024-05-22 07:13:26'),
(25, 'products.delete', 'web', 'products', '2024-05-22 07:13:44', '2024-05-22 07:13:44'),
(26, 'category.menu', 'web', 'category', '2024-05-22 07:14:46', '2024-05-22 07:14:46'),
(27, 'category.edit', 'web', 'category', '2024-05-22 07:14:59', '2024-05-22 07:14:59'),
(28, 'category.delete', 'web', 'category', '2024-05-22 07:15:13', '2024-05-22 07:15:13'),
(29, 'subcategory.menu', 'web', 'sub-category', '2024-05-22 07:15:50', '2024-05-22 07:15:50'),
(30, 'subcategory.edit', 'web', 'sub-category', '2024-05-22 07:16:01', '2024-05-22 07:16:01'),
(31, 'subcategory.delete', 'web', 'sub-category', '2024-05-22 07:16:16', '2024-05-22 07:16:16'),
(32, 'brand.menu', 'web', 'brand', '2024-05-22 07:17:06', '2024-05-22 07:17:06'),
(33, 'brand.edit', 'web', 'brand', '2024-05-22 07:17:18', '2024-05-22 07:17:18'),
(34, 'brand.delete', 'web', 'brand', '2024-05-22 07:17:30', '2024-05-22 07:17:30'),
(35, 'unit.menu', 'web', 'unit', '2024-05-22 07:18:02', '2024-05-22 07:18:02'),
(36, 'unit.edit', 'web', 'unit', '2024-05-22 07:18:15', '2024-05-22 07:18:15'),
(37, 'unit.delete', 'web', 'unit', '2024-05-22 07:18:30', '2024-05-22 07:18:30'),
(38, 'products-size.menu', 'web', 'product-size', '2024-05-22 07:19:29', '2024-05-22 07:19:29'),
(39, 'products-size.add', 'web', 'product-size', '2024-05-22 07:19:50', '2024-05-22 07:19:50'),
(40, 'products-size.edit', 'web', 'product-size', '2024-05-22 07:20:04', '2024-05-22 07:20:04'),
(41, 'products-size.delete', 'web', 'product-size', '2024-05-22 07:20:19', '2024-05-22 07:20:19'),
(42, 'tax.menu', 'web', 'taxes', '2024-05-22 07:20:48', '2024-05-22 22:27:51'),
(43, 'tax.edit', 'web', 'taxes', '2024-05-22 07:20:59', '2024-05-22 07:20:59'),
(44, 'tax.delete', 'web', 'taxes', '2024-05-22 07:21:11', '2024-05-22 07:21:11'),
(45, 'products.add', 'web', 'products', '2024-05-22 21:56:58', '2024-05-22 21:56:58'),
(46, 'supplier.menu', 'web', 'supplier', '2024-05-22 22:35:04', '2024-05-22 22:35:04'),
(47, 'supplier.edit', 'web', 'supplier', '2024-05-22 22:35:25', '2024-05-22 22:35:25'),
(48, 'supplier.delete', 'web', 'supplier', '2024-05-22 22:35:46', '2024-05-22 22:35:46'),
(49, 'purchase.menu', 'web', 'purchase', '2024-05-22 22:36:30', '2024-05-22 22:36:30'),
(50, 'purchase.add', 'web', 'purchase', '2024-05-22 22:36:48', '2024-05-22 22:36:48'),
(51, 'purchase.list', 'web', 'purchase', '2024-05-22 22:39:14', '2024-05-22 22:39:14'),
(52, 'purchase.edit', 'web', 'purchase', '2024-05-22 22:39:37', '2024-05-22 22:39:37'),
(53, 'purchase.delete', 'web', 'purchase', '2024-05-22 22:39:54', '2024-05-22 22:39:54'),
(54, 'promotion.menu', 'web', 'promotion', '2024-05-22 22:41:02', '2024-05-22 22:41:02'),
(55, 'promotion.add', 'web', 'promotion', '2024-05-22 22:41:22', '2024-05-22 22:41:22'),
(56, 'promotion.edit', 'web', 'promotion', '2024-05-22 22:42:15', '2024-05-22 22:42:15'),
(57, 'promotion.delete', 'web', 'promotion', '2024-05-22 22:42:36', '2024-05-22 22:42:36'),
(58, 'promotion-details.menu', 'web', 'promotion-details', '2024-05-22 22:43:34', '2024-05-22 22:43:34'),
(59, 'promotion-details.add', 'web', 'promotion-details', '2024-05-22 22:43:52', '2024-05-22 22:43:52'),
(60, 'promotion-details.edit', 'web', 'promotion-details', '2024-05-22 22:44:06', '2024-05-22 22:44:06'),
(61, 'promotion-details.delete', 'web', 'promotion-details', '2024-05-22 22:44:19', '2024-05-22 22:44:19'),
(62, 'damage.menu', 'web', 'damage', '2024-05-22 22:45:15', '2024-05-22 22:45:15'),
(63, 'damage.add', 'web', 'damage', '2024-05-22 22:45:33', '2024-05-22 22:45:33'),
(64, 'damage.edit', 'web', 'damage', '2024-05-22 22:45:51', '2024-05-22 22:45:51'),
(65, 'damage.delete', 'web', 'damage', '2024-05-22 22:46:03', '2024-05-22 22:46:03'),
(66, 'bank.menu', 'web', 'bank', '2024-05-22 22:46:44', '2024-05-22 22:46:44'),
(67, 'bank.edit', 'web', 'bank', '2024-05-22 22:46:59', '2024-05-22 22:46:59'),
(68, 'bank..delete', 'web', 'bank', '2024-05-22 22:47:15', '2024-05-22 22:47:15'),
(69, 'expense.menu', 'web', 'expense', '2024-05-22 22:48:15', '2024-05-22 22:48:15'),
(70, 'expense.edit', 'web', 'expense', '2024-05-22 22:48:45', '2024-05-22 22:48:45'),
(71, 'expense.delete', 'web', 'expense', '2024-05-22 22:49:00', '2024-05-22 22:49:00'),
(72, 'transaction.menu', 'web', 'transaction', '2024-05-22 22:49:43', '2024-05-22 22:49:43'),
(73, 'transaction.history', 'web', 'transaction', '2024-05-22 22:50:36', '2024-05-22 22:50:36'),
(74, 'transaction.delete', 'web', 'transaction', '2024-05-22 22:50:52', '2024-05-22 22:50:52'),
(75, 'customer.menu', 'web', 'customer', '2024-05-22 22:51:36', '2024-05-22 22:51:36'),
(76, 'customer.add', 'web', 'customer', '2024-05-22 22:51:54', '2024-05-22 22:51:54'),
(77, 'customer.edit', 'web', 'customer', '2024-05-22 22:52:13', '2024-05-22 22:52:13'),
(78, 'customer.delete', 'web', 'customer', '2024-05-22 22:52:29', '2024-05-22 22:52:29'),
(79, 'employee.menu', 'web', 'employee', '2024-05-22 22:56:49', '2024-05-22 22:56:49'),
(80, 'employee.add', 'web', 'employee', '2024-05-22 22:57:07', '2024-05-22 22:57:07'),
(81, 'employee.edit', 'web', 'employee', '2024-05-22 22:57:21', '2024-05-22 22:57:21'),
(82, 'employee.delete', 'web', 'employee', '2024-05-22 22:57:38', '2024-05-22 22:57:38'),
(83, 'employee-salary.menu', 'web', 'employee-salary', '2024-05-22 22:59:05', '2024-05-22 22:59:05'),
(84, 'employee-salary.add', 'web', 'employee-salary', '2024-05-22 22:59:34', '2024-05-22 22:59:34'),
(85, 'employee-salary.edit', 'web', 'employee-salary', '2024-05-22 22:59:51', '2024-05-22 22:59:51'),
(86, 'employee-salary.delete', 'web', 'employee-salary', '2024-05-22 23:00:08', '2024-05-22 23:00:08'),
(87, 'advanced-employee-salary.menu', 'web', 'advanced-employee-salary', '2024-05-22 23:01:08', '2024-05-22 23:01:08'),
(88, 'employee-salary.list', 'web', 'employee-salary', '2024-05-23 00:08:22', '2024-05-23 00:08:22'),
(89, 'crm.menu', 'web', 'crm', '2024-05-23 00:12:27', '2024-05-23 00:12:27'),
(90, 'crm.customize-customer', 'web', 'crm', '2024-05-23 00:12:53', '2024-05-23 00:12:53'),
(91, 'crm.email-marketing', 'web', 'crm', '2024-05-23 00:13:11', '2024-05-23 00:13:11'),
(92, 'crm.sms-marketing', 'web', 'crm', '2024-05-23 00:13:32', '2024-05-23 00:13:32'),
(93, 'report.menu', 'web', 'report', '2024-05-23 00:23:59', '2024-05-23 00:23:59'),
(94, 'role-and-permission.menu', 'web', 'role-and-permissions', '2024-05-23 00:25:28', '2024-05-23 00:25:28'),
(95, 'role-and-permission.all-permission', 'web', 'role-and-permissions', '2024-05-23 00:26:16', '2024-05-23 00:26:16'),
(96, 'role-and-permission.all-permission.add', 'web', 'role-and-permissions', '2024-05-23 00:27:09', '2024-05-23 00:27:09'),
(97, 'role-and-permission.all-permission.edit', 'web', 'role-and-permissions', '2024-05-23 00:27:29', '2024-05-23 00:27:29'),
(98, 'role-and-permission.all-permission.delete', 'web', 'role-and-permissions', '2024-05-23 00:27:41', '2024-05-23 00:27:41'),
(99, 'role-and-permission.all-role', 'web', 'role-and-permissions', '2024-05-23 00:34:39', '2024-05-23 00:34:39'),
(100, 'role-and-permission.all-role.add', 'web', 'role-and-permissions', '2024-05-23 00:34:56', '2024-05-23 00:34:56'),
(101, 'role-and-permission.all-role.edit', 'web', 'role-and-permissions', '2024-05-23 00:35:11', '2024-05-23 00:35:11'),
(102, 'role-and-permission.all-role.delete', 'web', 'role-and-permissions', '2024-05-23 00:35:26', '2024-05-23 00:35:26'),
(103, 'role-and-permission.role-in-permission', 'web', 'role-and-permissions', '2024-05-23 00:43:57', '2024-05-23 00:43:57'),
(104, 'role-and-permission-check-role-permission', 'web', 'role-and-permissions', '2024-05-23 00:45:35', '2024-05-23 00:45:35'),
(105, 'role-and-permission-check-role-permission.edit', 'web', 'role-and-permissions', '2024-05-23 00:45:48', '2024-05-23 00:45:48'),
(106, 'role-and-permission-check-role-permission.delete', 'web', 'role-and-permissions', '2024-05-23 00:46:02', '2024-05-23 00:46:02'),
(107, 'admin-manage.menu', 'web', 'admin-manage', '2024-05-23 00:49:29', '2024-05-23 00:49:29'),
(108, 'admin-manage.add', 'web', 'admin-manage', '2024-05-23 00:49:43', '2024-05-23 00:49:43'),
(109, 'admin-manage.edit', 'web', 'admin-manage', '2024-05-23 00:50:05', '2024-05-23 00:50:05'),
(110, 'admin-manage.delete', 'web', 'admin-manage', '2024-05-23 00:50:24', '2024-05-23 00:50:24'),
(111, 'admin-manage.list', 'web', 'admin-manage', '2024-05-23 00:50:50', '2024-05-23 00:50:50'),
(112, 'settings.menu', 'web', 'settings', '2024-05-23 00:59:59', '2024-05-23 00:59:59'),
(113, 'branch.menu', 'web', 'branch', '2024-05-23 01:00:24', '2024-05-23 01:00:24'),
(114, 'branch.add', 'web', 'branch', '2024-05-23 01:00:42', '2024-05-23 01:05:27'),
(115, 'branch.edit', 'web', 'branch', '2024-05-23 01:00:56', '2024-05-23 01:00:56'),
(116, 'branch.delete', 'web', 'branch', '2024-05-23 01:01:09', '2024-05-23 01:01:09');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_settings`
--

CREATE TABLE `pos_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `header_text` varchar(255) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `invoice_type` enum('a4','pos','a5') NOT NULL,
  `invoice_logo_type` enum('Logo','Name','Both') NOT NULL DEFAULT 'Logo',
  `barcode_type` enum('single','a4','a5') NOT NULL,
  `low_stock` int(11) NOT NULL DEFAULT 10,
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `discount` tinyint(1) NOT NULL DEFAULT 0,
  `tax` tinyint(1) NOT NULL DEFAULT 0,
  `barcode` tinyint(1) NOT NULL DEFAULT 0,
  `via_sale` tinyint(1) NOT NULL DEFAULT 0,
  `selling_price_edit` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_settings`
--

INSERT INTO `pos_settings` (`id`, `company`, `logo`, `address`, `email`, `facebook`, `phone`, `header_text`, `footer_text`, `invoice_type`, `invoice_logo_type`, `barcode_type`, `low_stock`, `dark_mode`, `discount`, `tax`, `barcode`, `via_sale`, `selling_price_edit`, `created_at`, `updated_at`) VALUES
(1, 'LED Choice', 'uploads/pos_setting/1688215961.png', 'Banasree,Dhaka,Bangladesh', 'ebbdemo@gmail.com', 'https:/www.ebb.com', NULL, 'Demo Header', 'Demo Footer', 'a4', 'Logo', 'a4', 5, 2, 1, 0, 0, 1, 1, '2024-05-06 03:15:55', '2024-06-25 21:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cost` decimal(8,2) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `details` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `main_unit_stock` int(11) NOT NULL DEFAULT 0,
  `total_sold` int(11) NOT NULL DEFAULT 0,
  `color` varchar(255) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `branch_id`, `barcode`, `category_id`, `subcategory_id`, `brand_id`, `cost`, `price`, `details`, `image`, `stock`, `main_unit_stock`, `total_sold`, `color`, `size_id`, `unit_id`, `created_at`, `updated_at`) VALUES
(1, 'Walton Primo X TV', 1, '123456', 3, 3, 3, 180.00, 300.00, NULL, NULL, 19, 0, 1, '#000000', 7, 2, '2024-05-06 03:48:45', '2024-06-26 06:56:30'),
(2, 'Walton Mobile HD', 1, '123457', 3, 4, 3, 90.00, 120.00, NULL, NULL, 0, 0, 10, '#000000', 6, 2, '2024-05-06 03:56:33', '2024-06-29 22:29:42'),
(3, 'T-shirt', 1, '1234568', 4, 5, 1, 150.00, 250.00, NULL, NULL, 47, 0, 3, '#000000', 1, 2, '2024-05-06 04:03:42', '2024-06-26 21:37:56'),
(4, 'Jeans Pant', 1, '1234569', 4, 6, 1, 350.00, 500.00, NULL, NULL, 20, 0, 0, '#000000', 4, 2, '2024-05-06 04:06:33', '2024-06-26 04:34:17'),
(6, 'Black Coffee', 1, '123465', 2, 1, 1, 90.00, 120.00, NULL, NULL, 18, 0, 2, '#000000', NULL, 2, '2024-05-06 04:26:23', '2024-06-26 22:16:11'),
(7, 'Single Sofa', 1, '879454', 5, 7, 2, 300.00, 500.00, NULL, NULL, 19, 0, 1, '#000000', 1, 2, '2024-05-06 04:28:08', '2024-06-26 22:44:25'),
(8, 'Single Table for single man', 1, '200544', 5, 8, 2, 200.00, 300.00, NULL, NULL, 36, 0, 4, '#000000', 1, 2, '2024-05-06 04:29:04', '2024-06-26 22:47:12'),
(9, 'Fresh Automill Rice', 1, '546413', 2, 2, 1, 50.00, 80.00, NULL, NULL, 0, 0, 20, '#000000', NULL, 1, '2024-05-06 04:30:10', '2024-06-30 02:55:45'),
(10, 'Polo Shirt', 1, '837642', 4, 5, 1, 100.00, 200.00, NULL, '506960915.jpg', 16, 0, 4, '#af4646', 1, 2, '2024-05-19 00:04:39', '2024-06-26 23:24:18'),
(40, 'via sell Product', 1, '879455', 8, 10, 7, 150.00, 250.00, NULL, NULL, 0, 0, 5, NULL, NULL, 6, '2024-06-26 05:00:12', '2024-06-26 05:00:31'),
(41, 'ertert', 1, '879456', 8, 10, 7, 200.00, 300.00, NULL, NULL, 0, 0, 10, NULL, NULL, 6, '2024-06-26 05:06:14', '2024-06-26 21:37:56'),
(42, 'test product', 1, '879457', 8, 10, 7, 200.00, 300.00, NULL, NULL, 10, 0, 0, NULL, NULL, 6, '2024-06-27 00:37:38', '2024-06-27 00:37:38'),
(43, 'test product 2', 1, '879458', 8, 10, 7, 200.00, 300.00, NULL, NULL, 10, 0, 0, NULL, NULL, 6, '2024-06-27 00:38:41', '2024-06-27 00:38:41'),
(44, 'test product 3', 1, '879459', 8, 10, 7, 100.00, 200.00, NULL, NULL, 10, 0, 0, NULL, NULL, 6, '2024-06-27 00:39:34', '2024-06-27 00:39:34'),
(45, 'test product 4', 1, '879460', 8, 10, 7, 50.00, 100.00, NULL, NULL, 10, 0, 0, NULL, NULL, 6, '2024-06-27 00:40:37', '2024-06-27 00:40:37'),
(46, 'test product 5', 1, '879461', 8, 10, 7, 300.00, 500.00, NULL, NULL, 10, 0, 0, NULL, NULL, 6, '2024-06-27 00:41:16', '2024-06-27 00:41:16'),
(47, 'test product 7', 1, '879462', 8, 10, 7, 500.00, 1000.00, NULL, NULL, 10, 0, 0, NULL, NULL, 6, '2024-06-27 00:41:50', '2024-06-27 00:41:50'),
(48, 'Jhon Wick', 1, '879463', 8, 10, 7, 200.00, 300.00, NULL, NULL, 10, 0, 0, NULL, NULL, 6, '2024-06-27 05:14:07', '2024-06-27 05:14:07'),
(49, 'Jhon Wick', 1, '879464', 8, 10, 7, 200.00, 300.00, NULL, NULL, 10, 0, 0, NULL, NULL, 6, '2024-06-27 05:14:54', '2024-06-27 05:14:54'),
(50, 'kishor', 1, '879465', 8, 10, 7, 300.00, 500.00, NULL, NULL, 5, 0, 0, NULL, NULL, 6, '2024-06-27 05:17:13', '2024-06-27 05:17:13'),
(51, 'Jhon Wick', 1, '879466', 8, 10, 7, 200.00, 300.00, NULL, NULL, 4, 0, 1, NULL, NULL, 6, '2024-06-27 05:19:20', '2024-06-30 00:22:05'),
(52, 'Sweet Dreams', 1, '879467', 8, 10, 7, 100.00, 300.00, NULL, NULL, 99, 0, 1, NULL, NULL, 6, '2024-06-27 05:24:36', '2024-06-29 22:29:42'),
(53, 'Jhon Wick', 1, '879468', 8, 10, 7, 500.00, 1000.00, NULL, NULL, 4, 0, 1, NULL, NULL, 6, '2024-06-27 05:27:19', '2024-06-30 00:22:05'),
(54, 'jjksaf', 1, '879469', 8, 10, 7, 10.00, 100.00, NULL, NULL, 9, 0, 1, NULL, NULL, 6, '2024-06-27 06:01:46', '2024-06-30 00:26:40'),
(55, 'qweqe', 1, '879470', 8, 10, 7, 50.00, 100.00, NULL, NULL, 5, 0, 0, NULL, NULL, 6, '2024-06-29 23:43:46', '2024-06-29 23:43:46'),
(56, 'Kishor', 1, '879471', 8, 10, 7, 100.00, 200.00, NULL, NULL, 5, 0, 0, NULL, NULL, 6, '2024-06-29 23:50:19', '2024-06-29 23:50:19'),
(57, 'Kishor', 1, '879472', 8, 10, 7, 200.00, 300.00, NULL, NULL, 10, 0, 0, NULL, NULL, 6, '2024-06-30 00:35:28', '2024-06-30 00:35:28'),
(58, 'Sweet Dreams', 1, '879473', 8, 10, 7, 200.00, 300.00, NULL, NULL, 0, 0, 7, NULL, NULL, 6, '2024-06-30 00:42:12', '2024-06-30 00:42:41'),
(59, 'ewrwe', 1, '879474', 8, 10, 7, 100.00, 100.00, NULL, NULL, 10, 0, 0, NULL, NULL, 6, '2024-06-30 01:02:29', '2024-06-30 01:02:29'),
(60, 'Kishor', 1, '879475', 8, 10, 7, 200.00, 300.00, NULL, NULL, 5, 0, 0, NULL, NULL, 6, '2024-06-30 02:43:41', '2024-06-30 02:43:41'),
(61, 'erwer', 1, '879476', 8, 10, 7, 100.00, 300.00, NULL, NULL, 5, 0, 0, NULL, NULL, 6, '2024-06-30 02:44:51', '2024-06-30 02:44:51'),
(62, 'Jhon Wick', 1, '879477', 8, 10, 7, 100.00, 300.00, NULL, NULL, 0, 0, 5, NULL, NULL, 6, '2024-06-30 02:45:57', '2024-06-30 02:46:01'),
(63, 'sell', 1, '879478', 8, 10, 7, 300.00, 500.00, NULL, NULL, 0, 0, 5, NULL, NULL, 6, '2024-06-30 02:49:10', '2024-06-30 02:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promotion_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount_type` enum('percentage','fixed_amount') NOT NULL,
  `discount_value` int(11) NOT NULL,
  `status` enum('active','expired','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `promotion_name`, `description`, `start_date`, `end_date`, `discount_type`, `discount_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Flat Discount', NULL, '2024-05-01', '2024-06-20', 'fixed_amount', 20, 'active', '2024-05-07 04:25:49', '2024-06-05 03:33:33'),
(2, 'abc', NULL, '2024-05-01', '2024-05-31', 'percentage', 10, 'active', '2024-05-27 04:26:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotion_details`
--

CREATE TABLE `promotion_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promotion_id` bigint(20) UNSIGNED NOT NULL,
  `promotion_type` enum('wholesale','products','customers','branch') NOT NULL,
  `logic` text NOT NULL,
  `additional_conditions` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion_details`
--

INSERT INTO `promotion_details` (`id`, `promotion_id`, `promotion_type`, `logic`, `additional_conditions`, `created_at`, `updated_at`) VALUES
(1, 2, 'products', '3,10', 1, '2024-05-27 04:28:18', '2024-05-27 04:28:18'),
(2, 2, 'wholesale', 'all', NULL, '2024-05-27 04:47:27', '2024-05-27 04:47:27'),
(3, 1, 'products', '1,2,3,4,6,7', NULL, '2024-06-04 03:06:19', '2024-06-04 03:06:19');

-- --------------------------------------------------------

--
-- Table structure for table `psizes`
--

CREATE TABLE `psizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `psizes`
--

INSERT INTO `psizes` (`id`, `category_id`, `size`, `created_at`, `updated_at`) VALUES
(1, 4, 'M', '2024-05-06 03:45:03', '2024-05-06 03:45:03'),
(2, 4, 'S', '2024-05-06 03:45:12', '2024-05-06 03:45:12'),
(3, 4, 'L', '2024-05-06 03:45:21', '2024-05-06 03:45:21'),
(4, 4, 'XL', '2024-05-06 03:45:30', '2024-05-06 03:45:30'),
(5, 4, 'XXL', '2024-05-06 03:45:37', '2024-05-06 03:45:37'),
(6, 3, '12 Inch', '2024-05-06 03:45:51', '2024-05-06 03:45:51'),
(7, 3, '34 inch', '2024-05-06 03:46:01', '2024-05-06 03:46:01'),
(8, 4, 'XL', '2024-05-27 03:51:52', '2024-05-27 03:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `purchse_date` date NOT NULL,
  `total_quantity` decimal(12,2) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `sub_total` decimal(12,2) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `grand_total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `paid` decimal(12,2) NOT NULL DEFAULT 0.00,
  `due` decimal(12,2) NOT NULL DEFAULT 0.00,
  `carrying_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `branch_id`, `supplier_id`, `purchse_date`, `total_quantity`, `total_amount`, `invoice`, `discount_amount`, `sub_total`, `tax`, `grand_total`, `paid`, `due`, `carrying_cost`, `payment_method`, `note`, `document`, `created_at`, `updated_at`) VALUES
(28, 1, 13, '2024-06-26', 10.00, 1500.00, NULL, 0.00, 1500.00, NULL, 1500.00, 1500.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:04:46', '2024-06-26 04:04:46'),
(29, 1, 13, '2024-06-26', 10.00, 1500.00, NULL, 0.00, 1500.00, NULL, 1500.00, 1500.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:04:51', '2024-06-26 04:04:51'),
(30, 1, 13, '2024-06-26', 10.00, 1500.00, NULL, 0.00, 1500.00, NULL, 1500.00, 1500.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:04:59', '2024-06-26 04:04:59'),
(31, 1, 13, '2024-06-26', 10.00, 1500.00, NULL, 0.00, 1500.00, NULL, 1500.00, 1500.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:08:12', '2024-06-26 04:08:12'),
(32, 1, 13, '2024-06-26', 10.00, 1500.00, NULL, 0.00, 1500.00, NULL, 1500.00, 1500.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:11:49', '2024-06-26 04:11:49'),
(33, 1, 14, '2024-06-26', 10.00, 1000.00, NULL, 0.00, 1000.00, NULL, 1000.00, 500.00, 500.00, 0.00, 23, NULL, NULL, '2024-06-26 04:12:58', '2024-06-26 04:12:58'),
(34, 1, 14, '2024-06-26', 10.00, 3500.00, NULL, 0.00, 3500.00, NULL, 4000.00, 4000.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:14:07', '2024-06-26 04:14:07'),
(35, 1, 13, '2024-06-26', 10.00, 900.00, NULL, 0.00, 900.00, NULL, 900.00, 500.00, 400.00, 0.00, 23, NULL, NULL, '2024-06-26 04:22:10', '2024-06-26 04:22:10'),
(36, 1, 13, '2024-06-26', 10.00, 3000.00, NULL, 0.00, 3000.00, NULL, 3400.00, 3400.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:23:30', '2024-06-26 04:23:30'),
(37, 1, 13, '2024-06-26', 10.00, 3000.00, NULL, 0.00, 3000.00, NULL, 3400.00, 3400.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:23:48', '2024-06-26 04:23:48'),
(38, 1, 13, '2024-06-26', 10.00, 2000.00, NULL, 0.00, 2000.00, NULL, 2400.00, 2400.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:25:07', '2024-06-26 04:25:07'),
(39, 1, 13, '2024-06-26', 10.00, 2000.00, NULL, 0.00, 2000.00, NULL, 2400.00, 2400.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:26:10', '2024-06-26 04:26:10'),
(40, 1, 13, '2024-06-26', 10.00, 2000.00, NULL, 0.00, 2000.00, NULL, 2400.00, 2400.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:28:04', '2024-06-26 04:28:04'),
(41, 1, 13, '2024-06-26', 10.00, 2000.00, NULL, 0.00, 2000.00, NULL, 2400.00, 2400.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:28:58', '2024-06-26 04:28:58'),
(42, 1, 13, '2024-06-26', 10.00, 3500.00, NULL, 0.00, 3500.00, NULL, 3900.00, 3900.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:34:17', '2024-06-26 04:34:17'),
(43, 1, 14, '2024-06-26', 20.00, 1000.00, NULL, 0.00, 1000.00, NULL, 1000.00, 500.00, 500.00, 0.00, 24, NULL, NULL, '2024-06-26 04:35:26', '2024-06-26 04:35:26'),
(44, 1, 14, '2024-06-26', 10.00, 900.00, NULL, 0.00, 900.00, NULL, 1400.00, 1400.00, 0.00, 0.00, 24, NULL, NULL, '2024-06-26 04:36:15', '2024-06-26 04:36:15'),
(45, 1, 14, '2024-06-26', 10.00, 1800.00, NULL, 0.00, 1800.00, NULL, 1800.00, 1800.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:39:06', '2024-06-26 04:39:06'),
(46, 1, 13, '2024-06-26', 10.00, 1800.00, NULL, 0.00, 1800.00, NULL, 1800.00, 1800.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 04:47:01', '2024-06-26 04:47:01'),
(47, 1, 14, '2024-06-27', 20.00, 1900.00, NULL, 0.00, 1900.00, NULL, 1900.00, 1900.00, 0.00, 0.00, 23, NULL, NULL, '2024-06-26 22:16:11', '2024-06-26 22:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `purchase_id`, `product_id`, `unit_price`, `quantity`, `total_price`, `created_at`, `updated_at`) VALUES
(58, 28, 3, 150.00, 10, 1500.00, '2024-06-26 04:04:46', '2024-06-26 04:04:46'),
(59, 29, 3, 150.00, 10, 1500.00, '2024-06-26 04:04:51', '2024-06-26 04:04:51'),
(60, 30, 3, 150.00, 10, 1500.00, '2024-06-26 04:04:59', '2024-06-26 04:04:59'),
(61, 31, 3, 150.00, 10, 1500.00, '2024-06-26 04:08:12', '2024-06-26 04:08:12'),
(62, 32, 3, 150.00, 10, 1500.00, '2024-06-26 04:11:49', '2024-06-26 04:11:49'),
(63, 33, 10, 100.00, 10, 1000.00, '2024-06-26 04:12:58', '2024-06-26 04:12:58'),
(64, 34, 4, 350.00, 10, 3500.00, '2024-06-26 04:14:07', '2024-06-26 04:14:07'),
(65, 35, 6, 90.00, 10, 900.00, '2024-06-26 04:22:10', '2024-06-26 04:22:10'),
(66, 36, 7, 300.00, 10, 3000.00, '2024-06-26 04:23:30', '2024-06-26 04:23:30'),
(67, 37, 7, 300.00, 10, 3000.00, '2024-06-26 04:23:48', '2024-06-26 04:23:48'),
(68, 38, 8, 200.00, 10, 2000.00, '2024-06-26 04:25:07', '2024-06-26 04:25:07'),
(69, 39, 8, 200.00, 10, 2000.00, '2024-06-26 04:26:10', '2024-06-26 04:26:10'),
(70, 40, 8, 200.00, 10, 2000.00, '2024-06-26 04:28:04', '2024-06-26 04:28:04'),
(71, 41, 8, 200.00, 10, 2000.00, '2024-06-26 04:28:58', '2024-06-26 04:28:58'),
(72, 42, 4, 350.00, 10, 3500.00, '2024-06-26 04:34:17', '2024-06-26 04:34:17'),
(73, 43, 9, 50.00, 20, 1000.00, '2024-06-26 04:35:26', '2024-06-26 04:35:26'),
(74, 44, 2, 90.00, 10, 900.00, '2024-06-26 04:36:15', '2024-06-26 04:36:15'),
(75, 45, 1, 180.00, 10, 1800.00, '2024-06-26 04:39:06', '2024-06-26 04:39:06'),
(76, 46, 1, 180.00, 10, 1800.00, '2024-06-26 04:47:01', '2024-06-26 04:47:01'),
(77, 47, 10, 100.00, 10, 1000.00, '2024-06-26 22:16:11', '2024-06-26 22:16:11'),
(78, 47, 6, 90.00, 10, 900.00, '2024-06-26 22:16:11', '2024-06-26 22:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `discount_amount` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_items`
--

CREATE TABLE `return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `discount_amount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `return_items`
--

INSERT INTO `return_items` (`id`, `return_id`, `sale_item_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 4, 1, 500, 0, 500, '2024-06-02 22:14:18', '2024-06-02 22:14:18'),
(2, 1, NULL, 1, 1, 30000, 0, 27000, '2024-06-02 22:14:18', '2024-06-02 22:14:18'),
(3, 2, NULL, 4, 1, 500, 0, 500, '2024-06-02 22:29:11', '2024-06-02 22:29:11'),
(4, 2, NULL, 3, 1, 250, 0, 225, '2024-06-02 22:29:11', '2024-06-02 22:29:11'),
(5, 3, NULL, 10, 1, 200, 0, 180, '2024-06-02 22:33:17', '2024-06-02 22:33:17'),
(6, 4, NULL, 12, 2, 1500, 0, 3000, '2024-06-02 22:47:08', '2024-06-02 22:47:08'),
(7, 5, NULL, 1, 2, 30000, 0, 54000, '2024-06-02 22:51:06', '2024-06-02 22:51:06'),
(8, 6, NULL, 1, 2, 30000, 0, 54000, '2024-06-02 22:53:11', '2024-06-02 22:53:11'),
(9, 7, NULL, 1, 3, 30000, 0, 81000, '2024-06-02 23:03:36', '2024-06-02 23:03:36'),
(10, 8, NULL, 4, 1, 500, 0, 500, '2024-06-02 23:04:07', '2024-06-02 23:04:07'),
(11, 8, NULL, 1, 1, 30000, 0, 27000, '2024-06-02 23:04:07', '2024-06-02 23:04:07'),
(12, 0, NULL, 3, 1, 250, 0, 225, '2024-06-03 04:38:26', '2024-06-03 04:38:26'),
(13, 0, NULL, 8, 1, 3000, 0, 3000, '2024-06-03 04:38:28', '2024-06-03 04:38:28'),
(14, 0, NULL, 12, 1, 1500, 0, 1500, '2024-06-03 04:39:05', '2024-06-03 04:39:05'),
(15, 0, NULL, 2, 1, 12000, 0, 12000, '2024-06-03 04:41:37', '2024-06-03 04:41:37'),
(16, 0, NULL, 1, 1, 30000, 0, 27000, '2024-06-03 04:41:41', '2024-06-03 04:41:41'),
(17, 0, NULL, 3, 1, 250, 0, 225, '2024-06-03 05:04:24', '2024-06-03 05:04:24'),
(18, 0, NULL, 36, 10, 100, 0, 1000, '2024-06-12 00:01:24', '2024-06-12 00:01:24'),
(19, 0, NULL, 34, 1, 100, 0, 100, '2024-06-12 02:49:54', '2024-06-12 02:49:54'),
(20, 0, NULL, 20, 1, 100, 0, 100, '2024-06-12 03:08:39', '2024-06-12 03:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2024-05-20 04:09:27', '2024-05-20 04:14:00'),
(9, 'Admin', 'web', '2024-05-22 07:24:25', '2024-05-22 07:24:25'),
(10, 'User', 'web', '2024-05-22 07:24:33', '2024-05-22 07:24:33'),
(11, 'Extra', 'web', '2024-05-22 21:48:22', '2024-05-22 21:48:22'),
(12, 'Employee', 'web', '2024-05-25 22:03:52', '2024-05-25 22:03:52'),
(13, 'Demo', 'web', '2024-05-27 01:42:05', '2024-05-27 01:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(17, 1),
(17, 13),
(18, 1),
(18, 13),
(19, 1),
(19, 13),
(20, 1),
(20, 13),
(21, 1),
(21, 13),
(22, 1),
(22, 11),
(22, 13),
(23, 1),
(23, 11),
(23, 13),
(24, 1),
(24, 13),
(25, 1),
(25, 13),
(26, 1),
(26, 13),
(27, 1),
(27, 13),
(28, 1),
(28, 13),
(29, 1),
(29, 13),
(30, 1),
(30, 13),
(31, 1),
(31, 13),
(32, 1),
(32, 9),
(32, 10),
(32, 13),
(33, 1),
(33, 9),
(33, 10),
(33, 13),
(34, 1),
(34, 9),
(34, 10),
(34, 13),
(35, 1),
(35, 13),
(36, 1),
(36, 13),
(37, 1),
(37, 13),
(38, 1),
(38, 13),
(39, 1),
(39, 13),
(40, 1),
(40, 13),
(41, 1),
(41, 13),
(42, 1),
(42, 13),
(43, 1),
(43, 13),
(44, 1),
(44, 13),
(45, 1),
(45, 13),
(46, 1),
(46, 13),
(47, 1),
(47, 13),
(48, 1),
(48, 13),
(49, 1),
(49, 13),
(50, 1),
(50, 13),
(51, 1),
(51, 13),
(52, 1),
(52, 13),
(53, 1),
(53, 13),
(54, 1),
(54, 13),
(55, 1),
(55, 13),
(56, 1),
(56, 13),
(57, 1),
(57, 13),
(58, 1),
(58, 13),
(59, 1),
(59, 13),
(60, 1),
(60, 13),
(61, 1),
(61, 13),
(62, 1),
(62, 13),
(63, 1),
(63, 13),
(64, 1),
(64, 13),
(65, 1),
(65, 13),
(66, 1),
(66, 13),
(67, 1),
(67, 13),
(68, 1),
(68, 13),
(69, 1),
(69, 13),
(70, 1),
(70, 13),
(71, 1),
(71, 13),
(72, 1),
(72, 13),
(73, 1),
(73, 13),
(74, 1),
(74, 13),
(75, 1),
(75, 13),
(76, 1),
(76, 13),
(77, 1),
(77, 13),
(78, 1),
(78, 13),
(79, 1),
(79, 13),
(80, 1),
(80, 13),
(81, 1),
(81, 13),
(82, 1),
(82, 13),
(83, 1),
(83, 13),
(84, 1),
(84, 13),
(85, 1),
(85, 13),
(86, 1),
(86, 13),
(87, 1),
(87, 13),
(88, 1),
(88, 13),
(89, 1),
(89, 13),
(90, 1),
(90, 13),
(91, 1),
(91, 13),
(92, 1),
(92, 13),
(93, 1),
(93, 13),
(94, 1),
(94, 13),
(95, 1),
(95, 13),
(96, 1),
(96, 13),
(97, 1),
(98, 1),
(99, 1),
(99, 13),
(100, 1),
(100, 13),
(101, 1),
(102, 1),
(103, 1),
(103, 13),
(104, 1),
(104, 13),
(105, 1),
(106, 1),
(107, 1),
(107, 13),
(108, 1),
(108, 13),
(109, 1),
(110, 1),
(111, 1),
(111, 13),
(112, 1),
(112, 13),
(113, 1),
(113, 12),
(113, 13),
(114, 1),
(114, 12),
(114, 13),
(115, 1),
(115, 12),
(115, 13),
(116, 1),
(116, 12),
(116, 13);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` date DEFAULT NULL,
  `sale_by` int(11) DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `order_type` enum('general','online') NOT NULL DEFAULT 'general',
  `delivery_charge` decimal(8,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `discount` varchar(255) DEFAULT NULL,
  `change_amount` decimal(12,2) DEFAULT NULL,
  `actual_discount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tax` int(11) DEFAULT NULL,
  `receivable` decimal(12,2) DEFAULT NULL,
  `paid` decimal(12,2) NOT NULL DEFAULT 0.00,
  `returned` decimal(12,2) NOT NULL DEFAULT 0.00,
  `final_receivable` decimal(12,2) NOT NULL DEFAULT 0.00,
  `due` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_purchase_cost` decimal(12,2) DEFAULT NULL,
  `profit` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `branch_id`, `customer_id`, `sale_date`, `sale_by`, `invoice_number`, `order_type`, `delivery_charge`, `quantity`, `total`, `discount`, `change_amount`, `actual_discount`, `tax`, `receivable`, `paid`, `returned`, `final_receivable`, `due`, `total_purchase_cost`, `profit`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(150, 1, 12, '2024-06-26', 1, '108691', 'general', NULL, 3, 500.00, NULL, 500.00, 0.00, NULL, 500.00, 500.00, 0.00, 500.00, 0.00, NULL, 160.00, 23, NULL, '2024-06-26 04:48:18', '2024-06-26 04:48:18'),
(151, 1, 11, '2024-06-26', 1, '117823', 'general', NULL, 1, 70.00, NULL, 70.00, 0.00, NULL, 2070.00, 10.00, 0.00, 2070.00, 2060.00, NULL, 20.00, 23, NULL, '2024-06-26 04:54:10', '2024-06-26 04:54:10'),
(152, 1, 11, '2024-06-26', 1, '119694', 'general', NULL, 1, 70.00, NULL, 70.00, 0.00, NULL, 2070.00, 10.00, 0.00, 2070.00, 2060.00, NULL, 20.00, 23, NULL, '2024-06-26 04:55:39', '2024-06-26 04:55:39'),
(153, 1, 11, '2024-06-26', 1, '103152', 'general', NULL, 1, 70.00, NULL, 70.00, 0.00, NULL, 2070.00, 10.00, 0.00, 2070.00, 2060.00, NULL, 20.00, 23, NULL, '2024-06-26 04:56:54', '2024-06-26 04:56:54'),
(154, 1, 11, '2024-06-26', 1, '118192', 'general', NULL, 1, 120.00, NULL, 120.00, 0.00, NULL, 2300.00, 2300.00, 0.00, 2300.00, 0.00, NULL, 30.00, 23, NULL, '2024-06-26 04:57:25', '2024-06-26 04:57:25'),
(155, 1, 11, '2024-06-26', 1, '103488', 'general', NULL, 0, 1200.00, NULL, 1200.00, 0.00, NULL, 1200.00, 1200.00, 0.00, 1200.00, 0.00, NULL, 1050.00, 23, NULL, '2024-06-26 05:00:31', '2024-06-26 05:00:31'),
(156, 1, 11, '2024-06-26', 1, '118604', 'general', NULL, 8, 2400.00, NULL, 2400.00, 0.00, NULL, 2400.00, 2400.00, 0.00, 2400.00, 0.00, NULL, 2200.00, 23, NULL, '2024-06-26 05:07:08', '2024-06-26 05:07:08'),
(157, 1, 11, '2024-06-26', 1, '118665', 'general', NULL, 3, 750.00, NULL, 750.00, 0.00, NULL, 750.00, 750.00, 0.00, 750.00, 0.00, NULL, 300.00, 23, NULL, '2024-06-26 05:50:05', '2024-06-26 05:50:05'),
(158, 1, 11, '2024-06-26', 1, '116712', 'general', NULL, 3, 670.00, NULL, 600.00, 70.00, NULL, 600.00, 300.00, 0.00, 600.00, 300.00, NULL, 180.00, 23, NULL, '2024-06-26 06:56:30', '2024-06-26 06:56:30'),
(159, 1, 11, '2024-06-26', 1, '117164', 'general', NULL, 2, 550.00, NULL, 550.00, 0.00, NULL, 850.00, 850.00, 0.00, 850.00, 0.00, NULL, 200.00, 23, NULL, '2024-06-26 06:57:17', '2024-06-26 06:57:17'),
(160, 1, 12, '2024-06-27', 24, '109412', 'general', NULL, 1, 200.00, NULL, 200.00, 0.00, NULL, 200.00, 200.00, 0.00, 200.00, 0.00, NULL, 100.00, 24, NULL, '2024-06-26 21:35:46', '2024-06-26 21:35:46'),
(161, 1, 11, '2024-06-27', 24, '105517', 'general', NULL, 3, 630.00, NULL, 600.00, 30.00, NULL, 600.00, 600.00, 0.00, 600.00, 0.00, NULL, 200.00, 23, NULL, '2024-06-26 21:37:10', '2024-06-26 21:37:10'),
(162, 1, 12, '2024-06-27', 24, '117716', 'general', NULL, 3, 630.00, NULL, 600.00, 30.00, NULL, 600.00, 600.00, 0.00, 600.00, 0.00, NULL, 200.00, 24, NULL, '2024-06-26 21:37:56', '2024-06-26 21:37:56'),
(163, 1, 11, '2024-06-27', 24, '108423', 'general', NULL, 7, 1850.00, NULL, 1800.00, 50.00, NULL, 1800.00, 1800.00, 0.00, 1800.00, 0.00, NULL, 1450.00, 23, NULL, '2024-06-26 21:38:53', '2024-06-26 21:38:53'),
(164, 1, 11, '2024-06-27', 24, '112035', 'general', NULL, 3, 700.00, NULL, 700.00, 0.00, NULL, 700.00, 700.00, 0.00, 700.00, 0.00, NULL, 260.00, 23, NULL, '2024-06-26 22:44:25', '2024-06-26 22:44:25'),
(165, 1, 12, '2024-06-27', 24, '104138', 'general', NULL, 1, 200.00, NULL, 200.00, 0.00, NULL, 200.00, 100.00, 0.00, 200.00, 100.00, NULL, 100.00, 23, NULL, '2024-06-26 22:45:00', '2024-06-26 22:45:00'),
(166, 1, 12, '2024-06-27', 24, '118514', 'general', NULL, 1, 300.00, NULL, 300.00, 0.00, NULL, 400.00, 400.00, 0.00, 400.00, 0.00, NULL, 100.00, 23, NULL, '2024-06-26 22:47:12', '2024-06-26 22:47:12'),
(167, 1, 12, '2024-06-27', 24, '100915', 'general', NULL, 3, 530.00, NULL, 530.00, 0.00, NULL, 530.00, 530.00, 0.00, 530.00, 0.00, NULL, 230.00, 23, NULL, '2024-06-26 23:24:18', '2024-06-29 22:48:11'),
(168, 1, 11, '2024-06-30', 24, '111985', 'general', NULL, 11, 1500.00, NULL, 1500.00, 0.00, NULL, 1500.00, 1500.00, 0.00, 1500.00, 0.00, NULL, 1310.00, 23, NULL, '2024-06-29 22:29:42', '2024-06-29 22:29:42'),
(169, 1, 11, '2024-06-30', 24, '111358', 'general', NULL, 1, 120.00, NULL, 120.00, 0.00, NULL, 120.00, 120.00, 0.00, 120.00, 0.00, NULL, 30.00, 23, NULL, '2024-06-29 22:31:56', '2024-06-29 22:39:56'),
(170, 1, 11, '2024-06-30', 24, '120823', 'general', NULL, 1, 250.00, NULL, 250.00, 0.00, NULL, 370.00, 370.00, 0.00, 370.00, 0.00, NULL, 100.00, 23, NULL, '2024-06-29 22:34:30', '2024-06-29 22:39:22'),
(171, 1, 11, '2024-06-30', 24, '115063', 'general', NULL, 1, 300.00, NULL, 300.00, 0.00, NULL, 670.00, 670.00, 0.00, 670.00, 0.00, NULL, 100.00, 23, NULL, '2024-06-29 22:35:13', '2024-06-29 22:38:32'),
(172, 1, 11, '2024-06-30', 24, '107006', 'general', NULL, 2, 1300.00, NULL, 1300.00, 0.00, NULL, 1300.00, 0.00, 0.00, 1300.00, 1300.00, NULL, 600.00, 23, NULL, '2024-06-30 00:22:05', '2024-06-30 00:22:05'),
(173, 1, 12, '2024-06-30', 24, '120767', 'general', NULL, 1, 100.00, NULL, 100.00, 0.00, NULL, 100.00, 100.00, 0.00, 100.00, 0.00, NULL, 90.00, 23, NULL, '2024-06-30 00:26:40', '2024-06-30 00:26:40'),
(174, 1, 11, '2024-06-30', 24, '116421', 'general', NULL, 0, 0.00, NULL, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, -200.00, 23, NULL, '2024-06-30 00:42:41', '2024-06-30 00:42:41'),
(175, 1, 11, '2024-06-30', 24, '110599', 'general', NULL, 0, 0.00, NULL, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, -100.00, 23, NULL, '2024-06-30 02:46:01', '2024-06-30 02:46:01'),
(176, 1, 11, '2024-06-30', 24, '104803', 'general', NULL, 0, 0.00, NULL, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, -300.00, 23, NULL, '2024-06-30 02:49:17', '2024-06-30 02:49:17'),
(177, 1, 11, '2024-06-30', 24, '121608', 'general', NULL, 2, 420.00, NULL, 420.00, 0.00, NULL, 1230.00, 1230.00, 0.00, 1230.00, 0.00, NULL, 230.00, 23, NULL, '2024-06-30 02:54:52', '2024-06-30 02:54:52'),
(178, 1, 11, '2024-06-30', 24, '107809', 'general', NULL, 15, 1200.00, NULL, 1200.00, 0.00, NULL, 1200.00, 1200.00, 0.00, 1200.00, 0.00, NULL, 1150.00, 23, NULL, '2024-06-30 02:55:45', '2024-06-30 02:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `main_unit_qty` int(11) DEFAULT NULL,
  `sub_unit_qty` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `sub_total` decimal(12,2) NOT NULL,
  `total_purchase_cost` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wa_status` enum('yes','no') DEFAULT NULL,
  `wa_duration` varchar(100) DEFAULT NULL,
  `wa_exp_date` date DEFAULT NULL,
  `sell_type` enum('normal sell','via sell') NOT NULL DEFAULT 'normal sell'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `rate`, `discount`, `main_unit_qty`, `sub_unit_qty`, `qty`, `sub_total`, `total_purchase_cost`, `created_at`, `updated_at`, `wa_status`, `wa_duration`, `wa_exp_date`, `sell_type`) VALUES
(251, 150, 9, 80.00, 0, NULL, NULL, 1, 80.00, 50.00, '2024-06-26 04:48:18', '2024-06-26 04:48:18', '', NULL, NULL, 'normal sell'),
(252, 150, 8, 300.00, 0, NULL, NULL, 1, 300.00, 200.00, '2024-06-26 04:48:18', '2024-06-26 04:48:18', '', NULL, NULL, 'normal sell'),
(253, 150, 6, 120.00, 0, NULL, NULL, 1, 120.00, 90.00, '2024-06-26 04:48:18', '2024-06-26 04:48:18', '', NULL, NULL, 'normal sell'),
(254, 151, 9, 80.00, 10, NULL, NULL, 1, 70.00, 50.00, '2024-06-26 04:54:10', '2024-06-26 04:54:10', '', NULL, NULL, 'normal sell'),
(255, 152, 9, 80.00, 10, NULL, NULL, 1, 70.00, 50.00, '2024-06-26 04:55:39', '2024-06-26 04:55:39', '', NULL, NULL, 'normal sell'),
(256, 153, 9, 80.00, 10, NULL, NULL, 1, 70.00, 50.00, '2024-06-26 04:56:54', '2024-06-26 04:56:54', '', NULL, NULL, 'normal sell'),
(257, 154, 6, 120.00, 0, NULL, NULL, 1, 120.00, 90.00, '2024-06-26 04:57:25', '2024-06-26 04:57:25', '', NULL, NULL, 'normal sell'),
(258, 155, 40, 250.00, 50, NULL, NULL, 5, 1200.00, 750.00, '2024-06-26 05:00:31', '2024-06-26 05:00:31', '', NULL, NULL, 'via sell'),
(259, 156, 41, 300.00, 0, NULL, NULL, 8, 2400.00, 1600.00, '2024-06-26 05:07:08', '2024-06-26 05:07:08', '', NULL, NULL, 'via sell'),
(260, 157, 10, 200.00, 0, NULL, NULL, 1, 200.00, 100.00, '2024-06-26 05:50:05', '2024-06-26 05:50:05', '', NULL, NULL, 'via sell'),
(261, 157, 40, 250.00, 0, NULL, NULL, 0, 0.00, 0.00, '2024-06-26 05:50:05', '2024-06-26 05:50:05', '', NULL, NULL, 'via sell'),
(262, 157, 40, 250.00, 0, NULL, NULL, 1, 250.00, 150.00, '2024-06-26 05:50:05', '2024-06-26 05:50:05', '', NULL, NULL, 'via sell'),
(263, 157, 41, 300.00, 0, NULL, NULL, 1, 300.00, 200.00, '2024-06-26 05:50:05', '2024-06-26 05:50:05', '', NULL, NULL, 'via sell'),
(264, 158, 1, 300.00, 0, NULL, NULL, 1, 300.00, 180.00, '2024-06-26 06:56:30', '2024-06-26 06:56:30', '', NULL, NULL, 'normal sell'),
(265, 158, 2, 120.00, 0, NULL, NULL, 1, 120.00, 90.00, '2024-06-26 06:56:30', '2024-06-26 06:56:30', '', NULL, NULL, 'normal sell'),
(266, 158, 3, 250.00, 0, NULL, NULL, 1, 250.00, 150.00, '2024-06-26 06:56:30', '2024-06-26 06:56:30', '', NULL, NULL, 'normal sell'),
(267, 159, 8, 300.00, 0, NULL, NULL, 1, 300.00, 200.00, '2024-06-26 06:57:17', '2024-06-26 06:57:17', '', NULL, NULL, 'via sell'),
(268, 159, 40, 250.00, 0, NULL, NULL, 0, 0.00, 0.00, '2024-06-26 06:57:17', '2024-06-26 06:57:17', '', NULL, NULL, 'via sell'),
(269, 159, 40, 250.00, 0, NULL, NULL, 1, 250.00, 150.00, '2024-06-26 06:57:17', '2024-06-26 06:57:17', '', NULL, NULL, 'via sell'),
(270, 160, 10, 200.00, 0, NULL, NULL, 1, 200.00, 100.00, '2024-06-26 21:35:46', '2024-06-26 21:35:46', '', NULL, NULL, 'normal sell'),
(271, 161, 9, 80.00, 0, NULL, NULL, 1, 80.00, 50.00, '2024-06-26 21:37:10', '2024-06-26 21:37:10', '', NULL, NULL, 'normal sell'),
(272, 161, 8, 300.00, 0, NULL, NULL, 1, 300.00, 200.00, '2024-06-26 21:37:10', '2024-06-26 21:37:10', '', NULL, NULL, 'normal sell'),
(273, 161, 3, 250.00, 0, NULL, NULL, 1, 250.00, 150.00, '2024-06-26 21:37:10', '2024-06-26 21:37:10', '', NULL, NULL, 'normal sell'),
(274, 162, 9, 80.00, 0, NULL, NULL, 1, 80.00, 50.00, '2024-06-26 21:37:56', '2024-06-26 21:37:56', '', NULL, NULL, 'normal sell'),
(275, 162, 3, 250.00, 0, NULL, NULL, 1, 250.00, 150.00, '2024-06-26 21:37:56', '2024-06-26 21:37:56', '', NULL, NULL, 'normal sell'),
(276, 162, 41, 300.00, 0, NULL, NULL, 1, 300.00, 200.00, '2024-06-26 21:37:56', '2024-06-26 21:37:56', '', NULL, NULL, 'via sell'),
(277, 163, 40, 250.00, 0, NULL, NULL, 0, 0.00, 0.00, '2024-06-26 21:38:53', '2024-06-26 21:38:53', '', NULL, NULL, 'via sell'),
(278, 163, 40, 250.00, 0, NULL, NULL, 5, 1250.00, 750.00, '2024-06-26 21:38:53', '2024-06-26 21:38:53', '', NULL, NULL, 'via sell'),
(279, 163, 41, 300.00, 0, NULL, NULL, 0, 0.00, 0.00, '2024-06-26 21:38:53', '2024-06-26 21:38:53', '', NULL, NULL, 'via sell'),
(280, 163, 41, 300.00, 0, NULL, NULL, 2, 600.00, 400.00, '2024-06-26 21:38:53', '2024-06-26 21:38:53', '', NULL, NULL, 'via sell'),
(281, 164, 9, 80.00, 0, NULL, NULL, 1, 80.00, 50.00, '2024-06-26 22:44:25', '2024-06-26 22:44:25', '', NULL, NULL, 'normal sell'),
(282, 164, 2, 120.00, 0, NULL, NULL, 1, 120.00, 90.00, '2024-06-26 22:44:25', '2024-06-26 22:44:25', '', NULL, NULL, 'normal sell'),
(283, 164, 7, 500.00, 0, NULL, NULL, 1, 500.00, 300.00, '2024-06-26 22:44:25', '2024-06-26 22:44:25', '', NULL, NULL, 'normal sell'),
(284, 165, 10, 200.00, 0, NULL, NULL, 1, 200.00, 100.00, '2024-06-26 22:45:00', '2024-06-26 22:45:00', '', NULL, NULL, 'normal sell'),
(285, 166, 8, 300.00, 0, NULL, NULL, 1, 300.00, 200.00, '2024-06-26 22:47:12', '2024-06-26 22:47:12', '', NULL, NULL, 'normal sell'),
(286, 167, 10, 200.00, 0, NULL, NULL, 1, 200.00, 100.00, '2024-06-26 23:24:18', '2024-06-26 23:24:18', '', NULL, NULL, 'via sell'),
(287, 167, 9, 80.00, 0, NULL, NULL, 1, 80.00, 50.00, '2024-06-26 23:24:18', '2024-06-26 23:24:18', '', NULL, NULL, 'via sell'),
(288, 167, 40, 250.00, 0, NULL, NULL, 0, 0.00, 0.00, '2024-06-26 23:24:18', '2024-06-26 23:24:18', '', NULL, NULL, 'via sell'),
(289, 167, 40, 250.00, 0, NULL, NULL, 1, 250.00, 150.00, '2024-06-26 23:24:18', '2024-06-26 23:24:18', '', NULL, NULL, 'via sell'),
(290, 168, 52, 300.00, 0, NULL, NULL, 1, 300.00, 100.00, '2024-06-29 22:29:42', '2024-06-29 22:29:42', '', NULL, NULL, 'normal sell'),
(291, 168, 2, 120.00, 0, NULL, NULL, 8, 960.00, 720.00, '2024-06-29 22:29:42', '2024-06-29 22:29:42', '', NULL, NULL, 'normal sell'),
(292, 168, 2, 120.00, 0, NULL, NULL, 2, 240.00, 180.00, '2024-06-29 22:29:42', '2024-06-29 22:29:42', '', NULL, NULL, 'via sell'),
(293, 169, 2, 120.00, 0, NULL, NULL, 0, 0.00, 0.00, '2024-06-29 22:31:56', '2024-06-29 22:31:56', '', NULL, NULL, 'normal sell'),
(294, 169, 2, 120.00, 0, NULL, NULL, 1, 120.00, 90.00, '2024-06-29 22:31:56', '2024-06-29 22:31:56', '', NULL, NULL, 'via sell'),
(295, 170, 40, 250.00, 0, NULL, NULL, 0, 0.00, 0.00, '2024-06-29 22:34:30', '2024-06-29 22:34:30', '', NULL, NULL, 'via sell'),
(296, 170, 40, 250.00, 0, NULL, NULL, 1, 250.00, 150.00, '2024-06-29 22:34:30', '2024-06-29 22:34:30', '', NULL, NULL, 'via sell'),
(297, 171, 41, 300.00, 0, NULL, NULL, 0, 0.00, 0.00, '2024-06-29 22:35:13', '2024-06-29 22:35:13', '', NULL, NULL, 'normal sell'),
(298, 171, 41, 300.00, 0, NULL, NULL, 1, 300.00, 200.00, '2024-06-29 22:35:13', '2024-06-29 22:35:13', '', NULL, NULL, 'via sell'),
(299, 172, 53, 1000.00, 0, NULL, NULL, 1, 1000.00, 500.00, '2024-06-30 00:22:05', '2024-06-30 00:22:05', '', NULL, NULL, 'normal sell'),
(300, 172, 51, 300.00, 0, NULL, NULL, 1, 300.00, 200.00, '2024-06-30 00:22:05', '2024-06-30 00:22:05', '', NULL, NULL, 'normal sell'),
(301, 173, 54, 100.00, 0, NULL, NULL, 1, 100.00, 10.00, '2024-06-30 00:26:40', '2024-06-30 00:26:40', '', NULL, NULL, 'normal sell'),
(302, 174, 58, 300.00, 0, NULL, NULL, 7, 2100.00, 1400.00, '2024-06-30 00:42:41', '2024-06-30 00:42:41', '', NULL, NULL, 'normal sell'),
(303, 175, 62, 300.00, 0, NULL, NULL, 5, 1500.00, 500.00, '2024-06-30 02:46:01', '2024-06-30 02:46:01', '', NULL, NULL, 'normal sell'),
(304, 176, 63, 500.00, 0, NULL, NULL, 5, 2500.00, 1500.00, '2024-06-30 02:49:17', '2024-06-30 02:49:17', '', NULL, NULL, 'normal sell'),
(305, 177, 62, 300.00, 0, NULL, NULL, 1, 300.00, 100.00, '2024-06-30 02:54:52', '2024-06-30 02:54:52', '', NULL, NULL, 'via sell'),
(306, 177, 2, 120.00, 0, NULL, NULL, 1, 120.00, 90.00, '2024-06-30 02:54:52', '2024-06-30 02:54:52', '', NULL, NULL, 'via sell'),
(307, 178, 9, 80.00, 0, NULL, NULL, 12, 960.00, 600.00, '2024-06-30 02:55:45', '2024-06-30 02:55:45', '', NULL, NULL, 'normal sell'),
(308, 178, 9, 80.00, 0, NULL, NULL, 3, 240.00, 150.00, '2024-06-30 02:55:45', '2024-06-30 02:55:45', '', NULL, NULL, 'via sell');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `number` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_categories`
--

CREATE TABLE `sms_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Juice', 'juice', NULL, 0, '2024-05-06 03:38:16', '2024-05-06 03:38:16'),
(2, 2, 'Frozen Food', 'frozen-food', NULL, 0, '2024-05-06 03:38:29', '2024-05-06 03:38:29'),
(3, 3, 'TV or Monitor', 'tv-or-monitor', NULL, 0, '2024-05-06 03:38:46', '2024-05-06 03:38:46'),
(4, 3, 'Mobile', 'mobile', NULL, 0, '2024-05-06 03:38:55', '2024-05-06 03:38:55'),
(5, 4, 'T-shirt', 't-shirt', NULL, 0, '2024-05-06 03:39:05', '2024-05-06 03:39:05'),
(6, 4, 'Pant', 'pant', NULL, 0, '2024-05-06 03:39:17', '2024-05-06 03:39:17'),
(7, 5, 'Sofa', 'sofa', NULL, 0, '2024-05-06 03:39:31', '2024-05-06 03:39:31'),
(8, 5, 'Table', 'table', NULL, 0, '2024-05-06 03:39:39', '2024-05-06 03:39:39'),
(9, 6, 'Jersey', 'jersey', '17639217.jpg', 0, '2024-05-27 00:36:20', '2024-05-27 00:36:20'),
(10, 8, 'Via Sell', 'via-sell', NULL, 0, '2024-06-09 06:08:42', '2024-06-09 06:08:42');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `opening_receivable` decimal(12,2) DEFAULT NULL,
  `opening_payable` decimal(12,2) DEFAULT NULL,
  `wallet_balance` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_receivable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_payable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `branch_id`, `name`, `email`, `phone`, `address`, `opening_receivable`, `opening_payable`, `wallet_balance`, `total_receivable`, `total_payable`, `created_at`, `updated_at`) VALUES
(13, 1, 'supplie1', NULL, '+1 (349) 525-6061', NULL, 0.00, 0.00, 0.00, 7700.00, 7700.00, '2024-06-26 04:03:18', '2024-06-26 04:47:01'),
(14, 1, 'supplier2', NULL, '324324324', NULL, 0.00, 0.00, 0.00, 10100.00, 10100.00, '2024-06-26 04:03:31', '2024-06-26 22:16:12');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `percentage` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 'Govt. Tax', '5', '2024-05-06 03:46:37', '2024-05-06 03:46:37'),
(2, '10', '10', '2024-05-06 03:46:51', '2024-05-06 03:46:51'),
(3, '7', '7', '2024-05-06 03:47:02', '2024-05-06 03:47:02'),
(4, '15', '15', '2024-05-06 03:47:10', '2024-05-06 03:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `payment_type` enum('receive','pay') NOT NULL COMMENT 'Recieve or Pay',
  `particulars` varchar(255) DEFAULT NULL COMMENT 'Purchase #12 or Paid to Supplyer/Sale #10 Received from Customer',
  `customer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `debit` decimal(12,2) DEFAULT NULL,
  `credit` decimal(12,2) DEFAULT NULL,
  `balance` decimal(14,2) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `date`, `payment_type`, `particulars`, `customer_id`, `supplier_id`, `debit`, `credit`, `balance`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(22, '2024-06-26', 'pay', 'Purchase#25', NULL, 11, 4200.00, 4200.00, 0.00, 21, NULL, '2024-06-26 03:48:51', '2024-06-26 03:48:51'),
(23, '2024-06-26', 'pay', 'Purchase#27', NULL, 12, 5900.00, 9900.00, 4000.00, 22, NULL, '2024-06-26 03:52:21', '2024-06-26 03:53:13'),
(24, '2024-06-26', 'pay', 'Purchase#46', NULL, 13, 7700.00, 8100.00, 400.00, 23, NULL, '2024-06-26 04:11:49', '2024-06-26 04:47:01'),
(25, '2024-06-27', 'pay', 'Purchase#47', NULL, 14, 10100.00, 11100.00, 1000.00, 23, NULL, '2024-06-26 04:12:58', '2024-06-26 22:16:12'),
(26, '2024-06-30', 'receive', 'Sale#178', 11, NULL, 14840.00, 19660.00, 4820.00, 23, NULL, '2024-06-26 04:56:54', '2024-06-30 02:55:45'),
(27, '2024-06-30', 'receive', 'Sale#173', 12, NULL, 1400.00, 2030.00, 630.00, 23, NULL, '2024-06-26 21:35:46', '2024-06-30 00:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `related_to_unit` varchar(40) DEFAULT NULL,
  `related_sign` varchar(20) DEFAULT NULL,
  `related_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `related_to_unit`, `related_sign`, `related_by`, `created_at`, `updated_at`) VALUES
(1, 'KG', '1', '*', 1000, '2024-05-06 03:41:23', '2024-05-06 03:41:23'),
(2, 'pc', '1', '*', 1, '2024-05-06 03:41:41', '2024-05-06 03:41:41'),
(3, 'Dozon', '12', '/', 12, '2024-05-06 03:42:23', '2024-05-06 03:42:23'),
(4, 'Pair', '2', '/', 2, '2024-05-06 03:42:50', '2024-05-06 03:42:50'),
(5, 'Liter', '1', '*', 1000, '2024-05-06 04:13:26', '2024-05-06 04:13:26'),
(6, 'Pieces', '5', '+', 20, '2024-05-27 00:43:43', '2024-05-27 00:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `photo`, `address`, `email_verified_at`, `branch_id`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'EBB', 'ebb@gmail.com', NULL, NULL, NULL, NULL, 1, '$2y$10$HkATiONt8miuTP.kJgmXCumEcebwPc7OSoBeTjJsgzz5rZYcP5u3O', NULL, '2024-05-06 03:15:55', '2024-05-06 03:15:55'),
(19, 'Semi Admin', 'ebb1@gmail.com', '0193396741', NULL, 'Sunt nulla ut nostr', NULL, 1, '$2y$10$RA3PUvj4VC.dddts03aNN.yYT5DdgOevC7OyASP4a3CpMfrwJ5zZW', NULL, '2024-05-22 07:30:31', '2024-05-22 07:30:31'),
(20, 'extra', 'extra@gmail.com', '2846081749', NULL, 'Sunt nulla ut nostr', NULL, 1, '$2y$10$iFMk4rWd9rbeCIaqLptRj.yj9MreG37eLGco5hMgUEVKUmmXu9uvC', NULL, '2024-05-22 22:12:39', '2024-05-22 22:12:39'),
(21, 'Employee', 'employee@gmail.com', '2846081749', NULL, 'Sunt nulla ut nostr', NULL, 1, '$2y$10$CuGn6K9eJrwus8K8EQpoIeiyzkh7JGcGlqpVNipuCSSKanMBWc.si', NULL, '2024-05-25 22:04:45', '2024-05-25 22:04:45'),
(23, 'ebb', 'user1@gmail.Com', '0193396741', NULL, 'Bangladesh', NULL, 1, '$2y$10$9LavoKWTe.v/K6EWNMhpuOolRf.K4AHOS76zk.DtZsIzPO1P2vlh.', NULL, '2024-05-25 22:21:00', '2024-05-25 22:21:00'),
(24, 'Demo', 'demo@gmail.com', '0193396741', NULL, 'Masterbari,Hobirbari, Bhaluka ,Mymensingh, Bangladesh', NULL, 1, '$2y$10$ULaYdtbfIgYuTwQrIV56U.Hp/DopzA7SKRtj8jqucTrWopeXaFfTm', NULL, '2024-05-27 01:41:29', '2024-05-27 03:09:02');

-- --------------------------------------------------------

--
-- Table structure for table `via_sales`
--

CREATE TABLE `via_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_number` bigint(20) DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cost_price` decimal(8,2) DEFAULT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `sub_total` decimal(8,2) DEFAULT NULL,
  `paid` decimal(8,2) DEFAULT NULL,
  `due` decimal(8,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `via_sales`
--

INSERT INTO `via_sales` (`id`, `invoice_date`, `invoice_number`, `supplier_name`, `product_id`, `product_name`, `quantity`, `cost_price`, `sale_price`, `sub_total`, `paid`, `due`, `status`, `created_at`, `updated_at`) VALUES
(20, '2024-06-30', 110599, NULL, 62, 'Jhon Wick', 5, 100.00, 300.00, 500.00, 500.00, 0.00, 1, '2024-06-30 02:45:57', '2024-06-30 02:52:50'),
(21, '2024-06-30', 104803, NULL, 63, 'sell', 5, 300.00, 500.00, 1500.00, 1500.00, 0.00, 1, '2024-06-30 02:49:10', '2024-06-30 02:50:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_foreign` (`account_id`),
  ADD KEY `account_transactions_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `actual_payments`
--
ALTER TABLE `actual_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actual_payments_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_balances`
--
ALTER TABLE `company_balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_balances_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `damages_branch_id_foreign` (`branch_id`),
  ADD KEY `damages_product_id_foreign` (`product_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `employee_salaries`
--
ALTER TABLE `employee_salaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_salaries_branch_id_foreign` (`branch_id`),
  ADD KEY `employee_salaries_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_branch_id_foreign` (`branch_id`),
  ADD KEY `expenses_expense_category_id_foreign` (`expense_category_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pos_settings`
--
ALTER TABLE `pos_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_barcode_unique` (`barcode`),
  ADD KEY `products_branch_id_foreign` (`branch_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_details`
--
ALTER TABLE `promotion_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotion_details_promotion_id_foreign` (`promotion_id`);

--
-- Indexes for table `psizes`
--
ALTER TABLE `psizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `psizes_category_id_foreign` (`category_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_branch_id_foreign` (`branch_id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_items_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_items`
--
ALTER TABLE `return_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_branch_id_foreign` (`branch_id`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_items_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `sms_categories`
--
ALTER TABLE `sms_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suppliers_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `via_sales`
--
ALTER TABLE `via_sales`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `actual_payments`
--
ALTER TABLE `actual_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `company_balances`
--
ALTER TABLE `company_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_salaries`
--
ALTER TABLE `employee_salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_settings`
--
ALTER TABLE `pos_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `promotion_details`
--
ALTER TABLE `promotion_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `psizes`
--
ALTER TABLE `psizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `return_items`
--
ALTER TABLE `return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_categories`
--
ALTER TABLE `sms_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `via_sales`
--
ALTER TABLE `via_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD CONSTRAINT `account_transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_transactions_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `actual_payments`
--
ALTER TABLE `actual_payments`
  ADD CONSTRAINT `actual_payments_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_balances`
--
ALTER TABLE `company_balances`
  ADD CONSTRAINT `company_balances_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `damages`
--
ALTER TABLE `damages`
  ADD CONSTRAINT `damages_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `damages_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_salaries`
--
ALTER TABLE `employee_salaries`
  ADD CONSTRAINT `employee_salaries_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_salaries_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotion_details`
--
ALTER TABLE `promotion_details`
  ADD CONSTRAINT `promotion_details_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `psizes`
--
ALTER TABLE `psizes`
  ADD CONSTRAINT `psizes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms`
--
ALTER TABLE `sms`
  ADD CONSTRAINT `sms_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
