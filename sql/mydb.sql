-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: forum
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `bbs_category`
--

DROP TABLE IF EXISTS `bbs_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs_category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` bigint DEFAULT '0' COMMENT '父分类ID',
  `category_name` varchar(50) NOT NULL COMMENT '分类名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='帖子分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs_category`
--

LOCK TABLES `bbs_category` WRITE;
/*!40000 ALTER TABLE `bbs_category` DISABLE KEYS */;
INSERT INTO `bbs_category` VALUES (100,0,'学习园地',1,'0','admin','2025-04-12 11:14:24','',NULL,NULL),(101,0,'交友互动',2,'0','admin','2025-04-12 11:14:24','',NULL,NULL),(102,0,'风景摄影',3,'0','admin','2025-04-12 11:14:24','',NULL,NULL),(103,0,'二手交易1',4,'0','admin','2025-04-12 11:14:24','',NULL,NULL);
/*!40000 ALTER TABLE `bbs_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbs_comment`
--

DROP TABLE IF EXISTS `bbs_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs_comment` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `post_id` bigint NOT NULL COMMENT '帖子ID',
  `user_id` bigint NOT NULL COMMENT '评论用户ID',
  `parent_id` bigint DEFAULT '0' COMMENT '父评论ID',
  `content` text NOT NULL COMMENT '评论内容',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1审核中 2已删除）',
  `like_count` int DEFAULT '0' COMMENT '点赞次数',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs_comment`
--

LOCK TABLES `bbs_comment` WRITE;
/*!40000 ALTER TABLE `bbs_comment` DISABLE KEYS */;
INSERT INTO `bbs_comment` VALUES (100,100,1,0,'test','0',0,'','2025-04-13 11:22:39','',NULL),(101,100,1,0,'test','0',0,'','2025-04-13 11:26:58','',NULL),(102,104,1,0,'测试','0',0,'admin','2025-04-13 13:01:45','',NULL),(103,104,1,0,'test','0',0,'admin','2025-04-13 13:01:48','',NULL),(105,104,1,0,'cs','0',0,'admin','2025-04-13 13:47:22','admin','2025-04-13 14:46:39'),(106,104,1,0,'测试','2',0,'admin','2025-04-13 14:46:47','admin','2025-04-13 14:46:48'),(107,111,101,0,'ceshi','2',0,'测试用户2','2025-04-13 20:28:13','admin','2025-04-13 20:29:06');
/*!40000 ALTER TABLE `bbs_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbs_like`
--

DROP TABLE IF EXISTS `bbs_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs_like` (
  `like_id` bigint NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint DEFAULT NULL COMMENT '帖子ID',
  `comment_id` bigint DEFAULT NULL COMMENT '评论ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`like_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='点赞表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs_like`
--

LOCK TABLES `bbs_like` WRITE;
/*!40000 ALTER TABLE `bbs_like` DISABLE KEYS */;
INSERT INTO `bbs_like` VALUES (110,1,102,NULL,NULL),(111,1,104,NULL,NULL),(113,101,106,NULL,NULL),(114,1,108,NULL,NULL),(115,101,111,NULL,NULL);
/*!40000 ALTER TABLE `bbs_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbs_post`
--

DROP TABLE IF EXISTS `bbs_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `post_title` varchar(255) NOT NULL COMMENT '帖子标题',
  `post_content` text NOT NULL COMMENT '帖子内容',
  `category_id` bigint NOT NULL COMMENT '分类ID',
  `category_name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `author_id` bigint NOT NULL COMMENT '作者ID',
  `author_name` varchar(50) DEFAULT NULL COMMENT '作者名称',
  `status` char(1) DEFAULT '1' COMMENT '状态（0已发布 1待审核 2审核不通过）',
  `view_count` bigint DEFAULT '0' COMMENT '浏览量',
  `like_count` bigint DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint DEFAULT '0' COMMENT '评论数',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='帖子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs_post`
--

LOCK TABLES `bbs_post` WRITE;
/*!40000 ALTER TABLE `bbs_post` DISABLE KEYS */;
INSERT INTO `bbs_post` VALUES (102,'test','<p>test发发发</p>',101,'交友互动',2,'若依','1',0,0,0,'','2025-04-13 02:50:49','','2025-04-13 02:51:17',NULL),(104,'测试21243','<p>到底</p>',101,'交友互动',1,'若依','0',0,1,4,'','2025-04-13 12:46:33','admin','2025-04-13 15:22:50',NULL),(105,'新疆乌鲁木齐','<p>你好dd </p>',102,NULL,1,'若依','2',0,0,0,'','2025-04-13 15:23:27','admin','2025-04-13 18:03:27',NULL),(106,'测试','<p>测试</p>',101,'交友互动',101,'测试用户2','0',0,1,0,'','2025-04-13 15:45:05','admin','2025-04-13 16:06:55',NULL),(107,'交友','<p>111</p>',101,NULL,101,'测试用户2','0',0,0,0,'','2025-04-13 15:51:47','admin','2025-04-13 15:58:26',NULL),(108,'摄影','<p>222对对对</p>',102,'风景摄影',101,'测试用户2','0',0,0,0,'','2025-04-13 15:51:56','admin','2025-04-13 17:58:21',NULL),(109,'test','<p class=\"ql-align-justify\">	<span style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\">4月3日，国际合作部外籍教师俱乐部举办“春风纸鸢，踏青寻趣”主题活动，来自16个国家的20余位外籍专家学者齐聚北京大学教师之家，于素白纸鸢上勾勒东方美学的悠长气韵，近距离感受中国传统工艺的魅力与文化内涵。</span></p><p class=\"ql-align-center\">	<span style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\"><img src=\"https://www.oir.pku.edu.cn/__local/7/DB/F1/C4FFE0EBFCC05FBB346A808F4A6_14B85B00_41450.jpg\" width=\"500\"></span></p><p class=\"ql-align-center\">	<span style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\"><img src=\"https://www.oir.pku.edu.cn/__local/D/46/8D/E171172F39164DA556D8B0C1A64_BE7A906D_3C883.jpg\" width=\"500\"></span></p><p class=\"ql-align-center\">	<span style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\">	活动现场</span></p><p class=\"ql-align-justify\">	<span style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\">活动中，国合秘书处外专中心的同学们系统讲解了中国风筝2500余年的发展历史与工艺智慧，从《清明上河图》中孩童放鸢的生动场景，到“扎、糊、绘、放”四大技艺的匠心传承，从潍坊风筝的灵动竹骨，到江南纸鸢的薄绡烟雨，再到牡丹、桃花、龙、拱门等不同的风筝纹样蕴含着不同的美好寓意。外专们通过图片和视频，深入了解了风筝承载的文化寓意与生命哲学。在手工制作环节，外专们调色、勾线、绘彩，为风筝注入多元文化创意，有以牡丹、祥云等传统纹样传递美好祝愿，有将现代元素与龙图腾巧妙结合，还有从本国文化中汲取灵感，勾勒出跨越地域的春日图景。</span></p><p class=\"ql-align-center\">	<span style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\"><img src=\"https://www.oir.pku.edu.cn/__local/A/7B/B9/81F80EB690B4A2293B8DC8B08D8_82CBA59F_4AD4D.jpg\" width=\"500\"></span></p><p class=\"ql-align-center\">	<span style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\"><img src=\"https://www.oir.pku.edu.cn/__local/2/DF/91/D2FD95A1FB1623F156E36A7E5DA_0F70BEA1_52FD7.jpg\" width=\"500\"></span></p><p class=\"ql-align-center\">	<span style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\">风筝制作、合影留念</span></p><p class=\"ql-align-justify\">	<span style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\">制作中，大家相互交流，共同分享对中华传统文化的理解与感悟。外国语学院的Eric Taylor表示，通过亲手制作风筝，不仅感受到中国传统工艺的精妙，更体会到“天人合一”的东方智慧。电子学院的Jyoti感叹，亲手触摸绢纸与竹骨的过程，让她更加感受到了东方美学的魅力。物理学院的Florian Böhm提到，这场活动让他们触摸到书本之外的中国文化，期待未来更多参与此类沉浸式文化体验。</span></p><p class=\"ql-align-justify\">	<strong style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\">背景链接：</strong></p><p class=\"ql-align-center\">	<span style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\"><img src=\"https://www.oir.pku.edu.cn/__local/4/87/C1/3EAB255FD0BA6A6971CD793409A_EE933A64_1B679.png\" height=\"610\" width=\"331\"></span></p><p>	<span style=\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\"><img src=\"https://www.oir.pku.edu.cn/__local/4/87/C1/3EAB255FD0BA6A6971CD793409A_EE933A64_1B679.png\" height=\"1\" width=\"1\">北京大学外籍教师俱乐部（International Faculty Center）由北京大学国际合作部于2010年创办，旨在为全校外籍专家搭建交流平台，促进其了解中国文化、融入校园生活，并优化学校引智环境。成立以来，俱乐部定期举办特色主题活动，形成了以传统文化体验、学术讲座与交流与感知中国为核心的三大活动主线，成为外籍教师感知中国、增进跨文化理解的重要窗口。</span></p><p><br></p>',102,NULL,1,'若依','0',0,0,0,'','2025-04-13 18:33:03','admin','2025-04-13 20:28:49',NULL),(110,'test','<p>test</p>',101,NULL,101,'测试用户2','1',0,0,0,'','2025-04-13 20:15:42','','2025-04-13 20:15:42',NULL),(111,'ceshi','<p>ceshi</p>',100,NULL,101,'测试用户2','1',0,0,0,'','2025-04-13 20:27:43','','2025-04-13 20:27:43',NULL);
/*!40000 ALTER TABLE `bbs_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'bbs_category','帖子分类表',NULL,NULL,'BbsCategory','crud','','com.ruoyi.system','system','category','帖子分类','ruoyi','0','/',NULL,'admin','2025-04-12 15:07:59','',NULL,NULL),(2,'bbs_comment','评论表',NULL,NULL,'BbsComment','crud','','com.ruoyi.system','system','comment','评论','ruoyi','0','/',NULL,'admin','2025-04-12 15:07:59','',NULL,NULL),(3,'bbs_like','点赞表',NULL,NULL,'BbsLike','crud','','com.ruoyi.system','system','like','点赞','ruoyi','0','/',NULL,'admin','2025-04-12 15:07:59','',NULL,NULL),(4,'bbs_post','帖子表',NULL,NULL,'BbsPost','crud','','com.ruoyi.system','system','post','帖子','ruoyi','0','/',NULL,'admin','2025-04-12 15:07:59','',NULL,NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'category_id','分类ID','bigint','Long','categoryId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-12 15:07:59','',NULL),(2,1,'parent_id','父分类ID','bigint','Long','parentId','0','0','0','1','1','1','1','EQ','input','',2,'admin','2025-04-12 15:07:59','',NULL),(3,1,'category_name','分类名称','varchar(50)','String','categoryName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2025-04-12 15:07:59','',NULL),(4,1,'order_num','显示顺序','int','Long','orderNum','0','0','0','1','1','1','1','EQ','input','',4,'admin','2025-04-12 15:07:59','',NULL),(5,1,'status','状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',5,'admin','2025-04-12 15:07:59','',NULL),(6,1,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',6,'admin','2025-04-12 15:07:59','',NULL),(7,1,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2025-04-12 15:07:59','',NULL),(8,1,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',8,'admin','2025-04-12 15:07:59','',NULL),(9,1,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',9,'admin','2025-04-12 15:07:59','',NULL),(10,2,'comment_id','评论ID','bigint','Long','commentId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-12 15:07:59','',NULL),(11,2,'post_id','帖子ID','bigint','Long','postId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-04-12 15:07:59','',NULL),(12,2,'user_id','评论用户ID','bigint','Long','userId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-04-12 15:07:59','',NULL),(13,2,'parent_id','父评论ID','bigint','Long','parentId','0','0','0','1','1','1','1','EQ','input','',4,'admin','2025-04-12 15:07:59','',NULL),(14,2,'content','评论内容','text','String','content','0','0','1','1','1','1','1','EQ','editor','',5,'admin','2025-04-12 15:07:59','',NULL),(15,2,'status','状态（0正常 1审核中 2已删除）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',6,'admin','2025-04-12 15:07:59','',NULL),(16,2,'like_count','点赞次数','int','Long','likeCount','0','0','0','1','1','1','1','EQ','input','',7,'admin','2025-04-12 15:07:59','',NULL),(17,2,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',8,'admin','2025-04-12 15:07:59','',NULL),(18,2,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2025-04-12 15:07:59','',NULL),(19,2,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',10,'admin','2025-04-12 15:07:59','',NULL),(20,2,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',11,'admin','2025-04-12 15:07:59','',NULL),(21,3,'like_id','点赞ID','bigint','Long','likeId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-12 15:07:59','',NULL),(22,3,'user_id','用户ID','bigint','Long','userId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-04-12 15:07:59','',NULL),(23,3,'post_id','帖子ID','bigint','Long','postId','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-04-12 15:07:59','',NULL),(24,3,'comment_id','评论ID','bigint','Long','commentId','0','0','0','1','1','1','1','EQ','input','',4,'admin','2025-04-12 15:07:59','',NULL),(25,3,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2025-04-12 15:07:59','',NULL),(26,4,'post_id','帖子ID','bigint','Long','postId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-04-12 15:07:59','',NULL),(27,4,'user_id','发布用户ID','bigint','Long','userId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-04-12 15:07:59','',NULL),(28,4,'category_id','分类ID','bigint','Long','categoryId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-04-12 15:07:59','',NULL),(29,4,'title','帖子标题','varchar(100)','String','title','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-04-12 15:07:59','',NULL),(30,4,'content','帖子内容','text','String','content','0','0','1','1','1','1','1','EQ','editor','',5,'admin','2025-04-12 15:07:59','',NULL),(31,4,'status','状态（0正常 1审核中 2已删除）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',6,'admin','2025-04-12 15:07:59','',NULL),(32,4,'view_count','查看次数','int','Long','viewCount','0','0','0','1','1','1','1','EQ','input','',7,'admin','2025-04-12 15:07:59','',NULL),(33,4,'like_count','点赞次数','int','Long','likeCount','0','0','0','1','1','1','1','EQ','input','',8,'admin','2025-04-12 15:07:59','',NULL),(34,4,'comment_count','评论次数','int','Long','commentCount','0','0','0','1','1','1','1','EQ','input','',9,'admin','2025-04-12 15:07:59','',NULL),(35,4,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',10,'admin','2025-04-12 15:07:59','',NULL),(36,4,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',11,'admin','2025-04-12 15:07:59','',NULL),(37,4,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',12,'admin','2025-04-12 15:07:59','',NULL),(38,4,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',13,'admin','2025-04-12 15:07:59','',NULL);
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2025-04-12 11:25:10','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2025-04-12 11:25:10','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2025-04-12 11:25:10','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2025-04-12 11:25:10','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','true','Y','admin','2025-04-12 11:25:10','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2025-04-12 11:25:10','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-12 11:25:10','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-12 11:25:10','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-12 11:25:10','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-12 11:25:10','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-12 11:25:10','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-12 11:25:10','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-12 11:25:10','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-12 11:25:10','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-12 11:25:10','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-04-12 11:25:10','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2025-04-12 11:25:10','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2025-04-12 11:25:10','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2025-04-12 11:25:10','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-04-12 11:25:10','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-04-12 11:25:10','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-04-12 11:25:10','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-04-12 11:25:10','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-04-12 11:25:10','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-04-12 11:25:10','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-04-12 11:25:10','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-04-12 11:25:10','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-04-12 11:25:10','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2025-04-12 11:25:10','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-04-12 11:25:10','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2025-04-12 11:25:10','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-04-12 11:25:10','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-04-12 11:25:10','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2025-04-12 11:25:10','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2025-04-12 11:25:10','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2025-04-12 11:25:10','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-04-12 11:25:10','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-04-12 11:25:10','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-04-12 11:25:10','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-04-12 11:25:10','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-04-12 11:25:10','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-04-12 11:25:10','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-04-12 11:25:10','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2025-04-12 11:25:10','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2025-04-12 11:25:10','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2025-04-12 11:25:10','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2025-04-12 11:25:10','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2025-04-12 11:25:10','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2025-04-12 11:25:10','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2025-04-12 11:25:10','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2025-04-12 11:25:10','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2025-04-12 11:25:10','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2025-04-12 11:25:10','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2025-04-12 11:25:10','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2025-04-12 11:25:10','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2025-04-12 11:25:10','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2025-04-12 11:25:10','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2025-04-12 11:25:10','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-12 14:50:23'),(101,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-12 19:53:36'),(102,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-12 21:03:52'),(103,'ry','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-12 23:18:14'),(104,'ry','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-12 23:56:14'),(105,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-12 23:56:18'),(106,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 01:36:40'),(107,'测试用户','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','用户不存在/密码错误','2025-04-13 01:36:48'),(108,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-13 01:36:51'),(109,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 01:36:57'),(110,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 01:37:31'),(111,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 01:37:39'),(112,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 02:05:36'),(113,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','用户不存在/密码错误','2025-04-13 02:05:55'),(114,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-13 02:06:10'),(115,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-13 02:06:10'),(116,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-13 02:06:13'),(117,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','用户不存在/密码错误','2025-04-13 02:06:17'),(118,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-13 02:07:16'),(119,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','用户不存在/密码错误','2025-04-13 02:07:19'),(120,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','用户不存在/密码错误','2025-04-13 02:10:27'),(121,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-13 02:12:58'),(122,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-13 02:13:01'),(123,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','用户不存在/密码错误','2025-04-13 02:13:03'),(124,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','密码输入错误5次，帐户锁定10分钟','2025-04-13 02:14:04'),(125,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','密码输入错误5次，帐户锁定10分钟','2025-04-13 02:14:15'),(126,'ry','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 02:14:25'),(127,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 11:09:08'),(128,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 14:46:02'),(129,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 15:07:19'),(130,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','用户不存在/密码错误','2025-04-13 15:07:39'),(131,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-13 15:07:42'),(132,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 15:07:48'),(133,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-13 15:09:45'),(134,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 15:09:48'),(135,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 15:23:58'),(136,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 15:24:16'),(137,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-13 15:52:02'),(138,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 15:52:04'),(139,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 15:53:37'),(140,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 15:53:47'),(141,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 16:07:31'),(142,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码已失效','2025-04-13 16:07:42'),(143,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 16:07:45'),(144,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 17:11:00'),(145,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 17:12:15'),(146,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 18:49:41'),(147,'测试账号2','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','用户不存在/密码错误','2025-04-13 18:49:51'),(148,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 18:50:01'),(149,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 18:55:22'),(150,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 18:55:25'),(151,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 18:58:46'),(152,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-13 18:58:54'),(153,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 18:58:56'),(154,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 19:39:12'),(155,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 19:39:17'),(156,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 19:40:16'),(157,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 19:40:26'),(158,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 19:50:05'),(159,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 19:50:15'),(160,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 20:15:08'),(161,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-04-13 20:15:18'),(162,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 20:15:21'),(163,'测试用户2','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 20:28:23'),(164,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 20:28:31'),(165,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','退出成功','2025-04-13 20:41:27'),(166,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-04-13 20:47:51');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2044 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,2,'system',NULL,'','',1,0,'M','0','0','','system','admin','2025-04-12 11:25:10','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2025-04-12 11:25:10','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','1','0','','tool','admin','2025-04-12 11:25:10','admin','2025-04-13 17:22:10','系统工具目录'),(100,'用户管理',2043,3,'user','system/user/index',NULL,'',1,0,'C','0','0','system:user:list','user','admin','2025-04-13 01:05:08','admin','2025-04-13 19:30:01','用户管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2025-04-12 11:25:10','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','1','0','system:dept:list','tree','admin','2025-04-12 11:25:10','admin','2025-04-13 17:21:26','部门管理菜单'),(104,'岗位管理',1,5,'post','systemdd/post/index','','',1,0,'C','1','0','system:post:list','post','admin','2025-04-12 11:25:10','admin','2025-04-13 20:10:55','岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','1','0','system:dict:list','dict','admin','2025-04-12 11:25:10','admin','2025-04-13 17:21:33','字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','1','0','system:config:list','edit','admin','2025-04-12 11:25:10','admin','2025-04-13 17:21:36','参数设置菜单'),(107,'通知公告',2022,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2025-04-12 11:25:10','admin','2025-04-13 18:42:53','通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2025-04-12 11:25:10','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2025-04-12 11:25:10','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','1','0','monitor:job:list','job','admin','2025-04-12 11:25:10','admin','2025-04-13 17:22:34','定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','1','0','monitor:druid:list','druid','admin','2025-04-12 11:25:10','admin','2025-04-13 17:23:26','数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2025-04-12 11:25:10','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2025-04-12 11:25:10','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2025-04-12 11:25:10','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2025-04-12 11:25:10','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2025-04-12 11:25:10','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2025-04-12 11:25:10','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2025-04-12 11:25:10','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2025-04-12 11:25:10','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2025-04-12 11:25:10','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2025-04-12 11:25:10','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2025-04-12 11:25:10','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2025-04-12 11:25:10','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2025-04-12 11:25:10','',NULL,''),(1007,'角色查询',2026,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1008,'角色新增',2026,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2025-04-12 11:25:10','',NULL,''),(1009,'角色修改',2026,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2025-04-12 11:25:10','',NULL,''),(1010,'角色删除',2026,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1011,'角色导出',2026,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2025-04-12 11:25:10','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2025-04-12 11:25:10','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2025-04-12 11:25:10','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2025-04-12 11:25:10','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2025-04-12 11:25:10','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2025-04-12 11:25:10','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2025-04-12 11:25:10','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2025-04-12 11:25:10','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2025-04-12 11:25:10','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2025-04-12 11:25:10','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2025-04-12 11:25:10','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2025-04-12 11:25:10','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2025-04-12 11:25:10','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2025-04-12 11:25:10','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2025-04-12 11:25:10','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2025-04-12 11:25:10','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2025-04-12 11:25:10','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2025-04-12 11:25:10','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2025-04-12 11:25:10','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2025-04-12 11:25:10','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2025-04-12 11:25:10','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2025-04-12 11:25:10','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2025-04-12 11:25:10','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2025-04-12 11:25:10','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2025-04-12 11:25:10','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2025-04-12 11:25:10','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2025-04-12 11:25:10','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2025-04-12 11:25:10','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2025-04-12 11:25:10','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2025-04-12 11:25:10','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2025-04-12 11:25:10','',NULL,''),(2000,'帖子分类',2022,2,'category','system/category/index',NULL,'',1,0,'C','0','0','system:category:list','tree-table','admin','2025-04-13 01:05:08','',NULL,'帖子分类菜单'),(2001,'帖子分类查询',2000,1,'#','',NULL,'',1,0,'F','0','0','system:category:query','#','admin','2025-04-12 15:15:18','',NULL,''),(2002,'帖子分类新增',2000,2,'#','',NULL,'',1,0,'F','0','0','system:category:add','#','admin','2025-04-12 15:15:18','',NULL,''),(2003,'帖子分类修改',2000,3,'#','',NULL,'',1,0,'F','0','0','system:category:edit','#','admin','2025-04-12 15:15:18','',NULL,''),(2004,'帖子分类删除',2000,4,'#','',NULL,'',1,0,'F','0','0','system:category:remove','#','admin','2025-04-12 15:15:18','',NULL,''),(2005,'帖子分类导出',2000,5,'#','',NULL,'',1,0,'F','0','0','system:category:export','#','admin','2025-04-12 15:15:18','',NULL,''),(2012,'帖子分类导出',2000,5,'#','',NULL,'',1,0,'F','0','0','system:category:export','#','admin','2025-04-12 15:18:26','',NULL,''),(2013,'评论导出',2000,5,'#','',NULL,'',1,0,'F','0','0','bbs:comment:export','#','admin','2025-04-12 15:18:31','',NULL,''),(2014,'点赞导出',2000,5,'#','',NULL,'',1,0,'F','0','0','bbs:like:export','#','admin','2025-04-12 15:18:35','',NULL,''),(2015,'帖子导出',2000,5,'#','',NULL,'',1,0,'F','0','0','system:post:export','#','admin','2025-04-12 15:18:39','',NULL,''),(2018,'帖子查询',2023,1,'#','',NULL,'',1,0,'F','0','0','system:post:query','#','admin','2025-04-13 00:58:54','',NULL,''),(2019,'帖子新增',2023,2,'#','',NULL,'',1,0,'F','0','0','system:post:add','#','admin','2025-04-13 00:58:54','',NULL,''),(2020,'帖子修改',2023,3,'#','',NULL,'',1,0,'F','0','0','system:post:edit','#','admin','2025-04-13 00:58:54','',NULL,''),(2021,'帖子删除',2023,4,'#','',NULL,'',1,0,'F','0','0','system:post:remove','#','admin','2025-04-13 00:58:54','',NULL,''),(2022,'论坛管理',0,1,'bbs',NULL,NULL,'',1,0,'M','0','0','','system','admin','2025-04-13 01:05:08','',NULL,'论坛管理菜单'),(2023,'帖子管理',2022,1,'post','system/post/index',NULL,'',1,0,'C','0','0','system:post:list','documentation','admin','2025-04-13 01:05:08','admin','2025-04-13 20:11:08','帖子管理菜单'),(2026,'角色管理',2043,4,'role','system/role/index',NULL,'',1,0,'C','0','0','system:role:list','peoples','admin','2025-04-13 01:05:08','admin','2025-04-13 19:29:17','角色管理菜单'),(2043,'系统用户管理',0,5,'user',NULL,NULL,'',1,0,'M','0','0',NULL,'user','admin','2025-04-13 19:28:52','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：论坛管理系统4月13日开放','2',_binary '新版本内容','0','admin','2025-04-12 11:25:10','admin','2025-04-13 17:20:33','管理员'),(2,'维护通知：4月13日-论坛管理系统凌晨维护','1',_binary '<p>维护内容</p>','0','admin','2025-04-12 11:25:10','admin','2025-04-13 17:20:56','管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'创建表',0,'com.ruoyi.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"create table bbs_category (\\n  category_id        bigint(20)      not null auto_increment    comment \'分类ID\',\\n  category_name      varchar(50)     not null                   comment \'分类名称\',\\n  status            char(1)         default \'0\'                comment \'状态（0正常 1停用）\',\\n  order_num         int(4)          default 0                  comment \'显示顺序\',\\n  create_by         varchar(64)     default \'\'                 comment \'创建者\',\\n  create_time       datetime                                   comment \'创建时间\',\\n  update_by         varchar(64)     default \'\'                 comment \'更新者\',\\n  update_time       datetime                                   comment \'更新时间\',\\n  remark            varchar(500)    default \'\'                 comment \'备注\',\\n  primary key (category_id)\\n) engine=innodb auto_increment=100 comment = \'帖子分类表\';\\n\\n-- 帖子表\\ncreate table bbs_post (\\n  post_id           bigint(20)      not null auto_increment    comment \'帖子ID\',\\n  post_title        varchar(150)    not null                   comment \'帖子标题\',\\n  post_content      text            not null                   comment \'帖子内容\',\\n  category_id       bigint(20)      not null                   comment \'分类ID\',\\n  user_id           bigint(20)      not null                   comment \'发布人ID\',\\n  user_name         varchar(30)     not null                   comment \'发布人名称\',\\n  status            char(1)         default \'1\'                comment \'状态（0已发布 1待审核 2审核不通过）\',\\n  view_count        bigint(20)      default 0                  comment \'浏览量\',\\n  like_count        bigint(20)      default 0                  comment \'点赞数\',\\n  comment_count     bigint(20)      default 0                  comment \'评论数\',\\n  create_by         varchar(64)     default \'\'                 comment \'创建者\',\\n  create_time       datetime                                   comment \'创建时间\',\\n  update_by         varchar(64)     default \'\'                 comment \'更新者\',\\n  update_time       datetime                                   com','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2025-04-12 15:07:09',10),(101,'创建表',0,'com.ruoyi.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"create table bbs_category (\\n  category_id        bigint(20)      not null auto_increment    comment \'分类ID\',\\n  category_name      varchar(50)     not null                   comment \'分类名称\',\\n  status            char(1)         default \'0\'                comment \'状态（0正常 1停用）\',\\n  order_num         int(4)          default 0                  comment \'显示顺序\',\\n  create_by         varchar(64)     default \'\'                 comment \'创建者\',\\n  create_time       datetime                                   comment \'创建时间\',\\n  update_by         varchar(64)     default \'\'                 comment \'更新者\',\\n  update_time       datetime                                   comment \'更新时间\',\\n  remark            varchar(500)    default \'\'                 comment \'备注\',\\n  primary key (category_id)\\n) engine=innodb auto_increment=100 comment = \'帖子分类表\';\\n\\n-- 帖子表\\ncreate table bbs_post (\\n  post_id           bigint(20)      not null auto_increment    comment \'帖子ID\',\\n  post_title        varchar(150)    not null                   comment \'帖子标题\',\\n  post_content      text            not null                   comment \'帖子内容\',\\n  category_id       bigint(20)      not null                   comment \'分类ID\',\\n  user_id           bigint(20)      not null                   comment \'发布人ID\',\\n  user_name         varchar(30)     not null                   comment \'发布人名称\',\\n  status            char(1)         default \'1\'                comment \'状态（0已发布 1待审核 2审核不通过）\',\\n  view_count        bigint(20)      default 0                  comment \'浏览量\',\\n  like_count        bigint(20)      default 0                  comment \'点赞数\',\\n  comment_count     bigint(20)      default 0                  comment \'评论数\',\\n  create_by         varchar(64)     default \'\'                 comment \'创建者\',\\n  create_time       datetime                                   comment \'创建时间\',\\n  update_by         varchar(64)     default \'\'                 comment \'更新者\',\\n  update_time       datetime                                   com','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2025-04-12 15:07:10',5),(102,'创建表',0,'com.ruoyi.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"create table bbs_category (\\n  category_id        bigint(20)      not null auto_increment    comment \'分类ID\',\\n  category_name      varchar(50)     not null                   comment \'分类名称\',\\n  status            char(1)         default \'0\'                comment \'状态（0正常 1停用）\',\\n  order_num         int(4)          default 0                  comment \'显示顺序\',\\n  create_by         varchar(64)     default \'\'                 comment \'创建者\',\\n  create_time       datetime                                   comment \'创建时间\',\\n  update_by         varchar(64)     default \'\'                 comment \'更新者\',\\n  update_time       datetime                                   comment \'更新时间\',\\n  remark            varchar(500)    default \'\'                 comment \'备注\',\\n  primary key (category_id)\\n) engine=innodb auto_increment=100 comment = \'帖子分类表\';\\n\\ncreate table bbs_post (\\n  post_id           bigint(20)      not null auto_increment    comment \'帖子ID\',\\n  post_title        varchar(150)    not null                   comment \'帖子标题\',\\n  post_content      text            not null                   comment \'帖子内容\',\\n  category_id       bigint(20)      not null                   comment \'分类ID\',\\n  user_id           bigint(20)      not null                   comment \'发布人ID\',\\n  user_name         varchar(30)     not null                   comment \'发布人名称\',\\n  status            char(1)         default \'1\'                comment \'状态（0已发布 1待审核 2审核不通过）\',\\n  view_count        bigint(20)      default 0                  comment \'浏览量\',\\n  like_count        bigint(20)      default 0                  comment \'点赞数\',\\n  comment_count     bigint(20)      default 0                  comment \'评论数\',\\n  create_by         varchar(64)     default \'\'                 comment \'创建者\',\\n  create_time       datetime                                   comment \'创建时间\',\\n  update_by         varchar(64)     default \'\'                 comment \'更新者\',\\n  update_time       datetime                                   comment \'更新','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2025-04-12 15:07:22',4),(103,'创建表',0,'com.ruoyi.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"create table bbs_category (\\n  category_id        bigint(20)      not null auto_increment    comment \'分类ID\',\\n  category_name      varchar(50)     not null                   comment \'分类名称\',\\n  status            char(1)         default \'0\'                comment \'状态（0正常 1停用）\',\\n  order_num         int(4)          default 0                  comment \'显示顺序\',\\n  create_by         varchar(64)     default \'\'                 comment \'创建者\',\\n  create_time       datetime                                   comment \'创建时间\',\\n  update_by         varchar(64)     default \'\'                 comment \'更新者\',\\n  update_time       datetime                                   comment \'更新时间\',\\n  remark            varchar(500)    default \'\'                 comment \'备注\',\\n  primary key (category_id)\\n) engine=innodb auto_increment=100 comment = \'帖子分类表\';\\n\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2025-04-12 15:07:33',79),(104,'创建表',0,'com.ruoyi.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"sql\":\"create table bbs_category (\\n  category_id        bigint(20)      not null auto_increment    comment \'分类ID\',\\n  category_name      varchar(50)     not null                   comment \'分类名称\',\\n  status            char(1)         default \'0\'                comment \'状态（0正常 1停用）\',\\n  order_num         int(4)          default 0                  comment \'显示顺序\',\\n  create_by         varchar(64)     default \'\'                 comment \'创建者\',\\n  create_time       datetime                                   comment \'创建时间\',\\n  update_by         varchar(64)     default \'\'                 comment \'更新者\',\\n  update_time       datetime                                   comment \'更新时间\',\\n  remark            varchar(500)    default \'\'                 comment \'备注\',\\n  primary key (category_id)\\n) engine=innodb auto_increment=100 comment = \'帖子分类表\';\\n\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2025-04-12 15:07:34',6),(105,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"bbs_category,bbs_comment,bbs_like,bbs_post\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-12 15:07:59',144),(106,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"bbs_category,bbs_comment,bbs_like,bbs_post\"}',NULL,0,NULL,'2025-04-12 15:08:13',142),(107,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":100,\"categoryName\":\"最新帖子\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":2,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-12 23:57:31',9),(108,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":101,\"categoryName\":\"交友帖子\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-12 23:57:36',4),(109,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":102,\"categoryName\":\"风景摄影\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":3,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 00:03:12',15),(110,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":103,\"categoryName\":\"通知公告\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":4,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 00:03:18',4),(111,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":100,\"categoryName\":\"最新帖子\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":2,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 00:03:24',3),(112,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":101,\"categoryName\":\"交友互动\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 00:03:28',3),(113,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":100,\"categoryName\":\"最新帖子\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 00:03:33',4),(114,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":101,\"categoryName\":\"交友互动\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":2,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 00:03:38',6),(115,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/4','127.0.0.1','内网IP','4','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-04-13 00:47:56',10),(116,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"categoryId\":100,\"params\":{},\"status\":\"0\"}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'post_title\' doesn\'t have a default value\n### The error may exist in file [/Users/zhangxinyi/java-projects/RuoYi-Vue/ruoyi-system/target/classes/mapper/system/BbsPostMapper.xml]\n### The error may involve com.ruoyi.system.mapper.BbsPostMapper.insertBbsPost-Inline\n### The error occurred while setting parameters\n### SQL: insert into bbs_post          ( category_id,                                                    status )           values ( ?,                                                    ? )\n### Cause: java.sql.SQLException: Field \'post_title\' doesn\'t have a default value\n; Field \'post_title\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'post_title\' doesn\'t have a default value','2025-04-13 00:48:28',51),(117,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"categoryId\":100,\"params\":{},\"status\":\"0\"}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'post_title\' doesn\'t have a default value\n### The error may exist in file [/Users/zhangxinyi/java-projects/RuoYi-Vue/ruoyi-system/target/classes/mapper/system/BbsPostMapper.xml]\n### The error may involve com.ruoyi.system.mapper.BbsPostMapper.insertBbsPost-Inline\n### The error occurred while setting parameters\n### SQL: insert into bbs_post          ( category_id,                                                    status )           values ( ?,                                                    ? )\n### Cause: java.sql.SQLException: Field \'post_title\' doesn\'t have a default value\n; Field \'post_title\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'post_title\' doesn\'t have a default value','2025-04-13 00:48:33',8),(118,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"categoryId\":101,\"params\":{},\"postContent\":\"<p>111</p>\",\"postTitle\":\"测试\",\"status\":\"1\"}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'author_id\' doesn\'t have a default value\n### The error may exist in file [/Users/zhangxinyi/java-projects/RuoYi-Vue/ruoyi-system/target/classes/mapper/system/BbsPostMapper.xml]\n### The error may involve com.ruoyi.system.mapper.BbsPostMapper.insertBbsPost-Inline\n### The error occurred while setting parameters\n### SQL: insert into bbs_post          ( post_title,             post_content,             category_id,                                                    status )           values ( ?,             ?,             ?,                                                    ? )\n### Cause: java.sql.SQLException: Field \'author_id\' doesn\'t have a default value\n; Field \'author_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'author_id\' doesn\'t have a default value','2025-04-13 00:59:39',8),(119,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"admin\",\"categoryId\":102,\"params\":{},\"postContent\":\"<p>test</p>\",\"postId\":100,\"postTitle\":\"test\",\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 01:12:14',12),(120,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":102,\"categoryName\":\"风景摄影\",\"commentCount\":0,\"createBy\":\"\",\"likeCount\":0,\"params\":{},\"postContent\":\"<p>test2</p>\",\"postId\":100,\"postTitle\":\"test\",\"status\":\"1\",\"updateBy\":\"\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 01:27:56',20),(121,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"admin\",\"categoryId\":101,\"params\":{},\"postContent\":\"<p>1</p>\",\"postId\":101,\"postTitle\":\"1\",\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 01:35:05',12),(122,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":102,\"categoryName\":\"风景摄影\",\"commentCount\":0,\"createBy\":\"\",\"likeCount\":0,\"params\":{},\"postContent\":\"<p>test2ddd</p>\",\"postId\":100,\"postTitle\":\"test\",\"status\":\"1\",\"updateBy\":\"\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 01:35:33',7),(123,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"测试用户\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 01:36:31',104),(124,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试用户2\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"测试用户2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 01:37:26',94),(125,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'ry','测试部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":2,\"authorName\":\"ry\",\"categoryId\":101,\"createTime\":\"2025-04-13 02:50:49\",\"params\":{},\"postContent\":\"<p>test</p>\",\"postId\":102,\"postTitle\":\"test\",\"status\":\"1\",\"updateTime\":\"2025-04-13 02:50:49\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 02:50:49',77),(126,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'ry','测试部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":2,\"authorName\":\"ry\",\"categoryId\":102,\"createTime\":\"2025-04-13 02:51:09\",\"params\":{},\"postContent\":\"<p>1</p>\",\"postId\":103,\"postTitle\":\"测试\",\"status\":\"1\",\"updateTime\":\"2025-04-13 02:51:09\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 02:51:09',4),(127,'帖子',3,'com.ruoyi.web.controller.bbs.BbsPostController.remove()','DELETE',1,'ry','测试部门','/bbs/post/103','127.0.0.1','内网IP','[103]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 02:51:13',7),(128,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'ry','测试部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":2,\"authorName\":\"若依\",\"categoryId\":101,\"categoryName\":\"交友互动\",\"commentCount\":0,\"createBy\":\"\",\"createTime\":\"2025-04-13 02:50:49\",\"likeCount\":0,\"params\":{},\"postContent\":\"<p>test发发发</p>\",\"postId\":102,\"postTitle\":\"test\",\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-04-13 02:51:17\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 02:51:17',10),(129,'帖子评论',1,'com.ruoyi.web.controller.bbs.BbsCommentController.add()','POST',1,'admin','研发部门','/bbs/comment','127.0.0.1','内网IP','{\"content\":\"teet\",\"createTime\":\"2025-04-13 11:14:00\",\"params\":{},\"postId\":100}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in file [/Users/zhangxinyi/java-projects/RuoYi-Vue/ruoyi-admin/target/classes/mapper/bbs/BbsCommentMapper.xml]\n### The error may involve com.ruoyi.bbs.mapper.BbsCommentMapper.insertBbsComment-Inline\n### The error occurred while setting parameters\n### SQL: insert into bbs_comment          ( post_id,                          content,                                                                 create_time )           values ( ?,                          ?,                                                                 ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value','2025-04-13 11:14:00',70),(130,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"admin\",\"categoryId\":101,\"createTime\":\"2025-04-13 12:46:32\",\"params\":{},\"postContent\":\"<p>测试</p>\",\"postId\":104,\"postTitle\":\"测试\",\"status\":\"1\",\"updateTime\":\"2025-04-13 12:46:32\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 12:46:32',19),(131,'帖子状态',2,'com.ruoyi.web.controller.bbs.BbsPostController.updateStatus()','PUT',1,'admin','研发部门','/bbs/post/100/status','127.0.0.1','内网IP','100 {\"params\":{},\"postId\":100,\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 12:49:30\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 12:49:30',50),(132,'帖子',3,'com.ruoyi.web.controller.bbs.BbsPostController.remove()','DELETE',1,'admin','研发部门','/bbs/post/100','127.0.0.1','内网IP','[100]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 12:55:10',10),(133,'帖子',3,'com.ruoyi.web.controller.bbs.BbsPostController.remove()','DELETE',1,'admin','研发部门','/bbs/post/101','127.0.0.1','内网IP','[101]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 12:55:11',7),(134,'帖子状态',2,'com.ruoyi.web.controller.bbs.BbsPostController.updateStatus()','PUT',1,'admin','研发部门','/bbs/post/104/status','127.0.0.1','内网IP','104 {\"params\":{},\"postId\":104,\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 14:46:43\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 14:46:43',11),(135,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":100,\"categoryName\":\"最新帖子\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 14:51:13',10),(136,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":100,\"categoryName\":\"学习园地\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 14:51:36',7),(137,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":101,\"categoryName\":\"交友互动\",\"commentCount\":4,\"createBy\":\"\",\"createTime\":\"2025-04-13 12:46:33\",\"likeCount\":1,\"params\":{},\"postContent\":\"<p>测试</p>\",\"postId\":104,\"postTitle\":\"测试\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:12:45\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:12:45',26),(138,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":101,\"categoryName\":\"交友互动\",\"commentCount\":4,\"createBy\":\"\",\"createTime\":\"2025-04-13 12:46:33\",\"likeCount\":1,\"params\":{},\"postContent\":\"<p>测试</p>\",\"postId\":104,\"postTitle\":\"测试\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:13:10\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:13:10',11),(139,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":101,\"categoryName\":\"交友互动\",\"commentCount\":4,\"createBy\":\"\",\"createTime\":\"2025-04-13 12:46:33\",\"likeCount\":1,\"params\":{},\"postContent\":\"<p>测试</p>\",\"postId\":104,\"postTitle\":\"测试\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:14:00\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:14:00',21),(140,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":101,\"categoryName\":\"交友互动\",\"commentCount\":4,\"createBy\":\"\",\"createTime\":\"2025-04-13 12:46:33\",\"likeCount\":1,\"params\":{},\"postContent\":\"<p>测试</p>\",\"postId\":104,\"postTitle\":\"测试\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:16:23\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:16:23',38),(141,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":101,\"categoryName\":\"交友互动\",\"commentCount\":4,\"createBy\":\"\",\"createTime\":\"2025-04-13 12:46:33\",\"likeCount\":1,\"params\":{},\"postContent\":\"<p>测试</p>\",\"postId\":104,\"postTitle\":\"测试\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:18:08\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:18:08',31),(142,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":101,\"commentCount\":4,\"createBy\":\"\",\"createTime\":\"2025-04-13 12:46:33\",\"likeCount\":1,\"params\":{},\"postContent\":\"<p>你好</p>\",\"postId\":104,\"postTitle\":\"测试\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:20:26\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:20:26',26),(143,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":101,\"commentCount\":4,\"createBy\":\"\",\"createTime\":\"2025-04-13 12:46:33\",\"likeCount\":1,\"params\":{},\"postContent\":\"<p>你好cesgu是是是if打撒</p>\",\"postId\":104,\"postTitle\":\"测试\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:21:33\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:21:33',10),(144,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":101,\"commentCount\":4,\"createBy\":\"\",\"createTime\":\"2025-04-13 12:46:33\",\"likeCount\":1,\"params\":{},\"postContent\":\"<p>你好cesgu是是是if打撒</p>\",\"postId\":104,\"postTitle\":\"测试21243\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:22:32\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:22:32',7),(145,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":101,\"commentCount\":4,\"createBy\":\"\",\"createTime\":\"2025-04-13 12:46:33\",\"likeCount\":1,\"params\":{},\"postContent\":\"<p>到底</p>\",\"postId\":104,\"postTitle\":\"测试21243\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:22:49\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:22:49',10),(146,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"admin\",\"categoryId\":102,\"createTime\":\"2025-04-13 15:23:26\",\"params\":{},\"postContent\":\"<p>你好</p>\",\"postId\":105,\"postTitle\":\"新疆乌鲁木齐\",\"status\":\"1\",\"updateTime\":\"2025-04-13 15:23:26\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:23:26',11),(147,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'测试用户2',NULL,'/bbs/post','127.0.0.1','内网IP','{\"authorId\":101,\"authorName\":\"测试用户2\",\"categoryId\":101,\"createTime\":\"2025-04-13 15:45:04\",\"params\":{},\"postContent\":\"<p>测试</p>\",\"postId\":106,\"postTitle\":\"测试\",\"status\":\"1\",\"updateTime\":\"2025-04-13 15:45:04\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:45:04',25),(148,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'测试用户2',NULL,'/bbs/post','127.0.0.1','内网IP','{\"authorId\":101,\"authorName\":\"测试用户2\",\"categoryId\":101,\"categoryName\":\"交友互动\",\"commentCount\":0,\"createBy\":\"\",\"createTime\":\"2025-04-13 15:45:05\",\"likeCount\":1,\"params\":{},\"postContent\":\"<p>测试</p>\",\"postId\":106,\"postTitle\":\"测试\",\"status\":\"1\",\"updateBy\":\"测试用户2\",\"updateTime\":\"2025-04-13 15:51:15\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:51:15',33),(149,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'测试用户2',NULL,'/bbs/post','127.0.0.1','内网IP','{\"authorId\":101,\"authorName\":\"测试用户2\",\"categoryId\":101,\"createTime\":\"2025-04-13 15:51:46\",\"params\":{},\"postContent\":\"<p>111</p>\",\"postId\":107,\"postTitle\":\"交友\",\"status\":\"1\",\"updateTime\":\"2025-04-13 15:51:46\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:51:46',11),(150,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'测试用户2',NULL,'/bbs/post','127.0.0.1','内网IP','{\"authorId\":101,\"authorName\":\"测试用户2\",\"categoryId\":102,\"createTime\":\"2025-04-13 15:51:56\",\"params\":{},\"postContent\":\"<p>222</p>\",\"postId\":108,\"postTitle\":\"摄影\",\"status\":\"1\",\"updateTime\":\"2025-04-13 15:51:56\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:51:56',4),(151,'帖子状态',2,'com.ruoyi.web.controller.bbs.BbsPostController.updateStatus()','PUT',1,'admin','研发部门','/bbs/post/108/status','127.0.0.1','内网IP','108 {\"params\":{},\"postId\":108,\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:52:30\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:52:30',5),(152,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":101,\"authorName\":\"测试用户2\",\"categoryId\":102,\"commentCount\":0,\"createBy\":\"\",\"createTime\":\"2025-04-13 15:51:56\",\"likeCount\":0,\"params\":{},\"postContent\":\"<p>222对对对</p>\",\"postId\":108,\"postTitle\":\"摄影\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:52:59\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:52:59',9),(153,'帖子状态',2,'com.ruoyi.web.controller.bbs.BbsPostController.updateStatus()','PUT',1,'admin','研发部门','/bbs/post/107/status','127.0.0.1','内网IP','107 {\"params\":{},\"postId\":107,\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 15:58:25\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 15:58:25',9),(154,'帖子状态',2,'com.ruoyi.web.controller.bbs.BbsPostController.updateStatus()','PUT',1,'admin','研发部门','/bbs/post/106/status','127.0.0.1','内网IP','106 {\"params\":{},\"postId\":106,\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 16:06:54\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 16:06:54',23),(155,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2025-04-13 01:05:08\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"帖子管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"post\",\"perms\":\"system:post:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:18:18',38),(156,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-04-13 01:05:08\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"system:user:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:18:48',11),(157,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-04-13 01:05:08\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2022,\"path\":\"user\",\"perms\":\"system:user:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:19:21',11),(158,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin','研发部门','/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:25:10\",\"noticeContent\":\"新版本内容\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：论坛管理系统4月13日开放\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:20:33',8),(159,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin','研发部门','/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:25:10\",\"noticeContent\":\"<p>维护内容</p>\",\"noticeId\":2,\"noticeTitle\":\"维护通知：4月13日-论坛管理系统凌晨维护\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:20:56',4),(160,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2025-04-12 11:25:10\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:21:26',12),(161,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2025-04-12 11:25:10\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:21:30',9),(162,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2025-04-12 11:25:10\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:21:33',10),(163,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2025-04-12 11:25:10\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:21:36',9),(164,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-04-12 11:25:10\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:22:10',12),(165,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"monitor/job/index\",\"createTime\":\"2025-04-12 11:25:10\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:22:34',12),(166,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"monitor/druid/index\",\"createTime\":\"2025-04-12 11:25:10\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":111,\"menuName\":\"数据监控\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"druid\",\"perms\":\"monitor:druid:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:23:26',10),(167,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":101,\"authorName\":\"测试用户2\",\"categoryId\":102,\"categoryName\":\"风景摄影\",\"commentCount\":0,\"createBy\":\"\",\"createTime\":\"2025-04-13 15:51:56\",\"likeCount\":0,\"params\":{},\"postContent\":\"<p>222对对对</p>\",\"postId\":108,\"postTitle\":\"摄影\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 17:58:21\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 17:58:21',28),(168,'帖子状态',2,'com.ruoyi.web.controller.bbs.BbsPostController.updateStatus()','PUT',1,'admin','研发部门','/bbs/post/105/status','127.0.0.1','内网IP','105 {\"params\":{},\"postId\":105,\"status\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 18:03:17\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 18:03:17',24),(169,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":102,\"commentCount\":0,\"createBy\":\"\",\"createTime\":\"2025-04-13 15:23:27\",\"likeCount\":0,\"params\":{},\"postContent\":\"<p>你好dd </p>\",\"postId\":105,\"postTitle\":\"新疆乌鲁木齐\",\"status\":\"2\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 18:03:26\",\"viewCount\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 18:03:26',18),(170,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"admin\",\"categoryId\":102,\"createTime\":\"2025-04-13 18:33:03\",\"params\":{},\"postContent\":\"<p>test</p>\",\"postId\":109,\"postTitle\":\"test\",\"status\":\"1\",\"updateTime\":\"2025-04-13 18:33:03\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 18:33:03',18),(171,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2025-04-12 11:25:10\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":2022,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 18:42:53',12),(172,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":103,\"categoryName\":\"二手交易\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":4,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 18:43:49',5),(173,'帖子',2,'com.ruoyi.web.controller.bbs.BbsPostController.edit()','PUT',1,'admin','研发部门','/bbs/post','127.0.0.1','内网IP','{\"authorId\":1,\"authorName\":\"若依\",\"categoryId\":102,\"commentCount\":0,\"createBy\":\"\",\"createTime\":\"2025-04-13 18:33:03\",\"likeCount\":0,\"params\":{},\"postContent\":\"<p class=\\\"ql-align-justify\\\">\\t<span style=\\\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\\\">4月3日，国际合作部外籍教师俱乐部举办“春风纸鸢，踏青寻趣”主题活动，来自16个国家的20余位外籍专家学者齐聚北京大学教师之家，于素白纸鸢上勾勒东方美学的悠长气韵，近距离感受中国传统工艺的魅力与文化内涵。</span></p><p class=\\\"ql-align-center\\\">\\t<span style=\\\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\\\"><img src=\\\"https://www.oir.pku.edu.cn/__local/7/DB/F1/C4FFE0EBFCC05FBB346A808F4A6_14B85B00_41450.jpg\\\" width=\\\"500\\\"></span></p><p class=\\\"ql-align-center\\\">\\t<span style=\\\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\\\"><img src=\\\"https://www.oir.pku.edu.cn/__local/D/46/8D/E171172F39164DA556D8B0C1A64_BE7A906D_3C883.jpg\\\" width=\\\"500\\\"></span></p><p class=\\\"ql-align-center\\\">\\t<span style=\\\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\\\">\\t活动现场</span></p><p class=\\\"ql-align-justify\\\">\\t<span style=\\\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\\\">活动中，国合秘书处外专中心的同学们系统讲解了中国风筝2500余年的发展历史与工艺智慧，从《清明上河图》中孩童放鸢的生动场景，到“扎、糊、绘、放”四大技艺的匠心传承，从潍坊风筝的灵动竹骨，到江南纸鸢的薄绡烟雨，再到牡丹、桃花、龙、拱门等不同的风筝纹样蕴含着不同的美好寓意。外专们通过图片和视频，深入了解了风筝承载的文化寓意与生命哲学。在手工制作环节，外专们调色、勾线、绘彩，为风筝注入多元文化创意，有以牡丹、祥云等传统纹样传递美好祝愿，有将现代元素与龙图腾巧妙结合，还有从本国文化中汲取灵感，勾勒出跨越地域的春日图景。</span></p><p class=\\\"ql-align-center\\\">\\t<span style=\\\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\\\"><img src=\\\"https://www.oir.pku.edu.cn/__local/A/7B/B9/81F80EB690B4A2293B8DC8B08D8_82CBA59F_4AD4D.jpg\\\" width=\\\"500\\\"></span></p><p class=\\\"ql-align-center\\\">\\t<span style=\\\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\\\"><img src=\\\"https://www.oir.pku.edu.cn/__local/2/DF/91/D2FD95A1FB1623F156E36A7E5DA_0F70BEA1_52FD7.jpg\\\" width=\\\"500\\\"></span></p><p class=\\\"ql-align-center\\\">\\t<span style=\\\"background-color: rgb(255, 255, 255); color: rgb(91, 91, 91);\\\">风筝制作、合影留念</span></p><p class=\\\"ql-align-justify\\\">\\t<span s','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 18:45:54',16),(174,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"系统用户管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"user\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 19:28:52',9),(175,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2025-04-13 01:05:08\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2043,\"path\":\"role\",\"perms\":\"system:role:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 19:29:17',10),(176,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-04-13 01:05:08\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2043,\"path\":\"user\",\"perms\":\"system:user:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 19:30:01',22),(177,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":102,\"userName\":\"测试\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 19:32:25',91),(178,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:25:10\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-04-13 02:14:25\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"一号\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 19:34:25',17),(179,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:25:10\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"cs@qq.com\",\"loginDate\":\"2025-04-13 02:14:25\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"一号\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 19:34:33',15),(180,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"bbs/post/index\",\"createTime\":\"2025-04-13 01:05:08\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"帖子管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"post\",\"perms\":\"system:post:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 19:39:51',14),(181,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":100,\"categoryName\":\"学习园地\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 20:09:28',11),(182,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":101,\"categoryName\":\"交友互动\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":2,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 20:09:30',3),(183,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"bbs/post\",\"createTime\":\"2025-04-13 01:05:08\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"帖子管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"post\",\"perms\":\"system:post:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 20:09:50',6),(184,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"bbs/post/index\",\"createTime\":\"2025-04-13 01:05:08\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"帖子管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"post\",\"perms\":\"system:post:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 20:10:15',8),(185,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/104','127.0.0.1','内网IP','104','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-04-13 20:10:48',3),(186,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"systemdd/post/index\",\"createTime\":\"2025-04-12 11:25:10\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 20:10:55',7),(187,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2025-04-13 01:05:08\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"帖子管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"post\",\"perms\":\"system:post:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 20:11:08',7),(188,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'测试用户2',NULL,'/bbs/post','127.0.0.1','内网IP','{\"authorId\":101,\"authorName\":\"测试用户2\",\"categoryId\":101,\"createTime\":\"2025-04-13 20:15:42\",\"params\":{},\"postContent\":\"<p>test</p>\",\"postId\":110,\"postTitle\":\"test\",\"status\":\"1\",\"updateTime\":\"2025-04-13 20:15:42\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 20:15:42',33),(189,'帖子',1,'com.ruoyi.web.controller.bbs.BbsPostController.add()','POST',1,'测试用户2',NULL,'/bbs/post','127.0.0.1','内网IP','{\"authorId\":101,\"authorName\":\"测试用户2\",\"categoryId\":100,\"createTime\":\"2025-04-13 20:27:43\",\"params\":{},\"postContent\":\"<p>ceshi</p>\",\"postId\":111,\"postTitle\":\"ceshi\",\"status\":\"1\",\"updateTime\":\"2025-04-13 20:27:43\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 20:27:43',90),(190,'帖子状态',2,'com.ruoyi.web.controller.bbs.BbsPostController.updateStatus()','PUT',1,'admin','研发部门','/bbs/post/109/status','127.0.0.1','内网IP','109 {\"params\":{},\"postId\":109,\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-13 20:28:49\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 20:28:49',9),(191,'帖子分类',2,'com.ruoyi.web.controller.system.BbsCategoryController.edit()','PUT',1,'admin','研发部门','/system/category','127.0.0.1','内网IP','{\"categoryId\":103,\"categoryName\":\"二手交易1\",\"createBy\":\"admin\",\"createTime\":\"2025-04-12 11:14:24\",\"orderNum\":4,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-04-13 20:29:14',8);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2025-04-12 11:25:10','',NULL,''),(2,'se','项目经理',2,'0','admin','2025-04-12 11:25:10','',NULL,''),(3,'hr','人力资源',3,'0','admin','2025-04-12 11:25:10','',NULL,''),(4,'user','普通员工',4,'0','admin','2025-04-12 11:25:10','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2025-04-12 11:25:10','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2025-04-12 11:25:10','',NULL,'普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,2018),(2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,2015),(2,2018),(2,2019),(2,2020),(2,2021),(2,2022),(2,2023);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','管理员','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-04-13 20:47:51','admin','2025-04-12 11:25:10','','2025-04-13 20:47:51','管理员'),(2,105,'qa','一号','00','cs@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-04-13 02:14:25','admin','2025-04-12 11:25:10','admin','2025-04-13 19:34:33','测试员'),(100,NULL,'测试用户','测试用户','00','','','0','','$2a$10$36MG/q8PQpHgbnSz1fDW9ewMWfMB8n8anJLf956GzjKTg7zoWqnlW','0','0','',NULL,'admin','2025-04-13 01:36:31','',NULL,NULL),(101,NULL,'测试用户2','测试用户2','01','','','0','','$2a$10$/6cbWt1KdlRcg1ix55uYcOzwlYJzLDL4TKjPN6vwUCWUya0.RYrES','0','0','127.0.0.1','2025-04-13 20:15:22','admin','2025-04-13 01:37:26','','2025-04-13 20:15:21',NULL),(102,NULL,'测试','测试','00','','','0','','$2a$10$1gB00YPqyJvQZY9OqeSNvefnskyuzCKhOuAF45s2MSfQWpg3TtxZO','0','0','',NULL,'admin','2025-04-13 19:32:25','',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-13 20:49:53
