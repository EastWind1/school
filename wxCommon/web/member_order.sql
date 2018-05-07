/*
Navicat MySQL Data Transfer

Source Server         : icu
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : icu3

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-01-03 15:50:01
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `member_order`
-- ----------------------------
DROP TABLE IF EXISTS `member_order`;
CREATE TABLE `member_order` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `public_no` varchar(20) DEFAULT NULL,
  `expert_openId` varchar(200) DEFAULT NULL,
  `member_openId` varchar(50) DEFAULT NULL,
  `order_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `remark` text,
  `state` int(4) DEFAULT '3' COMMENT '0：拒绝 1：同意 2：完成 3：处理中 4：关闭 5：微信端提交基本信息',
  `sex` int(4) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `filed1` varchar(100) DEFAULT NULL,
  `filed2` varchar(100) DEFAULT NULL,
  `filed3` varchar(100) DEFAULT NULL,
  `filed4` varchar(100) DEFAULT NULL COMMENT '平台',
  `filed5` varchar(100) DEFAULT '',
  `age` int(4) DEFAULT NULL,
  `height` varchar(20) DEFAULT NULL COMMENT '高身',
  `weight` varchar(20) DEFAULT NULL COMMENT '重体',
  `occaption` varchar(100) DEFAULT NULL COMMENT '务职',
  `admission_time` varchar(20) DEFAULT NULL COMMENT '入院时间',
  `chief_complaint` varchar(800) DEFAULT NULL COMMENT '主诉',
  `ill_prenent` varchar(800) DEFAULT NULL COMMENT '病史现',
  `ill_post` varchar(800) DEFAULT NULL COMMENT '既往史',
  `ill_personal` varchar(800) DEFAULT NULL COMMENT '个人史',
  `ill_family` varchar(800) DEFAULT NULL COMMENT '族家史',
  `allergry_history` varchar(200) DEFAULT NULL COMMENT '过敏史',
  `delete_state` int(4) DEFAULT '1',
  `admission_check_id` varchar(50) DEFAULT NULL COMMENT '入院查体id',
  `lab_check_id` varchar(50) DEFAULT NULL COMMENT '验室实查体id',
  `img_check_id` varchar(50) DEFAULT NULL COMMENT '像学影查体id',
  `other_check_id` varchar(50) DEFAULT NULL COMMENT '其他辅助查体id',
  `admission_check` varchar(800) DEFAULT NULL COMMENT '入院查体',
  `lab_check` varchar(800) DEFAULT NULL COMMENT '验室实查体',
  `img_check` varchar(800) DEFAULT NULL COMMENT '像学影查体',
  `other_check` varchar(800) DEFAULT NULL COMMENT '其他辅助查体',
  `pre_diagnosis` varchar(800) DEFAULT NULL COMMENT '初步诊断',
  `treat_plan` varchar(800) DEFAULT NULL COMMENT '疗治计划',
  `ill_serious` varchar(800) DEFAULT NULL COMMENT '情病恶化',
  `consultation_time` varchar(20) DEFAULT NULL COMMENT '会诊时间',
  `online_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_order
-- ----------------------------
INSERT INTO `member_order` VALUES ('123', 'gh_8d5f9c073de7', 'jpk109', '6caa831df4764eff872df5ecf9488c36', null, '2015-12-16 09:45:08', null, '1', '1', null, null, '王春亭教授', '00000004', '王春亭教授', '1', '2015-12-18 23:30:00', null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, '2015-12-18 14:20:00', '15675123452');
INSERT INTO `member_order` VALUES ('3B1610D2-8FFA-496B-9059-48B5968D57BD', 'gh_8d5f9c073de7', 'o7FDrs611ZQMAD0ryh96gdVrHfgA', '404', null, '2016-01-01 22:06:41', '', '1', '1', '0', null, '王春亭教授', '00000004', '王春亭教授', '2', '2016-01-02 01:00:00', null, '', '', '', '', '预约会诊', '', '', '', '', '', '1', '78BBF5FE-FA32-457C-A8A0-96D00051715A', 'DB65A129-7503-414D-A3C2-D7E7EDDE1EB9', '941D6216-5FAB-4753-9493-978ECB6E7AE7', '66A44E11-80CD-4C2E-A795-649CC12A10D9', '', '', '', '', '', '', null, '2015-12-30 21:00:00', '15675123452');
INSERT INTO `member_order` VALUES ('5433DBA2-0617-406B-9DAA-F71A971F7F3B', 'gh_8d5f9c073de7', 'o7FDrs611ZQMAD0ryh96gdVrHfgA', '6358d2e3830c4bcfa47f2ff25d98f675', null, '2016-01-01 22:12:14', '', '1', '1', '0', null, '王春亭教授', '00000004', '王春亭教授', '2', '2016-01-02 01:00:00', null, '', '', '', '', '预约会诊', '', '', '', '', '', '1', '64F90A72-003C-4129-BA0D-CE89ECCB999C', '90026ADA-B1E7-43C8-B1E1-08D1EBF87EEC', '9C83FAA0-ADE4-40E2-8076-7517B94C5051', 'D37EC2FC-0B04-434A-93BC-CE2F3C3EB0E0', '', '', '', '', '', '', null, '2015-12-30 21:00:00', '15675123452');
INSERT INTO `member_order` VALUES ('6B0A2F54-05F1-420A-889F-1E4FCA203544', 'gh_8d5f9c073de7', 'o7FDrs611ZQMAD0ryh96gdVrHfgA', '6358d2e3830c4bcfa47f2ff25d98f675', null, '2016-01-03 15:44:31', '', '1', '1', '0', null, '王春亭教授', '00000004', '周一大交班', '2', '2016-01-04 12:30:00', null, '', '', '', '', '预约', '', '', '', '', '', '1', '1F743C7C-EA8E-4044-B571-BE8EEFD1E8FF', '86D4B804-5FB7-41F6-A63B-BADD0978020B', '34E8ADC1-DD28-4FC2-ABAB-D8F62697C4FC', '8849EEED-67B5-41BA-B5A4-A5B8A60368BF', '', '', '', '', '', '', null, '2016-01-04 07:00:00', '18126785553');
INSERT INTO `member_order` VALUES ('B7B2B526-DEB6-41EB-92C9-94C58952DD9A', 'gh_8d5f9c073de7', 'o7FDrs611ZQMAD0ryh96gdVrHfgA', '306', null, '2016-01-01 21:44:55', '', '1', '1', '0', null, '王春亭教授', '00000004', '王春亭教授', '2', '2016-01-02 01:00:00', null, '', '', '', '', '预约会诊', '', '', '', '', '', '1', '6E9E43A4-86B5-4B85-B594-355F8EB5F436', '62016281-E37C-4757-8816-34FD9C1548D6', 'DAA3686B-9371-483B-A9AC-FB9F5AFB3912', 'E06B8BAB-7034-4FBA-95CC-946DC96CB769', '', '', '', '', '', '', null, '2015-12-30 21:00:00', '15675123452');
INSERT INTO `member_order` VALUES ('BC2B6D09-D60D-4392-B7AE-C9076E676565', 'gh_8d5f9c073de7', 'jpk109', '6caa831df4764eff872df5ecf9488c36', null, '2015-12-16 09:45:08', '', '4', '1', '21', null, '王春亭教授', '00000004', '王春亭教授', '1', '2015-12-18 12:30:00', null, '', '', '', '', '测试内容', '', '', '', '', '', '1', 'F3BB3644-AA2A-489B-B146-2FD9DDA17042', '3ED556B6-FAA2-42A7-A374-207CCE2F9F54', 'B36EBAE2-5A36-4143-927E-5D1E02C732A5', '289D92FF-46AF-4591-8FF9-4559BD750FAE', '', '', '', '', '', '', null, '2015-12-18 09:40:00', '15675123452');
INSERT INTO `member_order` VALUES ('D2D0034F-8405-4ED0-8F25-4330590147E1', 'gh_8d5f9c073de7', 'o7FDrs611ZQMAD0ryh96gdVrHfgA', '1071', null, '2016-01-01 22:09:22', '', '1', '1', '0', null, '王春亭教授', '00000004', '王春亭教授', '2', '2015-12-18 12:30:00', null, '', '', '', '', '预约会诊', '', '', '', '', '', '1', 'BC23301C-702C-4B27-95AB-80ECA4F06C67', '1C6ADF63-4ABC-43AC-85B6-6E6EB84CEFF0', '2865A8AF-48AB-4EDD-A1C7-40C3B5896C4D', 'E7585A0F-EA62-4709-A912-5A0881729D0E', '', '', '', '', '', '', null, '2015-12-30 21:00:00', '15675123452');



INSERT INTO `member_order` VALUES ('1U0A2F54-05F1-420A-557F-1E4FCA203209', 'gh_8d5f9c073de7', 'o7FDrs611ZQMAD0ryh96gdVrHfgA', 'ce982e98cae445b8aacb9847cb99711f', null, '2016-01-03 15:44:31', '', '1', '1', '0', null, '王春亭教授', 'o7FDrs611ZQMAD0ryh96gdVrHfgA', '周一大交班', '2', '2017-01-04 12:00:00', null, '', '', '', '', '预约', '', '', '', '', '', '1', '87984C7C-EA8E-4044-B571-BE8EEFD1E8FF', '60D4B805-5679-41F6-A63B-BADD0978020B', '30E8ADC1-DD67-4FC2-ABAB-D8F76888C4FC', '1546EEED-67B5-98BA-B5A4-A5B8A60368BF', '', '', '', '', '', '', null, '2016-01-04 08:00:00', '18126785553');
