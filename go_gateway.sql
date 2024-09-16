/*
 Navicat Premium Data Transfer

 Source Server         : HSW3
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : go_gateway

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 16/08/2024 21:00:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gateway_admin
-- ----------------------------
DROP TABLE IF EXISTS `gateway_admin`;
CREATE TABLE `gateway_admin`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `salt` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '盐',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `create_at` datetime(0) NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '新增时间',
  `update_at` datetime(0) NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '更新时间',
  `is_delete` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_admin
-- ----------------------------
INSERT INTO `gateway_admin` VALUES (1, 'admin', 'admin', '2823d896e9822c0833d41d4904f0c00756d718570fce49b9a379a62c804689d3', '2020-04-10 16:42:05', '2024-07-14 15:55:02', 0);

-- ----------------------------
-- Table structure for gateway_app
-- ----------------------------
DROP TABLE IF EXISTS `gateway_app`;
CREATE TABLE `gateway_app`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `app_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '租户id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '租户名称',
  `secret` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '密钥',
  `white_ips` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'ip白名单，支持前缀匹配',
  `qpd` bigint(0) NOT NULL DEFAULT 0 COMMENT '日请求量限制',
  `qps` bigint(0) NOT NULL DEFAULT 0 COMMENT '每秒请求量限制',
  `create_at` datetime(0) NOT NULL COMMENT '添加时间',
  `update_at` datetime(0) NOT NULL COMMENT '更新时间',
  `is_delete` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否删除 1=删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '网关租户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_app
-- ----------------------------
INSERT INTO `gateway_app` VALUES (31, 'app_id_a', '租户A', '449441eb5e72dca9c42a12f3924ea3a2', 'white_ips', 100000, 100, '2024-07-27 10:55:02', '2024-07-27 10:55:02', 0);
INSERT INTO `gateway_app` VALUES (32, 'app_id_b', '租户B', '8d7b11ec9be0e59a36b52f32366c09cb', '', 20, 0, '2024-07-27 10:58:39', '2024-07-27 10:58:39', 0);
INSERT INTO `gateway_app` VALUES (33, 'app_id', '租户名称', '', '', 0, 0, '2024-07-27 11:03:02', '2024-07-27 11:03:02', 1);
INSERT INTO `gateway_app` VALUES (34, 'app_id45', '名称', '07d980f8a49347523ee1d5c1c41aec02', '', 0, 0, '2024-07-27 11:08:02', '2024-07-27 11:08:02', 1);

-- ----------------------------
-- Table structure for gateway_service_access_control
-- ----------------------------
DROP TABLE IF EXISTS `gateway_service_access_control`;
CREATE TABLE `gateway_service_access_control`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `service_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '服务id',
  `open_auth` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否开启权限 1=开启',
  `black_list` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '黑名单ip',
  `white_list` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '白名单ip',
  `white_host_name` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '白名单主机',
  `clientip_flow_limit` int(0) NOT NULL DEFAULT 0 COMMENT '客户端ip限流',
  `service_flow_limit` int(0) NOT NULL DEFAULT 0 COMMENT '服务端限流',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 191 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '网关权限控制表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_service_access_control
-- ----------------------------
INSERT INTO `gateway_service_access_control` VALUES (162, 35, 1, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (165, 34, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (167, 36, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (168, 38, 1, '111.11', '22.33', '11.11', 12, 12);
INSERT INTO `gateway_service_access_control` VALUES (169, 41, 1, '111.11', '22.33', '11.11', 12, 12);
INSERT INTO `gateway_service_access_control` VALUES (170, 42, 1, '111.11', '22.33', '11.11', 12, 12);
INSERT INTO `gateway_service_access_control` VALUES (171, 43, 0, '111.11', '22.33', '11.11', 12, 12);
INSERT INTO `gateway_service_access_control` VALUES (172, 44, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (173, 45, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (174, 46, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (175, 47, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (176, 48, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (177, 49, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (178, 50, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (179, 51, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (180, 52, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (181, 53, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (182, 54, 1, '127.0.0.3', '127.0.0.2', '', 11, 12);
INSERT INTO `gateway_service_access_control` VALUES (183, 55, 1, '127.0.0.2', '127.0.0.1', '', 45, 34);
INSERT INTO `gateway_service_access_control` VALUES (184, 56, 0, '192.168.1.0', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (185, 57, 0, '', '127.0.0.1,127.0.0.2', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (186, 58, 1, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (187, 59, 1, '127.0.0.1', '', '', 2, 3);
INSERT INTO `gateway_service_access_control` VALUES (188, 60, 1, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (189, 61, 0, '', '', '', 0, 0);
INSERT INTO `gateway_service_access_control` VALUES (190, 62, 0, '', '', '', 0, 0);

-- ----------------------------
-- Table structure for gateway_service_grpc_rule
-- ----------------------------
DROP TABLE IF EXISTS `gateway_service_grpc_rule`;
CREATE TABLE `gateway_service_grpc_rule`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `service_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '服务id',
  `port` int(0) NOT NULL DEFAULT 0 COMMENT '端口',
  `header_transfor` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'header转换支持增加(add)、删除(del)、修改(edit) 格式: add headname headvalue 多个逗号间隔',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '网关路由匹配表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_service_grpc_rule
-- ----------------------------
INSERT INTO `gateway_service_grpc_rule` VALUES (171, 53, 8009, '');
INSERT INTO `gateway_service_grpc_rule` VALUES (172, 54, 8002, 'add metadata1 datavalue,edit metadata2 datavalue2');
INSERT INTO `gateway_service_grpc_rule` VALUES (173, 58, 8012, 'add meta_name meta_value');

-- ----------------------------
-- Table structure for gateway_service_http_rule
-- ----------------------------
DROP TABLE IF EXISTS `gateway_service_http_rule`;
CREATE TABLE `gateway_service_http_rule`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `service_id` bigint(0) NOT NULL COMMENT '服务id',
  `rule_type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '匹配类型 0=url前缀url_prefix 1=域名domain ',
  `rule` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'type=domain表示域名，type=url_prefix时表示url前缀',
  `need_https` tinyint(0) NOT NULL DEFAULT 0 COMMENT '支持https 1=支持',
  `need_strip_uri` tinyint(0) NOT NULL DEFAULT 0 COMMENT '启用strip_uri 1=启用',
  `need_websocket` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否支持websocket 1=支持',
  `url_rewrite` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'url重写功能 格式：^/gatekeeper/test_service(.*) $1 多个逗号间隔',
  `header_transfor` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'header转换支持增加(add)、删除(del)、修改(edit) 格式: add headname headvalue 多个逗号间隔',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '网关路由匹配表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_service_http_rule
-- ----------------------------
INSERT INTO `gateway_service_http_rule` VALUES (165, 35, 1, '', 0, 0, 0, '', '');
INSERT INTO `gateway_service_http_rule` VALUES (168, 34, 0, '', 0, 0, 0, '', '');
INSERT INTO `gateway_service_http_rule` VALUES (170, 36, 0, '', 0, 0, 0, '', '');
INSERT INTO `gateway_service_http_rule` VALUES (171, 38, 0, '/abc', 1, 0, 1, '^/abc $1', 'add head1 value1');
INSERT INTO `gateway_service_http_rule` VALUES (172, 43, 0, '/usr', 1, 1, 0, '^/afsaasf $1,^/afsaasf $1', '');
INSERT INTO `gateway_service_http_rule` VALUES (173, 44, 1, 'www.test.com', 1, 1, 1, '', '');
INSERT INTO `gateway_service_http_rule` VALUES (174, 47, 1, 'www.test.com', 1, 1, 1, '', '');
INSERT INTO `gateway_service_http_rule` VALUES (175, 48, 1, 'www.test.com', 1, 1, 1, '', '');
INSERT INTO `gateway_service_http_rule` VALUES (176, 49, 1, 'www.test.com', 1, 1, 1, '', '');
INSERT INTO `gateway_service_http_rule` VALUES (177, 56, 0, '/test_http_service', 0, 0, 0, '^/test_http_service/abb/(.*) /test_http_service/bba/$1', 'add Add_header_name Hello_this_Header');
INSERT INTO `gateway_service_http_rule` VALUES (178, 59, 1, 'test.com', 0, 1, 1, '', 'add headername headervalue');
INSERT INTO `gateway_service_http_rule` VALUES (179, 60, 0, '/test_strip_uri', 0, 1, 0, '^/aaa/(.*) /bbb/$1', '');
INSERT INTO `gateway_service_http_rule` VALUES (180, 61, 0, '/test_https_server', 1, 1, 0, '', '');
INSERT INTO `gateway_service_http_rule` VALUES (181, 62, 0, '/test', 0, 1, 0, '^/test/aa/(.*) /test/bb/$1', '');

-- ----------------------------
-- Table structure for gateway_service_info
-- ----------------------------
DROP TABLE IF EXISTS `gateway_service_info`;
CREATE TABLE `gateway_service_info`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `load_type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '负载类型 0=http 1=tcp 2=grpc',
  `service_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '服务名称 6-128 数字字母下划线',
  `service_desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '服务描述',
  `create_at` datetime(0) NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '添加时间',
  `update_at` datetime(0) NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '更新时间',
  `is_delete` tinyint(0) NULL DEFAULT 0 COMMENT '是否删除 1=删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '网关基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_service_info
-- ----------------------------
INSERT INTO `gateway_service_info` VALUES (56, 0, 'test_http_service', '测试HTTP代理', '2024-07-27 16:54:58', '2024-07-27 16:54:58', 0);
INSERT INTO `gateway_service_info` VALUES (57, 1, 'test_tcp_service', '测试TCP代理', '2024-07-27 16:58:39', '2024-07-27 16:58:39', 0);
INSERT INTO `gateway_service_info` VALUES (58, 2, 'test_grpc_service', '测试GRPC服务', '2024-07-27 17:03:02', '2024-07-27 17:03:02', 0);
INSERT INTO `gateway_service_info` VALUES (59, 0, 'test.com:8080', '测试域名接入', '2024-07-27 17:08:02', '2024-07-27 17:08:02', 0);
INSERT INTO `gateway_service_info` VALUES (60, 0, 'test_strip_uri', '测试路径接入', '2024-08-16 19:15:39', '2024-08-16 19:15:39', 0);
INSERT INTO `gateway_service_info` VALUES (61, 0, 'test_https_server', '测试https服务', '2024-08-16 12:54:46', '2024-08-16 12:54:46', 0);
INSERT INTO `gateway_service_info` VALUES (62, 0, 'test_http_server', 'test', '2024-08-16 13:44:03', '2024-08-16 13:44:03', 1);

-- ----------------------------
-- Table structure for gateway_service_load_balance
-- ----------------------------
DROP TABLE IF EXISTS `gateway_service_load_balance`;
CREATE TABLE `gateway_service_load_balance`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `service_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '服务id',
  `check_method` tinyint(0) NOT NULL DEFAULT 0 COMMENT '检查方法 0=tcpchk,检测端口是否握手成功',
  `check_timeout` int(0) NOT NULL DEFAULT 0 COMMENT 'check超时时间,单位s',
  `check_interval` int(0) NOT NULL DEFAULT 0 COMMENT '检查间隔, 单位s',
  `round_type` tinyint(0) NOT NULL DEFAULT 2 COMMENT '轮询方式 0=random 1=round-robin 2=weight_round-robin 3=ip_hash',
  `ip_list` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'ip列表',
  `weight_list` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '权重列表',
  `forbid_list` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '禁用ip列表',
  `upstream_connect_timeout` int(0) NOT NULL DEFAULT 0 COMMENT '建立连接超时, 单位s',
  `upstream_header_timeout` int(0) NOT NULL DEFAULT 0 COMMENT '获取header超时, 单位s',
  `upstream_idle_timeout` int(0) NOT NULL DEFAULT 0 COMMENT '链接最大空闲时间, 单位s',
  `upstream_max_idle` int(0) NOT NULL DEFAULT 0 COMMENT '最大空闲链接数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 191 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '网关负载表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_service_load_balance
-- ----------------------------
INSERT INTO `gateway_service_load_balance` VALUES (162, 35, 0, 2000, 5000, 2, '127.0.0.1:50051', '100', '', 10000, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (165, 34, 0, 2000, 5000, 2, '100.90.164.31:8072,100.90.163.51:8072,100.90.163.52:8072,100.90.165.32:8072', '50,50,50,80', '', 20000, 20000, 10000, 100);
INSERT INTO `gateway_service_load_balance` VALUES (167, 36, 0, 2000, 5000, 2, '100.90.164.31:8072,100.90.163.51:8072,100.90.163.52:8072,100.90.165.32:8072', '50,50,50,80', '100.90.164.31:8072,100.90.163.51:8072', 10000, 10000, 10000, 100);
INSERT INTO `gateway_service_load_balance` VALUES (168, 38, 0, 0, 0, 1, '111:111,22:111', '11,11', '111', 1111, 111, 222, 333);
INSERT INTO `gateway_service_load_balance` VALUES (169, 41, 0, 0, 0, 1, '111:111,22:111', '11,11', '111', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (170, 42, 0, 0, 0, 1, '111:111,22:111', '11,11', '111', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (171, 43, 0, 2, 5, 1, '111:111,22:111', '11,11', '', 1111, 2222, 333, 444);
INSERT INTO `gateway_service_load_balance` VALUES (172, 44, 0, 2, 5, 2, '127.0.0.1:8076', '50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (173, 45, 0, 2, 5, 2, '127.0.0.1:88', '50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (174, 46, 0, 2, 5, 2, '127.0.0.1:8002', '50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (175, 47, 0, 2, 5, 2, '12777:11', '11', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (176, 48, 0, 2, 5, 2, '12777:11', '11', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (177, 49, 0, 2, 5, 2, '12777:11', '11', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (178, 50, 0, 2, 5, 2, '127.0.0.1:8001', '50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (179, 51, 0, 2, 5, 2, '1212:11', '50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (180, 52, 0, 2, 5, 2, '1212:11', '50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (181, 53, 0, 2, 5, 2, '1111:11', '111', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (182, 54, 0, 2, 5, 1, '127.0.0.1:80', '50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (183, 55, 0, 2, 5, 3, '127.0.0.1:81', '50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (184, 56, 0, 2, 5, 2, '127.0.0.1:2003,127.0.0.1:2004', '50,50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (185, 57, 0, 2, 5, 2, '127.0.0.1:6379', '50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (186, 58, 0, 2, 5, 2, '127.0.0.1:50055', '50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (187, 59, 0, 2, 5, 2, '127.0.0.1:2003,127.0.0.1:2004', '50,50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (188, 60, 0, 2, 5, 2, '127.0.0.1:2003,127.0.0.1:2004', '50,50', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (189, 61, 0, 2, 5, 2, '127.0.0.1:2003,127.0.0.1:2004', '40,10', '', 0, 0, 0, 0);
INSERT INTO `gateway_service_load_balance` VALUES (190, 62, 0, 0, 0, 2, '127.0.0.1:2003,127.0.0.1:2004', '50,0', '', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for gateway_service_tcp_rule
-- ----------------------------
DROP TABLE IF EXISTS `gateway_service_tcp_rule`;
CREATE TABLE `gateway_service_tcp_rule`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `service_id` bigint(0) NOT NULL COMMENT '服务id',
  `port` int(0) NOT NULL DEFAULT 0 COMMENT '端口号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '网关路由匹配表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway_service_tcp_rule
-- ----------------------------
INSERT INTO `gateway_service_tcp_rule` VALUES (171, 41, 8002);
INSERT INTO `gateway_service_tcp_rule` VALUES (172, 42, 8003);
INSERT INTO `gateway_service_tcp_rule` VALUES (173, 43, 8004);
INSERT INTO `gateway_service_tcp_rule` VALUES (174, 38, 8004);
INSERT INTO `gateway_service_tcp_rule` VALUES (175, 45, 8001);
INSERT INTO `gateway_service_tcp_rule` VALUES (176, 46, 8005);
INSERT INTO `gateway_service_tcp_rule` VALUES (177, 50, 8006);
INSERT INTO `gateway_service_tcp_rule` VALUES (178, 51, 8007);
INSERT INTO `gateway_service_tcp_rule` VALUES (179, 52, 8008);
INSERT INTO `gateway_service_tcp_rule` VALUES (180, 55, 8010);
INSERT INTO `gateway_service_tcp_rule` VALUES (181, 57, 8011);

SET FOREIGN_KEY_CHECKS = 1;
