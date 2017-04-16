/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : wcj

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2017-04-16 08:59:52
*/

DROP DATABASE IF EXISTS wcj;
CREATE DATABASE IF NOT EXISTS wcj DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` varchar(20) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  `title` varchar(25) DEFAULT NULL,
  `dept` varchar(25) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(15) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  `name` varchar(25) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `school` varchar(25) DEFAULT NULL,
  `collage` varchar(25) DEFAULT NULL,
  `major` varchar(25) DEFAULT NULL,
  `grade` varchar(25) DEFAULT NULL,
  `birth` varchar(25) DEFAULT NULL,
  `nation` varchar(10) DEFAULT NULL,
  `politics_status` varchar(20) DEFAULT NULL,
  `gender` varchar(10) NOT NULL DEFAULT '男',
  `qq` varchar(12) DEFAULT NULL,
  `mobi` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `workInfo` text,
  `production` text,
  `expectWork` text,
  `skill` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO admin(tid,pwd,name,title,email,dept) VALUES (10001, '1e466ba0517464a4c2a2bd11b8c0ab87','张三','管理员','admin@sina.com','计算机学院');
