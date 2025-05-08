/*
 Navicat Premium Data Transfer

 Source Server         : 本地库-8.0-root
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : localhost:13306
 Source Schema         : ry-cloud

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 21/03/2025 13:02:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'py_detection_image', '检测图片记录表', NULL, NULL, 'PyDetectionImage', 'crud', '', 'com.ruoyi.system', 'system', 'image', '检测图片记录', 'ruoyi', '0', '/', NULL, 'admin', '2025-03-20 11:27:44', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'py_detection_record', '图像检测记录表', NULL, NULL, 'PyDetectionRecord', 'crud', '', 'com.ruoyi.system', 'system', 'record', '图像检测记录', 'ruoyi', '0', '/', NULL, 'admin', '2025-03-20 11:27:44', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '图片ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, 1, 'url', '图片URL路径', 'varchar(255)', 'String', 'url', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, 1, 'file_name', '原始文件名', 'varchar(100)', 'String', 'fileName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, 1, 'file_size', '文件大小(字节)', 'bigint', 'Long', 'fileSize', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, 1, 'width', '图片宽度', 'int', 'Long', 'width', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, 1, 'height', '图片高度', 'int', 'Long', 'height', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, 1, 'mime_type', '图片MIME类型', 'varchar(50)', 'String', 'mimeType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, 2, 'id', '检测ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, 2, 'original_image_id', '原始图片ID', 'bigint', 'Long', 'originalImageId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, 2, 'result_image_url', '检测结果图片URL', 'varchar(255)', 'String', 'resultImageUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, 2, 'processing_time', '处理时间(毫秒)', 'int', 'Long', 'processingTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, 2, 'model_name', '检测模型名称', 'varchar(50)', 'String', 'modelName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, 2, 'object_count', '检测对象数量', 'int', 'Long', 'objectCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, 2, 'image_width', '图片宽度', 'int', 'Long', 'imageWidth', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, 2, 'image_height', '图片高度', 'int', 'Long', 'imageHeight', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, 2, 'detection_items', '检测对象详情JSON数组', 'json', 'String', 'detectionItems', '0', '0', NULL, '1', '1', '1', '1', 'EQ', NULL, '', 9, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, 2, 'status', '状态(0:处理中 1:完成 2:失败)', 'tinyint', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2025-03-20 11:27:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2025-03-20 11:27:44', '', NULL);

-- ----------------------------
-- Table structure for py_detection_image
-- ----------------------------
DROP TABLE IF EXISTS `py_detection_image`;
CREATE TABLE `py_detection_image`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片URL路径',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始文件名',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小(字节)',
  `width` int NULL DEFAULT NULL COMMENT '图片宽度',
  `height` int NULL DEFAULT NULL COMMENT '图片高度',
  `mime_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片MIME类型',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '检测图片记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of py_detection_image
-- ----------------------------
INSERT INTO `py_detection_image` VALUES (10, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320202413A012.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:24:15', NULL);
INSERT INTO `py_detection_image` VALUES (11, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320202440A013.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:24:41', 'admin');
INSERT INTO `py_detection_image` VALUES (12, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb11qAG4kJADwcPb1TA-g020_20250320202848A014.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:28:49', 'admin');
INSERT INTO `py_detection_image` VALUES (13, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320203009A015.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:30:11', 'admin');
INSERT INTO `py_detection_image` VALUES (14, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320203009A015.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:30:11', 'admin');
INSERT INTO `py_detection_image` VALUES (15, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb12uAPyS1AEKyw9RhsPA879_20250320203104A016.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:31:05', 'admin');
INSERT INTO `py_detection_image` VALUES (16, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb12uAPyS1AEKyw9RhsPA879_20250320203104A016.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:31:06', 'admin');
INSERT INTO `py_detection_image` VALUES (17, 'http://127.0.0.1:9300/statics/2025/03/20/25424704_1_20250320203110A017.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:31:12', 'admin');
INSERT INTO `py_detection_image` VALUES (18, 'http://127.0.0.1:9300/statics/2025/03/20/25424704_1_20250320203110A017.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:31:12', 'admin');
INSERT INTO `py_detection_image` VALUES (19, 'http://127.0.0.1:9300/statics/2025/03/20/14361770_E919348_c119f485_20250320203135A019.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:31:35', 'admin');
INSERT INTO `py_detection_image` VALUES (20, 'http://127.0.0.1:9300/statics/2025/03/20/14361770_E919348_c119f485_20250320203135A019.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:31:36', 'admin');
INSERT INTO `py_detection_image` VALUES (21, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320203651A020.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:36:54', 'admin');
INSERT INTO `py_detection_image` VALUES (22, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320203651A020.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:36:54', 'admin');
INSERT INTO `py_detection_image` VALUES (23, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320204437A021.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:44:38', 'admin');
INSERT INTO `py_detection_image` VALUES (24, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320204437A021.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 20:44:38', 'admin');
INSERT INTO `py_detection_image` VALUES (25, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320210152A022.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 21:01:54', 'admin');
INSERT INTO `py_detection_image` VALUES (26, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320210152A022.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 21:01:54', 'admin');
INSERT INTO `py_detection_image` VALUES (27, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320210415A026.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 21:04:19', 'admin');
INSERT INTO `py_detection_image` VALUES (28, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320210415A026.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 21:04:19', 'admin');
INSERT INTO `py_detection_image` VALUES (29, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320211106A033.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 21:11:07', 'ry');
INSERT INTO `py_detection_image` VALUES (30, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320211106A033.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 21:11:07', 'ry');
INSERT INTO `py_detection_image` VALUES (31, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320233952A034.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 23:39:53', '2');
INSERT INTO `py_detection_image` VALUES (32, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320233952A034.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 23:39:53', '2');
INSERT INTO `py_detection_image` VALUES (33, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb12uAPyS1AEKyw9RhsPA879_20250320235141A041.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 23:51:41', '2');
INSERT INTO `py_detection_image` VALUES (34, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb12uAPyS1AEKyw9RhsPA879_20250320235141A041.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-20 23:51:42', '2');

-- ----------------------------
-- Table structure for py_detection_record
-- ----------------------------
DROP TABLE IF EXISTS `py_detection_record`;
CREATE TABLE `py_detection_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '检测ID',
  `original_image_id` bigint NULL DEFAULT NULL COMMENT '原始图片ID',
  `result_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检测结果图片URL',
  `processing_time` int NULL DEFAULT NULL COMMENT '处理时间(毫秒)',
  `model_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'YOLOv5' COMMENT '检测模型名称',
  `object_count` int NULL DEFAULT 0 COMMENT '检测对象数量',
  `image_width` int NULL DEFAULT NULL COMMENT '图片宽度',
  `image_height` int NULL DEFAULT NULL COMMENT '图片高度',
  `detection_items` json NULL COMMENT '检测对象详情JSON数组',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态(0:处理中 1:完成 2:失败)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_original_image_id`(`original_image_id` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '图像检测记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of py_detection_record
-- ----------------------------
INSERT INTO `py_detection_record` VALUES (1, 13, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320203009A015.jpg', NULL, 'YOLOv5', 0, NULL, NULL, NULL, 0, '2025-03-20 20:30:11', NULL, NULL, NULL);
INSERT INTO `py_detection_record` VALUES (2, 15, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb12uAPyS1AEKyw9RhsPA879_20250320203104A016.jpg', NULL, 'YOLOv5', 0, NULL, NULL, NULL, 0, '2025-03-20 20:31:05', NULL, NULL, NULL);
INSERT INTO `py_detection_record` VALUES (3, 17, 'http://127.0.0.1:9300/statics/2025/03/20/25424704_1_20250320203110A017.jpg', NULL, 'YOLOv5', 0, NULL, NULL, NULL, 0, '2025-03-20 20:31:12', NULL, NULL, NULL);
INSERT INTO `py_detection_record` VALUES (4, 19, 'http://127.0.0.1:9300/statics/2025/03/20/14361770_E919348_c119f485_20250320203135A019.jpg', NULL, 'YOLOv5', 0, NULL, NULL, NULL, 0, '2025-03-20 20:31:35', NULL, NULL, NULL);
INSERT INTO `py_detection_record` VALUES (8, 27, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320210415A026.jpg', NULL, 'YOLOv5', 0, NULL, NULL, NULL, 0, '2025-03-20 21:04:19', NULL, NULL, NULL);
INSERT INTO `py_detection_record` VALUES (10, 31, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320233952A034.jpg', NULL, 'YOLOv5', 0, NULL, NULL, NULL, 0, '2025-03-20 23:39:53', NULL, NULL, NULL);
INSERT INTO `py_detection_record` VALUES (11, 33, 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb12uAPyS1AEKyw9RhsPA879_20250320235141A041.jpg', NULL, 'YOLOv5', 0, NULL, NULL, NULL, 0, '2025-03-20 23:51:41', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2025-03-19 07:59:21', 'admin', '2025-03-19 11:12:21', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-03-19 07:59:21', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-03-19 07:59:21', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-03-19 07:59:21', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-03-19 07:59:21', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-19 07:59:19', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-19 07:59:19', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-19 07:59:19', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-19 07:59:19', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-19 07:59:19', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-19 07:59:19', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-19 07:59:19', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-19 07:59:19', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-19 07:59:19', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-19 07:59:19', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-03-19 07:59:21', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_forum_collect
-- ----------------------------
DROP TABLE IF EXISTS `sys_forum_collect`;
CREATE TABLE `sys_forum_collect`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '帖子ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_post`(`user_id` ASC, `post_id` ASC) USING BTREE,
  INDEX `idx_post_id`(`post_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '论坛收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_forum_collect
-- ----------------------------

-- ----------------------------
-- Table structure for sys_forum_comment
-- ----------------------------
DROP TABLE IF EXISTS `sys_forum_comment`;
CREATE TABLE `sys_forum_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `post_id` bigint NOT NULL COMMENT '帖子ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `like_count` bigint NULL DEFAULT 0 COMMENT '点赞次数',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父评论ID，如果为0表示是顶层评论',
  `reply_user_id` bigint NULL DEFAULT NULL COMMENT '回复的用户ID',
  `reply_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回复的用户昵称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_post_id`(`post_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '论坛评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_forum_comment
-- ----------------------------
INSERT INTO `sys_forum_comment` VALUES (17, 8, 1, NULL, NULL, '666', 0, 0, NULL, NULL, '2025-03-20 14:54:18', '2025-03-20 14:54:18', '0');
INSERT INTO `sys_forum_comment` VALUES (18, 8, 1, NULL, NULL, '123', 0, 0, NULL, NULL, '2025-03-20 15:17:18', '2025-03-20 15:17:18', '0');
INSERT INTO `sys_forum_comment` VALUES (19, 8, 2, NULL, NULL, '12313', 0, 0, NULL, NULL, '2025-03-20 15:17:32', '2025-03-20 15:17:32', '0');
INSERT INTO `sys_forum_comment` VALUES (20, 8, 2, NULL, NULL, '666', 0, 0, NULL, NULL, '2025-03-20 15:23:32', '2025-03-20 15:23:32', '0');
INSERT INTO `sys_forum_comment` VALUES (21, 8, 1, NULL, NULL, '111', 0, 0, NULL, NULL, '2025-03-20 15:25:11', '2025-03-20 15:25:11', '0');
INSERT INTO `sys_forum_comment` VALUES (22, 8, 1, NULL, NULL, '123131', 0, 0, NULL, NULL, '2025-03-20 15:28:45', '2025-03-20 15:28:45', '0');
INSERT INTO `sys_forum_comment` VALUES (23, 8, 2, NULL, NULL, '1111', 0, 0, NULL, NULL, '2025-03-20 15:32:43', '2025-03-20 15:32:43', '0');
INSERT INTO `sys_forum_comment` VALUES (24, 8, 2, NULL, NULL, '12414', 0, 0, NULL, NULL, '2025-03-20 15:34:44', '2025-03-20 15:34:44', '0');
INSERT INTO `sys_forum_comment` VALUES (25, 8, 2, NULL, NULL, '123123', 0, 0, NULL, NULL, '2025-03-20 15:35:32', '2025-03-20 15:35:32', '0');

-- ----------------------------
-- Table structure for sys_forum_follow
-- ----------------------------
DROP TABLE IF EXISTS `sys_forum_follow`;
CREATE TABLE `sys_forum_follow`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '关注ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `follow_user_id` bigint NOT NULL COMMENT '关注的用户ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_follow`(`user_id` ASC, `follow_user_id` ASC) USING BTREE,
  INDEX `idx_follow_user_id`(`follow_user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '论坛关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_forum_follow
-- ----------------------------

-- ----------------------------
-- Table structure for sys_forum_like
-- ----------------------------
DROP TABLE IF EXISTS `sys_forum_like`;
CREATE TABLE `sys_forum_like`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `target_id` bigint NOT NULL COMMENT '目标ID（帖子ID或评论ID）',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型（1帖子 2评论）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_target`(`user_id` ASC, `target_id` ASC, `type` ASC) USING BTREE,
  INDEX `idx_target_id`(`target_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '论坛点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_forum_like
-- ----------------------------

-- ----------------------------
-- Table structure for sys_forum_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_forum_message`;
CREATE TABLE `sys_forum_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `user_id` bigint NOT NULL COMMENT '接收用户ID',
  `from_user_id` bigint NOT NULL COMMENT '发送用户ID',
  `from_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发送用户昵称',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息类型（1评论 2点赞 3关注 4系统）',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息内容',
  `target_id` bigint NULL DEFAULT NULL COMMENT '目标ID（帖子ID或评论ID）',
  `is_read` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否已读（0未读 1已读）',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_type`(`type` ASC) USING BTREE,
  INDEX `idx_is_read`(`is_read` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '论坛消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_forum_message
-- ----------------------------
INSERT INTO `sys_forum_message` VALUES (7, 1, 1, 'admin', '1', '123131', 8, '0', '2025-03-20 15:38:48', '2025-03-20 15:38:48', '2');
INSERT INTO `sys_forum_message` VALUES (8, 2, 2, 'ry', '1', '1111', 8, '0', '2025-03-20 15:38:47', '2025-03-20 15:38:47', '2');
INSERT INTO `sys_forum_message` VALUES (9, 2, 2, 'ry', '1', '12414', 8, '0', '2025-03-20 15:38:45', '2025-03-20 15:38:45', '2');
INSERT INTO `sys_forum_message` VALUES (10, 2, 2, 'ry', '1', '123', 8, '0', '2025-03-20 15:37:12', '2025-03-20 15:37:12', '0');

-- ----------------------------
-- Table structure for sys_forum_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_forum_post`;
CREATE TABLE `sys_forum_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '帖子标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '帖子内容',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帖子分类',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帖子标签，多个用逗号分隔',
  `view_count` bigint NULL DEFAULT 0 COMMENT '浏览次数',
  `like_count` bigint NULL DEFAULT 0 COMMENT '点赞次数',
  `comment_count` bigint NULL DEFAULT 0 COMMENT '评论次数',
  `is_top` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否置顶（0否 1是）',
  `is_essence` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否精华（0否 1是）',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1关闭）',
  `last_reply_time` datetime NULL DEFAULT NULL COMMENT '最后回复时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_category`(`category` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '论坛帖子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_forum_post
-- ----------------------------
INSERT INTO `sys_forum_post` VALUES (1, 1, NULL, NULL, '12313', '12311231313113', 'tech', '后端,Vue', 3, 0, 1, '0', '0', 'http://127.0.0.1:9300/statics/2025/03/19/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250319225707A003.jpg', '0', NULL, 'admin', '2025-03-19 15:04:57', NULL, '2025-03-20 01:03:05', '2');
INSERT INTO `sys_forum_post` VALUES (2, 2, NULL, NULL, '123131313', '123123131123131', 'tech', '后端,React', 3, 0, 1, '0', '0', 'http://127.0.0.1:9300/statics/2025/03/19/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250319234053A007.jpg', '0', NULL, 'ry', '2025-03-19 15:40:54', NULL, '2025-03-19 15:40:54', '0');
INSERT INTO `sys_forum_post` VALUES (3, 1, NULL, NULL, '测试图像检测000', '测试图像检测\n测试图像检测\n测试图像检测', 'tech', '前端', 3, 0, 2, '0', '0', 'http://127.0.0.1:9300/statics/2025/03/20/14361770_E919348_c119f485_20250320001752A008.jpg,http://127.0.0.1:9300/statics/2025/03/20/OIP-C_20250320001755A009.jpg', '0', '2025-03-20 12:54:58', 'admin', '2025-03-19 16:17:56', NULL, '2025-03-20 01:07:10', '0');
INSERT INTO `sys_forum_post` VALUES (4, 2, NULL, NULL, '123123131313', '1231231231231313131313', 'tech', 'React,数据库', 3, 0, 2, '0', '0', 'http://127.0.0.1:9300/statics/2025/03/20/生成特定风格图片 (3)_20250320084156A001.png', '0', '2025-03-20 13:00:14', 'ry', '2025-03-20 00:42:00', NULL, '2025-03-20 00:42:00', '0');
INSERT INTO `sys_forum_post` VALUES (5, 1, NULL, NULL, '12313131313', '1231322131231321313', 'question', 'React,数据库,云服务', 0, 0, 0, '0', '0', 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb11qAG4kJADwcPb1TA-g020_20250320210213A023.jpg,http://127.0.0.1:9300/statics/2025/03/20/生成特定风格图片 (1)_20250320210215A024.png', '0', NULL, 'admin', '2025-03-20 13:02:16', NULL, '2025-03-20 13:02:16', '0');
INSERT INTO `sys_forum_post` VALUES (6, 1, NULL, NULL, '7777777777777777777777', '1231231313123123131', 'tech', '后端,Vue', 0, 0, 1, '0', '0', 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320210243A025.jpg', '0', '2025-03-20 13:04:08', 'admin', '2025-03-20 13:02:43', NULL, '2025-03-20 13:02:43', '0');
INSERT INTO `sys_forum_post` VALUES (7, 2, NULL, NULL, '123131313213131', '123131312312313123', 'question', '后端,Vue', 0, 0, 1, '0', '0', 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb11qAG4kJADwcPb1TA-g020_20250320210859A028.jpg,http://127.0.0.1:9300/statics/2025/03/20/生成特定风格图片 (1)_20250320210901A029.png', '0', '2025-03-20 13:09:09', 'ry', '2025-03-20 13:09:02', NULL, '2025-03-20 13:09:02', '0');
INSERT INTO `sys_forum_post` VALUES (8, 2, NULL, NULL, '675475757', '1231321312312312312312434243', 'question', '云服务,AI,开源', 0, 0, 13, '0', '0', 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb12uAPyS1AEKyw9RhsPA879_20250320211008A031.jpg', '0', '2025-03-20 15:35:32', 'ry', '2025-03-20 13:10:09', NULL, '2025-03-20 15:41:08', '0');

-- ----------------------------
-- Table structure for sys_forum_statistics
-- ----------------------------
DROP TABLE IF EXISTS `sys_forum_statistics`;
CREATE TABLE `sys_forum_statistics`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '统计ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_count` bigint NULL DEFAULT 0 COMMENT '发帖数',
  `comment_count` bigint NULL DEFAULT 0 COMMENT '评论数',
  `like_count` bigint NULL DEFAULT 0 COMMENT '获赞数',
  `follow_count` bigint NULL DEFAULT 0 COMMENT '关注数',
  `fans_count` bigint NULL DEFAULT 0 COMMENT '粉丝数',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '论坛统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_forum_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-03-19 07:59:21', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-03-19 07:59:21', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-03-19 07:59:21', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`access_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 186 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, '', '127.0.0.1', '0', '退出成功', '2025-03-19 08:07:22');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 08:07:27');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 09:35:45');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-19 09:35:45');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 09:36:05');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-19 09:36:05');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 11:11:11');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-19 11:11:13');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 11:11:52');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-19 11:12:45');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 11:12:51');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 14:55:39');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-19 15:13:28');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 15:13:35');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-19 15:31:50');
INSERT INTO `sys_logininfor` VALUES (115, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-19 15:31:58');
INSERT INTO `sys_logininfor` VALUES (116, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-19 15:32:48');
INSERT INTO `sys_logininfor` VALUES (117, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-19 15:32:54');
INSERT INTO `sys_logininfor` VALUES (118, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-19 15:34:28');
INSERT INTO `sys_logininfor` VALUES (119, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-19 15:34:47');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 15:34:51');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-19 15:37:33');
INSERT INTO `sys_logininfor` VALUES (122, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-19 15:37:42');
INSERT INTO `sys_logininfor` VALUES (123, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-19 15:38:36');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 15:38:39');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-19 15:38:42');
INSERT INTO `sys_logininfor` VALUES (126, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-19 15:38:47');
INSERT INTO `sys_logininfor` VALUES (127, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-19 15:39:09');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 15:39:13');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-19 15:39:20');
INSERT INTO `sys_logininfor` VALUES (130, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-19 15:39:24');
INSERT INTO `sys_logininfor` VALUES (131, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-19 15:56:12');
INSERT INTO `sys_logininfor` VALUES (132, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-19 15:56:19');
INSERT INTO `sys_logininfor` VALUES (133, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-19 16:03:04');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-19 16:03:07');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 00:31:56');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 00:32:03');
INSERT INTO `sys_logininfor` VALUES (137, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-20 00:32:08');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 00:45:46');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 01:12:39');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 01:12:44');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 11:26:32');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 11:31:00');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 11:31:03');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 11:32:15');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 13:00:40');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 13:01:13');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 13:03:27');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 13:03:40');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 13:08:32');
INSERT INTO `sys_logininfor` VALUES (150, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-20 13:08:45');
INSERT INTO `sys_logininfor` VALUES (151, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-20 13:09:20');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 13:09:25');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 13:09:39');
INSERT INTO `sys_logininfor` VALUES (154, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-20 13:09:54');
INSERT INTO `sys_logininfor` VALUES (155, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-20 13:10:34');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 13:10:39');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 13:10:56');
INSERT INTO `sys_logininfor` VALUES (158, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-20 13:11:01');
INSERT INTO `sys_logininfor` VALUES (159, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-20 13:12:22');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 13:12:25');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 13:13:51');
INSERT INTO `sys_logininfor` VALUES (162, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-20 13:13:56');
INSERT INTO `sys_logininfor` VALUES (163, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-20 14:54:08');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 14:54:11');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 15:17:24');
INSERT INTO `sys_logininfor` VALUES (166, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-20 15:17:28');
INSERT INTO `sys_logininfor` VALUES (167, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-20 15:24:58');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 15:25:01');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 15:25:13');
INSERT INTO `sys_logininfor` VALUES (170, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-20 15:25:22');
INSERT INTO `sys_logininfor` VALUES (171, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-20 15:25:32');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 15:25:38');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 15:25:49');
INSERT INTO `sys_logininfor` VALUES (174, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-20 15:25:53');
INSERT INTO `sys_logininfor` VALUES (175, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-20 15:28:36');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 15:28:40');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 15:28:48');
INSERT INTO `sys_logininfor` VALUES (178, 'ry', '127.0.0.1', '0', '登录成功', '2025-03-20 15:28:55');
INSERT INTO `sys_logininfor` VALUES (179, 'ry', '127.0.0.1', '0', '退出成功', '2025-03-20 15:52:12');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 15:52:17');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 15:54:01');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 15:54:04');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-20 16:08:14');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '0', '退出成功', '2025-03-20 16:20:48');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '0', '登录成功', '2025-03-21 02:16:15');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2013 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-03-19 07:59:19', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2025-03-19 07:59:19', 'admin', '2025-03-19 08:09:15', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2025-03-19 07:59:19', 'admin', '2025-03-20 12:01:13', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-03-19 07:59:19', 'admin', '2025-03-21 02:16:35', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-03-19 07:59:19', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-03-19 07:59:19', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-03-19 07:59:19', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-03-19 07:59:19', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-03-19 07:59:19', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-03-19 07:59:19', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-03-19 07:59:19', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-03-19 07:59:19', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-03-19 07:59:19', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-03-19 07:59:19', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2025-03-19 07:59:19', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2025-03-19 07:59:19', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-03-19 07:59:19', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-03-19 07:59:19', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-03-19 07:59:19', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-03-19 07:59:19', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2025-03-19 07:59:19', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2025-03-19 07:59:19', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '去论坛', 0, 10, '/forum/home', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'cascader', 'admin', '2025-03-19 08:14:33', 'admin', '2025-03-20 13:13:00', '');
INSERT INTO `sys_menu` VALUES (2001, '检测图片记录', 0, 9, 'image', 'system/image/index', NULL, '', 1, 0, 'C', '0', '0', 'system:image:list', 'component', 'admin', '2025-03-20 11:30:23', 'admin', '2025-03-20 12:00:40', '检测图片记录菜单');
INSERT INTO `sys_menu` VALUES (2002, '检测图片记录查询', 2001, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:image:query', '#', 'admin', '2025-03-20 11:30:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '检测图片记录新增', 2001, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:image:add', '#', 'admin', '2025-03-20 11:30:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '检测图片记录修改', 2001, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:image:edit', '#', 'admin', '2025-03-20 11:30:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '检测图片记录删除', 2001, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:image:remove', '#', 'admin', '2025-03-20 11:30:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '检测图片记录导出', 2001, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:image:export', '#', 'admin', '2025-03-20 11:30:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '图像检测记录', 0, 8, 'record', 'system/record/index', NULL, '', 1, 0, 'C', '0', '0', 'system:record:list', 'build', 'admin', '2025-03-20 11:30:39', 'admin', '2025-03-20 12:00:51', '图像检测记录菜单');
INSERT INTO `sys_menu` VALUES (2008, '图像检测记录查询', 2007, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:record:query', '#', 'admin', '2025-03-20 11:30:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '图像检测记录新增', 2007, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:record:add', '#', 'admin', '2025-03-20 11:30:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '图像检测记录修改', 2007, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:record:edit', '#', 'admin', '2025-03-20 11:30:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '图像检测记录删除', 2007, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:record:remove', '#', 'admin', '2025-03-20 11:30:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '图像检测记录导出', 2007, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:record:export', '#', 'admin', '2025-03-20 11:30:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-03-19 07:59:21', 'admin', '2025-03-21 02:16:52', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2025-03-19 07:59:19\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 08:09:15', 41);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"去论坛\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/home\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 08:14:33', 19);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2025-03-19 08:14:33\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"去论坛\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/forum/home\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 08:47:53', 23);
INSERT INTO `sys_oper_log` VALUES (103, '参数管理', 2, 'com.ruoyi.system.controller.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/config', '127.0.0.1', '', '{\"configId\":1,\"configKey\":\"sys.index.skinName\",\"configName\":\"主框架页-默认皮肤样式名称\",\"configType\":\"Y\",\"configValue\":\"skin-green\",\"createBy\":\"admin\",\"createTime\":\"2025-03-19 07:59:21\",\"params\":{},\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 11:12:21', 42);
INSERT INTO `sys_oper_log` VALUES (104, '参数管理', 9, 'com.ruoyi.system.controller.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/config/refreshCache', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 11:12:39', 21);
INSERT INTO `sys_oper_log` VALUES (105, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/19/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250319225707A003.jpg\"],\"title\":\"12313\",\"category\":\"tech\",\"content\":\"12311231313113\",\"tags\":[\"后端\",\"Vue\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'images\' in \'field list\'\r\n### The error may exist in com/ruoyi/system/mapper/SysForumPostMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.SysForumPostMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_forum_post ( user_id, title, content, category, tags, images,  view_count, like_count, comment_count,  is_top, is_essence, status, create_by, create_time, update_by, update_time, del_flag ) values ( ?, ?, ?, ?, ?, ?,  0, 0, 0,  \'0\', \'0\', \'0\', ?, sysdate(), ?, sysdate(), \'0\' )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'images\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'images\' in \'field list\'', '2025-03-19 14:57:10', 98);
INSERT INTO `sys_oper_log` VALUES (106, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/19/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250319225707A003.jpg\"],\"title\":\"12313\",\"category\":\"tech\",\"content\":\"12311231313113\",\"tags\":[\"后端\",\"Vue\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'images\' in \'field list\'\r\n### The error may exist in com/ruoyi/system/mapper/SysForumPostMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.SysForumPostMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_forum_post ( user_id, title, content, category, tags, images,  view_count, like_count, comment_count,  is_top, is_essence, status, create_by, create_time, update_by, update_time, del_flag ) values ( ?, ?, ?, ?, ?, ?,  0, 0, 0,  \'0\', \'0\', \'0\', ?, sysdate(), ?, sysdate(), \'0\' )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'images\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'images\' in \'field list\'', '2025-03-19 14:57:18', 6);
INSERT INTO `sys_oper_log` VALUES (107, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/19/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250319225707A003.jpg\"],\"title\":\"12313\",\"category\":\"tech\",\"content\":\"12311231313113\",\"tags\":[\"后端\",\"Vue\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in com/ruoyi/system/mapper/SysForumPostMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.SysForumPostMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_forum_post ( user_id, title, content, category, tags, images,  view_count, like_count, comment_count,  is_top, is_essence, status, create_by, create_time, update_by, update_time, del_flag ) values ( ?, ?, ?, ?, ?, ?,  0, 0, 0,  \'0\', \'0\', \'0\', ?, sysdate(), ?, sysdate(), \'0\' )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'', '2025-03-19 15:03:50', 31);
INSERT INTO `sys_oper_log` VALUES (108, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/19/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250319225707A003.jpg\"],\"title\":\"12313\",\"category\":\"tech\",\"content\":\"12311231313113\",\"tags\":[\"后端\",\"Vue\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'update_by\' in \'field list\'\r\n### The error may exist in com/ruoyi/system/mapper/SysForumPostMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.SysForumPostMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_forum_post ( user_id, title, content, category, tags, images,  view_count, like_count, comment_count,  is_top, is_essence, status, create_by, create_time, update_by, update_time, del_flag ) values ( ?, ?, ?, ?, ?, ?,  0, 0, 0,  \'0\', \'0\', \'0\', ?, sysdate(), ?, sysdate(), \'0\' )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'update_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'update_by\' in \'field list\'', '2025-03-19 15:04:18', 8);
INSERT INTO `sys_oper_log` VALUES (109, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/19/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250319225707A003.jpg\"],\"title\":\"12313\",\"category\":\"tech\",\"content\":\"12311231313113\",\"tags\":[\"后端\",\"Vue\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\r\n### The error may exist in com/ruoyi/system/mapper/SysForumPostMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.SysForumPostMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_forum_post ( user_id, title, content, category, tags, images,  view_count, like_count, comment_count,  is_top, is_essence, status, create_by, create_time, update_by, update_time, del_flag ) values ( ?, ?, ?, ?, ?, ?,  0, 0, 0,  \'0\', \'0\', \'0\', ?, sysdate(), ?, sysdate(), \'0\' )\r\n### Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\n; Field \'user_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_name\' doesn\'t have a default value', '2025-03-19 15:04:34', 13);
INSERT INTO `sys_oper_log` VALUES (110, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/19/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250319225707A003.jpg\"],\"title\":\"12313\",\"category\":\"tech\",\"content\":\"12311231313113\",\"tags\":[\"后端\",\"Vue\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\r\n### The error may exist in com/ruoyi/system/mapper/SysForumPostMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.SysForumPostMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_forum_post ( user_id, title, content, category, tags, images,  view_count, like_count, comment_count,  is_top, is_essence, status, create_by, create_time, update_by, update_time, del_flag ) values ( ?, ?, ?, ?, ?, ?,  0, 0, 0,  \'0\', \'0\', \'0\', ?, sysdate(), ?, sysdate(), \'0\' )\r\n### Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\n; Field \'user_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_name\' doesn\'t have a default value', '2025-03-19 15:04:43', 8);
INSERT INTO `sys_oper_log` VALUES (111, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/19/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250319225707A003.jpg\"],\"title\":\"12313\",\"category\":\"tech\",\"content\":\"12311231313113\",\"tags\":[\"后端\",\"Vue\"]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:04:57', 53);
INSERT INTO `sys_oper_log` VALUES (112, '论坛用户', 2, 'com.ruoyi.system.controller.SysForumController.updateUserProfile()', 'PUT', 1, 'admin', NULL, '/forum/user/profile', '127.0.0.1', '', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-19 07:59:19\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@163.com\",\"loginDate\":\"2025-03-19 23:13:36\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:27:44', 176);
INSERT INTO `sys_oper_log` VALUES (113, '论坛用户', 2, 'com.ruoyi.system.controller.SysForumController.updateUserProfile()', 'PUT', 1, 'admin', NULL, '/forum/user/profile', '127.0.0.1', '', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-19 07:59:19\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@163.com\",\"loginDate\":\"2025-03-19 23:13:36\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"16676778106\",\"remark\":\"管理员\",\"roles\":[],\"sex\":\"2\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:28:05', 34);
INSERT INTO `sys_oper_log` VALUES (114, '论坛用户', 2, 'com.ruoyi.system.controller.SysForumController.updatePwd()', 'PUT', 1, 'admin', NULL, '/forum/user/updatePwd', '127.0.0.1', '', '{}', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2025-03-19 15:31:03', 106);
INSERT INTO `sys_oper_log` VALUES (115, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/user/resetPwd', '127.0.0.1', '', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:31:45', 104);
INSERT INTO `sys_oper_log` VALUES (116, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'ry', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/19/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250319234053A007.jpg\"],\"title\":\"123131313\",\"category\":\"tech\",\"content\":\"123123131123131\",\"tags\":[\"后端\",\"React\"]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 15:40:54', 24);
INSERT INTO `sys_oper_log` VALUES (117, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/20/14361770_E919348_c119f485_20250320001752A008.jpg\",\"http://127.0.0.1:9300/statics/2025/03/20/OIP-C_20250320001755A009.jpg\"],\"title\":\"测试图像检测\",\"category\":\"tech\",\"content\":\"测试图像检测\\n测试图像检测\\n测试图像检测\",\"tags\":[\"前端\"]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-19 16:17:56', 20);
INSERT INTO `sys_oper_log` VALUES (118, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'ry', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/20/生成特定风格图片 (3)_20250320084156A001.png\"],\"title\":\"123123131313\",\"category\":\"tech\",\"content\":\"1231231231231313131313\",\"tags\":[\"React\",\"数据库\"]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 00:42:00', 81);
INSERT INTO `sys_oper_log` VALUES (119, '论坛帖子', 3, 'com.ruoyi.system.controller.SysForumController.remove()', 'DELETE', 1, 'admin', NULL, '/forum/post/1', '127.0.0.1', '', '1', NULL, 1, 'java.lang.NullPointerException\r\n	at com.ruoyi.system.controller.SysForumController.remove(SysForumController.java:218)\r\n	at com.ruoyi.system.controller.SysForumController$$FastClassBySpringCGLIB$$1.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.', '2025-03-20 00:56:54', 74);
INSERT INTO `sys_oper_log` VALUES (120, '论坛帖子', 3, 'com.ruoyi.system.controller.SysForumController.remove()', 'DELETE', 1, 'admin', NULL, '/forum/post/1', '127.0.0.1', '', '1', NULL, 1, 'java.lang.NullPointerException\r\n	at com.ruoyi.system.controller.SysForumController.remove(SysForumController.java:218)\r\n	at com.ruoyi.system.controller.SysForumController$$FastClassBySpringCGLIB$$1.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.', '2025-03-20 00:56:58', 2);
INSERT INTO `sys_oper_log` VALUES (121, '论坛帖子', 3, 'com.ruoyi.system.controller.SysForumController.remove()', 'DELETE', 1, 'admin', NULL, '/forum/post/3', '127.0.0.1', '', '3', NULL, 1, 'java.lang.NullPointerException\r\n	at com.ruoyi.system.controller.SysForumController.remove(SysForumController.java:218)\r\n	at com.ruoyi.system.controller.SysForumController$$FastClassBySpringCGLIB$$1.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.', '2025-03-20 00:59:39', 4);
INSERT INTO `sys_oper_log` VALUES (122, '论坛帖子', 3, 'com.ruoyi.system.controller.SysForumController.remove()', 'DELETE', 1, 'admin', NULL, '/forum/post/3', '127.0.0.1', '', '3', NULL, 1, 'java.lang.NullPointerException\r\n	at com.ruoyi.system.controller.SysForumController.remove(SysForumController.java:218)\r\n	at com.ruoyi.system.controller.SysForumController$$FastClassBySpringCGLIB$$1.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.', '2025-03-20 01:01:57', 59148);
INSERT INTO `sys_oper_log` VALUES (123, '论坛帖子', 3, 'com.ruoyi.system.controller.SysForumController.remove()', 'DELETE', 1, 'admin', NULL, '/forum/post/3', '127.0.0.1', '', '3', NULL, 1, 'java.lang.NullPointerException\r\n	at com.ruoyi.system.controller.SysForumController.remove(SysForumController.java:218)\r\n	at com.ruoyi.system.controller.SysForumController$$FastClassBySpringCGLIB$$1.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.', '2025-03-20 01:02:52', 49438);
INSERT INTO `sys_oper_log` VALUES (124, '论坛帖子', 3, 'com.ruoyi.system.controller.SysForumController.remove()', 'DELETE', 1, 'admin', NULL, '/forum/post/1', '127.0.0.1', '', '1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 01:03:05', 32);
INSERT INTO `sys_oper_log` VALUES (125, '论坛帖子', 2, 'com.ruoyi.system.controller.SysForumController.edit()', 'PUT', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"category\":\"tech\",\"content\":\"测试图像检测\\n测试图像检测\\n测试图像检测\",\"id\":3,\"images\":\"http://127.0.0.1:9300/statics/2025/03/20/14361770_E919348_c119f485_20250320001752A008.jpg,http://127.0.0.1:9300/statics/2025/03/20/OIP-C_20250320001755A009.jpg\",\"params\":{},\"tags\":\"前端\",\"title\":\"测试图像检测\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 01:07:04', 39);
INSERT INTO `sys_oper_log` VALUES (126, '论坛帖子', 2, 'com.ruoyi.system.controller.SysForumController.edit()', 'PUT', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"category\":\"tech\",\"content\":\"测试图像检测\\n测试图像检测\\n测试图像检测\",\"id\":3,\"images\":\"http://127.0.0.1:9300/statics/2025/03/20/14361770_E919348_c119f485_20250320001752A008.jpg,http://127.0.0.1:9300/statics/2025/03/20/OIP-C_20250320001755A009.jpg\",\"params\":{},\"tags\":\"前端\",\"title\":\"测试图像检测000\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 01:07:10', 34);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"py_detection_record,py_detection_image\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 11:27:44', 137);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"py_detection_image,py_detection_record\"}', NULL, 0, NULL, '2025-03-20 11:28:07', 92);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-03-20 11:59:00', 20);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2025-03-19 07:59:19\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 11:59:07', 35);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/record/index\",\"createTime\":\"2025-03-20 11:30:39\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"图像检测记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"record\",\"perms\":\"system:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 11:59:21', 39);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/image/index\",\"createTime\":\"2025-03-20 11:30:23\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"检测图片记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"image\",\"perms\":\"system:image:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 11:59:47', 30);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/record/index\",\"createTime\":\"2025-03-20 11:30:39\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"图像检测记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"record\",\"perms\":\"system:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:00:06', 27);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/image/index\",\"createTime\":\"2025-03-20 11:30:23\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"检测图片记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"image\",\"perms\":\"system:image:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:00:10', 30);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2025-03-19 07:59:19\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:00:29', 22);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/image/index\",\"createTime\":\"2025-03-20 11:30:23\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"检测图片记录\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"image\",\"perms\":\"system:image:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:00:40', 24);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/record/index\",\"createTime\":\"2025-03-20 11:30:39\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"图像检测记录\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"record\",\"perms\":\"system:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:00:51', 22);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2025-03-19 08:14:33\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"去论坛\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"/forum/home\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:00:56', 31);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2025-03-19 07:59:19\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:01:04', 23);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2025-03-19 07:59:19\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:01:13', 31);
INSERT INTO `sys_oper_log` VALUES (141, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createTime\":\"2025-03-20 20:17:46\",\"id\":1,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320201743A006.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:17:46', 31);
INSERT INTO `sys_oper_log` VALUES (142, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createTime\":\"2025-03-20 20:17:55\",\"id\":2,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320201743A006.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:17:55', 33);
INSERT INTO `sys_oper_log` VALUES (143, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createTime\":\"2025-03-20 20:18:28\",\"id\":3,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320201823A007.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:18:28', 18);
INSERT INTO `sys_oper_log` VALUES (144, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createTime\":\"2025-03-20 20:19:15\",\"id\":4,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320201911A008.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:19:15', 31);
INSERT INTO `sys_oper_log` VALUES (145, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createTime\":\"2025-03-20 20:20:21\",\"id\":5,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320201911A008.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:20:21', 28);
INSERT INTO `sys_oper_log` VALUES (146, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createTime\":\"2025-03-20 20:20:33\",\"id\":6,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320201911A008.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:20:33', 32);
INSERT INTO `sys_oper_log` VALUES (147, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createTime\":\"2025-03-20 20:21:11\",\"id\":7,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320202111A009.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:21:11', 28);
INSERT INTO `sys_oper_log` VALUES (148, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createTime\":\"2025-03-20 20:21:30\",\"id\":8,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320202130A010.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:21:30', 26);
INSERT INTO `sys_oper_log` VALUES (149, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createTime\":\"2025-03-20 20:23:53\",\"id\":9,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320202353A011.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:23:53', 29);
INSERT INTO `sys_oper_log` VALUES (150, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createTime\":\"2025-03-20 20:24:14\",\"id\":10,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320202413A012.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:24:14', 22);
INSERT INTO `sys_oper_log` VALUES (151, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-20 20:24:40\",\"id\":11,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320202440A013.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:24:40', 31);
INSERT INTO `sys_oper_log` VALUES (152, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-20 20:28:49\",\"id\":12,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb11qAG4kJADwcPb1TA-g020_20250320202848A014.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:28:49', 19);
INSERT INTO `sys_oper_log` VALUES (153, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-20 20:30:10\",\"id\":14,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320203009A015.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:30:10', 67);
INSERT INTO `sys_oper_log` VALUES (154, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-20 20:31:05\",\"id\":16,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb12uAPyS1AEKyw9RhsPA879_20250320203104A016.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:31:05', 71);
INSERT INTO `sys_oper_log` VALUES (155, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-20 20:31:11\",\"id\":18,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/25424704_1_20250320203110A017.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:31:11', 63);
INSERT INTO `sys_oper_log` VALUES (156, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-20 20:31:35\",\"id\":20,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/14361770_E919348_c119f485_20250320203135A019.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:31:35', 69);
INSERT INTO `sys_oper_log` VALUES (157, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-20 20:36:54\",\"id\":22,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320203651A020.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:36:54', 62);
INSERT INTO `sys_oper_log` VALUES (158, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-20 20:44:38\",\"id\":24,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320204437A021.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:44:38', 64);
INSERT INTO `sys_oper_log` VALUES (159, '图像检测记录', 3, 'com.ruoyi.system.controller.PyDetectionRecordController.remove()', 'DELETE', 1, 'admin', NULL, '/record/6', '127.0.0.1', '', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:52:03', 25);
INSERT INTO `sys_oper_log` VALUES (160, '图像检测记录', 3, 'com.ruoyi.system.controller.PyDetectionRecordController.remove()', 'DELETE', 1, 'admin', NULL, '/record/5', '127.0.0.1', '', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 12:52:05', 31);
INSERT INTO `sys_oper_log` VALUES (161, '论坛用户', 2, 'com.ruoyi.system.controller.SysForumController.updateUserProfile()', 'PUT', 1, 'admin', NULL, '/forum/user/profile', '127.0.0.1', '', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-19 07:59:19\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@163.com\",\"loginDate\":\"2025-03-20 21:01:14\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"16676778106\",\"remark\":\"管理员\",\"roles\":[],\"sex\":\"1\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:01:38', 64);
INSERT INTO `sys_oper_log` VALUES (162, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-20 21:01:54\",\"id\":26,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320210152A022.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:01:54', 79);
INSERT INTO `sys_oper_log` VALUES (163, '图像检测记录', 3, 'com.ruoyi.system.controller.PyDetectionRecordController.remove()', 'DELETE', 1, 'admin', NULL, '/record/7', '127.0.0.1', '', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:02:00', 25);
INSERT INTO `sys_oper_log` VALUES (164, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb11qAG4kJADwcPb1TA-g020_20250320210213A023.jpg\",\"http://127.0.0.1:9300/statics/2025/03/20/生成特定风格图片 (1)_20250320210215A024.png\"],\"title\":\"12313131313\",\"category\":\"question\",\"content\":\"1231322131231321313\",\"tags\":[\"React\",\"数据库\",\"云服务\"]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:02:16', 88);
INSERT INTO `sys_oper_log` VALUES (165, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'admin', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320210243A025.jpg\"],\"title\":\"7777777777777777777777\",\"category\":\"tech\",\"content\":\"1231231313123123131\",\"tags\":[\"后端\",\"Vue\"]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:02:44', 32);
INSERT INTO `sys_oper_log` VALUES (166, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'admin', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-20 21:04:18\",\"id\":28,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320210415A026.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:04:18', 71);
INSERT INTO `sys_oper_log` VALUES (167, '论坛用户', 2, 'com.ruoyi.system.controller.SysForumController.updateUserProfile()', 'PUT', 1, 'admin', NULL, '/forum/user/profile', '127.0.0.1', '', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-19 07:59:19\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@163.com\",\"loginDate\":\"2025-03-20 21:03:40\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"16676778106\",\"remark\":\"管理员\",\"roles\":[],\"sex\":\"2\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:04:40', 23);
INSERT INTO `sys_oper_log` VALUES (168, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'ry', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb11qAG4kJADwcPb1TA-g020_20250320210859A028.jpg\",\"http://127.0.0.1:9300/statics/2025/03/20/生成特定风格图片 (1)_20250320210901A029.png\"],\"title\":\"123131313213131\",\"category\":\"question\",\"content\":\"123131312312313123\",\"tags\":[\"后端\",\"Vue\"]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:09:02', 20);
INSERT INTO `sys_oper_log` VALUES (169, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-19 07:59:19\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-03-20 21:08:46\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"王大锤\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:09:36', 48);
INSERT INTO `sys_oper_log` VALUES (170, '论坛帖子', 1, 'com.ruoyi.system.controller.SysForumController.add()', 'POST', 1, 'ry', NULL, '/forum/post', '127.0.0.1', '', '{\"images\":[\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb12uAPyS1AEKyw9RhsPA879_20250320211008A031.jpg\"],\"title\":\"675475757\",\"category\":\"question\",\"content\":\"1231321312312312312312434243\",\"tags\":[\"云服务\",\"AI\",\"开源\"]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:10:09', 31);
INSERT INTO `sys_oper_log` VALUES (171, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'ry', NULL, '/image', '127.0.0.1', '', '{\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320211020A032.jpg\"}', NULL, 1, 'system:image:add', '2025-03-20 13:10:20', 4);
INSERT INTO `sys_oper_log` VALUES (172, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'ry', NULL, '/image', '127.0.0.1', '', '{\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320211020A032.jpg\"}', NULL, 1, 'system:image:add', '2025-03-20 13:10:23', 1);
INSERT INTO `sys_oper_log` VALUES (173, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2025-03-19 07:59:19\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116,4,2007,2008,2009,2010,2011,2012,2001,2002,2003,2004,2005,2006],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:10:53', 44);
INSERT INTO `sys_oper_log` VALUES (174, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'ry', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"ry\",\"createTime\":\"2025-03-20 21:11:07\",\"id\":30,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb11WAGqV9ADX7alC0Ed8360_20250320211106A033.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:11:07', 59);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2025-03-19 08:14:33\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"去论坛\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"/forum/home\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:12:48', 57);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2025-03-19 08:14:33\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"去论坛\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"/forum/home\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:13:00', 28);
INSERT INTO `sys_oper_log` VALUES (177, '图像检测记录', 3, 'com.ruoyi.system.controller.PyDetectionRecordController.remove()', 'DELETE', 1, 'ry', NULL, '/record/9', '127.0.0.1', '', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 13:16:36', 19);
INSERT INTO `sys_oper_log` VALUES (178, '论坛消息', 2, 'com.ruoyi.system.controller.SysForumMessageController.markAsRead()', 'PUT', 1, 'ry', NULL, '/message/read/1', '127.0.0.1', '', '1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:53:28', 50);
INSERT INTO `sys_oper_log` VALUES (179, '论坛消息', 3, 'com.ruoyi.system.controller.SysForumMessageController.remove()', 'DELETE', 1, 'ry', NULL, '/message/9', '127.0.0.1', '', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:38:45', 36);
INSERT INTO `sys_oper_log` VALUES (180, '论坛消息', 3, 'com.ruoyi.system.controller.SysForumMessageController.remove()', 'DELETE', 1, 'ry', NULL, '/message/8', '127.0.0.1', '', '[8]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:38:47', 33);
INSERT INTO `sys_oper_log` VALUES (181, '论坛消息', 3, 'com.ruoyi.system.controller.SysForumMessageController.remove()', 'DELETE', 1, 'ry', NULL, '/message/7', '127.0.0.1', '', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:38:48', 18);
INSERT INTO `sys_oper_log` VALUES (182, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'ry', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"2\",\"createTime\":\"2025-03-20 23:39:53\",\"id\":32,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__Chtk2Wdb13CAKIFmADZUQ15dwjU369_20250320233952A034.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:39:53', 86);
INSERT INTO `sys_oper_log` VALUES (183, '论坛帖子', 2, 'com.ruoyi.system.controller.SysForumController.edit()', 'PUT', 1, 'ry', NULL, '/forum/post', '127.0.0.1', '', '{\"category\":\"question\",\"content\":\"1231321312312312312312434243\",\"id\":8,\"images\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb12uAPyS1AEKyw9RhsPA879_20250320211008A031.jpg\",\"params\":{},\"tags\":\"云服务,AI,开源\",\"title\":\"675475757\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:41:08', 29);
INSERT INTO `sys_oper_log` VALUES (184, '论坛用户', 2, 'com.ruoyi.system.controller.SysForumController.updateUserProfile()', 'PUT', 1, 'ry', NULL, '/forum/user/profile', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-19 07:59:19\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-03-20 23:28:55\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"王大锤\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:47:22', 88);
INSERT INTO `sys_oper_log` VALUES (185, '论坛用户', 2, 'com.ruoyi.system.controller.SysForumController.avatar()', 'POST', 1, 'ry', NULL, '/forum/user/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2025/03/20/OIP-C_20250320235114A040.jpg\",\"code\":200}', 0, NULL, '2025-03-20 15:51:14', 81);
INSERT INTO `sys_oper_log` VALUES (186, '检测图片记录', 1, 'com.ruoyi.system.controller.PyDetectionImageController.add()', 'POST', 1, 'ry', NULL, '/image', '127.0.0.1', '', '{\"createBy\":\"2\",\"createTime\":\"2025-03-20 23:51:41\",\"id\":34,\"params\":{},\"url\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb12uAPyS1AEKyw9RhsPA879_20250320235141A041.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:51:41', 66);
INSERT INTO `sys_oper_log` VALUES (187, '论坛用户', 2, 'com.ruoyi.system.controller.SysForumController.avatar()', 'POST', 1, 'admin', NULL, '/forum/user/avatar', '127.0.0.1', '', '', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1\r\n### The error may exist in file [E:\\单\\设计稿\\forum-system-api\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.updateUserAvatar-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user set avatar = ? where user_name = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1\n; Data truncation: Data too long for column \'avatar\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1', '2025-03-20 15:52:26', 43);
INSERT INTO `sys_oper_log` VALUES (188, '论坛用户', 2, 'com.ruoyi.system.controller.SysForumController.avatar()', 'POST', 1, 'admin', NULL, '/forum/user/avatar', '127.0.0.1', '', '', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1\r\n### The error may exist in file [E:\\单\\设计稿\\forum-system-api\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.updateUserAvatar-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user set avatar = ? where user_name = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1\n; Data truncation: Data too long for column \'avatar\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 1', '2025-03-20 15:52:30', 21);
INSERT INTO `sys_oper_log` VALUES (189, '论坛用户', 2, 'com.ruoyi.system.controller.SysForumController.avatar()', 'POST', 1, 'admin', NULL, '/forum/user/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb11qAG4kJADwcPb1TA-g020_20250320235255A044.jpg\",\"code\":200}', 0, NULL, '2025-03-20 15:52:55', 38);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-03-19 07:59:19\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-21 02:16:35', 32);
INSERT INTO `sys_oper_log` VALUES (191, '通知公告', 3, 'com.ruoyi.system.controller.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/notice/2', '127.0.0.1', '', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-21 02:16:44', 23);
INSERT INTO `sys_oper_log` VALUES (192, '通知公告', 2, 'com.ruoyi.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-19 07:59:21\",\"noticeContent\":\"新版本内容\",\"noticeId\":1,\"noticeTitle\":\"新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-21 02:16:52', 24);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-03-19 07:59:19', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-03-19 07:59:19', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-03-19 07:59:19', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-03-19 07:59:19', 'admin', '2025-03-20 13:10:53', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '16676778106', '2', 'http://127.0.0.1:9300/statics/2025/03/20/1400x0_1_q95_autohomecar__ChxkPmdb11qAG4kJADwcPb1TA-g020_20250320235255A044.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-03-21 10:16:15', 'admin', '2025-03-19 07:59:19', '', '2025-03-21 02:16:15', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '王大锤', '00', 'ry@qq.com', '15666666666', '1', 'http://127.0.0.1:9300/statics/2025/03/20/OIP-C_20250320235114A040.jpg', '$2a$10$cdu4D4f5m7g1RqTPwhU6z.LgqlDI8zZ8ZJlnL.nOH72mvjdzqTN4.', '0', '0', '127.0.0.1', '2025-03-20 23:28:55', 'admin', '2025-03-19 07:59:19', 'admin', '2025-03-20 15:47:22', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
