-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2025 at 02:07 PM
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
-- Database: `chain_of_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `password`, `phone`, `address`, `registration_date`) VALUES
(1, 'John Doe', 'johndoe@example.com', 'password123', '123-456-7890', '123 Elm St, Cityville', '2025-04-07 08:32:40'),
(2, 'Jane Smith', 'janesmith@example.com', 'password123', '098-765-4321', '456 Oak St, Townsville', '2025-04-07 08:32:40'),
(3, 'Jane Customer', 'customer@example.com', '$2y$10$apjUkFY/vovUejHMR5S9xeNEPWTIuUBGGkZTezkNbeweAzTWP1ROC', '9876543210', '123 Main Street', '2025-04-07 21:06:11'),
(4, 'Nazmus Sakib', 'sakib@gmail.com', '$2y$10$Y7sMZjxJbrwlqFXgPejsIuE8IUBTGlrVcmkjILw9uiTr5mIk7.J7m', NULL, NULL, '2025-04-08 10:27:15'),
(5, 'rownok raisa', 'raisa1@gmail.com', '$2y$10$qcbKSQ8gRXu7d.V47SFDueC0TSDUC0zKFYudu/QdP9HR3i1yvSQq.', NULL, NULL, '2025-04-10 13:04:22'),
(6, 'Nazmus Sakib', 'nazmus@gmail.com', '$2y$10$WPYXRn2HWuybHQQJXmsFtOCFPhMA6FTgaJeG2HyTva1bTFGh/xV3W', NULL, NULL, '2025-04-11 19:36:50'),
(7, 'sazia sultana', 'sazia@gmail.com', '$2y$10$cUbDSL8TsG8RkxKMNdM0q.noOhha5w9nCQPe7SqTaucfr1ZtxCKmS', NULL, NULL, '2025-04-12 16:18:05');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('manager','salesman') NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `hire_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `name`, `email`, `password`, `role`, `phone`, `hire_date`) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', 'manager123', 'manager', '555-111-2222', '2025-04-07 08:32:40'),
(2, 'Bob Williams', 'bob.williams@example.com', 'salesman123', 'salesman', '555-222-3333', '2025-04-07 08:32:40'),
(3, 'Charlie Brown', 'charlie.brown@example.com', 'salesman123', 'salesman', '555-333-4444', '2025-04-07 08:32:40'),
(16, 'Store Manager', 'manager@store.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'manager', '5551112222', '2025-04-08 16:22:02'),
(17, 'Sales Person', 'salesman@store.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'salesman', '5553334444', '2025-04-08 16:22:02'),
(18, 'anonna', 'rownok@gmail.com', '$2y$10$51GPWOKRSWYM.Xgf3ieHCuLknMCcYTSoKpPVY94yGTfJgEV1bSoy2', 'salesman', NULL, '2025-04-09 18:34:31'),
(19, 'hasina', 'hasina@gmail.com', '$2y$10$TzDOqZlEpvkbtP8RCGmETuClIJ0F9TajuF/EttTloUR0eDrLrBGhe', 'salesman', NULL, '2025-04-10 13:07:04'),
(20, 'al amin', 'al@gmail.com', '$2y$10$ko/Nvq/Jm7jXTaM5MFIwXeN1tw96sbpB76lXtcR4SK8B/87z54Jca', 'manager', NULL, '2025-04-11 19:39:06'),
(21, 'Asraf Shifat', 'shifat@gmail.com', '$2y$10$gy/zXxqBYCwdux05YXmPreq6d.ClGWyDyEFxfBJYg1.e0hUK2PJUC', 'salesman', NULL, '2025-04-11 19:41:22'),
(22, 'jitu', 'jitu@gmail.com', '$2y$10$M1J5WVOWCXS2/OtfaRo.XOyMUO6Ye4yvpSGPh6gSo8bwkE4opwqWi', 'salesman', NULL, '2025-04-12 16:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `employee_store_assignments`
--

CREATE TABLE `employee_store_assignments` (
  `assignment_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_store_assignments`
--

INSERT INTO `employee_store_assignments` (`assignment_id`, `employee_id`, `store_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 19, 2),
(5, 18, 2),
(6, 20, 7),
(7, 21, 6),
(8, 19, 3),
(9, 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL COMMENT 'Path or URL to the product image',
  `is_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `stock_quantity`, `store_id`, `image_path`, `is_deleted`) VALUES
(1, 'Organic Fuji Apples', 'Sweet and crisp organic apples', 3.49, 85, 3, 'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb', 0),
(2, 'Bananas', 'Fresh yellow bananas', 0.59, 120, 4, 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e', 0),
(3, 'Hass Avocados', 'Ripe premium avocados', 1.99, 57, 5, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(4, 'Organic Spinach', 'Pre-washed spinach', 2.99, 41, 1, 'https://images.unsplash.com/photo-1576045057995-568f588f82fb', 0),
(5, 'Romaine Lettuce', 'Crisp romaine hearts', 1.49, 63, 2, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(6, 'Organic Strawberries', 'Sweet seasonal berries', 4.99, 38, 3, 'https://images.unsplash.com/photo-1464965911861-746a04b4bca6', 0),
(7, 'Red Grapes', 'Seedless red grapes', 3.29, 52, 4, 'https://images.unsplash.com/photo-1550258987-190a2d41a8ba', 0),
(8, 'Organic Carrots', 'Crunchy carrots', 1.29, 74, 5, 'https://images.unsplash.com/photo-1447175008436-054170c2e979', 0),
(9, 'Cherry Tomatoes', 'Vine-ripened tomatoes', 2.99, 24, 1, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(10, 'Organic Blueberries', 'Antioxidant-rich', 3.99, 29, 2, 'https://images.unsplash.com/photo-1457282367193-e3b79e38f207', 0),
(11, 'Green Bell Peppers', 'Fresh crisp peppers', 1.49, 58, 3, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(12, 'Cucumbers', 'English cucumbers', 0.99, 72, 4, 'https://images.unsplash.com/photo-1604977048615-6877dbff7a9e', 0),
(13, 'White Mushrooms', 'Fresh button mushrooms', 2.49, 41, 5, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(14, 'Red Onions', 'Medium red onions', 1.19, 65, 1, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(15, 'Garlic', 'Fresh garlic bulbs', 0.79, 89, 2, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(16, 'Sweet Potatoes', 'Organic sweet potatoes', 1.99, 53, 3, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(17, 'Lemons', 'Juicy fresh lemons', 0.69, 97, 4, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(18, 'Limes', 'Fresh key limes', 0.59, 84, 5, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(19, 'Pineapple', 'Whole fresh pineapple', 2.99, 36, 1, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(20, 'Watermelon', 'Seedless watermelon', 4.99, 22, 2, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(21, 'Organic Whole Milk', '1 gallon', 4.99, 32, 3, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(22, 'Free Range Eggs', 'Dozen large', 3.49, 68, 4, 'https://images.unsplash.com/photo-1587486913049-53fc88980cfc', 0),
(23, 'Greek Yogurt', 'Non-fat plain', 1.29, 92, 5, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(24, 'Sharp Cheddar', 'Aged 12 months', 4.49, 53, 1, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(25, 'Organic Butter', 'Sweet cream', 3.99, 41, 2, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(26, 'Mozzarella', 'Fresh shredded', 3.29, 47, 3, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(27, 'Almond Milk', 'Unsweetened', 3.49, 58, 4, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(28, 'Cottage Cheese', 'Low-fat', 2.99, 39, 5, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(29, 'Sour Cream', 'Organic', 2.49, 45, 1, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(30, 'Heavy Cream', 'Pint', 3.79, 28, 2, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(31, 'Provolone', 'Sliced', 4.99, 36, 3, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(32, 'Swiss Cheese', 'Sliced', 5.49, 29, 4, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(33, 'Half & Half', 'Pint', 2.99, 42, 5, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(34, 'Ricotta', 'Whole milk', 3.29, 31, 1, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(35, 'Goat Cheese', 'Crumbled', 4.99, 24, 2, 'https://images.unsplash.com/photo-1550583724-b2692b85b150', 0),
(36, 'Bluetooth Speaker', 'Portable waterproof', 49.99, 15, 3, 'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb', 0),
(37, 'Wireless Earbuds', 'Noise cancelling', 79.99, 22, 4, 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df', 0),
(38, 'USB-C Cable', '6ft braided', 12.99, 48, 5, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(39, 'Power Bank', '10000mAh', 29.99, 19, 1, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(40, 'Smart Watch', 'Fitness tracker', 89.99, 12, 2, 'https://images.unsplash.com/photo-1558126319-c9feecbf57ce', 0),
(41, 'HDMI Cable', '4K 6ft', 14.99, 36, 3, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(42, 'Wireless Charger', 'Qi compatible', 19.99, 28, 4, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(43, 'Phone Case', 'iPhone 13 Pro', 24.99, 42, 5, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(44, 'Screen Protector', 'Tempered glass', 9.99, 57, 1, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(45, 'LED Desk Lamp', 'Adjustable', 34.99, 16, 2, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(46, 'External SSD', '1TB portable', 99.99, 9, 3, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(47, 'Webcam', '1080p HD', 49.99, 14, 4, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(48, 'Keyboard', 'Wireless mechanical', 59.99, 11, 5, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(49, 'Computer Mouse', 'Ergonomic wireless', 29.99, 23, 1, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(50, 'USB Flash Drive', '128GB', 19.99, 38, 2, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(51, 'Ethernet Cable', 'Cat6 10ft', 12.99, 27, 3, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(52, 'Portable Monitor', '15.6\" HD', 149.99, 7, 4, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(53, 'Laptop Stand', 'Aluminum adjustable', 24.99, 19, 5, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(54, 'Noise Cancelling Headphones', 'Over-ear', 129.99, 8, 1, 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df', 0),
(55, 'Smart Plug', 'WiFi enabled', 19.99, 31, 2, 'https://images.unsplash.com/photo-1598940603846-a1edd0ef2574', 0),
(56, 'Chicken Breast', 'Boneless skinless', 5.99, 28, 3, 'https://images.unsplash.com/photo-1559844484-e530929521f4', 0),
(57, 'Ground Beef', '80% lean', 4.99, 36, 4, 'https://images.unsplash.com/photo-1558030006-450675393462', 0),
(58, 'Salmon Fillet', 'Atlantic', 8.99, 19, 5, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2', 0),
(59, 'Pork Chops', 'Bone-in', 6.49, 24, 1, 'https://images.unsplash.com/photo-1559844484-e530929521f4', 0),
(60, 'Turkey Breast', 'Fresh whole', 3.99, 17, 2, 'https://images.unsplash.com/photo-1559844484-e530929521f4', 0),
(61, 'Bacon', 'Thick cut', 5.49, 32, 3, 'https://images.unsplash.com/photo-1559844484-e530929521f4', 0),
(62, 'Sausage Links', 'Breakfast style', 4.29, 26, 4, 'https://images.unsplash.com/photo-1559844484-e530929521f4', 0),
(63, 'Ribeye Steak', 'USDA Choice', 12.99, 14, 5, 'https://images.unsplash.com/photo-1558030006-450675393462', 0),
(64, 'Ground Turkey', '93% lean', 5.29, 21, 1, 'https://images.unsplash.com/photo-1559844484-e530929521f4', 0),
(65, 'Tilapia Fillet', 'Fresh never frozen', 7.49, 18, 2, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2', 0),
(66, 'Whole Grain Bread', 'Fresh baked', 3.99, 45, 3, 'https://images.unsplash.com/photo-1509440159596-0249088772ff', 0),
(67, 'Bagels', 'Plain', 2.49, 37, 4, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(68, 'Croissants', 'Buttery', 3.29, 29, 5, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(69, 'Cinnamon Rolls', 'Fresh baked', 4.99, 18, 1, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(70, 'Sourdough Bread', 'Artisan', 5.49, 22, 2, 'https://images.unsplash.com/photo-1509440159596-0249088772ff', 0),
(71, 'Chocolate Chip Cookies', 'Soft baked', 3.99, 41, 3, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(72, 'French Baguette', 'Crusty', 2.99, 33, 4, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(73, 'Blueberry Muffins', 'Jumbo', 2.49, 27, 5, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(74, 'Donuts', 'Glazed', 1.99, 39, 1, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(75, 'Pita Bread', 'Whole wheat', 3.29, 31, 2, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(76, 'Banana Bread', 'Homemade', 5.99, 16, 3, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(77, 'Dinner Rolls', 'Soft', 3.49, 28, 4, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(78, 'Pound Cake', 'Classic', 6.99, 13, 5, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(79, 'Brioche Buns', 'Buttery', 4.29, 24, 1, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(80, 'Apple Pie', 'Fresh baked', 8.99, 7, 2, 'https://images.unsplash.com/photo-1586449480533-90ab17a1d6d2', 0),
(81, 'Extra Virgin Olive Oil', 'Premium', 8.99, 42, 3, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(82, 'Organic Honey', 'Pure raw', 6.49, 31, 4, 'https://images.unsplash.com/photo-1587049352851-8d4e89133924', 0),
(83, 'Sea Salt', 'Fine ground', 2.99, 57, 5, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(84, 'Black Pepper', 'Whole peppercorns', 3.49, 49, 1, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(85, 'Organic Sugar', 'Cane sugar', 4.99, 38, 2, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(86, 'All-Purpose Flour', '5lb bag', 2.99, 53, 3, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(87, 'Pasta', 'Spaghetti', 1.49, 67, 4, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(88, 'Rice', 'Jasmine 5lb', 3.99, 45, 5, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(89, 'Canned Tomatoes', 'Crushed', 1.29, 72, 1, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(90, 'Peanut Butter', 'Creamy', 3.49, 58, 2, 'https://images.unsplash.com/photo-1623428187961-7f7d2d6c6d10', 0),
(91, 'Oatmeal', 'Steel cut', 4.29, 39, 3, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(92, 'Almonds', 'Raw whole', 7.99, 26, 4, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(93, 'Coffee', 'Dark roast', 8.99, 34, 5, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(94, 'Tea Bags', 'Assorted flavors', 3.99, 47, 1, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(95, 'Cereal', 'Whole grain', 3.49, 52, 2, 'https://images.unsplash.com/photo-1534308983496-4fabb1a015ee', 0),
(96, 'Chicken Broth', 'Low sodium', 2.49, 63, 3, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(97, 'Canned Beans', 'Black beans', 0.99, 88, 4, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(98, 'Maple Syrup', 'Pure grade A', 9.99, 19, 5, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(99, 'Vinegar', 'Apple cider', 2.99, 42, 1, 'https://images.unsplash.com/photo-1594282486555-1b5c6a1ad0d4', 0),
(100, 'Dark Chocolate', '70% cocoa', 2.99, 64, 2, 'https://images.unsplash.com/photo-1571115177098-24ec42ed204d', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `review_text` text DEFAULT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `customer_id`, `product_id`, `rating`, `review_text`, `review_date`) VALUES
(5, 6, 1, 5, 'good', '2025-04-11 19:38:03'),
(6, 7, 2, 5, 'good but ripe', '2025-04-12 16:21:01');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `customer_id`, `product_id`, `quantity`, `total_price`, `sale_date`, `employee_id`) VALUES
(9, NULL, 80, 2, 17.98, '2025-04-11 19:43:37', 19),
(10, NULL, 9, 23, 68.77, '2025-04-12 16:25:05', 22);

-- --------------------------------------------------------

--
-- Table structure for table `sales_reports`
--

CREATE TABLE `sales_reports` (
  `report_id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `report_month` date DEFAULT NULL,
  `total_sales` decimal(10,2) NOT NULL,
  `total_revenue` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_reports`
--

INSERT INTO `sales_reports` (`report_id`, `store_id`, `report_month`, `total_sales`, `total_revenue`) VALUES
(1, 1, '2025-04-01', 50.00, 49999.50),
(2, 2, '2025-04-01', 30.00, 20999.70);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `store_name`, `location`, `manager_id`) VALUES
(1, 'Cityville store', '123 High St, Cityville', 1),
(2, 'Townsville store', '789 Maple St, Townsville', 1),
(3, 'Main Downtown Store', '123 Main St, Anytown', NULL),
(4, 'Northside Mall Branch', '456 Mall Rd, Northside', NULL),
(5, 'Westside Superstore', '789 West Ave, Westside', NULL),
(6, 'basundhara block c', 'road no 1, house no 29,basundhara R/A', 1),
(7, 'basundhara block A', 'road no 03, house no 56,basundhara R/A', 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('manager','employee','customer') NOT NULL DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Nazmus Sakib', 'sakib@gmail.com', '$2y$10$tPhIcQCFhysZAU.Z4FLcXe3qRq2lpRgrKc8WEISFLlhvorR3ym7rG', 'customer', '2025-04-07 17:35:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `employee_store_assignments`
--
ALTER TABLE `employee_store_assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `reviews_ibfk_2` (`product_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `sales_reports`
--
ALTER TABLE `sales_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `employee_store_assignments`
--
ALTER TABLE `employee_store_assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sales_reports`
--
ALTER TABLE `sales_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_store_assignments`
--
ALTER TABLE `employee_store_assignments`
  ADD CONSTRAINT `employee_store_assignments_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `employee_store_assignments_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `sales_reports`
--
ALTER TABLE `sales_reports`
  ADD CONSTRAINT `sales_reports_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
