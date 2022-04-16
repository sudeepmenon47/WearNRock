-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2022 at 01:19 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wearnrock`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand`) VALUES
(1, 'Levis'),
(2, 'Nike'),
(8, 'Sketchers'),
(9, 'Polo'),
(10, 'Jockey'),
(11, 'Puma'),
(12, 'Lee'),
(13, 'GUCCI'),
(14, 'Dolce &amp; Gabbana'),
(15, 'TOMMY HILFIGER'),
(16, 'RbK'),
(17, 'Mochi'),
(18, 'adidas'),
(19, 'NORKO'),
(20, 'Mirage');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `shipped` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `parent`) VALUES
(1, 'Men', 0),
(2, 'Women', 0),
(3, 'Boys', 0),
(4, 'Girls', 0),
(5, 'Shirts', 1),
(6, 'Pants', 1),
(7, 'Shoe', 1),
(8, 'Accessories', 1),
(9, 'Shirts', 2),
(10, 'Pants', 2),
(11, 'Shoes', 2),
(12, 'Dresses', 2),
(13, 'Shirts', 3),
(14, 'Pants', 3),
(15, 'Dresses', 4),
(16, 'Shoes', 4),
(17, 'Accessories', 2),
(28, 'Gifts', 0),
(29, 'Home Decor', 28),
(36, 'Pants', 4),
(37, 'Shoes', 3),
(38, 'Kits', 28);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `list_price` decimal(10,2) NOT NULL,
  `brand` int(11) NOT NULL,
  `categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0,
  `sizes` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `list_price`, `brand`, `categories`, `image`, `description`, `featured`, `sizes`, `deleted`) VALUES
(1, 'NIKE Pant', '900.00', '1200.00', 2, '6', '/tutorial/images/products/945cbee48590a1bc2cb748fb2b056e35.png', 'These Pants are Amazing. They are super Comfy and Sexy! Buy Them before it get sold out ...', 1, '28:1:2,32:5:2,36:1:2', 0),
(2, 'Beautiful Shirt', '599.00', '799.00', 2, '5', '/tutorial/images/products/23837fc9668e5e6ec2de1f2f27a4c100.png', 'What a beautiful Shirt.... Blah blahh blah Buy it. We apent too much on our sites and It broke!', 1, 'small:1:,medium:6:,large:9:', 0),
(3, 'Test', '99.00', '199.00', 2, '29', '/tutorial/images/products/0ffe3c247ae0bec02ab06f993a5e5149.png,/tutorial/images/products/53c082f9b5b6a6d896eb290704ed84cd.png,/tutorial/images/products/6596389346e2db0dd2384b51ace37a01.png,/tutorial/images/products/ffc5fd6a2f25f977dfccefa8450e95ea.png,/tutorial/images/products/5302a9081ac43d6e94dffb3895316bed.png', 'They are perfect Gift For Professional Teaching Coaches!', 1, 'Small:1:2', 0),
(5, 'Girls Dress', '999.00', '1599.00', 14, '15', '/tutorial/images/products/d3de459166198bb7bf0628630c29cd53.png', 'Cool Dresses!!!', 1, 'small:2:,medium:10:', 0),
(6, 'NIKE Sketcher', '599.00', '999.00', 2, '14', '/tutorial/images/products/f1b0e40fde8f88f620e8ef697e76907c.png,/tutorial/images/products/11f72438eb8d1993586505633a59ee9a.png', 'Super Cool Pants,\r\nVery Much durable in the sense it is made up of Very Pure fine Fibre Material.!!', 1, 'small:5:2,medium:8:2,large:9:2', 0),
(7, 'GUCCI Shirt', '350.99', '550.99', 13, '13', '/tutorial/images/products/3b3ff52b16ef38770f53399b57504caa.png', 'Wow GUCCI&#039;s Shirt,\r\nFor Cool and Smart Boy&#039;s!!!', 1, 'small:5:2,medium:9:2', 0),
(8, 'T-Shirt', '300.00', '500.00', 15, '13', '/tutorial/images/products/4764ae9bd1b4aa8187f265e513e523d7.png', 'Superb Quality Clothing&#039;s from TOMMY HILFIGER!!!', 1, 'small:9:2,medium:9:2', 0),
(9, 'Ladies Shoes', '700.00', '800.00', 11, '11', '/tutorial/images/products/f23e946e5a9c8c04f4eb5c549169ead3.png', 'Best Fitting Shoes For Womans!!', 1, 'small:5:2,medium:1:2,large:5:2', 0),
(10, 'Ladies Purse', '1000.99', '1500.99', 14, '17', '/tutorial/images/products/9b45e8979dcb76d77f8e4d6ca16063fd.png', 'Latest Trend Accessory for Ladies!!!', 1, 'N/A:8:2', 0),
(11, 'High Heels', '1200.00', '1700.00', 17, '16', '/tutorial/images/products/c28c62961b685a119efd78a5b293ac54.jpg', 'Latest Trend Sandal&#039;s for Girl&#039;s!!!', 1, 'small:5:2,medium:4:2', 0),
(16, 'adidas Studs', '3000.00', '4500.00', 18, '37', '/tutorial/images/products/45532fc397562377d3586ad490eb92ad.jpg,/tutorial/images/products/273bfe4b177c6e55e3c0b7ce195d8434.jpg,/tutorial/images/products/ff3dc299aaa5d74a64fcce872c23cf9d.jpg,/tutorial/images/products/56e4b40a4f8f7144da77f10886afe956.jpg,/tutorial/images/products/587e5ec280c58d6a245ff46e4cf2949d.jpg,/tutorial/images/products/f4388e1dd0eab13fda6503e80b648b48.jpg,/tutorial/images/products/3297fc26791c1b6c90f0adca7dfca0cf.jpg,/tutorial/images/products/f23059f20d30841706b14abd76992980.jpg', 'Best Product From adidas!!!', 1, 'small:4:,medium:4:', 0),
(17, 'Football', '3500.00', '4000.00', 11, '38', '/tutorial/images/products/096862ca05b0c76b11ee4a5fad294400.jpg', 'Best Football Till Time!!!', 1, 'Size 5:10:2', 0),
(18, 'Blazer', '5000.00', '8000.00', 1, '5', '/tutorial/images/products/a692ca9e7c38c74c25d2d47bfcb31b6b.png', 'Best Slim Fit Blazers From Levi&#039;s!!!', 1, 'Medium:5:2,Large:9:2', 0),
(19, 'NIKE Studs', '3500.00', '6500.00', 2, '37', '/tutorial/images/products/2f533b7df2ed77179c4809cd34140445.png,/tutorial/images/products/63fc134f34469cfcb56798055a098447.png,/tutorial/images/products/d2b0c31df4ece92f90c12bb78fb61189.png,/tutorial/images/products/c93dc94c8234a5cb54b4eed381e6077e.png,/tutorial/images/products/aabcb77050227d9d507c65f316825c80.png,/tutorial/images/products/aab4ddfe7367330fdfe89a04780d783f.png,/tutorial/images/products/360978e44d6c688b3487bbd7402535df.png', 'Best Sneakers in market From NIKE!!!', 1, 'small:4:,medium:9:', 0),
(21, 'D&amp;G Pant', '599.00', '899.00', 14, '14', '/tutorial/images/products/52f270488d5823257f1438bc88859039.png', 'Good Quality Clothes from D&amp;G!!!', 1, 'small:5:2,medium:9:2,large:5:2', 0),
(22, 'Wrist Watch', '2000.00', '4000.00', 11, '8', '/tutorial/images/products/ccb514b1958c657f322945c2705159cd.png', 'Super cool, Best Quality wrist watches from PUMA!!', 1, 'N/A:8:', 0),
(23, 'Women Shirt', '1500.00', '2500.00', 13, '9', '/tutorial/images/products/9ba5b4c31eda754bb434f3c5111af735.png', 'Best product in Market!!', 1, 'medium:5:2,large:5:2', 0),
(24, 'Ladies pants', '1500.00', '2000.00', 14, '10', '/tutorial/images/products/63d08cb380739d117fec6006bd0dd748.png', 'Good Quality Product From D&amp;G!!!', 1, 'medium:7:2,large:5:2', 0),
(25, 'Mens Lotion', '500.00', '1000.00', 14, '8', '/tutorial/images/products/867733b09ec4c8e7369fe43f37177c21.png', 'Best Lotion from D&amp;G!', 1, 'N/A:1:2', 0),
(26, 'Mirage Gifts', '200.00', '400.00', 20, '29', '/tutorial/images/products/f029b7794b467a06bdab9ced7475c412.png', 'Cool Gifts!!!', 1, 'N/A:9:2', 0),
(27, 'Example', '100.00', '200.00', 10, '13', '/tutorial/images/products/67340f3a225bc0746ac9ee62fce625a9.png', '', 0, 'N/A:2:2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `charge_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cart_id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `txn_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `txn_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(175) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `join_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_login` datetime NOT NULL,
  `permissions` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `join_date`, `last_login`, `permissions`) VALUES
(1, 'Sudeep Menon', 'sudeepmenon47@gmail.com', 'password', '2022-04-01 15:38:44', '0000-00-00 00:00:00', 'admin,editor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
