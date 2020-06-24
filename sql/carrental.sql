/*
Navicat MySQL Data Transfer

Source Server         : back
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : carrental

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-06-24 20:18:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bus_car`
-- ----------------------------
DROP TABLE IF EXISTS `bus_car`;
CREATE TABLE `bus_car` (
  `carNumber` varchar(255) NOT NULL COMMENT '车牌号',
  `carType` varchar(255) DEFAULT NULL COMMENT '车辆型号',
  `color` varchar(255) DEFAULT NULL COMMENT '车辆颜色',
  `price` double(10,2) DEFAULT NULL COMMENT '购买价格',
  `rentPrice` double(10,2) DEFAULT NULL COMMENT '出租价格',
  `deposit` double DEFAULT NULL COMMENT '出租押金',
  `isRenting` int(11) DEFAULT NULL COMMENT '出租状态 0：否 1：是',
  `description` varchar(255) DEFAULT NULL COMMENT '车辆描述',
  `carImg` varchar(255) DEFAULT NULL COMMENT '车辆图片',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`carNumber`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_car
-- ----------------------------
INSERT INTO `bus_car` VALUES ('辽B333333', '跑车', '红色', '600000.00', '2000.00', '500', '0', '外观美观', '2020-05-01/202005012130402323.jpg', '2020-05-01 21:30:14');
INSERT INTO `bus_car` VALUES ('辽CA11111', 'SUV', '白色', '200000.00', '5000.00', '1000', '0', '国产长城', '2020-04-29/202004292047516221.jpg', '2020-04-28 22:27:45');
INSERT INTO `bus_car` VALUES ('辽CB22222', '跑车', '白色', '500000.00', '5000.00', '1000', '1', '动力强大', '2020-05-01/202005012113495177.jpg', '2020-05-01 21:13:12');

-- ----------------------------
-- Table structure for `bus_check`
-- ----------------------------
DROP TABLE IF EXISTS `bus_check`;
CREATE TABLE `bus_check` (
  `checkId` varchar(255) NOT NULL COMMENT '检查单号',
  `checkDate` datetime DEFAULT NULL COMMENT '检查时间',
  `checkDesc` varchar(255) DEFAULT NULL COMMENT '问题描述',
  `problem` varchar(255) DEFAULT NULL COMMENT '存在问题',
  `payMoney` double(255,0) DEFAULT NULL COMMENT '赔付金额',
  `operName` varchar(255) DEFAULT NULL COMMENT '填写人',
  `rentId` varchar(255) DEFAULT NULL COMMENT '出租单号',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`checkId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_check
-- ----------------------------
INSERT INTO `bus_check` VALUES ('JC_20200503_161657_119_17905', '2020-05-03 16:16:57', '左侧车门有刮痕', '有刮痕', '1000', '超级管理员', 'CZ_20200502_191826_128_35023', '2020-05-03 16:17:15');

-- ----------------------------
-- Table structure for `bus_customer`
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer` (
  `identity` varchar(255) NOT NULL COMMENT '身份证',
  `custName` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` int(255) DEFAULT NULL COMMENT '性别',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `career` varchar(255) DEFAULT NULL COMMENT '职位',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`identity`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES ('201019941112181633', '333', '1', '333344', '18730254234', '33333', '2020-04-27 22:57:18');

-- ----------------------------
-- Table structure for `bus_rent`
-- ----------------------------
DROP TABLE IF EXISTS `bus_rent`;
CREATE TABLE `bus_rent` (
  `rentId` varchar(255) NOT NULL,
  `price` double(10,2) DEFAULT NULL,
  `beginDate` datetime DEFAULT NULL,
  `returnDate` datetime DEFAULT NULL,
  `rentFlag` int(11) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `carNumber` varchar(255) DEFAULT NULL,
  `operName` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`rentId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_rent
-- ----------------------------
INSERT INTO `bus_rent` VALUES ('CZ_20200501_002655_470_95036', '5000.00', '2020-05-01 00:26:55', '2020-05-04 02:02:04', '1', '201019941112181633', '辽C22222', '超级管理员', '2020-05-01 00:27:21');
INSERT INTO `bus_rent` VALUES ('CZ_20200502_191826_128_35023', '2000.00', '2020-05-02 19:18:26', '2020-05-09 12:00:00', '1', '201019941112181633', '辽B333333', '超级管理员', '2020-04-02 19:18:37');
INSERT INTO `bus_rent` VALUES ('CZ_20200503_190152_116_65732', '5000.00', '2020-05-03 19:01:52', '2020-05-08 12:00:00', '0', '201019941112181633', '辽CB22222', '超级管理员', '2020-03-03 19:02:23');

-- ----------------------------
-- Table structure for `sys_log_login`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(255) DEFAULT NULL,
  `loginIp` varchar(255) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO `sys_log_login` VALUES ('50', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 15:47:17');
INSERT INTO `sys_log_login` VALUES ('51', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 15:47:44');
INSERT INTO `sys_log_login` VALUES ('52', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 15:48:21');
INSERT INTO `sys_log_login` VALUES ('53', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 16:18:14');
INSERT INTO `sys_log_login` VALUES ('54', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 16:24:33');
INSERT INTO `sys_log_login` VALUES ('55', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 16:25:17');
INSERT INTO `sys_log_login` VALUES ('56', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 16:27:01');
INSERT INTO `sys_log_login` VALUES ('57', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 16:37:30');
INSERT INTO `sys_log_login` VALUES ('58', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 16:43:17');
INSERT INTO `sys_log_login` VALUES ('59', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 16:44:38');
INSERT INTO `sys_log_login` VALUES ('60', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 16:45:51');
INSERT INTO `sys_log_login` VALUES ('61', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 16:46:54');
INSERT INTO `sys_log_login` VALUES ('62', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 17:05:01');
INSERT INTO `sys_log_login` VALUES ('63', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 17:08:26');
INSERT INTO `sys_log_login` VALUES ('64', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 17:09:19');
INSERT INTO `sys_log_login` VALUES ('65', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 17:11:27');
INSERT INTO `sys_log_login` VALUES ('66', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 17:14:17');
INSERT INTO `sys_log_login` VALUES ('67', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 17:15:32');
INSERT INTO `sys_log_login` VALUES ('68', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 17:16:01');
INSERT INTO `sys_log_login` VALUES ('69', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 18:36:09');
INSERT INTO `sys_log_login` VALUES ('70', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 19:02:45');
INSERT INTO `sys_log_login` VALUES ('71', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 19:07:47');
INSERT INTO `sys_log_login` VALUES ('72', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 19:10:59');
INSERT INTO `sys_log_login` VALUES ('73', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 19:25:08');
INSERT INTO `sys_log_login` VALUES ('74', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 19:31:23');
INSERT INTO `sys_log_login` VALUES ('75', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 19:37:22');
INSERT INTO `sys_log_login` VALUES ('76', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 19:51:04');
INSERT INTO `sys_log_login` VALUES ('77', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:00:16');
INSERT INTO `sys_log_login` VALUES ('78', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:21:20');
INSERT INTO `sys_log_login` VALUES ('79', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:25:38');
INSERT INTO `sys_log_login` VALUES ('80', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:28:19');
INSERT INTO `sys_log_login` VALUES ('81', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:34:24');
INSERT INTO `sys_log_login` VALUES ('82', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:38:17');
INSERT INTO `sys_log_login` VALUES ('83', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:42:17');
INSERT INTO `sys_log_login` VALUES ('84', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:44:08');
INSERT INTO `sys_log_login` VALUES ('85', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:44:24');
INSERT INTO `sys_log_login` VALUES ('86', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:44:35');
INSERT INTO `sys_log_login` VALUES ('87', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:46:08');
INSERT INTO `sys_log_login` VALUES ('88', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:48:52');
INSERT INTO `sys_log_login` VALUES ('89', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:49:09');
INSERT INTO `sys_log_login` VALUES ('90', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:50:31');
INSERT INTO `sys_log_login` VALUES ('91', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:52:09');
INSERT INTO `sys_log_login` VALUES ('92', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:56:02');
INSERT INTO `sys_log_login` VALUES ('93', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 20:58:25');
INSERT INTO `sys_log_login` VALUES ('94', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 21:02:23');
INSERT INTO `sys_log_login` VALUES ('95', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 21:05:17');
INSERT INTO `sys_log_login` VALUES ('96', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 21:08:13');
INSERT INTO `sys_log_login` VALUES ('97', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 21:12:16');
INSERT INTO `sys_log_login` VALUES ('98', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 21:24:55');
INSERT INTO `sys_log_login` VALUES ('99', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 21:26:13');
INSERT INTO `sys_log_login` VALUES ('100', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 21:27:35');
INSERT INTO `sys_log_login` VALUES ('101', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 23:46:46');
INSERT INTO `sys_log_login` VALUES ('102', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 23:49:17');
INSERT INTO `sys_log_login` VALUES ('103', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-26 23:58:15');
INSERT INTO `sys_log_login` VALUES ('104', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 00:00:53');
INSERT INTO `sys_log_login` VALUES ('105', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 00:05:54');
INSERT INTO `sys_log_login` VALUES ('106', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 19:35:12');
INSERT INTO `sys_log_login` VALUES ('107', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 19:47:38');
INSERT INTO `sys_log_login` VALUES ('108', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 19:48:01');
INSERT INTO `sys_log_login` VALUES ('109', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 21:34:56');
INSERT INTO `sys_log_login` VALUES ('110', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 21:43:32');
INSERT INTO `sys_log_login` VALUES ('111', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 21:46:37');
INSERT INTO `sys_log_login` VALUES ('112', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 21:49:17');
INSERT INTO `sys_log_login` VALUES ('113', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 21:49:48');
INSERT INTO `sys_log_login` VALUES ('114', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 21:52:06');
INSERT INTO `sys_log_login` VALUES ('115', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 21:54:19');
INSERT INTO `sys_log_login` VALUES ('116', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 21:54:55');
INSERT INTO `sys_log_login` VALUES ('117', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:26:12');
INSERT INTO `sys_log_login` VALUES ('118', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:27:25');
INSERT INTO `sys_log_login` VALUES ('119', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:29:10');
INSERT INTO `sys_log_login` VALUES ('120', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:30:19');
INSERT INTO `sys_log_login` VALUES ('121', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:32:32');
INSERT INTO `sys_log_login` VALUES ('122', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:33:23');
INSERT INTO `sys_log_login` VALUES ('123', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:34:26');
INSERT INTO `sys_log_login` VALUES ('124', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:35:00');
INSERT INTO `sys_log_login` VALUES ('125', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:36:41');
INSERT INTO `sys_log_login` VALUES ('126', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:38:00');
INSERT INTO `sys_log_login` VALUES ('127', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:56:01');
INSERT INTO `sys_log_login` VALUES ('128', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 22:59:22');
INSERT INTO `sys_log_login` VALUES ('129', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 23:17:56');
INSERT INTO `sys_log_login` VALUES ('130', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-27 23:48:29');
INSERT INTO `sys_log_login` VALUES ('131', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 00:04:10');
INSERT INTO `sys_log_login` VALUES ('132', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 00:05:39');
INSERT INTO `sys_log_login` VALUES ('133', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 00:06:00');
INSERT INTO `sys_log_login` VALUES ('134', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 00:08:37');
INSERT INTO `sys_log_login` VALUES ('135', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 20:16:48');
INSERT INTO `sys_log_login` VALUES ('136', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 20:17:57');
INSERT INTO `sys_log_login` VALUES ('137', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 20:21:39');
INSERT INTO `sys_log_login` VALUES ('138', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 20:47:09');
INSERT INTO `sys_log_login` VALUES ('139', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 20:50:54');
INSERT INTO `sys_log_login` VALUES ('140', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 20:52:20');
INSERT INTO `sys_log_login` VALUES ('141', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 20:55:09');
INSERT INTO `sys_log_login` VALUES ('142', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 20:56:32');
INSERT INTO `sys_log_login` VALUES ('143', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 20:57:21');
INSERT INTO `sys_log_login` VALUES ('144', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 21:17:06');
INSERT INTO `sys_log_login` VALUES ('145', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 21:19:58');
INSERT INTO `sys_log_login` VALUES ('146', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 22:18:20');
INSERT INTO `sys_log_login` VALUES ('147', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 22:20:07');
INSERT INTO `sys_log_login` VALUES ('148', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 22:20:58');
INSERT INTO `sys_log_login` VALUES ('149', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 22:21:24');
INSERT INTO `sys_log_login` VALUES ('150', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 22:22:15');
INSERT INTO `sys_log_login` VALUES ('151', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 22:26:29');
INSERT INTO `sys_log_login` VALUES ('152', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-28 23:07:44');
INSERT INTO `sys_log_login` VALUES ('153', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 00:18:06');
INSERT INTO `sys_log_login` VALUES ('154', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 00:18:27');
INSERT INTO `sys_log_login` VALUES ('155', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 00:19:01');
INSERT INTO `sys_log_login` VALUES ('156', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 00:20:01');
INSERT INTO `sys_log_login` VALUES ('157', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 00:22:22');
INSERT INTO `sys_log_login` VALUES ('158', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 00:25:13');
INSERT INTO `sys_log_login` VALUES ('159', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 15:23:57');
INSERT INTO `sys_log_login` VALUES ('160', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 16:07:56');
INSERT INTO `sys_log_login` VALUES ('161', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 16:09:10');
INSERT INTO `sys_log_login` VALUES ('162', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 16:17:37');
INSERT INTO `sys_log_login` VALUES ('163', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 16:18:27');
INSERT INTO `sys_log_login` VALUES ('164', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 16:20:23');
INSERT INTO `sys_log_login` VALUES ('165', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 16:20:38');
INSERT INTO `sys_log_login` VALUES ('166', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 16:52:36');
INSERT INTO `sys_log_login` VALUES ('167', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 16:54:43');
INSERT INTO `sys_log_login` VALUES ('168', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 19:21:03');
INSERT INTO `sys_log_login` VALUES ('169', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 19:31:37');
INSERT INTO `sys_log_login` VALUES ('170', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 20:11:03');
INSERT INTO `sys_log_login` VALUES ('171', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 20:12:51');
INSERT INTO `sys_log_login` VALUES ('172', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 20:15:19');
INSERT INTO `sys_log_login` VALUES ('173', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 20:46:50');
INSERT INTO `sys_log_login` VALUES ('174', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 23:12:44');
INSERT INTO `sys_log_login` VALUES ('175', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 23:15:31');
INSERT INTO `sys_log_login` VALUES ('176', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 23:18:09');
INSERT INTO `sys_log_login` VALUES ('177', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 23:25:07');
INSERT INTO `sys_log_login` VALUES ('178', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 23:26:19');
INSERT INTO `sys_log_login` VALUES ('179', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 23:33:14');
INSERT INTO `sys_log_login` VALUES ('180', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-29 23:35:40');
INSERT INTO `sys_log_login` VALUES ('181', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 16:39:54');
INSERT INTO `sys_log_login` VALUES ('182', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:18:22');
INSERT INTO `sys_log_login` VALUES ('183', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:20:49');
INSERT INTO `sys_log_login` VALUES ('184', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:22:11');
INSERT INTO `sys_log_login` VALUES ('185', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:23:18');
INSERT INTO `sys_log_login` VALUES ('186', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:24:14');
INSERT INTO `sys_log_login` VALUES ('187', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:25:32');
INSERT INTO `sys_log_login` VALUES ('188', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:27:52');
INSERT INTO `sys_log_login` VALUES ('189', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:30:47');
INSERT INTO `sys_log_login` VALUES ('190', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:40:18');
INSERT INTO `sys_log_login` VALUES ('191', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:44:48');
INSERT INTO `sys_log_login` VALUES ('192', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:45:39');
INSERT INTO `sys_log_login` VALUES ('193', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 19:46:15');
INSERT INTO `sys_log_login` VALUES ('194', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 20:06:08');
INSERT INTO `sys_log_login` VALUES ('195', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 21:01:38');
INSERT INTO `sys_log_login` VALUES ('196', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 21:02:48');
INSERT INTO `sys_log_login` VALUES ('197', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 21:06:31');
INSERT INTO `sys_log_login` VALUES ('198', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 21:07:24');
INSERT INTO `sys_log_login` VALUES ('199', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 21:10:13');
INSERT INTO `sys_log_login` VALUES ('200', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 21:12:12');
INSERT INTO `sys_log_login` VALUES ('201', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 21:13:13');
INSERT INTO `sys_log_login` VALUES ('202', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 21:15:14');
INSERT INTO `sys_log_login` VALUES ('203', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 21:16:07');
INSERT INTO `sys_log_login` VALUES ('204', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 21:55:25');
INSERT INTO `sys_log_login` VALUES ('205', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 23:36:06');
INSERT INTO `sys_log_login` VALUES ('206', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 23:37:13');
INSERT INTO `sys_log_login` VALUES ('207', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 23:44:49');
INSERT INTO `sys_log_login` VALUES ('208', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 23:48:10');
INSERT INTO `sys_log_login` VALUES ('209', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 23:52:00');
INSERT INTO `sys_log_login` VALUES ('210', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 23:52:51');
INSERT INTO `sys_log_login` VALUES ('211', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 23:53:27');
INSERT INTO `sys_log_login` VALUES ('212', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-04-30 23:57:30');
INSERT INTO `sys_log_login` VALUES ('213', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-01 00:26:36');
INSERT INTO `sys_log_login` VALUES ('214', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-01 21:07:39');
INSERT INTO `sys_log_login` VALUES ('215', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-01 21:11:50');
INSERT INTO `sys_log_login` VALUES ('216', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-01 21:14:46');
INSERT INTO `sys_log_login` VALUES ('217', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-01 21:29:18');
INSERT INTO `sys_log_login` VALUES ('218', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 15:15:25');
INSERT INTO `sys_log_login` VALUES ('219', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 15:16:52');
INSERT INTO `sys_log_login` VALUES ('220', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 15:17:38');
INSERT INTO `sys_log_login` VALUES ('221', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 15:21:21');
INSERT INTO `sys_log_login` VALUES ('222', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 15:23:43');
INSERT INTO `sys_log_login` VALUES ('223', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 15:25:31');
INSERT INTO `sys_log_login` VALUES ('224', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 15:26:00');
INSERT INTO `sys_log_login` VALUES ('225', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 15:26:22');
INSERT INTO `sys_log_login` VALUES ('226', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 15:30:12');
INSERT INTO `sys_log_login` VALUES ('227', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 15:35:57');
INSERT INTO `sys_log_login` VALUES ('228', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 15:59:04');
INSERT INTO `sys_log_login` VALUES ('229', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 16:02:24');
INSERT INTO `sys_log_login` VALUES ('230', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 16:15:15');
INSERT INTO `sys_log_login` VALUES ('231', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 16:16:41');
INSERT INTO `sys_log_login` VALUES ('232', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 16:21:52');
INSERT INTO `sys_log_login` VALUES ('233', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 16:23:13');
INSERT INTO `sys_log_login` VALUES ('234', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 16:24:14');
INSERT INTO `sys_log_login` VALUES ('235', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 16:27:30');
INSERT INTO `sys_log_login` VALUES ('236', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 16:45:53');
INSERT INTO `sys_log_login` VALUES ('237', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 16:55:31');
INSERT INTO `sys_log_login` VALUES ('238', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 17:07:58');
INSERT INTO `sys_log_login` VALUES ('239', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 18:55:47');
INSERT INTO `sys_log_login` VALUES ('240', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 19:04:15');
INSERT INTO `sys_log_login` VALUES ('241', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 19:05:57');
INSERT INTO `sys_log_login` VALUES ('242', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 19:06:40');
INSERT INTO `sys_log_login` VALUES ('243', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 19:17:38');
INSERT INTO `sys_log_login` VALUES ('244', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 19:18:46');
INSERT INTO `sys_log_login` VALUES ('245', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 20:23:20');
INSERT INTO `sys_log_login` VALUES ('246', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 20:24:21');
INSERT INTO `sys_log_login` VALUES ('247', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 20:48:07');
INSERT INTO `sys_log_login` VALUES ('248', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 20:50:51');
INSERT INTO `sys_log_login` VALUES ('249', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 21:16:40');
INSERT INTO `sys_log_login` VALUES ('250', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 21:19:22');
INSERT INTO `sys_log_login` VALUES ('251', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 21:21:06');
INSERT INTO `sys_log_login` VALUES ('252', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 21:32:39');
INSERT INTO `sys_log_login` VALUES ('253', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 21:33:07');
INSERT INTO `sys_log_login` VALUES ('254', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 21:33:27');
INSERT INTO `sys_log_login` VALUES ('255', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 21:45:59');
INSERT INTO `sys_log_login` VALUES ('256', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 21:56:39');
INSERT INTO `sys_log_login` VALUES ('257', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 21:57:52');
INSERT INTO `sys_log_login` VALUES ('258', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 21:58:11');
INSERT INTO `sys_log_login` VALUES ('259', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 22:02:51');
INSERT INTO `sys_log_login` VALUES ('260', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 22:06:31');
INSERT INTO `sys_log_login` VALUES ('261', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 22:08:44');
INSERT INTO `sys_log_login` VALUES ('262', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 22:19:45');
INSERT INTO `sys_log_login` VALUES ('263', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 22:28:55');
INSERT INTO `sys_log_login` VALUES ('264', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 22:32:00');
INSERT INTO `sys_log_login` VALUES ('265', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 22:35:24');
INSERT INTO `sys_log_login` VALUES ('266', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 23:11:21');
INSERT INTO `sys_log_login` VALUES ('267', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 23:40:24');
INSERT INTO `sys_log_login` VALUES ('268', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 23:42:27');
INSERT INTO `sys_log_login` VALUES ('269', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-02 23:43:38');
INSERT INTO `sys_log_login` VALUES ('270', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 00:16:44');
INSERT INTO `sys_log_login` VALUES ('271', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 00:17:48');
INSERT INTO `sys_log_login` VALUES ('272', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 00:24:13');
INSERT INTO `sys_log_login` VALUES ('273', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 00:25:07');
INSERT INTO `sys_log_login` VALUES ('274', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 00:26:15');
INSERT INTO `sys_log_login` VALUES ('275', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 00:27:03');
INSERT INTO `sys_log_login` VALUES ('276', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 00:32:10');
INSERT INTO `sys_log_login` VALUES ('277', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 00:35:40');
INSERT INTO `sys_log_login` VALUES ('278', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 00:42:52');
INSERT INTO `sys_log_login` VALUES ('279', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 00:44:57');
INSERT INTO `sys_log_login` VALUES ('280', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 00:46:56');
INSERT INTO `sys_log_login` VALUES ('281', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 15:52:20');
INSERT INTO `sys_log_login` VALUES ('282', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 15:59:45');
INSERT INTO `sys_log_login` VALUES ('283', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 16:02:03');
INSERT INTO `sys_log_login` VALUES ('284', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 16:16:44');
INSERT INTO `sys_log_login` VALUES ('285', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 16:17:27');
INSERT INTO `sys_log_login` VALUES ('286', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 19:01:13');
INSERT INTO `sys_log_login` VALUES ('287', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 19:02:29');
INSERT INTO `sys_log_login` VALUES ('288', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 19:38:22');
INSERT INTO `sys_log_login` VALUES ('289', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 19:39:09');
INSERT INTO `sys_log_login` VALUES ('290', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 19:42:52');
INSERT INTO `sys_log_login` VALUES ('291', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 19:44:13');
INSERT INTO `sys_log_login` VALUES ('292', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 19:44:49');
INSERT INTO `sys_log_login` VALUES ('293', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 19:58:19');
INSERT INTO `sys_log_login` VALUES ('294', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 20:05:30');
INSERT INTO `sys_log_login` VALUES ('295', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 20:06:46');
INSERT INTO `sys_log_login` VALUES ('296', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 20:09:32');
INSERT INTO `sys_log_login` VALUES ('297', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 20:17:59');
INSERT INTO `sys_log_login` VALUES ('298', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 20:20:47');
INSERT INTO `sys_log_login` VALUES ('299', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 20:21:41');
INSERT INTO `sys_log_login` VALUES ('300', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 20:22:06');
INSERT INTO `sys_log_login` VALUES ('301', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 20:22:23');
INSERT INTO `sys_log_login` VALUES ('302', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 20:22:39');
INSERT INTO `sys_log_login` VALUES ('303', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 23:55:36');
INSERT INTO `sys_log_login` VALUES ('304', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-03 23:57:05');
INSERT INTO `sys_log_login` VALUES ('305', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 00:38:44');
INSERT INTO `sys_log_login` VALUES ('306', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 00:44:50');
INSERT INTO `sys_log_login` VALUES ('307', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 00:48:01');
INSERT INTO `sys_log_login` VALUES ('308', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 00:53:29');
INSERT INTO `sys_log_login` VALUES ('309', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:00:41');
INSERT INTO `sys_log_login` VALUES ('310', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:01:33');
INSERT INTO `sys_log_login` VALUES ('311', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:02:29');
INSERT INTO `sys_log_login` VALUES ('312', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:28:13');
INSERT INTO `sys_log_login` VALUES ('313', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:30:30');
INSERT INTO `sys_log_login` VALUES ('314', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:40:45');
INSERT INTO `sys_log_login` VALUES ('315', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:51:13');
INSERT INTO `sys_log_login` VALUES ('316', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:52:00');
INSERT INTO `sys_log_login` VALUES ('317', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:52:50');
INSERT INTO `sys_log_login` VALUES ('318', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:53:20');
INSERT INTO `sys_log_login` VALUES ('319', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:53:54');
INSERT INTO `sys_log_login` VALUES ('320', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:54:38');
INSERT INTO `sys_log_login` VALUES ('321', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 15:59:55');
INSERT INTO `sys_log_login` VALUES ('322', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 16:00:06');
INSERT INTO `sys_log_login` VALUES ('323', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 16:00:17');
INSERT INTO `sys_log_login` VALUES ('324', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 16:01:18');
INSERT INTO `sys_log_login` VALUES ('325', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 16:02:33');
INSERT INTO `sys_log_login` VALUES ('326', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 16:11:29');
INSERT INTO `sys_log_login` VALUES ('327', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 16:11:43');
INSERT INTO `sys_log_login` VALUES ('328', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 16:13:52');
INSERT INTO `sys_log_login` VALUES ('329', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 16:17:43');
INSERT INTO `sys_log_login` VALUES ('330', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 16:19:38');
INSERT INTO `sys_log_login` VALUES ('331', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 19:02:22');
INSERT INTO `sys_log_login` VALUES ('332', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 19:28:47');
INSERT INTO `sys_log_login` VALUES ('333', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 19:30:23');
INSERT INTO `sys_log_login` VALUES ('334', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 19:40:22');
INSERT INTO `sys_log_login` VALUES ('335', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-04 19:52:56');
INSERT INTO `sys_log_login` VALUES ('336', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-05 22:58:08');
INSERT INTO `sys_log_login` VALUES ('337', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-05 22:59:48');
INSERT INTO `sys_log_login` VALUES ('338', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-05 23:04:05');
INSERT INTO `sys_log_login` VALUES ('339', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-05 23:19:29');
INSERT INTO `sys_log_login` VALUES ('340', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-05 23:21:13');
INSERT INTO `sys_log_login` VALUES ('341', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-05 23:43:10');
INSERT INTO `sys_log_login` VALUES ('342', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-06 20:08:22');
INSERT INTO `sys_log_login` VALUES ('343', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-06 20:09:39');
INSERT INTO `sys_log_login` VALUES ('344', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-06 20:10:35');
INSERT INTO `sys_log_login` VALUES ('345', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-06 21:33:08');
INSERT INTO `sys_log_login` VALUES ('346', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-06 22:46:41');
INSERT INTO `sys_log_login` VALUES ('347', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-06 22:55:40');
INSERT INTO `sys_log_login` VALUES ('348', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-07 00:17:22');
INSERT INTO `sys_log_login` VALUES ('349', '超级管理员-admin', '0:0:0:0:0:0:0:1', '2020-05-07 00:32:22');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `spread` int(255) DEFAULT NULL COMMENT '0不展开1展开',
  `target` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `available` int(255) DEFAULT NULL COMMENT '0不可用1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '汽车出租系统', null, '1', null, '&#xe68e;', '1');
INSERT INTO `sys_menu` VALUES ('2', '1', '基础管理', '', '0', '', '&#xe653;', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '业务管理', '', '0', '', '&#xe663;', '1');
INSERT INTO `sys_menu` VALUES ('4', '1', '系统管理', '', '0', '', '&#xe716;', '1');
INSERT INTO `sys_menu` VALUES ('5', '1', '统计分析', '', '0', '', '&#xe629;', '1');
INSERT INTO `sys_menu` VALUES ('6', '2', '客户管理', '../bus/toCustomerManager', '0', '', '&#xe770;', '1');
INSERT INTO `sys_menu` VALUES ('7', '2', '车辆管理', '../bus/toCarManager', '0', '', '&#xe657;', '1');
INSERT INTO `sys_menu` VALUES ('8', '3', '汽车出租', '../bus/toCarRentalManager', '0', '', '&#xe65b;', '1');
INSERT INTO `sys_menu` VALUES ('9', '3', '出租单管理', '../bus/toRentManager', '0', '', '&#xe6b2;', '1');
INSERT INTO `sys_menu` VALUES ('10', '3', '汽车入库', '../bus/toCarStorageManager', '0', '', '&#xe65a;', '1');
INSERT INTO `sys_menu` VALUES ('11', '3', '检查单管理', '../bus/toCheckManager', '0', '', '&#xe705;', '1');
INSERT INTO `sys_menu` VALUES ('12', '4', '菜单管理', '../sys/toMenuManager', '0', null, '&#xe60f;', '1');
INSERT INTO `sys_menu` VALUES ('13', '4', '角色管理', '../sys/toRoleManager', '0', null, '&#xe66f;', '1');
INSERT INTO `sys_menu` VALUES ('14', '4', '用户管理', '../sys/toUserManager', '0', '', '&#xe770;', '1');
INSERT INTO `sys_menu` VALUES ('15', '4', '日志管理', '../sys/toLogManager', '0', '', '&#xe655;', '1');
INSERT INTO `sys_menu` VALUES ('16', '4', '公告管理', '../sys/toNewsManager', '0', '', '&#xe645;', '1');
INSERT INTO `sys_menu` VALUES ('17', '4', '数据源监控', '../druid/', '0', '', '&#xe857;', '1');
INSERT INTO `sys_menu` VALUES ('18', '5', '客户地区统计', '../stat/toCusAddressStat', '0', '', '&#xe63c;', '1');
INSERT INTO `sys_menu` VALUES ('19', '5', '公司年度月份销售额', '../stat/toCompanyPricesToYearMonthStat', '0', '', '&#xe62c;', '1');
INSERT INTO `sys_menu` VALUES ('20', '5', '业务员年度销售额', '../stat/toOperNamePricesToYearStat', '0', '', '&#xe62d;', '1');

-- ----------------------------
-- Table structure for `sys_news`
-- ----------------------------
DROP TABLE IF EXISTS `sys_news`;
CREATE TABLE `sys_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(4000) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `operName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_news
-- ----------------------------
INSERT INTO `sys_news` VALUES ('1', '关于系统V1.3升级公告', '<p>12312312312312312312</p>', '2019-03-19 14:10:11', '超级管理员');
INSERT INTO `sys_news` VALUES ('2', '关于系统V1.4升级公告', '<p>312312312</p>', '2019-06-11 11:30:15', '超级管理员');
INSERT INTO `sys_news` VALUES ('20', '11111', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwww', '2020-04-25 23:42:32', '超级管理员');
INSERT INTO `sys_news` VALUES ('21', '3333', '<u style=\"\"><img src=\"http://localhost:8080/statics/layui/images/face/5.gif\" alt=\"[挖鼻]\" style=\"font-weight: bold; font-style: italic;\"><b><i>3333</i></b></u>', '2020-04-26 16:03:25', '超级管理员');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  `roleDesc` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '拥有所有菜单权限', '1');
INSERT INTO `sys_role` VALUES ('2', '业务管理员', '拥有所以业务菜单', '1');
INSERT INTO `sys_role` VALUES ('3', '系统管理员', '管理系统', '1');
INSERT INTO `sys_role` VALUES ('4', '数据统计管理员', '数据统计管理员', '1');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`rid`,`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '13');
INSERT INTO `sys_role_menu` VALUES ('3', '14');
INSERT INTO `sys_role_menu` VALUES ('3', '15');
INSERT INTO `sys_role_menu` VALUES ('3', '16');
INSERT INTO `sys_role_menu` VALUES ('3', '17');
INSERT INTO `sys_role_menu` VALUES ('4', '1');
INSERT INTO `sys_role_menu` VALUES ('4', '5');
INSERT INTO `sys_role_menu` VALUES ('4', '18');
INSERT INTO `sys_role_menu` VALUES ('4', '19');
INSERT INTO `sys_role_menu` VALUES ('4', '20');

-- ----------------------------
-- Table structure for `sys_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('12', '1');
INSERT INTO `sys_role_user` VALUES ('13', '2');
INSERT INTO `sys_role_user` VALUES ('14', '3');
INSERT INTO `sys_role_user` VALUES ('15', '4');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(255) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL COMMENT '身份证',
  `realName` varchar(255) DEFAULT NULL,
  `sex` int(255) DEFAULT NULL COMMENT '0女1男',
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `type` int(255) DEFAULT '2' COMMENT '1，超级管理员,2，系统用户',
  `available` int(255) DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '210305199611301819', '超级管理员', '1', '鞍山', '17345621352', 'e10adc3949ba59abbe56e057f20f883e', 'CEO', '1', '1');
INSERT INTO `sys_user` VALUES ('12', 'zs', '210304199812181616', '张山', '1', '鞍山', '17966645462', 'e10adc3949ba59abbe56e057f20f883e', '职员', '2', '1');
INSERT INTO `sys_user` VALUES ('13', 'ls', '210305199805121714', '李四', '1', '沈阳', '19676645489', 'e10adc3949ba59abbe56e057f20f883e', '业务管理员', '2', '1');
INSERT INTO `sys_user` VALUES ('14', 'ww', '210605199312141816', '王五', '0', '辽阳', '17698545476', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员', '2', '1');
INSERT INTO `sys_user` VALUES ('15', 'dn', '210306199412121816', '大拿', '0', '铁岭', '19645512458', 'e10adc3949ba59abbe56e057f20f883e', '数据统计员', '2', '1');
