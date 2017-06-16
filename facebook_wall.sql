-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2017 at 10:20 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `facebook_wall`
--

-- --------------------------------------------------------

--
-- Table structure for table `fb_comment`
--

CREATE TABLE IF NOT EXISTS `fb_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `comment_date` datetime NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `fb_comment`
--

INSERT INTO `fb_comment` (`comment_id`, `post_id`, `user_id`, `comment`, `comment_date`) VALUES
(7, 16, 1, 'why tell me?', '2017-06-16 10:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `fb_post`
--

CREATE TABLE IF NOT EXISTS `fb_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `total_like` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `image` varchar(255) NOT NULL,
  `imagePost` varchar(255) NOT NULL,
  `videoPost` varchar(255) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `fb_post`
--

INSERT INTO `fb_post` (`post_id`, `user_id`, `content`, `total_like`, `date_created`, `image`, `imagePost`, `videoPost`) VALUES
(17, 1, 'masyallah....', 1, '2017-06-16 10:17:01', '', '', ''),
(16, 3, 'hello there, im so sorry.. i cannot wait and cannot dream tonite..', 1, '2017-06-16 10:16:46', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fb_post_likes`
--

CREATE TABLE IF NOT EXISTS `fb_post_likes` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `like_date` datetime NOT NULL,
  PRIMARY KEY (`like_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fb_post_likes`
--

INSERT INTO `fb_post_likes` (`like_id`, `post_id`, `user_id`, `like_date`) VALUES
(4, 16, 1, '2017-06-16 10:17:06'),
(3, 17, 1, '2017-06-16 10:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `fb_users`
--

CREATE TABLE IF NOT EXISTS `fb_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `created_date` datetime NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fb_users`
--

INSERT INTO `fb_users` (`user_id`, `name`, `email`, `phone`, `created_date`, `image`) VALUES
(1, 'Ustaz Don Daniyal', 'john@domain.com', '7894561230', '2015-12-07 21:48:31', 'roberta.jpg'),
(2, 'Ustaz Azhar', 'kevin@domain.com', '4567891230', '2015-12-07 21:48:53', 'kelvin.jpg'),
(3, 'Ahmad Solehin', 'solefehinjr@gmail.com', '999', '2016-09-22 09:26:00', 'sol.jpg'),
(4, 'Siti Mariam', 'solehntgjfinjr@gmail.com', '999', '2016-09-22 09:26:00', 'sol.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
