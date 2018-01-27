/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.7.19-log : Database - admindb
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

/*Table structure for table `sys_dictionary` */

DROP TABLE IF EXISTS `sys_dictionary`;

CREATE TABLE `sys_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `value` varchar(64) NOT NULL COMMENT 'value',
  `description` varchar(128) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `sys_dictionary` */

insert  into `sys_dictionary`(`id`,`name`,`value`,`description`) values (1,'证件类型','card_type','证件类型:身份证、军人证、港澳证'),(4,'性别','sex','性别：男 女'),(5,'部门','department','公司部门');

/*Table structure for table `sys_dictionary_option` */

DROP TABLE IF EXISTS `sys_dictionary_option`;

CREATE TABLE `sys_dictionary_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_value` varchar(64) NOT NULL COMMENT '数据字典id',
  `name` varchar(64) NOT NULL COMMENT '选项名称',
  `value` varchar(32) NOT NULL COMMENT '选项值',
  `sort` int(11) DEFAULT NULL COMMENT '排序值',
  `locked` tinyint(1) DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `sys_dictionary_option` */

insert  into `sys_dictionary_option`(`id`,`dict_value`,`name`,`value`,`sort`,`locked`) values (1,'card_type','身份证','1',1,0),(2,'card_type','军人证','2',2,0),(3,'card_type','港澳证','3',3,0),(4,'sex','男','0',0,NULL),(5,'sex','女','1',1,NULL),(7,'department','人事部','0',0,NULL),(8,'department','财务部','1',1,NULL);

/*Table structure for table `sys_logs` */

DROP TABLE IF EXISTS `sys_logs`;

CREATE TABLE `sys_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logClass` varchar(255) DEFAULT NULL,
  `logLevel` varchar(255) DEFAULT NULL,
  `logContent` varchar(1024) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=549 DEFAULT CHARSET=utf8;

/*Data for the table `sys_logs` */

/*Table structure for table `sys_resources` */

DROP TABLE IF EXISTS `sys_resources`;

CREATE TABLE `sys_resources` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `res_name` varchar(128) NOT NULL COMMENT '资源名称',
  `res_value` varchar(128) DEFAULT NULL COMMENT '资源的值',
  `description` varchar(256) DEFAULT NULL COMMENT '资源描述',
  `res_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单资源，非菜单资源',
  `res_level` int(11) DEFAULT NULL COMMENT '资源层级',
  `p_res_id` int(11) DEFAULT NULL COMMENT '上级资源ID',
  `res_sort` int(11) DEFAULT NULL COMMENT '排序字段',
  `res_icon` varchar(128) DEFAULT NULL COMMENT '资源图标',
  `locked` tinyint(1) DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`res_id`),
  UNIQUE KEY `res_name` (`res_name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='资源表';

/*Data for the table `sys_resources` */

insert  into `sys_resources`(`res_id`,`res_name`,`res_value`,`description`,`res_type`,`res_level`,`p_res_id`,`res_sort`,`res_icon`,`locked`) values (1,'XXXX管理系统','#','系统根,res_id为1 p_res_id为-1,不可改动.',1,-1,-1,1,NULL,0),(2,'系统管理','#','系统的基本配置。管理员才可以使用',1,0,1,1,'fa fa-cogs',0),(3,'用户管理','common/user/userList','用户管理,crud基本操作',1,1,2,1,'fa fa-user-o',0),(4,'角色管理','common/role/roleList','角色管理,crud基本操作',1,1,2,2,'fa fa-users',0),(5,'资源管理','common/resource/resourceList','资源管理,crud基本操作',1,1,2,3,'fa fa-database',0),(6,'日志管理','#','',1,1,2,1,'fa fa-user',0),(7,'添加资源页面','common/resource/addResourcesPage','',0,2,5,1,'',0),(8,'添加资源','common/resource/addResources','',0,2,5,2,'',0),(9,'删除资源','common/resource/deleteResources','',0,2,5,3,'',0),(10,'修改资源页面','common/resource/updateResourcesPage','',0,2,5,4,'',0),(11,'修改资源','common/resource/updateResources','',0,2,5,5,'',0),(12,'设置角色权限','common/role/setRoleResourcePage','',0,2,4,1,'',0),(13,'设置角色','common/role/saveRoleResourceId','',0,2,4,2,'',0),(14,'添加角色页面','common/role/addRolePage','',0,2,4,3,'',0),(15,'添加角色','common/resource/addResources','',0,2,4,4,'',0),(16,'修改角色页面','common/role/updateRolePage','',0,0,4,7,'',0),(17,'修改角色','common/role/updateRole','',0,2,4,7,'',0),(18,'删除角色','common/role/deleteRole','',0,2,4,9,'',0),(19,'添加用户页面','common/user/addUserPage','',0,2,3,1,'',0),(20,'添加用户','common/user/addUser','',0,0,3,2,'',0),(21,'修改用户页面','common/user/updateUserPage','',0,0,3,4,'',0),(22,'修改用户','common/user/updateUser','',0,0,3,NULL,'',0),(23,'删除用户','common/user/deleteUser','',0,0,3,NULL,'',0),(24,'设置用户角色页面','common/user/setUserRolePage','',0,0,3,NULL,'',0),(25,'设置用户角色','common/user/saveUserRole','',0,2,3,NULL,'',0),(26,'数据字典','common/dictionary/dictionaryList','数据字典',1,1,2,4,'fa fa-book',0),(27,'添加数据字典页面','common/dictionary/addDictionaryPage','',0,2,26,1,'',0),(28,'添加数据字典','common/dictionary/addDictionary','',0,2,26,2,'',0),(29,'修改数据字典页面','common/dictionary/updateDictionaryPage','',0,2,26,3,'',0),(30,'修改数据字典','common/dictionary/updateDictionary','',0,2,26,4,'',0),(31,'删除数据字典','common/dictionary/deleteDictionary','',0,2,26,5,'',0),(32,'数据字典选项页面','common/dictionary/dictionaryOptionList','',0,2,26,10,'',0),(33,'添加数据字典选项','common/dictionary/addDictionaryOption','',0,2,26,11,'',0),(34,'添加数据字典选项页面','common/dictionary/addDictionaryOptionPage','',0,2,26,12,'',0),(35,'修改数据字典选项','common/dictionary/updateDictionaryOption','',0,2,26,13,'',0),(36,'修改数据字典选项页面','common/dictionary/updateDictionaryOptionPage','',0,2,26,14,'',0),(37,'删除数据字典选项','common/dictionary/deleteDictionaryOption',NULL,0,2,26,15,NULL,0),(38,'查看登陆用户个人信息','common/user/showUserInfo','',0,2,3,1,'',0);

/*Table structure for table `sys_roles` */

DROP TABLE IF EXISTS `sys_roles`;

CREATE TABLE `sys_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(128) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(256) DEFAULT NULL COMMENT '角色描述',
  `locked` tinyint(1) DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表，系统角色表，对系统资源、菜单访问属性集合';

/*Data for the table `sys_roles` */

insert  into `sys_roles`(`role_id`,`role_name`,`description`,`locked`) values (1,'admin','管理员',0),(2,'userone','第一个用户',0),(3,'usertwo','第二个用户',0);

/*Table structure for table `sys_roles_resources` */

DROP TABLE IF EXISTS `sys_roles_resources`;

CREATE TABLE `sys_roles_resources` (
  `role_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_roles_resources` */

insert  into `sys_roles_resources`(`role_id`,`resource_id`) values (1,2),(1,3),(1,4),(1,5),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(2,2),(2,3),(2,4),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(3,1),(3,2);

/*Table structure for table `sys_users` */

DROP TABLE IF EXISTS `sys_users`;

CREATE TABLE `sys_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户号',
  `user_name` varchar(128) NOT NULL COMMENT '登录名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) DEFAULT NULL COMMENT '密码盐',
  `real_name` varchar(128) DEFAULT NULL COMMENT '真实姓名',
  `depart_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `user_photo` varchar(128) DEFAULT NULL COMMENT '头像',
  `user_phone` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `user_qq` varchar(32) DEFAULT NULL COMMENT 'qq号码',
  `user_email` varchar(32) DEFAULT NULL COMMENT 'email',
  `locked` tinyint(1) DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='用户表，完成对系统用户的认证';

/*Data for the table `sys_users` */

insert  into `sys_users`(`user_id`,`user_name`,`password`,`salt`,`real_name`,`depart_id`,`user_photo`,`user_phone`,`user_qq`,`user_email`,`locked`) values (1,'shasha','b8c1f095f79f0f5b4c35e464ba6559dd','546d1949cc0f7a3a7d8601b8d1ea0e1d','沙沙',NULL,'','18356095840','2452403243','2452403243@qq.com',0);

/*Table structure for table `sys_users_roles` */

DROP TABLE IF EXISTS `sys_users_roles`;

CREATE TABLE `sys_users_roles` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_users_roles` */

insert  into `sys_users_roles`(`user_id`,`role_id`) values (1,1),(1,2),(1,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
