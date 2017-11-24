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
  `res_value` varchar(128) default NULL COMMENT '资源的值',
  `description` varchar(256) default NULL COMMENT '资源描述',
  `res_type` tinyint(1) NOT NULL default '0' COMMENT '菜单资源，非菜单资源',
  `res_level` int(11) default NULL COMMENT '资源层级',
  `p_res_id` int(11) default NULL COMMENT '上级资源ID',
  `res_sort` int(11) default NULL COMMENT '排序字段',
  `res_icon` varchar(128) default NULL COMMENT '资源图标',
  `locked` tinyint(1) default '0' COMMENT '是否锁定',
  PRIMARY KEY  (`res_id`),
  UNIQUE KEY `res_name` (`res_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

/*Data for the table `sys_resources` */

insert  into `sys_resources`(`res_id`,`res_name`,`res_value`,`description`,`res_type`,`res_level`,`p_res_id`,`res_sort`,`res_icon`,`locked`) values (1,'XXXX管理系统','#','系统根,res_id为1 p_res_id为-1,不可改动.',1,-1,-1,1,NULL,0),(2,'系统管理','#','系统的基本配置。管理员才可以使用',1,0,1,1,'fa fa-cogs',0),(3,'用户管理','common/user/userList','用户管理,crud基本操作',1,1,2,1,'fa fa-user-o',0),(4,'角色管理','common/role/roleList','角色管理,crud基本操作',1,1,2,2,'fa fa-users',0),(5,'资源管理','common/resource/resourceList','资源管理,crud基本操作',1,1,2,3,'fa fa-database',0),(6,'日志管理','#','ddddddddddddddd',1,1,2,1,'fa fa-user',0);

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

/*Data for the table `sys_roles` */

insert  into `sys_roles`(`role_id`,`role_name`,`description`,`locked`) values (1,'admin','管理员',0),(2,'userone','第一个用户',0),(3,'usertwo','第二个用户',0),(4,'userthree','aaaaaaaaaaaaaaaaaaaaaaa',0);

/*Table structure for table `sys_roles_resources` */

DROP TABLE IF EXISTS `sys_roles_resources`;

CREATE TABLE `sys_roles_resources` (
  `role_id` int(11) NOT NULL default '0',
  `resource_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`role_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_roles_resources` */

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

/*Data for the table `sys_users` */

insert  into `sys_users`(`user_id`,`user_name`,`password`,`salt`,`real_name`,`depart_id`,`user_photo`,`user_phone`,`user_qq`,`user_email`,`locked`) values (3,'ddd','111111111111111','salt','dddd',1,'dddddddd','111111111111','222222222222','123@qq.com',0),(18,'liqiwei123','liqiwei',NULL,'李其伟',1,'touxiang','18356095840','2452403243','2452403243@qq.com',0),(19,'111fasd','2123122',NULL,'11',1111,'1111','11111','11','111111111111111@qq.com',0),(20,'ssssssss','221111111',NULL,'1111111',111,'1111','1111121','2222222222222222','111111111111111@qq.com',0),(21,'11122222211111112222','1122222222',NULL,'11111111',111111,'11111','2222222222222','222','2452403243@qq.com',0),(22,'1111133333333331111','111111111111',NULL,'1',111,'11111','','','',0),(23,'ffffffffff','2222222222222',NULL,'',NULL,'','','','',0),(24,'2222222222222zzzzzzzzzzz','wwwwwwww',NULL,'',NULL,'','','','',0),(25,'wwwwwwwww','1111111111111',NULL,'22222',3,'','','','',0),(26,'hhhhhhhhhhhhhhhhhh','hhhhhhh',NULL,'',NULL,'','','','',0),(27,'hhhhhhhhhhhhvvvvvv','vvvvvvvvvvv',NULL,'',NULL,'','','','',0),(28,'xxxxxxxxxxxx','xxxxxxxxx',NULL,'xxxxxxxxxxxxxxxxxx',NULL,'','','','',0);

/*Table structure for table `sys_users_roles` */

DROP TABLE IF EXISTS `sys_users_roles`;

CREATE TABLE `sys_users_roles` (
  `user_id` int(11) NOT NULL default '0',
  `role_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_users_roles` */

insert  into `sys_users_roles`(`user_id`,`role_id`) values (1,1),(1,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
