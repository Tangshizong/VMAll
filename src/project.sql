/*
Navicat MySQL Data Transfer

Source Server         : Mydb
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2021-05-13 14:02:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sku` int(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('7', 'chui', '1001', '7');
INSERT INTO `cart` VALUES ('6', 'chui', '1010', '2');
INSERT INTO `cart` VALUES ('8', 'chui', '1009', '1');
INSERT INTO `cart` VALUES ('9', 'chui', '1004', '1');
INSERT INTO `cart` VALUES ('10', 'chui', '1003', '2');
INSERT INTO `cart` VALUES ('11', 'chui', '1002', '2');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgpath` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `promoLabels` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `rateCount` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `skuName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `stock` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'https://res.vmallres.com/pimages//product/6941487220267/428_428_DEBB356E00934B123CDAE9CACBD70E1536224850853CCCE8mp.png', '1001', 'HUAWEI Mate 40E', '4599', '赠送积分', '6931', 'HUAWEI Mate 40E 5G 全网通 8GB+128GB（釉白色）', '99', 'phone');
INSERT INTO `products` VALUES ('2', 'https://res.vmallres.com/pimages//product/6941487225064/428_428_D58F3741EBC023C1DD544D1A9D77B2DF8D1873FF58D72D75mp.png', '1002', 'HUAWEI Mate X2', '17799', '赠送积分', '5855', 'HUAWEI Mate X2 5G 全网通 256GB（冰晶蓝）', '99', 'phone');
INSERT INTO `products` VALUES ('3', 'https://res.vmallres.com/pimages//product/6941487210619/428_428_1BED94F76D33074373CB7636AC2AEB733F3754C113BF6BBDmp.png', '1003', 'HUAWEI nova 8', '3299', '赠送积分', '15388', 'HUAWEI nova 8 8GB+128GB 全网通版（普罗旺斯 ）', '99', 'phone');
INSERT INTO `products` VALUES ('4', 'https://res.vmallres.com/pimages//product/6901443433247/428_428_65BAF4AE278E82C2A71E1FE608D217B1072241C8560983BBmp.png', '1004', 'HUAWEI Mate 40', '4999', '赠送积分', '31189', 'HUAWEI Mate 40 5G 全网通 8GB+128GB（秘银色）', '99', 'phone');
INSERT INTO `products` VALUES ('5', 'https://res.vmallres.com/pimages//product/6941487210992/428_428_30DC7C81625DCEBCC577E88BAE05B489A616EAAAFDB59375mp.png', '1005', 'HUAWEI nova 7 SE 5G 乐活版', '2299', '赠送积分', '800', 'HUAWEI nova 7 SE 5G 乐活版 8GB+128GB 全网通版（银月星辉）', '99', 'phone');
INSERT INTO `products` VALUES ('6', 'https://res.vmallres.com/pimages//product/6941487212811/428_428_4C8EE6806EDE629C0082E7D08CA7FA9FDF4155E790051011mp.png', '1006', '华为畅享20 SE', '1499', '赠送积分', '5405', '华为畅享20 SE 8GB+128GB 全网通版（幻夜黑）', '99', 'phone');
INSERT INTO `products` VALUES ('7', 'https://res.vmallres.com/pimages//product/6941487211227/428_428_2E46AA51F10D36916D945D9EAE0E5C224B05E187580E8C20mp.png', '1007', 'HUAWEI nova 8 Pro', '3999', '赠送积分', '9455', 'HUAWEI nova 8 Pro 8GB+128GB 全网通版（普罗旺斯）', '99', 'phone');
INSERT INTO `products` VALUES ('8', 'https://res.vmallres.com/pimages//product/6941487207626/428_428_64A6BB5D9B19C61B2C8724E1D12E02E0DF740091C034401Bmp.png', '1008', 'HUAWEI Mate 40 Pro+', '8999', '赠送积分', '3120', 'HUAWEI Mate 40 Pro+ 5G 全网通 12GB+256GB（陶瓷黑）', '99', 'phone');
INSERT INTO `products` VALUES ('9', 'https://res.vmallres.com/pimages//product/6901443383177/428_428_288D96B4DF91A1FB25F6B4F2A1E55B3083A6391F3B1D4460mp.png', '1009', 'HUAWEI P40', '4488', '赠送积分', '32107', 'HUAWEI P40 5G 全网通 8GB+128GB（深海蓝）', '99', 'phone');
INSERT INTO `products` VALUES ('10', 'https://res.vmallres.com/pimages//product/6901443393251/428_428_7843929F829F1DAC9EFC6A50B6BD0CA9999BA351D2526117mp.png', '1010', 'HUAWEI nova 7 5G', '2999', '赠送积分', '18902', 'HUAWEI nova 7 5G 前置3200万像素高清自拍 后置6400万变焦四摄  麒麟985 5G SoC 芯片 8GB+128GB 全网通版（绮境森林）', '99', 'phone');
INSERT INTO `products` VALUES ('11', 'https://res.vmallres.com/pimages//product/6941487222551/428_428_084225B8F3BD10E711B7C93693A3600E1B87BAB5D6FD0DE4mp.png', '1011', 'HUAWEI Mate 40 RS保时捷设计', '10999', '赠送积分', '20706', 'HUAWEI Mate 40 RS保时捷设计 5G 全网通 8GB+256GB（陶瓷黑）', '99', 'phone');
INSERT INTO `products` VALUES ('12', 'https://res.vmallres.com/pimages//product/6972453165077/428_428_C089F3BE3BD266BAC2B777E1190F59241E0CE65223CA694Bmp.png', '1012', '华为畅享20 Pro 5G', '1999', '赠送积分', '3336', '华为畅享20 Pro 6GB+128GB 全网通版（星河银）', '99', 'phone');
INSERT INTO `products` VALUES ('13', 'https://res.vmallres.com/pimages//product/6941487203307/428_428_FE364E05A0D86CE39BE00E1EE1D18350AA8E982DFAFFC0A2mp.png', '1013', 'HUAWEI nova 8 SE', '2699', '赠送积分', '2892', 'HUAWEI nova 8 SE 5G全网通 8GB+128GB 高配版（天玑800U）幻夜黑', '99', 'phone');
INSERT INTO `products` VALUES ('14', 'https://res.vmallres.com/pimages//product/6901443418435/428_428_73BCBBB4876F3F6B63D1A34232AD2A6590CDC262C17D7977mp.png', '1014', 'HUAWEI Mate 30E Pro', '5299', '赠送积分', '7297', 'HUAWEI Mate 30E Pro 5G 全网通 8GB+128GB（翡冷翠）', '99', 'phone');
INSERT INTO `products` VALUES ('15', 'https://res.vmallres.com/pimages//product/6901443415861/428_428_0BA14C7E638AD4B322D55B3106389B9E0986553156115F92mp.png', '1015', 'HUAWEI nova 7 SE 5G 活力版', '2299', '赠送积分', '1279', 'HUAWEI nova 7 SE 5G 活力版 8GB+128GB 全网通版（仲夏紫）', '99', 'phone');
INSERT INTO `products` VALUES ('16', 'https://res.vmallres.com/pimages//product/6901443393084/428_428_6D2C3BD6E95F48BE819116EED6B4EA4AA6EACC03475DC850mp.png', '1016', 'HUAWEI nova 7 Pro 5G', '4099', '赠送积分', '10985', 'HUAWEI nova 7 Pro 5G 前置3200万追焦双摄 50倍潜望式变焦四摄  麒麟985 5G SoC 8GB+256GB 全网通版（7号色）', '99', 'phone');
INSERT INTO `products` VALUES ('17', 'https://res.vmallres.com/pimages//product/6901443353194/428_428_A48D3693600D3F96715A5288CA0EB254C46D4D5F3AE802FBmp.png', '1017', 'HUAWEI Mate 30 RS 保时捷设计', '12999', '赠送积分', '6019', 'HUAWEI Mate 30 RS 保时捷设计 5G全网通 12GB+512GB（玄黑）', '99', 'phone');
INSERT INTO `products` VALUES ('18', 'https://res.vmallres.com/pimages//product/6901443353347/428_428_484D42DB83550E7CF59813E6BE3E2A9A4CF07CF0E75E32A3mp.png', '1018', 'HUAWEI Mate 40 Pro', '6499', '赠送积分', '113997', 'HUAWEI Mate 40 Pro 5G 全网通 8GB+128GB（秘银色）', '99', 'phone');
INSERT INTO `products` VALUES ('19', 'https://res.vmallres.com/pimages//product/6941487220748/428_428_19EA25FFB51AB0AB79D82E3C8D317F67BEC741CBA0849F78mp.png', '1019', 'HUAWEI Mate 30 Pro', '5399', '赠送积分', '42940', 'HUAWEI Mate 30 Pro 麒麟990 双4000万徕卡电影四摄 4G全网通 8GB+128GB（亮黑色）', '99', 'phone');
INSERT INTO `products` VALUES ('20', 'https://res.vmallres.com/pimages//product/6901443331376/428_428_FAF5BBAB67C16D7426B5B1A2A38F9001DED6D011A0EE9977mp.png', '1020', 'HUAWEI P40 Pro', '6888', '赠送积分', '49575', 'HUAWEI P40 Pro 5G 全网通 8GB+256GB 限量套装（零度白）', '99', 'phone');
INSERT INTO `products` VALUES ('21', 'https://res.vmallres.com/pimages//product/6901443353248/428_428_5F25A61C531CA96DF38256007A72B3FE065B8FFA961A7B92mp.png', '1021', 'HUAWEI Mate 30 Pro 5G', '5899', '赠送积分', '65572', 'HUAWEI Mate 30 Pro 5G 全网通 8GB+128GB 麒麟990 双4000万徕卡电影四摄（丹霞橙）', '99', 'phone');
INSERT INTO `products` VALUES ('22', 'https://res.vmallres.com/pimages//product/6901443398027/428_428_C5B3EEB31BA081CF605FE04A1118DEF332F4C3003CC60ECEmp.png', '1022', 'HUAWEI P40 Pro+', '7988', '赠送积分', '7554', 'HUAWEI P40 Pro+ 5G 全网通 8GB+256GB（陶瓷白）', '99', 'phone');
INSERT INTO `products` VALUES ('23', 'https://res.vmallres.com/pimages//product/6901443353361/428_428_6381399AD1BADEB91EBD63AF4EAE62016C58317DDEB7C5C4mp.png', '1023', 'HUAWEI Mate 30 5G', '4499', '赠送积分', '49636', 'HUAWEI Mate 30 5G 全网通 8GB+128GB 麒麟990 4000万超感光徕卡三摄（亮黑色）', '99', 'phone');
INSERT INTO `products` VALUES ('24', 'https://res.vmallres.com/pimages//product/6941487200191/428_428_21B4AF84D0CA78847E127DFBBF4CBB32EA4AAD1345F94E0Dmp.png', '1024', '华为畅享20 5G', '1499', '赠送积分', '3587', '华为畅享20 5G 4GB+64GB 全网通版（亮黑色）', '99', 'phone');
INSERT INTO `products` VALUES ('25', 'https://res.vmallres.com/pimages//product/6941487202348/428_428_FCD2A8711FAC079C86B60B4A0AC85E8D6FED547FD61C7473mp.png', '1025', '华为畅享20 Plus 5G', '2499', '赠送积分', '7884', '华为畅享20 Plus 5G 8GB+128GB 全网通版（星河银）', '99', 'phone');
INSERT INTO `products` VALUES ('26', 'https://res.vmallres.com/pimages//product/6901443327690/428_428_50BAC6E20ED77CBBE6D44BD831603E6F0FB45173DB1EE8B2mp.png', '1026', '华为畅享 10Plus', '1399', '赠送积分', '32713', '华为畅享10 Plus 4GB+128GB 全网通版（幻夜黑）', '99', 'phone');
INSERT INTO `products` VALUES ('27', 'https://res.vmallres.com/pimages//product/6972453164971/428_428_7F096698C1439DCC72C92B310CE4068E5890C5496CCF7E7Cmp.png', '1027', '华为畅享Z 5G', '2199', '赠送积分', '14123', '华为畅享Z 5G 8GB+128GB 全网通版（幻夜黑）', '99', 'phone');
INSERT INTO `products` VALUES ('28', 'https://res.vmallres.com/pimages//product/6901443392186/428_428_E00DF674DB87E09F135725E577737D59F6C1E2418AC2AB17mp.png', '1028', '华为畅享10', '1199', '赠送积分', '12923', '华为畅享10 4GB+128GB 全网通版（天空之境）', '99', 'phone');
INSERT INTO `products` VALUES ('29', 'https://res.vmallres.com/pimages//product/6972453161895/428_428_52A1B8C983AFB0C83843A0FB1369D8D62443AA1BF93B3F9Dmp.png', '1029', '华为畅享 10e', '1199', '赠送积分', '8882', '华为畅享 10e 4GB+128GB 全网通版（幻夜黑）', '99', 'phone');
INSERT INTO `products` VALUES ('30', 'https://res.vmallres.com/pimages//product/6901443352708/428_428_817F37A1880DB879510617A6F2322AC6D9355C6F21C86A29mp.png', '1030', '华为畅享 10S', '1699', '赠送积分', '2734', '华为畅享 10S 6GB+128GB 全网通版（翡冷翠）', '99', 'phone');
INSERT INTO `products` VALUES ('31', 'https://res.vmallres.com/pimages//product/6941487216888/428_428_1DA397429EBAF95EF258FD20931919A73CD3759BE4B81FDDmp.png', '1101', '华为手环 6', '269', '赠送积分', '6787', '【新品】华为手环 6 （曜石黑）炫彩全面屏 血氧心率睡眠监测 2周长续航  50米防水 96种运动模式 智能运动手环', '99', 'watch');
INSERT INTO `products` VALUES ('32', 'https://res.vmallres.com/pimages//product/6972453166555/428_428_C79B4D644290EA71DC3C0CC105B77D471608BB055EA5A34Emp.png', '1102', 'HUAWEI WATCH GT 2 Pro', '2388', '赠送积分', '30634', '【时尚款】HUAWEI WATCH GT 2 Pro 时尚款 星云灰（46mm）两周长续航 心率监测 蓝宝石镜面 钛合金表体 陶瓷后壳 蓝牙通话智能手表', '99', 'watch');
INSERT INTO `products` VALUES ('33', 'https://res.vmallres.com/pimages//product/6901443320196/428_428_A65CFAB0B848942CC0CF62F969482D0E890933FCE09257F2mp.png', '1103', '【46mm表盘】HUAWEI WATCH GT 2', '1988', '赠送积分', '101252', 'HUAWEI WATCH GT 2 尊享款 钛银灰（46mm）麒麟A1芯片 2周续航 蓝牙通话 独立音乐播放 华为智能手表', '99', 'watch');
INSERT INTO `products` VALUES ('34', 'https://res.vmallres.com/pimages//product/6972453166623/428_428_3BEC2C42E7A4A37E60FDC56465F3AF18E3EC0FC7F4D09B15mp.png', '1104', 'HUAWEI WATCH GT 2 保时捷设计款', '4688', '赠送积分', '1758', '【保时捷设计款】HUAWEI WATCH GT 2 保时捷设计款 钛金灰（46mm）华为智能手表 全钛金属设计 蓝宝石表面 陶瓷背壳 蓝牙通话 专业户外运动', '99', 'watch');
INSERT INTO `products` VALUES ('35', 'https://res.vmallres.com/pimages//product/6972453164155/428_428_3E4CBDE1F2786A559FB292A742C02DB332C5BFC42F212AA4mp.png', '1105', '华为手环 B6', '999', '赠送积分', '9488', '华为手环 B6 运动版（曜石黑）智能通话手环 3D弧面触控彩屏 心率血氧监测睡眠分析', '99', 'watch');
INSERT INTO `products` VALUES ('36', 'https://res.vmallres.com/pimages//product/6972453167255/428_428_5A0F299CEB8FD02EC475984195F40859A18690A29D3F4641mp.png', '1106', 'HUAWEI WATCH FIT', '799', '赠送积分', '7656', 'HUAWEI WATCH FIT（曜石黑） 智能运动手表 心率睡眠血氧监测 10天续航+快充 50米防水 96种运动模式', '99', 'watch');
INSERT INTO `products` VALUES ('37', 'https://res.vmallres.com/pimages//product/6901443330140/428_428_3B9B99FBFE5AE8120CF3E5B8E287299C90229C22296FD0FAmp.png', '1107', '华为手环 4', '199', '赠送积分', '18847', '华为手环4（赤茶橘）炫彩表盘 USB即插即充 健康管理 智能运动手环', '99', 'watch');
INSERT INTO `products` VALUES ('38', 'https://res.vmallres.com/pimages//product/6901443278381/428_428_B82D67C119283942BCC92625B03EAAEB4BC6A7C7065DEBCBmp.png', '1108', '华为儿童手表 3', '298', '赠送积分', '26825', '华为儿童手表 3（星云粉）清晰通话 拍照分享 精准定位 一键呼救 学生电话手表', '99', 'watch');
INSERT INTO `products` VALUES ('39', 'https://res.vmallres.com/pimages//product/6901443254323/428_428_75472442C368B681B210AAE96829FE648BDF9B64CCDFC909mp.png', '1109', '华为儿童手表 3 Pro', '798', '赠送积分', '24515', '华为儿童手表 3 Pro（星云粉）视频通话 高清拍照 九重定位 4G全网通学生电话手表', '99', 'watch');
INSERT INTO `products` VALUES ('40', 'https://res.vmallres.com/pimages//product/6972557690024/428_428_D81E733F1187DB7553553BF6A80EF7BB1BBD4B36FC2C4CA5mp.png', '1110', 'NOLO CV1 Air VR定位交互套装', '1299', '赠送积分', '152', 'NOLO CV1 Air VR定位交互套装 黑色（支持HUAWEI VR Glass）（DESIGN FOR HUAWEI认证）', '99', 'watch');
INSERT INTO `products` VALUES ('41', 'https://res.vmallres.com/pimages//product/6901443360703/428_428_914EDAC9FF9F83D25CEA18F72AD17BBEA9FBE9EFFA060892mp.png', '1111', '华为手环 4 pro', '399', '赠送积分', '11138', '华为手环 4 Pro（蜜语红）炫彩表盘 NFC智能刷卡 健康管理 专业运动指导 独立GPS 智能运动手环', '99', 'watch');
INSERT INTO `products` VALUES ('42', 'https://res.vmallres.com/pimages//product/6901443309184/428_428_B7CDE3D394D5E372E8DA9608D9097925DF2FB07A5A93069Emp.png', '1112', '华为儿童手表 3S', '498', '赠送积分', '7345', '华为儿童手表 3s（蜜桃粉）4G全网通 八重精准定位 腕上学习助手 智能语音助手 零花钱管理 安全认证  学生智能电话手表', '99', 'watch');
INSERT INTO `products` VALUES ('43', 'https://res.vmallres.com/pimages//product/6972453165985/428_428_93BCD651C90D2B5EFD779DB353F1A2E36DFAE529FA49026Emp.png', '1113', '华为儿童手表 4X', '1398', '赠送积分', '2848', '华为儿童手表4X 高清双摄 双频11重定位 50米防水16G大内存 微信交友4G全网通（映海蓝）', '99', 'watch');
INSERT INTO `products` VALUES ('44', 'https://res.vmallres.com/pimages//product/6901443408115/428_428_C198AB8A054D7A38449FDD23A2A41162C377BE0830F42667mp.png', '1114', '华为手环 4e', '129', '赠送积分', '4091', '华为手环 4e 活力款 曜石黑 9项跑姿指导 骑行数据监测 篮球运动评分', '99', 'watch');
INSERT INTO `products` VALUES ('45', 'https://res.vmallres.com/pimages//product/6901443383207/428_428_1F0EA82470C3E8AA243C0694B888C4CBB1653D580719F234mp.png', '1115', '华为儿童手表 3 Pro 超能版', '988', '赠送积分', '2008', '华为儿童手表 3 Pro 超能版（樱语粉）4G全网通 高清视频通话 大存储 云相册 长续航 智能儿童手表', '99', 'watch');
INSERT INTO `products` VALUES ('46', 'https://res.vmallres.com/pimages//product/6941487201433/428_428_71B17AE02362129AE67DE3F104ACC47C43CE9F7BE01FE459mp.png', '1116', '华为智能体脂秤 3', '169', '赠送积分', '129', '华为智能体脂秤 3 雅致白 14项身体数据 对标DEXA金标准 WiFi&蓝牙双连接', '99', 'watch');
INSERT INTO `products` VALUES ('47', 'https://res.vmallres.com/pimages//product/6901443347049/428_428_8C4FDCA2E0EDFA3E3263CE7A28441652C073E5682B8179A2mp.png', '1117', '华为智能体脂秤 2 Pro', '499', '赠送积分', '6385', '华为智能体脂秤 2 Pro 雅致白  全方位身体成分分析  智能身材识别  蓝牙&WiFi 双连接', '99', 'watch');
INSERT INTO `products` VALUES ('48', 'https://res.vmallres.com/pimages//product/6901443362950/428_428_560FE764C43FB2FFC29E80E172525294BEA2BBE26DEBF3ECmp.png', '1118', 'HUAWEI VR Glass', '2999', '赠送积分', '3281', 'HUAWEI VR Glass（亮黑色）', '99', 'watch');
INSERT INTO `products` VALUES ('49', 'https://res.vmallres.com/pimages//product/4260184669592/428_428_340B6727826CA9EDED797D9C4EA3C6A1B5BF6A6096A51778mp.png', '1119', '贝尔金Belkin VR 计算机数据线', '436', '赠送积分', '362', '贝尔金Belkin VR 计算机数据线 黑色 (支持 HUAWEI VR Glass)（DESIGN FOR HUAWEI认证）', '99', 'watch');
INSERT INTO `products` VALUES ('50', 'https://res.vmallres.com/pimages//product/6901443239184/428_428_1539569391854mp.png', '1120', '华为手环 B5', '1199', '赠送积分', '30820', '华为手环 B5 商务版（摩卡棕）智能商务手环 蓝牙耳机 彩屏触控 心率监测 睡眠分析 智能提醒', '99', 'watch');
INSERT INTO `products` VALUES ('51', 'https://res.vmallres.com/pimages//product/6901443322237/428_428_B52943ACCB70E45E5223EC772D4DB9BBF8478C6A163829D8mp.png', '1121', '【42mm表盘】HUAWEI WATCH GT 2', '1388', '赠送积分', ' 576', '【42mm表盘】HUAWEI WATCH GT 2 运动款 幻夜黑（42mm）', '99', 'watch');
INSERT INTO `products` VALUES ('52', 'https://res.vmallres.com/pimages//product/6901443375271/428_428_4C7F8433FD4422B64C447BCB4002AD184DDFE3771DD41909mp.png', '1122', 'HUAWEI WATCH GT 2e', '1288', '赠送积分', '3680', 'HUAWEI WATCH GT 2e 运动款（曜石黑）两周续航 百种运动类型 音乐播放 多彩表盘 华为智能手表', '99', 'watch');
INSERT INTO `products` VALUES ('53', 'https://res.vmallres.com/pimages//product/6941487205219/428_428_28B5F5B15775FEB6D7F13F4CF1A3A8FF59B648B79E6D272Fmp.png', '1123', '【ECG款】HUAWEI WATCH GT 2 Pro', '2688', '赠送积分', '30647', '【ECG款】HUAWEI WATCH GT 2 Pro ECG款（曜石黑）', '99', 'watch');
INSERT INTO `products` VALUES ('54', 'https://res.vmallres.com/pimages//product/6901443264865/428_428_F001B47410B271832D2492CE648CFE733A6E615D9FBBD06Amp.png', '1124', '华为手环 3e 跑步精灵', '109', '赠送积分', '8810', '华为手环 3e 跑步精灵（曜石黑）14天长续航 50米防水 科学优化跑姿 创新跑鞋佩戴', '99', 'watch');
INSERT INTO `products` VALUES ('55', 'https://res.vmallres.com/pimages//product/6901443326815/428_428_37C8CF03401F10C09EF2D8D23182A48DC3E505A8C78245D7mp.png', '1125', '华为智能体脂秤wifi版', '199', '赠送积分', '7838', '华为智能体脂秤 WiFi版 白色（支持HUAWEI HiLink ）', '99', 'watch');
INSERT INTO `products` VALUES ('56', 'https://res.vmallres.com/pimages//product/6941487207756/428_428_A6A30621B8088CBBAF2D831A44CA9E945FEB6E9B64A1E201mp.png', '1201', 'HUAWEI FreeBuds 4i 无线耳机', '499', '赠送积分', '16765', '【新品】HUAWEI FreeBuds 4i 无线耳机（陶瓷白）主动降噪 通话降噪 环境音透传 10小时连续播放 快充长续航 纯净音质', '99', 'sound');
INSERT INTO `products` VALUES ('57', 'https://res.vmallres.com/pimages//product/6901443399048/428_428_870B6FE27F5BF4867AEAF26DA9389FDBDECC5DB85D23154Fmp.png', '1202', 'HUAWEI FreeBuds 3 无线耳机', '899', '赠送积分', '82318', '【有线充版】HUAWEI FreeBuds 3 无线耳机（陶瓷白）麒麟A1芯片 主动降噪  快充长续航', '99', 'sound');
INSERT INTO `products` VALUES ('58', 'https://res.vmallres.com/pimages//product/6901443200412/428_428_1554203937586mp.png', '1203', '华为经典耳机（USB Type-c版）', '99', '赠送积分', '25895', '华为经典耳机（USB Type-c版）', '99', 'sound');
INSERT INTO `products` VALUES ('59', 'https://res.vmallres.com/pimages//product/6941487202270/428_428_22A68F76BD87992F722FAFA5CF7BDCAE20975DA46A222199mp.png', '1204', 'HUAWEI FreeBuds Pro 无线耳机', '1099', '赠送积分', '48707', '【有线充版】HUAWEI FreeBuds Pro 真无线耳机（冰霜银）主动降噪  人声透传 快充长续航', '99', 'sound');
INSERT INTO `products` VALUES ('60', 'https://res.vmallres.com/pimages//product/6941487209248/428_428_522CB419E4D1D10C3A397B2D4BDCAC2115D2719D040C2C60mp.png', '1205', 'HUAWEI FreeLace Pro 无线耳机', '599', '赠送积分', '12030', 'HUAWEI FreeLace Pro 无线耳机 双重主动降噪 24小时长续航 樱语粉', '99', 'sound');
INSERT INTO `products` VALUES ('61', 'https://res.vmallres.com/pimages//product/6901443288229/428_428_2E27B7DF01ACE78E64E0BD8D14A2172A4FD97705AD4517C2mp.png', '1206', '华为AM115耳机', '49', '赠送积分', '46568', '华为 AM115 半入耳式耳机（白色）', '99', 'sound');
INSERT INTO `products` VALUES ('62', 'https://res.vmallres.com/pimages//product/6901443317301/428_428_1563239675439mp.png', '1207', 'HUAWEI FreeLace 无线耳机', '499', '赠送积分', '30052', 'HUAWEI FreeLace 无线耳机（仲夏紫）', '99', 'sound');
INSERT INTO `products` VALUES ('63', 'https://res.vmallres.com/pimages//product/6941487201037/428_428_14F688BFFE24C1D36327171F0B49F14005C320E1388EE298mp.png', '1208', 'HUAWEI X GENTLE MONSTER Eyewear II', '2499', '赠送积分', '1506', 'HUAWEI X GENTLE MONSTER Eyewear II 时尚智能眼镜 LUTTO-01（黑）高清通话 持久续航', '99', 'sound');
INSERT INTO `products` VALUES ('64', 'https://res.vmallres.com/pimages//product/6901443200399/428_428_1554204036772mp.png', '1209', 'CM20 模拟转接线', '29', '赠送积分', '22882', '华为耳机插口转换器（Type-C 至3.5mm耳机孔）', '99', 'sound');
INSERT INTO `products` VALUES ('65', 'https://res.vmallres.com/pimages//product/6901443412396/428_428_9975232FF659F2592E7C049E0F0B715D2EB699461F0AAE0Bmp.png', '1210', '华为 AI 音箱 2', '349', '赠送积分', '5749', '华为 AI 音箱 2（星云白）HUAWEI Sound 音质 华为分享 一碰传音 内容丰富 智能助手 华为智能音箱 标准版', '99', 'sound');
INSERT INTO `products` VALUES ('66', 'https://res.vmallres.com/pimages//product/6901443330515/428_428_61B2B001C67911714144CEE032220DBA78590283EA410A10mp.png', '1211', 'HUAWEI X Gentle Monster Eyewear', '1999', '赠送积分', '2210', 'HUAWEI X Gentle Monster Eyewear 智能眼镜高清立体声 SMART SOUTHSIDE-01（黑色）', '99', 'sound');
INSERT INTO `products` VALUES ('67', 'https://res.vmallres.com/pimages//product/6901443288199/428_428_223553587ECDBA007581F12C888CC70063AD3882E3B52EEEmp.png', '1212', '华为AM116半入耳式耳机', '89', '赠送积分', '38796', '华为 AM116半入耳式耳机（金色）', '99', 'sound');
INSERT INTO `products` VALUES ('68', 'https://res.vmallres.com/pimages//product/6901443356119/428_428_5D958398A838D6E435F42C4553C07FAC18DD542C47C28959mp.png', '1213', 'HUAWEI Sound X 智能音箱', '1999', '赠送积分', '8416', 'HUAWEI Sound X 智能音箱（星空之夜）帝瓦雷60W双低音炮 Hi-Res无损音质 一碰传音 智慧空间感知 振动平衡技术 海量音源丰富内容', '99', 'sound');
INSERT INTO `products` VALUES ('69', 'https://res.vmallres.com/pimages//product/6901443414284/428_428_95ABDBBEB551246423C83039D392DF64BDB6D332C4B9FEB3mp.png', '1214', 'HUAWEI Sound', '999', '赠送积分', '2893', 'HUAWEI Sound 智能音箱 帝瓦雷四喇叭 40W低音炮 Hi-Res无损音质 一碰传音 白金色', '99', 'sound');
INSERT INTO `products` VALUES ('70', 'https://res.vmallres.com/pimages//product/6941487204656/428_428_FB7BAC2D86AA8CA5DF84BE54FBE5FD73150052C815ADC835mp.png', '1215', 'HUAWEI FreeBuds Studio 无线头戴耳机', '1999', '赠送积分', '1291', 'HUAWEI FreeBuds Studio 无线头戴耳机  曜石黑 智慧动态降噪 宽频高解析音质 全场景智慧交互', '99', 'sound');
INSERT INTO `products` VALUES ('71', 'https://res.vmallres.com/pimages//product/6901443314836/428_428_1560224120470mp.png', '1216', '华为mini 蓝牙音箱', '129', '赠送积分', '318928', '华为mini蓝牙音箱 nova迷你小音箱（绮境森林）', '99', 'sound');
INSERT INTO `products` VALUES ('72', 'https://res.vmallres.com/pimages//product/6901443406838/428_428_60814568B27BAD7BF57038E5C00AACFD9CE06963317F2D84mp.png', '1217', 'HUAWEI FreeGO便携蓝牙音箱', '899', '赠送积分', '239', 'HUAWEI FreeGO便携蓝牙音箱（皓月银）', '99', 'sound');
INSERT INTO `products` VALUES ('73', 'https://res.vmallres.com/pimages//product/6901443289257/428_428_1558520355404mp.png', '1218', 'HUAWEI FreeBuds 悦享版 无线耳机', '399', '赠送积分', '32985', 'HUAWEI FreeBuds 悦享版 无线耳机 （陶瓷白）', '99', 'sound');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `phone` bigint(11) DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'chui', '15512345671', '123456');
INSERT INTO `user` VALUES ('2', 'chuihua', '15512345671', '123456');
INSERT INTO `user` VALUES ('3', 'shisan', '13912345678', '123456');
