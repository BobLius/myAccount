/*
Navicat MySQL Data Transfer

Source Server         : LiuBo
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : my_account

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2015-04-28 15:03:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bank`
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `bank_id` varchar(100) NOT NULL DEFAULT '' COMMENT '银行编号',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行名称',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES ('001', '工商银行');
INSERT INTO `bank` VALUES ('002', '北京银行');
INSERT INTO `bank` VALUES ('003', '招商银行');
INSERT INTO `bank` VALUES ('004', '建设银行');

-- ----------------------------
-- Table structure for `bank_save`
-- ----------------------------
DROP TABLE IF EXISTS `bank_save`;
CREATE TABLE `bank_save` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `bank_id` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `card_no` varchar(100) DEFAULT NULL COMMENT '卡号',
  `money` double(100,3) DEFAULT NULL COMMENT '余额',
  `record_date` varchar(100) DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank_save
-- ----------------------------

-- ----------------------------
-- Table structure for `brokerage`
-- ----------------------------
DROP TABLE IF EXISTS `brokerage`;
CREATE TABLE `brokerage` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `create_date` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `flag` varchar(1) DEFAULT NULL COMMENT '有效标识',
  `brokerage` double(100,3) DEFAULT NULL COMMENT '佣金率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brokerage
-- ----------------------------
INSERT INTO `brokerage` VALUES ('402890ba4ce51a72014ce51d0aa40002', '20150117', '0', '0.800');

-- ----------------------------
-- Table structure for `buy`
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy` (
  `id` varchar(100) NOT NULL,
  `stock_id` varchar(100) DEFAULT NULL COMMENT '股票代码',
  `buy_date` varchar(100) DEFAULT NULL COMMENT '买入时间',
  `buy_mount` double(100,3) DEFAULT NULL COMMENT '买入股数',
  `buy_every_money` double(100,3) DEFAULT NULL COMMENT '每股价格',
  `buy_tolle_money` double(100,3) DEFAULT NULL COMMENT '总买入价格',
  `brokerage` double(100,3) DEFAULT NULL COMMENT '佣金',
  `brokerage_rate` double(100,3) DEFAULT NULL,
  `transfer_fee` double(100,3) DEFAULT NULL COMMENT '过户费',
  `costs` double(100,3) DEFAULT NULL COMMENT '每股成本',
  `the_end` double(100,3) DEFAULT NULL COMMENT '成交额',
  `record_flag` varchar(1) DEFAULT NULL COMMENT '记录标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buy
-- ----------------------------
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce51b517a0000', '601390', '20150423', '200.000', '18.460', '3692.000', '5.000', '0.000', '0.120', '18.486', '3697.120', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce51c31d90001', '601766', '20150422', '100.000', '30.250', '3025.000', '5.000', '0.000', '0.060', '30.301', '3030.060', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce52e49320003', '601398', '20150127', '200.000', '4.820', '964.000', '5.000', '0.800', '0.120', '4.846', '969.120', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce52f932c0004', '601398', '20150204', '600.000', '4.500', '2700.000', '5.000', '0.800', '0.360', '4.509', '2705.360', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce530ff630005', '601186', '20150320', '200.000', '16.200', '3240.000', '5.000', '0.800', '0.120', '16.226', '3245.120', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce53135c00006', '000829', '20150323', '200.000', '14.710', '2942.000', '5.000', '0.800', '0.000', '14.735', '2947.000', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce5317ffe0007', '601766', '20150324', '200.000', '14.910', '2982.000', '5.000', '0.800', '0.120', '14.936', '2987.120', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce531ae7d0008', '601186', '20150325', '200.000', '18.630', '3726.000', '5.000', '0.800', '0.120', '18.656', '3731.120', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce531d9c50009', '000063', '20150330', '200.000', '22.270', '4454.000', '5.000', '0.800', '0.000', '22.295', '4459.000', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce5357cff000a', '601390', '20150401', '200.000', '13.200', '2640.000', '5.000', '0.800', '0.120', '13.226', '2645.120', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce5364701000b', '600048', '20150417', '200.000', '13.820', '2764.000', '5.000', '0.800', '0.120', '13.846', '2769.120', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce5367722000c', '000002', '20150420', '200.000', '14.780', '2956.000', '5.000', '0.800', '0.000', '14.805', '2961.000', '0');
INSERT INTO `buy` VALUES ('402890ba4ce51a72014ce538262e000d', '600435', '20150408', '200.000', '32.300', '6460.000', '5.168', '0.800', '0.120', '32.326', '6465.288', '0');
INSERT INTO `buy` VALUES ('402890ba4cf9e74f014cf9edb4170001', '601727', '20150427', '200.000', '18.600', '3720.000', '5.000', '0.800', '0.120', '18.626', '3725.120', '0');
INSERT INTO `buy` VALUES ('402890ba4cf9e74f014cf9ee441e0003', '002490', '20150427', '200.000', '13.280', '2656.000', '5.000', '0.800', '0.000', '13.305', '2661.000', '0');
INSERT INTO `buy` VALUES ('402890ba4cfeca14014cfed2c4d60005', '601727', '20150428', '300.000', '18.210', '5463.000', '5.000', '0.800', '0.180', '18.227', '5468.180', '0');

-- ----------------------------
-- Table structure for `manage_finances`
-- ----------------------------
DROP TABLE IF EXISTS `manage_finances`;
CREATE TABLE `manage_finances` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `money` double(100,3) DEFAULT NULL,
  `record_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manage_finances
-- ----------------------------

-- ----------------------------
-- Table structure for `my_assets`
-- ----------------------------
DROP TABLE IF EXISTS `my_assets`;
CREATE TABLE `my_assets` (
  `id` varchar(100) NOT NULL,
  `money` double(100,3) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_assets
-- ----------------------------

-- ----------------------------
-- Table structure for `onhand`
-- ----------------------------
DROP TABLE IF EXISTS `onhand`;
CREATE TABLE `onhand` (
  `stock_id` varchar(100) NOT NULL DEFAULT '' COMMENT '股票代码',
  `buy_mount` double(100,3) DEFAULT NULL COMMENT '股数',
  `costs` double(100,3) DEFAULT NULL COMMENT '平均成本',
  `the_end` double(100,3) DEFAULT NULL COMMENT '成交额',
  `sell_lowest` double(100,3) DEFAULT NULL COMMENT '最低卖出价',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onhand
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
INSERT INTO `resources` VALUES ('001', '/', '0', '1', '1', '系统', '234', null, '2015-04-14', null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('002', '/resource', '1', '1', '1', '权限', '权限', null, null, null, null, null, null, null, '001');
INSERT INTO `resources` VALUES ('003', '/resource', '2', '1', '0', '权限', null, null, null, null, null, null, null, null, '002');
INSERT INTO `resources` VALUES ('402890ba4cb6aff7014cb6b4e2b00000', '/user', '1', null, '1', '用户', '', '-1', null, null, null, null, '0', '用户', '001');
INSERT INTO `resources` VALUES ('402890ba4cc0c04e014cc0c191eb0000', '/onhand/list', null, null, '1', '我的股票', '', '-1', null, null, null, null, '0', '', '4028e0814cbbfb1b014cbbff169d0000');
INSERT INTO `resources` VALUES ('402890ba4cc1440a014cc14a5bd00000', '/sell/list', null, null, '1', '卖出', '', '-1', null, null, null, null, '0', '', '4028e0814cbbfb1b014cbbff169d0000');
INSERT INTO `resources` VALUES ('402890ba4ce9ff2c014cea00aa740000', '/stockAssets/list', null, null, '1', '资产', '', '-1', null, null, null, null, '0', '', '4028e0814cbbfb1b014cbbff169d0000');
INSERT INTO `resources` VALUES ('402890ba4cf8b7e3014cf8b8b1300000', '/bank', '1', '2', '0', '银行', '', '-1', null, null, null, null, '0', '', '001');
INSERT INTO `resources` VALUES ('402890ba4cf8b7e3014cf8b934660001', '/bank/list', null, null, '1', '银行管理', '', '-1', null, null, null, null, '0', '', '402890ba4cf8b7e3014cf8b8b1300000');
INSERT INTO `resources` VALUES ('402890ba4cf8f6bb014cf8fb47b90000', '/bankSave/list', null, null, '1', '银行储蓄', '', '-1', null, null, null, null, '0', '', '402890ba4cf8b7e3014cf8b8b1300000');
INSERT INTO `resources` VALUES ('402890ba4cf98912014cf989c88a0000', '/manageFinances', '1', '3', '0', '理财', '', '-1', null, null, null, null, '0', '', '001');
INSERT INTO `resources` VALUES ('402890ba4cf98912014cf98a89820001', '/manageFinances/list', null, null, '1', '理财管理', '', '-1', null, null, null, null, '0', '', '402890ba4cf98912014cf989c88a0000');
INSERT INTO `resources` VALUES ('402890ba4cfdd543014cfdd637570000', '/stockOther/list', null, null, '1', '其他', '', '-1', null, null, null, null, '0', '', '4028e0814cbbfb1b014cbbff169d0000');
INSERT INTO `resources` VALUES ('402890ba4cfeca14014cfecefcfb0000', '/myAssets', '1', '5', '0', '总资产', '', '-1', null, null, null, null, '0', '', '001');
INSERT INTO `resources` VALUES ('402890ba4cfeca14014cfecf44820001', '/myAssets/list', null, null, '1', '总资产', '', '-1', null, null, null, null, '0', '', '402890ba4cfeca14014cfecefcfb0000');
INSERT INTO `resources` VALUES ('4028e0814cbbfb1b014cbbff169d0000', '/socket', '1', '1', '0', '股票', '', '-1', null, null, null, null, '0', '', '001');
INSERT INTO `resources` VALUES ('4028e0814cbbfb1b014cbc04c8870002', '/brokerage/list', null, null, '1', '佣金', '', '-1', null, null, null, null, '0', '', '4028e0814cbbfb1b014cbbff169d0000');
INSERT INTO `resources` VALUES ('4028e0814cbbfb1b014cbc06839e0003', '/buy/list ', null, null, '1', '买入', '', '-1', null, null, null, null, '0', '', '4028e0814cbbfb1b014cbbff169d0000');
INSERT INTO `resources` VALUES ('4028e0814cbbfb1b014cbc06bfca0004', '/user', null, null, '1', '用户', '', '-1', null, null, null, null, '0', '', '402890ba4cb6aff7014cb6b4e2b00000');

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
  `stock_id` varchar(100) DEFAULT NULL COMMENT '股票代码',
  `sell_date` varchar(100) DEFAULT NULL COMMENT '卖出时间',
  `sell_mount` double(100,3) DEFAULT NULL COMMENT '卖出股数',
  `sell_every_money` double(100,3) DEFAULT NULL COMMENT '每股价格',
  `sell_tolle_money` double(100,3) DEFAULT NULL COMMENT '总卖出价格',
  `brokerage` double(100,3) DEFAULT NULL COMMENT '佣金',
  `brokerage_rate` double(100,3) DEFAULT NULL,
  `transfer_fee` double(100,3) DEFAULT NULL COMMENT '过户费',
  `stamp` double(100,3) DEFAULT NULL COMMENT '印花税',
  `the_end` double(100,3) DEFAULT NULL COMMENT '成交额',
  `record_flag` varchar(1) DEFAULT NULL COMMENT '记录标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sell
-- ----------------------------
INSERT INTO `sell` VALUES ('402890ba4ce51a72014ce53ac3ac000e', '601398', '20150313', '800.000', '4.650', '3720.000', '5.000', '0.800', '0.480', '3.720', '3710.800', '0');
INSERT INTO `sell` VALUES ('402890ba4ce51a72014ce53af883000f', '601186', '20150323', '200.000', '16.870', '3374.000', '5.000', '0.800', '0.120', '3.374', '3365.506', '0');
INSERT INTO `sell` VALUES ('402890ba4ce51a72014ce53b26f40010', '000829', '20150324', '200.000', '15.500', '3100.000', '5.000', '0.800', '0.000', '3.100', '3091.900', '0');
INSERT INTO `sell` VALUES ('402890ba4ce51a72014ce53be5120011', '601766', '20150325', '200.000', '15.250', '3050.000', '5.000', '0.800', '0.120', '3.050', '3041.830', '0');
INSERT INTO `sell` VALUES ('402890ba4ce51a72014ce53c173e0012', '601186', '20150330', '200.000', '19.310', '3862.000', '5.000', '0.800', '0.120', '3.862', '3853.018', '0');
INSERT INTO `sell` VALUES ('402890ba4ce51a72014ce53c61d60013', '000063', '20150401', '200.000', '22.480', '4496.000', '5.000', '0.800', '0.000', '4.496', '4486.504', '0');
INSERT INTO `sell` VALUES ('402890ba4ce51a72014ce53c96820014', '601390', '20150408', '200.000', '13.370', '2674.000', '5.000', '0.800', '0.120', '2.674', '2666.206', '0');
INSERT INTO `sell` VALUES ('402890ba4ce51a72014ce53cba6b0015', '600435', '20150417', '200.000', '33.450', '6690.000', '5.352', '0.800', '0.120', '6.690', '6677.838', '0');
INSERT INTO `sell` VALUES ('402890ba4ce51a72014ce53d0f6f0016', '000002', '20150422', '200.000', '14.820', '2964.000', '5.000', '0.800', '0.000', '2.964', '2956.036', '0');
INSERT INTO `sell` VALUES ('402890ba4ce51a72014ce53d301b0017', '600048', '20150422', '200.000', '14.220', '2844.000', '5.000', '0.800', '0.120', '2.844', '2836.036', '0');
INSERT INTO `sell` VALUES ('402890ba4cf9e74f014cf9ecb5f90000', '601766', '20150427', '100.000', '35.000', '3500.000', '5.000', '0.800', '0.060', '3.500', '3491.440', '0');
INSERT INTO `sell` VALUES ('402890ba4cfeca14014cfed33ea20006', '601390', '20150428', '200.000', '22.580', '4516.000', '5.000', '0.800', '0.120', '4.516', '4510.880', '0');

-- ----------------------------
-- Table structure for `stock`
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `stock_id` varchar(100) NOT NULL DEFAULT '',
  `stock_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('000001', '深发展Ａ');
INSERT INTO `stock` VALUES ('000002', '万 科Ａ ');
INSERT INTO `stock` VALUES ('000004', 'ST国农  ');
INSERT INTO `stock` VALUES ('000005', '世纪星源');
INSERT INTO `stock` VALUES ('000006', '深振业Ａ');
INSERT INTO `stock` VALUES ('000007', 'ST零七  ');
INSERT INTO `stock` VALUES ('000008', 'ST宝利来');
INSERT INTO `stock` VALUES ('000009', '中国宝安');
INSERT INTO `stock` VALUES ('000010', 'S ST华新');
INSERT INTO `stock` VALUES ('000011', '深物业A ');
INSERT INTO `stock` VALUES ('000012', '南 玻Ａ ');
INSERT INTO `stock` VALUES ('000014', '沙河股份');
INSERT INTO `stock` VALUES ('000016', '深康佳Ａ');
INSERT INTO `stock` VALUES ('000017', '*ST中华A');
INSERT INTO `stock` VALUES ('000018', 'ST中冠A ');
INSERT INTO `stock` VALUES ('000019', '深深宝Ａ');
INSERT INTO `stock` VALUES ('000020', '深华发Ａ');
INSERT INTO `stock` VALUES ('000021', '长城开发');
INSERT INTO `stock` VALUES ('000022', '深赤湾Ａ');
INSERT INTO `stock` VALUES ('000023', '深天地Ａ');
INSERT INTO `stock` VALUES ('000024', '招商地产');
INSERT INTO `stock` VALUES ('000025', '特 力Ａ ');
INSERT INTO `stock` VALUES ('000026', '飞亚达Ａ');
INSERT INTO `stock` VALUES ('000027', '深圳能源');
INSERT INTO `stock` VALUES ('000028', '一致药业');
INSERT INTO `stock` VALUES ('000029', '深深房Ａ');
INSERT INTO `stock` VALUES ('000030', '*ST盛润A');
INSERT INTO `stock` VALUES ('000031', '中粮地产');
INSERT INTO `stock` VALUES ('000032', '深桑达Ａ');
INSERT INTO `stock` VALUES ('000033', '新都酒店');
INSERT INTO `stock` VALUES ('000034', 'ST深泰  ');
INSERT INTO `stock` VALUES ('000035', '*ST科健 ');
INSERT INTO `stock` VALUES ('000036', '华联控股');
INSERT INTO `stock` VALUES ('000037', '深南电Ａ');
INSERT INTO `stock` VALUES ('000039', '中集集团');
INSERT INTO `stock` VALUES ('000040', '深 鸿 基');
INSERT INTO `stock` VALUES ('000042', '深 长 城');
INSERT INTO `stock` VALUES ('000043', '中航地产');
INSERT INTO `stock` VALUES ('000045', '深纺织Ａ');
INSERT INTO `stock` VALUES ('000046', '泛海建设');
INSERT INTO `stock` VALUES ('000048', 'ST康达尔');
INSERT INTO `stock` VALUES ('000049', '德赛电池');
INSERT INTO `stock` VALUES ('000050', '深天马Ａ');
INSERT INTO `stock` VALUES ('000055', '方大集团');
INSERT INTO `stock` VALUES ('000056', '深 国 商');
INSERT INTO `stock` VALUES ('000058', '深 赛 格');
INSERT INTO `stock` VALUES ('000059', '辽通化工');
INSERT INTO `stock` VALUES ('000060', '中金岭南');
INSERT INTO `stock` VALUES ('000061', '农 产 品');
INSERT INTO `stock` VALUES ('000062', '深圳华强');
INSERT INTO `stock` VALUES ('000063', '中兴通讯');
INSERT INTO `stock` VALUES ('000065', '北方国际');
INSERT INTO `stock` VALUES ('000066', '长城电脑');
INSERT INTO `stock` VALUES ('000068', 'ST三星  ');
INSERT INTO `stock` VALUES ('000069', '华侨城Ａ');
INSERT INTO `stock` VALUES ('000070', '特发信息');
INSERT INTO `stock` VALUES ('000078', '海王生物');
INSERT INTO `stock` VALUES ('000088', '盐 田 港');
INSERT INTO `stock` VALUES ('000089', '深圳机场');
INSERT INTO `stock` VALUES ('000090', '深 天 健');
INSERT INTO `stock` VALUES ('000096', '广聚能源');
INSERT INTO `stock` VALUES ('000099', '中信海直');
INSERT INTO `stock` VALUES ('000100', 'TCL 集团');
INSERT INTO `stock` VALUES ('000150', '宜华地产');
INSERT INTO `stock` VALUES ('000151', '中成股份');
INSERT INTO `stock` VALUES ('000153', '丰原药业');
INSERT INTO `stock` VALUES ('000155', '川化股份');
INSERT INTO `stock` VALUES ('000157', '中联重科');
INSERT INTO `stock` VALUES ('000158', '常山股份');
INSERT INTO `stock` VALUES ('000159', '国际实业');
INSERT INTO `stock` VALUES ('000301', '东方市场');
INSERT INTO `stock` VALUES ('000338', '潍柴动力');
INSERT INTO `stock` VALUES ('000400', '许继电气');
INSERT INTO `stock` VALUES ('000401', '冀东水泥');
INSERT INTO `stock` VALUES ('000402', '金 融 街');
INSERT INTO `stock` VALUES ('000404', '华意压缩');
INSERT INTO `stock` VALUES ('000407', '胜利股份');
INSERT INTO `stock` VALUES ('000408', '*ST金谷 ');
INSERT INTO `stock` VALUES ('000409', 'ST泰复  ');
INSERT INTO `stock` VALUES ('000410', '沈阳机床');
INSERT INTO `stock` VALUES ('000411', '英特集团');
INSERT INTO `stock` VALUES ('000413', '宝 石Ａ ');
INSERT INTO `stock` VALUES ('000415', '*ST汇通 ');
INSERT INTO `stock` VALUES ('000416', '民生投资');
INSERT INTO `stock` VALUES ('000417', '合肥百货');
INSERT INTO `stock` VALUES ('000418', '小天鹅Ａ');
INSERT INTO `stock` VALUES ('000419', '通程控股');
INSERT INTO `stock` VALUES ('000420', '吉林化纤');
INSERT INTO `stock` VALUES ('000421', '南京中北');
INSERT INTO `stock` VALUES ('000422', '湖北宜化');
INSERT INTO `stock` VALUES ('000423', '东阿阿胶');
INSERT INTO `stock` VALUES ('000425', '徐工机械');
INSERT INTO `stock` VALUES ('000426', '富龙热电');
INSERT INTO `stock` VALUES ('000428', '华天酒店');
INSERT INTO `stock` VALUES ('000429', '粤高速Ａ');
INSERT INTO `stock` VALUES ('000430', '*ST张股 ');
INSERT INTO `stock` VALUES ('000488', '晨鸣纸业');
INSERT INTO `stock` VALUES ('000501', '鄂武商Ａ');
INSERT INTO `stock` VALUES ('000502', '绿景地产');
INSERT INTO `stock` VALUES ('000503', '海虹控股');
INSERT INTO `stock` VALUES ('000504', '*ST传媒 ');
INSERT INTO `stock` VALUES ('000505', 'ST珠江  ');
INSERT INTO `stock` VALUES ('000506', '中润投资');
INSERT INTO `stock` VALUES ('000507', '珠海港  ');
INSERT INTO `stock` VALUES ('000509', 'S*ST华塑');
INSERT INTO `stock` VALUES ('000510', '金路集团');
INSERT INTO `stock` VALUES ('000511', '银基发展');
INSERT INTO `stock` VALUES ('000513', '丽珠集团');
INSERT INTO `stock` VALUES ('000514', '渝 开 发');
INSERT INTO `stock` VALUES ('000516', '开元控股');
INSERT INTO `stock` VALUES ('000517', '荣安地产');
INSERT INTO `stock` VALUES ('000518', '四环生物');
INSERT INTO `stock` VALUES ('000519', '江南红箭');
INSERT INTO `stock` VALUES ('000520', '长航凤凰');
INSERT INTO `stock` VALUES ('000521', '美菱电器');
INSERT INTO `stock` VALUES ('000522', '白云山Ａ');
INSERT INTO `stock` VALUES ('000523', '广州浪奇');
INSERT INTO `stock` VALUES ('000524', '东方宾馆');
INSERT INTO `stock` VALUES ('000525', '红 太 阳');
INSERT INTO `stock` VALUES ('000526', '旭飞投资');
INSERT INTO `stock` VALUES ('000527', '美的电器');
INSERT INTO `stock` VALUES ('000528', '柳 工   ');
INSERT INTO `stock` VALUES ('000529', '广弘控股');
INSERT INTO `stock` VALUES ('000530', '大冷股份');
INSERT INTO `stock` VALUES ('000531', '穗恒运Ａ');
INSERT INTO `stock` VALUES ('000532', '力合股份');
INSERT INTO `stock` VALUES ('000533', '万 家 乐');
INSERT INTO `stock` VALUES ('000534', '万泽股份');
INSERT INTO `stock` VALUES ('000536', '华映科技');
INSERT INTO `stock` VALUES ('000537', '广宇发展');
INSERT INTO `stock` VALUES ('000538', '云南白药');
INSERT INTO `stock` VALUES ('000539', '粤电力Ａ');
INSERT INTO `stock` VALUES ('000540', '中天城投');
INSERT INTO `stock` VALUES ('000541', '佛山照明');
INSERT INTO `stock` VALUES ('000543', '皖能电力');
INSERT INTO `stock` VALUES ('000544', '中原环保');
INSERT INTO `stock` VALUES ('000545', '吉林制药');
INSERT INTO `stock` VALUES ('000546', '光华控股');
INSERT INTO `stock` VALUES ('000547', '闽福发Ａ');
INSERT INTO `stock` VALUES ('000548', '湖南投资');
INSERT INTO `stock` VALUES ('000550', '江铃汽车');
INSERT INTO `stock` VALUES ('000551', '创元科技');
INSERT INTO `stock` VALUES ('000552', '靖远煤电');
INSERT INTO `stock` VALUES ('000553', '沙隆达Ａ');
INSERT INTO `stock` VALUES ('000554', '泰山石油');
INSERT INTO `stock` VALUES ('000555', 'ST 太 光');
INSERT INTO `stock` VALUES ('000557', '*ST广夏 ');
INSERT INTO `stock` VALUES ('000558', '莱茵置业');
INSERT INTO `stock` VALUES ('000559', '万向钱潮');
INSERT INTO `stock` VALUES ('000560', '昆百大Ａ');
INSERT INTO `stock` VALUES ('000561', '烽火电子');
INSERT INTO `stock` VALUES ('000562', '宏源证券');
INSERT INTO `stock` VALUES ('000563', '陕国投Ａ');
INSERT INTO `stock` VALUES ('000564', '西安民生');
INSERT INTO `stock` VALUES ('000565', '渝三峡Ａ');
INSERT INTO `stock` VALUES ('000566', '海南海药');
INSERT INTO `stock` VALUES ('000567', '海德股份');
INSERT INTO `stock` VALUES ('000568', '泸州老窖');
INSERT INTO `stock` VALUES ('000570', '苏常柴Ａ');
INSERT INTO `stock` VALUES ('000571', '新大洲Ａ');
INSERT INTO `stock` VALUES ('000572', '海马股份');
INSERT INTO `stock` VALUES ('000573', '粤宏远Ａ');
INSERT INTO `stock` VALUES ('000576', 'ST甘化  ');
INSERT INTO `stock` VALUES ('000578', '盐湖集团');
INSERT INTO `stock` VALUES ('000581', '威孚高科');
INSERT INTO `stock` VALUES ('000582', '北 海 港');
INSERT INTO `stock` VALUES ('000584', '友利控股');
INSERT INTO `stock` VALUES ('000585', '东北电气');
INSERT INTO `stock` VALUES ('000586', 'ST汇源  ');
INSERT INTO `stock` VALUES ('000587', 'S*ST光明');
INSERT INTO `stock` VALUES ('000589', '黔轮胎Ａ');
INSERT INTO `stock` VALUES ('000590', '紫光古汉');
INSERT INTO `stock` VALUES ('000591', '桐 君 阁');
INSERT INTO `stock` VALUES ('000592', '中福实业');
INSERT INTO `stock` VALUES ('000593', '大通燃气');
INSERT INTO `stock` VALUES ('000594', '国恒铁路');
INSERT INTO `stock` VALUES ('000595', '西北轴承');
INSERT INTO `stock` VALUES ('000596', '古井贡酒');
INSERT INTO `stock` VALUES ('000597', '东北制药');
INSERT INTO `stock` VALUES ('000598', '兴蓉投资');
INSERT INTO `stock` VALUES ('000599', '青岛双星');
INSERT INTO `stock` VALUES ('000600', '建投能源');
INSERT INTO `stock` VALUES ('000601', '韶能股份');
INSERT INTO `stock` VALUES ('000602', '*ST金马 ');
INSERT INTO `stock` VALUES ('000603', '*ST 威达');
INSERT INTO `stock` VALUES ('000605', 'ST 四 环');
INSERT INTO `stock` VALUES ('000606', '青海明胶');
INSERT INTO `stock` VALUES ('000607', '华智控股');
INSERT INTO `stock` VALUES ('000608', '阳光股份');
INSERT INTO `stock` VALUES ('000609', '绵世股份');
INSERT INTO `stock` VALUES ('000610', '西安旅游');
INSERT INTO `stock` VALUES ('000611', '时代科技');
INSERT INTO `stock` VALUES ('000612', '焦作万方');
INSERT INTO `stock` VALUES ('000613', 'ST东海Ａ');
INSERT INTO `stock` VALUES ('000615', '湖北金环');
INSERT INTO `stock` VALUES ('000616', '亿城股份');
INSERT INTO `stock` VALUES ('000617', '石油济柴');
INSERT INTO `stock` VALUES ('000619', '海螺型材');
INSERT INTO `stock` VALUES ('000623', '吉林敖东');
INSERT INTO `stock` VALUES ('000625', '长安汽车');
INSERT INTO `stock` VALUES ('000626', '如意集团');
INSERT INTO `stock` VALUES ('000627', '天茂集团');
INSERT INTO `stock` VALUES ('000628', '高新发展');
INSERT INTO `stock` VALUES ('000629', '*ST钒钛 ');
INSERT INTO `stock` VALUES ('000630', '铜陵有色');
INSERT INTO `stock` VALUES ('000631', '顺发恒业');
INSERT INTO `stock` VALUES ('000632', '三木集团');
INSERT INTO `stock` VALUES ('000633', 'ST合金  ');
INSERT INTO `stock` VALUES ('000635', '英 力 特');
INSERT INTO `stock` VALUES ('000636', '风华高科');
INSERT INTO `stock` VALUES ('000637', '茂化实华');
INSERT INTO `stock` VALUES ('000638', '万方地产');
INSERT INTO `stock` VALUES ('000639', '西王食品');
INSERT INTO `stock` VALUES ('000650', '仁和药业');
INSERT INTO `stock` VALUES ('000651', '格力电器');
INSERT INTO `stock` VALUES ('000652', '泰达股份');
INSERT INTO `stock` VALUES ('000655', '金岭矿业');
INSERT INTO `stock` VALUES ('000656', 'ST 东 源');
INSERT INTO `stock` VALUES ('000659', '珠海中富');
INSERT INTO `stock` VALUES ('000661', '长春高新');
INSERT INTO `stock` VALUES ('000662', '索 芙 特');
INSERT INTO `stock` VALUES ('000663', '永安林业');
INSERT INTO `stock` VALUES ('000665', '武汉塑料');
INSERT INTO `stock` VALUES ('000666', '经纬纺机');
INSERT INTO `stock` VALUES ('000667', '名流置业');
INSERT INTO `stock` VALUES ('000668', '荣丰控股');
INSERT INTO `stock` VALUES ('000669', '领先科技');
INSERT INTO `stock` VALUES ('000671', '阳 光 城');
INSERT INTO `stock` VALUES ('000673', '*ST大水 ');
INSERT INTO `stock` VALUES ('000676', '*ST思达 ');
INSERT INTO `stock` VALUES ('000677', '山东海龙');
INSERT INTO `stock` VALUES ('000678', '襄阳轴承');
INSERT INTO `stock` VALUES ('000679', '大连友谊');
INSERT INTO `stock` VALUES ('000680', '山推股份');
INSERT INTO `stock` VALUES ('000682', '东方电子');
INSERT INTO `stock` VALUES ('000683', '远兴能源');
INSERT INTO `stock` VALUES ('000685', '中山公用');
INSERT INTO `stock` VALUES ('000686', '东北证券');
INSERT INTO `stock` VALUES ('000687', '保定天鹅');
INSERT INTO `stock` VALUES ('000690', '宝新能源');
INSERT INTO `stock` VALUES ('000691', '*ST亚太 ');
INSERT INTO `stock` VALUES ('000692', '惠天热电');
INSERT INTO `stock` VALUES ('000695', '滨海能源');
INSERT INTO `stock` VALUES ('000697', '*ST 偏转');
INSERT INTO `stock` VALUES ('000698', '沈阳化工');
INSERT INTO `stock` VALUES ('000700', '模塑科技');
INSERT INTO `stock` VALUES ('000701', '厦门信达');
INSERT INTO `stock` VALUES ('000702', '正虹科技');
INSERT INTO `stock` VALUES ('000703', '*ST光华 ');
INSERT INTO `stock` VALUES ('000705', '浙江震元');
INSERT INTO `stock` VALUES ('000707', '双环科技');
INSERT INTO `stock` VALUES ('000708', '大冶特钢');
INSERT INTO `stock` VALUES ('000709', '河北钢铁');
INSERT INTO `stock` VALUES ('000710', '天兴仪表');
INSERT INTO `stock` VALUES ('000711', '天伦置业');
INSERT INTO `stock` VALUES ('000712', '锦龙股份');
INSERT INTO `stock` VALUES ('000713', '丰乐种业');
INSERT INTO `stock` VALUES ('000715', '中兴商业');
INSERT INTO `stock` VALUES ('000716', '*ST南方 ');
INSERT INTO `stock` VALUES ('000717', '韶钢松山');
INSERT INTO `stock` VALUES ('000718', '苏宁环球');
INSERT INTO `stock` VALUES ('000720', 'ST能山  ');
INSERT INTO `stock` VALUES ('000721', '西安饮食');
INSERT INTO `stock` VALUES ('000723', '美锦能源');
INSERT INTO `stock` VALUES ('000725', '京东方Ａ');
INSERT INTO `stock` VALUES ('000726', '鲁 泰Ａ ');
INSERT INTO `stock` VALUES ('000727', '华东科技');
INSERT INTO `stock` VALUES ('000728', '国元证券');
INSERT INTO `stock` VALUES ('000729', '燕京啤酒');
INSERT INTO `stock` VALUES ('000731', '四川美丰');
INSERT INTO `stock` VALUES ('000732', 'ST三农  ');
INSERT INTO `stock` VALUES ('000733', '振华科技');
INSERT INTO `stock` VALUES ('000735', '罗 牛 山');
INSERT INTO `stock` VALUES ('000736', 'ST 重 实');
INSERT INTO `stock` VALUES ('000737', '南风化工');
INSERT INTO `stock` VALUES ('000738', '中航动控');
INSERT INTO `stock` VALUES ('000739', '普洛股份');
INSERT INTO `stock` VALUES ('000748', '长城信息');
INSERT INTO `stock` VALUES ('000750', 'SST集琦 ');
INSERT INTO `stock` VALUES ('000751', '锌业股份');
INSERT INTO `stock` VALUES ('000752', '西藏发展');
INSERT INTO `stock` VALUES ('000753', '漳州发展');
INSERT INTO `stock` VALUES ('000755', '山西三维');
INSERT INTO `stock` VALUES ('000756', '新华制药');
INSERT INTO `stock` VALUES ('000758', '中色股份');
INSERT INTO `stock` VALUES ('000759', '武汉中百');
INSERT INTO `stock` VALUES ('000760', '*ST博盈 ');
INSERT INTO `stock` VALUES ('000761', '本钢板材');
INSERT INTO `stock` VALUES ('000762', '西藏矿业');
INSERT INTO `stock` VALUES ('000766', '通化金马');
INSERT INTO `stock` VALUES ('000767', '漳泽电力');
INSERT INTO `stock` VALUES ('000768', '西飞国际');
INSERT INTO `stock` VALUES ('000776', '广发证券');
INSERT INTO `stock` VALUES ('000777', '中核科技');
INSERT INTO `stock` VALUES ('000778', '新兴铸管');
INSERT INTO `stock` VALUES ('000779', '三毛派神');
INSERT INTO `stock` VALUES ('000780', '平庄能源');
INSERT INTO `stock` VALUES ('000782', '美达股份');
INSERT INTO `stock` VALUES ('000783', '长江证券');
INSERT INTO `stock` VALUES ('000785', '武汉中商');
INSERT INTO `stock` VALUES ('000786', '北新建材');
INSERT INTO `stock` VALUES ('000788', '西南合成');
INSERT INTO `stock` VALUES ('000789', '江西水泥');
INSERT INTO `stock` VALUES ('000790', '华神集团');
INSERT INTO `stock` VALUES ('000791', '西北化工');
INSERT INTO `stock` VALUES ('000792', '盐湖钾肥');
INSERT INTO `stock` VALUES ('000793', '华闻传媒');
INSERT INTO `stock` VALUES ('000795', '太原刚玉');
INSERT INTO `stock` VALUES ('000796', '易食股份');
INSERT INTO `stock` VALUES ('000797', '中国武夷');
INSERT INTO `stock` VALUES ('000798', '中水渔业');
INSERT INTO `stock` VALUES ('000799', '酒 鬼 酒');
INSERT INTO `stock` VALUES ('000800', '一汽轿车');
INSERT INTO `stock` VALUES ('000801', '四川九洲');
INSERT INTO `stock` VALUES ('000802', '北京旅游');
INSERT INTO `stock` VALUES ('000803', '金宇车城');
INSERT INTO `stock` VALUES ('000806', '银河科技');
INSERT INTO `stock` VALUES ('000807', '云铝股份');
INSERT INTO `stock` VALUES ('000809', '中汇医药');
INSERT INTO `stock` VALUES ('000810', '华润锦华');
INSERT INTO `stock` VALUES ('000811', '烟台冰轮');
INSERT INTO `stock` VALUES ('000812', '陕西金叶');
INSERT INTO `stock` VALUES ('000813', '天山纺织');
INSERT INTO `stock` VALUES ('000815', '美利纸业');
INSERT INTO `stock` VALUES ('000816', '江淮动力');
INSERT INTO `stock` VALUES ('000818', '*ST化工 ');
INSERT INTO `stock` VALUES ('000819', '岳阳兴长');
INSERT INTO `stock` VALUES ('000820', '*ST金城 ');
INSERT INTO `stock` VALUES ('000821', '京山轻机');
INSERT INTO `stock` VALUES ('000822', '山东海化');
INSERT INTO `stock` VALUES ('000823', '超声电子');
INSERT INTO `stock` VALUES ('000825', '太钢不锈');
INSERT INTO `stock` VALUES ('000826', '桑德环境');
INSERT INTO `stock` VALUES ('000828', '东莞控股');
INSERT INTO `stock` VALUES ('000829', '天音控股');
INSERT INTO `stock` VALUES ('000830', '鲁西化工');
INSERT INTO `stock` VALUES ('000831', '*ST关铝 ');
INSERT INTO `stock` VALUES ('000833', '贵糖股份');
INSERT INTO `stock` VALUES ('000835', '四川圣达');
INSERT INTO `stock` VALUES ('000836', '鑫茂科技');
INSERT INTO `stock` VALUES ('000837', '秦川发展');
INSERT INTO `stock` VALUES ('000838', '国兴地产');
INSERT INTO `stock` VALUES ('000839', '中信国安');
INSERT INTO `stock` VALUES ('000848', '承德露露');
INSERT INTO `stock` VALUES ('000850', '华茂股份');
INSERT INTO `stock` VALUES ('000851', '高鸿股份');
INSERT INTO `stock` VALUES ('000852', '江钻股份');
INSERT INTO `stock` VALUES ('000856', 'ST唐陶  ');
INSERT INTO `stock` VALUES ('000858', '五 粮 液');
INSERT INTO `stock` VALUES ('000859', '国风塑业');
INSERT INTO `stock` VALUES ('000860', '顺鑫农业');
INSERT INTO `stock` VALUES ('000861', '海印股份');
INSERT INTO `stock` VALUES ('000862', '银星能源');
INSERT INTO `stock` VALUES ('000868', '安凯客车');
INSERT INTO `stock` VALUES ('000869', '张 裕Ａ ');
INSERT INTO `stock` VALUES ('000875', '吉电股份');
INSERT INTO `stock` VALUES ('000876', '新 希 望');
INSERT INTO `stock` VALUES ('000877', '天山股份');
INSERT INTO `stock` VALUES ('000878', '云南铜业');
INSERT INTO `stock` VALUES ('000880', '潍柴重机');
INSERT INTO `stock` VALUES ('000881', '大连国际');
INSERT INTO `stock` VALUES ('000882', '华联股份');
INSERT INTO `stock` VALUES ('000883', '湖北能源');
INSERT INTO `stock` VALUES ('000885', '同力水泥');
INSERT INTO `stock` VALUES ('000886', '海南高速');
INSERT INTO `stock` VALUES ('000887', '中鼎股份');
INSERT INTO `stock` VALUES ('000888', '峨眉山Ａ');
INSERT INTO `stock` VALUES ('000889', '渤海物流');
INSERT INTO `stock` VALUES ('000890', '法 尔 胜');
INSERT INTO `stock` VALUES ('000892', '*ST星美 ');
INSERT INTO `stock` VALUES ('000893', '东凌粮油');
INSERT INTO `stock` VALUES ('000895', '双汇发展');
INSERT INTO `stock` VALUES ('000897', '津滨发展');
INSERT INTO `stock` VALUES ('000898', '鞍钢股份');
INSERT INTO `stock` VALUES ('000899', '赣能股份');
INSERT INTO `stock` VALUES ('000900', '现代投资');
INSERT INTO `stock` VALUES ('000901', '航天科技');
INSERT INTO `stock` VALUES ('000902', '*ST中服 ');
INSERT INTO `stock` VALUES ('000903', '云内动力');
INSERT INTO `stock` VALUES ('000905', '厦门港务');
INSERT INTO `stock` VALUES ('000906', '南方建材');
INSERT INTO `stock` VALUES ('000908', '*ST天一 ');
INSERT INTO `stock` VALUES ('000909', '数源科技');
INSERT INTO `stock` VALUES ('000910', '大亚科技');
INSERT INTO `stock` VALUES ('000911', '南宁糖业');
INSERT INTO `stock` VALUES ('000912', '泸 天 化');
INSERT INTO `stock` VALUES ('000913', '钱江摩托');
INSERT INTO `stock` VALUES ('000915', '山大华特');
INSERT INTO `stock` VALUES ('000916', '华北高速');
INSERT INTO `stock` VALUES ('000917', '电广传媒');
INSERT INTO `stock` VALUES ('000918', '嘉凯城  ');
INSERT INTO `stock` VALUES ('000919', '金陵药业');
INSERT INTO `stock` VALUES ('000920', '南方汇通');
INSERT INTO `stock` VALUES ('000921', 'ST 科 龙');
INSERT INTO `stock` VALUES ('000922', '*ST阿继 ');
INSERT INTO `stock` VALUES ('000923', '河北宣工');
INSERT INTO `stock` VALUES ('000925', '众合机电');
INSERT INTO `stock` VALUES ('000926', '福星股份');
INSERT INTO `stock` VALUES ('000927', '一汽夏利');
INSERT INTO `stock` VALUES ('000928', '中钢吉炭');
INSERT INTO `stock` VALUES ('000929', '兰州黄河');
INSERT INTO `stock` VALUES ('000930', '丰原生化');
INSERT INTO `stock` VALUES ('000931', '中 关 村');
INSERT INTO `stock` VALUES ('000932', '华菱钢铁');
INSERT INTO `stock` VALUES ('000933', '神火股份');
INSERT INTO `stock` VALUES ('000935', '四川双马');
INSERT INTO `stock` VALUES ('000936', '华 西 村');
INSERT INTO `stock` VALUES ('000937', '冀中能源');
INSERT INTO `stock` VALUES ('000938', '紫光股份');
INSERT INTO `stock` VALUES ('000939', '凯迪电力');
INSERT INTO `stock` VALUES ('000948', '南天信息');
INSERT INTO `stock` VALUES ('000949', '新乡化纤');
INSERT INTO `stock` VALUES ('000950', '建峰化工');
INSERT INTO `stock` VALUES ('000951', '中国重汽');
INSERT INTO `stock` VALUES ('000952', '广济药业');
INSERT INTO `stock` VALUES ('000953', '*ST河化 ');
INSERT INTO `stock` VALUES ('000955', 'ST欣龙  ');
INSERT INTO `stock` VALUES ('000957', '中通客车');
INSERT INTO `stock` VALUES ('000958', '*ST东热 ');
INSERT INTO `stock` VALUES ('000959', '首钢股份');
INSERT INTO `stock` VALUES ('000960', '锡业股份');
INSERT INTO `stock` VALUES ('000961', '中南建设');
INSERT INTO `stock` VALUES ('000962', '东方钽业');
INSERT INTO `stock` VALUES ('000963', '华东医药');
INSERT INTO `stock` VALUES ('000965', '天保基建');
INSERT INTO `stock` VALUES ('000966', '长源电力');
INSERT INTO `stock` VALUES ('000967', '上风高科');
INSERT INTO `stock` VALUES ('000968', '煤 气 化');
INSERT INTO `stock` VALUES ('000969', '安泰科技');
INSERT INTO `stock` VALUES ('000970', '中科三环');
INSERT INTO `stock` VALUES ('000971', 'ST迈亚  ');
INSERT INTO `stock` VALUES ('000972', '新 中 基');
INSERT INTO `stock` VALUES ('000973', '佛塑股份');
INSERT INTO `stock` VALUES ('000975', '科 学 城');
INSERT INTO `stock` VALUES ('000976', '*ST春晖 ');
INSERT INTO `stock` VALUES ('000977', '浪潮信息');
INSERT INTO `stock` VALUES ('000978', '桂林旅游');
INSERT INTO `stock` VALUES ('000979', '中弘地产');
INSERT INTO `stock` VALUES ('000980', '金马股份');
INSERT INTO `stock` VALUES ('000982', '中银绒业');
INSERT INTO `stock` VALUES ('000983', '西山煤电');
INSERT INTO `stock` VALUES ('000985', '大庆华科');
INSERT INTO `stock` VALUES ('000987', '广州友谊');
INSERT INTO `stock` VALUES ('000988', '华工科技');
INSERT INTO `stock` VALUES ('000989', '九 芝 堂');
INSERT INTO `stock` VALUES ('000990', '诚志股份');
INSERT INTO `stock` VALUES ('000993', '闽东电力');
INSERT INTO `stock` VALUES ('000995', 'ST皇台  ');
INSERT INTO `stock` VALUES ('000996', '中国中期');
INSERT INTO `stock` VALUES ('000997', '新 大 陆');
INSERT INTO `stock` VALUES ('000998', '隆平高科');
INSERT INTO `stock` VALUES ('000999', '华润三九');
INSERT INTO `stock` VALUES ('001696', '宗申动力');
INSERT INTO `stock` VALUES ('001896', '*ST豫能 ');
INSERT INTO `stock` VALUES ('002001', '新 和 成');
INSERT INTO `stock` VALUES ('002002', 'ST琼花  ');
INSERT INTO `stock` VALUES ('002003', '伟星股份');
INSERT INTO `stock` VALUES ('002004', '华邦制药');
INSERT INTO `stock` VALUES ('002005', '德豪润达');
INSERT INTO `stock` VALUES ('002006', '精功科技');
INSERT INTO `stock` VALUES ('002007', '华兰生物');
INSERT INTO `stock` VALUES ('002008', '大族激光');
INSERT INTO `stock` VALUES ('002009', '天奇股份');
INSERT INTO `stock` VALUES ('002010', '传化股份');
INSERT INTO `stock` VALUES ('002011', '盾安环境');
INSERT INTO `stock` VALUES ('002012', '凯恩股份');
INSERT INTO `stock` VALUES ('002013', '中航精机');
INSERT INTO `stock` VALUES ('002014', '永新股份');
INSERT INTO `stock` VALUES ('002015', '霞客环保');
INSERT INTO `stock` VALUES ('002016', '世荣兆业');
INSERT INTO `stock` VALUES ('002017', '东信和平');
INSERT INTO `stock` VALUES ('002018', '华星化工');
INSERT INTO `stock` VALUES ('002019', '鑫富药业');
INSERT INTO `stock` VALUES ('002020', '京新药业');
INSERT INTO `stock` VALUES ('002021', '中捷股份');
INSERT INTO `stock` VALUES ('002022', '科华生物');
INSERT INTO `stock` VALUES ('002023', '海特高新');
INSERT INTO `stock` VALUES ('002024', '苏宁电器');
INSERT INTO `stock` VALUES ('002025', '航天电器');
INSERT INTO `stock` VALUES ('002026', '山东威达');
INSERT INTO `stock` VALUES ('002027', '七喜控股');
INSERT INTO `stock` VALUES ('002028', '思源电气');
INSERT INTO `stock` VALUES ('002029', '七 匹 狼');
INSERT INTO `stock` VALUES ('002030', '达安基因');
INSERT INTO `stock` VALUES ('002031', '巨轮股份');
INSERT INTO `stock` VALUES ('002032', '苏 泊 尔');
INSERT INTO `stock` VALUES ('002033', '丽江旅游');
INSERT INTO `stock` VALUES ('002034', '美 欣 达');
INSERT INTO `stock` VALUES ('002035', '华帝股份');
INSERT INTO `stock` VALUES ('002036', '宜科科技');
INSERT INTO `stock` VALUES ('002037', '久联发展');
INSERT INTO `stock` VALUES ('002038', '双鹭药业');
INSERT INTO `stock` VALUES ('002039', '黔源电力');
INSERT INTO `stock` VALUES ('002040', '南 京 港');
INSERT INTO `stock` VALUES ('002041', '登海种业');
INSERT INTO `stock` VALUES ('002042', '华孚色纺');
INSERT INTO `stock` VALUES ('002043', '兔 宝 宝');
INSERT INTO `stock` VALUES ('002044', '江苏三友');
INSERT INTO `stock` VALUES ('002045', '广州国光');
INSERT INTO `stock` VALUES ('002046', '轴研科技');
INSERT INTO `stock` VALUES ('002047', '成霖股份');
INSERT INTO `stock` VALUES ('002048', '宁波华翔');
INSERT INTO `stock` VALUES ('002049', '晶源电子');
INSERT INTO `stock` VALUES ('002050', '三花股份');
INSERT INTO `stock` VALUES ('002051', '中工国际');
INSERT INTO `stock` VALUES ('002052', '同洲电子');
INSERT INTO `stock` VALUES ('002053', '云南盐化');
INSERT INTO `stock` VALUES ('002054', '德美化工');
INSERT INTO `stock` VALUES ('002055', '得润电子');
INSERT INTO `stock` VALUES ('002056', '横店东磁');
INSERT INTO `stock` VALUES ('002057', '中钢天源');
INSERT INTO `stock` VALUES ('002058', '威 尔 泰');
INSERT INTO `stock` VALUES ('002059', '云南旅游');
INSERT INTO `stock` VALUES ('002060', '粤 水 电');
INSERT INTO `stock` VALUES ('002061', '江山化工');
INSERT INTO `stock` VALUES ('002062', '宏润建设');
INSERT INTO `stock` VALUES ('002063', '远光软件');
INSERT INTO `stock` VALUES ('002064', '华峰氨纶');
INSERT INTO `stock` VALUES ('002065', '东华软件');
INSERT INTO `stock` VALUES ('002066', '瑞泰科技');
INSERT INTO `stock` VALUES ('002067', '景兴纸业');
INSERT INTO `stock` VALUES ('002068', '黑猫股份');
INSERT INTO `stock` VALUES ('002069', '獐 子 岛');
INSERT INTO `stock` VALUES ('002070', '众和股份');
INSERT INTO `stock` VALUES ('002071', '江苏宏宝');
INSERT INTO `stock` VALUES ('002072', '*ST德棉 ');
INSERT INTO `stock` VALUES ('002073', '软控股份');
INSERT INTO `stock` VALUES ('002074', '东源电器');
INSERT INTO `stock` VALUES ('002076', '雪 莱 特');
INSERT INTO `stock` VALUES ('002077', '大港股份');
INSERT INTO `stock` VALUES ('002078', '太阳纸业');
INSERT INTO `stock` VALUES ('002079', '苏州固锝');
INSERT INTO `stock` VALUES ('002080', '中材科技');
INSERT INTO `stock` VALUES ('002081', '金 螳 螂');
INSERT INTO `stock` VALUES ('002082', '栋梁新材');
INSERT INTO `stock` VALUES ('002083', '孚日股份');
INSERT INTO `stock` VALUES ('002084', '海鸥卫浴');
INSERT INTO `stock` VALUES ('002085', '万丰奥威');
INSERT INTO `stock` VALUES ('002086', '东方海洋');
INSERT INTO `stock` VALUES ('002087', '新野纺织');
INSERT INTO `stock` VALUES ('002088', '鲁阳股份');
INSERT INTO `stock` VALUES ('002089', '新 海 宜');
INSERT INTO `stock` VALUES ('002090', '金智科技');
INSERT INTO `stock` VALUES ('002091', '江苏国泰');
INSERT INTO `stock` VALUES ('002092', '中泰化学');
INSERT INTO `stock` VALUES ('002093', '国脉科技');
INSERT INTO `stock` VALUES ('002094', '青岛金王');
INSERT INTO `stock` VALUES ('002095', '生 意 宝');
INSERT INTO `stock` VALUES ('002096', '南岭民爆');
INSERT INTO `stock` VALUES ('002097', '山河智能');
INSERT INTO `stock` VALUES ('002098', '浔兴股份');
INSERT INTO `stock` VALUES ('002099', '海翔药业');
INSERT INTO `stock` VALUES ('002100', '天康生物');
INSERT INTO `stock` VALUES ('002101', '广东鸿图');
INSERT INTO `stock` VALUES ('002102', '冠福家用');
INSERT INTO `stock` VALUES ('002103', '广博股份');
INSERT INTO `stock` VALUES ('002104', '恒宝股份');
INSERT INTO `stock` VALUES ('002105', '信隆实业');
INSERT INTO `stock` VALUES ('002106', '莱宝高科');
INSERT INTO `stock` VALUES ('002107', '沃华医药');
INSERT INTO `stock` VALUES ('002108', '沧州明珠');
INSERT INTO `stock` VALUES ('002109', '兴化股份');
INSERT INTO `stock` VALUES ('002110', '三钢闽光');
INSERT INTO `stock` VALUES ('002111', '威海广泰');
INSERT INTO `stock` VALUES ('002112', '三变科技');
INSERT INTO `stock` VALUES ('002113', 'ST天润  ');
INSERT INTO `stock` VALUES ('002114', '罗平锌电');
INSERT INTO `stock` VALUES ('002115', '三维通信');
INSERT INTO `stock` VALUES ('002116', '中国海诚');
INSERT INTO `stock` VALUES ('002117', '东港股份');
INSERT INTO `stock` VALUES ('002118', '紫鑫药业');
INSERT INTO `stock` VALUES ('002119', '康强电子');
INSERT INTO `stock` VALUES ('002120', '新海股份');
INSERT INTO `stock` VALUES ('002121', '科陆电子');
INSERT INTO `stock` VALUES ('002122', '天马股份');
INSERT INTO `stock` VALUES ('002123', '荣信股份');
INSERT INTO `stock` VALUES ('002124', '天邦股份');
INSERT INTO `stock` VALUES ('002125', '湘潭电化');
INSERT INTO `stock` VALUES ('002126', '银轮股份');
INSERT INTO `stock` VALUES ('002127', '新民科技');
INSERT INTO `stock` VALUES ('002128', '露天煤业');
INSERT INTO `stock` VALUES ('002129', '中环股份');
INSERT INTO `stock` VALUES ('002130', '沃尔核材');
INSERT INTO `stock` VALUES ('002131', '利欧股份');
INSERT INTO `stock` VALUES ('002132', '恒星科技');
INSERT INTO `stock` VALUES ('002133', '广宇集团');
INSERT INTO `stock` VALUES ('002134', '天津普林');
INSERT INTO `stock` VALUES ('002135', '东南网架');
INSERT INTO `stock` VALUES ('002136', '安 纳 达');
INSERT INTO `stock` VALUES ('002137', '实 益 达');
INSERT INTO `stock` VALUES ('002138', '顺络电子');
INSERT INTO `stock` VALUES ('002139', '拓邦股份');
INSERT INTO `stock` VALUES ('002140', '东华科技');
INSERT INTO `stock` VALUES ('002141', '蓉胜超微');
INSERT INTO `stock` VALUES ('002142', '宁波银行');
INSERT INTO `stock` VALUES ('002143', '高金食品');
INSERT INTO `stock` VALUES ('002144', '宏达高科');
INSERT INTO `stock` VALUES ('002145', '*ST钛白 ');
INSERT INTO `stock` VALUES ('002146', '荣盛发展');
INSERT INTO `stock` VALUES ('002147', '方圆支承');
INSERT INTO `stock` VALUES ('002148', '北纬通信');
INSERT INTO `stock` VALUES ('002149', '西部材料');
INSERT INTO `stock` VALUES ('002150', '江苏通润');
INSERT INTO `stock` VALUES ('002151', '北斗星通');
INSERT INTO `stock` VALUES ('002152', '广电运通');
INSERT INTO `stock` VALUES ('002153', '石基信息');
INSERT INTO `stock` VALUES ('002154', '报 喜 鸟');
INSERT INTO `stock` VALUES ('002155', '辰州矿业');
INSERT INTO `stock` VALUES ('002156', '通富微电');
INSERT INTO `stock` VALUES ('002157', '正邦科技');
INSERT INTO `stock` VALUES ('002158', '汉钟精机');
INSERT INTO `stock` VALUES ('002159', '三特索道');
INSERT INTO `stock` VALUES ('002160', '常铝股份');
INSERT INTO `stock` VALUES ('002161', '远 望 谷');
INSERT INTO `stock` VALUES ('002162', '斯 米 克');
INSERT INTO `stock` VALUES ('002163', '中航三鑫');
INSERT INTO `stock` VALUES ('002164', '东力传动');
INSERT INTO `stock` VALUES ('002165', '红 宝 丽');
INSERT INTO `stock` VALUES ('002166', '莱茵生物');
INSERT INTO `stock` VALUES ('002167', '东方锆业');
INSERT INTO `stock` VALUES ('002168', '深圳惠程');
INSERT INTO `stock` VALUES ('002169', '智光电气');
INSERT INTO `stock` VALUES ('002170', '芭田股份');
INSERT INTO `stock` VALUES ('002171', '精诚铜业');
INSERT INTO `stock` VALUES ('002172', '澳洋科技');
INSERT INTO `stock` VALUES ('002173', '山 下 湖');
INSERT INTO `stock` VALUES ('002174', '梅 花 伞');
INSERT INTO `stock` VALUES ('002175', '广陆数测');
INSERT INTO `stock` VALUES ('002176', '江特电机');
INSERT INTO `stock` VALUES ('002177', '御银股份');
INSERT INTO `stock` VALUES ('002178', '延华智能');
INSERT INTO `stock` VALUES ('002179', '中航光电');
INSERT INTO `stock` VALUES ('002180', '万 力 达');
INSERT INTO `stock` VALUES ('002181', '粤 传 媒');
INSERT INTO `stock` VALUES ('002182', '云海金属');
INSERT INTO `stock` VALUES ('002183', '怡 亚 通');
INSERT INTO `stock` VALUES ('002184', '海得控制');
INSERT INTO `stock` VALUES ('002185', '华天科技');
INSERT INTO `stock` VALUES ('002186', '全 聚 德');
INSERT INTO `stock` VALUES ('002187', '广百股份');
INSERT INTO `stock` VALUES ('002188', '新 嘉 联');
INSERT INTO `stock` VALUES ('002189', '利达光电');
INSERT INTO `stock` VALUES ('002190', '成飞集成');
INSERT INTO `stock` VALUES ('002191', '劲嘉股份');
INSERT INTO `stock` VALUES ('002192', '路翔股份');
INSERT INTO `stock` VALUES ('002193', '山东如意');
INSERT INTO `stock` VALUES ('002194', '武汉凡谷');
INSERT INTO `stock` VALUES ('002195', '海隆软件');
INSERT INTO `stock` VALUES ('002196', '方正电机');
INSERT INTO `stock` VALUES ('002197', '证通电子');
INSERT INTO `stock` VALUES ('002198', '嘉应制药');
INSERT INTO `stock` VALUES ('002199', '东晶电子');
INSERT INTO `stock` VALUES ('002200', '绿 大 地');
INSERT INTO `stock` VALUES ('002201', '九鼎新材');
INSERT INTO `stock` VALUES ('002202', '金风科技');
INSERT INTO `stock` VALUES ('002203', '海亮股份');
INSERT INTO `stock` VALUES ('002204', '华锐铸钢');
INSERT INTO `stock` VALUES ('002205', '国统股份');
INSERT INTO `stock` VALUES ('002206', '海 利 得');
INSERT INTO `stock` VALUES ('002207', '准油股份');
INSERT INTO `stock` VALUES ('002208', '合肥城建');
INSERT INTO `stock` VALUES ('002209', '达 意 隆');
INSERT INTO `stock` VALUES ('002210', '飞马国际');
INSERT INTO `stock` VALUES ('002211', '宏达新材');
INSERT INTO `stock` VALUES ('002212', '南洋股份');
INSERT INTO `stock` VALUES ('002213', '特 尔 佳');
INSERT INTO `stock` VALUES ('002214', '大立科技');
INSERT INTO `stock` VALUES ('002215', '诺 普 信');
INSERT INTO `stock` VALUES ('002216', '三全食品');
INSERT INTO `stock` VALUES ('002217', '联合化工');
INSERT INTO `stock` VALUES ('002218', '拓日新能');
INSERT INTO `stock` VALUES ('002219', '独 一 味');
INSERT INTO `stock` VALUES ('002220', '天宝股份');
INSERT INTO `stock` VALUES ('002221', '东华能源');
INSERT INTO `stock` VALUES ('002222', '福晶科技');
INSERT INTO `stock` VALUES ('002223', '鱼跃医疗');
INSERT INTO `stock` VALUES ('002224', '三 力 士');
INSERT INTO `stock` VALUES ('002225', '濮耐股份');
INSERT INTO `stock` VALUES ('002226', '江南化工');
INSERT INTO `stock` VALUES ('002227', '奥 特 迅');
INSERT INTO `stock` VALUES ('002228', '合兴包装');
INSERT INTO `stock` VALUES ('002229', '鸿博股份');
INSERT INTO `stock` VALUES ('002230', '科大讯飞');
INSERT INTO `stock` VALUES ('002231', '奥维通信');
INSERT INTO `stock` VALUES ('002232', '启明信息');
INSERT INTO `stock` VALUES ('002233', '塔牌集团');
INSERT INTO `stock` VALUES ('002234', '民和股份');
INSERT INTO `stock` VALUES ('002235', '安妮股份');
INSERT INTO `stock` VALUES ('002236', '大华股份');
INSERT INTO `stock` VALUES ('002237', '恒邦股份');
INSERT INTO `stock` VALUES ('002238', '天威视讯');
INSERT INTO `stock` VALUES ('002239', '金 飞 达');
INSERT INTO `stock` VALUES ('002240', '威华股份');
INSERT INTO `stock` VALUES ('002241', '歌尔声学');
INSERT INTO `stock` VALUES ('002242', '九阳股份');
INSERT INTO `stock` VALUES ('002243', '通产丽星');
INSERT INTO `stock` VALUES ('002244', '滨江集团');
INSERT INTO `stock` VALUES ('002245', '澳洋顺昌');
INSERT INTO `stock` VALUES ('002246', '北化股份');
INSERT INTO `stock` VALUES ('002247', '帝龙新材');
INSERT INTO `stock` VALUES ('002248', '华东数控');
INSERT INTO `stock` VALUES ('002249', '大洋电机');
INSERT INTO `stock` VALUES ('002250', '联化科技');
INSERT INTO `stock` VALUES ('002251', '步 步 高');
INSERT INTO `stock` VALUES ('002252', '上海莱士');
INSERT INTO `stock` VALUES ('002253', '川大智胜');
INSERT INTO `stock` VALUES ('002254', '烟台氨纶');
INSERT INTO `stock` VALUES ('002255', '海陆重工');
INSERT INTO `stock` VALUES ('002256', '彩虹精化');
INSERT INTO `stock` VALUES ('002258', '利尔化学');
INSERT INTO `stock` VALUES ('002259', '升达林业');
INSERT INTO `stock` VALUES ('002260', '伊 立 浦');
INSERT INTO `stock` VALUES ('002261', '拓维信息');
INSERT INTO `stock` VALUES ('002262', '恩华药业');
INSERT INTO `stock` VALUES ('002263', '大 东 南');
INSERT INTO `stock` VALUES ('002264', '新 华 都');
INSERT INTO `stock` VALUES ('002265', '西仪股份');
INSERT INTO `stock` VALUES ('002266', '浙富股份');
INSERT INTO `stock` VALUES ('002267', '陕天然气');
INSERT INTO `stock` VALUES ('002268', '卫 士 通');
INSERT INTO `stock` VALUES ('002269', '美邦服饰');
INSERT INTO `stock` VALUES ('002270', '法因数控');
INSERT INTO `stock` VALUES ('002271', '东方雨虹');
INSERT INTO `stock` VALUES ('002272', '川润股份');
INSERT INTO `stock` VALUES ('002273', '水晶光电');
INSERT INTO `stock` VALUES ('002274', '华昌化工');
INSERT INTO `stock` VALUES ('002275', '桂林三金');
INSERT INTO `stock` VALUES ('002276', '万马电缆');
INSERT INTO `stock` VALUES ('002277', '友阿股份');
INSERT INTO `stock` VALUES ('002278', '神开股份');
INSERT INTO `stock` VALUES ('002279', '久其软件');
INSERT INTO `stock` VALUES ('002280', '新世纪  ');
INSERT INTO `stock` VALUES ('002281', '光迅科技');
INSERT INTO `stock` VALUES ('002282', '博深工具');
INSERT INTO `stock` VALUES ('002283', '天润曲轴');
INSERT INTO `stock` VALUES ('002284', '亚太股份');
INSERT INTO `stock` VALUES ('002285', '世联地产');
INSERT INTO `stock` VALUES ('002286', '保龄宝  ');
INSERT INTO `stock` VALUES ('002287', '奇正藏药');
INSERT INTO `stock` VALUES ('002288', '超华科技');
INSERT INTO `stock` VALUES ('002289', '宇顺电子');
INSERT INTO `stock` VALUES ('002290', '禾盛新材');
INSERT INTO `stock` VALUES ('002291', '星期六  ');
INSERT INTO `stock` VALUES ('002292', '奥飞动漫');
INSERT INTO `stock` VALUES ('002293', '罗莱家纺');
INSERT INTO `stock` VALUES ('002294', '信立泰  ');
INSERT INTO `stock` VALUES ('002295', '精艺股份');
INSERT INTO `stock` VALUES ('002296', '辉煌科技');
INSERT INTO `stock` VALUES ('002297', '博云新材');
INSERT INTO `stock` VALUES ('002298', '鑫龙电器');
INSERT INTO `stock` VALUES ('002299', '圣农发展');
INSERT INTO `stock` VALUES ('002300', '太阳电缆');
INSERT INTO `stock` VALUES ('002301', '齐心文具');
INSERT INTO `stock` VALUES ('002302', '西部建设');
INSERT INTO `stock` VALUES ('002303', '美盈森  ');
INSERT INTO `stock` VALUES ('002304', '洋河股份');
INSERT INTO `stock` VALUES ('002305', '南国置业');
INSERT INTO `stock` VALUES ('002306', '湘鄂情  ');
INSERT INTO `stock` VALUES ('002307', '北新路桥');
INSERT INTO `stock` VALUES ('002308', '威创股份');
INSERT INTO `stock` VALUES ('002309', '中利科技');
INSERT INTO `stock` VALUES ('002310', '东方园林');
INSERT INTO `stock` VALUES ('002311', '海大集团');
INSERT INTO `stock` VALUES ('002312', '三泰电子');
INSERT INTO `stock` VALUES ('002313', '日海通讯');
INSERT INTO `stock` VALUES ('002314', '雅致股份');
INSERT INTO `stock` VALUES ('002315', '焦点科技');
INSERT INTO `stock` VALUES ('002316', '键桥通讯');
INSERT INTO `stock` VALUES ('002317', '众生药业');
INSERT INTO `stock` VALUES ('002318', '久立特材');
INSERT INTO `stock` VALUES ('002319', '乐通股份');
INSERT INTO `stock` VALUES ('002320', '海峡股份');
INSERT INTO `stock` VALUES ('002321', '华英农业');
INSERT INTO `stock` VALUES ('002322', '理工监测');
INSERT INTO `stock` VALUES ('002323', '中联电气');
INSERT INTO `stock` VALUES ('002324', '普利特  ');
INSERT INTO `stock` VALUES ('002325', '洪涛股份');
INSERT INTO `stock` VALUES ('002326', '永太科技');
INSERT INTO `stock` VALUES ('002327', '富安娜  ');
INSERT INTO `stock` VALUES ('002328', '新朋股份');
INSERT INTO `stock` VALUES ('002329', '皇氏乳业');
INSERT INTO `stock` VALUES ('002330', '得利斯  ');
INSERT INTO `stock` VALUES ('002331', '皖通科技');
INSERT INTO `stock` VALUES ('002332', '仙琚制药');
INSERT INTO `stock` VALUES ('002333', '罗普斯金');
INSERT INTO `stock` VALUES ('002334', '英威腾  ');
INSERT INTO `stock` VALUES ('002335', '科华恒盛');
INSERT INTO `stock` VALUES ('002336', '人人乐  ');
INSERT INTO `stock` VALUES ('002337', '赛象科技');
INSERT INTO `stock` VALUES ('002338', '奥普光电');
INSERT INTO `stock` VALUES ('002339', '积成电子');
INSERT INTO `stock` VALUES ('002340', '格林美  ');
INSERT INTO `stock` VALUES ('002341', '新纶科技');
INSERT INTO `stock` VALUES ('002342', '巨力索具');
INSERT INTO `stock` VALUES ('002343', '禾欣股份');
INSERT INTO `stock` VALUES ('002344', '海宁皮城');
INSERT INTO `stock` VALUES ('002345', '潮宏基  ');
INSERT INTO `stock` VALUES ('002346', '柘中建设');
INSERT INTO `stock` VALUES ('002347', '泰尔重工');
INSERT INTO `stock` VALUES ('002348', '高乐股份');
INSERT INTO `stock` VALUES ('002349', '精华制药');
INSERT INTO `stock` VALUES ('002350', '北京科锐');
INSERT INTO `stock` VALUES ('002351', '漫步者  ');
INSERT INTO `stock` VALUES ('002352', '鼎泰新材');
INSERT INTO `stock` VALUES ('002353', '杰瑞股份');
INSERT INTO `stock` VALUES ('002354', '科冕木业');
INSERT INTO `stock` VALUES ('002355', '兴民钢圈');
INSERT INTO `stock` VALUES ('002356', '浩宁达  ');
INSERT INTO `stock` VALUES ('002357', '富临运业');
INSERT INTO `stock` VALUES ('002358', '森源电气');
INSERT INTO `stock` VALUES ('002359', '齐星铁塔');
INSERT INTO `stock` VALUES ('002360', '同德化工');
INSERT INTO `stock` VALUES ('002361', '神剑股份');
INSERT INTO `stock` VALUES ('002362', '汉王科技');
INSERT INTO `stock` VALUES ('002363', '隆基机械');
INSERT INTO `stock` VALUES ('002364', '中恒电气');
INSERT INTO `stock` VALUES ('002365', '永安药业');
INSERT INTO `stock` VALUES ('002366', '丹甫股份');
INSERT INTO `stock` VALUES ('002367', '康力电梯');
INSERT INTO `stock` VALUES ('002368', '太极股份');
INSERT INTO `stock` VALUES ('002369', '卓翼科技');
INSERT INTO `stock` VALUES ('002370', '亚太药业');
INSERT INTO `stock` VALUES ('002371', '七星电子');
INSERT INTO `stock` VALUES ('002372', '伟星新材');
INSERT INTO `stock` VALUES ('002373', '联信永益');
INSERT INTO `stock` VALUES ('002374', '丽鹏股份');
INSERT INTO `stock` VALUES ('002375', '亚厦股份');
INSERT INTO `stock` VALUES ('002376', '新北洋  ');
INSERT INTO `stock` VALUES ('002377', '国创高新');
INSERT INTO `stock` VALUES ('002378', '章源钨业');
INSERT INTO `stock` VALUES ('002379', '鲁丰股份');
INSERT INTO `stock` VALUES ('002380', '科远股份');
INSERT INTO `stock` VALUES ('002381', '双箭股份');
INSERT INTO `stock` VALUES ('002382', '蓝帆股份');
INSERT INTO `stock` VALUES ('002383', '合众思壮');
INSERT INTO `stock` VALUES ('002384', '东山精密');
INSERT INTO `stock` VALUES ('002385', '大北农  ');
INSERT INTO `stock` VALUES ('002386', '天原集团');
INSERT INTO `stock` VALUES ('002387', '黑牛食品');
INSERT INTO `stock` VALUES ('002388', '新亚制程');
INSERT INTO `stock` VALUES ('002389', '南洋科技');
INSERT INTO `stock` VALUES ('002390', '信邦制药');
INSERT INTO `stock` VALUES ('002391', '长青股份');
INSERT INTO `stock` VALUES ('002392', '北京利尔');
INSERT INTO `stock` VALUES ('002393', '力生制药');
INSERT INTO `stock` VALUES ('002394', '联发股份');
INSERT INTO `stock` VALUES ('002395', '双象股份');
INSERT INTO `stock` VALUES ('002396', '星网锐捷');
INSERT INTO `stock` VALUES ('002397', '梦洁家纺');
INSERT INTO `stock` VALUES ('002398', '建研集团');
INSERT INTO `stock` VALUES ('002399', '海普瑞  ');
INSERT INTO `stock` VALUES ('002400', '省广股份');
INSERT INTO `stock` VALUES ('002401', '交技发展');
INSERT INTO `stock` VALUES ('002402', '和而泰  ');
INSERT INTO `stock` VALUES ('002403', '爱仕达  ');
INSERT INTO `stock` VALUES ('002404', '嘉欣丝绸');
INSERT INTO `stock` VALUES ('002405', '四维图新');
INSERT INTO `stock` VALUES ('002406', '远东传动');
INSERT INTO `stock` VALUES ('002407', '多氟多  ');
INSERT INTO `stock` VALUES ('002408', '齐翔腾达');
INSERT INTO `stock` VALUES ('002409', '雅克科技');
INSERT INTO `stock` VALUES ('002410', '广联达  ');
INSERT INTO `stock` VALUES ('002411', '九九久  ');
INSERT INTO `stock` VALUES ('002412', '汉森制药');
INSERT INTO `stock` VALUES ('002413', '常发股份');
INSERT INTO `stock` VALUES ('002414', '高德红外');
INSERT INTO `stock` VALUES ('002415', '海康威视');
INSERT INTO `stock` VALUES ('002416', '爱施德  ');
INSERT INTO `stock` VALUES ('002417', '三元达  ');
INSERT INTO `stock` VALUES ('002418', '康盛股份');
INSERT INTO `stock` VALUES ('002419', '天虹商场');
INSERT INTO `stock` VALUES ('002420', '毅昌股份');
INSERT INTO `stock` VALUES ('002421', '达实智能');
INSERT INTO `stock` VALUES ('002422', '科伦药业');
INSERT INTO `stock` VALUES ('002423', '中原特钢');
INSERT INTO `stock` VALUES ('002424', '贵州百灵');
INSERT INTO `stock` VALUES ('002425', '凯撒股份');
INSERT INTO `stock` VALUES ('002426', '胜利精密');
INSERT INTO `stock` VALUES ('002427', '尤夫股份');
INSERT INTO `stock` VALUES ('002428', '云南锗业');
INSERT INTO `stock` VALUES ('002429', '兆驰股份');
INSERT INTO `stock` VALUES ('002430', '杭氧股份');
INSERT INTO `stock` VALUES ('002431', '棕榈园林');
INSERT INTO `stock` VALUES ('002432', '九安医疗');
INSERT INTO `stock` VALUES ('002433', '太安堂  ');
INSERT INTO `stock` VALUES ('002434', '万里扬  ');
INSERT INTO `stock` VALUES ('002435', '长江润发');
INSERT INTO `stock` VALUES ('002436', '兴森科技');
INSERT INTO `stock` VALUES ('002437', '誉衡药业');
INSERT INTO `stock` VALUES ('002438', '江苏神通');
INSERT INTO `stock` VALUES ('002439', '启明星辰');
INSERT INTO `stock` VALUES ('002440', '闰土股份');
INSERT INTO `stock` VALUES ('002441', '众业达  ');
INSERT INTO `stock` VALUES ('002442', '龙星化工');
INSERT INTO `stock` VALUES ('002443', '金洲管道');
INSERT INTO `stock` VALUES ('002444', '巨星科技');
INSERT INTO `stock` VALUES ('002445', '中南重工');
INSERT INTO `stock` VALUES ('002446', '盛路通信');
INSERT INTO `stock` VALUES ('002447', '壹桥苗业');
INSERT INTO `stock` VALUES ('002448', '中原内配');
INSERT INTO `stock` VALUES ('002449', '国星光电');
INSERT INTO `stock` VALUES ('002450', '康得新  ');
INSERT INTO `stock` VALUES ('002451', '摩恩电气');
INSERT INTO `stock` VALUES ('002452', '长高集团');
INSERT INTO `stock` VALUES ('002453', '天马精化');
INSERT INTO `stock` VALUES ('002454', '松芝股份');
INSERT INTO `stock` VALUES ('002455', '百川股份');
INSERT INTO `stock` VALUES ('002456', '欧菲光  ');
INSERT INTO `stock` VALUES ('002457', '青龙管业');
INSERT INTO `stock` VALUES ('002458', '益生股份');
INSERT INTO `stock` VALUES ('002459', '天业通联');
INSERT INTO `stock` VALUES ('002460', '赣锋锂业');
INSERT INTO `stock` VALUES ('002461', '珠江啤酒');
INSERT INTO `stock` VALUES ('002462', '嘉事堂  ');
INSERT INTO `stock` VALUES ('002463', '沪电股份');
INSERT INTO `stock` VALUES ('002464', '金利科技');
INSERT INTO `stock` VALUES ('002465', '海格通信');
INSERT INTO `stock` VALUES ('002466', '天齐锂业');
INSERT INTO `stock` VALUES ('002467', '二六三  ');
INSERT INTO `stock` VALUES ('002468', '艾迪西  ');
INSERT INTO `stock` VALUES ('002469', '三维工程');
INSERT INTO `stock` VALUES ('002470', '金正大  ');
INSERT INTO `stock` VALUES ('002471', '中超电缆');
INSERT INTO `stock` VALUES ('002472', '双环传动');
INSERT INTO `stock` VALUES ('002473', '圣莱达  ');
INSERT INTO `stock` VALUES ('002474', '榕基软件');
INSERT INTO `stock` VALUES ('002475', '立讯精密');
INSERT INTO `stock` VALUES ('002476', '宝莫股份');
INSERT INTO `stock` VALUES ('002477', '雏鹰农牧');
INSERT INTO `stock` VALUES ('002478', '常宝股份');
INSERT INTO `stock` VALUES ('002479', '富春环保');
INSERT INTO `stock` VALUES ('002480', '新筑股份');
INSERT INTO `stock` VALUES ('002481', '双塔食品');
INSERT INTO `stock` VALUES ('002482', '广田股份');
INSERT INTO `stock` VALUES ('002483', '润邦股份');
INSERT INTO `stock` VALUES ('002484', '江海股份');
INSERT INTO `stock` VALUES ('002485', '希努尔  ');
INSERT INTO `stock` VALUES ('002486', '嘉麟杰  ');
INSERT INTO `stock` VALUES ('002487', '大金重工');
INSERT INTO `stock` VALUES ('002488', '金固股份');
INSERT INTO `stock` VALUES ('002489', '浙江永强');
INSERT INTO `stock` VALUES ('002490', '山东墨龙');
INSERT INTO `stock` VALUES ('002491', '通鼎光电');
INSERT INTO `stock` VALUES ('002492', '恒基达鑫');
INSERT INTO `stock` VALUES ('002493', '荣盛石化');
INSERT INTO `stock` VALUES ('002494', '华斯股份');
INSERT INTO `stock` VALUES ('002495', '佳隆股份');
INSERT INTO `stock` VALUES ('002496', '辉丰股份');
INSERT INTO `stock` VALUES ('002497', '雅化集团');
INSERT INTO `stock` VALUES ('002498', '汉缆股份');
INSERT INTO `stock` VALUES ('002499', '科林环保');
INSERT INTO `stock` VALUES ('002500', '山西证券');
INSERT INTO `stock` VALUES ('002501', '利源铝业');
INSERT INTO `stock` VALUES ('002502', '骅威股份');
INSERT INTO `stock` VALUES ('002503', '搜于特  ');
INSERT INTO `stock` VALUES ('002504', '东光微电');
INSERT INTO `stock` VALUES ('002505', '大康牧业');
INSERT INTO `stock` VALUES ('002506', '超日太阳');
INSERT INTO `stock` VALUES ('002507', '涪陵榨菜');
INSERT INTO `stock` VALUES ('002508', '老板电器');
INSERT INTO `stock` VALUES ('002509', '天广消防');
INSERT INTO `stock` VALUES ('002510', '天汽模  ');
INSERT INTO `stock` VALUES ('002511', '中顺洁柔');
INSERT INTO `stock` VALUES ('002512', '达华智能');
INSERT INTO `stock` VALUES ('002513', '蓝丰生化');
INSERT INTO `stock` VALUES ('002514', '宝馨科技');
INSERT INTO `stock` VALUES ('002515', '金字火腿');
INSERT INTO `stock` VALUES ('002516', '江苏旷达');
INSERT INTO `stock` VALUES ('002517', '泰亚股份');
INSERT INTO `stock` VALUES ('002518', '科士达  ');
INSERT INTO `stock` VALUES ('002519', '银河电子');
INSERT INTO `stock` VALUES ('002520', '日发数码');
INSERT INTO `stock` VALUES ('002521', '齐峰股份');
INSERT INTO `stock` VALUES ('002522', '浙江众成');
INSERT INTO `stock` VALUES ('002523', '天桥起重');
INSERT INTO `stock` VALUES ('002524', '光正钢构');
INSERT INTO `stock` VALUES ('002526', '山东矿机');
INSERT INTO `stock` VALUES ('002527', '新时达  ');
INSERT INTO `stock` VALUES ('002528', '英飞拓  ');
INSERT INTO `stock` VALUES ('002529', '海源机械');
INSERT INTO `stock` VALUES ('002530', '丰东股份');
INSERT INTO `stock` VALUES ('002531', '天顺风能');
INSERT INTO `stock` VALUES ('002532', '新界泵业');
INSERT INTO `stock` VALUES ('002533', '金杯电工');
INSERT INTO `stock` VALUES ('002534', '杭锅股份');
INSERT INTO `stock` VALUES ('002535', '林州重机');
INSERT INTO `stock` VALUES ('002536', '西泵股份');
INSERT INTO `stock` VALUES ('002537', '海立美达');
INSERT INTO `stock` VALUES ('002538', '司尔特  ');
INSERT INTO `stock` VALUES ('002539', '新都化工');
INSERT INTO `stock` VALUES ('002540', '亚太科技');
INSERT INTO `stock` VALUES ('002541', '鸿路钢构');
INSERT INTO `stock` VALUES ('002542', '中化岩土');
INSERT INTO `stock` VALUES ('002543', '万和电气');
INSERT INTO `stock` VALUES ('002544', '杰赛科技');
INSERT INTO `stock` VALUES ('002545', '东方铁塔');
INSERT INTO `stock` VALUES ('002546', '新联电子');
INSERT INTO `stock` VALUES ('002547', '春兴精工');
INSERT INTO `stock` VALUES ('002548', '金新农  ');
INSERT INTO `stock` VALUES ('002549', '凯美特气');
INSERT INTO `stock` VALUES ('002550', '千红制药');
INSERT INTO `stock` VALUES ('002551', '尚荣医疗');
INSERT INTO `stock` VALUES ('002552', '宝鼎重工');
INSERT INTO `stock` VALUES ('002553', '南方轴承');
INSERT INTO `stock` VALUES ('002554', '惠博普  ');
INSERT INTO `stock` VALUES ('002555', '顺荣股份');
INSERT INTO `stock` VALUES ('002556', '辉隆股份');
INSERT INTO `stock` VALUES ('002557', '洽洽食品');
INSERT INTO `stock` VALUES ('002558', '世纪游轮');
INSERT INTO `stock` VALUES ('002559', '亚威股份');
INSERT INTO `stock` VALUES ('002560', '通达股份');
INSERT INTO `stock` VALUES ('002561', '徐家汇  ');
INSERT INTO `stock` VALUES ('002565', '上海绿新');
INSERT INTO `stock` VALUES ('002566', '益盛药业');
INSERT INTO `stock` VALUES ('300001', '特锐德  ');
INSERT INTO `stock` VALUES ('300002', '神州泰岳');
INSERT INTO `stock` VALUES ('300003', '乐普医疗');
INSERT INTO `stock` VALUES ('300004', '南风股份');
INSERT INTO `stock` VALUES ('300005', '探路者  ');
INSERT INTO `stock` VALUES ('300006', '莱美药业');
INSERT INTO `stock` VALUES ('300007', '汉威电子');
INSERT INTO `stock` VALUES ('300008', '上海佳豪');
INSERT INTO `stock` VALUES ('300009', '安科生物');
INSERT INTO `stock` VALUES ('300010', '立思辰  ');
INSERT INTO `stock` VALUES ('300011', '鼎汉技术');
INSERT INTO `stock` VALUES ('300012', '华测检测');
INSERT INTO `stock` VALUES ('300013', '新宁物流');
INSERT INTO `stock` VALUES ('300014', '亿纬锂能');
INSERT INTO `stock` VALUES ('300015', '爱尔眼科');
INSERT INTO `stock` VALUES ('300016', '北陆药业');
INSERT INTO `stock` VALUES ('300017', '网宿科技');
INSERT INTO `stock` VALUES ('300018', '中元华电');
INSERT INTO `stock` VALUES ('300019', '硅宝科技');
INSERT INTO `stock` VALUES ('300020', '银江股份');
INSERT INTO `stock` VALUES ('300021', '大禹节水');
INSERT INTO `stock` VALUES ('300022', '吉峰农机');
INSERT INTO `stock` VALUES ('300023', '宝德股份');
INSERT INTO `stock` VALUES ('300024', '机器人  ');
INSERT INTO `stock` VALUES ('300025', '华星创业');
INSERT INTO `stock` VALUES ('300026', '红日药业');
INSERT INTO `stock` VALUES ('300027', '华谊兄弟');
INSERT INTO `stock` VALUES ('300028', '金亚科技');
INSERT INTO `stock` VALUES ('300029', '天龙光电');
INSERT INTO `stock` VALUES ('300030', '阳普医疗');
INSERT INTO `stock` VALUES ('300031', '宝通带业');
INSERT INTO `stock` VALUES ('300032', '金龙机电');
INSERT INTO `stock` VALUES ('300033', '同花顺  ');
INSERT INTO `stock` VALUES ('300034', '钢研高纳');
INSERT INTO `stock` VALUES ('300035', '中科电气');
INSERT INTO `stock` VALUES ('300036', '超图软件');
INSERT INTO `stock` VALUES ('300037', '新宙邦  ');
INSERT INTO `stock` VALUES ('300038', '梅泰诺  ');
INSERT INTO `stock` VALUES ('300039', '上海凯宝');
INSERT INTO `stock` VALUES ('300040', '九洲电气');
INSERT INTO `stock` VALUES ('300041', '回天胶业');
INSERT INTO `stock` VALUES ('300042', '朗科科技');
INSERT INTO `stock` VALUES ('300043', '星辉车模');
INSERT INTO `stock` VALUES ('300044', '赛为智能');
INSERT INTO `stock` VALUES ('300045', '华力创通');
INSERT INTO `stock` VALUES ('300046', '台基股份');
INSERT INTO `stock` VALUES ('300047', '天源迪科');
INSERT INTO `stock` VALUES ('300048', '合康变频');
INSERT INTO `stock` VALUES ('300049', '福瑞股份');
INSERT INTO `stock` VALUES ('300050', '世纪鼎利');
INSERT INTO `stock` VALUES ('300051', '三五互联');
INSERT INTO `stock` VALUES ('300052', '中青宝  ');
INSERT INTO `stock` VALUES ('300053', '欧比特  ');
INSERT INTO `stock` VALUES ('300054', '鼎龙股份');
INSERT INTO `stock` VALUES ('300055', '万邦达  ');
INSERT INTO `stock` VALUES ('300056', '三维丝  ');
INSERT INTO `stock` VALUES ('300057', '万顺股份');
INSERT INTO `stock` VALUES ('300058', '蓝色光标');
INSERT INTO `stock` VALUES ('300059', '东方财富');
INSERT INTO `stock` VALUES ('300061', '康耐特  ');
INSERT INTO `stock` VALUES ('300062', '中能电气');
INSERT INTO `stock` VALUES ('300063', '天龙集团');
INSERT INTO `stock` VALUES ('300064', '豫金刚石');
INSERT INTO `stock` VALUES ('300065', '海兰信  ');
INSERT INTO `stock` VALUES ('300066', '三川股份');
INSERT INTO `stock` VALUES ('300067', '安诺其  ');
INSERT INTO `stock` VALUES ('300068', '南都电源');
INSERT INTO `stock` VALUES ('300069', '金利华电');
INSERT INTO `stock` VALUES ('300070', '碧水源  ');
INSERT INTO `stock` VALUES ('300071', '华谊嘉信');
INSERT INTO `stock` VALUES ('300072', '三聚环保');
INSERT INTO `stock` VALUES ('300073', '当升科技');
INSERT INTO `stock` VALUES ('300074', '华平股份');
INSERT INTO `stock` VALUES ('300075', '数字政通');
INSERT INTO `stock` VALUES ('300076', '宁波GQY ');
INSERT INTO `stock` VALUES ('300077', '国民技术');
INSERT INTO `stock` VALUES ('300078', '中瑞思创');
INSERT INTO `stock` VALUES ('300079', '数码视讯');
INSERT INTO `stock` VALUES ('300080', '新大新材');
INSERT INTO `stock` VALUES ('300081', '恒信移动');
INSERT INTO `stock` VALUES ('300082', '奥克股份');
INSERT INTO `stock` VALUES ('300083', '劲胜股份');
INSERT INTO `stock` VALUES ('300084', '海默科技');
INSERT INTO `stock` VALUES ('300085', '银之杰  ');
INSERT INTO `stock` VALUES ('300086', '康芝药业');
INSERT INTO `stock` VALUES ('300087', '荃银高科');
INSERT INTO `stock` VALUES ('300088', '长信科技');
INSERT INTO `stock` VALUES ('300089', '长城集团');
INSERT INTO `stock` VALUES ('300090', '盛运股份');
INSERT INTO `stock` VALUES ('300091', '金通灵  ');
INSERT INTO `stock` VALUES ('300092', '科新机电');
INSERT INTO `stock` VALUES ('300093', '金刚玻璃');
INSERT INTO `stock` VALUES ('300094', '国联水产');
INSERT INTO `stock` VALUES ('300095', '华伍股份');
INSERT INTO `stock` VALUES ('300096', '易联众  ');
INSERT INTO `stock` VALUES ('300097', '智云股份');
INSERT INTO `stock` VALUES ('300098', '高新兴  ');
INSERT INTO `stock` VALUES ('300099', '尤洛卡  ');
INSERT INTO `stock` VALUES ('300100', '双林股份');
INSERT INTO `stock` VALUES ('300101', '国腾电子');
INSERT INTO `stock` VALUES ('300102', '乾照光电');
INSERT INTO `stock` VALUES ('300103', '达刚路机');
INSERT INTO `stock` VALUES ('300104', '乐视网  ');
INSERT INTO `stock` VALUES ('300105', '龙源技术');
INSERT INTO `stock` VALUES ('300106', '西部牧业');
INSERT INTO `stock` VALUES ('300107', '建新股份');
INSERT INTO `stock` VALUES ('300108', '双龙股份');
INSERT INTO `stock` VALUES ('300109', '新开源  ');
INSERT INTO `stock` VALUES ('300110', '华仁药业');
INSERT INTO `stock` VALUES ('300111', '向日葵  ');
INSERT INTO `stock` VALUES ('300112', '万讯自控');
INSERT INTO `stock` VALUES ('300113', '顺网科技');
INSERT INTO `stock` VALUES ('300114', '中航电测');
INSERT INTO `stock` VALUES ('300115', '长盈精密');
INSERT INTO `stock` VALUES ('300116', '坚瑞消防');
INSERT INTO `stock` VALUES ('300117', '嘉寓股份');
INSERT INTO `stock` VALUES ('300118', '东方日升');
INSERT INTO `stock` VALUES ('300119', '瑞普生物');
INSERT INTO `stock` VALUES ('300120', '经纬电材');
INSERT INTO `stock` VALUES ('300121', '阳谷华泰');
INSERT INTO `stock` VALUES ('300122', '智飞生物');
INSERT INTO `stock` VALUES ('300123', '太阳鸟  ');
INSERT INTO `stock` VALUES ('300124', '汇川技术');
INSERT INTO `stock` VALUES ('300125', '易世达  ');
INSERT INTO `stock` VALUES ('300126', '锐奇股份');
INSERT INTO `stock` VALUES ('300127', '银河磁体');
INSERT INTO `stock` VALUES ('300128', '锦富新材');
INSERT INTO `stock` VALUES ('300129', '泰胜风能');
INSERT INTO `stock` VALUES ('300130', '新国都  ');
INSERT INTO `stock` VALUES ('300131', '英唐智控');
INSERT INTO `stock` VALUES ('300132', '青松股份');
INSERT INTO `stock` VALUES ('300133', '华策影视');
INSERT INTO `stock` VALUES ('300134', '大富科技');
INSERT INTO `stock` VALUES ('300135', '宝利沥青');
INSERT INTO `stock` VALUES ('300136', '信维通信');
INSERT INTO `stock` VALUES ('300137', '先河环保');
INSERT INTO `stock` VALUES ('300138', '晨光生物');
INSERT INTO `stock` VALUES ('300139', '福星晓程');
INSERT INTO `stock` VALUES ('300140', '启源装备');
INSERT INTO `stock` VALUES ('300141', '和顺电气');
INSERT INTO `stock` VALUES ('300142', '沃森生物');
INSERT INTO `stock` VALUES ('300143', '星河生物');
INSERT INTO `stock` VALUES ('300144', '宋城股份');
INSERT INTO `stock` VALUES ('300145', '南方泵业');
INSERT INTO `stock` VALUES ('300146', '汤臣倍健');
INSERT INTO `stock` VALUES ('300147', '香雪制药');
INSERT INTO `stock` VALUES ('300148', '天舟文化');
INSERT INTO `stock` VALUES ('300149', '量子高科');
INSERT INTO `stock` VALUES ('300150', '世纪瑞尔');
INSERT INTO `stock` VALUES ('300151', '昌红科技');
INSERT INTO `stock` VALUES ('300152', '燃控科技');
INSERT INTO `stock` VALUES ('300153', '科泰电源');
INSERT INTO `stock` VALUES ('300154', '瑞凌股份');
INSERT INTO `stock` VALUES ('300155', '安居宝  ');
INSERT INTO `stock` VALUES ('300156', '天立环保');
INSERT INTO `stock` VALUES ('300157', '恒泰艾普');
INSERT INTO `stock` VALUES ('300158', '振东制药');
INSERT INTO `stock` VALUES ('300159', '新研股份');
INSERT INTO `stock` VALUES ('300160', '秀强股份');
INSERT INTO `stock` VALUES ('300161', '华中数控');
INSERT INTO `stock` VALUES ('300162', '雷曼光电');
INSERT INTO `stock` VALUES ('300163', '先锋新材');
INSERT INTO `stock` VALUES ('300164', '通源石油');
INSERT INTO `stock` VALUES ('300165', '天瑞仪器');
INSERT INTO `stock` VALUES ('300166', '东方国信');
INSERT INTO `stock` VALUES ('300167', '迪威视讯');
INSERT INTO `stock` VALUES ('300168', '万达信息');
INSERT INTO `stock` VALUES ('300169', '天晟新材');
INSERT INTO `stock` VALUES ('300170', '汉得信息');
INSERT INTO `stock` VALUES ('300171', '东富龙  ');
INSERT INTO `stock` VALUES ('300172', '中电环保');
INSERT INTO `stock` VALUES ('300173', '松德股份');
INSERT INTO `stock` VALUES ('300174', '元力股份');
INSERT INTO `stock` VALUES ('300175', '朗源股份');
INSERT INTO `stock` VALUES ('300176', '鸿特精密');
INSERT INTO `stock` VALUES ('300177', '中海达  ');
INSERT INTO `stock` VALUES ('300178', '腾邦国际');
INSERT INTO `stock` VALUES ('300179', '四方达  ');
INSERT INTO `stock` VALUES ('300180', '华峰超纤');
INSERT INTO `stock` VALUES ('300181', '佐力药业');
INSERT INTO `stock` VALUES ('300182', '捷成股份');
INSERT INTO `stock` VALUES ('300183', '东软载波');
INSERT INTO `stock` VALUES ('300184', '力源信息');
INSERT INTO `stock` VALUES ('300185', '通裕重工');
INSERT INTO `stock` VALUES ('300186', '大华农  ');
INSERT INTO `stock` VALUES ('300187', '永清环保');
INSERT INTO `stock` VALUES ('600000', '浦发银行');
INSERT INTO `stock` VALUES ('600004', '白云机场');
INSERT INTO `stock` VALUES ('600005', '武钢股份');
INSERT INTO `stock` VALUES ('600006', '东风汽车');
INSERT INTO `stock` VALUES ('600007', '中国国贸');
INSERT INTO `stock` VALUES ('600008', '首创股份');
INSERT INTO `stock` VALUES ('600009', '上海机场');
INSERT INTO `stock` VALUES ('600010', '包钢股份');
INSERT INTO `stock` VALUES ('600011', '华能国际');
INSERT INTO `stock` VALUES ('600012', '皖通高速');
INSERT INTO `stock` VALUES ('600015', '华夏银行');
INSERT INTO `stock` VALUES ('600016', '民生银行');
INSERT INTO `stock` VALUES ('600017', '日照港  ');
INSERT INTO `stock` VALUES ('600018', '上港集团');
INSERT INTO `stock` VALUES ('600019', '宝钢股份');
INSERT INTO `stock` VALUES ('600020', '中原高速');
INSERT INTO `stock` VALUES ('600021', '上海电力');
INSERT INTO `stock` VALUES ('600022', '济南钢铁');
INSERT INTO `stock` VALUES ('600026', '中海发展');
INSERT INTO `stock` VALUES ('600027', '华电国际');
INSERT INTO `stock` VALUES ('600028', '中国石化');
INSERT INTO `stock` VALUES ('600029', '南方航空');
INSERT INTO `stock` VALUES ('600030', '中信证券');
INSERT INTO `stock` VALUES ('600031', '三一重工');
INSERT INTO `stock` VALUES ('600033', '福建高速');
INSERT INTO `stock` VALUES ('600035', '楚天高速');
INSERT INTO `stock` VALUES ('600036', '招商银行');
INSERT INTO `stock` VALUES ('600037', '歌华有线');
INSERT INTO `stock` VALUES ('600038', '哈飞股份');
INSERT INTO `stock` VALUES ('600039', '四川路桥');
INSERT INTO `stock` VALUES ('600048', '保利地产');
INSERT INTO `stock` VALUES ('600050', '中国联通');
INSERT INTO `stock` VALUES ('600051', '宁波联合');
INSERT INTO `stock` VALUES ('600052', '浙江广厦');
INSERT INTO `stock` VALUES ('600053', '中江地产');
INSERT INTO `stock` VALUES ('600054', '黄山旅游');
INSERT INTO `stock` VALUES ('600055', '万东医疗');
INSERT INTO `stock` VALUES ('600056', '中国医药');
INSERT INTO `stock` VALUES ('600058', '五矿发展');
INSERT INTO `stock` VALUES ('600059', '古越龙山');
INSERT INTO `stock` VALUES ('600060', '海信电器');
INSERT INTO `stock` VALUES ('600061', '中纺投资');
INSERT INTO `stock` VALUES ('600062', '双鹤药业');
INSERT INTO `stock` VALUES ('600063', '皖维高新');
INSERT INTO `stock` VALUES ('600064', '南京高科');
INSERT INTO `stock` VALUES ('600066', '宇通客车');
INSERT INTO `stock` VALUES ('600067', '冠城大通');
INSERT INTO `stock` VALUES ('600068', '葛洲坝  ');
INSERT INTO `stock` VALUES ('600069', '银鸽投资');
INSERT INTO `stock` VALUES ('600070', '浙江富润');
INSERT INTO `stock` VALUES ('600071', '凤凰光学');
INSERT INTO `stock` VALUES ('600072', '中船股份');
INSERT INTO `stock` VALUES ('600073', '上海梅林');
INSERT INTO `stock` VALUES ('600074', '中达股份');
INSERT INTO `stock` VALUES ('600075', '新疆天业');
INSERT INTO `stock` VALUES ('600076', 'ST华光  ');
INSERT INTO `stock` VALUES ('600077', '*ST百科 ');
INSERT INTO `stock` VALUES ('600078', '澄星股份');
INSERT INTO `stock` VALUES ('600079', '人福医药');
INSERT INTO `stock` VALUES ('600080', '*ST金花 ');
INSERT INTO `stock` VALUES ('600081', '东风科技');
INSERT INTO `stock` VALUES ('600082', '海泰发展');
INSERT INTO `stock` VALUES ('600083', '*ST博信 ');
INSERT INTO `stock` VALUES ('600084', '*ST中葡 ');
INSERT INTO `stock` VALUES ('600085', '同仁堂  ');
INSERT INTO `stock` VALUES ('600086', '东方金钰');
INSERT INTO `stock` VALUES ('600087', '长航油运');
INSERT INTO `stock` VALUES ('600088', '中视传媒');
INSERT INTO `stock` VALUES ('600089', '特变电工');
INSERT INTO `stock` VALUES ('600090', '啤酒花  ');
INSERT INTO `stock` VALUES ('600091', '*ST明科 ');
INSERT INTO `stock` VALUES ('600093', '禾嘉股份');
INSERT INTO `stock` VALUES ('600095', '哈高科  ');
INSERT INTO `stock` VALUES ('600096', '云天化  ');
INSERT INTO `stock` VALUES ('600097', '开创国际');
INSERT INTO `stock` VALUES ('600098', '广州控股');
INSERT INTO `stock` VALUES ('600099', '林海股份');
INSERT INTO `stock` VALUES ('600100', '同方股份');
INSERT INTO `stock` VALUES ('600101', '明星电力');
INSERT INTO `stock` VALUES ('600102', '莱钢股份');
INSERT INTO `stock` VALUES ('600103', '青山纸业');
INSERT INTO `stock` VALUES ('600104', '上海汽车');
INSERT INTO `stock` VALUES ('600105', '永鼎股份');
INSERT INTO `stock` VALUES ('600106', '重庆路桥');
INSERT INTO `stock` VALUES ('600107', '美尔雅  ');
INSERT INTO `stock` VALUES ('600108', '亚盛集团');
INSERT INTO `stock` VALUES ('600109', '国金证券');
INSERT INTO `stock` VALUES ('600110', '中科英华');
INSERT INTO `stock` VALUES ('600111', '包钢稀土');
INSERT INTO `stock` VALUES ('600112', '长征电气');
INSERT INTO `stock` VALUES ('600113', '浙江东日');
INSERT INTO `stock` VALUES ('600114', '东睦股份');
INSERT INTO `stock` VALUES ('600115', '东方航空');
INSERT INTO `stock` VALUES ('600116', '三峡水利');
INSERT INTO `stock` VALUES ('600117', '西宁特钢');
INSERT INTO `stock` VALUES ('600118', '中国卫星');
INSERT INTO `stock` VALUES ('600119', '长江投资');
INSERT INTO `stock` VALUES ('600120', '浙江东方');
INSERT INTO `stock` VALUES ('600121', '郑州煤电');
INSERT INTO `stock` VALUES ('600122', '宏图高科');
INSERT INTO `stock` VALUES ('600123', '兰花科创');
INSERT INTO `stock` VALUES ('600125', '铁龙物流');
INSERT INTO `stock` VALUES ('600126', '杭钢股份');
INSERT INTO `stock` VALUES ('600127', '金健米业');
INSERT INTO `stock` VALUES ('600128', '弘业股份');
INSERT INTO `stock` VALUES ('600129', '太极集团');
INSERT INTO `stock` VALUES ('600130', 'ST波导  ');
INSERT INTO `stock` VALUES ('600131', '*ST岷电 ');
INSERT INTO `stock` VALUES ('600132', '重庆啤酒');
INSERT INTO `stock` VALUES ('600133', '东湖高新');
INSERT INTO `stock` VALUES ('600135', '乐凯胶片');
INSERT INTO `stock` VALUES ('600136', '道博股份');
INSERT INTO `stock` VALUES ('600137', '浪莎股份');
INSERT INTO `stock` VALUES ('600138', '中青旅  ');
INSERT INTO `stock` VALUES ('600139', '西部资源');
INSERT INTO `stock` VALUES ('600141', '兴发集团');
INSERT INTO `stock` VALUES ('600143', '金发科技');
INSERT INTO `stock` VALUES ('600145', '*ST四维 ');
INSERT INTO `stock` VALUES ('600146', '大元股份');
INSERT INTO `stock` VALUES ('600148', '长春一东');
INSERT INTO `stock` VALUES ('600149', '*ST建通 ');
INSERT INTO `stock` VALUES ('600150', '中国船舶');
INSERT INTO `stock` VALUES ('600151', '航天机电');
INSERT INTO `stock` VALUES ('600152', '维科精华');
INSERT INTO `stock` VALUES ('600153', '建发股份');
INSERT INTO `stock` VALUES ('600155', '*ST宝硕 ');
INSERT INTO `stock` VALUES ('600156', '华升股份');
INSERT INTO `stock` VALUES ('600157', '永泰能源');
INSERT INTO `stock` VALUES ('600158', '中体产业');
INSERT INTO `stock` VALUES ('600159', '大龙地产');
INSERT INTO `stock` VALUES ('600160', '巨化股份');
INSERT INTO `stock` VALUES ('600161', '天坛生物');
INSERT INTO `stock` VALUES ('600162', '香江控股');
INSERT INTO `stock` VALUES ('600163', '福建南纸');
INSERT INTO `stock` VALUES ('600165', '宁夏恒力');
INSERT INTO `stock` VALUES ('600166', '福田汽车');
INSERT INTO `stock` VALUES ('600167', '联美控股');
INSERT INTO `stock` VALUES ('600168', '武汉控股');
INSERT INTO `stock` VALUES ('600169', '太原重工');
INSERT INTO `stock` VALUES ('600170', '上海建工');
INSERT INTO `stock` VALUES ('600171', '上海贝岭');
INSERT INTO `stock` VALUES ('600172', '黄河旋风');
INSERT INTO `stock` VALUES ('600173', '卧龙地产');
INSERT INTO `stock` VALUES ('600175', '美都控股');
INSERT INTO `stock` VALUES ('600176', '中国玻纤');
INSERT INTO `stock` VALUES ('600177', '雅戈尔  ');
INSERT INTO `stock` VALUES ('600178', '东安动力');
INSERT INTO `stock` VALUES ('600179', '*ST黑化 ');
INSERT INTO `stock` VALUES ('600180', '*ST九发 ');
INSERT INTO `stock` VALUES ('600182', 'S佳通   ');
INSERT INTO `stock` VALUES ('600183', '生益科技');
INSERT INTO `stock` VALUES ('600184', '光电股份');
INSERT INTO `stock` VALUES ('600185', '格力地产');
INSERT INTO `stock` VALUES ('600186', '莲花味精');
INSERT INTO `stock` VALUES ('600187', '国中水务');
INSERT INTO `stock` VALUES ('600188', '兖州煤业');
INSERT INTO `stock` VALUES ('600189', '吉林森工');
INSERT INTO `stock` VALUES ('600190', '锦州港  ');
INSERT INTO `stock` VALUES ('600191', '华资实业');
INSERT INTO `stock` VALUES ('600192', '长城电工');
INSERT INTO `stock` VALUES ('600193', '创兴置业');
INSERT INTO `stock` VALUES ('600195', '中牧股份');
INSERT INTO `stock` VALUES ('600196', '复星医药');
INSERT INTO `stock` VALUES ('600197', '伊力特  ');
INSERT INTO `stock` VALUES ('600198', '大唐电信');
INSERT INTO `stock` VALUES ('600199', '金种子酒');
INSERT INTO `stock` VALUES ('600200', '江苏吴中');
INSERT INTO `stock` VALUES ('600201', '金宇集团');
INSERT INTO `stock` VALUES ('600202', '哈空调  ');
INSERT INTO `stock` VALUES ('600203', '*ST福日 ');
INSERT INTO `stock` VALUES ('600206', '有研硅股');
INSERT INTO `stock` VALUES ('600207', 'ST安彩  ');
INSERT INTO `stock` VALUES ('600208', '新湖中宝');
INSERT INTO `stock` VALUES ('600209', '*ST罗顿 ');
INSERT INTO `stock` VALUES ('600210', '紫江企业');
INSERT INTO `stock` VALUES ('600211', '西藏药业');
INSERT INTO `stock` VALUES ('600212', '江泉实业');
INSERT INTO `stock` VALUES ('600213', '亚星客车');
INSERT INTO `stock` VALUES ('600215', '长春经开');
INSERT INTO `stock` VALUES ('600216', '浙江医药');
INSERT INTO `stock` VALUES ('600217', '*ST秦岭 ');
INSERT INTO `stock` VALUES ('600218', '全柴动力');
INSERT INTO `stock` VALUES ('600219', '南山铝业');
INSERT INTO `stock` VALUES ('600220', '江苏阳光');
INSERT INTO `stock` VALUES ('600221', '海南航空');
INSERT INTO `stock` VALUES ('600222', '太龙药业');
INSERT INTO `stock` VALUES ('600223', '鲁商置业');
INSERT INTO `stock` VALUES ('600225', '天津松江');
INSERT INTO `stock` VALUES ('600226', '升华拜克');
INSERT INTO `stock` VALUES ('600227', '赤天化  ');
INSERT INTO `stock` VALUES ('600228', '昌九生化');
INSERT INTO `stock` VALUES ('600229', '青岛碱业');
INSERT INTO `stock` VALUES ('600230', '沧州大化');
INSERT INTO `stock` VALUES ('600231', '凌钢股份');
INSERT INTO `stock` VALUES ('600232', '金鹰股份');
INSERT INTO `stock` VALUES ('600233', '大杨创世');
INSERT INTO `stock` VALUES ('600234', 'ST天龙  ');
INSERT INTO `stock` VALUES ('600235', '民丰特纸');
INSERT INTO `stock` VALUES ('600236', '桂冠电力');
INSERT INTO `stock` VALUES ('600237', '铜峰电子');
INSERT INTO `stock` VALUES ('600238', '海南椰岛');
INSERT INTO `stock` VALUES ('600239', '云南城投');
INSERT INTO `stock` VALUES ('600240', '华业地产');
INSERT INTO `stock` VALUES ('600241', '时代万恒');
INSERT INTO `stock` VALUES ('600242', 'ST华龙  ');
INSERT INTO `stock` VALUES ('600243', '青海华鼎');
INSERT INTO `stock` VALUES ('600246', '万通地产');
INSERT INTO `stock` VALUES ('600247', '成城股份');
INSERT INTO `stock` VALUES ('600248', '延长化建');
INSERT INTO `stock` VALUES ('600249', '两面针  ');
INSERT INTO `stock` VALUES ('600250', '南纺股份');
INSERT INTO `stock` VALUES ('600251', '冠农股份');
INSERT INTO `stock` VALUES ('600252', '中恒集团');
INSERT INTO `stock` VALUES ('600253', '天方药业');
INSERT INTO `stock` VALUES ('600255', '鑫科材料');
INSERT INTO `stock` VALUES ('600256', '广汇股份');
INSERT INTO `stock` VALUES ('600257', '大湖股份');
INSERT INTO `stock` VALUES ('600258', '首旅股份');
INSERT INTO `stock` VALUES ('600259', '广晟有色');
INSERT INTO `stock` VALUES ('600260', '凯乐科技');
INSERT INTO `stock` VALUES ('600261', '阳光照明');
INSERT INTO `stock` VALUES ('600262', '北方股份');
INSERT INTO `stock` VALUES ('600263', '路桥建设');
INSERT INTO `stock` VALUES ('600265', '景谷林业');
INSERT INTO `stock` VALUES ('600266', '北京城建');
INSERT INTO `stock` VALUES ('600267', '海正药业');
INSERT INTO `stock` VALUES ('600268', '国电南自');
INSERT INTO `stock` VALUES ('600269', '赣粤高速');
INSERT INTO `stock` VALUES ('600270', '外运发展');
INSERT INTO `stock` VALUES ('600271', '航天信息');
INSERT INTO `stock` VALUES ('600272', '开开实业');
INSERT INTO `stock` VALUES ('600273', '华芳纺织');
INSERT INTO `stock` VALUES ('600275', 'ST昌鱼  ');
INSERT INTO `stock` VALUES ('600276', '恒瑞医药');
INSERT INTO `stock` VALUES ('600277', '亿利能源');
INSERT INTO `stock` VALUES ('600278', '东方创业');
INSERT INTO `stock` VALUES ('600279', '重庆港九');
INSERT INTO `stock` VALUES ('600280', '南京中商');
INSERT INTO `stock` VALUES ('600281', '太化股份');
INSERT INTO `stock` VALUES ('600282', '南钢股份');
INSERT INTO `stock` VALUES ('600283', '钱江水利');
INSERT INTO `stock` VALUES ('600284', '浦东建设');
INSERT INTO `stock` VALUES ('600285', '羚锐制药');
INSERT INTO `stock` VALUES ('600287', '江苏舜天');
INSERT INTO `stock` VALUES ('600288', '大恒科技');
INSERT INTO `stock` VALUES ('600289', '亿阳信通');
INSERT INTO `stock` VALUES ('600290', '华仪电气');
INSERT INTO `stock` VALUES ('600291', '西水股份');
INSERT INTO `stock` VALUES ('600292', '九龙电力');
INSERT INTO `stock` VALUES ('600293', '三峡新材');
INSERT INTO `stock` VALUES ('600295', '鄂尔多斯');
INSERT INTO `stock` VALUES ('600297', '美罗药业');
INSERT INTO `stock` VALUES ('600298', '安琪酵母');
INSERT INTO `stock` VALUES ('600299', '*ST新材 ');
INSERT INTO `stock` VALUES ('600300', '维维股份');
INSERT INTO `stock` VALUES ('600301', '*ST南化 ');
INSERT INTO `stock` VALUES ('600302', '标准股份');
INSERT INTO `stock` VALUES ('600303', '曙光股份');
INSERT INTO `stock` VALUES ('600305', '恒顺醋业');
INSERT INTO `stock` VALUES ('600306', '商业城  ');
INSERT INTO `stock` VALUES ('600307', '酒钢宏兴');
INSERT INTO `stock` VALUES ('600308', '华泰股份');
INSERT INTO `stock` VALUES ('600309', '烟台万华');
INSERT INTO `stock` VALUES ('600310', '桂东电力');
INSERT INTO `stock` VALUES ('600311', '荣华实业');
INSERT INTO `stock` VALUES ('600312', '平高电气');
INSERT INTO `stock` VALUES ('600315', '上海家化');
INSERT INTO `stock` VALUES ('600316', '洪都航空');
INSERT INTO `stock` VALUES ('600317', '营口港  ');
INSERT INTO `stock` VALUES ('600318', '巢东股份');
INSERT INTO `stock` VALUES ('600319', '亚星化学');
INSERT INTO `stock` VALUES ('600320', '振华重工');
INSERT INTO `stock` VALUES ('600321', '国栋建设');
INSERT INTO `stock` VALUES ('600322', '天房发展');
INSERT INTO `stock` VALUES ('600323', '南海发展');
INSERT INTO `stock` VALUES ('600325', '华发股份');
INSERT INTO `stock` VALUES ('600326', '西藏天路');
INSERT INTO `stock` VALUES ('600327', '大厦股份');
INSERT INTO `stock` VALUES ('600328', '兰太实业');
INSERT INTO `stock` VALUES ('600329', '中新药业');
INSERT INTO `stock` VALUES ('600330', '天通股份');
INSERT INTO `stock` VALUES ('600331', '宏达股份');
INSERT INTO `stock` VALUES ('600332', '广州药业');
INSERT INTO `stock` VALUES ('600333', '长春燃气');
INSERT INTO `stock` VALUES ('600335', '*ST盛工 ');
INSERT INTO `stock` VALUES ('600336', '澳柯玛  ');
INSERT INTO `stock` VALUES ('600337', '美克股份');
INSERT INTO `stock` VALUES ('600338', 'ST珠峰  ');
INSERT INTO `stock` VALUES ('600339', '天利高新');
INSERT INTO `stock` VALUES ('600340', 'ST国祥  ');
INSERT INTO `stock` VALUES ('600343', '航天动力');
INSERT INTO `stock` VALUES ('600345', '长江通信');
INSERT INTO `stock` VALUES ('600346', '大橡塑  ');
INSERT INTO `stock` VALUES ('600348', '国阳新能');
INSERT INTO `stock` VALUES ('600350', '山东高速');
INSERT INTO `stock` VALUES ('600351', '亚宝药业');
INSERT INTO `stock` VALUES ('600352', '浙江龙盛');
INSERT INTO `stock` VALUES ('600353', '旭光股份');
INSERT INTO `stock` VALUES ('600354', '敦煌种业');
INSERT INTO `stock` VALUES ('600355', '*ST精伦 ');
INSERT INTO `stock` VALUES ('600356', '恒丰纸业');
INSERT INTO `stock` VALUES ('600358', '国旅联合');
INSERT INTO `stock` VALUES ('600359', '新农开发');
INSERT INTO `stock` VALUES ('600360', '华微电子');
INSERT INTO `stock` VALUES ('600361', '华联综超');
INSERT INTO `stock` VALUES ('600362', '江西铜业');
INSERT INTO `stock` VALUES ('600363', '联创光电');
INSERT INTO `stock` VALUES ('600365', '*ST通葡 ');
INSERT INTO `stock` VALUES ('600366', '宁波韵升');
INSERT INTO `stock` VALUES ('600367', '红星发展');
INSERT INTO `stock` VALUES ('600368', '五洲交通');
INSERT INTO `stock` VALUES ('600369', '西南证券');
INSERT INTO `stock` VALUES ('600370', '三房巷  ');
INSERT INTO `stock` VALUES ('600371', '万向德农');
INSERT INTO `stock` VALUES ('600372', 'ST昌河  ');
INSERT INTO `stock` VALUES ('600373', '*ST鑫新 ');
INSERT INTO `stock` VALUES ('600375', '星马汽车');
INSERT INTO `stock` VALUES ('600376', '首开股份');
INSERT INTO `stock` VALUES ('600377', '宁沪高速');
INSERT INTO `stock` VALUES ('600378', '天科股份');
INSERT INTO `stock` VALUES ('600379', '宝光股份');
INSERT INTO `stock` VALUES ('600380', '健康元  ');
INSERT INTO `stock` VALUES ('600381', 'ST贤成  ');
INSERT INTO `stock` VALUES ('600382', '广东明珠');
INSERT INTO `stock` VALUES ('600383', '金地集团');
INSERT INTO `stock` VALUES ('600385', 'ST金泰  ');
INSERT INTO `stock` VALUES ('600386', '北巴传媒');
INSERT INTO `stock` VALUES ('600387', '海越股份');
INSERT INTO `stock` VALUES ('600388', '龙净环保');
INSERT INTO `stock` VALUES ('600389', '江山股份');
INSERT INTO `stock` VALUES ('600390', '金瑞科技');
INSERT INTO `stock` VALUES ('600391', '成发科技');
INSERT INTO `stock` VALUES ('600392', '太工天成');
INSERT INTO `stock` VALUES ('600393', '东华实业');
INSERT INTO `stock` VALUES ('600395', '盘江股份');
INSERT INTO `stock` VALUES ('600396', '金山股份');
INSERT INTO `stock` VALUES ('600397', '安源股份');
INSERT INTO `stock` VALUES ('600398', '凯诺科技');
INSERT INTO `stock` VALUES ('600399', '抚顺特钢');
INSERT INTO `stock` VALUES ('600400', '红豆股份');
INSERT INTO `stock` VALUES ('600403', '大有能源');
INSERT INTO `stock` VALUES ('600405', '动力源  ');
INSERT INTO `stock` VALUES ('600406', '国电南瑞');
INSERT INTO `stock` VALUES ('600408', '安泰集团');
INSERT INTO `stock` VALUES ('600409', '三友化工');
INSERT INTO `stock` VALUES ('600410', '华胜天成');
INSERT INTO `stock` VALUES ('600415', '小商品城');
INSERT INTO `stock` VALUES ('600416', '湘电股份');
INSERT INTO `stock` VALUES ('600418', '江淮汽车');
INSERT INTO `stock` VALUES ('600419', 'ST天宏  ');
INSERT INTO `stock` VALUES ('600420', '现代制药');
INSERT INTO `stock` VALUES ('600421', 'ST国药  ');
INSERT INTO `stock` VALUES ('600422', '昆明制药');
INSERT INTO `stock` VALUES ('600423', '柳化股份');
INSERT INTO `stock` VALUES ('600425', '青松建化');
INSERT INTO `stock` VALUES ('600426', '华鲁恒升');
INSERT INTO `stock` VALUES ('600428', '中远航运');
INSERT INTO `stock` VALUES ('600429', '三元股份');
INSERT INTO `stock` VALUES ('600432', '吉恩镍业');
INSERT INTO `stock` VALUES ('600433', '冠豪高新');
INSERT INTO `stock` VALUES ('600435', '北方导航');
INSERT INTO `stock` VALUES ('600436', '片仔癀  ');
INSERT INTO `stock` VALUES ('600438', '通威股份');
INSERT INTO `stock` VALUES ('600439', '瑞贝卡  ');
INSERT INTO `stock` VALUES ('600444', '*ST国通 ');
INSERT INTO `stock` VALUES ('600446', '金证股份');
INSERT INTO `stock` VALUES ('600448', '华纺股份');
INSERT INTO `stock` VALUES ('600449', '赛马实业');
INSERT INTO `stock` VALUES ('600452', '涪陵电力');
INSERT INTO `stock` VALUES ('600455', '*ST博通 ');
INSERT INTO `stock` VALUES ('600456', '宝钛股份');
INSERT INTO `stock` VALUES ('600458', '时代新材');
INSERT INTO `stock` VALUES ('600459', '贵研铂业');
INSERT INTO `stock` VALUES ('600460', '士兰微  ');
INSERT INTO `stock` VALUES ('600461', '洪城水业');
INSERT INTO `stock` VALUES ('600462', '*ST石岘 ');
INSERT INTO `stock` VALUES ('600463', '空港股份');
INSERT INTO `stock` VALUES ('600466', '迪康药业');
INSERT INTO `stock` VALUES ('600467', '好当家  ');
INSERT INTO `stock` VALUES ('600468', '百利电气');
INSERT INTO `stock` VALUES ('600469', '风神股份');
INSERT INTO `stock` VALUES ('600470', '六国化工');
INSERT INTO `stock` VALUES ('600475', '华光股份');
INSERT INTO `stock` VALUES ('600476', '湘邮科技');
INSERT INTO `stock` VALUES ('600477', '杭萧钢构');
INSERT INTO `stock` VALUES ('600478', '科力远  ');
INSERT INTO `stock` VALUES ('600479', '千金药业');
INSERT INTO `stock` VALUES ('600480', '凌云股份');
INSERT INTO `stock` VALUES ('600481', '双良节能');
INSERT INTO `stock` VALUES ('600482', '风帆股份');
INSERT INTO `stock` VALUES ('600483', '福建南纺');
INSERT INTO `stock` VALUES ('600485', '中创信测');
INSERT INTO `stock` VALUES ('600486', '扬农化工');
INSERT INTO `stock` VALUES ('600487', '亨通光电');
INSERT INTO `stock` VALUES ('600488', '天药股份');
INSERT INTO `stock` VALUES ('600489', '中金黄金');
INSERT INTO `stock` VALUES ('600490', '*ST合臣 ');
INSERT INTO `stock` VALUES ('600491', '龙元建设');
INSERT INTO `stock` VALUES ('600493', '凤竹纺织');
INSERT INTO `stock` VALUES ('600495', '晋西车轴');
INSERT INTO `stock` VALUES ('600496', '精工钢构');
INSERT INTO `stock` VALUES ('600497', '驰宏锌锗');
INSERT INTO `stock` VALUES ('600498', '烽火通信');
INSERT INTO `stock` VALUES ('600499', '科达机电');
INSERT INTO `stock` VALUES ('600500', '中化国际');
INSERT INTO `stock` VALUES ('600501', '航天晨光');
INSERT INTO `stock` VALUES ('600502', '安徽水利');
INSERT INTO `stock` VALUES ('600503', '华丽家族');
INSERT INTO `stock` VALUES ('600505', '西昌电力');
INSERT INTO `stock` VALUES ('600506', 'ST香梨  ');
INSERT INTO `stock` VALUES ('600507', '方大特钢');
INSERT INTO `stock` VALUES ('600508', '上海能源');
INSERT INTO `stock` VALUES ('600509', '天富热电');
INSERT INTO `stock` VALUES ('600510', '黑牡丹  ');
INSERT INTO `stock` VALUES ('600511', '国药股份');
INSERT INTO `stock` VALUES ('600512', '腾达建设');
INSERT INTO `stock` VALUES ('600513', '联环药业');
INSERT INTO `stock` VALUES ('600515', '*ST筑信 ');
INSERT INTO `stock` VALUES ('600516', '方大炭素');
INSERT INTO `stock` VALUES ('600517', '置信电气');
INSERT INTO `stock` VALUES ('600518', '康美药业');
INSERT INTO `stock` VALUES ('600519', '贵州茅台');
INSERT INTO `stock` VALUES ('600520', '三佳科技');
INSERT INTO `stock` VALUES ('600521', '华海药业');
INSERT INTO `stock` VALUES ('600522', '中天科技');
INSERT INTO `stock` VALUES ('600523', '贵航股份');
INSERT INTO `stock` VALUES ('600525', '长园集团');
INSERT INTO `stock` VALUES ('600526', '菲达环保');
INSERT INTO `stock` VALUES ('600527', '江南高纤');
INSERT INTO `stock` VALUES ('600528', '中铁二局');
INSERT INTO `stock` VALUES ('600529', '山东药玻');
INSERT INTO `stock` VALUES ('600530', '交大昂立');
INSERT INTO `stock` VALUES ('600531', '豫光金铅');
INSERT INTO `stock` VALUES ('600532', '华阳科技');
INSERT INTO `stock` VALUES ('600533', '栖霞建设');
INSERT INTO `stock` VALUES ('600535', '天士力  ');
INSERT INTO `stock` VALUES ('600536', '中国软件');
INSERT INTO `stock` VALUES ('600537', '海通集团');
INSERT INTO `stock` VALUES ('600538', '*ST国发 ');
INSERT INTO `stock` VALUES ('600539', '狮头股份');
INSERT INTO `stock` VALUES ('600540', '新赛股份');
INSERT INTO `stock` VALUES ('600543', '莫高股份');
INSERT INTO `stock` VALUES ('600545', '新疆城建');
INSERT INTO `stock` VALUES ('600546', '山煤国际');
INSERT INTO `stock` VALUES ('600547', '山东黄金');
INSERT INTO `stock` VALUES ('600548', '深高速  ');
INSERT INTO `stock` VALUES ('600549', '厦门钨业');
INSERT INTO `stock` VALUES ('600550', '天威保变');
INSERT INTO `stock` VALUES ('600551', '时代出版');
INSERT INTO `stock` VALUES ('600552', '方兴科技');
INSERT INTO `stock` VALUES ('600555', '九龙山  ');
INSERT INTO `stock` VALUES ('600557', '康缘药业');
INSERT INTO `stock` VALUES ('600558', '大西洋  ');
INSERT INTO `stock` VALUES ('600559', '老白干酒');
INSERT INTO `stock` VALUES ('600560', '金自天正');
INSERT INTO `stock` VALUES ('600561', '江西长运');
INSERT INTO `stock` VALUES ('600562', '*ST高陶 ');
INSERT INTO `stock` VALUES ('600563', '法拉电子');
INSERT INTO `stock` VALUES ('600565', '迪马股份');
INSERT INTO `stock` VALUES ('600566', '洪城股份');
INSERT INTO `stock` VALUES ('600567', '山鹰纸业');
INSERT INTO `stock` VALUES ('600568', '中珠控股');
INSERT INTO `stock` VALUES ('600569', '安阳钢铁');
INSERT INTO `stock` VALUES ('600570', '恒生电子');
INSERT INTO `stock` VALUES ('600571', '信雅达  ');
INSERT INTO `stock` VALUES ('600572', '康恩贝  ');
INSERT INTO `stock` VALUES ('600573', '惠泉啤酒');
INSERT INTO `stock` VALUES ('600575', '芜湖港  ');
INSERT INTO `stock` VALUES ('600576', '万好万家');
INSERT INTO `stock` VALUES ('600577', '精达股份');
INSERT INTO `stock` VALUES ('600578', '京能热电');
INSERT INTO `stock` VALUES ('600579', 'ST黄海  ');
INSERT INTO `stock` VALUES ('600580', '卧龙电气');
INSERT INTO `stock` VALUES ('600581', '八一钢铁');
INSERT INTO `stock` VALUES ('600582', '天地科技');
INSERT INTO `stock` VALUES ('600583', '海油工程');
INSERT INTO `stock` VALUES ('600584', '长电科技');
INSERT INTO `stock` VALUES ('600585', '海螺水泥');
INSERT INTO `stock` VALUES ('600586', '金晶科技');
INSERT INTO `stock` VALUES ('600587', '新华医疗');
INSERT INTO `stock` VALUES ('600588', '用友软件');
INSERT INTO `stock` VALUES ('600589', '广东榕泰');
INSERT INTO `stock` VALUES ('600590', '泰豪科技');
INSERT INTO `stock` VALUES ('600592', '龙溪股份');
INSERT INTO `stock` VALUES ('600593', '大连圣亚');
INSERT INTO `stock` VALUES ('600594', '益佰制药');
INSERT INTO `stock` VALUES ('600595', '中孚实业');
INSERT INTO `stock` VALUES ('600596', '新安股份');
INSERT INTO `stock` VALUES ('600597', '光明乳业');
INSERT INTO `stock` VALUES ('600598', '北大荒  ');
INSERT INTO `stock` VALUES ('600599', '熊猫烟花');
INSERT INTO `stock` VALUES ('600600', '青岛啤酒');
INSERT INTO `stock` VALUES ('600601', '方正科技');
INSERT INTO `stock` VALUES ('600602', '广电电子');
INSERT INTO `stock` VALUES ('600603', 'ST兴业  ');
INSERT INTO `stock` VALUES ('600604', 'ST二纺  ');
INSERT INTO `stock` VALUES ('600605', '汇通能源');
INSERT INTO `stock` VALUES ('600606', '金丰投资');
INSERT INTO `stock` VALUES ('600608', '*ST沪科 ');
INSERT INTO `stock` VALUES ('600609', '*ST金杯 ');
INSERT INTO `stock` VALUES ('600610', 'SST中纺 ');
INSERT INTO `stock` VALUES ('600611', '大众交通');
INSERT INTO `stock` VALUES ('600612', '老凤祥  ');
INSERT INTO `stock` VALUES ('600613', '永生投资');
INSERT INTO `stock` VALUES ('600614', '鼎立股份');
INSERT INTO `stock` VALUES ('600615', '丰华股份');
INSERT INTO `stock` VALUES ('600616', '金枫酒业');
INSERT INTO `stock` VALUES ('600617', '*ST联华 ');
INSERT INTO `stock` VALUES ('600618', '氯碱化工');
INSERT INTO `stock` VALUES ('600619', '海立股份');
INSERT INTO `stock` VALUES ('600620', '天宸股份');
INSERT INTO `stock` VALUES ('600621', '上海金陵');
INSERT INTO `stock` VALUES ('600622', '嘉宝集团');
INSERT INTO `stock` VALUES ('600623', '双钱股份');
INSERT INTO `stock` VALUES ('600624', '复旦复华');
INSERT INTO `stock` VALUES ('600626', '申达股份');
INSERT INTO `stock` VALUES ('600628', '新世界  ');
INSERT INTO `stock` VALUES ('600629', '棱光实业');
INSERT INTO `stock` VALUES ('600630', '龙头股份');
INSERT INTO `stock` VALUES ('600631', '百联股份');
INSERT INTO `stock` VALUES ('600634', '*ST海鸟 ');
INSERT INTO `stock` VALUES ('600635', '大众公用');
INSERT INTO `stock` VALUES ('600636', '三爱富  ');
INSERT INTO `stock` VALUES ('600637', '广电信息');
INSERT INTO `stock` VALUES ('600638', '新黄浦  ');
INSERT INTO `stock` VALUES ('600639', '浦东金桥');
INSERT INTO `stock` VALUES ('600640', '中卫国脉');
INSERT INTO `stock` VALUES ('600641', '万业企业');
INSERT INTO `stock` VALUES ('600642', '申能股份');
INSERT INTO `stock` VALUES ('600643', '爱建股份');
INSERT INTO `stock` VALUES ('600644', '乐山电力');
INSERT INTO `stock` VALUES ('600645', 'ST中源  ');
INSERT INTO `stock` VALUES ('600647', '同达创业');
INSERT INTO `stock` VALUES ('600648', '外高桥  ');
INSERT INTO `stock` VALUES ('600649', '城投控股');
INSERT INTO `stock` VALUES ('600650', '锦江投资');
INSERT INTO `stock` VALUES ('600651', '飞乐音响');
INSERT INTO `stock` VALUES ('600652', '爱使股份');
INSERT INTO `stock` VALUES ('600653', '申华控股');
INSERT INTO `stock` VALUES ('600654', '飞乐股份');
INSERT INTO `stock` VALUES ('600655', '豫园商城');
INSERT INTO `stock` VALUES ('600656', 'ST方源  ');
INSERT INTO `stock` VALUES ('600657', '信达地产');
INSERT INTO `stock` VALUES ('600658', '电子城  ');
INSERT INTO `stock` VALUES ('600660', '福耀玻璃');
INSERT INTO `stock` VALUES ('600661', '新南洋  ');
INSERT INTO `stock` VALUES ('600662', '强生控股');
INSERT INTO `stock` VALUES ('600663', '陆家嘴  ');
INSERT INTO `stock` VALUES ('600664', '哈药股份');
INSERT INTO `stock` VALUES ('600665', '天地源  ');
INSERT INTO `stock` VALUES ('600666', '西南药业');
INSERT INTO `stock` VALUES ('600667', '太极实业');
INSERT INTO `stock` VALUES ('600668', '尖峰集团');
INSERT INTO `stock` VALUES ('600671', '天目药业');
INSERT INTO `stock` VALUES ('600673', '东阳光铝');
INSERT INTO `stock` VALUES ('600674', '川投能源');
INSERT INTO `stock` VALUES ('600675', '中华企业');
INSERT INTO `stock` VALUES ('600676', '交运股份');
INSERT INTO `stock` VALUES ('600677', '航天通信');
INSERT INTO `stock` VALUES ('600678', '*ST金顶 ');
INSERT INTO `stock` VALUES ('600679', '金山开发');
INSERT INTO `stock` VALUES ('600680', '上海普天');
INSERT INTO `stock` VALUES ('600682', '南京新百');
INSERT INTO `stock` VALUES ('600683', '京投银泰');
INSERT INTO `stock` VALUES ('600684', '珠江实业');
INSERT INTO `stock` VALUES ('600685', '广船国际');
INSERT INTO `stock` VALUES ('600686', '金龙汽车');
INSERT INTO `stock` VALUES ('600687', '刚泰控股');
INSERT INTO `stock` VALUES ('600688', 'S上石化 ');
INSERT INTO `stock` VALUES ('600689', '上海三毛');
INSERT INTO `stock` VALUES ('600690', '青岛海尔');
INSERT INTO `stock` VALUES ('600691', '*ST东碳 ');
INSERT INTO `stock` VALUES ('600692', '亚通股份');
INSERT INTO `stock` VALUES ('600693', '东百集团');
INSERT INTO `stock` VALUES ('600694', '大商股份');
INSERT INTO `stock` VALUES ('600695', '大江股份');
INSERT INTO `stock` VALUES ('600696', '多伦股份');
INSERT INTO `stock` VALUES ('600697', '欧亚集团');
INSERT INTO `stock` VALUES ('600698', 'ST轻骑  ');
INSERT INTO `stock` VALUES ('600699', '*ST得亨 ');
INSERT INTO `stock` VALUES ('600701', '工大高新');
INSERT INTO `stock` VALUES ('600702', '沱牌曲酒');
INSERT INTO `stock` VALUES ('600703', '三安光电');
INSERT INTO `stock` VALUES ('600704', '中大股份');
INSERT INTO `stock` VALUES ('600706', 'ST长信  ');
INSERT INTO `stock` VALUES ('600707', '彩虹股份');
INSERT INTO `stock` VALUES ('600708', '海博股份');
INSERT INTO `stock` VALUES ('600710', '常林股份');
INSERT INTO `stock` VALUES ('600711', '雄震矿业');
INSERT INTO `stock` VALUES ('600712', '南宁百货');
INSERT INTO `stock` VALUES ('600713', '南京医药');
INSERT INTO `stock` VALUES ('600714', 'ST金瑞  ');
INSERT INTO `stock` VALUES ('600715', 'ST松辽  ');
INSERT INTO `stock` VALUES ('600716', '凤凰股份');
INSERT INTO `stock` VALUES ('600717', '天津港  ');
INSERT INTO `stock` VALUES ('600718', '东软集团');
INSERT INTO `stock` VALUES ('600719', '大连热电');
INSERT INTO `stock` VALUES ('600720', '祁连山  ');
INSERT INTO `stock` VALUES ('600721', 'ST百花  ');
INSERT INTO `stock` VALUES ('600722', '*ST金化 ');
INSERT INTO `stock` VALUES ('600723', '西单商场');
INSERT INTO `stock` VALUES ('600724', '宁波富达');
INSERT INTO `stock` VALUES ('600725', '云维股份');
INSERT INTO `stock` VALUES ('600726', '华电能源');
INSERT INTO `stock` VALUES ('600728', 'ST新太  ');
INSERT INTO `stock` VALUES ('600729', '重庆百货');
INSERT INTO `stock` VALUES ('600730', '中国高科');
INSERT INTO `stock` VALUES ('600731', '湖南海利');
INSERT INTO `stock` VALUES ('600732', '上海新梅');
INSERT INTO `stock` VALUES ('600733', 'S前锋   ');
INSERT INTO `stock` VALUES ('600734', '实达集团');
INSERT INTO `stock` VALUES ('600735', '新华锦  ');
INSERT INTO `stock` VALUES ('600736', '苏州高新');
INSERT INTO `stock` VALUES ('600737', '中粮屯河');
INSERT INTO `stock` VALUES ('600738', '兰州民百');
INSERT INTO `stock` VALUES ('600739', '辽宁成大');
INSERT INTO `stock` VALUES ('600740', '*ST山焦 ');
INSERT INTO `stock` VALUES ('600741', '华域汽车');
INSERT INTO `stock` VALUES ('600742', '一汽富维');
INSERT INTO `stock` VALUES ('600743', '华远地产');
INSERT INTO `stock` VALUES ('600744', '华银电力');
INSERT INTO `stock` VALUES ('600745', '中茵股份');
INSERT INTO `stock` VALUES ('600746', '江苏索普');
INSERT INTO `stock` VALUES ('600747', '大连控股');
INSERT INTO `stock` VALUES ('600748', '上实发展');
INSERT INTO `stock` VALUES ('600749', '西藏旅游');
INSERT INTO `stock` VALUES ('600750', '江中药业');
INSERT INTO `stock` VALUES ('600751', 'SST天海 ');
INSERT INTO `stock` VALUES ('600753', '东方银星');
INSERT INTO `stock` VALUES ('600754', '锦江股份');
INSERT INTO `stock` VALUES ('600755', '厦门国贸');
INSERT INTO `stock` VALUES ('600756', '浪潮软件');
INSERT INTO `stock` VALUES ('600757', '*ST源发 ');
INSERT INTO `stock` VALUES ('600758', '红阳能源');
INSERT INTO `stock` VALUES ('600759', '正和股份');
INSERT INTO `stock` VALUES ('600760', '中航黑豹');
INSERT INTO `stock` VALUES ('600761', '安徽合力');
INSERT INTO `stock` VALUES ('600763', '通策医疗');
INSERT INTO `stock` VALUES ('600764', '中电广通');
INSERT INTO `stock` VALUES ('600765', '中航重机');
INSERT INTO `stock` VALUES ('600766', '园城股份');
INSERT INTO `stock` VALUES ('600767', '运盛实业');
INSERT INTO `stock` VALUES ('600768', '宁波富邦');
INSERT INTO `stock` VALUES ('600769', '*ST祥龙 ');
INSERT INTO `stock` VALUES ('600770', '综艺股份');
INSERT INTO `stock` VALUES ('600771', 'ST东盛  ');
INSERT INTO `stock` VALUES ('600773', '西藏城投');
INSERT INTO `stock` VALUES ('600774', '汉商集团');
INSERT INTO `stock` VALUES ('600775', '南京熊猫');
INSERT INTO `stock` VALUES ('600776', '东方通信');
INSERT INTO `stock` VALUES ('600777', '新潮实业');
INSERT INTO `stock` VALUES ('600778', '友好集团');
INSERT INTO `stock` VALUES ('600779', '水井坊  ');
INSERT INTO `stock` VALUES ('600780', '通宝能源');
INSERT INTO `stock` VALUES ('600781', '上海辅仁');
INSERT INTO `stock` VALUES ('600782', '新钢股份');
INSERT INTO `stock` VALUES ('600783', '鲁信高新');
INSERT INTO `stock` VALUES ('600784', '鲁银投资');
INSERT INTO `stock` VALUES ('600785', '新华百货');
INSERT INTO `stock` VALUES ('600787', '中储股份');
INSERT INTO `stock` VALUES ('600789', '鲁抗医药');
INSERT INTO `stock` VALUES ('600790', '轻纺城  ');
INSERT INTO `stock` VALUES ('600791', '京能置业');
INSERT INTO `stock` VALUES ('600792', 'ST马龙  ');
INSERT INTO `stock` VALUES ('600793', 'ST宜纸  ');
INSERT INTO `stock` VALUES ('600794', '保税科技');
INSERT INTO `stock` VALUES ('600795', '国电电力');
INSERT INTO `stock` VALUES ('600796', '钱江生化');
INSERT INTO `stock` VALUES ('600797', '浙大网新');
INSERT INTO `stock` VALUES ('600798', '宁波海运');
INSERT INTO `stock` VALUES ('600800', 'ST磁卡  ');
INSERT INTO `stock` VALUES ('600801', '华新水泥');
INSERT INTO `stock` VALUES ('600802', '福建水泥');
INSERT INTO `stock` VALUES ('600803', '威远生化');
INSERT INTO `stock` VALUES ('600804', '鹏博士  ');
INSERT INTO `stock` VALUES ('600805', '悦达投资');
INSERT INTO `stock` VALUES ('600806', '昆明机床');
INSERT INTO `stock` VALUES ('600807', '天业股份');
INSERT INTO `stock` VALUES ('600808', '马钢股份');
INSERT INTO `stock` VALUES ('600809', '山西汾酒');
INSERT INTO `stock` VALUES ('600810', '神马股份');
INSERT INTO `stock` VALUES ('600811', '东方集团');
INSERT INTO `stock` VALUES ('600812', '华北制药');
INSERT INTO `stock` VALUES ('600814', '杭州解百');
INSERT INTO `stock` VALUES ('600815', '厦工股份');
INSERT INTO `stock` VALUES ('600816', '安信信托');
INSERT INTO `stock` VALUES ('600818', '中路股份');
INSERT INTO `stock` VALUES ('600819', '耀皮玻璃');
INSERT INTO `stock` VALUES ('600820', '隧道股份');
INSERT INTO `stock` VALUES ('600821', '津劝业  ');
INSERT INTO `stock` VALUES ('600822', '上海物贸');
INSERT INTO `stock` VALUES ('600823', '世茂股份');
INSERT INTO `stock` VALUES ('600824', '益民集团');
INSERT INTO `stock` VALUES ('600825', '新华传媒');
INSERT INTO `stock` VALUES ('600826', '兰生股份');
INSERT INTO `stock` VALUES ('600827', '友谊股份');
INSERT INTO `stock` VALUES ('600828', '成商集团');
INSERT INTO `stock` VALUES ('600829', '三精制药');
INSERT INTO `stock` VALUES ('600830', '香溢融通');
INSERT INTO `stock` VALUES ('600831', '广电网络');
INSERT INTO `stock` VALUES ('600832', '东方明珠');
INSERT INTO `stock` VALUES ('600833', '第一医药');
INSERT INTO `stock` VALUES ('600834', '申通地铁');
INSERT INTO `stock` VALUES ('600835', '上海机电');
INSERT INTO `stock` VALUES ('600836', '界龙实业');
INSERT INTO `stock` VALUES ('600837', '海通证券');
INSERT INTO `stock` VALUES ('600838', '上海九百');
INSERT INTO `stock` VALUES ('600839', '四川长虹');
INSERT INTO `stock` VALUES ('600841', '上柴股份');
INSERT INTO `stock` VALUES ('600843', '上工申贝');
INSERT INTO `stock` VALUES ('600844', '丹化科技');
INSERT INTO `stock` VALUES ('600845', '宝信软件');
INSERT INTO `stock` VALUES ('600846', '同济科技');
INSERT INTO `stock` VALUES ('600847', 'ST渝万里');
INSERT INTO `stock` VALUES ('600848', '自仪股份');
INSERT INTO `stock` VALUES ('600850', '华东电脑');
INSERT INTO `stock` VALUES ('600851', '海欣股份');
INSERT INTO `stock` VALUES ('600853', '龙建股份');
INSERT INTO `stock` VALUES ('600854', 'ST春兰  ');
INSERT INTO `stock` VALUES ('600855', '航天长峰');
INSERT INTO `stock` VALUES ('600856', '长百集团');
INSERT INTO `stock` VALUES ('600857', '工大首创');
INSERT INTO `stock` VALUES ('600858', '银座股份');
INSERT INTO `stock` VALUES ('600859', '王府井  ');
INSERT INTO `stock` VALUES ('600860', '*ST北人 ');
INSERT INTO `stock` VALUES ('600861', '北京城乡');
INSERT INTO `stock` VALUES ('600862', '南通科技');
INSERT INTO `stock` VALUES ('600863', '内蒙华电');
INSERT INTO `stock` VALUES ('600864', '哈投股份');
INSERT INTO `stock` VALUES ('600865', '百大集团');
INSERT INTO `stock` VALUES ('600866', '星湖科技');
INSERT INTO `stock` VALUES ('600867', '通化东宝');
INSERT INTO `stock` VALUES ('600868', 'ST梅雁  ');
INSERT INTO `stock` VALUES ('600869', '三普药业');
INSERT INTO `stock` VALUES ('600870', 'ST厦华  ');
INSERT INTO `stock` VALUES ('600871', 'S仪化   ');
INSERT INTO `stock` VALUES ('600872', '中炬高新');
INSERT INTO `stock` VALUES ('600873', '五洲明珠');
INSERT INTO `stock` VALUES ('600874', '创业环保');
INSERT INTO `stock` VALUES ('600875', '东方电气');
INSERT INTO `stock` VALUES ('600876', 'ST洛玻  ');
INSERT INTO `stock` VALUES ('600877', '中国嘉陵');
INSERT INTO `stock` VALUES ('600879', '航天电子');
INSERT INTO `stock` VALUES ('600880', '博瑞传播');
INSERT INTO `stock` VALUES ('600881', '亚泰集团');
INSERT INTO `stock` VALUES ('600882', '大成股份');
INSERT INTO `stock` VALUES ('600883', '博闻科技');
INSERT INTO `stock` VALUES ('600884', '杉杉股份');
INSERT INTO `stock` VALUES ('600885', '*ST力阳 ');
INSERT INTO `stock` VALUES ('600886', '国投电力');
INSERT INTO `stock` VALUES ('600887', '伊利股份');
INSERT INTO `stock` VALUES ('600888', '新疆众和');
INSERT INTO `stock` VALUES ('600889', '南京化纤');
INSERT INTO `stock` VALUES ('600890', 'ST中房  ');
INSERT INTO `stock` VALUES ('600891', 'ST秋林  ');
INSERT INTO `stock` VALUES ('600892', '*ST宝诚 ');
INSERT INTO `stock` VALUES ('600893', '航空动力');
INSERT INTO `stock` VALUES ('600894', '广钢股份');
INSERT INTO `stock` VALUES ('600895', '张江高科');
INSERT INTO `stock` VALUES ('600896', '中海海盛');
INSERT INTO `stock` VALUES ('600897', '厦门空港');
INSERT INTO `stock` VALUES ('600900', '长江电力');
INSERT INTO `stock` VALUES ('600960', '滨州活塞');
INSERT INTO `stock` VALUES ('600961', '株冶集团');
INSERT INTO `stock` VALUES ('600962', '国投中鲁');
INSERT INTO `stock` VALUES ('600963', '岳阳纸业');
INSERT INTO `stock` VALUES ('600965', '福成五丰');
INSERT INTO `stock` VALUES ('600966', '博汇纸业');
INSERT INTO `stock` VALUES ('600967', '北方创业');
INSERT INTO `stock` VALUES ('600969', '郴电国际');
INSERT INTO `stock` VALUES ('600970', '中材国际');
INSERT INTO `stock` VALUES ('600971', '恒源煤电');
INSERT INTO `stock` VALUES ('600973', '宝胜股份');
INSERT INTO `stock` VALUES ('600975', '新五丰  ');
INSERT INTO `stock` VALUES ('600976', '武汉健民');
INSERT INTO `stock` VALUES ('600978', '宜华木业');
INSERT INTO `stock` VALUES ('600979', '广安爱众');
INSERT INTO `stock` VALUES ('600980', '北矿磁材');
INSERT INTO `stock` VALUES ('600981', '江苏开元');
INSERT INTO `stock` VALUES ('600982', '宁波热电');
INSERT INTO `stock` VALUES ('600983', '合肥三洋');
INSERT INTO `stock` VALUES ('600984', '*ST建机 ');
INSERT INTO `stock` VALUES ('600985', '雷鸣科化');
INSERT INTO `stock` VALUES ('600986', '科达股份');
INSERT INTO `stock` VALUES ('600987', '航民股份');
INSERT INTO `stock` VALUES ('600988', '*ST宝龙 ');
INSERT INTO `stock` VALUES ('600990', '四创电子');
INSERT INTO `stock` VALUES ('600991', '广汽长丰');
INSERT INTO `stock` VALUES ('600992', '贵绳股份');
INSERT INTO `stock` VALUES ('600993', '马应龙  ');
INSERT INTO `stock` VALUES ('600995', '文山电力');
INSERT INTO `stock` VALUES ('600997', '开滦股份');
INSERT INTO `stock` VALUES ('600998', '九州通  ');
INSERT INTO `stock` VALUES ('600999', '招商证券');
INSERT INTO `stock` VALUES ('601000', '唐山港  ');
INSERT INTO `stock` VALUES ('601001', '大同煤业');
INSERT INTO `stock` VALUES ('601002', '晋亿实业');
INSERT INTO `stock` VALUES ('601003', '柳钢股份');
INSERT INTO `stock` VALUES ('601005', '重庆钢铁');
INSERT INTO `stock` VALUES ('601006', '大秦铁路');
INSERT INTO `stock` VALUES ('601007', '金陵饭店');
INSERT INTO `stock` VALUES ('601008', '连云港  ');
INSERT INTO `stock` VALUES ('601009', '南京银行');
INSERT INTO `stock` VALUES ('601011', '宝泰隆  ');
INSERT INTO `stock` VALUES ('601018', '宁波港  ');
INSERT INTO `stock` VALUES ('601088', '中国神华');
INSERT INTO `stock` VALUES ('601098', '中南传媒');
INSERT INTO `stock` VALUES ('601099', '太平洋  ');
INSERT INTO `stock` VALUES ('601101', '昊华能源');
INSERT INTO `stock` VALUES ('601106', '中国一重');
INSERT INTO `stock` VALUES ('601107', '四川成渝');
INSERT INTO `stock` VALUES ('601111', '中国国航');
INSERT INTO `stock` VALUES ('601116', '三江购物');
INSERT INTO `stock` VALUES ('601117', '中国化学');
INSERT INTO `stock` VALUES ('601118', '海南橡胶');
INSERT INTO `stock` VALUES ('601126', '四方股份');
INSERT INTO `stock` VALUES ('601137', '博威合金');
INSERT INTO `stock` VALUES ('601139', '深圳燃气');
INSERT INTO `stock` VALUES ('601158', '重庆水务');
INSERT INTO `stock` VALUES ('601166', '兴业银行');
INSERT INTO `stock` VALUES ('601168', '西部矿业');
INSERT INTO `stock` VALUES ('601169', '北京银行');
INSERT INTO `stock` VALUES ('601177', '杭齿前进');
INSERT INTO `stock` VALUES ('601179', '中国西电');
INSERT INTO `stock` VALUES ('601186', '中国铁建');
INSERT INTO `stock` VALUES ('601188', '龙江交通');
INSERT INTO `stock` VALUES ('601216', '内蒙君正');
INSERT INTO `stock` VALUES ('601268', '二重重装');
INSERT INTO `stock` VALUES ('601288', '农业银行');
INSERT INTO `stock` VALUES ('601299', '中国北车');
INSERT INTO `stock` VALUES ('601318', '中国平安');
INSERT INTO `stock` VALUES ('601328', '交通银行');
INSERT INTO `stock` VALUES ('601333', '广深铁路');
INSERT INTO `stock` VALUES ('601369', '陕鼓动力');
INSERT INTO `stock` VALUES ('601377', '兴业证券');
INSERT INTO `stock` VALUES ('601390', '中国中铁');
INSERT INTO `stock` VALUES ('601398', '工商银行');
INSERT INTO `stock` VALUES ('601518', '吉林高速');
INSERT INTO `stock` VALUES ('601519', '大智慧  ');
INSERT INTO `stock` VALUES ('601558', '华锐风电');
INSERT INTO `stock` VALUES ('601588', '北辰实业');
INSERT INTO `stock` VALUES ('601600', '中国铝业');
INSERT INTO `stock` VALUES ('601601', '中国太保');
INSERT INTO `stock` VALUES ('601607', '上海医药');
INSERT INTO `stock` VALUES ('601616', '广电电气');
INSERT INTO `stock` VALUES ('601618', '中国中冶');
INSERT INTO `stock` VALUES ('601628', '中国人寿');
INSERT INTO `stock` VALUES ('601666', '平煤股份');
INSERT INTO `stock` VALUES ('601668', '中国建筑');
INSERT INTO `stock` VALUES ('601678', 'DR滨化股');
INSERT INTO `stock` VALUES ('601688', '华泰证券');
INSERT INTO `stock` VALUES ('601699', '潞安环能');
INSERT INTO `stock` VALUES ('601700', '风范股份');
INSERT INTO `stock` VALUES ('601717', '郑煤机  ');
INSERT INTO `stock` VALUES ('601718', '际华集团');
INSERT INTO `stock` VALUES ('601727', '上海电气');
INSERT INTO `stock` VALUES ('601766', '中国南车');
INSERT INTO `stock` VALUES ('601777', '力帆股份');
INSERT INTO `stock` VALUES ('601788', '光大证券');
INSERT INTO `stock` VALUES ('601799', '星宇股份');
INSERT INTO `stock` VALUES ('601801', '皖新传媒');
INSERT INTO `stock` VALUES ('601808', '中海油服');
INSERT INTO `stock` VALUES ('601818', '光大银行');
INSERT INTO `stock` VALUES ('601857', '中国石油');
INSERT INTO `stock` VALUES ('601866', '中海集运');
INSERT INTO `stock` VALUES ('601872', '招商轮船');
INSERT INTO `stock` VALUES ('601877', '正泰电器');
INSERT INTO `stock` VALUES ('601880', '大连港  ');
INSERT INTO `stock` VALUES ('601888', '中国国旅');
INSERT INTO `stock` VALUES ('601890', '亚星锚链');
INSERT INTO `stock` VALUES ('601898', '中煤能源');
INSERT INTO `stock` VALUES ('601899', '紫金矿业');
INSERT INTO `stock` VALUES ('601918', '国投新集');
INSERT INTO `stock` VALUES ('601919', '中国远洋');
INSERT INTO `stock` VALUES ('601933', '永辉超市');
INSERT INTO `stock` VALUES ('601939', '建设银行');
INSERT INTO `stock` VALUES ('601958', '金钼股份');
INSERT INTO `stock` VALUES ('601988', '中国银行');
INSERT INTO `stock` VALUES ('601989', '中国重工');
INSERT INTO `stock` VALUES ('601991', '大唐发电');
INSERT INTO `stock` VALUES ('601992', '金隅股份');
INSERT INTO `stock` VALUES ('601998', '中信银行');
INSERT INTO `stock` VALUES ('601999', '出版传媒');

-- ----------------------------
-- Table structure for `stock_assets`
-- ----------------------------
DROP TABLE IF EXISTS `stock_assets`;
CREATE TABLE `stock_assets` (
  `total_assets` double(100,3) DEFAULT '0.000' COMMENT '总资产',
  `use_assets` double(100,3) DEFAULT NULL COMMENT '可用资产',
  `stock_assets` double(100,3) DEFAULT NULL COMMENT '证券资产',
  `principal` double(100,3) DEFAULT NULL COMMENT '本金',
  `profit_loss` double(100,3) DEFAULT NULL COMMENT '总盈亏',
  `current_dates` varchar(100) DEFAULT NULL COMMENT '截止到当前时间',
  `id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock_assets
-- ----------------------------
INSERT INTO `stock_assets` VALUES ('0.000', '0.000', '0.000', '0.000', '0.000', '20150428150325', '402890ba4cfeca14014cfed664d20007');

-- ----------------------------
-- Table structure for `stock_other`
-- ----------------------------
DROP TABLE IF EXISTS `stock_other`;
CREATE TABLE `stock_other` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `money` double(100,3) DEFAULT NULL COMMENT '发生金额',
  `date` varchar(100) DEFAULT NULL COMMENT '发生时间',
  `record_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock_other
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
