-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 05:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Snack'),
(2, 'Burger'),
(3, 'Rice Meal'),
(4, 'Drinks'),
(5, 'Noodles'),
(6, 'Dimsum'),
(7, 'Fries'),
(8, 'Bread'),
(10, 'Soup');

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
(2, 1, 'Lumpiang Shanghai', 'Deep-fried spring rolls with meat filling', 50, '', 1, 0, 1, 1),
(3, 1, 'Chicken Burger', 'Chicken patty in a soft bun with lettuce and mayo', 75, '', 1, 0, 1, 0),
(4, 1, 'Tapsilog', 'Beef tapa with fried egg and garlic rice', 120, '', 1, 1, 1, 0),
(5, 1, 'Pancit Canton', 'Stir-fried noodles with vegetables and meat', 65, '', 1, 0, 1, 1),
(6, 1, 'Siomai', 'Steamed pork dumplings served with soy sauce', 35, '', 1, 0, 1, 1),
(7, 2, 'Turon', 'Banana wrapped in spring roll wrapper and fried', 20, '', 1, 0, 0, 1),
(8, 2, 'Cheeseburger', 'Juicy beef patty with cheese in a bun', 85, '', 1, 0, 1, 0),
(9, 2, 'Adobo Rice Meal', 'Savory chicken adobo with rice', 110, '', 1, 1, 1, 0),
(10, 2, 'Buko Juice', 'Fresh coconut juice', 30, '', 1, 0, 1, 1),
(11, 2, 'Kikiam', 'Deep-fried pork sausage served with sauce', 35, '', 1, 0, 1, 1),
(12, 3, 'Banana Cue', 'Caramelized bananas on a stick', 25, '', 1, 0, 0, 1),
(13, 3, 'Double Burger', 'Double beef patty with cheese and bacon', 120, '', 1, 0, 1, 0),
(14, 3, 'Longsilog', 'Sweet longganisa with fried egg and garlic rice', 95, '', 1, 1, 1, 0),
(15, 3, 'Mami Noodles', 'Hot beef noodle soup', 70, '', 1, 0, 1, 1),
(16, 3, 'French Fries', 'Crispy potato fries', 45, '', 1, 0, 1, 1),
(17, 4, 'Puto', 'Steamed rice cakes', 15, '', 1, 0, 0, 1),
(18, 4, 'Bacon Cheeseburger', 'Beef patty with bacon and cheese', 105, '', 1, 0, 1, 0),
(19, 4, 'Lechon Kawali Meal', 'Crispy fried pork belly with rice', 130, '', 1, 1, 1, 0),
(20, 4, 'Sago’t Gulaman', 'Sweet tapioca pearls and gelatin drink', 25, '', 1, 0, 1, 1),
(21, 4, 'Siopao', 'Steamed bun with pork filling', 40, '', 1, 0, 1, 1);

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
(1, 1),
(1, 3),
(1, 5),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 3),
(5, 5);

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
(2, 2, 1, '2024-09-21 18:15:49', 123, 'pending');

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
(7, 2, 5, 2, 240);

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
(1, 'Boss Sisig!', 2, NULL, NULL, 'BossSisigProfile.jpg', 'BossSisigBanner.jpg', 1),
(2, 'Ninong Ry’s Special Delicacy Stall', 3, NULL, NULL, 'NinongRySpecialDelicacy.jpg', 'NinongRySpecialDelicacyBanner.jpg', 1),
(3, 'Mekus Mekus Tayo Insan!', 4, NULL, NULL, 'MekusMekusTayoInsan.jpg', 'MekusMekusTayoInsanBanner.jpeg', 1),
(4, 'Masamsamit So Adele', 7, NULL, NULL, 'MasamsamitSoAdele.jpg', 'MasamsamitSoAdeleBanner.jpg', 1);

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
(1, 1, 1, 2);

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
  `user_type` enum('user','stall_owner') DEFAULT 'user'
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
(8, '03-2223-696900', 'Francis2', 'Gonzales2', 'gonzales2.francis@gmail.com', 'password2', '09696969692', 'user');

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
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stalls`
--
ALTER TABLE `stalls`
  MODIFY `stall_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `trays`
--
ALTER TABLE `trays`
  MODIFY `tray_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
