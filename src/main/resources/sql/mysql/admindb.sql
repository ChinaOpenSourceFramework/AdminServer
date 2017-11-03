/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.0.27-community-nt : Database - admindb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`admindb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `admindb`;

/*Table structure for table `sys_resources` */

DROP TABLE IF EXISTS `sys_resources`;

CREATE TABLE `sys_resources` (
  `res_id` int(11) NOT NULL auto_increment COMMENT '资源ID',
  `res_name` varchar(128) NOT NULL COMMENT '资源名称',
  `description` varchar(256) default NULL COMMENT '资源描述',
  `res_type` tinyint(1) NOT NULL default '0' COMMENT '菜单资源，非菜单资源',
  `res_level` int(11) default NULL COMMENT '资源层级',
  `res_leaf_flag` int(11) default NULL COMMENT '末级菜单标识',
  `p_res_id` int(11) default NULL COMMENT '上级资源ID',
  `res_sort` int(11) default NULL COMMENT '排序字段',
  `res_icon` varchar(128) default NULL COMMENT '资源图标',
  `locked` tinyint(1) default '0' COMMENT '是否锁定',
  PRIMARY KEY  (`res_id`),
  UNIQUE KEY `res_name` (`res_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

/*Table structure for table `sys_roles` */

DROP TABLE IF EXISTS `sys_roles`;

CREATE TABLE `sys_roles` (
  `role_id` int(11) NOT NULL auto_increment COMMENT '角色ID',
  `role_name` varchar(128) NOT NULL default '' COMMENT '角色名称',
  `description` varchar(256) default NULL COMMENT '角色描述',
  `locked` tinyint(1) default '0' COMMENT '是否锁定',
  PRIMARY KEY  (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表，系统角色表，对系统资源、菜单访问属性集合';

/*Table structure for table `sys_roles_resources` */

DROP TABLE IF EXISTS `sys_roles_resources`;

CREATE TABLE `sys_roles_resources` (
  `role_id` int(11) NOT NULL default '0',
  `resource_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`role_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_users` */

DROP TABLE IF EXISTS `sys_users`;

CREATE TABLE `sys_users` (
  `user_id` int(11) NOT NULL auto_increment COMMENT '用户号',
  `user_name` varchar(128) NOT NULL COMMENT '登录名',
  `password` varchar(64) default NULL COMMENT '密码',
  `salt` varchar(32) default NULL COMMENT '密码盐',
  `real_name` varchar(128) default NULL COMMENT '真实姓名',
  `depart_id` int(11) default NULL COMMENT '部门ID',
  `user_photo` varchar(128) default NULL COMMENT '头像',
  `user_phone` varchar(32) default NULL COMMENT '手机号码',
  `user_qq` varchar(32) default NULL COMMENT 'qq号码',
  `user_email` varchar(32) default NULL COMMENT 'email',
  `locked` tinyint(1) default '0' COMMENT '是否锁定',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表，完成对系统用户的认证';

/*Table structure for table `sys_users_roles` */

DROP TABLE IF EXISTS `sys_users_roles`;

CREATE TABLE `sys_users_roles` (
  `user_id` int(11) NOT NULL default '0',
  `role_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
