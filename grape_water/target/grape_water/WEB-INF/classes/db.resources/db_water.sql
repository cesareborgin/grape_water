/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : db_water

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2020-06-18 14:50:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for alarmtype
-- ----------------------------
DROP TABLE IF EXISTS `alarmtype`;
CREATE TABLE `alarmtype` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `uid` int(2) unsigned NOT NULL,
  `alarmId` int(11) DEFAULT NULL,
  `alarmStr` varchar(55) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of alarmtype
-- ----------------------------
INSERT INTO `alarmtype` VALUES ('1', '0', '1', '告警（A级）');
INSERT INTO `alarmtype` VALUES ('2', '0', '2', '告警（B级）');
INSERT INTO `alarmtype` VALUES ('3', '0', '3', '告警（C级）');
INSERT INTO `alarmtype` VALUES ('4', '0', '4', '告警（D级）');
INSERT INTO `alarmtype` VALUES ('5', '1', '5', '预警（A级）');
INSERT INTO `alarmtype` VALUES ('6', '1', '6', '预警（B级）');
INSERT INTO `alarmtype` VALUES ('7', '1', '7', '预警（C级）');
INSERT INTO `alarmtype` VALUES ('8', '1', '8', '预警（D级）');
INSERT INTO `alarmtype` VALUES ('9', '1', '9', '预警（E级）');

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enLocal` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `enCode` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', '一处染纱', '010101');
INSERT INTO `area` VALUES ('2', '一处染布', '010102');
INSERT INTO `area` VALUES ('3', '二处染纱', '010103');
INSERT INTO `area` VALUES ('4', '二处染布', '010104');
INSERT INTO `area` VALUES ('5', '成检窄幅', '010105');
INSERT INTO `area` VALUES ('6', '长纤染整', '010106');
INSERT INTO `area` VALUES ('7', '短纤染整', '010107');
INSERT INTO `area` VALUES ('8', '多联机组装', '010108');
INSERT INTO `area` VALUES ('9', '主机制造', '010109');
INSERT INTO `area` VALUES ('10', '1#2#低压配电房', '021000');
INSERT INTO `area` VALUES ('11', '污水平台LOP28电气柜', '021001');
INSERT INTO `area` VALUES ('12', '原水值班室', '021002');
INSERT INTO `area` VALUES ('13', '8#低压配电房', '021003');
INSERT INTO `area` VALUES ('14', '3#4#低压配电房', '021004');
INSERT INTO `area` VALUES ('15', '7#低压配电房', '021005');
INSERT INTO `area` VALUES ('16', '染布车间', '0101010');
INSERT INTO `area` VALUES ('17', '福发车间', '0101011');
INSERT INTO `area` VALUES ('18', '办公大楼', '0101012');
INSERT INTO `area` VALUES ('19', '男生宿舍用水', 'N-S-B-05');
INSERT INTO `area` VALUES ('20', '女生宿舍餐厅台舍', 'N-S-B-06');
INSERT INTO `area` VALUES ('21', '休闲中心总用电量 	', 'N-D-E-01');
INSERT INTO `area` VALUES ('22', '西宽幅喷水织机', 'N-D-C-69');
INSERT INTO `area` VALUES ('23', '三处织布废水池', 'N-FS-A-01');
INSERT INTO `area` VALUES ('24', '污水综合抽水井（#1#2泵）', 'N-FS-A-15');
INSERT INTO `area` VALUES ('25', '准备4#浆纱机', '1-PK02');
INSERT INTO `area` VALUES ('26', '准备1#浆纱机', '1-PK23');
INSERT INTO `area` VALUES ('27', '准备2#浆纱机', '1-PK22');

-- ----------------------------
-- Table structure for caution
-- ----------------------------
DROP TABLE IF EXISTS `caution`;
CREATE TABLE `caution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `objName` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `targetType` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `alarmLevel` int(8) unsigned DEFAULT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `durationTime` double(8,2) DEFAULT NULL,
  `status` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of caution
-- ----------------------------
INSERT INTO `caution` VALUES ('1', '泵CA001', '传输效率', '4', '2020-05-29 00:00:00', '3.20', '2');
INSERT INTO `caution` VALUES ('2', '智杰电动机2号', '实际电压', '2', '2020-05-29 00:00:00', '4.00', '2');

-- ----------------------------
-- Table structure for coltors
-- ----------------------------
DROP TABLE IF EXISTS `coltors`;
CREATE TABLE `coltors` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `coltorName` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `coltorType` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '型号',
  `sysNumber` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '系统编号',
  `code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '编码',
  `installtionName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '安装位置名称',
  `installtionCode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '安装位置编号',
  `testobjName` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '检测对象名称',
  `serialPort` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '串口号',
  `tableAdrr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '表地址',
  `status` int(11) DEFAULT NULL COMMENT '连接状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of coltors
-- ----------------------------
INSERT INTO `coltors` VALUES ('19', ' 1#变采集器', '4GWf4R', 'Y21E4C0717102201', '330104170101', '二处染布', '010104', '三处织布废水产生量', '1', '1', '1');
INSERT INTO `coltors` VALUES ('20', '污水平台LOP28采集器', '4GWf5R', 'Y21E4C0717102204', '330104170110', '染布车间', '0101010', '三处织布废水产生量', '1', '1', '0');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `departName` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `energyCode` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `managerName` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '公用处', '330104170101', '李智杰');
INSERT INTO `department` VALUES ('2', '生产1处', '330104170102', '李智杰');
INSERT INTO `department` VALUES ('3', '生产2处', '330104170103', '李智杰');
INSERT INTO `department` VALUES ('4', '质检部A区', '230104170104', '李智杰');
INSERT INTO `department` VALUES ('5', '质检部B区', '230104170101', '李智杰');
INSERT INTO `department` VALUES ('6', '生产管理I处', '930104170101', '李智杰');
INSERT INTO `department` VALUES ('7', '生产管理II处', '930104170122', '李智杰');
INSERT INTO `department` VALUES ('8', '物资Q部', 'E30104170101', '李智杰');
INSERT INTO `department` VALUES ('9', '技术中心A组', 'Y30104170102', '李智杰');
INSERT INTO `department` VALUES ('10', '技术中心B组', 'Y30104170101', '李智杰');
INSERT INTO `department` VALUES ('11', '保运A组', 'G0104170101', '李智杰');
INSERT INTO `department` VALUES ('12', '保运B组', 'G0104170103', '李智杰');
INSERT INTO `department` VALUES ('13', '工艺I处', 'G0204170103', '李智杰');
INSERT INTO `department` VALUES ('14', '工艺II处', 'G0204170106', '李智杰');

-- ----------------------------
-- Table structure for energy
-- ----------------------------
DROP TABLE IF EXISTS `energy`;
CREATE TABLE `energy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `energyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `energyLocal` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `energyCode` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `energyElec` double(10,2) unsigned DEFAULT NULL,
  `energyPay` double(10,2) unsigned DEFAULT NULL,
  `energyCoal` double(10,2) unsigned DEFAULT NULL,
  `energyCO2` double(10,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of energy
-- ----------------------------
INSERT INTO `energy` VALUES ('18', '2020-05-01 00:00:00', '一处染纱', '330104170101', '28920.40', '28920.40', '28920.40', '28920.40');
INSERT INTO `energy` VALUES ('19', '2020-05-02 00:00:00', '一处染纱', '330104170102', '29920.40', '29920.40', '29920.40', '29920.40');
INSERT INTO `energy` VALUES ('20', '2020-05-03 00:00:00', '一处染纱', '330104170103', '30000.40', '29920.40', '29920.40', '29920.40');
INSERT INTO `energy` VALUES ('21', '2020-05-04 00:00:00', '一处染纱', '330104170101', '31000.40', '31000.40', '31000.40', '31000.40');
INSERT INTO `energy` VALUES ('22', '2020-05-05 00:00:00', '一处染纱', '930104170101', '31100.40', '31100.40', '31100.40', '31100.40');

-- ----------------------------
-- Table structure for entity
-- ----------------------------
DROP TABLE IF EXISTS `entity`;
CREATE TABLE `entity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entityId` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `customerName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `entityName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `entityType` int(11) DEFAULT NULL,
  `entityTypeStr` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of entity
-- ----------------------------
INSERT INTO `entity` VALUES ('5', 'A1001', '老王', '准备1#浆纱机', '1', '生产设备');
INSERT INTO `entity` VALUES ('6', 'A1002', '老王', '准备4#浆纱机', '1', '生产设备');
INSERT INTO `entity` VALUES ('7', 'A1003', '老王', '污水左柜主电源', '1', '生产设备');
INSERT INTO `entity` VALUES ('8', 'A1004', '老王', '3#热媒锅炉', '1', '生产设备');
INSERT INTO `entity` VALUES ('9', 'E1001', '姥姥', '三处织布废水产生量', '2', '生产记录');
INSERT INTO `entity` VALUES ('10', 'A2001', '叶俊慧', '三相电机E2', '1', '生产设备');
INSERT INTO `entity` VALUES ('11', 'A2004', '叶俊慧', 'AY型单、双级离心油泵', '2', '生产设备');
INSERT INTO `entity` VALUES ('12', 'A2973', '叶俊慧', 'D、DG型多级离心泵', '1', '生产设备');
INSERT INTO `entity` VALUES ('13', 'E1002', '叶俊慧', '行政楼用水量', '2', '生产用料');
INSERT INTO `entity` VALUES ('14', 'E1003', '叶俊慧', '一处空调用水', '2', '生产消耗');
INSERT INTO `entity` VALUES ('15', 'E1004', '叶俊慧', '二处准备用水', '2', '生产消耗');
INSERT INTO `entity` VALUES ('16', 'E1005', '金银花', '二处短纤冷染机用水', '2', '生产消耗');
INSERT INTO `entity` VALUES ('17', 'E1089', '叶俊慧', '二处温水回收量', '2', '生产消耗');
INSERT INTO `entity` VALUES ('18', 'ELC-2001', '叶俊慧', '二处温水回到软水池量', '2', '生产消耗');
INSERT INTO `entity` VALUES ('19', 'ELC-2002', '叶俊慧', '短纤冷染机用电量', '2', '生产消耗');

-- ----------------------------
-- Table structure for entity_parameters
-- ----------------------------
DROP TABLE IF EXISTS `entity_parameters`;
CREATE TABLE `entity_parameters` (
  `entityId` int(11) unsigned NOT NULL,
  `parameterId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`entityId`,`parameterId`),
  KEY `parameterId` (`parameterId`),
  CONSTRAINT `entity_parameters_ibfk_1` FOREIGN KEY (`entityId`) REFERENCES `entity` (`id`),
  CONSTRAINT `entity_parameters_ibfk_2` FOREIGN KEY (`parameterId`) REFERENCES `parameters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of entity_parameters
-- ----------------------------
INSERT INTO `entity_parameters` VALUES ('5', '1');
INSERT INTO `entity_parameters` VALUES ('6', '1');
INSERT INTO `entity_parameters` VALUES ('5', '2');
INSERT INTO `entity_parameters` VALUES ('6', '2');
INSERT INTO `entity_parameters` VALUES ('5', '3');
INSERT INTO `entity_parameters` VALUES ('6', '3');
INSERT INTO `entity_parameters` VALUES ('5', '4');
INSERT INTO `entity_parameters` VALUES ('6', '4');
INSERT INTO `entity_parameters` VALUES ('5', '5');
INSERT INTO `entity_parameters` VALUES ('6', '5');
INSERT INTO `entity_parameters` VALUES ('5', '6');
INSERT INTO `entity_parameters` VALUES ('5', '7');

-- ----------------------------
-- Table structure for meters
-- ----------------------------
DROP TABLE IF EXISTS `meters`;
CREATE TABLE `meters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelCode` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `productName` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `meterName` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `meterType` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `measureAccuracy` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `caliber` double(8,2) DEFAULT NULL,
  `protector` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `specification` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `coumMethod` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `location` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `locationCode` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of meters
-- ----------------------------
INSERT INTO `meters` VALUES ('1', 'A676543525881516032', '杭州工考仪表有限公司', '智能电磁流量计', 'MNE96-E54', '管道式:±0.5级', '100.04', 'ExdIIBT4', 'GFM', 'RS-485/4-20ma', '准备4#浆纱机', '1-PK00', '1');
INSERT INTO `meters` VALUES ('2', 'A676543526091231232', '杭州蓝剑机电设备公司', '智能电磁流量计', 'MNE96-M51', '管道式:±0.5级', '206.42', 'ExdIIBT4', 'MNE', 'RS-485/4-20ma', '准备4#浆纱机', '1-PK00', '1');
INSERT INTO `meters` VALUES ('3', 'A676543526615519232', '江苏奥科仪表有限公司', '涡轮流量计', 'MNE96-W96', '管道式:±0.5级', '100.02', 'ExdIIBT4', 'MNE', 'RS-485/4-20ma', '准备4#浆纱机', '1-PK00', '1');

-- ----------------------------
-- Table structure for motors
-- ----------------------------
DROP TABLE IF EXISTS `motors`;
CREATE TABLE `motors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelCode` varchar(32) COLLATE utf8_bin NOT NULL,
  `testTime` timestamp NULL DEFAULT NULL,
  `inName` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `location` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `voltage` double(8,2) DEFAULT NULL,
  `electricity` double(8,2) DEFAULT NULL,
  `inputPower` double(8,2) DEFAULT NULL,
  `outputPower` double(8,2) DEFAULT NULL,
  `operateEfficiency` double(8,2) DEFAULT NULL,
  `energyUnit` double(8,2) DEFAULT NULL,
  `energyUsed` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`modelCode`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of motors
-- ----------------------------

-- ----------------------------
-- Table structure for networks
-- ----------------------------
DROP TABLE IF EXISTS `networks`;
CREATE TABLE `networks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `objName` varchar(55) COLLATE utf8_bin DEFAULT NULL,
  `parameters` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `photo` varchar(55) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of networks
-- ----------------------------
INSERT INTO `networks` VALUES ('1', '准备1#浆纱机', 'B相电压,A相电流,反向累积流量,瞬时流量,流速', 'http://localhost:8081/upload/20200617_14561485.png', 'dada', '2020-06-17 14:56:19');

-- ----------------------------
-- Table structure for num
-- ----------------------------
DROP TABLE IF EXISTS `num`;
CREATE TABLE `num` (
  `i` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of num
-- ----------------------------
INSERT INTO `num` VALUES ('0');
INSERT INTO `num` VALUES ('1');
INSERT INTO `num` VALUES ('2');
INSERT INTO `num` VALUES ('3');
INSERT INTO `num` VALUES ('4');
INSERT INTO `num` VALUES ('5');
INSERT INTO `num` VALUES ('6');
INSERT INTO `num` VALUES ('7');
INSERT INTO `num` VALUES ('8');
INSERT INTO `num` VALUES ('9');

-- ----------------------------
-- Table structure for parameters
-- ----------------------------
DROP TABLE IF EXISTS `parameters`;
CREATE TABLE `parameters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parameterId` varchar(55) COLLATE utf8_bin DEFAULT NULL,
  `parameterName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `parameterType` int(11) DEFAULT NULL,
  `unit` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `precision` double(8,2) DEFAULT NULL,
  `tag` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of parameters
-- ----------------------------
INSERT INTO `parameters` VALUES ('1', 'BE-1002', 'A相电压', '1', 'V', '0.01', '标签A');
INSERT INTO `parameters` VALUES ('2', 'BE-1001', 'B相电压', '1', 'V', '0.01', '标签A');
INSERT INTO `parameters` VALUES ('3', 'BE-1003', 'A相电流', '1', 'A', '0.01', '标签2');
INSERT INTO `parameters` VALUES ('4', 'EV-1001', '反向累积流量', '1', 'm³/s', '0.11', '标签1');
INSERT INTO `parameters` VALUES ('5', 'EV-1002', '瞬时流量', '1', 'm³/s', '0.12', '标签2');
INSERT INTO `parameters` VALUES ('6', 'EV-1003', '流速', '1', 'm/s', '0.37', '标签1');
INSERT INTO `parameters` VALUES ('7', 'EV-1004', '总累积流量', '1', 'm³/s', '0.12', '标签1');
INSERT INTO `parameters` VALUES ('8', 'EV-1005', '正向累积流量', '1', 'm³/s', '0.14', '标签1');
INSERT INTO `parameters` VALUES ('9', 'TSI-1011', '工况总累积量', '5', '就工程具体情况而定', '0.24', '标签8');
INSERT INTO `parameters` VALUES ('10', 'BV-1001', '反向有功电能', '2', 'kw.h', '0.50', '标签3');
INSERT INTO `parameters` VALUES ('11', 'BE-1004', 'A相视载功率', '1', 'w', '0.12', '标签E');
INSERT INTO `parameters` VALUES ('12', 'TEP-3002', '温度', '7', '℃', '0.01', '标签T');
INSERT INTO `parameters` VALUES ('13', 'EP-ITR05', '频率', '4', 'HZ', '0.01', '标签P');
INSERT INTO `parameters` VALUES ('14', 'EN-PW02', '正向有功电能', '4', 'kw.h', '0.01', '标签PW');
INSERT INTO `parameters` VALUES ('15', 'PR-SR02', '压力', '7', 'N', '0.11', '标签PR');
INSERT INTO `parameters` VALUES ('16', 'EVRTY-02', '吨', '1', 't', '0.01', '标签1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `permissionName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1001', '查询所有用户信息', 'http://localhost:8081/user/findAll.do');
INSERT INTO `permission` VALUES ('1002', '用户密码初始', 'http://localhost:8081/user/fresetPw.do');
INSERT INTO `permission` VALUES ('1003', '进入首页', 'http://localhost:8081/firm/getIndex.do');
INSERT INTO `permission` VALUES ('1004', '系统简介', 'http://localhost:8081/firm/getPro.do');
INSERT INTO `permission` VALUES ('1005', '新增用户信息', 'http://localhost:8081/user/save.do');
INSERT INTO `permission` VALUES ('1006', '删除用户信息', 'http://localhost:8081/user/delete.do');
INSERT INTO `permission` VALUES ('1007', '给用户添加角色', 'http://localhost:8081/user/findUserByIdAndAllRole.do');
INSERT INTO `permission` VALUES ('1008', '用户详情', 'http://localhost:8081/user/findById.do');
INSERT INTO `permission` VALUES ('1009', '查询用户可添加的角色', 'http://localhost:8081/user/findUserByIdAndAllRole.do');
INSERT INTO `permission` VALUES ('1010', '用户信息模糊查询', 'http://localhost:8081/user/search.do');
INSERT INTO `permission` VALUES ('1011', '用户信息修改', 'http://localhost:8081/user/update.do');
INSERT INTO `permission` VALUES ('1012', '删除用户信息', 'http://localhost:8081/user/delete.do');

-- ----------------------------
-- Table structure for pumps
-- ----------------------------
DROP TABLE IF EXISTS `pumps`;
CREATE TABLE `pumps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inernalName` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `modelType` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `MTOP` double(8,2) DEFAULT NULL,
  `ROF` double(8,2) DEFAULT NULL,
  `electricity` double(8,2) DEFAULT NULL,
  `voltage` double(8,2) DEFAULT NULL,
  `efficiency` int(11) DEFAULT NULL,
  `shaft` double(8,2) DEFAULT NULL,
  `DGAT` int(11) DEFAULT NULL,
  `SGAT` int(11) DEFAULT NULL,
  `REV` int(9) DEFAULT NULL,
  `HODL` int(9) DEFAULT NULL,
  `LOFT` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pumps
-- ----------------------------

-- ----------------------------
-- Table structure for reporta
-- ----------------------------
DROP TABLE IF EXISTS `reporta`;
CREATE TABLE `reporta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitorfirstDate` timestamp NULL DEFAULT NULL,
  `monitorsecondDate` timestamp NULL DEFAULT NULL,
  `modelCode` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `inletPressure` double(8,2) DEFAULT NULL,
  `outletPressure` double(8,2) DEFAULT NULL,
  `temperature` double(8,2) DEFAULT NULL,
  `headDelivery` double(8,2) DEFAULT NULL,
  `rateFlow` double(8,2) DEFAULT NULL,
  `operateEfficiency` double(6,2) DEFAULT NULL,
  `transferEfficiency` double(6,2) DEFAULT NULL,
  `suctionHeight` double(6,2) DEFAULT NULL,
  `drainageHeight` double(6,2) DEFAULT NULL,
  `craftPressure` double(8,2) DEFAULT NULL,
  `backwaterPressure` double(8,2) NOT NULL,
  `potentialDifference` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of reporta
-- ----------------------------
INSERT INTO `reporta` VALUES ('1', '2020-04-26 22:55:00', '2020-05-05 04:20:00', 'CA001', '12.34', '1290.09', '34.10', '1023.00', '2130.98', '28.00', '17.45', '123.00', '234.00', '1234.32', '1234.24', '123.00');
INSERT INTO `reporta` VALUES ('2', '2019-10-27 16:40:00', '2019-10-27 15:40:00', 'CB003', '12.31', '345.03', '44.34', '234.00', '123.78', '23.00', '56.00', '34.00', '5.00', '1232.00', '3230.00', '123.00');
INSERT INTO `reporta` VALUES ('3', '2020-04-26 22:55:00', '2020-05-05 04:20:00', 'CA001', '12.34', '1290.09', '34.10', '1023.12', '2130.98', '28.10', '34.12', '123.02', '234.09', '1234.32', '1234.24', '123.01');
INSERT INTO `reporta` VALUES ('4', '2020-05-06 11:30:00', '2020-05-06 18:10:00', 'CA1083', '123.42', '123.81', '30.60', '109.40', '1234.98', '89.10', '56.80', '34.60', '106.20', '1234.76', '1212.65', '23.91');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `roleName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `roleDesc` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1001', 'ADMIN', '超级管理员');
INSERT INTO `role` VALUES ('1002', 'USER', '普通用户');
INSERT INTO `role` VALUES ('1003', 'SoftwareTester', '软件测试人员');
INSERT INTO `role` VALUES ('1004', 'Administrator', '数据库管理员');
INSERT INTO `role` VALUES ('1005', 'GM', '总经理');
INSERT INTO `role` VALUES ('1006', 'CEO', '首席执行官');
INSERT INTO `role` VALUES ('1007', 'ProductManager', '产品经理');
INSERT INTO `role` VALUES ('1008', 'HardwareEngineer', '硬件工程师');
INSERT INTO `role` VALUES ('1009', 'OM', '运作经理');
INSERT INTO `role` VALUES ('1010', 'HRD', '人力资源总监');
INSERT INTO `role` VALUES ('1011', 'CTO', '首席技术官');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` varchar(32) COLLATE utf8_bin NOT NULL,
  `roleId` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1001', '1001');
INSERT INTO `role_permission` VALUES ('1002', '1001');
INSERT INTO `role_permission` VALUES ('1003', '1001');
INSERT INTO `role_permission` VALUES ('1004', '1001');
INSERT INTO `role_permission` VALUES ('1005', '1001');
INSERT INTO `role_permission` VALUES ('1006', '1001');
INSERT INTO `role_permission` VALUES ('1007', '1001');
INSERT INTO `role_permission` VALUES ('1008', '1001');
INSERT INTO `role_permission` VALUES ('1009', '1001');
INSERT INTO `role_permission` VALUES ('1010', '1001');
INSERT INTO `role_permission` VALUES ('1011', '1001');
INSERT INTO `role_permission` VALUES ('1012', '1001');

-- ----------------------------
-- Table structure for sensors
-- ----------------------------
DROP TABLE IF EXISTS `sensors`;
CREATE TABLE `sensors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `sensorsName` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '传感器名称',
  `sensorsType` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '传感器型号',
  `installtionAddr` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '安装地址',
  `precision` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '精度',
  `baudRate` int(11) DEFAULT NULL COMMENT '波特率',
  `lastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次检定时间',
  `nextTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下次检定时间',
  `pressureGrade` int(11) DEFAULT NULL COMMENT '压力等级',
  `tempGrade` int(11) DEFAULT NULL COMMENT '温度等级',
  `prl` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '防护等级',
  `status` int(11) DEFAULT NULL COMMENT '连接状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sensors
-- ----------------------------
INSERT INTO `sensors` VALUES ('1', '燕赵多功能电力仪表', 'MNE96-W96', '准备1#浆纱机', '0.1', '1456', '2020-06-10 00:00:00', '2020-03-04 00:00:00', '0', '0', 'IPWE-11', '1');
INSERT INTO `sensors` VALUES ('2', '燕也多功能电力仪表', 'MNE96-W91', '准备4#浆纱机', '0.1', '2000', '2020-06-10 00:00:00', '2020-03-04 00:00:00', '0', '0', 'IPWE-10', '1');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `visitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '访问时间',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作者用户名',
  `ip` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '访问ip',
  `url` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '访问资源url',
  `executionTime` int(11) DEFAULT NULL COMMENT '执行时长',
  `method` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '执行方法',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of syslog
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `phoneNum` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users 登录密码可能默认8个6，z账号：AlibabaGroup 密码：Alibaba1012
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'lzs@163.com', 'mingyue', '$2a$10$/g6.c4GztNOu3Vkr0v5b0O0K2CHoYBX4WYLnWDFYK/3o2Mf9XbbC.', '15688817022', '1');
INSERT INTO `users` VALUES ('2', 'lzs@163.com', 'yuxiao', '$2a$10$QeNSMdbIWrChcNaDgPayY.0fT3nPHpZAsMIGZLbWwwxp..ql/04fe', '15988817029', '1');
INSERT INTO `users` VALUES ('3', 'lzs@163.com', '时光科技', '$2a$10$JJVSsIyczvTMQT0lpl96VuxHDhfxNW4O3wo4ISy5BHwxYtCWyz94m', '15988817029', '1');
INSERT INTO `users` VALUES ('4', 'lzs@163.com', '华远地产', '$2a$10$SKvPZ67ArasCyha1e/iRlunZ471gVJbIoEppRUrMkv0tCVUtCtFNK', '15988817029', '1');
INSERT INTO `users` VALUES ('5', 'lzs@163.com', '阿里巴巴', '$2a$10$Z1jrtOwJkbP9f5mMSTVfI.TTX3MVlFhhgaxkH1a7LgI5biMSwZ4KS', '15988817029', '1');
INSERT INTO `users` VALUES ('6', 'lzs@163.com', '华硕电脑', '$2a$10$rVVpn97ONjQAv2dcHW1kve5sot5OVglEYLksJaYJAuCUMyZvua7Bm', '15988817029', '1');
INSERT INTO `users` VALUES ('7', '1688.com', 'AlibabaGroup', '$2a$10$zxCykDTf4PwU3sWJCKBOSuGHCvsE2/5Ey8tjOJcYRgru3aj7lrph2', '15988817019', '1');
INSERT INTO `users` VALUES ('9', 'adadad', 'LIZHi', '$2a$10$kntpRYLJ0dilO/w9QU7Bw.jaIsrsJ/KjJLC.m5JZXoGYXKuZ9ACV.', 'dasdasd', '1');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` varchar(32) COLLATE utf8_bin NOT NULL,
  `roleId` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `userId` (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('1', '1001');
INSERT INTO `users_role` VALUES ('1', '1002');
INSERT INTO `users_role` VALUES ('2', '1001');
INSERT INTO `users_role` VALUES ('2', '1002');
INSERT INTO `users_role` VALUES ('3', '1001');
INSERT INTO `users_role` VALUES ('3', '1002');
INSERT INTO `users_role` VALUES ('3', '1003');
INSERT INTO `users_role` VALUES ('3', '1004');
INSERT INTO `users_role` VALUES ('3', '1005');
INSERT INTO `users_role` VALUES ('3', '1006');
INSERT INTO `users_role` VALUES ('3', '1007');
INSERT INTO `users_role` VALUES ('3', '1008');
INSERT INTO `users_role` VALUES ('3', '1009');
INSERT INTO `users_role` VALUES ('3', '1010');
INSERT INTO `users_role` VALUES ('3', '1011');
INSERT INTO `users_role` VALUES ('5', '1001');
INSERT INTO `users_role` VALUES ('5', '1002');
INSERT INTO `users_role` VALUES ('7', '1001');
INSERT INTO `users_role` VALUES ('7', '1002');
INSERT INTO `users_role` VALUES ('9', '1001');
INSERT INTO `users_role` VALUES ('9', '1002');
