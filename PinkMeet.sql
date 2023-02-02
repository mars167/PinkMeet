-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-04-23 13:22:47
-- 服务器版本： 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.29-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joe_PinkMeet`
--
CREATE DATABASE IF NOT EXISTS `joe_PinkMeet` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `joe_PinkMeet`;

-- --------------------------------------------------------

--
-- 表的结构 `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL COMMENT '喜欢记录id',
  `like_id` int(11) NOT NULL COMMENT '点赞的用户id',
  `belike_id` int(11) NOT NULL COMMENT '被点赞的用户id',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '点赞的时间',
  `count_time` int(11) DEFAULT NULL COMMENT '点赞的次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='喜欢记录';

--
-- 转存表中的数据 `likes`
--

INSERT INTO `likes` (`id`, `like_id`, `belike_id`, `time`, `count_time`) VALUES
(1, 5, 6, '2018-04-22 11:56:58', 7),
(2, 5, 7, '2018-04-22 11:56:13', 8),
(3, 7, 4, '2018-04-22 13:04:26', 21),
(4, 7, 5, '2018-04-22 13:01:53', 40),
(5, 4, 7, '2018-04-22 13:02:30', 0);

-- --------------------------------------------------------

--
-- 表的结构 `photoes`
--

CREATE TABLE `photoes` (
  `id` int(16) NOT NULL COMMENT '照片id',
  `uid` int(16) NOT NULL COMMENT '用户id',
  `filename` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '照片文件名',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='照片表';

--
-- 转存表中的数据 `photoes`
--

INSERT INTO `photoes` (`id`, `uid`, `filename`, `update_time`) VALUES
(1, 4, '1524386150558.jpg', '2018-04-22 08:35:50'),
(2, 6, '1524394195916.jpg', '2018-04-22 10:49:55'),
(3, 7, '1524394317542.jpg', '2018-04-22 10:51:57'),
(4, 8, '1524402354990.jpg', '2018-04-22 13:05:54'),
(5, 9, '1524402593917.jpg', '2018-04-22 13:09:53'),
(6, 10, '1524402621019.jpg', '2018-04-22 13:10:21');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(16) NOT NULL COMMENT '用户id',
  `cell_number` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户电话号码',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `sex` tinyint(2) NOT NULL COMMENT '性别 0:男 1:女',
  `profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '个人简介',
  `reg_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近登录时间',
  `contact` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '联系方式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `cell_number`, `username`, `password`, `sex`, `profile`, `reg_time`, `login_time`, `contact`) VALUES
(4, '12345678900', '周南', '123', 0, '666', '2018-04-22 08:35:35', '2018-04-22 05:44:34', '116'),
(6, '98765432100', 'aaa', 'aaa', 1, 'aaa', '2018-04-22 09:00:13', '2018-04-22 09:00:13', 'aaa'),
(7, '11111111111', '三森玲子', '123', 1, '我森美如画', '2018-04-22 10:51:31', '2018-04-22 10:51:31', 'no'),
(8, '22222222222', 'a', '123', 0, 'a', '2018-04-22 13:05:08', '2018-04-22 13:05:08', 'a'),
(9, '33333333333', 'bb', '123', 0, 'bb', '2018-04-22 13:09:42', '2018-04-22 13:09:42', 'bb'),
(10, '44444444444', 'cc', '123', 0, 'cc', '2018-04-22 13:10:11', '2018-04-22 13:10:11', 'cc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `like_id` (`like_id`),
  ADD KEY `belike_id` (`belike_id`);

--
-- Indexes for table `photoes`
--
ALTER TABLE `photoes`
  ADD PRIMARY KEY (`id`,`uid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`,`cell_number`),
  ADD UNIQUE KEY `cell_number` (`cell_number`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '喜欢记录id', AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `photoes`
--
ALTER TABLE `photoes`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '照片id', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '用户id', AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
