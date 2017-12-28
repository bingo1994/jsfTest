/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : jsfdemo

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-12-01 17:15:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `yourself` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `strHabby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('3', 'bb', '111111', '小雪', '女', '2017-11-13', '大学', '北京-朝阳', '地方', '234@qq.com', '羽毛球,篮球');
INSERT INTO `tb_user` VALUES ('4', 'admin', '111111', '李大', '男', '2017-12-04', '高中', '安徽-合肥', 'fd', '5433@qq.com', '羽毛球,篮球');
INSERT INTO `tb_user` VALUES ('5', 'cc', '111111', '赵六', '女', '2017-11-13', '高中', '上海-浦东', '地方', '222@qq.com', '羽毛球,篮球');
