-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2023 at 05:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshop1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'BANDAI'),
(2, 'Card Brand'),
(3, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(0, 3, '::1', 25, 1),
(272, 72, '::1', 12, 1),
(281, 1, '::1', 12, 1),
(282, 8, '::1', 12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Yugioh'),
(2, 'Ultraman'),
(3, 'Buddy Fight'),
(4, 'Masked Rider'),
(5, 'Battle Spirits'),
(6, 'CardFight Vanguard'),
(7, 'Bakugan Battle Brawlers');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'supportreddy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Pannatad', 'aristoon1@gmail.com', 'Samutprakarn', 'Samutprakarn', 'Samutprakarn', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 1, 199, 1234),
(2, 25, 'otheruser user', 'otheruser@gmail.com', 'Bangkok', 'Udomsuk', 'Kumbalagodu', 200122, 'VISA', '1111111111111', '12/22', 1, 480, 324);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'TCG: Legend of The Crystal Beasts Structure Deck', 199, 'TCG: Legend of The Crystal Beasts Structure Deck', 'y1.png', 'TCG,Yugioh'),
(2, 1, 2, 'Yu-Gi-Oh! Cards: Albaz Strike Structure Deck', 199, 'Yu-Gi-Oh! Cards: Albaz Strike Structure Deck', 'y2.png', 'TCG,Yugioh'),
(3, 1, 2, 'Yu-Gi-Oh! Trading Cards Cyber Strike Structure Deck, Multicolor', 199, 'Yu-Gi-Oh! Trading Cards Cyber Strike Structure Deck, Multicolor', 'y3.png', 'TCG,Yugioh'),
(4, 1, 2, 'Saga of Blue Eyes White Dragon Structure Deck', 199, 'Saga of Blue Eyes White Dragon Structure Deck', 'y4.png', 'TCG,Yugioh'),
(5, 1, 2, 'Yu-Gi-Oh! TCG: Dark World Structure Deck', 199, 'Yu-Gi-Oh! TCG: Dark World Structure Deck', 'y5.png', 'TCG,Yugioh'),
(6, 1, 2, 'Yu-Gi-Oh! Trading Cards Cards: Egyptian God SLIFER Deck, Multicolor', 199, 'Yu-Gi-Oh! Trading Cards Cards: Egyptian God SLIFER Deck, Multicolor', 'y6.png', 'TCG,Yugioh'),
(7, 1, 2, 'Yu-Gi-Oh! Trading Cards Egyptian God Obelisk Deck, Multicolor', 219, 'Yu-Gi-Oh! Trading Cards Egyptian God Obelisk Deck, Multicolor', 'y7.png', 'TCG,Yugioh'),
(8, 1, 2, 'Yu-Gi-Oh! Trading Cards: Sacred Beasts Structure Deck, Multicolor', 219, 'Yu-Gi-Oh! Trading Cards: Sacred Beasts Structure Deck, Multicolor', 'y8.png', 'TCG,Yugioh'),
(9, 1, 2, 'Yu-Gi-Oh! Trading Cards: Mechanized Madness Structure Deck', 219, 'Yu-Gi-Oh! Trading Cards: Mechanized Madness Structure Deck', 'y9.png', 'TCG,Yugioh'),
(10, 2, 1, 'Ultraman Tiga - Ultraman Tiga Multi Type, Bandai Spirits S.H.Figuarts', 450, 'Tamashi Nations - Ultraman Tiga - (Shinkocchouseihou) Ultraman Tiga Multi Type, Bandai Spirits S.H.Figuarts', 'u1.png', 'Ultraman,Tiga'),
(11, 2, 1, 'Shin Ultraman - Ultraman (Shin Ultraman), Bandai Spirits Dynaction', 450, 'Tamashi Nations - Shin Ultraman - Ultraman (Shin Ultraman), Bandai Spirits Dynaction', 'u2.png', 'Ultraman,Shin'),
(12, 2, 1, 'Ultraman Decker - Ultraman Decker Flash Type, Bandai Spirits', 450, 'TAMASHII NATIONS - Ultraman Decker - Ultraman Decker Flash Type, Bandai Spirits S.H.Figuarts Action Figure', 'u3.png', 'Ultraman,Decker'),
(13, 2, 1, 'Ultraman Dyna Hero Statue Flash Type PVC Figure Figurine', 595, 'Banpresto Ultraman Dyna Hero Statue Flash Type PVC Figure Figurine 16cm', 'u4.png', 'Ultraman,Dyna'),
(14, 2, 1, 'Ultraman Taiga (Ultraman Taiga & Ultra Heroes) Bandai Ichiban Figure', 550, 'Ultraman Taiga (Ultraman Taiga & Ultra Heroes) Ultraman Taiga, Bandai Ichiban Figure, Ultraman Taiga (Ultraman Taiga & Ultra Heroes) Bandai Ichiban Figure', 'u5.png', 'Ultraman,Taiga'),
(15, 2, 1, 'Bandai Ultraman Ultra Monster Series 115 Takkongu', 500, 'Bandai Ultraman Ultra Monster Series 115 Takkongu', 'u6.png', 'Ultraman,Monster Series'),
(16, 3, 2, 'Buddyfight Subaru Hoshiyomi & Crossnize Card Game Character Deck', 199, 'Future Card Buddyfight Subaru Hoshiyomi & Crossnize Card Game Character Deck Box Case Holder Collection V2 Vol.425 Anime Art', 'buddy1.png', 'Buddy Fight'),
(17, 3, 2, 'Buddyfight Masato Rikuo & Agito Card Game Character Deck\r\n', 199, 'Future Card Buddyfight Masato Rikuo & Agito Card Game Character Deck Box Case Holder Collection V2 Vol.426 Anime Art\r\n', 'buddy2.png', 'Buddy Fight'),
(19, 3, 2, 'Buddyfight Ranma & Vanity Card Game Character Storage ', 199, 'Future Card Buddyfight Ranma & Vanity Card Game Character Storage Box Case Holder Collection V2 Vol.501 Anime Art', 'buddy3.png', 'Buddy Fight'),
(20, 3, 2, 'Buddyfight Starter Deck BFE-S-SD02: Triangulum Galaxy', 199, 'FutureCard Buddyfight Starter Deck BFE-S-SD02: Triangulum Galaxy', 'buddy4.png', 'Buddy Fight'),
(21, 3, 2, 'Buddyfight Tomorrow Asmodai Starter Trial Deck ', 199, 'Buddyfight Tomorrow Asmodai Starter Trial Deck Future Card Buddy Fight TCG English BFE-TD07 - 52 cards', 'buddy5.png', 'Buddy Fight'),
(22, 4, 1, 'Masked Rider Decade - Spirits Figure-rise Standard', 950, 'Masked Rider Decade - Spirits Figure-rise Standard', 'm1.png', 'Masked Rider,Decade'),
(23, 4, 1, 'Kamen Rider - Figure-Rise Standard Masked Rider Faiz', 875, 'Kamen Rider - Figure-Rise Standard Masked Rider Faiz', 'm2.png', 'Masked Rider,Faiz'),
(24, 4, 1, 'Kamen Rider - Masked Rider Hibiki SpiritsFigure-Rise Standard', 700, 'Kamen Rider - Masked Rider Hibiki, Bandai SpiritsFigure-Rise Standard', 'm3.png', 'Masked Rider,Hibiki'),
(25, 4, 1, 'Masked Rider Kuuga Mighty Form Masked Rider Kuuga', 750, 'Masked Rider Kuuga Mighty Form Masked Rider Kuuga', 'm4.png', 'Masked Rider,Kuuga'),
(27, 4, 1, 'Kamen Rider - Figure-Rise Standard Masked Rider Kabuto', 690, 'Kamen Rider - Figure-Rise Standard Masked Rider Kabuto', 'm5.png', 'Masked Rider,Kabuto'),
(32, 5, 2, 'Battle Spirits - New Series : Hero [Red Deck]\r\nBeginner Deck', 655, 'Battle Spirits - New Series : Hero [Red Deck]', 'battle1.png', 'Battle Spirits,Hero'),
(33, 6, 2, 'Cardfight!! Vanguard Overdress VGE-D-SD03 Tohya Ebata Starter Deck', 299, 'Cardfight!! Vanguard Overdress VGE-D-SD03 Tohya Ebata Starter Deck English - 50 Cards', 'card1.png', 'Vanguard'),
(34, 6, 2, 'Bushiroad CARDFIGHT!! Vanguard Overdress Start Deck 02: Danji Momoyama', 299, 'Bushiroad CARDFIGHT!! Vanguard Overdress Start Deck 02: Danji Momoyama -Tyrant Tiger-', 'card2.png', 'Vanguard'),
(35, 6, 2, 'Cardfight!! Vanguard Overdress Megumi Okura Starter Deck', 299, 'Cardfight!! Vanguard Overdress VGE-D-SD04 Megumi Okura Starter Deck English - 50 Cards', 'card3.png', 'Vanguard'),
(36, 6, 2, 'Cardfight!! Vanguard Yu-yu Kondo Starter Deck', 299, 'Cardfight!! Vanguard VGE-D-SD01 Yu-yu Kondo Starter Deck English - 50 Cards', 'card4.png', 'Vanguard'),
(37, 6, 2, 'Cardfight Vanguard: Trial Deck V4 - Ren Suzugamori ', 299, 'Cardfight Vanguard: Trial Deck V4 - Ren Suzugamori (V-TD04)', 'card5.png', 'Vanguard'),
(38, 6, 2, 'Cardfight Vanguard Custom Play Mat CCG \r\n', 550, 'Cardfight Vanguard Custom Play Mat CCG Play Mat Deck Play Mat\r\n', 'card6.png', 'Vanguard'),
(39, 6, 2, 'GMC Deluxe CARDFIGHT!! Vanguard Gaming Guard and Guardian Circles', 745, 'GMC Deluxe CARDFIGHT!! Vanguard Gaming Mat with Rear Guard and Guardian Circles - 2 Player TCG Mat Board Playmat - Water Resistant Card Gaming Mat', 'card7.png', 'Vanguard'),
(40, 2, 1, 'Bandai Movie Monster Series Gamera (Guardian of Universe 1995)', 500, 'Bandai Movie Monster Series Gamera (1995)', 'u7.png', 'Ultraman,Monster Series'),
(45, 1, 2, 'Konami YuGiOh Trading Card Game Starter Deck: Codebreaker', 219, 'Konami YuGiOh Trading Card Game Starter Deck: Codebreaker', 'y10.png', 'TCG,Yugioh'),
(46, 1, 2, 'Yugioh Structure Deck Dragons of light and dark Collide SDDC Sealed', 219, 'Yugioh Structure Deck Dragons Collide SDDC Sealed', 'y11.png', 'TCG,Yugioh'),
(47, 4, 1, 'Kamen Rider - Figure-Rise Standard Masked Rider Agito Ground Form', 650, 'Kamen Rider - Figure-Rise Standard Masked Rider Agito Ground Form', 'm6.png', 'Masked Rider,Agito'),
(48, 1, 2, 'YU-GI-OH! Yugioh 2014 Trading Card Game Super Starter Deck Space-TIME', 250, 'YU-GI-OH! Yugioh 2014 Trading Card Game Super Starter Deck Space-TIME Showdown - 50 Cards!', 'y12.png', 'TCG,Yugioh'),
(49, 1, 2, 'Yu-Gi-Oh! TCG: Speed Duel - Ultimate Predators Starter Deck', 250, 'Yu-Gi-Oh! TCG: Speed Duel - Ultimate Predators Starter Deck', 'y13.png', 'TCG,Yugioh'),
(50, 3, 2, 'Buddyfight HUNDRED 500 yen start deck 2nd BF-H-SD02 Sunshine Heroes', 199, 'Future Card Buddyfight HUNDRED 500 yen start deck 2nd BF-H-SD02 Sunshine Heroes (japanese) by Bushiroad', 'buddy6.png', 'Buddy Fight'),
(51, 3, 2, 'Buddyfight Meru Yumegatari & Emma Akazukin Red Hood Card Game Character Deck', 199, 'Future Card Buddyfight Meru Yumegatari & Emma Akazukin Red Hood Card Game Character Deck Box Case Holder Collection V2 Vol.456 Anime Art', 'buddy7.png', 'Buddy Fight'),
(52, 3, 2, 'Buddyfight Miko Mikono & Amaterasu Electrodeity of Light Card Game Character Deck', 199, 'Future Card Buddyfight Miko Mikono & Amaterasu Electrodeity of Light Card Game Character Deck Box Case Holder Collection V2 Vol.455 Anime Art', 'buddy8.png', 'Buddy Fight'),
(53, 3, 2, 'Buddyfight Takokichi Omega Martian UFO Card Game Character Deck Box Case Holder Collection V2', 199, 'Future Card Buddyfight Takokichi Omega Martian UFO Card Game Character Deck Box Case Holder Collection V2 Vol.454 Anime Art', 'buddy9.png', 'Buddy Fight'),
(54, 0, 0, 'boys shirts', 290, 'shirts', 'ms2.JPG', 'suit boys shirts'),
(55, 0, 0, 'boys shirts', 259, 'shirts', 'ms3.JPG', 'suit boys shirts'),
(56, 1, 2, 'Yu-Gi-Oh Cards Zexal - Starter Deck - XYZ Symphony', 199, 'Konami 1 X Yu-Gi-Oh Cards Zexal - Starter Deck - XYZ Symphony', 'y18.png', 'Yugioh'),
(57, 0, 0, 'boys shirts', 260, 'shirts', 'i3.JPG', 'suit boys shirts'),
(58, 0, 0, 'boys shirts', 350, 'shirts', 'pm9.JPG', 'suit boys shirts'),
(59, 1, 2, 'Yu-Gi-Oh! Cards: Rising Rampage Special Edition Deck', 199, 'Yu-Gi-Oh! Cards: Rising Rampage Special Edition Deck | Genuine Cards', 'y17.png', 'Yugioh'),
(60, 4, 1, 'Masked Rider Black - Shadow Moon, Bandai Spirits S.H.Figuarts', 575, 'Tamashi Nations - Masked Rider Black - (Shinkoccho Seiho) Shadow Moon, Bandai Spirits S.H.Figuarts', 'm8.png', 'Masked Rider'),
(61, 4, 1, 'Bandai Hobby S.H. Figuarts Kamen Rider 1 \"Kamen Rider\" Action Figure', 600, 'Bandai Hobby S.H. Figuarts Kamen Rider 1 \"Kamen Rider\" Action Figure', 'm9.png', 'Masked Rider'),
(62, 1, 2, 'YuGiOh Machine Re-Volt 1st Edition Structure Deck - English', 199, 'YuGiOh Machine Re-Volt 1st Edition Structure Deck - English [Toy]', 'y19.png', 'Yugioh'),
(63, 6, 2, 'Cardfight!! Vanguard TCG - True Eradicator, Finish Blow Dragon G Booster Set 5', 199, 'Cardfight!! Vanguard TCG - True Eradicator, Finish Blow Dragon (G-BT05/006EN) - G Booster Set 5: Moonlit Dragonfang', 'card8.png', 'Cardfight Vanguard'),
(64, 6, 2, 'Cardfight!! Vanguard TCG - Fang of Light, Garmore  - Eclipse of Illusionary Shadows', 460, 'Cardfight!! Vanguard TCG - Fang of Light, Garmore (BT04/020EN) - Eclipse of Illusionary Shadows', 'card9.png', 'Cardfight Vanguard'),
(65, 7, 3, 'Bakugan Evolutions 2022 Platinum Series Die-cast Darkus Nillious\r\n', 210, 'Bakugan Evolutions 2022 Platinum Series Die-cast Darkus Nillious\r\n', 'bakugan4.png', 'Bakugan'),
(66, 0, 0, 'boys Jeans Pant', 480, 'pants', 'pt4.JPG', 'boys Jeans Pant'),
(67, 0, 0, 'boys Jeans Pant', 360, 'pants', 'pt5.JPG', 'boys Jeans Pant'),
(68, 0, 0, 'boys Jeans Pant', 550, 'pants', 'pt6.JPG', 'boys Jeans Pant'),
(69, 0, 0, 'boys Jeans Pant', 390, 'pants', 'pt7.JPG', 'boys Jeans Pant'),
(70, 1, 2, 'Yu-Gi-Oh! Trading Cards Spirit Charmers Structure Deck, Multicolor Deluxe Game Mats', 300, 'Yu-Gi-Oh! Trading Cards Spirit Charmers Structure Deck, Multicolor', 'y16.png', 'Yugioh'),
(71, 1, 2, 'Yu-gi-oh Trading Cards game Konami 2016 Starter Deck Yuya', 300, 'Yu-gi-oh Trading Cards game Konami 2016 Starter Deck Yuya', 'y14.png', 'TCG,Yugioh'),
(72, 7, 3, 'Bakugan Starter Pack 3-Pack, Nillious Ultra, Geogan Rising Collectible', 350, 'Bakugan Starter Pack 3-Pack, Nillious Ultra, Geogan Rising Collectible Action Figures', 'bakugan1.png', 'Bakugan'),
(73, 7, 3, 'Bakugan Legends, Nova Bakugan, Dragonoid, Light Up Bakugan Action Figures', 399, 'Bakugan Legends, Nova Bakugan, Dragonoid, Light Up Bakugan Action Figures, 1 Character Card and Metal Gate Card, Kids Toys for Boys Ages 6 and Up', 'bakugan2.png', 'Bakugan'),
(74, 1, 2, 'Yu-Gi-Oh Structure Deck - Yugi Muto - 1st Edition Factory Sealed', 785, 'Yu-Gi-Oh Structure Deck - Yugi Muto - 1st Edition Factory Sealed', 'y15.png', 'TCG,Yugioh'),
(79, 7, 3, 'Bakugan Evolutions, Griswing, Platinum Series True Metal Bakugan', 399, 'Bakugan Evolutions, Griswing, Platinum Series True Metal Bakugan, 2 BakuCores and Character Card, Kids Toys for Boys, Ages 6 and Up', 'bakugan3.png', 'Bakugan'),
(81, 4, 1, 'Masked Rider Ryuki SpiritsHobby Figure-Rise Standard', 799, 'Masked Rider Ryuki SpiritsHobby Figure-Rise Standard', 'm7.png', 'Masked Rider,Ryuki');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `review` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'support', '6662102367', 'Bangkok', 'Udomsuk');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneet', '1234446576', 'New York', 'Kumbalagodu');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `p_id`, `ip_add`, `user_id`) VALUES
(0, 1, '::1', 25),
(224, 0, '::1', 25),
(283, 73, '::1', 12),
(284, 74, '::1', 12),
(285, 0, '::1', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
