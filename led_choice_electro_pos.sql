-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2024 at 03:58 PM
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
-- Database: `led_choice_electro_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `debit` decimal(12,2) DEFAULT NULL,
  `credit` decimal(12,2) DEFAULT NULL,
  `balance` decimal(12,2) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `account_id`, `branch_id`, `purpose`, `debit`, `credit`, `balance`, `note`, `created_at`, `updated_at`) VALUES
(82, 6, 1, 'Deposit', 150000.00, NULL, -150000.00, NULL, '2024-06-09 18:00:00', '2024-06-10 06:38:58'),
(83, 6, 1, 'Withdraw', NULL, 900.00, -149100.00, NULL, '2024-06-10 06:42:32', '2024-06-10 06:42:32'),
(84, 6, 1, 'Withdraw', NULL, 3000.00, -146100.00, NULL, '2024-06-10 06:48:31', '2024-06-10 06:48:31');

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
(80, 1, 'pay', 6, NULL, 7, 150000.00, '2024-06-10', NULL, '2024-06-10 06:38:58', '2024-06-10 06:38:58'),
(81, 1, 'receive', 6, 11, NULL, 900.00, '2024-06-10', NULL, '2024-06-10 06:42:32', '2024-06-10 06:42:32'),
(82, 1, 'receive', 6, 11, NULL, 3000.00, '2024-06-10', NULL, '2024-06-10 06:48:31', '2024-06-10 06:48:31');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `branch_name` varchar(150) NOT NULL,
  `manager_name` varchar(150) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `account` varchar(255) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `opening_balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `branch_name`, `manager_name`, `phone_number`, `account`, `email`, `opening_balance`, `created_at`, `updated_at`) VALUES
(6, 'CASH', 'LED CHOICE', 'Imam Hasan', '01741177730', 'Cash', NULL, 1.00, '2024-06-10 06:35:35', '2024-06-10 06:35:35'),
(7, 'Bkash', 'Led Choice', 'Imam Hasan', '01741177730', 'Bkash', NULL, 1.00, '2024-06-10 06:36:28', '2024-06-10 06:36:28');

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
(1, 'LED CHOICE', 'Shop No : 03, 44-45 Kaptan Bazar, Madina Electric & Electronics Fancy, Super Market, Nawabpur, Dhaka - 1203', '01741177730', 'ledchoicebd@gmail.com', '1385019765.png', NULL, '2024-05-06 03:15:55', '2024-06-10 05:51:00');

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
(8, 'LED CHOICE', 'led-choice', NULL, 'LED Choice is a pioneer Importer, wholesaler and supplier in kaptan bazar dhaka bangladesh.', '2024-06-10 06:14:51', '2024-06-10 06:14:51'),
(9, 'Via Sell', 'via-sell', NULL, NULL, '2024-06-10 06:41:03', '2024-06-10 06:41:03');

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
(9, 'Flood Light', 'flood-light', NULL, 0, '2024-06-10 06:10:15', '2024-06-10 06:10:15'),
(10, 'Street Light', 'street-light', NULL, 0, '2024-06-10 06:10:31', '2024-06-10 06:10:31'),
(11, 'Via Sell', 'via-sell', NULL, 0, '2024-06-10 06:41:03', '2024-06-10 06:41:03');

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
(11, 1, 'Hanif', NULL, '01703212442', NULL, 0.00, 0.00, 550.00, 4450.00, 3900.00, '2024-06-10 06:42:15', '2024-06-10 06:48:31');

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

--
-- Dumping data for table `damages`
--

INSERT INTO `damages` (`id`, `branch_id`, `product_id`, `qty`, `main_unit_qty`, `sub_unit_qty`, `date`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 36, 1, NULL, NULL, '2024-06-10', NULL, '2024-06-10 06:57:48', '2024-06-10 06:57:48');

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
(3, 1, 'Imam Hasan', 'Kaptan Bazar', '01741177730', 'ledchoicebd@gmail.com', NULL, NULL, 'Owner', 100000.00, '0', '2024-06-10 07:02:07', '2024-06-10 07:02:07');

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

--
-- Dumping data for table `employee_salaries`
--

INSERT INTO `employee_salaries` (`id`, `branch_id`, `employee_id`, `date`, `debit`, `creadit`, `balance`, `note`, `created_at`, `updated_at`) VALUES
(3, 1, 3, '2024-06-05', 90000.00, 100000.00, 90000.00, NULL, '2024-06-10 07:03:24', '2024-06-10 07:03:24');

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
(39, '2024_05_29_045256_create_return_items_table', 4);

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
(1, 'App\\Models\\User', 25),
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
(116, 'branch.delete', 'web', 'branch', '2024-05-23 01:01:09', '2024-05-23 01:01:09'),
(117, 'Manager', 'web', 'pos-manage', '2024-06-10 07:14:21', '2024-06-10 07:14:21');

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
  `selling_price_edit` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_settings`
--

INSERT INTO `pos_settings` (`id`, `company`, `logo`, `address`, `email`, `facebook`, `phone`, `header_text`, `footer_text`, `invoice_type`, `invoice_logo_type`, `barcode_type`, `low_stock`, `dark_mode`, `discount`, `tax`, `barcode`, `selling_price_edit`, `created_at`, `updated_at`) VALUES
(1, 'LED Choice', 'uploads/pos_setting/1688215961.png', 'Banasree,Dhaka,Bangladesh', 'ebbdemo@gmail.com', 'https:/www.ebb.com', NULL, 'Demo Header', 'Demo Footer', 'a4', 'Logo', 'a4', 5, 1, 1, 0, 0, 1, '2024-05-06 03:15:55', '2024-06-10 06:45:22');

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
(36, 'Flood Light SMD 200 W H', 1, '148991', 9, 11, 8, 3000.00, 3600.00, NULL, NULL, 48, 0, 1, '#000000', 9, 7, '2024-06-10 06:30:50', '2024-06-10 06:57:48'),
(37, '6 pin multi', 1, '148992', 11, 15, 9, 150.00, 200.00, NULL, NULL, 0, 0, 5, NULL, NULL, 7, '2024-06-10 06:41:03', '2024-06-10 06:42:32');

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
(9, 9, '200 W', '2024-06-10 06:26:50', '2024-06-10 06:26:50'),
(10, 9, '100 W', '2024-06-10 06:27:03', '2024-06-10 06:27:03'),
(11, 10, '50 W', '2024-06-10 06:27:20', '2024-06-10 06:27:20'),
(12, 10, '100 W', '2024-06-10 06:27:32', '2024-06-10 06:27:32');

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
(10, 1, 7, '2024-06-10', 50.00, 150000.00, '1', 0.00, 150000.00, NULL, 150000.00, 150000.00, 0.00, 0.00, 6, NULL, NULL, '2024-06-10 06:38:58', '2024-06-10 06:38:58');

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
(14, 10, 36, 3000.00, 50, 150000.00, '2024-06-10 06:38:58', '2024-06-10 06:38:58');

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
(91, 1, 11, '2024-06-10', 25, '109923', 'general', NULL, 0, 950.00, NULL, 950.00, 0.00, NULL, 950.00, 900.00, 0.00, 950.00, 50.00, NULL, 800.00, 6, NULL, '2024-06-10 06:42:32', '2024-06-10 06:42:32'),
(92, 1, 11, '2024-06-10', 25, '111003', 'general', NULL, 1, 3500.00, NULL, 3500.00, 0.00, NULL, 3550.00, 3000.00, 0.00, 3550.00, 550.00, NULL, 500.00, 6, NULL, '2024-06-10 06:48:31', '2024-06-10 06:48:31');

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
  `wa_exp_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `rate`, `discount`, `main_unit_qty`, `sub_unit_qty`, `qty`, `sub_total`, `total_purchase_cost`, `created_at`, `updated_at`, `wa_status`, `wa_duration`, `wa_exp_date`) VALUES
(133, 91, 37, 200.00, 50, NULL, NULL, 5, 950.00, 750.00, '2024-06-10 06:42:32', '2024-06-10 06:42:32', '', NULL, NULL),
(134, 92, 36, 3600.00, 100, NULL, NULL, 1, 3500.00, 3000.00, '2024-06-10 06:48:31', '2024-06-10 06:48:31', '', NULL, NULL);

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
(11, 9, 'SMD', 'smd', NULL, 0, '2024-06-10 06:11:35', '2024-06-10 06:11:35'),
(12, 9, 'COB', 'cob', NULL, 0, '2024-06-10 06:11:54', '2024-06-10 06:11:54'),
(13, 10, 'SMD', 'smd', NULL, 0, '2024-06-10 06:12:26', '2024-06-10 06:12:26'),
(14, 10, 'COB', 'cob', NULL, 0, '2024-06-10 06:12:38', '2024-06-10 06:12:38'),
(15, 11, 'Via Sell', 'via-sell', NULL, 0, '2024-06-10 06:41:03', '2024-06-10 06:41:03');

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
(7, 1, 'Wendy', NULL, '011111111111', NULL, 1000.00, 500.00, 0.00, 150000.00, 150000.00, '2024-06-10 06:01:05', '2024-06-10 06:38:59'),
(8, 1, 'Bruce', NULL, '01111111111', NULL, NULL, NULL, 0.00, 0.00, 0.00, '2024-06-10 06:28:41', '2024-06-10 06:28:41');

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
(17, '2024-06-10', 'pay', 'Purchase#10', NULL, 7, 150000.00, 150000.00, 0.00, 6, NULL, '2024-06-10 06:38:59', '2024-06-10 06:38:59'),
(18, '2024-06-10', 'receive', 'Sale#92', 11, NULL, 3900.00, 4500.00, 600.00, 6, NULL, '2024-06-10 06:42:32', '2024-06-10 06:48:31');

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
(7, 'Pieces', '1', '*', 1, '2024-06-10 06:17:43', '2024-06-10 06:17:43'),
(8, 'Packet', '1', '*', 1, '2024-06-10 06:25:50', '2024-06-10 06:25:50');

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
(24, 'Demo', 'demo@gmail.com', '0193396741', NULL, 'Masterbari,Hobirbari, Bhaluka ,Mymensingh, Bangladesh', NULL, 1, '$2y$10$ULaYdtbfIgYuTwQrIV56U.Hp/DopzA7SKRtj8jqucTrWopeXaFfTm', NULL, '2024-05-27 01:41:29', '2024-05-27 03:09:02'),
(25, 'Imam Hasan', 'ledchoicebd@gmail.com', '01741177730', NULL, NULL, NULL, 1, '$2y$10$exckmJg9kIJaR1pEWfUhnO7JfEaa.TQSV6CAiIu7nFYIDO7RFkcgm', NULL, '2024-06-10 05:54:27', '2024-06-10 05:57:47');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `actual_payments`
--
ALTER TABLE `actual_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_salaries`
--
ALTER TABLE `employee_salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `return_items`
--
ALTER TABLE `return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
