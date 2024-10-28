-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2024 at 06:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upang_eats`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `bookmark_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `stall_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`bookmark_id`, `user_id`, `item_id`, `stall_id`) VALUES
(1, 1, 1, 1),
(3, 1, 2, 3),
(4, 1, 5, 3),
(5, 2, 1, 1),
(6, 2, 2, 1),
(7, 2, 3, 1),
(8, 2, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `image_url`) VALUES
(1, 'Snack', 'assets/categories/Snack.png'),
(2, 'Burger', 'assets/categories/Burger.png'),
(3, 'Rice Meal', 'assets/categories/RiceMeal.png'),
(4, 'Drinks', 'assets/categories/Drinks.png'),
(5, 'Noodles', 'assets/categories/Noodles.png'),
(6, 'Dimsum', 'assets/categories/Dimsums.png'),
(7, 'Fries', 'assets/categories/Fries.png'),
(8, 'Bread', 'assets/categories/Bread.png'),
(10, 'Soup', 'assets/categories/Soup.png');

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `item_id` int(11) NOT NULL,
  `stall_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(10) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `is_breakfast` tinyint(1) DEFAULT 0,
  `is_lunch` tinyint(1) DEFAULT 0,
  `is_merienda` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`item_id`, `stall_id`, `item_name`, `description`, `price`, `image_url`, `is_available`, `is_breakfast`, `is_lunch`, `is_merienda`) VALUES
(5, 1, 'Pancit Canton', 'Stir-fried noodles with vegetables and meat', 65, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F1_5.jpg?alt=media&token=8b66ae92-b923-431d-b13a-cd63ea8c857f', 1, 0, 1, 1),
(6, 1, 'Siomai', 'Steamed pork dumplings served with soy sauce', 45, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F1_6.jpg?alt=media&token=cf89ab9a-8334-4560-a4b7-f5470c0ccdae', 1, 0, 0, 0),
(7, 2, 'Turon', 'Banana wrapped in spring roll wrapper and fried', 20, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F2_7.jpg?alt=media&token=c3aabb9a-c1ee-4280-84f9-156f7af70442', 1, 0, 0, 1),
(8, 2, 'Cheeseburger', 'Juicy beef patty with cheese in a bun', 85, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F2_8.jpg?alt=media&token=84655a9d-ceb5-4ab5-b0d9-442346713900', 1, 0, 1, 0),
(9, 2, 'Adobo Rice Meal', 'Savory chicken adobo with rice', 110, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F2_9.jpg?alt=media&token=fe0edba0-9ad3-4f77-9f87-abb6ca4791c2', 1, 1, 1, 0),
(10, 2, 'Buko Juice', 'Fresh coconut juice', 30, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F2_10.jpg?alt=media&token=d7d81391-2a9b-4a21-9ecd-77ee6bb21904', 1, 0, 1, 1),
(11, 2, 'Kikiam', 'Deep-fried pork sausage served with sauce', 35, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F2_11.jpg?alt=media&token=4dc4a8f7-cafa-4b98-954a-9c7226501c2a', 1, 0, 1, 1),
(12, 3, 'Banana Cue', 'Caramelized bananas on a stick', 25, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F3_12.jpg?alt=media&token=404bfe5a-e567-417f-b3c4-59a0778fc2e4', 1, 0, 0, 1),
(13, 3, 'Double Burger', 'Double beef patty with cheese and bacon', 120, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F3_13.jpg?alt=media&token=d62a24b7-418a-4873-898d-6d5c74d9f25e', 1, 0, 1, 0),
(14, 3, 'Longsilog', 'Sweet longganisa with fried egg and garlic rice', 95, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F3_14.jpg?alt=media&token=fa57faed-d1e9-4240-9848-9f6728f60bca', 1, 1, 1, 0),
(15, 3, 'Mami Noodles', 'Hot beef noodle soup', 70, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F3_15.jpg?alt=media&token=c8bb15aa-914b-4457-8556-408da6fb347d', 1, 0, 1, 1),
(16, 3, 'French Fries', 'Crispy potato fries', 45, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F3_16.jpg?alt=media&token=9fa98fa9-3ab4-4edc-a839-b544358caffb', 1, 0, 1, 1),
(17, 4, 'Puto', 'Steamed rice cakes', 15, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F4_17.jpg?alt=media&token=9c18c535-94b8-4aea-83c8-41cc7ab4883c', 1, 0, 0, 1),
(18, 4, 'Bacon Cheeseburger', 'Beef patty with bacon and cheese', 105, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F4_18.jpg?alt=media&token=4023ef77-5301-499a-bbef-7e0fa462b6e9', 1, 0, 1, 0),
(19, 4, 'Lechon Kawali Meal', 'Crispy fried pork belly with rice', 130, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F4_19.jpg?alt=media&token=d91354d4-1a2e-4f2f-8794-90943a57d20e', 1, 1, 1, 0),
(20, 4, 'Sago’t Gulaman', 'Sweet tapioca pearls and gelatin drink', 25, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F4_20.jpg?alt=media&token=21f322c8-625c-4fd8-8300-7df35f72a887', 1, 0, 1, 1),
(21, 4, 'Siopao', 'Steamed bun with pork filling', 40, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F4_21.jpg?alt=media&token=45b80bad-7186-4c1c-b7e4-e0c6941062da', 1, 0, 1, 1),
(38, 1, 'Lumpiang Shanghai', 'Lumpia', 50, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F1_2.jpg?alt=media&token=030c922b-97a0-4e32-a4d3-80d356590cc4', 1, 0, 0, 1),
(39, 1, 'Chicken Burger', '', 75, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F1_3.jpg?alt=media&token=4d0021c1-a9e8-4058-a653-b35e8e71519e', 1, 1, 0, 0),
(40, 1, 'Tapsilog', '', 120, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F1_4.jpg?alt=media&token=0266df6a-b856-445a-9434-4f8715b1fc48', 1, 1, 0, 0),
(41, 1, 'Butchog', '', 300, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F2024-10-28%2021%3A33%3A47.050562.png?alt=media&token=b7b72f02-7d13-44f1-aab4-191ecdd00aaf', 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_item_categories`
--

CREATE TABLE `food_item_categories` (
  `food_item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_item_categories`
--

INSERT INTO `food_item_categories` (`food_item_id`, `category_id`) VALUES
(2, 1),
(3, 2),
(4, 3),
(5, 5),
(6, 6),
(7, 1),
(8, 2),
(9, 3),
(10, 4),
(11, 6),
(12, 1),
(13, 2),
(14, 3),
(15, 10),
(16, 7),
(17, 1),
(18, 2),
(19, 3),
(20, 4),
(21, 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_delete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `order_id`, `message`, `status`, `created_at`, `is_delete`) VALUES
(1, 10, 61, 'Your order is accepted', 'read', '2024-10-27 10:27:31', 0),
(2, 10, 64, 'Your order #1264 has been accepted.', 'read', '2024-10-27 10:37:42', 0),
(3, 10, 64, 'Your order #64 is ready for pickup.', 'read', '2024-10-27 14:16:35', 0),
(4, 10, 64, 'Your order #64 has been cancelled.', 'read', '2024-10-28 10:12:40', 0),
(5, 10, 66, 'Your order #66 has been accepted.', 'read', '2024-10-28 16:52:43', 0),
(6, 10, 66, 'Your order #66 has been accepted.', 'read', '2024-10-28 16:54:56', 0),
(7, 10, 66, 'Your order #66 has been accepted.', 'read', '2024-10-28 16:55:54', 0),
(8, 10, 66, 'Your order #66 is ready for pickup.', 'read', '2024-10-28 16:56:28', 0),
(9, 10, 66, 'Your order #66 status is now: completed.', 'read', '2024-10-28 16:56:31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `stall_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` int(10) NOT NULL,
  `order_status` enum('pending','accepted','ready','completed','cancelled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `stall_id`, `order_date`, `total_amount`, `order_status`) VALUES
(2, 2, 1, '2024-09-21 18:15:49', 123, 'completed'),
(3, 2, 1, '2024-10-10 19:48:34', 340, 'completed'),
(5, 2, 1, '2024-10-10 19:49:56', 340, 'cancelled'),
(32, 1, 1, '2024-10-11 14:06:40', 445, 'completed'),
(36, 10, 2, '2024-10-13 16:25:39', 85, 'completed'),
(43, 10, 1, '2024-10-13 18:38:20', 65, 'cancelled'),
(52, 10, 3, '2024-10-18 09:47:30', 285, 'accepted'),
(53, 10, 3, '2024-10-18 09:51:16', 475, 'accepted'),
(55, 10, 4, '2024-10-18 14:36:02', 420, 'completed'),
(56, 10, 1, '2024-10-18 14:48:02', 1300, 'completed'),
(58, 10, 2, '2024-10-21 19:22:39', 85, 'completed'),
(59, 10, 1, '2024-10-21 19:25:27', 600, 'completed'),
(60, 10, 2, '2024-10-21 19:27:37', 35, 'completed'),
(61, 10, 4, '2024-10-21 19:31:52', 2100, 'accepted'),
(62, 10, 2, '2024-10-21 20:45:42', 35, 'pending'),
(63, 10, 1, '2024-10-21 20:46:30', 30, 'completed'),
(64, 10, 1, '2024-10-27 10:37:23', 150, 'cancelled'),
(65, 10, 2, '2024-10-27 14:16:01', 440, 'pending'),
(66, 10, 1, '2024-10-28 16:24:37', 2465, 'ready');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `item_id`, `quantity`, `subtotal`) VALUES
(1, NULL, 2, 2, 100),
(2, NULL, 3, 1, 75),
(3, NULL, 3, 1, 75),
(6, 2, 4, 1, 120),
(7, 2, 5, 2, 240),
(8, 3, 2, 1, 50),
(9, 3, 4, 2, 240),
(10, 4, 2, 1, 50),
(11, 4, 4, 2, 240),
(12, 5, 2, 1, 50),
(13, 5, 4, 2, 240),
(14, 6, 2, 1, 50),
(15, 6, 4, 2, 240),
(16, 7, 2, 1, 50),
(17, 7, 4, 2, 240),
(18, 8, 2, 1, 50),
(19, 8, 4, 2, 240),
(20, 9, 2, 1, 50),
(21, 9, 4, 2, 240),
(22, 10, 2, 1, 50),
(23, 11, 2, 1, 50),
(24, 12, 2, 1, 50),
(25, 13, 2, 1, 50),
(26, 14, 2, 1, 50),
(27, 15, 2, 1, 50),
(28, 16, 2, 1, 50),
(29, 17, 2, 1, 50),
(30, 18, 2, 1, 50),
(31, 19, 2, 1, 50),
(32, 20, 2, 4, 200),
(33, 21, 7, 1, 20),
(34, 22, 2, 3, 150),
(35, 22, 3, 1, 75),
(36, 22, 4, 1, 120),
(37, 22, 5, 1, 65),
(38, 22, 6, 1, 35),
(39, 23, 2, 3, 150),
(40, 23, 3, 1, 75),
(41, 23, 4, 1, 120),
(42, 23, 5, 1, 65),
(43, 23, 6, 1, 35),
(44, 24, 2, 3, 150),
(45, 24, 3, 1, 75),
(46, 24, 4, 1, 120),
(47, 24, 5, 1, 65),
(48, 24, 6, 1, 35),
(49, 25, 2, 3, 150),
(50, 25, 3, 1, 75),
(51, 25, 4, 1, 120),
(52, 25, 5, 1, 65),
(53, 25, 6, 1, 35),
(54, 26, 2, 3, 150),
(55, 26, 3, 1, 75),
(56, 26, 4, 1, 120),
(57, 26, 5, 1, 65),
(58, 26, 6, 1, 35),
(59, 27, 2, 3, 150),
(60, 27, 3, 1, 75),
(61, 27, 4, 1, 120),
(62, 27, 5, 1, 65),
(63, 27, 6, 1, 35),
(64, 28, 2, 3, 150),
(65, 28, 3, 1, 75),
(66, 28, 4, 1, 120),
(67, 28, 5, 1, 65),
(68, 28, 6, 1, 35),
(69, 29, 2, 3, 150),
(70, 29, 3, 1, 75),
(71, 29, 4, 1, 120),
(72, 29, 5, 1, 65),
(73, 29, 6, 1, 35),
(74, 30, 2, 3, 150),
(75, 30, 3, 1, 75),
(76, 30, 4, 1, 120),
(77, 30, 5, 1, 65),
(78, 30, 6, 1, 35),
(79, 31, 2, 3, 150),
(80, 31, 3, 1, 75),
(81, 31, 4, 1, 120),
(82, 31, 5, 1, 65),
(83, 31, 6, 1, 35),
(84, 32, 2, 3, 150),
(85, 32, 3, 1, 75),
(86, 32, 4, 1, 120),
(87, 32, 5, 1, 65),
(88, 32, 6, 1, 35),
(89, 33, 2, 1, 50),
(90, 33, 3, 1, 75),
(91, 33, 4, 1, 120),
(92, 33, 5, 1, 65),
(93, 33, 6, 1, 35),
(94, 34, 2, 1, 50),
(95, 34, 3, 1, 75),
(96, 34, 4, 1, 120),
(97, 34, 5, 1, 65),
(98, 34, 6, 1, 35),
(99, 35, 2, 1, 50),
(100, 36, 8, 1, 85),
(101, 37, 19, 1, 130),
(102, 38, 19, 1, 130),
(103, 39, 11, 1, 35),
(104, 40, 3, 1, 75),
(105, 41, 36, 1, 30),
(106, 42, 5, 1, 65),
(107, 43, 5, 1, 65),
(108, 44, 4, 1, 120),
(109, 45, 14, 4, 380),
(110, 45, 15, 3, 210),
(111, 46, 7, 1, 20),
(112, 47, 18, 3, 315),
(113, 47, 21, 5, 200),
(114, 48, 4, 4, 480),
(115, 49, 12, 1, 25),
(116, 50, 15, 3, 210),
(117, 51, 20, 4, 100),
(118, 52, 14, 3, 285),
(119, 53, 14, 5, 475),
(120, 54, 18, 1, 105),
(121, 55, 18, 4, 420),
(122, 56, 5, 20, 1300),
(123, 57, 7, 5, 100),
(124, 58, 8, 1, 85),
(125, 59, 4, 5, 600),
(126, 60, 11, 1, 35),
(127, 61, 18, 20, 2100),
(128, 62, 11, 1, 35),
(129, 63, 36, 1, 30),
(130, 64, 36, 5, 150),
(131, 65, 9, 4, 440),
(132, 66, 5, 1, 65),
(133, 66, 41, 8, 2400);

-- --------------------------------------------------------

--
-- Table structure for table `stalls`
--

CREATE TABLE `stalls` (
  `stall_id` int(11) NOT NULL,
  `stall_name` varchar(255) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `contact_number` varchar(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `image_banner_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stalls`
--

INSERT INTO `stalls` (`stall_id`, `stall_name`, `owner_id`, `description`, `contact_number`, `image_url`, `image_banner_url`, `is_active`) VALUES
(1, 'Boss Sisig!', 12, 'No Desc', '0', 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/stalls%2Fprofiles2024-10-28%2023%3A49%3A56.841633.png?alt=media&token=823ceadc-3420-433d-a399-e62760f63e4b', 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/stalls%2Fbanners2024-10-28%2023%3A55%3A58.328823.png?alt=media&token=442a70b7-d2ce-4244-a6df-e774dc1bb376', 1),
(2, 'Ninong Ry’s Special Delicacy Stall', 3, NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/stalls%2Fprofiles%2Fprofile_2.jpg?alt=media&token=d5d3c3a1-bfce-49d3-be5c-f1c9b60940a8', 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/stalls%2Fbanners%2Fbanner_2.jpg?alt=media&token=396760ee-095d-4d27-9961-bcbf81e3a8dd', 1),
(3, 'Mekus Mekus Tayo Insan!', 4, NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/stalls%2Fprofiles%2Fprofile_3.jpg?alt=media&token=af7d9628-34d2-47f8-9555-4f34f08bb763', 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/stalls%2Fbanners%2Fbanner_3.jpg?alt=media&token=57cf638b-a4f7-40d9-bce1-22211d396b16', 1),
(4, 'Masamsamit Dito, Adele!', 7, NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/stalls%2Fprofiles%2Fprofile_4.jpg?alt=media&token=835bcaf4-c9e3-4607-9c77-c6935c0596b9', 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/stalls%2Fbanners%2Fbanner_4.jpg?alt=media&token=3bfa1c8a-9928-4c14-a040-6bb60034fdd5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_type` enum('deposit','send','receive','refund','withdraw') NOT NULL,
  `amount` int(11) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','completed','failed') DEFAULT 'pending',
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `user_id`, `transaction_type`, `amount`, `source_id`, `destination_id`, `transaction_date`, `status`, `description`) VALUES
(1, 10, 'send', 500, 10, 12, '2024-10-22 19:00:18', 'completed', NULL),
(2, 12, 'receive', 10, 10, 12, '2024-10-21 19:01:47', 'completed', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trays`
--

CREATE TABLE `trays` (
  `tray_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trays`
--

INSERT INTO `trays` (`tray_id`, `user_id`, `item_id`, `quantity`) VALUES
(4, 2, 6, 2),
(130, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `student_id` varchar(14) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `user_type` enum('user','stall_owner','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `student_id`, `first_name`, `last_name`, `email`, `password`, `phone_number`, `user_type`) VALUES
(1, '03-2223-040518', 'Christian Jose', 'Soriano', 'soriano.christianjose.m@gmail.com', 'password', NULL, 'user'),
(2, '03-2223-000000', 'Ritchmarc', 'Bustillo', 'ritchmarc.bustillo@gmail.com', 'password', NULL, 'stall_owner'),
(3, '03-2223-111111', 'Nervin', 'Ferrer', 'nervin.ferrer@gmail.com', 'password', NULL, 'stall_owner'),
(4, '03-2223-222222', 'Kenth', 'Marasigan', 'kenth.marasigan@gmail.com', 'password', NULL, 'stall_owner'),
(7, '03-2223-333333', 'Guerrero', 'Katherine', 'katherine.guerrero@gmail.com', 'password', NULL, 'stall_owner'),
(8, '03-2223-696900', 'Francis2', 'Gonzales2', 'gonzales2.francis@gmail.com', 'password2', '09696969692', 'user'),
(10, 'stu_id', 'fname', 'lname', 'email', '$2b$10$.fawltSJ1eHObQy/BiCXYuS9uyR68dTu75p8U6yKDW4tMYn0xuWne', '1234567890', 'user'),
(12, 'stu_id2', 'fname', 'lname', 'stallowner', '$2b$10$I9lgWqt9H5Glyj73EdLR5uT4fk5r3oS9NboFkYs1hJ1JzteUV.pF2', '1234567890', 'stall_owner'),
(14, 'stu_id3', 'fname', 'lname', 'admin', '$2b$10$qXHFeWZTpeAEvt7KWS116u2gpyvwijkwvM3no6dHn992e1S2iyC7K', '1234567890', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`bookmark_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `food_item_categories`
--
ALTER TABLE `food_item_categories`
  ADD PRIMARY KEY (`food_item_id`,`category_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `stalls`
--
ALTER TABLE `stalls`
  ADD PRIMARY KEY (`stall_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `trays`
--
ALTER TABLE `trays`
  ADD PRIMARY KEY (`tray_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `bookmark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `food_items`
--
ALTER TABLE `food_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `stalls`
--
ALTER TABLE `stalls`
  MODIFY `stall_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trays`
--
ALTER TABLE `trays`
  MODIFY `tray_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
