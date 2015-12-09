CREATE DATABASE  IF NOT EXISTS `artedu` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `artedu`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: artedu
-- ------------------------------------------------------
-- Server version	5.7.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_course`
--

DROP TABLE IF EXISTS `t_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseTypeId` int(11) NOT NULL COMMENT '外键',
  `teacherId` int(11) NOT NULL COMMENT '外键',
  `courseName` varchar(20) NOT NULL,
  `courseDesc` varchar(500) NOT NULL COMMENT '对课程的详细描述，供学生和家长查看',
  `teachTime` varchar(100) NOT NULL,
  `totalStarLevel` varchar(10) NOT NULL COMMENT '根据所有选课学生对教师授课评价的星级，计算出总星级',
  `teachAddress` varchar(50) NOT NULL,
  `lessonNum` int(11) NOT NULL,
  `teachMethod` varchar(10) NOT NULL COMMENT '1.上门授课\n2.机构的教室',
  `listenTest` int(11) NOT NULL COMMENT '0：不支持试听\n1：支持试听',
  `coursePrice` float NOT NULL,
  `mainImage` varchar(100) NOT NULL COMMENT 'url',
  `planStuNum` int(11) NOT NULL COMMENT '每门课教授的学生数量是有限制的',
  `realStuNum` int(11) NOT NULL COMMENT '这门课报名的实际人数',
  `courseStatus` int(11) NOT NULL COMMENT '1000：已招满，不可报名\n1001：未招满，可报名\n1002：已停课，不可报名',
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course`
--

LOCK TABLES `t_course` WRITE;
/*!40000 ALTER TABLE `t_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_coursestudent`
--

DROP TABLE IF EXISTS `t_coursestudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_coursestudent` (
  `couStuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) NOT NULL COMMENT '外键',
  `courseId` int(11) NOT NULL COMMENT '外键',
  `signupTime` datetime NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `starLevel` varchar(10) DEFAULT NULL COMMENT '通过星星的数量来度量教师得分的高低',
  `csStatus` int(11) NOT NULL COMMENT '1003：学费已交，尚未来上课\n1004：正在上课\n1005：结束了所选的课程',
  PRIMARY KEY (`couStuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_coursestudent`
--

LOCK TABLES `t_coursestudent` WRITE;
/*!40000 ALTER TABLE `t_coursestudent` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_coursestudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_coursetype`
--

DROP TABLE IF EXISTS `t_coursetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_coursetype` (
  `courseTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseTypeName` varchar(20) NOT NULL COMMENT '用于对课程进行分类管理，每门课都属于一种课程类型',
  `imageId` varchar(200) NOT NULL COMMENT 'url',
  PRIMARY KEY (`courseTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_coursetype`
--

LOCK TABLES `t_coursetype` WRITE;
/*!40000 ALTER TABLE `t_coursetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_coursetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_file`
--

DROP TABLE IF EXISTS `t_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_file` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fileName` varchar(50) NOT NULL,
  `fileSize` int(11) NOT NULL,
  `fileType` varchar(50) NOT NULL,
  `filePath` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_file`
--

LOCK TABLES `t_file` WRITE;
/*!40000 ALTER TABLE `t_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_filerelation`
--

DROP TABLE IF EXISTS `t_filerelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_filerelation` (
  `filerelationId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fileId` varchar(50) NOT NULL COMMENT '外键',
  `idInfo` int(11) NOT NULL COMMENT '1：学生\n2：教师\n4：课程',
  `tableId` int(11) NOT NULL,
  PRIMARY KEY (`filerelationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_filerelation`
--

LOCK TABLES `t_filerelation` WRITE;
/*!40000 ALTER TABLE `t_filerelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_filerelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_orders`
--

DROP TABLE IF EXISTS `t_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_orders` (
  `ordersId` int(11) NOT NULL AUTO_INCREMENT COMMENT '       主键',
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `orderTime` datetime NOT NULL,
  `count` int(11) NOT NULL,
  `realUnitPrice` float DEFAULT NULL,
  `orderStatus` int(11) NOT NULL COMMENT '1009：已支付\n1010：未支付',
  PRIMARY KEY (`ordersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_orders`
--

LOCK TABLES `t_orders` WRITE;
/*!40000 ALTER TABLE `t_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_orderscar`
--

DROP TABLE IF EXISTS `t_orderscar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_orderscar` (
  `ordersCarId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `count` int(11) NOT NULL,
  `totalPrice` float DEFAULT NULL,
  PRIMARY KEY (`ordersCarId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_orderscar`
--

LOCK TABLES `t_orderscar` WRITE;
/*!40000 ALTER TABLE `t_orderscar` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_orderscar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_organization`
--

DROP TABLE IF EXISTS `t_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_organization` (
  `organizationId` int(11) NOT NULL AUTO_INCREMENT,
  `organizationName` varchar(100) NOT NULL,
  `organizationDescription` varchar(500) NOT NULL,
  `imageId` varchar(50) DEFAULT NULL,
  `organizationUrl` varchar(100) DEFAULT NULL COMMENT '机构链接',
  PRIMARY KEY (`organizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_organization`
--

LOCK TABLES `t_organization` WRITE;
/*!40000 ALTER TABLE `t_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_payinfo`
--

DROP TABLE IF EXISTS `t_payinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_payinfo` (
  `payId` int(11) NOT NULL AUTO_INCREMENT,
  `bankId` varchar(100) NOT NULL,
  `ordersId` int(11) NOT NULL,
  `realPayMoney` float NOT NULL,
  PRIMARY KEY (`payId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_payinfo`
--

LOCK TABLES `t_payinfo` WRITE;
/*!40000 ALTER TABLE `t_payinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_payinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(50) NOT NULL COMMENT '唯一\n注册后不可改',
  `email` varchar(50) NOT NULL COMMENT '唯一\n注册后不可改',
  `userType` varchar(6) NOT NULL COMMENT '1：学生\n2:教室\n4：管理人员',
  `password` varchar(50) NOT NULL,
  `realName` varchar(50) NOT NULL,
  `gender` varchar(2) NOT NULL COMMENT '1男；2女',
  `headPortraits` varchar(200) DEFAULT NULL COMMENT 'url',
  `preference` varchar(200) DEFAULT NULL COMMENT '多选，用；隔开',
  `seniority` int(11) NOT NULL,
  `organizationId` int(11) DEFAULT NULL,
  `education` varchar(12) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL COMMENT '老师自我介绍',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usertoken`
--

DROP TABLE IF EXISTS `t_usertoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_usertoken` (
  `usertokenId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(50) NOT NULL COMMENT '外键',
  `token` varchar(64) NOT NULL COMMENT '加时间戳',
  `productionTime` datetime NOT NULL,
  `effectiveTime` datetime NOT NULL COMMENT '默认1天有效',
  PRIMARY KEY (`usertokenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usertoken`
--

LOCK TABLES `t_usertoken` WRITE;
/*!40000 ALTER TABLE `t_usertoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_usertoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-09 18:17:32
