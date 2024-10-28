-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2024 at 11:50 AM
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
(40, 1, 'Tapsilog', '', 120, 'https://firebasestorage.googleapis.com/v0/b/upangeats.appspot.com/o/food%2F1_4.jpg?alt=media&token=0266df6a-b856-445a-9434-4f8715b1fc48', 1, 1, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food_items`
--
ALTER TABLE `food_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
