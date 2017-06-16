-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 01, 2016 at 01:33 PM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `fb_comment`
--


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
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `fb_post`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `fb_post_likes`
--


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
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `fb_users`
--

INSERT INTO `fb_users` (`user_id`, `name`, `email`, `phone`, `created_date`) VALUES
(1, 'John Smith', 'john@domain.com', '7894561230', '2015-12-07 21:48:31'),
(2, 'Kevin Flynn', 'kevin@domain.com', '4567891230', '2015-12-07 21:48:53');
