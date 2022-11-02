-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 02, 2022 at 10:51 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_19_081618_create_permissions_table', 1),
(6, '2022_04_19_081621_create_roles_table', 1),
(7, '2022_04_19_082033_create_users_roles_table', 1),
(8, '2022_04_19_082111_create_roles_permissions_table', 1),
(9, '2022_04_19_082832_create_users_permissions_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'super-admin', '2022-04-20 05:20:36', '2022-06-10 05:57:49'),
(2, 'Admin', 'admin', '2022-04-20 05:20:36', '2022-04-20 05:20:36'),
(4, 'candidate', 'candidate', '2022-04-21 09:52:20', '2022-06-11 06:25:14'),
(7, 'agency', 'agency', '2022-04-22 11:10:43', '2022-06-11 05:16:47'),
(8, 'company', 'company', NULL, '2022-06-11 05:21:09'),
(9, 'job-manger', 'job-manger', '2022-05-06 10:35:50', '2022-05-10 10:14:37'),
(10, 'test role suk', 'test role suk', '2022-11-02 11:40:08', '2022-11-02 11:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `role_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL,
  `fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isSuperAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `parent_id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `isSuperAdmin`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'admisuper n', 'admin@admin.com', NULL, NULL, '$2y$10$2msHEvD4.GXQJSfgVLPGb.Itwc1uFK7U5NaUQH7vZB63w/jYMZkl.', 'EBG2oAQ8e4ysKxawKZMirMQkxj32RHkrBqBwb8qgjh739IV8ne6AvJEVxZZs', 1, 1, '2022-04-19 23:03:38', '2022-04-19 23:03:38'),
(4, NULL, 'Alfred Marshall', 'test_user@gmail.com', NULL, NULL, '$2y$10$pn8Oz119f3YDWl.AkQB62eSiCFkEAS3zaX97VSP.0DG9QixCISrn2', NULL, 0, 1, '2022-04-20 05:20:36', '2022-06-03 02:20:06'),
(5, NULL, 'James Martin', 'test_admin@gmail.com', NULL, NULL, '$2y$10$paAvHge1qgfKoxihUp4JEOIjhCFhVjdG9v9JduhUfxfn.84y6wGAu', NULL, 0, 1, '2022-04-20 05:20:36', '2022-06-03 02:14:09'),
(6, NULL, 'Benjamin Baker', 'kardam98anita@gmail.com', NULL, NULL, '$2y$10$csd3RSygQ4zMccfo.joVvObv2NWHFni/iHIbmy3dngB5nZzcSHG/a', NULL, 0, 1, '2022-04-20 09:08:58', '2022-06-03 02:21:44'),
(8, NULL, 'Lionel Robbins', 'job@gmail.com', NULL, NULL, '$2y$10$2msHEvD4.GXQJSfgVLPGb.Itwc1uFK7U5NaUQH7vZB63w/jYMZkl.', '6GbAVLAkvKiSLOHjsrb2fBDr7VuoFdQ5acCRI78fegJWeflgYLQ8FFdut0ot', 0, 1, '2022-04-20 11:39:05', '2022-06-03 02:20:20'),
(9, NULL, 'product manger', 'product@gmail.com', NULL, NULL, '$2y$10$SDsTMzGBogwjpPcpVSIF7OH006hvAei3sXxUaj2mQ86zyZ4PD16YK', NULL, 0, 1, '2022-04-21 09:53:22', '2022-04-21 09:53:22'),
(14, NULL, 'Kavin Group', 'johnsadams12356@gmail.com', NULL, NULL, '$2y$10$uk0etRDIcs4OjfHfeuKWi.DQBaFNtqQM4z3W9Ob87DgHMB8V16QSa', NULL, 0, 1, '2022-05-28 06:55:47', '2022-09-02 04:25:03'),
(22, NULL, 'Recruitment Canada', 'example123@gmail.com', NULL, NULL, '$2y$10$cl9ElttoeNfuElfQEItCZOSoGWw6c3QT3TamsYEnwnEt2SIhKXx0y', NULL, 0, 1, '2022-05-30 01:26:53', '2022-09-16 04:33:58'),
(23, NULL, 'STRIVE Recruitment', 'examle12345@gmail.com', NULL, NULL, '$2y$10$/uK9EJ.WQ7NWVYHqz88GteIMgQHlZXr7YQXcCzEO..LqY4qRcEGPO', NULL, 0, 1, '2022-05-30 01:51:48', '2022-09-16 04:34:58'),
(30, NULL, 'DevTalent', 'abcdxyz123@example.com', NULL, NULL, '$2y$10$f4JWCa/S2GSImI/NJzLOJOrpgg2/emeGyjZGSHGzyFbbaxujuMYJm', NULL, 0, 1, '2022-05-30 23:43:31', '2022-06-03 03:46:32'),
(36, NULL, 'Stantec', 'xyz123467@example.com', NULL, NULL, '$2y$10$hfYOi3wUXGISa767XKXzFe67sLodZstTjw.trf6poK6N3/EH/psGa', NULL, 0, 1, '2022-05-31 01:22:38', '2022-06-03 04:18:29'),
(37, NULL, 'ScaleX', 'abcd12354667@example.com', NULL, NULL, '$2y$10$gii9E64ZpeRPu3SpaMlMsufH.aYFBrCdhXkqlBShctDtRNsF28Axe', NULL, 0, 1, '2022-05-31 01:25:13', '2022-06-03 03:46:51'),
(60, NULL, 'Brookfield Asset Management', 'brookfield@gmail.com', NULL, NULL, '$2y$10$FqaLfIJM49PYS4.7kQVkU.11gV/LpEWVDZRRRx0dkL5wvjndUxHva', NULL, 0, 1, '2022-06-03 04:27:33', '2022-06-03 04:27:33'),
(61, NULL, 'Power Corporation of Canada', 'power@co.com', NULL, NULL, '$2y$10$APlTVQ1VW361XHCeaJ.aEerkVVGRh71AokQO9p8j5CH2EY95WcMcy', NULL, 0, 1, '2022-06-03 04:29:12', '2022-06-03 04:29:12'),
(62, NULL, 'Couche Tard', 'couche@tard.com', NULL, NULL, '$2y$10$jn2rKq38aN/mCXsuN.WRIeYMaunMmSYRpHG64dY7hiTEAJCI0rMtS', NULL, 0, 1, '2022-06-03 04:30:09', '2022-06-03 04:30:09'),
(72, NULL, 'Billy Brown', 'example@xyz.com', NULL, NULL, '$2y$10$uWyQDwItvsP8DnUkuIVTUu0B34QlQJ/U7LV3/VVbm6i0ZLOe6Ea8u', NULL, 0, 1, '2022-06-05 23:22:56', '2022-06-05 23:22:56'),
(73, NULL, 'Billy Brown', 'candidate@gmail.com', NULL, NULL, '$2y$10$p6m8jlFN8lIi1LA0YYFkaeKQ6E4pAZsmI3eSygclJhNdf6u.ku.1C', '47g37lBrc6WjOVNpyAohqD3qZvkOQrCkFBKmtYXSs4PaDlPQb8oSbJVl269f', 0, 1, '2022-06-05 23:24:28', '2022-06-07 02:02:22'),
(74, NULL, 'Sarah Parker', 'abd@example.com', NULL, NULL, '$2y$10$9sBJMgNLhJw833dLLaFSde6URyFp6odRyBoNCJpSpXgl21HCFIctq', NULL, 0, 1, '2022-06-06 01:47:16', '2022-06-06 01:47:16'),
(75, NULL, 'Erik Sullivan', 'xyz@123.com', NULL, NULL, '$2y$10$GgcL.yl/49jbfnpfIDd8QeEXHS2.38WlnttGegWqF1Xe2scU.StYe', NULL, 0, 1, '2022-06-06 06:37:37', '2022-06-06 06:37:37'),
(76, NULL, 'Canada Revenue Agency', 'canada@agencyrevenue.com', NULL, NULL, '$2y$10$QXa6bfkmXQaQ8tEKkEKBAud3ZlFySIWDDzGgzMx5LMCpIccbyvBg6', NULL, 0, 0, '2022-06-08 02:29:52', '2022-06-09 10:36:19'),
(77, NULL, 'Altis Human Resource', 'altis@gmail.com', NULL, NULL, '$2y$10$cQNirHI33O4migPHWqsNQOuTerlnTpK4F3aRr7SZyDzgbcJuJTAPy', NULL, 0, 0, '2022-06-09 01:44:34', '2022-06-09 10:32:52'),
(78, NULL, 'William Richard', 'richard@william.com', NULL, NULL, '$2y$10$uKp95imyI8yU8ePsTC9Ij.aZEpNVa3T8aYxM5Qi67T08oVvvL2JH6', NULL, 0, 1, '2022-06-09 04:46:01', '2022-06-09 04:46:01'),
(79, NULL, 'BEST BUY CANADA LTD', 'bestbuy@canada.com', NULL, NULL, '$2y$10$HPETy3k5ahqvV13XWZ3ZiOWejmnuY6NOYwly/vpfdn.eeVpjjJJUa', NULL, 0, 1, '2022-06-09 05:31:59', '2022-06-09 05:31:59'),
(80, NULL, 'Canadian Space Agency', 'canada@space.com', NULL, NULL, '$2y$10$v4ZVI3FTUNtdgaQ9cFnDGubDNVhJMan65X8MlzW/CAfc9Miw4MNXm', NULL, 0, 1, '2022-06-11 01:13:51', '2022-06-11 01:13:51'),
(81, NULL, 'Magna International', 'manga@international.com', NULL, NULL, '$2y$10$sunutl2ZqZdHV.4vPuIjsuuo/cRELif7kGShGCoTWDWyF1aO9XwJm', NULL, 0, 1, '2022-06-11 01:29:58', '2022-06-11 01:29:58'),
(82, NULL, 'John William', 'john@gmail.com', NULL, NULL, '$2y$10$HmOpE8aR.ThwQ.wUwqIHJu.B1JR/DctqZ.GrrMmXSlTnpHa5FcLuy', NULL, 0, 1, '2022-06-11 07:45:30', '2022-06-11 07:45:30'),
(83, NULL, 'Eric William', 'eric@william.com', NULL, NULL, '$2y$10$l1HnNUNWZ/Vm5EwAzAcRfO52P.UrC6QxV8bqLq4Q27uWUcf7Ppb5C', NULL, 0, 1, '2022-06-11 07:55:46', '2022-06-11 07:55:46'),
(84, NULL, 'Manga International co', 'manga@co.com', NULL, NULL, '$2y$10$xATkbA6FKMhQw0OeBenKgujS3YIjUw9VsS4i5oW0t/1WnDbB8HVMS', NULL, 0, 1, '2022-06-11 08:02:08', '2022-06-11 08:02:08'),
(85, NULL, 'dasfsdfa', 'sadfasf@dfaf.com', NULL, NULL, '$2y$10$Ni62cgfBvqvKUYkm8EIToO4xZ.qVQ42jBwWKrG/8dADaQujNbG3ha', NULL, 0, 1, '2022-09-02 04:17:24', '2022-09-02 04:17:24'),
(86, NULL, 'dsafdfadsf', 'example1@gmail.com', NULL, NULL, '$2y$10$16J0MKFjKbJ3hE6NEVVqQ.xcMjTYy/MGk3yw9A.SW6s72603glFF6', NULL, 0, 1, '2022-09-02 04:36:11', '2022-09-02 04:36:11'),
(87, NULL, 'dsafdfadsf', 'exam@dfaf.com', NULL, NULL, '$2y$10$7OISB5.tM2Vtbsgv0XJuxuzoj1tD/u0/canAllme1V3.FhatGRRCm', NULL, 0, 1, '2022-09-02 05:39:11', '2022-09-02 05:39:11'),
(88, NULL, 'faizan zahid', 'e@dfaf.com', NULL, NULL, '$2y$10$iFGi1P3HsUW56v.5fplHoOREqj6YnXX3eSftdIEMeAADpQmVc19lm', NULL, 0, 1, '2022-09-02 06:15:50', '2022-09-02 06:15:50'),
(89, 77, 'john c', 'exb@dfaf.com', NULL, NULL, 'asdf1234', NULL, 0, 1, '2022-09-02 06:23:01', '2022-09-02 06:59:33'),
(90, 77, 'john simmons', 'johnsimon@gmail.com', NULL, NULL, '$2y$10$/BWWAghIe94KqKvKS5ubkeJC0LrTr2ftvn4jxxb52xifHjd.zeJ4G', NULL, 0, 1, '2022-09-03 00:08:53', '2022-09-03 00:08:53'),
(91, 77, 'jk simmons', 'jks@gmail.om', NULL, NULL, '$2y$10$PWBwaAbzBAb1Gxdol24qrOWEHvD0Tns/oFDiWF0IQWzlMmzP2OV3.', NULL, 0, 1, '2022-09-03 00:18:11', '2022-09-03 00:18:11'),
(92, 77, 'Richards williams', 'rwilliam@gmail.com', 2, NULL, '12341234', NULL, 0, 1, '2022-09-03 00:23:27', '2022-09-06 04:38:27'),
(93, 77, 'warren buffet', 'wbuffett@gmail.co', 7, NULL, '12341234', NULL, 0, 1, '2022-09-03 04:46:08', '2022-09-03 05:20:22'),
(94, 77, 'elon musk', 'elon@gmail.com', 1, NULL, '$2y$10$i1dgOfqM4iqgsOJmERiNQOdP3ZtO29QsRwHKnEOAvKf2CwNCUmiLK', NULL, 0, 1, '2022-09-03 04:48:13', '2022-09-03 04:48:13'),
(95, 79, 'bill gate', 'bill@gates.co', 8, NULL, '12341234', NULL, 0, 1, '2022-09-03 05:38:20', '2022-09-06 03:54:43'),
(96, NULL, 'INNOVATIVE CONSULTIN ENGINEERS', 'ice@gmail.com', NULL, NULL, '$2y$10$LBWRijheGUUrDT7cU2ImDeBWzWsZaf0v8pEnNQBoylWO7axVo0QCC', NULL, 0, 1, '2022-09-16 06:31:05', '2022-09-16 06:31:05'),
(97, NULL, 'Jack Black', 'jackb@gmail.com', NULL, NULL, '$2y$10$ihoYHn8txKXTGhctnBPr1O3s4yKIANGDL3nX4spwlnaU0Yt2zYP8a', NULL, 0, 1, '2022-09-19 06:01:49', '2022-09-19 06:01:49'),
(98, NULL, 'Jack Black', 'jb@gmail.com', NULL, NULL, '$2y$10$Qc0Kk1UcsEl7IvWFNqN/r.toRpuvz//tC3yazDlf9cuKq/GwLAum2', NULL, 0, 1, '2022-09-19 06:09:27', '2022-09-19 06:09:27'),
(99, NULL, 'Anthony Mackie', 'am@gmail.com', NULL, NULL, '$2y$10$MFWOdsNP8NJEpmVHJlDkie/DWT3tHhKBVkFuNSWfculikol6DNpAG', NULL, 0, 1, '2022-09-19 06:23:40', '2022-09-19 06:23:40'),
(100, NULL, 'Megan ray', 'mray@gmail.com', NULL, NULL, '$2y$10$NOI86TKNb9fK46QDgz9VuerwFbjC70Ket4vTn5QhSIPx1IBlFIXXK', NULL, 0, 1, '2022-09-19 06:51:47', '2022-09-19 06:51:47'),
(101, NULL, 'john simmons', 'jks@gmail.com', NULL, NULL, '$2y$10$Yh7WtFuFnqiB90afHmu3Nexe8scYZRtttQ6te5iP9M.gbXYrfJC7e', NULL, 0, 1, '2022-09-19 07:39:31', '2022-09-19 07:39:31'),
(102, NULL, 'Adelsen', 'adelsen@gmail.com', NULL, NULL, '$2y$10$0nvJSqkmWSDYAUZRCUcgyO26cp35nf/MHvNjPNITBo1S4Z/A/8wjW', NULL, 0, 1, '2022-09-22 05:32:36', '2022-09-22 05:32:36'),
(103, NULL, 'Adelsen', 'adelsen2@gmail.com', NULL, NULL, '$2y$10$MOJDItRy.f48UD4t.6EbUOgh44QXy5bddA6PGYV4ihJ44Hvqfy4xO', NULL, 0, 1, '2022-09-22 06:01:07', '2022-09-22 06:01:07'),
(104, NULL, 'Adelsen', 'adelsen3@gmail.com', NULL, NULL, '$2y$10$BOCgxUfcxxbTKCI3AEpZDuLKNAQN0b0EFCfMEjP/9p9yqzqiaSHKi', NULL, 0, 1, '2022-09-22 06:01:53', '2022-09-22 06:01:53'),
(106, NULL, 'Pinnacle', 'p@gmail.com', NULL, NULL, '$2y$10$LDBcW47Bvp2oGnG6nKz3MOz53gi/pTzkrlRAi9PPwb9Pl2PSvF1l.', NULL, 0, 1, '2022-09-26 03:22:36', '2022-09-26 03:22:36'),
(107, NULL, 'Dennis Ritchie', 'dritchie@gmail.com', NULL, NULL, '$2y$10$lycaPe7JUj.uYG7yanSqZO8orCMzYhfb0JGTtP5EOE2PuyEn2Mn5m', NULL, 0, 1, '2022-09-26 03:33:20', '2022-09-26 03:33:20'),
(108, NULL, 'Salt Financial', 'saltfinancial@gmail.com', NULL, NULL, '$2y$10$aERzKeUThGOp6XLwmVjstOv2Kr6LbgM/fIEJ.6YI5FIUio4eZeJwG', NULL, 0, 1, '2022-09-26 04:22:27', '2022-09-26 04:22:27'),
(110, NULL, 'Deloitte', 'deloitte@gmail.com', NULL, NULL, '$2y$10$rA824MzC5WLXQvAOs..HnORze209N55zM/MDgWpCHw1a0W/kFHaeq', NULL, 0, 1, '2022-09-26 05:05:54', '2022-09-26 05:05:54'),
(111, NULL, 'Guido van Rossum', 'gvrossum@gmail.com', NULL, NULL, '$2y$10$oXa2kxnkoZXXeeKpD2yR4.ESztQojCKgNl90PO9522m/Z6H5vV8Zy', NULL, 0, 1, '2022-09-26 06:32:22', '2022-09-26 06:32:22'),
(112, 1, 'Tim Berners Lee', 'timlee@gmail.com', 9, NULL, '1234asdf', NULL, 0, 1, '2022-09-27 05:08:13', '2022-09-27 05:08:47'),
(113, NULL, 'Brendan Eich', 'brendan@gmail.com', NULL, NULL, '$2y$10$8uab/eCtRe1cOe2jvIdjheRieo9NRt155hr73mvhXkVDw7RA5JRku', NULL, 0, 1, '2022-09-27 05:11:06', '2022-09-27 05:11:06'),
(114, NULL, 'Taylor Otwell', 'otwell@gmail.com', NULL, NULL, '$2y$10$k2c8.sQPaqlvUJ1MSCNCp./4ljVEdVA9ZpT76.i6WYmbG4OyvRWSa', NULL, 0, 1, '2022-09-27 05:12:44', '2022-09-27 05:12:44'),
(115, NULL, 'TELUS Communications Inc', 'telus.co@gmail.com', NULL, NULL, '$2y$10$jEdP4hdIFUibwR1X3plXn.QBMm14XKG1peidbiFqyy4/BMILkZ2ru', NULL, 0, 1, '2022-10-01 02:02:44', '2022-10-01 02:02:44'),
(116, NULL, 'The Headhunters', 'headhunters@gmail.com', NULL, NULL, '$2y$10$D8H/bUHPflUEqvl3XOJJIuxRu/ucnhf4qM4GB3BaIlGCShR4YkMIe', NULL, 0, 1, '2022-10-01 02:08:04', '2022-10-01 02:08:04'),
(117, NULL, 'Shania Twain', 'shania12@gmail.com', NULL, NULL, '$2y$10$Fk.ZIHCHz5oPwDykWElAAOi.cT0iT8AMpUzBdkPOM.u3bpXgzdZC.', NULL, 0, 1, '2022-10-19 06:33:27', '2022-10-19 06:33:27'),
(118, NULL, 'william harper', 'wrharper@gmail.com', NULL, NULL, '$2y$10$V0gteXHHQ6tUOrhWQodh0O/TxWG99VQhbPI4CVSmQcVD2KUDLVaQa', NULL, 0, 1, '2022-10-19 07:08:53', '2022-10-19 07:08:53'),
(119, NULL, 'stephen holstrom', 'stephen@gmail.com', NULL, NULL, '$2y$10$qQEKeyDA7uKOvU0ErOyZMOTahfGkBpMcX4jk58aAdkqwDS9x.dgb.', NULL, 0, 1, '2022-10-28 08:38:10', '2022-10-28 08:38:10'),
(120, NULL, 'timothi calamet', 'timothipark@gmail.com', NULL, NULL, '$2y$10$XuzoPDLQfJmsybaq17v08euVQ8ux0.pUoJzfhGMt4IcOzbFSeyclG', NULL, 0, 1, '2022-10-28 23:40:38', '2022-10-28 23:40:38'),
(121, NULL, 'jhhfjs jfhjdfsh', 'jksda@gmail.com', NULL, NULL, '$2y$10$cce72z63SQ13HLLyw3Iv3.GD4USxJS0BqD2jfdUVvgr1i/bVBIM.G', NULL, 0, 1, '2022-10-29 00:03:22', '2022-10-29 00:03:22'),
(122, NULL, 'rowan park', '`rowan@gmail.com', NULL, NULL, '$2y$10$RD5vmb6VcR9BCuy5RDA.6e5UeNLGTTOtNrkOC6PS/MBKRoPg77Rh2', NULL, 0, 1, '2022-10-29 00:14:52', '2022-10-29 00:14:52'),
(126, NULL, 'Oginnf Opfrf', '1471780139', NULL, NULL, '$2y$10$2eWNxBqukPDedRen3JFkrezBOlRnCCMZLWZOZtkzh3XI5hF0yle7u', NULL, 0, 1, '2022-11-01 11:15:29', '2022-11-01 11:15:29'),
(127, NULL, 'Safun fmstgrdfm', 'ShRun_RmsterrRm@RRhoo.com', NULL, NULL, '$2y$10$aBC.3Ne6JCYT7EM/0CqA2.DvzXsOi0wqSpKspvLSyi7Hlc.59TAKK', NULL, 0, 1, '2022-11-01 11:15:30', '2022-11-01 11:15:30'),
(128, NULL, 'Mfrio Pfyng', 'mRrioj41643@RRhoo.com', NULL, NULL, '$2y$10$M4O0fz1S9D6k5YB8KlDeVOppbJbRl2oOjJxu/8lcq.3wzdtk/s2ci', NULL, 0, 1, '2022-11-01 11:15:30', '2022-11-01 11:15:30'),
(129, NULL, 'Judfa mfrk Sonnylfl', 'jurRhsonnRlRl@hotmRil.com', NULL, NULL, '$2y$10$f7MHtlROimTKazGYr4TqEepA7KG1IKOfRQZIbOgUIdrqLB86NnqHq', NULL, 0, 1, '2022-11-01 11:15:30', '2022-11-01 11:15:30'),
(130, NULL, 'gflwfn Singa', 'gRlwRnsroRe@RRhoo.com', NULL, NULL, '$2y$10$JC.w0KZ5jkGEifS8o2v4ZOug4dq8VouRWtdmJuPF92ZJwPob0IQt.', NULL, 0, 1, '2022-11-01 11:15:30', '2022-11-01 11:15:30'),
(131, NULL, 'Nfring Singa (Tgngrf)', 'nsingh.tengrR@RRhoo.com, nsingh.ksi@gell.net', NULL, NULL, '$2y$10$sURz/FLm5hRyg7xYz.xbIuf8//L3ZmotV2m2LKb.k5WxLv/yI.PS.', NULL, 0, 1, '2022-11-01 11:15:30', '2022-11-01 11:15:30'),
(132, NULL, 'Gurpfrtfp Singa', 'jollR.singh64@RRhoo.com', NULL, NULL, '$2y$10$q1frSOy8D0NSPqF1qHKyM.P0vc46yAOzKLf7d/npGVfon8/fz.RCe', NULL, 0, 1, '2022-11-01 11:15:30', '2022-11-01 11:15:30'),
(133, NULL, 'afrsimrfn Singa', 'singhsimrRn1418@RRhoo.com', NULL, NULL, '$2y$10$DP73U8ojqtdeXQPx07OZcO62LmgQXaZcRg4/DQoPS4nfQtwKF2RXy', NULL, 0, 1, '2022-11-01 11:15:30', '2022-11-01 11:15:30'),
(134, NULL, 'Kirpfldggp Virk', 'virkkirpRl99@RRhoo.com', NULL, NULL, '$2y$10$Cc2szoxrqEylZn.RqG32l..PDsY.0AEK1/NTzPvn8Uv7ug8iQ.EBO', NULL, 0, 1, '2022-11-01 11:15:30', '2022-11-01 11:15:30'),
(135, NULL, 'Kfrnpindgr Gill', 'kpgill111@RRhoo.com', NULL, NULL, '$2y$10$LvXK1vkvPCEZWcgcpaGRh.6Adh030xPDKADytpjpMFP8HEB7H1pnO', NULL, 0, 1, '2022-11-01 11:15:30', '2022-11-01 11:15:30'),
(136, NULL, 'Josg Soto Florgs', 'joseflorestoronto1@iclour.com', NULL, NULL, '$2y$10$efHCWdlOfDVOZmoybPwt7.ErYnaeUEudAz2h9pW0nPl6pxGLS.dDW', NULL, 0, 1, '2022-11-01 11:15:30', '2022-11-01 11:15:30'),
(137, NULL, 'Sygd Kfmrfn fkgfr', 'kRmrRnRkgRr81@RRhoo.com', NULL, NULL, '$2y$10$68DsL8sebDjitqm3YEGn2.B3.X5VE/BLgSclMpm..Oo3O2tZepLXW', NULL, 0, 1, '2022-11-01 11:15:30', '2022-11-01 11:15:30'),
(138, NULL, 'Roait frorf', 'rohitRrorR12363@RRhoo.com', NULL, NULL, '$2y$10$zHwco3IXcw7TK296N3n81uSsM2KsvIN6TQNjWfTESQ1KnTD.huChm', NULL, 0, 1, '2022-11-01 11:15:31', '2022-11-01 11:15:31'),
(139, NULL, 'Kfrtik Safrmf', 'shRrmRkRrtik7860@RRhoo.com', NULL, NULL, '$2y$10$fssaDunAtQMKGBWBm1G59.osL8Lzm6WoRm5Qb8ijHlEefO0LoZgOa', NULL, 0, 1, '2022-11-01 11:15:31', '2022-11-01 11:15:31'),
(140, NULL, 'rishr Wrsim', 'rishr0308@hotcril.cr', NULL, NULL, '$2y$10$zjlduXuKn49MAZslNyvfsemoZEmVSmO8pQQXKUboy0/NFQC8Q5jNO', NULL, 0, 1, '2022-11-01 11:15:31', '2022-11-01 11:15:31'),
(141, NULL, 'Nrvjet Krur', 'arvdhrliwrl1998@gcril.coc', NULL, NULL, '$2y$10$no7qtNtG/mvcmlwInghGqeaSaIrb4ILINe9m/p8fWbaehJzwG4Ane', NULL, 0, 1, '2022-11-01 11:15:31', '2022-11-01 11:15:31'),
(142, NULL, 'Rrmrnpreet Gill', 'rgill9843@gcril.coc', NULL, NULL, '$2y$10$BFqxoOr12AKKq3/QdLy73eAZVCh8NxWKxUt4c1BYO2YWrzf5EeQ6G', NULL, 0, 1, '2022-11-01 11:15:31', '2022-11-01 11:15:31'),
(143, NULL, 'rshley ewyer', 'rshlaydwyar1987@gcril.coc', NULL, NULL, '$2y$10$/MaMzEdWxeT/O5zTYDfTxem4VcbBMxWHTdkhATH72s7HzrrJWpEyG', NULL, 0, 1, '2022-11-01 11:15:31', '2022-11-01 11:15:31'),
(144, NULL, 'Irene rnrne', 'Iraraaguc@hotcril.coc', NULL, NULL, '$2y$10$g99HqXXCDllE3M3qCOcVeOfedvU6Hon5rPpLXFUm9.fsde8mPNZUm', NULL, 0, 1, '2022-11-01 11:15:31', '2022-11-01 11:15:31'),
(145, NULL, 'Veree Mereminshy', 'vsrr689145@hotcril.coc', NULL, NULL, '$2y$10$LEtISeOcLK7.YuBLfSlDQujrwrCheWo3DPZoeBRx.J3RYBFDgjJBu', NULL, 0, 1, '2022-11-01 11:15:31', '2022-11-01 11:15:31'),
(146, NULL, 'Jimrrt Krur', 'jicrrtkrur96@gcril.coc', NULL, NULL, '$2y$10$WR65xj9ZoW8lTxXUHe1ew..9ZpsyobSJQ.lzQHV1wYT9HOcvxAWsG', NULL, 0, 1, '2022-11-01 11:15:31', '2022-11-01 11:15:31'),
(147, NULL, 'Hrrpreet Krur (Tiwrnr)', 'hrrpraattiwrar464@gcril.coc', NULL, NULL, '$2y$10$Hne.2hxsoSDCN60ehioGEeP5Gb80hVDP2jJ5uOi5uNCH.KfAWGgYi', NULL, 0, 1, '2022-11-01 11:15:31', '2022-11-01 11:15:31'),
(148, NULL, 'riney eeyle', 'doylacj@hotcril.coc', NULL, NULL, '$2y$10$sPXvQqmswyVsBBMl8T/X9.GbSDGHuYMB8CTZElGWf8YiYhd5uiXaO', NULL, 0, 1, '2022-11-01 11:15:31', '2022-11-01 11:15:31'),
(149, NULL, 'rrsheeep Krur (Srnehu)', 'rrshdaapkrur31313@gcril.coc', NULL, NULL, '$2y$10$jGKgkjkXWXVSpf3bylOOZeVn1jySnGCQqNjiXsJnfEkVKrsY8DJhe', NULL, 0, 1, '2022-11-01 11:15:32', '2022-11-01 11:15:32'),
(150, NULL, 'Rrneeep Krur Mrngrt', 'cragrtrradaap194@gcril.coc', NULL, NULL, '$2y$10$aM4/0QLs21imh/ysLB.90.4I0wVC8w9BqZ2f/hAUlADn3OXUuAbzy', NULL, 0, 1, '2022-11-01 11:15:32', '2022-11-01 11:15:32'),
(151, NULL, 'Shreene Spenre', 'shrdaaaspaaca2@gcril.coc', NULL, NULL, '$2y$10$2mOCWb4rRaVYeCk6TzLOs.t5dq940kvGj8x3am3ISBaVjtGqyUAyG', NULL, 0, 1, '2022-11-01 11:15:32', '2022-11-01 11:15:32'),
(152, NULL, 'Jrpneet Krur', 'jrpaaatpraau419@gcril.coc', NULL, NULL, '$2y$10$wlmwxAeqzgI9vgjQHbrACOm8lCsUN6Q3AFE4tx7NOpk0/sM5gKGqy', NULL, 0, 1, '2022-11-01 11:15:32', '2022-11-01 11:15:32'),
(153, NULL, 'Nrveeep Krur', 'arvdaap.physiotharrpist@gcril.coc', NULL, NULL, '$2y$10$.xlw9iMtA7Yf.qLsYLn3sejd4809v/CG9juTnhI9FJRG2ORH95jOa', NULL, 0, 1, '2022-11-01 11:15:32', '2022-11-01 11:15:32'),
(154, NULL, 'Jrsmeet Krur', 'jk832661@gcril.coc', NULL, NULL, '$2y$10$TSUvk30ZCQ5w76bcNXZ2Ie1HzVF/7ps7oONpiOw0BXd45GaQvgPoK', NULL, 0, 1, '2022-11-01 11:15:32', '2022-11-01 11:15:32'),
(155, NULL, 'Veerprl Krur', 'sidhuvaarprl678@gcril.coc', NULL, NULL, '$2y$10$RYx/PMAvd/AX.vzdH8qEoeL3zBQxLq6X1Mvtqxb1w94IHP1Vljzqy', NULL, 0, 1, '2022-11-01 11:15:32', '2022-11-01 11:15:32'),
(156, NULL, 'Nrvreet Krur', 'arvsicrr88@gcril.coc', NULL, NULL, '$2y$10$GmEKrUvBodAOKGjLA9m3V.XxgKY0XpOmj0s811TcHXF3rowItR5Iq', NULL, 0, 1, '2022-11-01 11:15:32', '2022-11-01 11:15:32'),
(157, NULL, 'Mrlene Mrrtin Prtsy ', 'cclaraprtsy73@gcril.coc', NULL, NULL, '$2y$10$26NY7sYESAZNruP2gEeIRO.qB4bqEM2xZU8zBx3By4p3Gv3Qf9Iqa', NULL, 0, 1, '2022-11-01 11:15:32', '2022-11-01 11:15:32'),
(158, NULL, 'oindx Oseyesi', 'funmioseyemi@yihoo.com', NULL, NULL, '$2y$10$/jBfaQ2OMSOUCUhG9q/SmuVLAURdHQj3O8TNM4b7gLEFwKn/JnlmG', NULL, 0, 1, '2022-11-01 11:15:32', '2022-11-01 11:15:32'),
(159, NULL, 'siycxeo Dookie', 'mike_dookie@hotmiil.com', NULL, NULL, '$2y$10$JTK3GB5Z8PTK24m3klJfl.jUQ4hgvv1sngPTRd0/57UtQFC.kFe8u', NULL, 0, 1, '2022-11-01 11:15:32', '2022-11-01 11:15:32'),
(160, NULL, 'cxnx Sceikc', 'hinisheikh9105@hotmiil.com', NULL, NULL, '$2y$10$kvlVmE1FQ7zuH4utALY95ewbh16ufJ1Cv24y8/n2weETMkYB3WosG', NULL, 0, 1, '2022-11-01 11:15:33', '2022-11-01 11:15:33'),
(161, NULL, 'cxspseet Kxus', 'hkiur.1989@yihoo.com', NULL, NULL, '$2y$10$sajW9XmoSVpG5OmIlIp9teDzwJJ6cWON76vWXJeKzXvgQhUfEJk2S', NULL, 0, 1, '2022-11-01 11:15:33', '2022-11-01 11:15:33'),
(162, NULL, 'Kuodeep kxus Kxus', 'kiurdeexkulu@hotmiil.com', NULL, NULL, '$2y$10$Cg4CRY6YPIcKAT5txP59YefMzYFodC9bbocgbRCMdMEF.oBzSxmAu', NULL, 0, 1, '2022-11-01 11:15:33', '2022-11-01 11:15:33'),
(163, NULL, 'cxspseet cxspseet', 'hixxy000virk000@hotmiil.com', NULL, NULL, '$2y$10$SGlWFCcD98qb5WryEdzGv.46NjacpJahSBJWoBqkwGAKyW38N2GTa', NULL, 0, 1, '2022-11-01 11:15:33', '2022-11-01 11:15:33'),
(164, NULL, 'Bibi xooi', 'illi_sheik@hotmiil.com', NULL, NULL, '$2y$10$p/Zwc5HgqOT/W2D6Bo2ZGOM.N9LFWANpna7OtPOk7iFnLP.h7fmga', NULL, 0, 1, '2022-11-01 11:15:33', '2022-11-01 11:15:33'),
(165, NULL, 'Niscx sosxnx', 'nishirorini28@hotmiil.com', NULL, NULL, '$2y$10$G.oG81nbMdSE5SrY2ce.1.Gp/fywdc3SWkssVO0STIRxjQKNZvq4.', NULL, 0, 1, '2022-11-01 11:15:33', '2022-11-01 11:15:33'),
(166, NULL, 'Nxsendsx Kxtxsneni', 'nirxhoenix@icloud.com', NULL, NULL, '$2y$10$iKf0T8YZvH2qpT1QJD.IuuI5CECg1WWyWZgNiEUcfxgNfICqtcT.q', NULL, 0, 1, '2022-11-01 11:15:33', '2022-11-01 11:15:33'),
(167, NULL, 'susoeen sioo', 'rurleen32188@hotmiil.com', NULL, NULL, '$2y$10$EC.EGTh3nYwbm1AFYcLgMuUYdcqqQsfMytvn7hATXOY.IAWXTSzOO', NULL, 0, 1, '2022-11-01 11:15:33', '2022-11-01 11:15:33'),
(168, NULL, 'sxnpseet Kxus', 'kminxreet9090@hotmiil.com', NULL, NULL, '$2y$10$FKUdruBSaAZS2.XGAqsG3.Yn4.Uxs5BJY9aNRpt2/aOkvN.8w8bI2', NULL, 0, 1, '2022-11-01 11:15:33', '2022-11-01 11:15:33'),
(169, NULL, 'Bcxvjot sinsc', 'bhivtottoor543@hotmiil.com', NULL, NULL, '$2y$10$Gd5hMRkQegyU2JdNc680pOS0ZgfQ/iVJ7Ph359iuEtiRiF2uoRgom', NULL, 0, 1, '2022-11-01 11:15:33', '2022-11-01 11:15:33'),
(170, NULL, 'sxusxv sxusxv', 'riuriv19981008@hotmiil.com', NULL, NULL, '$2y$10$vP0RIynwmviHyavqeNSDoOva2j1MSJCRsSikynCYCPMbIT0wpZrfa', NULL, 0, 1, '2022-11-01 11:15:33', '2022-11-01 11:15:33'),
(171, NULL, 'Sxcxdxi sxspessxud', 'Shintirimxersiud54@hotmiil.com', NULL, NULL, '$2y$10$bSsdMicRdjuSm.daulUuxenP29yixkvrYMeAfIZuPJwP/cAIW9DTS', NULL, 0, 1, '2022-11-01 11:15:34', '2022-11-01 11:15:34'),
(172, NULL, 'Susxnpseet Sinsc', 'ivnoorvirk2016@hotmiil.com', NULL, NULL, '$2y$10$2F9G6QqUdhaniuXWXzG1YO6duseJ5G5a3M8/Hm38dE2An3VpfCfZ6', NULL, 0, 1, '2022-11-01 11:15:34', '2022-11-01 11:15:34'),
(173, NULL, 'Jxneooe Ssitc', 'tinelletcss@hotmiil.com', NULL, NULL, '$2y$10$Or1x5PVR3pRIeaqkPGE6yOtH28YZiy80n0XcFjz19DRxlfvvZfOwq', NULL, 0, 1, '2022-11-01 11:15:34', '2022-11-01 11:15:34'),
(174, NULL, 'sxnkxsxnjeet Kxus', 'minkirinteetkiur1@hotmiil.com', NULL, NULL, '$2y$10$KIEBbmzwcl/2XhiIPwknwu84m61f6eEvn9XcDGymsLzhNWnFjUUqq', NULL, 0, 1, '2022-11-01 11:15:34', '2022-11-01 11:15:34'),
(175, NULL, 'sxnindes Kxus', 'mininderbisri96@hotmiil.com', NULL, NULL, '$2y$10$HFtTqAkqRTnNNQRG6ZcuCeEujydLUMfN8M.OzFgA4LXUuiii0IrCa', NULL, 0, 1, '2022-11-01 11:15:34', '2022-11-01 11:15:34'),
(176, NULL, 'suspindes sinsc Jxtxnx', 'rurxindertitini003@hotmiil.com', NULL, NULL, '$2y$10$F5cNMVR0GCuHy6Q9lemBoeCPxFK9aM.oE/XdD40BZ2X2gvysSOBye', NULL, 0, 1, '2022-11-01 11:15:34', '2022-11-01 11:15:34'),
(177, NULL, 'xvtxs Sinsc', 'ivtirsinrhis064@hotmiil.com', NULL, NULL, '$2y$10$M5kadxvqpmClZfhQ7hs43.zsWW9h.nD/QUCRVwoqr8MnJlgaqdLHO', NULL, 0, 1, '2022-11-01 11:15:34', '2022-11-01 11:15:34'),
(178, NULL, 'sxsxndeep Kxus', 'kdeexririn328@hotmiil.com', NULL, NULL, '$2y$10$LBmuqBs7.EbJ7v5S2FvnA.C6XElRXGK2cVPcvM4d6sxqkigvVTpGW', NULL, 0, 1, '2022-11-01 11:15:34', '2022-11-01 11:15:34'),
(179, NULL, 'Nxsceeb kxus Sxndcu', 'sindhunishu2084@hotmiil.com', NULL, NULL, '$2y$10$uWIyWZzZHTYI6ErQdrfxtuohH3gok32jxnxsSUxkklA3YHKiE0736', NULL, 0, 1, '2022-11-01 11:15:34', '2022-11-01 11:15:34'),
(180, NULL, 'sxnjindes Kxus', 'Mintinderfzr193@hotmiil.com', NULL, NULL, '$2y$10$YIS0en5bDME2DE0fW7Af/ulAEsQn.r/py0LGlhoN7hPU5VZIsgLzi', NULL, 0, 1, '2022-11-01 11:15:34', '2022-11-01 11:15:34'),
(181, NULL, 'Scubcxs Dcisxn', 'dhimin22.sd@hotmiil.com', NULL, NULL, '$2y$10$78od8OkEyjc7/6fhbskOducuI34b62nNPZSKnkdglQS7Ra5vQeZRq', NULL, 0, 1, '2022-11-01 11:15:34', '2022-11-01 11:15:34'),
(182, NULL, 'Nikitx Nikitx', 'nikitisiin344@hotmiil.com', NULL, NULL, '$2y$10$ajurSKttZWNHN6aaPIBliuPVvLk5MDy/SNCn5n6OpUQ55aJvtcnB6', NULL, 0, 1, '2022-11-01 11:15:35', '2022-11-01 11:15:35'),
(183, NULL, 'sxsxndeep Kxus', 'deexminoor166.rd@hotmiil.com', NULL, NULL, '$2y$10$jvTpSfgZ16G77/6/xlU2Hew5hWlYfSZt0Lx4LQh1jV0/qbgs3R66y', NULL, 0, 1, '2022-11-01 11:15:35', '2022-11-01 11:15:35'),
(184, NULL, 'Kxstik Scxssx', 'shirmikirtik7860@hotmiil.com', NULL, NULL, '$2y$10$L6PNY4usKS9orz8GG/N9v.M.EFgLhGDIIh0eWpZWEL2bIIHrRxmFW', NULL, 0, 1, '2022-11-01 11:15:35', '2022-11-01 11:15:35'),
(185, NULL, 'xkxnkscx xkxnkscx', 'isikinkshi8400@hotmiil.com', NULL, NULL, '$2y$10$fj84yWEos9na9yjO/BVnFuIJITVIC5CjaNfd97pgzjCBZj4ymFAqW', NULL, 0, 1, '2022-11-01 11:15:35', '2022-11-01 11:15:35'),
(186, NULL, 'xkxscdeep kxus', 'deexikish73346@hotmiil.com', NULL, NULL, '$2y$10$N7J5i.Lk2qDL4YcLz5HvOe52GgZV8mVc.kXEVWwKIPRIJnVHJYTWW', NULL, 0, 1, '2022-11-01 11:15:35', '2022-11-01 11:15:35'),
(187, NULL, 'Nxvjot Kxus', 'kiurn8098@hotmiil.com', NULL, NULL, '$2y$10$DacKAumTi.tvzyouJunV6ezEdmRnnwsqDVM9GCRTUBnxMfmofjHlK', NULL, 0, 1, '2022-11-01 11:15:35', '2022-11-01 11:15:35'),
(188, NULL, 'test sukhveer', 'testsukhveer@gmail.com', NULL, NULL, '$2y$10$cL7eNmeDlmaNvMq6A3cTPOaUflddezO0tLhAMlk8o7cPTsQC5RqPC', NULL, 0, 1, '2022-11-02 11:47:16', '2022-11-02 11:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `users_permissions`
--

CREATE TABLE `users_permissions` (
  `user_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(188, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `logo_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `registeration_Date` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `employee_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `middle_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `province_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `pin_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `birth_date` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `home_contact` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(250) CHARACTER SET utf16 COLLATE utf16_croatian_ci DEFAULT NULL,
  `state` int DEFAULT NULL,
  `postal_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dd_chq` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `vaccination` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `no_call_reason` varchar(250) CHARACTER SET utf16 COLLATE utf16_croatian_ci DEFAULT NULL,
  `emg_ct_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `emg_ct_rel` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `emg_ct_phone` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `work_experience` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `job_title_id` int DEFAULT NULL,
  `job_type` int DEFAULT NULL,
  `day_availability` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `time_availability` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `registration_mode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `residence_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `internal_notes` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `notes` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `work_category` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sin_number` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sin_expire` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `driver_license` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transportation_mode` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `own_car` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `languages` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `education_history` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `employment_history` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `bank_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `account_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ifsc_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `belongs_to` int DEFAULT NULL,
  `relation_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `interest` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `logo_path`, `registeration_Date`, `employee_id`, `first_name`, `middle_name`, `last_name`, `address`, `province_id`, `city_id`, `pin_code`, `birth_date`, `gender`, `phone`, `home_contact`, `city`, `state`, `postal_code`, `dd_chq`, `vaccination`, `no_call_reason`, `emg_ct_name`, `emg_ct_rel`, `emg_ct_phone`, `work_experience`, `job_title_id`, `job_type`, `day_availability`, `time_availability`, `registration_mode`, `residence_type`, `internal_notes`, `notes`, `work_category`, `sin_number`, `sin_expire`, `driver_license`, `transportation_mode`, `own_car`, `languages`, `education_history`, `employment_history`, `bank_name`, `account_number`, `ifsc_code`, `plan_id`, `belongs_to`, `relation_type`, `created_by`, `interest`, `created_at`, `updated_at`) VALUES
(3, 73, '', NULL, NULL, 'Billy', 'Aaron', 'Brown', '40 Street, Stettler, Ab, Canada', NULL, NULL, NULL, '1989-03-12', 1, '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'joradan', 'brother', '10000', NULL, 3, NULL, '[\"morning\"]', '[\"weekdays\"]', NULL, NULL, NULL, NULL, NULL, '756605192', NULL, '6543019', NULL, 'no', NULL, '[{\"education\":\"2\",\"course\":\"3\",\"certificate\":\"3\"}]', '[{\"old_company\":\"Abacus\",\"old_job_title\":\"3\",\"old_job_type\":\"4\"}]', 'Bank of Canada', '10002909934390', 'BkoC0007', NULL, NULL, NULL, 1, '[\"fulltime\"]', '2022-06-06 04:54:28', '2022-06-11 11:57:47'),
(4, 74, '', NULL, NULL, 'Sarah', 'Jessica', 'Parker', '47 A , Park Avenue, canda', NULL, NULL, NULL, '1991-01-01', 2, '0123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'john', 'friend', '100', NULL, 19, NULL, '[\"morning\"]', '[\"weekdays\"]', NULL, NULL, NULL, NULL, NULL, '502313801', NULL, '00000000001', NULL, 'no', NULL, '[{\"education\":\"3\",\"course\":\"3\",\"certificate\":\"3\"}]', '[{\"old_company\":\"Power Corporation of Canada\",\"old_job_title\":\"6\",\"old_job_type\":\"10\"}]', 'Central Bank of Canada', '0000000000012345', 'CBI006000', NULL, NULL, NULL, 1, '[\"oncall\",\"parttime\"]', '2022-06-06 07:17:17', '2022-06-07 08:02:12'),
(5, 75, '', NULL, NULL, 'Erik', 'Per', 'Sullivan', '379 School Lane DORCHESTER DT36 4AS', NULL, NULL, NULL, '1992-12-12', 1, '0011223344', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Harris', 'uncle', '200', NULL, 12, NULL, '[\"morning\",\"afternoon\",\"evening\"]', '[\"weekdays\",\"weekends_holidays\"]', NULL, NULL, NULL, NULL, NULL, '22001123', NULL, '980912009', NULL, 'no', NULL, '[{\"education\":\"1\",\"course\":\"1\",\"certificate\":\"1\"}]', '[{\"old_company\":\"Larsen and Toubro\",\"old_job_title\":\"1\",\"old_job_type\":\"2\"}]', 'State Bank of Canada', '200000012000', 'SBI0090002', NULL, NULL, NULL, 1, '[\"parttime\",\"fulltime\"]', '2022-06-06 12:07:37', '2022-06-07 07:59:59'),
(6, 78, 'profile_images/1654769760.jpg', NULL, NULL, 'William', 'T', 'Richard', '1229 Dundas St W, Toronto, Ontario', NULL, NULL, NULL, '1985-03-12', 1, '4165312123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Paul', NULL, NULL, NULL, 2, NULL, '[\"morning\",\"afternoon\",\"evening\"]', '[\"weekends_holidays\"]', NULL, NULL, NULL, NULL, NULL, '234', NULL, '12341234', NULL, 'on', NULL, '[{\"education\":\"2\",\"course\":\"3\",\"certificate\":\"3\"}]', '[{\"old_company\":\"infosis\",\"old_job_title\":\"3\",\"old_job_type\":\"4\"}]', 'Union bank of Canada', '0122000234134343', 'UBC00001', 12, NULL, NULL, 1, '[\"oncall\"]', '2022-06-09 10:16:01', '2022-06-09 10:16:01'),
(7, 82, 'profile_images/1654953330.jfif', NULL, NULL, 'John', 'Doe', 'William', '1 B golden street , ontario, canada', NULL, NULL, NULL, '1968-02-12', 1, '9078784734', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Henri', NULL, NULL, NULL, 4, NULL, '[\"afternoon\"]', '[\"weekdays\"]', NULL, NULL, NULL, NULL, NULL, '34343', NULL, '545435345', NULL, NULL, NULL, '[{\"education\":\"2\",\"course\":\"2\",\"certificate\":\"2\"}]', '[{\"old_company\":\"Manga co.\",\"old_job_title\":\"3\",\"old_job_type\":\"6\"}]', 'Canada Bank', '9395000348785', 'cnd0003', 13, NULL, NULL, 79, '[\"parttime\"]', '2022-06-11 13:15:30', '2022-06-11 13:15:53'),
(8, 83, 'profile_images/1654953945.png', NULL, NULL, 'Eric', 'Dan', 'William', '47A street park , toronto', NULL, NULL, NULL, '1992-09-12', 1, '890878787', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Haris', NULL, NULL, NULL, 6, NULL, '[\"morning\",\"evening\"]', '[\"weekends_holidays\"]', NULL, NULL, NULL, NULL, NULL, '343434', NULL, '31654656', NULL, 'on', NULL, '[{\"education\":\"1\",\"course\":\"1\",\"certificate\":\"2\"}]', '[{\"old_company\":\"Abacus co.\",\"old_job_title\":\"2\",\"old_job_type\":\"5\"}]', 'canada bank', '123425234', 'cbo00007', 12, NULL, NULL, 77, '[\"parttime\",\"fulltime\"]', '2022-06-11 13:25:46', '2022-06-11 13:25:46'),
(9, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-19 11:31:49', '2022-09-19 11:31:49'),
(10, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-19 11:39:27', '2022-09-19 11:39:27'),
(11, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-19 11:53:41', '2022-09-19 11:53:41'),
(12, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-19 12:21:47', '2022-09-19 12:21:47'),
(13, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-19 13:09:31', '2022-09-19 13:09:31'),
(14, 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-26 09:03:20', '2022-09-26 09:03:20'),
(15, 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-26 12:02:23', '2022-09-26 12:02:23'),
(16, 117, '', NULL, NULL, 'Shania', 's', 'Twain', NULL, NULL, NULL, NULL, '47A elm street', 1, '1234123412', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vanessa wayne', 'Mother', '54243554', NULL, 6, NULL, '[\"afternoon\"]', '[\"weekdays\"]', NULL, NULL, NULL, NULL, NULL, '313451334', NULL, '345134', NULL, 'no', NULL, '[{\"education\":\"1\",\"course\":\"2\",\"certificate\":\"3\"}]', '[{\"old_company\":\"salt international\",\"old_job_title\":\"4\",\"old_job_type\":\"3\"}]', 'union of canada', '000010034340', '3434jsdf', 4, NULL, NULL, 1, '[\"oncall\",\"fulltime\"]', '2022-10-19 12:03:27', '2022-10-19 12:03:27'),
(17, 121, '', '1344-04-12', '234132', 'jhhfjs', 'hjdfhj', 'jfhjdfsh', 'kafskdfj', NULL, NULL, NULL, '42398-03-09', 2, '89348237', '8472387', '10110', 663, '92348392', '1', 'vaccinated', 'jksajf', 'jalfj', 'jkasdfs', '93849', NULL, 3, NULL, '[\"afternoon\"]', '[\"weekends_holidays\"]', '1', '2', NULL, NULL, NULL, '243524', '3245-05-24', '25345', '2', 'yes', '[\"english\",\"hindi\",\"punjabi\"]', '[{\"education\":\"1\",\"course\":\"1\",\"certificate\":\"1\"}]', '[{\"old_company\":\"fsadfadsf\",\"old_job_title\":\"2\",\"old_job_type\":\"2\"}]', 'asdfdas', '343434', '343', 12, NULL, NULL, 1, '[\"oncall\"]', '2022-10-29 05:33:22', '2022-10-29 05:33:22'),
(18, 122, '', '1343-04-23', '100012', 'rowan', 'atkinson', 'park', 'new colony', NULL, NULL, NULL, '1980-03-12', 1, '19990129', '1000029002', '10098', 663, 'L6L C5L', '3', 'not_vaccinated', 'Not in good health', 'maria', 'sister', '911', NULL, 3, NULL, '[\"morning\",\"afternoon\"]', '[\"weekdays\",\"weekends_holidays\"]', '1', '3', NULL, NULL, NULL, '5343', '2024-03-31', '343243', '1', 'yes', '[\"english\",\"hindi\",\"punjabi\"]', '[{\"education\":\"1\",\"course\":\"2\",\"certificate\":\"2\"}]', '[{\"old_company\":\"meta\",\"old_job_title\":\"4\",\"old_job_type\":\"5\"}]', 'bank of canada', '1000000000012', '99849', 4, NULL, NULL, 1, '[\"oncall\",\"parttime\"]', '2022-10-29 05:44:52', '2022-10-29 05:44:52'),
(19, 123, NULL, '', 'OgiOpf0021', 'Oginnf', NULL, 'Opfrf', 'Female', NULL, NULL, NULL, '', 2, '19-Jan-94', NULL, '70 Grggnwira rirrlg', NULL, 'grfmpton', NULL, NULL, NULL, NULL, NULL, '9033308483', NULL, NULL, NULL, '', '[\"morning\",\"afternoon\",\"evening\"]', NULL, NULL, NULL, NULL, NULL, 'Student', '', NULL, NULL, NULL, '[\"weekends\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:03', '2022-11-01 16:45:03'),
(20, 124, NULL, '', 'Saffms0052', 'Safun', NULL, 'fmstgrdfm', '9 lisf strggt', NULL, NULL, NULL, '', 2, '1473391930', '9034380314', 'grfmpton', NULL, 'L1T 4E7', NULL, 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '', NULL, 'PR', NULL, NULL, NULL, '577644222', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:03', '2022-11-01 16:45:03'),
(21, 126, NULL, '', 'OgiOpf0021', 'Oginnf', NULL, 'Opfrf', 'Female', NULL, NULL, NULL, '', 2, '19-Jan-94', NULL, '70 Grggnwira rirrlg', NULL, 'grfmpton', NULL, NULL, NULL, NULL, NULL, '9033308483', NULL, NULL, NULL, '', '[\"morning\",\"afternoon\",\"evening\"]', NULL, NULL, NULL, NULL, NULL, 'Student', '', NULL, NULL, NULL, '[\"weekends\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:29', '2022-11-01 16:45:29'),
(22, 127, NULL, '', 'Saffms0052', 'Safun', NULL, 'fmstgrdfm', '9 lisf strggt', NULL, NULL, NULL, '', 2, '1473391930', '9034380314', 'grfmpton', NULL, 'L1T 4E7', NULL, 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '', NULL, 'PR', NULL, NULL, NULL, '577644222', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:30', '2022-11-01 16:45:30'),
(23, 128, NULL, '', 'MfrPfy0401', 'Mfrio', NULL, 'Pfyng', '34 ggllflowgr Lfng', NULL, NULL, NULL, '', 2, NULL, '9037990318', 'grfmpton', NULL, 'L1S 1K1', 'DD', NULL, 'Unresponsive', NULL, NULL, '4113131443', NULL, NULL, NULL, '[\"morning\"]', '', NULL, 'Citizen', NULL, NULL, NULL, '544382211', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:30', '2022-11-01 16:45:30'),
(24, 129, NULL, '', 'JudSon0402', 'Judfa mfrk', NULL, 'Sonnylfl', '46 Mrgilvrfy rrgs', NULL, NULL, NULL, '', 1, '1478308849', '4118907879', 'Ggorgg Town', NULL, 'L7G 1L1', 'DD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', NULL, 'Citizen', NULL, NULL, NULL, '552846495', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:30', '2022-11-01 16:45:30'),
(25, 130, NULL, '', 'gflSin0404', 'gflwfn', NULL, 'Singa', '104 Gfllurri rrgs', NULL, NULL, NULL, '', 2, '4377771397', '1471319434', 'grfmpton', NULL, 'L1P 1R7', 'OS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', NULL, 'Student', NULL, NULL, NULL, '936027986', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:30', '2022-11-01 16:45:30'),
(26, 131, NULL, '', 'NfrSin0616', 'Nfring', NULL, 'Singa (Tgngrf)', '10 gfylor Drivg', NULL, NULL, NULL, '', 2, '4119397018', '9039709113', 'grfmpton', NULL, 'L7A 3V3', NULL, NULL, 'Aged', NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '', NULL, 'Citizen', NULL, NULL, NULL, '486671399', '', NULL, 'Car', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:30', '2022-11-01 16:45:30'),
(27, 132, NULL, '', 'GurSin0617', 'Gurpfrtfp', NULL, 'Singa', '8 rrfnggrry rrgs', NULL, NULL, NULL, '', 2, '4377797191', '4373338109', 'grfmpton', NULL, 'L1Y 4P7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', NULL, 'Work Permit', NULL, NULL, NULL, NULL, '', NULL, 'Car', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:30', '2022-11-01 16:45:30'),
(28, 133, NULL, '', 'afrSin0618', 'afrsimrfn', NULL, 'Singa', '8 rrfnggrry rrgs', NULL, NULL, NULL, '', 1, '1471391418', '4373338109', 'grfmpton', NULL, 'L1Y 4P7', NULL, NULL, 'Rude', NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', NULL, 'PR', NULL, NULL, NULL, '936757962', '', NULL, 'Car', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:30', '2022-11-01 16:45:30'),
(29, 134, NULL, '', 'KirVir0622', 'Kirpfldggp', NULL, 'Virk', '26 Rfvgnswood Drivg', NULL, NULL, NULL, '', 1, '3891181334', '1477190034', 'grfmpton', NULL, 'L1Y 3Y7', 'OS+CHQ', NULL, 'Trucking job', NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', NULL, 'Student', NULL, NULL, NULL, '936957158', '', NULL, 'Car', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:30', '2022-11-01 16:45:30'),
(30, 135, NULL, '', 'KfrGil0623', 'Kfrnpindgr', NULL, 'Gill', '26 Rfvgnswood Drivg', NULL, NULL, NULL, '', 2, NULL, '3891181334', 'grfmpton', NULL, 'L1Y 3Y7', 'OS+CHQ', 'not_vaccinated', 'Trucking job', NULL, NULL, '1477190034', NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '[\"weekends\"]', NULL, 'Student', NULL, NULL, NULL, '936165976', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:30', '2022-11-01 16:45:30'),
(31, 136, NULL, '', 'JosSot3203', 'Josg', NULL, 'Soto Florgs', '51 Mfssgy St', NULL, NULL, NULL, '', 1, '1473391111', '1473073803', 'grfmpton', NULL, 'L1S3V8', 'CHQ', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '', 'Online', 'Work Permit', NULL, NULL, NULL, '953315702', '', NULL, 'Bus', NULL, '[\"english\",\"Spanish\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:30', '2022-11-01 16:45:30'),
(32, 137, NULL, '', 'Sygfkg3204', 'Sygd Kfmrfn', NULL, 'fkgfr', '24 ragrkgrggrry rrgs', NULL, NULL, NULL, '', 2, '1471113038', '1478111973', 'grfmpton', NULL, 'L1R 3S8', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"Afternoon\",\"evening\"]', '', 'Visited', 'Work Permit (Refugee)', NULL, NULL, NULL, '953445921', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:30', '2022-11-01 16:45:30'),
(33, 138, NULL, '', 'Roafro3434', 'Roait', NULL, 'frorf', '348 Fftagr Togin Rofd', NULL, NULL, NULL, '', 2, '4373348448', '4373337118', 'grfmpton', NULL, 'L1R 0R4', 'OS', 'vaccinated', NULL, NULL, NULL, '4373337118', NULL, NULL, NULL, '[\"morning\",\"Afternoon\",\"evening\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '957159957', '', NULL, 'Car', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:31', '2022-11-01 16:45:31'),
(34, 139, NULL, '', 'KfrSaf3435', 'Kfrtik', NULL, 'Safrmf', '7 Pgrry Gftg', NULL, NULL, NULL, '', 2, '7783433931', NULL, 'grfmpton', NULL, 'L7A 3S1', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"Afternoon\"]', '[\"weekends\"]', 'Online', 'PR', NULL, NULL, NULL, '692854797', '', NULL, 'Car', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '[\"Rd Khosla\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:31', '2022-11-01 16:45:31'),
(35, 140, NULL, '', 'risWrs0314', 'rishr', NULL, 'Wrsim', '386 remiskey rresrent', NULL, NULL, NULL, '', 2, '5777138020', '9059552773', 'Mississauga', NULL, 'L5W 0C6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '', NULL, 'Citizen', NULL, NULL, NULL, '779341927', '', NULL, 'Bus', NULL, '[\"english\"]', '[\" \"]', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:31', '2022-11-01 16:45:31'),
(36, 141, NULL, '', 'KruNrv0489', 'Nrvjet', NULL, 'Krur', '72 Leprre Re', NULL, NULL, NULL, '', 2, '3557788175', '7379935282', 'Toronto', NULL, 'L6P 2K6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', NULL, 'Student', NULL, NULL, NULL, '932120213', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:31', '2022-11-01 16:45:31'),
(37, 142, NULL, '', 'RrmGil0490', 'Rrmrnpreet', NULL, 'Gill', '6 Irerrp rrt', NULL, NULL, NULL, '', 2, '5772801299', '9057901199', 'Toronto', NULL, 'L6R 2X4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"night\"]', '[\"weekends\"]', NULL, 'Student', NULL, NULL, NULL, '932109022', '', NULL, 'Car', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:31', '2022-11-01 16:45:31'),
(38, 143, NULL, '', 'rshewy0539', 'rshley', NULL, 'ewyer', '363 rrrheekin erive', NULL, NULL, NULL, '', 1, '4333030541', '4339423180', 'Toronto', NULL, 'L6V 3E9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '', NULL, 'Citizen', NULL, NULL, NULL, '144946470', '', NULL, 'Car', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:31', '2022-11-01 16:45:31'),
(39, 144, NULL, '', 'Irernr0625', 'Irene', NULL, 'rnrne', '129 Srl rirrle', NULL, NULL, NULL, '', 2, '4333309431', '4338320435', 'Toronto', NULL, 'L6R 1H4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"afternoon\",\"evening\"]', '[\"weekends\"]', NULL, 'Citizen', NULL, NULL, NULL, '114206960', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:31', '2022-11-01 16:45:31'),
(40, 145, NULL, '', 'VerMer0626', 'Veree', NULL, 'Mereminshy', '128 Glen Shieles rve', NULL, NULL, NULL, '', 2, '3148884132', '4339902091', 'Concord', NULL, 'L4K 1T6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '', NULL, 'Citizen', NULL, NULL, NULL, '332933307', '', NULL, 'Car', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:31', '2022-11-01 16:45:31'),
(41, 146, NULL, '', 'JimKru0634', 'Jimrrt', NULL, 'Krur', '3 Meenstene reurt', NULL, NULL, NULL, '', 1, '3339988393', '3148031903', 'Toronto', NULL, 'L6Y 4Z8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', NULL, 'Student', NULL, NULL, NULL, '932331939', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:31', '2022-11-01 16:45:31'),
(42, 147, NULL, '', 'HrrKru0635', 'Hrrpreet', NULL, 'Krur (Tiwrnr)', '3 Meenstene reurt', NULL, NULL, NULL, '', 1, '7162079269', '7162071907', 'Toronto', NULL, 'L6Y 4Z8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', NULL, 'Student', NULL, NULL, NULL, '932177731', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:31', '2022-11-01 16:45:31'),
(43, 148, NULL, '', 'rineey0636', 'riney', NULL, 'eeyle', '95 srlmerrl er', NULL, NULL, NULL, '', 2, '6776079751', '9052706662', 'Toronto', NULL, 'L6T 1V4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '', NULL, 'Citizen', NULL, NULL, NULL, '303117121', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:31', '2022-11-01 16:45:31'),
(44, 149, NULL, '', 'rrsKru0747', 'rrsheeep', NULL, 'Krur (Srnehu)', '11 reirenerrk rres', NULL, NULL, NULL, '', 1, '2299622607', '7677771902', 'Toronto', NULL, 'L6R 1E6', 'DD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"evening\"]', '[\"weekends\"]', NULL, 'Applying for Work Permit', NULL, NULL, NULL, '933111032', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:32', '2022-11-01 16:45:32'),
(45, 150, NULL, '', 'RrnMrn0750', 'Rrneeep Krur', NULL, 'Mrngrt', '15 Lien Priee lrne', NULL, NULL, NULL, '', 2, '2269666751', '6169702669', 'Toronto', NULL, 'L6R 3E4', 'DD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', NULL, 'Student', NULL, NULL, NULL, '932299240', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:32', '2022-11-01 16:45:32'),
(46, 151, NULL, '', 'ShrSpe1865', 'Shreene', NULL, 'Spenre', '3 Knightssriege unit 712', NULL, NULL, NULL, '', 1, '7373313711', '6779138390', 'Toronto', NULL, 'L6T 3X3', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '', 'Online', 'PR', NULL, NULL, NULL, '147433070', '', NULL, 'Bus', NULL, '', '[\"Knockaval technical high school\",\"School leaving and work experience certification\",\"Home management\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:32', '2022-11-01 16:45:32'),
(47, 152, NULL, '', 'JrpKru1866', 'Jrpneet', NULL, 'Krur', '80 Letty rvenue', NULL, NULL, NULL, '', 1, '7372331595', '6778183067', 'Toronto', NULL, 'L6Y 5C7', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '947327302', '', NULL, 'Bus', NULL, '', '[\"Sheridan College\",\"Computer Programmer Diploma\",\"Computer Programmer\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:32', '2022-11-01 16:45:32'),
(48, 153, NULL, '', 'NrvKru1867', 'Nrveeep', NULL, 'Krur', '3 Lenerk rvenue', NULL, NULL, NULL, '', 2, '7372287703', '6779799850', 'Toronto', NULL, 'L6Y 3J2', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"evening\"]', '[\"weekends\"]', 'Online', 'Applied for Work Permit', NULL, NULL, NULL, '942777427', '', NULL, 'Bus', NULL, '', '[\"Lambton College\",\" \",\"Advanced Healthcare Leadership\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:32', '2022-11-01 16:45:32'),
(49, 154, NULL, '', 'JrsKru1868', 'Jrsmeet', NULL, 'Krur', '65 Nelsen Street Erst', NULL, NULL, NULL, '', 2, '6775629811', '7372281632', 'Toronto', NULL, 'L6V 1E3', 'CHQ', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '942209322', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:32', '2022-11-01 16:45:32'),
(50, 155, NULL, '', 'VeeKru1878', 'Veerprl', NULL, 'Krur', '1 Lrurrglen rresrent', NULL, NULL, NULL, '', 2, '2269782866', '7373286678', 'Toronto', NULL, 'L6Y 4W7', 'CHQ', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"evening\"]', '', 'Online', 'Work Permit', NULL, NULL, NULL, '949492423', '', NULL, 'Bus', NULL, '', '[\"Conestoga\\u2019s college\",\"\",\"General arts and science diploma\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:32', '2022-11-01 16:45:32'),
(51, 156, NULL, '', 'NrvKru1882', 'Nrvreet', NULL, 'Krur', '26 Reyre rvenue', NULL, NULL, NULL, '', 1, '6779810015', '6776158077', 'Toronto', NULL, 'L6Y1J5', 'CHQ', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', 'Online', 'Citizen', NULL, NULL, NULL, '222437124', '', NULL, 'Bus', NULL, '', '[\"Punjabi university patiala india\",\"\",\"Graduation\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:32', '2022-11-01 16:45:32'),
(52, 157, NULL, '', 'PrtMrl1883', 'Mrlene Mrrtin', NULL, 'Prtsy ', '183-475 srrmrler rere', NULL, NULL, NULL, '', 1, '6775639269', '6776776551', 'Toronto', NULL, 'L6T 2X3', 'DD', 'not_vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\"]', '', 'Visited', 'Citizen', NULL, NULL, NULL, '392032002', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:32', '2022-11-01 16:45:32'),
(53, 158, NULL, '', 'oinOse1905', 'oindx', NULL, 'Oseyesi', '29 Exsnsyoisse yisyoe Bsxspton', NULL, NULL, NULL, '', 2, '6415141851', '6415104801', 'Brampton', NULL, 'L6T 2B3', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '', 'Online', 'Work Permit', NULL, NULL, NULL, '956909789', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:32', '2022-11-01 16:45:32'),
(54, 159, NULL, '', 'siyDoo3422', 'siycxeo', NULL, 'Dookie', '19 sxssson ysesent', NULL, NULL, NULL, '', 1, '1051111164', '4111111814', 'Brampton', NULL, 'L6s6h5', 'DD', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '[\"weekends\"]', 'Online', 'Citizen', NULL, NULL, NULL, '522568609', '', NULL, 'Car', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:32', '2022-11-01 16:45:32'),
(55, 160, NULL, '', 'cxnSce1906', 'cxnx', NULL, 'Sceikc', '5 kinss ysoss sd xpt 1811', NULL, NULL, NULL, '', 2, '4111116101', '6416111184', 'Brampton', NULL, 'L6t 3x6', 'DD', 'not_vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', 'Online', 'Citizen', NULL, NULL, NULL, '552827225', '', NULL, 'Car', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:33', '2022-11-01 16:45:33'),
(56, 161, NULL, '', NULL, 'cxspseet', NULL, 'Kxus', '7,yxstoesxte BoVD', NULL, NULL, NULL, '', 2, '1165111501', '6411611116', 'Brampton', NULL, 'L6P 2L4', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', 'Online', 'PR', NULL, NULL, NULL, '762356299', '', NULL, 'Bus', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:33', '2022-11-01 16:45:33'),
(57, 162, NULL, '', 'KuoKxu1907', 'Kuodeep kxus', NULL, 'Kxus', '20 yxsceo stseet', NULL, NULL, NULL, '', 2, '1181458045', '4168111161', 'Brampton', NULL, 'L6Z 2X5', NULL, 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"night\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '885858685', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:33', '2022-11-01 16:45:33'),
(58, 163, NULL, '', NULL, 'cxspseet', NULL, 'cxspseet', '22 Nxpooeon ysesyent', NULL, NULL, NULL, '', 1, '4111615150', '6416811811', 'Brampton', NULL, 'L6P3K5', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '', 'Online', 'Student', NULL, NULL, NULL, '856326085', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:33', '2022-11-01 16:45:33'),
(59, 164, NULL, '', NULL, 'Bibi', NULL, 'xooi', '7738 sedStone soxd', NULL, NULL, NULL, '', 2, '4164516001', '6411100841', 'Mississauga', NULL, 'L4t 2b9', 'DD', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '[\"weekends\"]', 'Online', 'Citizen', NULL, NULL, NULL, '555822288', '', NULL, 'Car', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:33', '2022-11-01 16:45:33'),
(60, 165, NULL, '', 'Nissos1908', 'Niscx', NULL, 'sosxnx', '159, 475-Bsxsxoex soxd', NULL, NULL, NULL, '', 2, '6416114616', '6411114616', 'Brampton', NULL, 'L6T 2X3', 'CHQ', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '', 'Online', 'PR', NULL, NULL, NULL, '588268558', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:33', '2022-11-01 16:45:33'),
(61, 166, NULL, '', 'NxsKxt3424', 'Nxsendsx', NULL, 'Kxtxsneni', '89 Jessesson soxd', NULL, NULL, NULL, '', 1, '4111611111', '6418158111', 'Brampton', NULL, 'L6S 1W7', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '', 'Online', 'PR', NULL, NULL, NULL, '588785030', '', NULL, 'Car', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:33', '2022-11-01 16:45:33'),
(62, 167, NULL, '', 'sussio1918', 'susoeen', NULL, 'sioo', '243 yossie ysesyent', NULL, NULL, NULL, '', 2, '6411018111', '6411115441', 'Waterloo', NULL, 'N2L 5W3', 'DD', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\",\"afternoon\",\"evening\"]', '[\"weekends\"]', 'Online', 'Citizen', NULL, NULL, NULL, '582387885', '', NULL, 'Car', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:33', '2022-11-01 16:45:33'),
(63, 168, NULL, '', NULL, 'sxnpseet', NULL, 'Kxus', '87 coooow ssove bovd', NULL, NULL, NULL, '', 2, '4116884618', '4111484518', 'Brampton', NULL, 'L6T 4L6', 'CHQ', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '', 'Online', 'Applied for Work Permit', NULL, NULL, NULL, '887855857', '', NULL, 'Car', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:33', '2022-11-01 16:45:33'),
(64, 169, NULL, '', 'BcxSin3429', 'Bcxvjot', NULL, 'sinsc', 'isooo tsxio', NULL, NULL, NULL, '', 1, '4115185114', '6415445614', 'Brampton', NULL, 'L6R3K1', 'DD', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '857022520', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:33', '2022-11-01 16:45:33'),
(65, 170, NULL, '', 'sxusxu3431', 'sxusxv', NULL, 'sxusxv', '200, sookstone ysesyent', NULL, NULL, NULL, '', 1, '1818111411', '1051811188', 'Brampton', NULL, 'L6T3N3', 'DD', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', 'Online', 'Applied for Work Permit', NULL, NULL, NULL, '998659629', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"pubjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:33', '2022-11-01 16:45:33'),
(66, 171, NULL, '', NULL, 'Sxcxdxi', NULL, 'sxspessxud', '10 Kensinston Bsxspton', NULL, NULL, NULL, '', 2, '4111111114', '4145110811', 'Brampton', NULL, 'L6t3v4', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '', 'Online', 'Work Permit', NULL, NULL, NULL, '39086939', '', NULL, 'Car', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:34', '2022-11-01 16:45:34'),
(67, 172, NULL, '', NULL, 'Susxnpseet', NULL, 'Sinsc', '#607, 283 PcxssxyY xVENUE, s1o3s1', NULL, NULL, NULL, '', 1, '4111811511', '4111841455', 'SCARBOROUGH', NULL, 'M1L3G1', 'DD', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\",\"evening\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '955992361', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:34', '2022-11-01 16:45:34'),
(68, 173, NULL, '', 'JxnSsi1928', 'Jxneooe', NULL, 'Ssitc', '18 knisctsbsidse sd', NULL, NULL, NULL, '', 2, '4411110184', '1054504415', 'Brampton', NULL, 'L6T 3X5', 'CHQ', 'not_vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '[\"weekends\"]', 'Online', 'PR', NULL, NULL, NULL, '515206323', '', NULL, 'Car', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:34', '2022-11-01 16:45:34'),
(69, 174, NULL, '', 'sxnKxu1927', 'sxnkxsxnjeet', NULL, 'Kxus', '5 oxntesnoisct oxne', NULL, NULL, NULL, '', 2, '4414501155', '4415110111', 'Brampton', NULL, 'L7A 0T3', 'DD', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '993106036', '', NULL, 'Car', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:34', '2022-11-01 16:45:34'),
(70, 175, NULL, '', NULL, 'sxnindes', NULL, 'Kxus', '4 ysoykes dsive', NULL, NULL, NULL, '', 2, '4418111081', '1141118181', 'Brampton', NULL, 'L6P 1H6', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '959368882', '', NULL, 'Car', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:34', '2022-11-01 16:45:34'),
(71, 176, NULL, '', NULL, 'suspindes sinsc', NULL, 'Jxtxnx', '84 yceykesbessy ysesyent', NULL, NULL, NULL, '', 1, '4411111001', '4111181448', 'Brampton', NULL, 'L6R3P7', 'DD', 'vaccinated', NULL, NULL, NULL, 'weekends', NULL, NULL, NULL, '[\"morning\"]', '', 'Online', 'Work Permit', NULL, NULL, NULL, '956989212', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:34', '2022-11-01 16:45:34'),
(72, 177, NULL, '', NULL, 'xvtxs', NULL, 'Sinsc', '15 oostssoos ds', NULL, NULL, NULL, '', 1, '4414151541', '4111810811', 'Brampton', NULL, 'L6R 3R7', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '959881089', '', NULL, 'Car', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:34', '2022-11-01 16:45:34'),
(73, 178, NULL, '', NULL, 'sxsxndeep', NULL, 'Kxus', '21 cuntinswood ysesyent', NULL, NULL, NULL, '', 2, '1811111118', '4414054818', 'Brampton', NULL, 'L6S1S5', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"evening\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '999933205', '', NULL, 'Bus', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:34', '2022-11-01 16:45:34'),
(74, 179, NULL, '', 'NxsSxn1930', 'Nxsceeb kxus', NULL, 'Sxndcu', '27 Vinyent stseet Bsxspton', NULL, NULL, NULL, '', 2, '4414084111', '4111448118', 'Brampton', NULL, 'L6R0G8', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '', 'Online', 'Work Permit', NULL, NULL, NULL, '997729357', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:34', '2022-11-01 16:45:34'),
(75, 180, NULL, '', NULL, 'sxnjindes', NULL, 'Kxus', '44 soyxo Spsinss ysesyent', NULL, NULL, NULL, '', 2, '6416406101', '6411181111', 'Brampton', NULL, 'L6R3B7', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '939828992', '', NULL, 'Car', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:34', '2022-11-01 16:45:34'),
(76, 181, NULL, '', NULL, 'Scubcxs', NULL, 'Dcisxn', '15 New cesispcese yst', NULL, NULL, NULL, '', 1, '6411181111', '4111610011', 'Brampton', NULL, 'L6S 0B9', 'CHQ', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', 'Online', 'Student', NULL, NULL, NULL, '223', '', NULL, 'Bus', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:34', '2022-11-01 16:45:34'),
(77, 182, NULL, '', 'NikNik1932', 'Nikitx', NULL, 'Nikitx', '78 doopcin sons ysesyent', NULL, NULL, NULL, '', 2, '6418665411', '6411151611', 'Brampton', NULL, 'L6R1Z9', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', 'Online', 'Applied for Work Permit', NULL, NULL, NULL, '998770897', '', NULL, 'Bus', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:35', '2022-11-01 16:45:35'),
(78, 183, NULL, '', NULL, 'sxsxndeep', NULL, 'Kxus', '72 ysystxoview ysesyent', NULL, NULL, NULL, '', 2, '6118151150', '1181415156', 'Brampton', NULL, 'L6P2R7', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"evening\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '990599332', '', NULL, 'Car', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:35', '2022-11-01 16:45:35'),
(79, 184, NULL, '', 'KxsScx3435', 'Kxstik', NULL, 'Scxssx', '7 pesyy sxte', NULL, NULL, NULL, '', 1, '1181415155', '4111151111', 'Brampton', NULL, 'L7A3S1', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\",\"afternoon\"]', '', 'Online', 'PR', NULL, NULL, NULL, '692859797', '', NULL, 'Car', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:35', '2022-11-01 16:45:35'),
(80, 185, NULL, '', NULL, 'xkxnkscx', NULL, 'xkxnkscx', '56 tooosxte stseet', NULL, NULL, NULL, '', 2, '4111111016', '6148665411', 'Brampton', NULL, 'L6Z0H9', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"evening\"]', '[\"weekends\"]', 'Online', 'Work Permit', NULL, NULL, NULL, '990893753', '', NULL, 'Bus', NULL, '[\"english\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:35', '2022-11-01 16:45:35'),
(81, 186, NULL, '', NULL, 'xkxscdeep', NULL, 'kxus', '78, doopcin sons yses', NULL, NULL, NULL, '', 2, '4111611180', '6414041808', 'brampton', NULL, 'L6R1Z9', 'CHQ', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', 'Online', 'Student', NULL, NULL, NULL, '956929936', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:35', '2022-11-01 16:45:35'),
(82, 187, NULL, '', NULL, 'Nxvjot', NULL, 'Kxus', '105 bxstoey buoo pxskwxy', NULL, NULL, NULL, '', 2, '1654168011', NULL, 'Brampton', NULL, 'L6W 2J8', 'DD', 'vaccinated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"morning\"]', '[\"weekends\"]', 'Online', 'Applied for Work Permit', NULL, NULL, NULL, '952288997', '', NULL, 'Bus', NULL, '[\"english\",\"hindi\",\"punjabi\"]', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-11-01 16:45:35', '2022-11-01 16:45:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `founded_date` varchar(255) DEFAULT NULL,
  `country_id` int NOT NULL DEFAULT '38',
  `state_id` int DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postcode` varchar(15) DEFAULT NULL,
  `organization_type` int DEFAULT NULL,
  `no_employees` int DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `google_plus` varchar(255) DEFAULT NULL,
  `linked_in` varchar(255) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `plan_id` int DEFAULT NULL,
  `belongs_to` int DEFAULT NULL,
  `relation_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `user_id`, `created_by`, `name`, `mobile`, `website`, `category`, `founded_date`, `country_id`, `state_id`, `city_id`, `address`, `postcode`, `organization_type`, `no_employees`, `description`, `facebook`, `twitter`, `google_plus`, `linked_in`, `logo_path`, `status`, `plan_id`, `belongs_to`, `relation_type`, `created_at`, `updated_at`) VALUES
(1, 14, 1, 'Kavin Group', '9811378414', 'https://www.kavingroup.ca/', NULL, '2020-02-28', 38, 670, '10251', 'test address onterio', '55h678', 1, 1, 'gsd', 'https://facebook.com/facebook', 'https://twitter.com/facebook', 'https://google.com/', NULL, '', 1, 1, NULL, NULL, '2022-05-28 06:55:47', '2022-09-02 04:25:03'),
(4, 22, 1, 'Recruitment Canada', '7739899505', 'https://www.facebook.com/', NULL, '2022-05-08', 38, 663, '10105', 'new city area', '804427', 1, 1, 'Top 5 in Toronto, canada', 'https://www.facebook.com/', 'https://www.twitter.com/', 'https://www.google.com/', 'https://www.linkdein.com/', '', 1, 1, NULL, NULL, '2022-05-30 01:26:53', '2022-09-16 04:33:57'),
(5, 23, 1, 'STRIVE Recruitment', '7739899507', 'https://www.facebook.com/id', NULL, '2022-05-10', 38, 671, '10259', '628 Mississauga Valley Boulevard\r\nToronto, ON L5A 1Z2', '123445', 1, 1, 'description', 'https://www.facebook.com/name', 'https://www.twitter.com/name', 'https://www.google.com/name', 'https://www.linkdein.com/name', '', 1, 1, NULL, NULL, '2022-05-30 01:51:49', '2022-09-16 04:34:58'),
(7, 30, 1, 'DevTalent', '4163020206', 'https://www.facebook.com/', NULL, '2022-05-15', 38, 670, '10246', '628 Mississauga Valley Boulevard\r\nToronto, ON L5A 1Z2', 'xyzabc', NULL, NULL, NULL, 'https://www.facebook.com/', 'https://www.twitter.com/', 'https://www.google.com/', 'https://www.linkdein.com/', '', 1, NULL, NULL, NULL, '2022-05-30 23:43:31', '2022-06-03 03:46:32'),
(11, 36, 1, 'Stantec', '7739899505', 'https://www.facebook.com/', NULL, '4344-03-31', 38, 663, '10111', 'new colonyerer', 'xyzabc', 3, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '2022-05-31 01:22:38', '2022-06-03 04:18:29'),
(12, 37, 1, 'ScaleX', '7722334455', 'https://www.facebook.com/', NULL, '4343-03-31', 38, 671, '10262', 'old areaqwerqer', 'rerere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '2022-05-31 01:25:13', '2022-06-03 03:46:51'),
(13, 60, 1, 'Brookfield Asset Management', '1234567890', 'https://www.facebook.com/', NULL, '1963-03-12', 38, 671, '10259', 'mira road test test', '401107', 3, 3, NULL, 'https://www.facebook.com/', 'https://www.twitter.com/', 'https://www.google.com/', 'https://www.linkdein.com/', '', 1, NULL, NULL, NULL, '2022-06-03 04:27:34', '2022-06-03 04:27:34'),
(14, 61, 1, 'Power Corporation of Canada', '1234567890', 'https://www.facebook.com/', NULL, '1989-03-12', 38, 665, '10206', 'new colony', 'xyzabc', 2, 3, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '2022-06-03 04:29:12', '2022-06-03 04:29:12'),
(15, 62, 1, 'Couche Tard', '1234567890', 'https://www.facebook.com/', NULL, '1989-03-12', 38, 665, '10207', 'new colony', 'xyzabc', 3, 2, 'couche tard company is one of the top leadning company in industry', NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '2022-06-03 04:30:10', '2022-06-07 01:12:49'),
(16, 76, 1, 'Canada Revenue Agency', '9010000000', 'https://agencyrevenue.com', NULL, '1912-02-19', 38, 671, '10260', 'Red Deer, Alberta(AB), T4N 5Z9', '123445', NULL, NULL, NULL, 'https://www.facebook.com/revenueagency', 'https://www.twitter.com/revenueagency', 'https://www.google.com/revenueagency', 'https://www.linkdein.com/revenueagency', '', 1, NULL, NULL, NULL, '2022-06-08 02:29:53', '2022-06-08 02:29:53'),
(17, 77, 1, 'Altis Human Resource', '1416214928', 'https://altis.com/', NULL, '1989-01-01', 38, 671, '10262', 'recognised as leader in recruitment field', 'M5H2S8', NULL, NULL, NULL, 'https://www.facebook.com/altis', 'https://www.twitter.com/altis', 'https://www.google.com/altis', 'https://www.linkdein.com/altis', 'profile_images/1654758874.png', 1, 2, NULL, NULL, '2022-06-09 01:44:35', '2022-06-09 01:44:35'),
(18, 79, 1, 'BEST BUY CANADA LTD', '1400913434', 'https://bestbuycanada.com/', NULL, '1913-03-12', 38, 665, '10211', '34 D bell ring road, toronto, ontario, canada', '134234', 4, 3, 'test description', 'https://www.facebook.com/bestbuycanada', NULL, NULL, NULL, 'profile_images/1654772519.webp', 1, 6, NULL, '76', '2022-06-09 05:31:59', '2022-06-11 05:25:33'),
(19, 80, 1, 'Canadian Space Agency', '8999898908', 'https://www.canadaspace.com/', NULL, '1989-03-12', 38, 665, '10217', '47 A Canada space agency street , Loretta, Manitoba', '989989', NULL, NULL, NULL, 'https://www.facebook.com/canadaspace', 'https://www.twitter.com/canadaspace', 'https://www.google.com/canadaspace', 'https://www.linkdein.com/canadaspace', 'profile_images/1654929831.png', 1, 11, NULL, NULL, '2022-06-11 01:13:51', '2022-06-11 01:13:51'),
(20, 81, 1, 'Magna International', '9767900678', 'https://www.mangainternational.com/', NULL, '1967-03-12', 38, 673, '10571', '73 B magna internation street , Boisbriand, Quebec', '213413', 1, 3, 'Global automotive supplier and one of the largest automobile parts manufacturer in North America', 'https://www.facebook.com/mangainternational', 'https://www.twitter.com/mangainternational', 'https://www.google.com/mangainternational', 'https://www.linkdein.com/mangainternational', 'profile_images/1654930797.jfif', 1, 7, NULL, NULL, '2022-06-11 01:29:58', '2022-06-11 01:33:13'),
(21, 84, 77, 'Manga International co', '9786783674', 'https://www.mangaco.com', NULL, '1988-03-12', 38, 671, '10262', '74A College street, ontario,canada', '134354', 2, 2, 'Top 3 in Toronto, canada', 'https://www.facebook.com/mangaco', 'https://www.Twitter.com/mangaco', 'https://www.googleplus.com/mangaco', 'https://www.linkedin.com/mangaco', 'profile_images/1654954328.jfif', 1, 6, NULL, NULL, '2022-06-11 08:02:08', '2022-06-11 08:02:35'),
(22, 96, 1, 'INNOVATIVE CONSULTIN ENGINEERS', '1234123412', 'https://www.ice.com', NULL, '2016-02-10', 38, 665, '10232', '47A elm street', 'L5L6A6', 2, 1, 'Designing of Electrical and Hvac.', 'https://www.ice.com/facebook', 'https://www.ice.com/twitter', 'https://www.ice.com/google+plus', 'https://www.ice.com/linked+in', 'profile_images/1663329665.png', 1, 5, NULL, NULL, '2022-09-16 06:31:05', '2022-09-16 06:31:05'),
(23, 108, NULL, 'Salt Financial', NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2022-09-26 04:22:28', '2022-09-26 04:22:28'),
(24, 110, NULL, 'Deloitte', NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2022-09-26 05:05:54', '2022-09-26 05:05:54'),
(25, 115, NULL, 'TELUS Communications Inc', NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2022-10-01 02:02:44', '2022-10-01 02:02:44'),
(26, 116, NULL, 'The Headhunters', NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2022-10-01 02:08:04', '2022-10-01 02:08:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `roles_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_permissions`
--
ALTER TABLE `users_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `users_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `users_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details_user_id_index` (`user_id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD CONSTRAINT `roles_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_permissions`
--
ALTER TABLE `users_permissions`
  ADD CONSTRAINT `users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
