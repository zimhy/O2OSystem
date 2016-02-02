-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: artedu
-- ------------------------------------------------------
-- Server version	5.7.10

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
-- Table structure for table `t_admin`
--

DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminCode` varchar(50) NOT NULL,
  `adminName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `headPortraits` varchar(200) DEFAULT NULL,
  `realName` varchar(2) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin`
--

LOCK TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_course`
--

DROP TABLE IF EXISTS `t_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseCode` varchar(20) NOT NULL COMMENT '机构对课程的编号',
  `courseTypeId` int(11) NOT NULL COMMENT '外键',
  `teacherId` int(11) NOT NULL COMMENT '外键',
  `courseName` varchar(20) NOT NULL,
  `courseDesc` varchar(500) NOT NULL COMMENT '对课程的详细描述，供学生和家长查看',
  `teachTime` datetime NOT NULL,
  `totalStarLevel` varchar(10) NOT NULL COMMENT '根据所有选课学生对教师授课评价的星级，计算出总星级',
  `teachAddress` varchar(50) NOT NULL,
  `lessonNum` int(11) NOT NULL,
  `teachMethod` int(11) NOT NULL COMMENT '2001上门授课\r2002机构的教室\r',
  `listenTest` int(11) NOT NULL COMMENT '3001不支持试听\r 3002支持试听\r',
  `coursePrice` float NOT NULL,
  `mainImage` varchar(100) NOT NULL COMMENT 'url',
  `planStuNum` int(11) NOT NULL COMMENT '每门课教授的学生数量是有限制的',
  `realStuNum` int(11) NOT NULL COMMENT '这门课报名的实际人数',
  `courseStatus` int(11) NOT NULL COMMENT '1001审核不通过\r1002待审核\r1003未招满\r1004已招满\r1005已停课\r1006正在上课\r1007历史课程\r',
  `discountUseInfo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`courseId`),
  KEY `foreignkey_idx` (`courseTypeId`),
  KEY `foreignkey1_idx` (`teacherId`),
  CONSTRAINT `foreignkey` FOREIGN KEY (`courseTypeId`) REFERENCES `t_coursetype` (`courseTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foreignkey4` FOREIGN KEY (`teacherId`) REFERENCES `t_teacher` (`teacherId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course`
--

LOCK TABLES `t_course` WRITE;
/*!40000 ALTER TABLE `t_course` DISABLE KEYS */;
INSERT INTO `t_course` VALUES (1,'001',1,1,'声乐1','声乐1','2015-09-10 00:00:00','0','宁波',12,2001,3001,60,'meiyou',25,12,1002,NULL),(2,'001',1,1,'声乐2','声乐2','2015-09-28 00:00:00','1','宁波',13,2001,3002,90,'meiyou',30,29,1003,NULL);
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
  `studentId` int(11) NOT NULL COMMENT '外键',
  `stuCourseCode` int(11) DEFAULT NULL,
  `courseId` int(11) NOT NULL COMMENT '外键',
  `signupTime` datetime NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `starLevel` varchar(10) DEFAULT NULL COMMENT '通过星星的数量来度量教师得分的高低',
  `csStatus` int(11) NOT NULL COMMENT '1001：学费已交，尚未来上课\r1002：正在上课\r1003：结束了所选的课程\r',
  `isUseDiscount` int(11) NOT NULL COMMENT '3001是\r3002否\r',
  `payStatus` int(11) NOT NULL COMMENT '2001线上未交费\r2002线上已缴费\r2003线下优惠券未使用\r2004线下优惠券已使用\r',
  PRIMARY KEY (`couStuId`),
  KEY `foreignkey6_idx` (`courseId`),
  KEY `foreignkey7_idx` (`studentId`),
  CONSTRAINT `foreignkey6` FOREIGN KEY (`courseId`) REFERENCES `t_course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foreignkey7` FOREIGN KEY (`studentId`) REFERENCES `t_student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_coursestudent`
--

LOCK TABLES `t_coursestudent` WRITE;
/*!40000 ALTER TABLE `t_coursestudent` DISABLE KEYS */;
INSERT INTO `t_coursestudent` VALUES (1,1,1001,1,'2015-09-10 00:00:00','真好','5',1001,1,1),(2,2,1002,1,'2015-10-11 00:00:00','很棒','6',1002,2,1);
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
  `imageId` varchar(200) DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`courseTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_coursetype`
--

LOCK TABLES `t_coursetype` WRITE;
/*!40000 ALTER TABLE `t_coursetype` DISABLE KEYS */;
INSERT INTO `t_coursetype` VALUES (1,'声乐',NULL),(2,'钢琴',NULL);
/*!40000 ALTER TABLE `t_coursetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_discount`
--

DROP TABLE IF EXISTS `t_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_discount` (
  `discountId` int(11) NOT NULL,
  `discountCode` varchar(10) NOT NULL,
  `discountStatus` int(11) NOT NULL COMMENT '1001未使用\r1002已使用\r',
  `studentId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  PRIMARY KEY (`discountId`),
  KEY `foreignkey15_idx` (`studentId`),
  CONSTRAINT `foreignkey15` FOREIGN KEY (`studentId`) REFERENCES `t_student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_discount`
--

LOCK TABLES `t_discount` WRITE;
/*!40000 ALTER TABLE `t_discount` DISABLE KEYS */;
INSERT INTO `t_discount` VALUES (1,'123456',0,1,1),(2,'654321',0,1,2);
/*!40000 ALTER TABLE `t_discount` ENABLE KEYS */;
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
  `idInfo` int(11) NOT NULL COMMENT '1001：学生\r1002：教师\r1003：课程\r1004：管理员\r',
  `holdersId` int(11) NOT NULL,
  PRIMARY KEY (`filerelationId`),
  KEY `foreignkey1_idx` (`holdersId`),
  CONSTRAINT `foreignkey1` FOREIGN KEY (`holdersId`) REFERENCES `t_file` (`fileId`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `studentId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `orderTime` datetime NOT NULL,
  `count` int(11) NOT NULL,
  `realUnitPrice` float DEFAULT NULL,
  `orderStatus` int(11) NOT NULL COMMENT '1001：已支付\r1002：未支付\r',
  PRIMARY KEY (`ordersId`),
  KEY `foreignkey13_idx` (`studentId`),
  CONSTRAINT `foreignkey12` FOREIGN KEY (`ordersId`) REFERENCES `t_course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foreignkey13` FOREIGN KEY (`studentId`) REFERENCES `t_student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `studentId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `count` int(11) NOT NULL,
  `totalPrice` float DEFAULT NULL,
  PRIMARY KEY (`ordersCarId`),
  KEY `foreignkey7_idx` (`courseId`),
  KEY `foreignkey8_idx` (`studentId`),
  CONSTRAINT `foreignkey10` FOREIGN KEY (`courseId`) REFERENCES `t_course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foreignkey11` FOREIGN KEY (`studentId`) REFERENCES `t_student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_orderscar`
--

LOCK TABLES `t_orderscar` WRITE;
/*!40000 ALTER TABLE `t_orderscar` DISABLE KEYS */;
INSERT INTO `t_orderscar` VALUES (1,1,1,'2015-08-18 00:00:00',1,340),(2,1,2,'2015-09-26 00:00:00',1,NULL);
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
  `imageId` varchar(200) DEFAULT NULL,
  `organizationUrl` varchar(100) DEFAULT NULL COMMENT '机构链接',
  `organizationAddr` varchar(200) NOT NULL,
  PRIMARY KEY (`organizationId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_organization`
--

LOCK TABLES `t_organization` WRITE;
/*!40000 ALTER TABLE `t_organization` DISABLE KEYS */;
INSERT INTO `t_organization` VALUES (1,'新东方','新东方教育',NULL,NULL,'宁波'),(2,'浙大软院所示','浙大软院',NULL,NULL,'宁波');
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
  PRIMARY KEY (`payId`),
  KEY `foreignkey14_idx` (`ordersId`),
  CONSTRAINT `foreignkey14` FOREIGN KEY (`ordersId`) REFERENCES `t_orders` (`ordersId`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `t_student`
--

DROP TABLE IF EXISTS `t_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_student` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(50) NOT NULL,
  `nickName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `headPortraits` varchar(200) DEFAULT NULL,
  `studentAge` int(11) NOT NULL,
  `realName` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `preference` varchar(200) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student`
--

LOCK TABLES `t_student` WRITE;
/*!40000 ALTER TABLE `t_student` DISABLE KEYS */;
INSERT INTO `t_student` VALUES (1,'hardor','123','123','123@qq.com',NULL,18,'小张','1001','小提琴','13732255177'),(2,'xiaoli','234','123','321@qq.com',NULL,19,'小李','1001','钢琴','12345654321');
/*!40000 ALTER TABLE `t_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_teacher`
--

DROP TABLE IF EXISTS `t_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_teacher` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `teacherCode` varchar(50) NOT NULL,
  `teacherName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `headPortraits` varchar(200) DEFAULT NULL,
  `realName` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `teacherAge` int(11) NOT NULL,
  `preference` varchar(200) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `seniority` int(11) NOT NULL,
  `organizationId` int(11) DEFAULT NULL,
  `education` varchar(12) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `teacherType` int(11) NOT NULL,
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_teacher`
--

LOCK TABLES `t_teacher` WRITE;
/*!40000 ALTER TABLE `t_teacher` DISABLE KEYS */;
INSERT INTO `t_teacher` VALUES (1,'001','陈红','123','123@qq.com',NULL,'陈红','1002',21,'钢琴','12345678999',6,1,'本科','很漂亮',2001,3001);
/*!40000 ALTER TABLE `t_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usertoken`
--

DROP TABLE IF EXISTS `t_usertoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_usertoken` (
  `usertokenId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `studentId` int(11) DEFAULT NULL COMMENT '外键',
  `tercherId` int(11) DEFAULT NULL,
  `token` varchar(64) NOT NULL COMMENT '加时间戳',
  `productionTime` datetime NOT NULL,
  `effectiveTime` datetime NOT NULL COMMENT '默认1天有效',
  PRIMARY KEY (`usertokenId`),
  KEY `foreignkey2_idx` (`studentId`),
  KEY `foreignkey3_idx` (`tercherId`),
  CONSTRAINT `foreignkey2` FOREIGN KEY (`studentId`) REFERENCES `t_student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foreignkey3` FOREIGN KEY (`tercherId`) REFERENCES `t_teacher` (`teacherId`) ON DELETE NO ACTION ON UPDATE NO ACTION
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

-- Dump completed on 2016-01-26 15:25:32
