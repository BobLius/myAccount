/*
Navicat MySQL Data Transfer

Source Server         : LiuBo
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : my_account

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2015-04-14 17:06:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `buy`
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy` (
  ` id` varchar(100) NOT NULL,
  `socket_id` varchar(100) DEFAULT NULL COMMENT '股票代码',
  `socket_name` varchar(100) DEFAULT '' COMMENT '股票名称',
  `buy_date` date DEFAULT NULL COMMENT '买入时间',
  `buy_mount` varchar(100) DEFAULT NULL COMMENT '买入股数',
  `buy_every_money` varchar(100) DEFAULT NULL COMMENT '每股价格',
  `buy_tolle_money` varchar(100) DEFAULT NULL COMMENT '总买入价格',
  `brokerage` varchar(100) DEFAULT NULL COMMENT '佣金',
  `transfer_fee` varchar(100) DEFAULT NULL COMMENT '过户费',
  `costs` varchar(100) DEFAULT NULL COMMENT '每股成本',
  `the_end` varchar(100) DEFAULT NULL COMMENT '成交额',
  `sell_lowest` varchar(100) DEFAULT NULL COMMENT '最低卖出价格',
  PRIMARY KEY (` id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buy
-- ----------------------------

-- ----------------------------
-- Table structure for `resources`
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources` (
  `id` varchar(100) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `menu_level` int(100) DEFAULT NULL,
  `menu_order` int(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `event_name` varchar(100) DEFAULT NULL,
  `log_level` int(100) DEFAULT NULL,
  `create_dt` date DEFAULT NULL,
  `c_operator_id` varchar(100) DEFAULT NULL,
  `last_upd_dt` date DEFAULT NULL,
  `u_operator_id` varchar(100) DEFAULT NULL,
  `resources_type` varchar(100) DEFAULT NULL,
  `synonyms` varchar(100) DEFAULT NULL,
  `pid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resources
-- ----------------------------
INSERT INTO `resources` VALUES ('001', '/', '1', '1', '1', '系统', '234', null, '2015-04-14', null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('002', '/resource', '2', '1', '1', '权限', '权限', null, null, null, null, null, null, null, '001');
INSERT INTO `resources` VALUES ('402890ba4cb6aff7014cb6b4e2b00000', '/user', null, null, '1', '用户', '', '-1', null, null, null, null, '0', '用户', '001');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `create_dt` date DEFAULT NULL,
  `c_operator_id` varchar(100) DEFAULT NULL,
  `last_upd_dt` date DEFAULT NULL,
  `u_operator_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('001', 'all', '2015-04-14', null, null, null);

-- ----------------------------
-- Table structure for `role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `roles_id` varchar(100) NOT NULL,
  `resources_id` varchar(100) NOT NULL,
  PRIMARY KEY (`roles_id`,`resources_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('001', '001');

-- ----------------------------
-- Table structure for `sell`
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
  `id` varchar(100) NOT NULL,
  `socket_id` varchar(100) DEFAULT NULL COMMENT '股票代码',
  `socket_name` varchar(100) DEFAULT '' COMMENT '股票名称',
  `selldate` date DEFAULT NULL COMMENT '卖出时间',
  `sell_mount` varchar(100) DEFAULT NULL COMMENT '卖出股数',
  `sell_every_money` varchar(100) DEFAULT NULL COMMENT '每股价格',
  `sell_tolle_money` varchar(100) DEFAULT NULL COMMENT '总卖出价格',
  `brokerage` varchar(100) DEFAULT NULL COMMENT '佣金',
  `transfer_fee` varchar(100) DEFAULT NULL COMMENT '过户费',
  `stamp` varchar(100) DEFAULT NULL COMMENT '印花税',
  `the_end` varchar(100) DEFAULT NULL COMMENT '成交额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sell
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(100) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  `dept` varchar(100) DEFAULT NULL,
  `enabled` int(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `errorCnt` int(100) DEFAULT NULL,
  `branch_inst_id` varchar(100) DEFAULT NULL,
  `isdelete` varchar(100) DEFAULT NULL,
  `create_dt` date DEFAULT NULL,
  `c_operator_id` varchar(100) DEFAULT NULL,
  `last_upd_dt` date DEFAULT NULL,
  `u_operator_id` varchar(100) DEFAULT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  `inst` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('100000', 'admin', 'admin', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `users_role`
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `users_id` varchar(100) NOT NULL,
  `roles_id` varchar(100) NOT NULL,
  PRIMARY KEY (`users_id`,`roles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('100000', '001');
