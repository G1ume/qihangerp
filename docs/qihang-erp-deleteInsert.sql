/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:3306
 Source Schema         : qihang-erp

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 27/11/2024 21:30:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for erp_goods
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods`;
CREATE TABLE `erp_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '商品编号',
  `unit_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '单位名称',
  `category_id` int NULL DEFAULT 0 COMMENT '商品分类ID',
  `bar_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '条码',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态1销售中2已下架',
  `length` float NOT NULL DEFAULT 0 COMMENT '衣长/裙长/裤长',
  `height` float NOT NULL DEFAULT 0 COMMENT '高度/袖长',
  `width` float NOT NULL DEFAULT 0 COMMENT '宽度/胸阔(围)',
  `width1` float NOT NULL DEFAULT 0 COMMENT '肩阔',
  `width2` float NOT NULL DEFAULT 0 COMMENT '腰阔',
  `width3` float NOT NULL DEFAULT 0 COMMENT '臀阔',
  `weight` float NOT NULL DEFAULT 0 COMMENT '重量',
  `disable` tinyint(1) NULL DEFAULT 0 COMMENT '0启用   1禁用',
  `period` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '保质期',
  `pur_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '预计采购价格',
  `whole_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '建议批发价',
  `retail_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '建议零售价',
  `unit_cost` decimal(8, 2) NULL DEFAULT NULL COMMENT '单位成本',
  `supplier_id` int NULL DEFAULT 0 COMMENT '供应商id',
  `brand_id` int NULL DEFAULT 0 COMMENT '品牌id',
  `attr1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属性1：季节',
  `attr2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属性2：分类',
  `attr3` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属性3：风格',
  `attr4` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属性4：年份',
  `attr5` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属性5：面料',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '外链url',
  `low_qty` int NULL DEFAULT 0 COMMENT '最低库存（预警）',
  `high_qty` int NULL DEFAULT 0 COMMENT '最高库存（预警）',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `number`(`number`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品库存管理' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for erp_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_attribute`;
CREATE TABLE `erp_goods_attribute`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint NULL DEFAULT 0 COMMENT '商品id',
  `attribute_id` int NULL DEFAULT NULL COMMENT '属性id',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '属性名',
  `value` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for erp_goods_attribute_config
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_attribute_config`;
CREATE TABLE `erp_goods_attribute_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `category_id` int NULL DEFAULT NULL COMMENT '分类id（0为所有共用）',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '属性名',
  `value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_attribute_config
-- ----------------------------
INSERT INTO `erp_goods_attribute_config` VALUES (1, 1, '年份', '2022,2023');
INSERT INTO `erp_goods_attribute_config` VALUES (2, 1, '季节', '春季,夏季,秋季,冬季');

-- ----------------------------
-- Table structure for erp_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_brand`;
CREATE TABLE `erp_goods_brand`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '品牌名',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_brand
-- ----------------------------
INSERT INTO `erp_goods_brand` VALUES (1, '梦小妮', 1, 'admin', '2023-12-29 13:44:29', 'admin', '2023-12-29 13:44:29');

-- ----------------------------
-- Table structure for erp_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_category`;
CREATE TABLE `erp_goods_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类编码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL COMMENT '上架分类id',
  `path` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类路径',
  `sort` int NULL DEFAULT 0 COMMENT '排序值',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `isDelete` tinyint(1) NULL DEFAULT 0 COMMENT '0正常  1删除',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for erp_goods_category_attribute
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_category_attribute`;
CREATE TABLE `erp_goods_category_attribute`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `category_id` int NOT NULL,
  `type` int NOT NULL DEFAULT 0 COMMENT '类型：0属性1规格',
  `title` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '\'属性名\'',
  `code` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '固定值color颜色size尺码style款式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_category_attribute
-- ----------------------------
INSERT INTO `erp_goods_category_attribute` VALUES (114, 1, 1, '颜色', 'color');
INSERT INTO `erp_goods_category_attribute` VALUES (115, 1, 1, '尺码', 'size');
INSERT INTO `erp_goods_category_attribute` VALUES (116, 1, 1, '款式', 'style');

-- ----------------------------
-- Table structure for erp_goods_category_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_category_attribute_value`;
CREATE TABLE `erp_goods_category_attribute_value`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，属性值id',
  `category_attribute_id` int NULL DEFAULT NULL COMMENT '属性id',
  `value` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '属性值文本',
  `sku_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成SKU的编码',
  `orderNum` int NULL DEFAULT 0,
  `isDelete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 426 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for erp_goods_img
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_img`;
CREATE TABLE `erp_goods_img`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_id` bigint NULL DEFAULT 0 COMMENT '商品Id',
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '类型',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '图片url',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '图片说明',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_img
-- ----------------------------

-- ----------------------------
-- Table structure for erp_goods_inventory
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_inventory`;
CREATE TABLE `erp_goods_inventory`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goodsId` int NOT NULL COMMENT '商品id',
  `goodsNumber` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `specId` int NOT NULL COMMENT '商品规格id',
  `specNumber` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '规格编码（唯一）',
  `currentQty` bigint NOT NULL DEFAULT 0 COMMENT '当前库存',
  `lockedQty` bigint NOT NULL DEFAULT 0 COMMENT '锁定库存',
  `isDelete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0正常  1删除',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `createBy` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updateBy` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `specIdIndex`(`specId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品库存表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for erp_goods_inventory_detail
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_inventory_detail`;
CREATE TABLE `erp_goods_inventory_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `inventoryId` bigint NOT NULL COMMENT '商品库存id',
  `inQty` int NOT NULL DEFAULT 0 COMMENT '入库数量',
  `originQty` bigint NOT NULL COMMENT '入库前数量',
  `currentQty` bigint NOT NULL DEFAULT 0 COMMENT '当前库存数量',
  `purPrice` double NULL DEFAULT 0 COMMENT '采购价',
  `entryId` bigint NOT NULL COMMENT '入库单id',
  `entryItemId` bigint NOT NULL COMMENT '入库单itemId',
  `remark` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `specId` int NOT NULL COMMENT '规格id',
  `goodsId` int NOT NULL COMMENT '商品id',
  `inLocation` int NOT NULL COMMENT '入库仓位id',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `createBy` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品库存明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_inventory_detail
-- ----------------------------
INSERT INTO `erp_goods_inventory_detail` VALUES (7, 6, 10, 0, 6, NULL, 8, 4, NULL, 32, 9, 20, '2024-01-16 14:51:50', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (8, 7, 1, 0, 1, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:20:55', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (9, 7, 1, 1, 2, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:22:35', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (10, 7, 2, 2, 4, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:25:47', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (11, 7, 2, 4, 6, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:28:36', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (12, 7, 2, 6, 8, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:33:18', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (13, 7, 2, 8, 10, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:35:52', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (14, 7, 1, 10, 11, NULL, 1794181606514589698, 1794181606552338433, NULL, 1327, 68, 20, '2024-05-25 10:36:15', 'admin');

-- ----------------------------
-- Table structure for erp_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_spec`;
CREATE TABLE `erp_goods_spec`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint NOT NULL COMMENT '商品id',
  `spec_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '规格名',
  `spec_num` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规格编码',
  `color_id` int NULL DEFAULT 0 COMMENT '颜色id',
  `color_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '颜色值',
  `color_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '颜色图片',
  `size_id` int NULL DEFAULT 0 COMMENT '尺码id',
  `size_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '尺码值',
  `style_id` int NULL DEFAULT 0 COMMENT '款式id',
  `style_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '款式值',
  `bar_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库存条形码',
  `pur_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '预计采购价',
  `whole_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '建议批发价',
  `retail_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '建议零售价',
  `unit_cost` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '单位成本',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `low_qty` int NULL DEFAULT 0 COMMENT '最低库存（预警）',
  `high_qty` int NULL DEFAULT 0 COMMENT '最高库存（预警）',
  `disable` tinyint(1) NULL DEFAULT 0 COMMENT '0启用   1禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `number`(`spec_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1372 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品规格库存管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for erp_goods_spec_attr
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_spec_attr`;
CREATE TABLE `erp_goods_spec_attr`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_id` int NOT NULL,
  `type` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `k` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `kid` int NULL DEFAULT NULL,
  `vid` int NULL DEFAULT NULL,
  `v` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 603 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for erp_sale_after_info
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_after_info`;
CREATE TABLE `erp_sale_after_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int NULL DEFAULT NULL COMMENT '类型（10退货；20换货；80补发；99订单拦截；）',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `shop_type` int NULL DEFAULT NULL COMMENT '店铺类型',
  `after_sale_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后单号',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `sub_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单号',
  `product_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品spuid',
  `sku_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品skuid',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `img` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `sku_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku描述',
  `sku_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `erp_goods_id` int NULL DEFAULT NULL COMMENT 'ERP商品id',
  `erp_sku_id` int NULL DEFAULT NULL COMMENT 'ERP商品skuId',
  `return_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退回人信息json',
  `return_waybill_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退回快递单号',
  `return_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退回物流公司名称',
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `receiver_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人联系电话',
  `receiver_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `receiver_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `receiver_town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人详细地址',
  `ship_waybill_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货快递单号（补发、换货发货、拦截订单发货）',
  `ship_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货快递公司',
  `status` int NULL DEFAULT NULL COMMENT '状态:1已发出；2已完成(已收货);3已入库',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '售后处理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_sale_after_info
-- ----------------------------

-- ----------------------------
-- Table structure for erp_sale_after_refund
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_after_refund`;
CREATE TABLE `erp_sale_after_refund`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `refund_num` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '退货单号',
  `refund_type` int NULL DEFAULT NULL COMMENT '类型(10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `shop_type` int NULL DEFAULT NULL COMMENT '店铺类型',
  `refund_fee` float NOT NULL COMMENT '退款金额',
  `refund_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原因',
  `original_order_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '原始订单号（来自于第三方平台）',
  `original_order_item_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原始子订单号（来自于第三方平台）',
  `original_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始子订单skuId',
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT 'erp商品id',
  `erp_goods_sku_id` bigint NULL DEFAULT NULL COMMENT 'erp sku id',
  `spec_num` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `has_good_return` int NULL DEFAULT NULL COMMENT '买家是否需要退货。可选值:1(是),0(否)',
  `goods_name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_sku` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品sku',
  `goods_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `quantity` bigint NULL DEFAULT NULL COMMENT '退货数量',
  `return_logistics_company` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退货物流公司',
  `return_logistics_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退货物流单号',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  `contact_person` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '发货人',
  `mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '发货人手机号',
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '发货地址',
  `status` int NOT NULL COMMENT '状态（10001待审核10002等待买家退货10005等待卖家收货14000拒绝退款10011退款关闭10010退款完成）',
  `create_time` datetime NOT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1800733684087050243 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '售后退款表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for erp_sale_order
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_order`;
CREATE TABLE `erp_sale_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单id，自增',
  `order_num` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单编号（来源订单）',
  `shop_type` int NULL DEFAULT NULL COMMENT '店铺类型',
  `shop_id` int NOT NULL COMMENT '店铺ID',
  `remark` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `buyer_memo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '买家留言信息',
  `seller_memo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '卖家留言',
  `tag` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签',
  `refund_status` int NOT NULL COMMENT '售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 5：全部',
  `order_status` int NOT NULL COMMENT '订单状态1：待发货，2：已发货，3：已完成，11已取消；21待付款',
  `goods_amount` double NOT NULL COMMENT '商品金额',
  `seller_discount` double NOT NULL DEFAULT 0 COMMENT '商家优惠金额，单位：元',
  `platform_discount` double NOT NULL DEFAULT 0 COMMENT '平台优惠金额，单位：元',
  `postage` double NOT NULL COMMENT '运费',
  `order_amount` double NOT NULL COMMENT '订单金额（商家实际得到的金额），单位：元，支付金额=商品金额-折扣金额+邮费+平台优惠金额',
  `pay_amount` double NOT NULL COMMENT '支付金额',
  `receiver_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收件人手机号',
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收件人地址',
  `country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '国家/地区',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '市',
  `town` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '区',
  `order_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `confirm_time` datetime NULL DEFAULT NULL COMMENT '订单确认时间',
  `ship_type` int NULL DEFAULT NULL COMMENT '发货类型（0仓库发货；1供应商代发）',
  `ship_status` int NOT NULL COMMENT '发货状态（0待备货1备货中2已出库3已发货）',
  `shipping_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `shipping_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `shipping_company` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `shipping_man` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `shipping_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '发货费用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `length` float NULL DEFAULT 0 COMMENT '长',
  `width` float NULL DEFAULT 0 COMMENT '宽',
  `height` float NULL DEFAULT 0 COMMENT '高',
  `weight` float NULL DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_sn_index`(`order_num`) USING BTREE,
  INDEX `shopid_index`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1803324847759515651 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for erp_sale_order_item
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_order_item`;
CREATE TABLE `erp_sale_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id，自增',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `shop_id` int NOT NULL COMMENT '店铺id',
  `supplier_id` int NULL DEFAULT NULL COMMENT '供应商ID',
  `goods_id` bigint NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `spec_id` bigint NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  `goods_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_num` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `goods_spec` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `spec_num` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品规格编码',
  `goods_price` double NULL DEFAULT NULL COMMENT '商品单价',
  `item_amount` double NULL DEFAULT NULL COMMENT '子订单金额',
  `quantity` int NOT NULL COMMENT '商品数量',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `original_order_item_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '子订单编号(来源订单)',
  `original_order_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单编号（来源订单）',
  `original_sku_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '原始订单skuid',
  `is_gift` tinyint NOT NULL DEFAULT 0 COMMENT '是否赠品0否1是',
  `refund_count` int NULL DEFAULT 0 COMMENT '已退货数量',
  `refund_status` int NULL DEFAULT NULL COMMENT '售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 ',
  `order_status` int NULL DEFAULT NULL COMMENT '订单状态',
  `ship_type` int NULL DEFAULT NULL COMMENT '发货类型（0仓库发货；1供应商代发）',
  `ship_status` int NOT NULL COMMENT '发货状态（0待备货1备货中2已出库3已发货）',
  `ship_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `logistics_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `logistics_company` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `ship_man` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodId_index`(`goods_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1803324848011173890 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单明细表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for erp_ship_logistics
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_logistics`;
CREATE TABLE `erp_ship_logistics`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司编码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;



-- ----------------------------
-- Table structure for erp_ship_order
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_order`;
CREATE TABLE `erp_ship_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` int NOT NULL COMMENT '店铺ID',
  `shop_type` int NOT NULL COMMENT '店铺平台',
  `supplier_id` int NOT NULL COMMENT 'erp系统商品id',
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `erp_order_id` bigint NULL DEFAULT NULL COMMENT 'erp订单ID',
  `erp_order_item_id` bigint NOT NULL COMMENT 'erp子订单ID',
  `order_time` datetime NOT NULL COMMENT '订单日期',
  `goods_id` bigint NOT NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `spec_id` bigint NOT NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  `spec_num` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品规格编码',
  `quantity` int NOT NULL COMMENT '商品数量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  `logistics_company` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `logistics_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `logistics_fee` decimal(6, 2) NULL DEFAULT NULL COMMENT '运费',
  `ship_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `ship_man` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `out_operator` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库人',
  `out_position` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库仓位',
  `out_time` datetime NULL DEFAULT NULL COMMENT '出库时间',
  `ship_type` int NOT NULL COMMENT '发货类型（0仓库发货；1供应商代发）',
  `ship_status` int NOT NULL COMMENT '状态（1出库中2已出库3已发货）',
  `package_weight` float NULL DEFAULT NULL COMMENT '包裹重量',
  `package_length` float NULL DEFAULT NULL COMMENT '包裹长度',
  `package_width` float NULL DEFAULT NULL COMMENT '包裹宽度',
  `package_height` float NULL DEFAULT NULL COMMENT '包裹高度',
  `packsge_operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '打包操作人',
  `packsge_time` datetime NULL DEFAULT NULL COMMENT '打包时间',
  `packages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '包裹内容JSON',
  `receiver_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收件人手机号',
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收件人地址',
  `country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '国家/地区',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '市',
  `town` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '区',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1794205460750368771 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单发货表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for erp_ship_order_agent_fee
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_order_agent_fee`;
CREATE TABLE `erp_ship_order_agent_fee`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `shop_id` int NOT NULL COMMENT '店铺id',
  `supplier_id` bigint NOT NULL COMMENT '供应商id',
  `supplier_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `date` date NOT NULL COMMENT '日期',
  `logistics_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流公司',
  `logistics_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流单号',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '应付总金额',
  `ship_amount` decimal(5, 2) NOT NULL COMMENT '物流费用',
  `goods_amount` decimal(10, 2) NOT NULL COMMENT '商品金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int NOT NULL COMMENT '状态（0已生成1已结算)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1785930405289799682 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '供应商代发账单' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for erp_ship_order_fee
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_order_fee`;
CREATE TABLE `erp_ship_order_fee`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `logistics_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流公司',
  `logistics_company_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司id',
  `logistics_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流单号',
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `amount` decimal(10, 2) NOT NULL COMMENT '应付金额',
  `date` date NOT NULL COMMENT '应付日期',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int NOT NULL COMMENT '状态（0已生成1已结算)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `length` float NULL DEFAULT 0 COMMENT '长',
  `width` float NULL DEFAULT 0 COMMENT '宽',
  `height` float NULL DEFAULT 0 COMMENT '高',
  `weight` float NULL DEFAULT NULL COMMENT '重量',
  `receiver_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收件人手机号',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '市',
  `town` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1786238985318604802 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单发货物流费用' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for erp_ship_stock_up
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_stock_up`;
CREATE TABLE `erp_ship_stock_up`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NULL DEFAULT NULL COMMENT '店铺id',
  `sale_order_id` bigint NULL DEFAULT NULL COMMENT 'erp订单id',
  `sale_order_item_id` bigint NULL DEFAULT NULL COMMENT 'erp订单itemid',
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `original_sku_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '原始订单skuid',
  `goods_id` bigint NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `spec_id` bigint NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  `goods_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_spec` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `goods_num` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `spec_num` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品规格编码',
  `quantity` int NOT NULL COMMENT '商品数量',
  `status` int NOT NULL COMMENT '状态0待备货1备货中2已出库3已发货',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '备货表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for erp_ship_waybill
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_waybill`;
CREATE TABLE `erp_ship_waybill`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `shop_type` int NOT NULL COMMENT '店铺类型',
  `waybill_order_id` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子面单订单id(仅视频号)',
  `waybill_code` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '快递单号',
  `logistics_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司编码',
  `print_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '打印数据',
  `status` int NULL DEFAULT NULL COMMENT '状态（1已取号2已打印3已发货）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发货电子面单记录表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for oms_dou_goods
-- ----------------------------
DROP TABLE IF EXISTS `oms_dou_goods`;
CREATE TABLE `oms_dou_goods`  (
  `id` bigint NOT NULL,
  `shop_id` bigint NULL DEFAULT NULL COMMENT '店铺id',
  `product_id` bigint NULL DEFAULT NULL COMMENT '商品ID，抖店系统生成，店铺下唯一',
  `product_type` int NULL DEFAULT NULL COMMENT '商品类型；0-普通；1-新客商品；3-虚拟；6-玉石闪购；7-云闪购 ；127-其他类型；',
  `name` varchar(85) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题。',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品主图的第一张图',
  `check_status` int NULL DEFAULT NULL COMMENT '商品审核状态: 1-未提交；2-待审核；3-审核通过；4-审核未通过；5-封禁；7-审核通过待上架；',
  `status` int NULL DEFAULT NULL COMMENT '商品在店铺中状态: 0-在线；1-下线；2-删除；',
  `spec_id` bigint NULL DEFAULT NULL COMMENT '商品规格，全局唯一',
  `create_time` int NULL DEFAULT NULL COMMENT '商品创建时间，unix时间戳，单位：秒；',
  `update_time` int NULL DEFAULT NULL COMMENT '商品更新时间，unix时间戳，单位：秒；',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品详情，最大支持50张图片，单张详情图宽高比不超2000*2000px，大小5M内，仅支持jpg/jpeg/png格式；',
  `category_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '类目详情；商品类目id可使用【/shop/getShopCategory】查询',
  `outer_product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部商家编码，商家自定义字段，支持最多 255个字符',
  `is_package_product` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是组合商品，true-是，false-不是；',
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT 'erp商品id',
  `pull_time` datetime NULL DEFAULT NULL COMMENT '拉取时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抖店商品表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for oms_dou_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_dou_goods_sku`;
CREATE TABLE `oms_dou_goods_sku`  (
  `id` bigint NOT NULL COMMENT '商品sku_id;抖店系统生成。',
  `product_id` bigint NULL DEFAULT NULL COMMENT '商品ID；抖店系统生成。',
  `spec_id` bigint NULL DEFAULT NULL COMMENT '规格ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku外部编码',
  `sku_type` int NULL DEFAULT NULL COMMENT '库存类型；0-普通；1-区域库存；10-阶梯库存；',
  `sku_status` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku状态 true上架 false下架',
  `out_sku_id` bigint NULL DEFAULT NULL COMMENT '外部的skuId；商家自定义；未设置返回为0。',
  `spec_detail_id1` bigint NULL DEFAULT NULL COMMENT '第一级子规格',
  `spec_detail_id2` bigint NULL DEFAULT NULL COMMENT '第二级子规格',
  `spec_detail_id3` bigint NULL DEFAULT NULL COMMENT '\r\n第三级子规格',
  `spec_detail_name1` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一级子规格名',
  `spec_detail_name2` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二级子规格名',
  `spec_detail_name3` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '\r\n第三级子规格名',
  `price` int NULL DEFAULT NULL COMMENT '商品价格，单位：分',
  `create_time` int NULL DEFAULT NULL COMMENT '创建时间，时间戳：单位秒；',
  `stock_num` int NULL DEFAULT NULL COMMENT 'ku_type=0时，表示普通库存数量 ;sku_type=1时，使用stock_map，表示区域库存数量',
  `prehold_stock_num` int NULL DEFAULT NULL COMMENT 'sku_type=0时，表示预占库存数量； sku_type=1时，表示区域库存数量，使用prehold_stock_map',
  `prom_stock_num` int NULL DEFAULT NULL COMMENT '活动库存',
  `step_stock_num` int NULL DEFAULT NULL COMMENT '\r\n阶梯库存',
  `prehold_step_stock_num` int NULL DEFAULT NULL COMMENT '预占阶梯库存',
  `prom_step_stock_num` int NULL DEFAULT NULL COMMENT '活动阶梯库存',
  `normal_stock_num` int NULL DEFAULT NULL COMMENT '库存模型V2新增 普通库存 非活动可售',
  `channel_stock_num` int NULL DEFAULT NULL COMMENT '库存模型V2新增 渠道库存',
  `sell_properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '销售属性，代替spec_detail_id123、spec_detail_name123',
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT '商品id(o_goods外键)',
  `erp_goods_sku_id` bigint NULL DEFAULT NULL COMMENT '商品skuid(o_goods_sku外键)',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `name` varchar(85) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题。',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品主图的第一张图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抖店商品Sku表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for oms_dou_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_dou_order`;
CREATE TABLE `oms_dou_order`  (
  `id` bigint NOT NULL,
  `order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺父订单号，抖店平台生成，平台下唯一；',
  `order_level` int NULL DEFAULT NULL COMMENT '订单层级，主订单是2级',
  `order_phase_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '定金预售阶段单json',
  `order_status` int NULL DEFAULT NULL COMMENT '订单状态1 待确认/待支付（订单创建完毕）105 已支付 2 备货中 101 部分发货 3 已发货（全部发货）4 已取消5 已完成（已收货）',
  `order_status_desc` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态描述',
  `order_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '\r\n订单的一些c端标签json',
  `order_type` int NULL DEFAULT NULL COMMENT '【订单类型】 0、普通订单 2、虚拟商品订单 4、电子券（poi核销） 5、三方核销',
  `order_type_desc` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型描述',
  `app_id` int NULL DEFAULT NULL COMMENT '具体某个小程序的ID',
  `open_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抖音小程序ID',
  `accept_order_status` int NULL DEFAULT NULL COMMENT '小时达订单的接单状态 0-未接单；1-已接单；2-超时取消，或商家取消',
  `appointment_ship_time` int NULL DEFAULT NULL COMMENT '预约发货时间',
  `author_cost_amount` int NULL DEFAULT NULL COMMENT '作者（达人）承担金额（单位：分），订单参与活动和优惠中作者（达人）承担部分的总金额',
  `aweme_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '达人抖音号，样品订单场景下才会返回的申样达人信息；',
  `b_type` int NULL DEFAULT NULL COMMENT '【下单端】 0、站外 1、火山 2、抖音 3、头条 4、西瓜 5、微信 6、值点app 7、头条lite 8、懂车帝 9、皮皮虾 11、抖音极速版 12、TikTok 13、musically 14、穿山甲 15、火山极速版 16、服务市场 26、番茄小说 27、UG教育营销电商平台 28、Jumanji 29、电商SDK',
  `b_type_desc` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单端描述',
  `sub_b_type` int NULL DEFAULT NULL COMMENT '【下单场景】 0、未知 1、app内-原生 2、app内-小程序 3、H5 13、电商SDK-头条 35、电商SDK-头条lite',
  `sub_b_type_desc` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单场景描述',
  `biz` int NULL DEFAULT NULL COMMENT '【业务来源】 1 -鲁班 2 -小店 3 -好好学习 4 -ev 5 -虚拟 6 -建站 7 -核销 8 -玉石 9 -ez 10 -ep 11 -虚拟卡券 12 -服务市场 13 - EP 视频课 14 - EP 直播课 21 -跨境BBC 22 -跨境BC 23 -跨境CC|UPU 24 -手机充值 25 -拍卖保证金 26 -懂车帝抵扣券 27 -懂车帝返现券 28 -离岛免税 29 -海南会员购 30 -抽奖 31 -清北-企业代付 32 -抖+券 33 -联盟寄样 49 -刀剑 53 -通信卡 66 -加油包 76 -大闸蟹 99 -保险 102-小店海外 108-上门取件收款',
  `biz_desc` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务来源描述',
  `buyer_words` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家留言',
  `seller_words` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家备注',
  `seller_remark_stars` int NULL DEFAULT NULL COMMENT '插旗信息：0-灰 1-紫 2-青 3-绿 4-橙 5-红',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取消原因',
  `channel_payment_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付渠道的流水号',
  `create_time` int NULL DEFAULT NULL COMMENT '下单时间，时间戳，秒',
  `pay_time` int NULL DEFAULT NULL COMMENT '支付时间，时间戳，秒',
  `update_time` int NULL DEFAULT NULL COMMENT '订单更新时间，时间戳，秒',
  `finish_time` int NULL DEFAULT NULL COMMENT '订单完成时间，时间戳，秒',
  `order_expire_time` int NULL DEFAULT NULL COMMENT '订单过期时间，时间戳，秒',
  `doudian_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户唯一id',
  `encrypt_post_receiver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `encrypt_post_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人电话',
  `encrypt_post_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件地址',
  `exp_ship_time` int NULL DEFAULT NULL COMMENT '预计发货时间，时间戳，秒',
  `logistics_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '物流信息JSON',
  `main_status` int NULL DEFAULT NULL COMMENT '主流程状态，1 待确认/待支付（订单创建完毕）103 部分支付105 已支付2 备货中101 部分发货3 已发货（全部发货）4 已取消5 已完成（已收货）21 发货前退款完结22 发货后退款完结39 收货后退款完结',
  `main_status_desc` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主流程状态描述',
  `mask_post_receiver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名（脱敏后）',
  `mask_post_tel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人电话（脱敏后）',
  `mask_post_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人地址（脱敏后）',
  `province_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `province_id` int NULL DEFAULT NULL,
  `city_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city_id` int NULL DEFAULT NULL,
  `town_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `town_id` int NULL DEFAULT NULL,
  `street_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `street_id` int NULL DEFAULT NULL,
  `open_address_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标识收件人地址的id，可用于合单',
  `modify_amount` int NULL DEFAULT NULL COMMENT '改价金额变化量（单位：分）',
  `modify_post_amount` int NULL DEFAULT NULL COMMENT '改价运费金额变化量（单位：分）',
  `only_platform_cost_amount` int NULL DEFAULT NULL COMMENT '仅平台承担金额（单位：分），订单参与活动和优惠中平台承担部分的总金额',
  `order_amount` int NULL DEFAULT NULL COMMENT '订单金额（单位：分）',
  `pay_amount` int NULL DEFAULT NULL COMMENT '支付金额（单位：分）',
  `pay_type` int NULL DEFAULT NULL COMMENT '7=无需支付（0元单）；8=DOU分期（信用支付）；9=新卡支付；12=先用后付；16=收银台支付',
  `post_amount` int NULL DEFAULT NULL COMMENT '快递费（单位：分）',
  `post_insurance_amount` int NULL DEFAULT NULL COMMENT '运费险金额（单位：分）',
  `post_origin_amount` int NULL DEFAULT NULL COMMENT '运费原价（单位：分），post_origin_amount = post_amount + post_promotion_amount',
  `post_promotion_amount` int NULL DEFAULT NULL COMMENT '运费优惠金额（单位：分）',
  `promotion_amount` int NULL DEFAULT NULL COMMENT '订单优惠总金额（单位：分） = 店铺优惠金额 + 平台优惠金额 + 达人优惠金额',
  `promotion_pay_amount` int NULL DEFAULT NULL COMMENT '支付优惠金额（单位：分），支付渠道上的优惠金额',
  `promotion_platform_amount` int NULL DEFAULT NULL COMMENT '平台优惠金额（单位：分），属于平台的优惠活动、优惠券、红包的总优惠金额',
  `promotion_redpack_amount` int NULL DEFAULT NULL COMMENT '红包优惠金额（单位：分）',
  `promotion_redpack_platform_amount` int NULL DEFAULT NULL COMMENT '平台红包优惠金额（单位：分），属于平台的红包的优惠金额',
  `promotion_redpack_talent_amount` int NULL DEFAULT NULL COMMENT '达人红包优惠金额（单位：分），属于达人的红包的优惠金额',
  `promotion_shop_amount` int NULL DEFAULT NULL COMMENT '店铺优惠金额（单位：分），属于店铺的优惠活动、优惠券、红包的总优惠金额',
  `promotion_talent_amount` int NULL DEFAULT NULL COMMENT '达人优惠金额（单位：分），属于达人的优惠活动、优惠券、红包的总优惠金额',
  `ship_time` int NULL DEFAULT NULL COMMENT '发货时间，时间戳，秒',
  `shop_cost_amount` int NULL DEFAULT NULL COMMENT '商家承担金额（单位：分），订单参与活动和优惠中商家承担部分的总金额',
  `platform_cost_amount` int NULL DEFAULT NULL COMMENT '平台承担金额（单位：分），订单参与活动和优惠中平台+作者（达人）承担部分的总金额,包含作者（达人）承担金额：platform_cost_amount = only_platform_cost_amount + author_cost_amount',
  `shop_id` bigint NULL DEFAULT NULL COMMENT '店铺id，抖店平台生成，平台下唯一；',
  `shop_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `total_promotion_amount` int NULL DEFAULT NULL COMMENT '总优惠金额（单位：分），total_promotion_amount = promotion_amount + post_promotion_amount',
  `user_tag_ui` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用户特征标签；JSON',
  `s_shop_id` int NULL DEFAULT NULL COMMENT '系统店铺id',
  `pull_time` datetime NULL DEFAULT NULL COMMENT '第一次拉取时间',
  `last_pull_time` datetime NULL DEFAULT NULL COMMENT '最后一次拉取时间',
  `audit_status` int NOT NULL DEFAULT 0 COMMENT '0待确认，1已确认2已拦截-9未拉取',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `erp_send_company` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递公司',
  `erp_send_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递单号',
  `erp_send_status` int NULL DEFAULT 0 COMMENT 'erp发货状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抖店订单表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for oms_dou_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_dou_order_item`;
CREATE TABLE `oms_dou_order_item`  (
  `id` bigint NOT NULL,
  `order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺子订单号，抖店平台生成，平台下唯一；注意：一笔订单下有一个子订单和父订单单号相同。',
  `parent_order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺父订单号，抖店平台生成，平台下唯一；',
  `order_level` int NULL DEFAULT NULL COMMENT '订单层级',
  `ad_env_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告来源，video-短视频 live-直播',
  `after_sale_status` int NULL DEFAULT NULL COMMENT '售后状态；6-售后申请；27-拒绝售后申请；12-售后成功；7-售后退货中；11-售后已发货；29-售后退货拒绝；13-【换货返回：换货售后换货商家发货】，【补寄返回：补寄待用户收货】； 14-【换货返回：（换货）售后换货用户收货】，【补寄返回：（补寄）用户已收货】 ；28-售后失败；51-订单取消成功；53-逆向交易已完成；',
  `after_sale_type` int NULL DEFAULT NULL COMMENT '售后类型 ；0-退货退款;1-已发货仅退款;2-未发货仅退款;3-换货;4-系统取消;5-用户取消;6-价保;7-补寄;',
  `refund_status` int NULL DEFAULT NULL COMMENT '退款状态:1-待退款；3-退款成功； 4-退款失败；当买家发起售后后又主动取消售后，此时after_sale_status=28并且refund_status=1的状态不变，不会流转至4状态；',
  `author_cost_amount` int NULL DEFAULT NULL COMMENT '作者（达人）承担金额（单位：分），订单参与活动和优惠中作者（达人）承担部分的总金额',
  `author_id` int NULL DEFAULT NULL COMMENT '直播主播id（达人）;仅直播间和橱窗产生的订单会有值返回;',
  `author_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直播主播名称;仅直播间和橱窗产生的订单会有值返回',
  `c_biz` int NULL DEFAULT NULL COMMENT '【C端流量来源】 0-unknown 2-精选联盟 8-小店自卖',
  `c_biz_desc` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'C端流量来源业务类型描述',
  `cancel_reason` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '\r\n取消原因',
  `channel_payment_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付渠道的流水号',
  `code` varchar(88) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家后台商品编码',
  `confirm_receipt_time` int NULL DEFAULT NULL COMMENT '用户确认收货时间',
  `finish_time` int NULL DEFAULT NULL COMMENT '订单完成时间，时间戳，秒',
  `goods_price` int NULL DEFAULT NULL COMMENT '\r\n商品原价（单位：分）',
  `goods_type` int NULL DEFAULT NULL COMMENT '【商品类型】 0-实体 1-虚拟',
  `is_comment` int NULL DEFAULT NULL COMMENT '\r\n是否评价 :1-已评价，0-未评价，2 -追评',
  `item_num` int NULL DEFAULT NULL COMMENT '订单商品数量',
  `logistics_receipt_time` int NULL DEFAULT NULL COMMENT '物流收货时间 ',
  `modify_amount` int NULL DEFAULT NULL COMMENT '\r\n改价金额变化量（单位：分）',
  `modify_post_amount` int NULL DEFAULT NULL COMMENT '改价运费金额变化量（单位：分）',
  `only_platform_cost_amount` int NULL DEFAULT NULL COMMENT '仅平台承担金额（单位：分），订单参与活动和优惠中平台承担部分的总金额',
  `order_amount` int NULL DEFAULT NULL COMMENT '订单金额（单位：分）',
  `pay_amount` int NULL DEFAULT NULL COMMENT '支付金额（单位：分）',
  `post_insurance_amount` int NULL DEFAULT NULL COMMENT '运费险金额（单位：分）',
  `promotion_amount` int NULL DEFAULT NULL COMMENT '订单优惠总金额（单位：分） = 店铺优惠金额 + 平台优惠金额 + 达人优惠金额',
  `promotion_shop_amount` int NULL DEFAULT NULL COMMENT '店铺优惠金额（单位：分），属于店铺的优惠活动、优惠券、红包的总优惠金额',
  `promotion_platform_amount` int NULL DEFAULT NULL COMMENT '平台优惠金额（单位：分），属于平台的优惠活动、优惠券、红包的总优惠金额',
  `shop_cost_amount` int NULL DEFAULT NULL COMMENT '商家承担金额（单位：分），订单参与活动和优惠中商家承担部分的总金额',
  `platform_cost_amount` int NULL DEFAULT NULL COMMENT '平台承担金额（单位：分），订单参与活动和优惠中平台+作者（达人）承担部分的总金额,包含作者（达人）承担金额：platform_cost_amount = only_platform_cost_amount + author_cost_amount',
  `promotion_talent_amount` int NULL DEFAULT NULL COMMENT '达人优惠金额（单位：分），属于达人的优惠活动、优惠券、红包的总优惠金额',
  `promotion_pay_amount` int NULL DEFAULT NULL COMMENT '支付优惠金额（单位：分），支付渠道上的优惠金额',
  `origin_amount` int NULL DEFAULT NULL COMMENT '商品现价（单位：分）',
  `out_product_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品外部编码',
  `out_sku_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部Skuid',
  `product_id` bigint NULL DEFAULT NULL COMMENT '商品ID',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品skuId',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `promotion_redpack_amount` int NULL DEFAULT NULL COMMENT '平台优惠金额（单位：分），属于平台的优惠活动、优惠券、红包的总优惠金额',
  `promotion_redpack_platform_amount` int NULL DEFAULT NULL COMMENT '平台红包优惠金额（单位：分），属于平台的红包的优惠金额',
  `promotion_redpack_talent_amount` int NULL DEFAULT NULL COMMENT '达人红包优惠金额（单位：分），属于达人的红包的优惠金额',
  `room_id` int NULL DEFAULT NULL COMMENT '直播间id，有值则代表订单来自直播间',
  `ship_time` int NULL DEFAULT NULL COMMENT '\r\n发货时间',
  `spec` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规格信息JSON',
  `theme_type_desc` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单来源描述（废弃）',
  `update_time` int NULL DEFAULT NULL COMMENT '订单更新时间，时间戳，秒',
  `create_time` int NULL DEFAULT NULL COMMENT '下单时间，时间戳，秒',
  `video_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频id，有值则代表订单来自短视频video_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抖店订单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for oms_dou_refund
-- ----------------------------
DROP TABLE IF EXISTS `oms_dou_refund`;
CREATE TABLE `oms_dou_refund`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '售后订单id，自增',
  `shop_id` bigint NOT NULL COMMENT '订单所属商户id',
  `aftersale_id` bigint NOT NULL DEFAULT 0 COMMENT '售后id',
  `aftersale_order_type` bigint NULL DEFAULT NULL COMMENT '售后订单类型，枚举为-1(历史订单),1(商品单),2(店铺单)',
  `aftersale_type` bigint NOT NULL COMMENT '售后类型；0-退货退款；1-已发货仅退款；2-未发货仅退款；3-换货；6-价保；7-补寄；8-维修',
  `aftersale_status` bigint NOT NULL COMMENT '售后状态和请求参数standard_aftersale_status字段对应；3-换货待买家收货；6-待商家同意；7-待买家退货；8-待商家发货；11-待商家二次同意；12-售后成功；14-换货成功；27-商家一次拒绝；28-售后失败；29-商家二次拒绝；',
  `aftersale_status_to_final_time` bigint NULL DEFAULT NULL COMMENT '售后完结时间，完结时间是平台根据商品的类型，售后状态等综合判断生成，当售后单有完结时间返回时售后单不可再做任何操作；未完结售后单的该字段值为0；Unix时间戳：秒',
  `related_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '\r\n关联的订单ID',
  `order_sku_order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '抖音子订单id',
  `order_status` bigint NULL DEFAULT NULL COMMENT '订单状态',
  `order_pay_amount` bigint NULL DEFAULT NULL COMMENT '付款金额',
  `order_post_amount` bigint NULL DEFAULT NULL COMMENT '\r\n付运费金额',
  `order_item_num` bigint NULL DEFAULT NULL COMMENT '购买数量',
  `order_product_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `order_product_image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `order_product_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `order_sku_spec` varchar(550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品规格JSON',
  `order_shop_sku_code` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家SKU编码',
  `apply_time` bigint NULL DEFAULT NULL COMMENT '申请时间',
  `update_time` bigint NULL DEFAULT NULL COMMENT '最近更新时间',
  `status_deadline` bigint NULL DEFAULT NULL COMMENT '当前节点逾期时间',
  `refund_amount` bigint NULL DEFAULT NULL COMMENT '售后退款金额，单位为分',
  `refund_post_amount` bigint NULL DEFAULT NULL COMMENT '售后退运费金额，单位为分',
  `aftersale_num` bigint NULL DEFAULT NULL COMMENT '\r\n售后数量',
  `part_type` bigint NULL DEFAULT NULL COMMENT '部分退类型',
  `aftersale_refund_type` bigint NULL DEFAULT NULL COMMENT '售后退款类型，枚举为-1(历史数据默认值),0(订单货款/原路退款),1(货到付款线下退款),2(备用金),3(保证金),4(无需退款),5(平台垫付)',
  `refund_type` bigint NULL DEFAULT NULL COMMENT '退款方式，枚举为1(极速退款助手)、2(售后小助手)、3(售后急速退)、4(闪电退货)',
  `arbitrate_status` bigint NULL DEFAULT NULL COMMENT '仲裁状态，枚举为0(无仲裁记录),1(仲裁中),2(客服同意),3(客服拒绝),4(待商家举证),5(协商期),255(仲裁结束)',
  `create_time` bigint NULL DEFAULT NULL COMMENT '\r\n售后单创建时间',
  `risk_decision_reason` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风控理由',
  `risk_decision_description` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风控描述',
  `return_promotion_amount` bigint NULL DEFAULT NULL COMMENT '退优惠金额',
  `refund_status` bigint NULL DEFAULT NULL COMMENT '退款状态；1-待退款;2-退款中;3-退款成功;4-退款失败;5-追缴成功;',
  `arbitrate_blame` bigint NULL DEFAULT NULL COMMENT '仲裁责任方 1:商家责任,2:买家责任,3:双方有责,4:平台责任,5:达人责任',
  `return_logistics_code` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退货物流单号',
  `return_logistics_company_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退货物流公司名称',
  `exchange_sku_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '换货SKU信息JSON',
  `exchange_logistics_company_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '换货物流公司名称',
  `remark` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `got_pkg` bigint NULL DEFAULT NULL COMMENT '买家是否收到货物，0表示未收到，1表示收到',
  `is_agree_refuse_sign` bigint NULL DEFAULT NULL COMMENT '是否拒签后退款（1：已同意拒签, 2：未同意拒签）',
  `order_logistics` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商家首次发货的正向物流信息JSON',
  `aftersale_tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '售后标签（含时效延长、风险预警、豁免体验分等标签）标签在平台侧会有更新，标签仅做展示使用，请勿作为系统判断依赖。JSON',
  `aftersale_sub_type` bigint NULL DEFAULT NULL COMMENT '售后子类型；8001-以换代修。',
  `auto_audit_bits` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '自动审核方式：1-发货前极速退；2-小助手自动同意退款；3-发货后极速退；4-闪电退货；5-跨境零秒退；6-云仓拦截自动退；7-小助手自动同意退货；8-小助手自动同意拒签后退款；9-商家代客填写卡片发起售后；10-治理未发货自动同意退款；11-治理已发货自动同意退款；12-商家快递拦截成功自动退款；13-质检商品免审核；14-协商方案自动同意退款；15-平台卡券自动同意退款；16-三方卡券自动同意退款；17-治理一审自动同意退货退款',
  `text_part` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文案部分JSON',
  `related_order_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '售后关联的订单信息JSON',
  `pull_time` datetime NULL DEFAULT NULL COMMENT '第一次拉取时间',
  `pull_last_time` datetime NULL DEFAULT NULL COMMENT '最后一次拉取时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1800783607092436995 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抖店退款表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for oms_dou_waybill_account
-- ----------------------------
DROP TABLE IF EXISTS `oms_dou_waybill_account`;
CREATE TABLE `oms_dou_waybill_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `seller_id` bigint NULL DEFAULT NULL COMMENT '商家ID',
  `company` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司编码',
  `company_type` int NULL DEFAULT NULL COMMENT '物流服务商业务类型 1：直营 2：加盟 3：落地配 4：直营带网点',
  `amount` int NULL DEFAULT NULL COMMENT '电子面单余额数量，-1表示没有额度限制',
  `allocated_quantity` int NULL DEFAULT NULL COMMENT '已取单号数量，若业务本身无值，则传-1，前端可展示为“-”',
  `cancelled_quantity` int NULL DEFAULT NULL COMMENT '已取消单号数量，若业务本身无值，则传-1，前端可展示为“-”',
  `recycled_quantity` int NULL DEFAULT NULL COMMENT '已回收单号数量，若业务本身无值，则传-1，前端可展示为“-”',
  `netsite_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点Code',
  `netsite_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点名称',
  `province_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称（一级地址）',
  `city_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称（二级地址）',
  `district_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `street_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称（三级地址）',
  `detail_address` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `mobile` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货手机号',
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货固定电话',
  `is_show` int NULL DEFAULT NULL COMMENT '是否前台显示1显示0不显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抖店电子面单账户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for oms_jd_after_sale
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_after_sale`;
CREATE TABLE `oms_jd_after_sale`  (
  `id` bigint NOT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `apply_id` bigint NULL DEFAULT NULL COMMENT '申请单号',
  `service_id` bigint NULL DEFAULT NULL COMMENT '服务单号',
  `refund_id` bigint NULL DEFAULT NULL COMMENT '退款单id',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单号',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `apply_refund_sum` double NULL DEFAULT NULL COMMENT '退款金额(单位分)',
  `customer_expect` int NULL DEFAULT NULL COMMENT '客户期望(1-售前退款 10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)',
  `customer_expect_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户期望名称',
  `service_status` int NULL DEFAULT NULL COMMENT '服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）',
  `service_status_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务单状态名称',
  `customer_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户账号',
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `pickware_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取件地址',
  `pickware_type` int NULL DEFAULT NULL COMMENT '取件方式(4-上门取件 5-上门换新取件 7-客户送货 8-大家电上门取件 9-大家电换新取件 40-客户发货 70-送货至门店 71-快递至门店 72-门店上门取件 80-京东快运上门取件 85-德邦取件)',
  `order_type` int NULL DEFAULT NULL COMMENT '订单类型(0-一般订单 2-拍卖订单 11-售后调货 15-返修发货 16-直接赔偿 21-POPFBP 22-POPSOP 23-POPLBP 24-POPLBV 25-POPSOPL 18-厂商直送 19-客服补件 42-通用合约 61-EPT订单 69-京东服务产品订单 19-客服补件 75-LOC订单 77-LSP订单 42-虚拟订单 88-总代订单 96-sop虚拟订单 100-提货卡订单 33-电子礼品卡 49-礼品卡 108-京东维修服务产品订单 131-X无人超市订单 142-企业店铺IBS订单 151-品牌门店线下订单 112-自营采购，以销定结 159-领货码订单 89-移动仓库订单 170-实体领货码订单 140-商家采购订单 193-scf订单 54-线下礼品卡订单 202-月卡订单 4-虚拟商品)',
  `order_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型名称',
  `actual_pay_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品编号',
  `ware_type` int NULL DEFAULT NULL COMMENT '售后商品类型(10-申请主商品 20-申请的赠品 30-附件 40-发票 50-发票复印件 60-出检报告 70-包装 80-防损吊牌 90-贺卡 100-礼品购包装 110-loc订单验证码 120-服务产品标识)',
  `ware_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品类型名称',
  `ware_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `sku_type` int NULL DEFAULT NULL COMMENT '商品类型(1-单品 2-赠品套装中的主商品 3-赠品套装中的赠品 4-套装中的单品 5-套装中的赠品 6-加价购赠品 7-延保通 8-延保通赠品)',
  `sku_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'skuType对应名称',
  `approve_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人账号',
  `approve_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `approve_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `approve_result` int NULL DEFAULT NULL COMMENT '审核结果(11-直赔积分 12-直赔余额 13-直赔优惠卷 14-直赔京豆 21-直赔商品 22-上门换新 31-自营取件 32-客户送货 33-客户发货 34-闪电退款 35-虚拟退款 36-上门检测 37-客户送货至门店 38-保外维修 39-快递至门店 40-门店上门取件 80-大家电检测 81-大家电安装 82-大家电移机 83-大家电维修 84-大家电其它 85-闪电催收 86-上门维修 87-补发商品 91-退款不退货 92-预授权冻结 93-ACS换新 95-(超级体验店)门店换新 96-(超级体验店)主站换新 97-厂商维修-寄修 98-厂商维修-上门维修 99-厂商维修-送修 101-厂商大家电检测鉴定 102-厂商大家电安装 103-厂商大家电移机拆机 104-厂商大家电维修(上门维修) 105-厂商大家电拆机鉴定 106-换货 100-客户退货至团长 107-3c上门维修 108-增值服务 109-退货(筋斗云使用) 110-直赔(筋斗云使用) 111-上门检测取件)',
  `approve_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核结果名称',
  `process_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人账号',
  `process_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人姓名',
  `process_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `process_result` int NULL DEFAULT NULL COMMENT '处理结果(0-初始化 1-安装完成 2-维修完成 3-检测完成 4-拆机完成 5-咨询解释 6-取消 70-原返 80-换货 100-赔付)',
  `process_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果名称',
  `platform_src` int NULL DEFAULT NULL COMMENT '平台来源',
  `platform_src_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台来源名称',
  `service_count` int NULL DEFAULT NULL COMMENT '服务单售后数量',
  `desen_customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `buyer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户帐号',
  `buyer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `refund_check_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核日期',
  `refund_status` int NULL DEFAULT NULL COMMENT '退款审核状态: 0代表未审核， 1代表审核通过 2代表审核不通过 3代表京东财务审核通过；4代表京东财务审核不通过',
  `refund_check_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `refund_check_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  `refund_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原因',
  `refund_system_id` int NULL DEFAULT NULL COMMENT ' 退款来源(10:客服; 11:网站; 12:配送拒收; 28:APP; 87:分拣中心,逆向物流; 98:微信手Q;)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东退款与售后表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for oms_jd_goods
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_goods`;
CREATE TABLE `oms_jd_goods`  (
  `id` bigint NOT NULL,
  `ware_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `ware_status` int NULL DEFAULT NULL COMMENT '商品状态 -1：删除 1:从未上架 2:自主下架 4:系统下架 8:上架 513:从未上架待审 514:自主下架待审 516:系统下架待审 520:上架待审核 1028:系统下架审核失败',
  `outer_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	商品外部ID,商家自行设置的ID（便于关联京东商品）',
  `item_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品货号',
  `bar_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品的条形码.UPC码,SN码,PLU码统称为条形码',
  `modified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品最后一次修改时间',
  `created` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品创建时间，只读属性',
  `offline_time` datetime NULL DEFAULT NULL COMMENT '最后下架时间',
  `online_time` datetime NULL DEFAULT NULL COMMENT '最后上架时间',
  `delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货地',
  `pack_listing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包装清单',
  `wrap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包装规格',
  `weight` float NULL DEFAULT NULL,
  `width` int NULL DEFAULT NULL,
  `height` int NULL DEFAULT NULL,
  `length` int NULL DEFAULT NULL,
  `mobile_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `after_sales` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `market_price` decimal(10, 2) NULL DEFAULT NULL,
  `cost_price` decimal(10, 2) NULL DEFAULT NULL,
  `jd_price` decimal(10, 2) NULL DEFAULT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stock_num` int NULL DEFAULT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id（sys_shop表id）',
  `sell_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `after_sale_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `spu_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_jd_goods
-- ----------------------------

-- ----------------------------
-- Table structure for oms_jd_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_goods_sku`;
CREATE TABLE `oms_jd_goods_sku`  (
  `id` bigint NOT NULL,
  `shop_id` bigint NULL DEFAULT NULL COMMENT '店铺id',
  `ware_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `sku_id` bigint NULL DEFAULT NULL COMMENT 'skuid',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `jd_price` decimal(10, 2) NULL DEFAULT NULL,
  `outer_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bar_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sale_attrs` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attrs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku属性名称',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stock_num` int NULL DEFAULT NULL,
  `modified` datetime NULL DEFAULT NULL,
  `created` datetime NULL DEFAULT NULL,
  `currency_spu_id` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT 'erp商品id',
  `erp_goods_sku_id` bigint NULL DEFAULT NULL COMMENT 'erp商品sku id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东商品SKU表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for oms_jd_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order`;
CREATE TABLE `oms_jd_order`  (
  `id` bigint NOT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单id（京东平台）',
  `vender_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家id',
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	订单类型（22 SOP；75 LOC） 可选字段，需要在输入参数optional_fields中写入才能返回',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式（1货到付款, 2邮局汇款, 3自提, 4在线支付, 5公司转账, 6银行卡转账）',
  `order_total_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单总金额。总金额=订单金额（不减优惠，不加运费服务费税费）',
  `order_seller_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单货款金额（订单总金额-商家优惠金额）',
  `order_payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户应付金额。应付款=货款-用户优惠-余额+运费+税费+服务费。',
  `freight_price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品的运费',
  `seller_discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家优惠金额',
  `order_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	1）WAIT_SELLER_STOCK_OUT 等待出库 2）WAIT_GOODS_RECEIVE_CONFIRM 等待确认收货 3）WAIT_SELLER_DELIVERY等待发货（只适用于海外购商家，含义为\'等待境内发货\'标签下的订单,非海外购商家无需使用） 4) POP_ORDER_PAUSE POP暂停 5）FINISHED_L 完成 6）TRADE_CANCELED 取消 7）LOCKED 已锁定 8）WAIT_SEND_CODE 等待发码',
  `order_state_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态说明（中文）',
  `delivery_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '送货（日期）类型（1-只工作日送货(双休日、假日不用送);2-只双休日、假日送货(工作日不用送);3-工作日、双休日与假日均可送货;其他值-返回“任意时间”）',
  `invoice_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票信息 “invoice_info: 不需要开具发票”下无需开具发票；其它返回值请正常开具发票 。（没有电子发票具体信息）',
  `invoice_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '普通发票纳税人识别码',
  `order_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家下单时订单备注',
  `order_start_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单时间',
  `order_end_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结单时间 如返回信息为“0001-01-01 00:00:00”和“1970-01-01 00:00:00”，可认为此订单为未完成状态。',
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `full_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `county_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `town_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vender_remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家订单备注（不大于500字符） 可选字段，需要在输入参数optional_fields中写入才能返回',
  `balance_used` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '余额支付金额 可选字段，需要在输入参数optional_fields中写入才能返回',
  `pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家的账号信息',
  `return_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后订单标记 0:不是换货订单 1返修发货,直接赔偿,客服补件 2售后调货 可选字段，需要在输入参数optional_fields中写入才能返回',
  `payment_confirm_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款确认时间 如果没有付款时间 默认返回0001-01-01 00:00:00 可选字段，需要在输入参数optional_fields中写入才能返回',
  `waybill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运单号(当厂家自送时运单号可为空，不同物流公司的运单号用|分隔，如果同一物流公司有多个运单号，则用英文逗号分隔) 可选字段，需要在输入参数optional_fields中写入才能返回',
  `logistics_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司ID 可选字段，需要在输入参数optional_fields中写入才能返回',
  `modified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单更新时间',
  `direct_parent_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	直接父订单号 可选字段，需要在输入参数optional_fields中写入才能返回',
  `parent_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	根父订单号 可选字段，需要在输入参数optional_fields中写入才能返回',
  `order_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单来源。如：移动端订单',
  `store_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '京仓订单/云仓订单/空“”',
  `id_sop_shipmenttype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否京配。68=京配，69=京配自提',
  `real_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家的账号信息(区分大小写) 可选字段，需要在输入参数optional_fields中写入才能返回',
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家的账号信息 ',
  `open_id_buyer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家的账号信息(区分大小写) 可选字段',
  `create_time` datetime NULL DEFAULT NULL,
  `audit_status` int NULL DEFAULT NULL COMMENT '订单审核状态（0待审核1已审核）',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  `erp_send_company` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递公司',
  `erp_send_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递单号',
  `erp_send_status` int NULL DEFAULT 0 COMMENT 'erp发货状态（1已取号2已打印3已发货10手动发货）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for oms_jd_order_after
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order_after`;
CREATE TABLE `oms_jd_order_after`  (
  `id` bigint NOT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `apply_id` bigint NULL DEFAULT NULL COMMENT '申请单号',
  `service_id` bigint NULL DEFAULT NULL COMMENT '服务单号',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `customer_expect` int NULL DEFAULT NULL COMMENT '客户期望(10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)',
  `customer_expect_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户期望名称',
  `service_status` int NULL DEFAULT NULL COMMENT '服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）',
  `service_status_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务单状态名称',
  `customer_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户账号',
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `pickware_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取件地址',
  `pickware_type` int NULL DEFAULT NULL COMMENT '取件方式(4-上门取件 5-上门换新取件 7-客户送货 8-大家电上门取件 9-大家电换新取件 40-客户发货 70-送货至门店 71-快递至门店 72-门店上门取件 80-京东快运上门取件 85-德邦取件)',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单号',
  `order_type` int NULL DEFAULT NULL COMMENT '订单类型(0-一般订单 2-拍卖订单 11-售后调货 15-返修发货 16-直接赔偿 21-POPFBP 22-POPSOP 23-POPLBP 24-POPLBV 25-POPSOPL 18-厂商直送 19-客服补件 42-通用合约 61-EPT订单 69-京东服务产品订单 19-客服补件 75-LOC订单 77-LSP订单 42-虚拟订单 88-总代订单 96-sop虚拟订单 100-提货卡订单 33-电子礼品卡 49-礼品卡 108-京东维修服务产品订单 131-X无人超市订单 142-企业店铺IBS订单 151-品牌门店线下订单 112-自营采购，以销定结 159-领货码订单 89-移动仓库订单 170-实体领货码订单 140-商家采购订单 193-scf订单 54-线下礼品卡订单 202-月卡订单 4-虚拟商品)',
  `order_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型名称',
  `actual_pay_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品编号',
  `ware_type` int NULL DEFAULT NULL COMMENT '售后商品类型(10-申请主商品 20-申请的赠品 30-附件 40-发票 50-发票复印件 60-出检报告 70-包装 80-防损吊牌 90-贺卡 100-礼品购包装 110-loc订单验证码 120-服务产品标识)',
  `ware_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品类型名称',
  `ware_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `sku_type` int NULL DEFAULT NULL COMMENT '商品类型(1-单品 2-赠品套装中的主商品 3-赠品套装中的赠品 4-套装中的单品 5-套装中的赠品 6-加价购赠品 7-延保通 8-延保通赠品)',
  `sku_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'skuType对应名称',
  `approve_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人账号',
  `approve_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `approve_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `approve_result` int NULL DEFAULT NULL COMMENT '审核结果(11-直赔积分 12-直赔余额 13-直赔优惠卷 14-直赔京豆 21-直赔商品 22-上门换新 31-自营取件 32-客户送货 33-客户发货 34-闪电退款 35-虚拟退款 36-上门检测 37-客户送货至门店 38-保外维修 39-快递至门店 40-门店上门取件 80-大家电检测 81-大家电安装 82-大家电移机 83-大家电维修 84-大家电其它 85-闪电催收 86-上门维修 87-补发商品 91-退款不退货 92-预授权冻结 93-ACS换新 95-(超级体验店)门店换新 96-(超级体验店)主站换新 97-厂商维修-寄修 98-厂商维修-上门维修 99-厂商维修-送修 101-厂商大家电检测鉴定 102-厂商大家电安装 103-厂商大家电移机拆机 104-厂商大家电维修(上门维修) 105-厂商大家电拆机鉴定 106-换货 100-客户退货至团长 107-3c上门维修 108-增值服务 109-退货(筋斗云使用) 110-直赔(筋斗云使用) 111-上门检测取件)',
  `approve_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核结果名称',
  `process_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人账号',
  `process_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人姓名',
  `process_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `process_result` int NULL DEFAULT NULL COMMENT '处理结果(0-初始化 1-安装完成 2-维修完成 3-检测完成 4-拆机完成 5-咨询解释 6-取消 70-原返 80-换货 100-赔付)',
  `process_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果名称',
  `platform_src` int NULL DEFAULT NULL COMMENT '平台来源',
  `platform_src_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台来源名称',
  `service_count` int NULL DEFAULT NULL COMMENT '服务单售后数量',
  `desen_customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单售后表（废弃）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_jd_order_after
-- ----------------------------

-- ----------------------------
-- Table structure for oms_jd_order_coupon
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order_coupon`;
CREATE TABLE `oms_jd_order_coupon`  (
  `id` bigint NOT NULL,
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单编号',
  `skuId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '京东sku编号。(只有30-单品促销优惠 此skuId才非空)',
  `coupon_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠类型: 20-套装优惠, 28-闪团优惠, 29-团购优惠, 30-单品促销优惠, 34-手机红包, 35-满返满送(返现), 39-京豆优惠,41-京东券优惠, 52-礼品卡优惠,100-店铺优惠',
  `coupon_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠金额。',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单优惠明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_jd_order_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for oms_jd_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order_item`;
CREATE TABLE `oms_jd_order_item`  (
  `id` bigint NOT NULL,
  `order_id` bigint NOT NULL COMMENT '订单id（京东平台）',
  `sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '京东内部SKU的ID',
  `outer_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU外部ID（极端情况下不保证返回，建议从商品接口获取',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品的名称+SKU规格',
  `jd_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU的京东价',
  `gift_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '赠送积分',
  `ware_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	京东内部商品ID（极端情况下不保证返回，建议从商品接口获取）',
  `item_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数量',
  `product_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_store_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单明细表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for oms_jd_waybill_account
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_waybill_account`;
CREATE TABLE `oms_jd_waybill_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `seller_id` bigint NULL DEFAULT NULL COMMENT '商家ID',
  `provider_id` int NULL DEFAULT NULL COMMENT '承运商id',
  `provider_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '承运商编码',
  `provider_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '承运商名称',
  `provider_type` int NULL DEFAULT NULL COMMENT '承运商类型,1-快递公司 2-物流公司 3-安装公司 4-生鲜冷链公司',
  `amount` int NULL DEFAULT NULL COMMENT '可用单数',
  `support_cod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否支持货到付款',
  `branch_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点ID',
  `branch_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点名称',
  `settlement_code` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财务结算编码',
  `province_id` int NULL DEFAULT NULL,
  `province_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称（一级地址）',
  `city_id` int NULL DEFAULT NULL,
  `city_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称（二级地址）',
  `country_id` int NULL DEFAULT NULL COMMENT '区名称（三级地址）',
  `country_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `countryside_id` int NULL DEFAULT NULL,
  `countryside_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称（三级地址）',
  `address` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `mobile` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货手机号',
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货固定电话',
  `is_show` int NULL DEFAULT NULL COMMENT '是否前台显示1显示0不显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东电子面单账户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_jd_waybill_account
-- ----------------------------

-- ----------------------------
-- Table structure for oms_pdd_goods
-- ----------------------------
DROP TABLE IF EXISTS `oms_pdd_goods`;
CREATE TABLE `oms_pdd_goods`  (
  `id` bigint NOT NULL,
  `goods_id` bigint NULL DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_quantity` bigint NULL DEFAULT NULL COMMENT '商品总数量',
  `is_more_sku` int NULL DEFAULT NULL COMMENT '是否多sku，0-单sku，1-多sku',
  `is_onsale` int NULL DEFAULT NULL COMMENT '是否在架上，0-下架中，1-架上',
  `thumb_url` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品缩略图',
  `created_at` bigint NULL DEFAULT NULL COMMENT '商品创建时间的时间戳',
  `shop_id` int NOT NULL COMMENT '店铺id',
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT 'erp商品id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'pdd商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for oms_pdd_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_pdd_goods_sku`;
CREATE TABLE `oms_pdd_goods_sku`  (
  `id` bigint NOT NULL,
  `sku_id` bigint NULL DEFAULT NULL COMMENT 'sku编码',
  `goods_id` bigint NULL DEFAULT NULL COMMENT 'pdd商品编码',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `thumb_url` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品缩略图',
  `outer_id` varchar(85) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家外部编码（sku）',
  `sku_quantity` bigint NULL DEFAULT NULL COMMENT 'sku库存',
  `spec` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  `is_sku_onsale` int NULL DEFAULT NULL COMMENT 'sku是否在架上，0-下架中，1-架上',
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT '商品id(o_goods外键)',
  `erp_goods_sku_id` bigint NULL DEFAULT NULL COMMENT '商品skuid(o_goods_sku外键)',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'pdd商品SKU表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for oms_pdd_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_pdd_order`;
CREATE TABLE `oms_pdd_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单id，自增',
  `shop_id` int NOT NULL COMMENT '内部店铺ID',
  `order_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `trade_type` int NOT NULL COMMENT '订单类型 0-普通订单 ，1- 定金订单',
  `free_sf` int NOT NULL COMMENT '是否顺丰包邮，1-是 0-否',
  `is_lucky_flag` int NOT NULL COMMENT '是否是抽奖订单，1-非抽奖订单，2-抽奖订单',
  `group_status` int NOT NULL COMMENT '成团状态：0：拼团中、1：已成团、2：团失败',
  `confirm_status` int NOT NULL COMMENT '成交状态：0：未成交、1：已成交、2：已取消、',
  `order_status` int NOT NULL COMMENT '订单状态1：待发货，2：已发货待签收，3：已签收',
  `refund_status` int NOT NULL COMMENT '售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 5：全部',
  `capital_free_discount` double NOT NULL COMMENT '团长免单金额，单位：元',
  `seller_discount` double NOT NULL COMMENT '商家优惠金额，单位：元',
  `platform_discount` double NOT NULL COMMENT '平台优惠金额，单位：元',
  `goods_amount` double NOT NULL COMMENT '商品金额，单位：元，商品金额=商品销售价格*商品数量-改价金额（接口暂无该字段）',
  `discount_amount` double NOT NULL COMMENT '折扣金额，单位：元，折扣金额=平台优惠+商家优惠+团长免单优惠金额',
  `pay_amount` double NOT NULL COMMENT '支付金额，单位：元，支付金额=商品金额-折扣金额+邮费',
  `postage` double NOT NULL COMMENT '邮费，单位：元',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单备注',
  `remark_tag` int NULL DEFAULT NULL COMMENT '订单备注标记，1-红色，2-黄色，3-绿色，4-蓝色，5-紫色',
  `remark_tag_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单备注标记名称',
  `buyer_memo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '买家留言信息',
  `updated_at` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单的更新时间',
  `shipping_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发货时间',
  `tracking_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '快递单号',
  `tracking_company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '物流公司',
  `pay_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付方式，枚举值：QQ,WEIXIN,ALIPAY,LIANLIANPAY',
  `pay_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付单号',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件人地址，不拼接省市区',
  `receiver_address_mask` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件人地址（打码）',
  `receiver_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件人电话',
  `receiver_phone_mask` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `receiver_name_mask` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address_mask` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详细地址',
  `town` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '区县',
  `town_id` int NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '市',
  `city_id` int NULL DEFAULT NULL COMMENT '城市编码',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '省',
  `province_id` int NULL DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家地区',
  `country_id` int NULL DEFAULT NULL,
  `created_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `pay_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付时间',
  `confirm_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '成交时间',
  `receive_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '确认收货时间',
  `after_sales_status` int NOT NULL COMMENT '售后状态 0：无售后 2：买家申请退款，待商家处理 3：退货退款，待商家处理 4：商家同意退款，退款中 5：平台同意退款，退款中 6：驳回退款， 待买家处理 7：已同意退货退款,待用户发货 8：平台处理中 9：平台拒 绝退款，退款关闭 10：退款成功 11：买家撤销 12：买家逾期未处 理，退款失败 13：买家逾期，超过有效期 14 : 换货补寄待商家处理 15:换货补寄待用户处理 16:换货补寄成功 17:换货补寄失败 18:换货补寄待用户确认完成',
  `last_ship_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单承诺发货时间',
  `tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签',
  `delivery_one_day` int NULL DEFAULT NULL COMMENT '是否当日发货，1-是，0-否',
  `duoduo_wholesale` int NULL DEFAULT NULL COMMENT '是否多多批发，1-是，0-否',
  `home_delivery_type` int NULL DEFAULT NULL COMMENT '送货入户并安装服务 0-不支持送货，1-送货入户不安装，2-送货入户并安装',
  `invoice_status` int NULL DEFAULT NULL COMMENT '发票申请,1代表有 0代表无',
  `is_pre_sale` int NULL DEFAULT NULL COMMENT '是否为预售商品 1表示是 0表示否',
  `is_stock_out` int NULL DEFAULT NULL COMMENT '是否缺货 0-无缺货处理 1： 有缺货处理',
  `logistics_id` bigint NULL DEFAULT NULL COMMENT '快递公司在拼多多的代码',
  `mkt_biz_type` int NULL DEFAULT NULL COMMENT '市场业务类型，0-普通订单，1-拼内购订单',
  `only_support_replace` int NULL DEFAULT NULL COMMENT '只换不修，1:是，0:否',
  `order_change_amount` double NULL DEFAULT NULL COMMENT '订单改价折扣金额，单位元',
  `pre_sale_time` varchar(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '预售时间',
  `return_freight_payer` int NULL DEFAULT NULL COMMENT '退货包运费，1:是，0:否',
  `risk_control_status` int NULL DEFAULT NULL COMMENT '订单审核状态（0-正常订单， 1-审核中订单）',
  `urge_shipping_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '催发货时间',
  `audit_status` int NOT NULL DEFAULT 0 COMMENT '0待确认，1已确认2已拦截-9未拉取',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '发货时间（仓库真实发货时间）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系统创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '系统更新时间',
  `erp_send_company` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递公司',
  `erp_send_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递单号',
  `erp_send_status` int NULL DEFAULT 0 COMMENT 'erp发货状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_sn_index`(`order_sn`) USING BTREE,
  INDEX `shopid_index`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1795400709858312194 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '拼多多订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_pdd_order
-- ----------------------------

-- ----------------------------
-- Table structure for oms_pdd_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_pdd_order_item`;
CREATE TABLE `oms_pdd_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id，自增',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `order_sn` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `erp_goods_id` int NOT NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `erp_spec_id` int NOT NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  `good_id` bigint NULL DEFAULT 0 COMMENT '拼多多商品id',
  `sku_id` bigint NULL DEFAULT 0 COMMENT '拼多多商品skuid',
  `goods_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_spec` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `goods_price` double NOT NULL COMMENT '商品单价',
  `outer_goods_id` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家外部编码（商品）',
  `outer_id` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家外部编码（sku）',
  `goods_count` int NOT NULL COMMENT '商品数量',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `item_amount` double NULL DEFAULT NULL COMMENT '子订单金额',
  `is_gift` tinyint NOT NULL DEFAULT 0 COMMENT '是否礼品0否1是',
  `refund_count` int NULL DEFAULT 0 COMMENT '已退货数量',
  `refund_status` int NOT NULL COMMENT '售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 ',
  `shop_id` int NOT NULL COMMENT '内部店铺ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系统创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodId_index`(`erp_goods_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1795400709887672323 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼多多订单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_pdd_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for oms_pdd_refund
-- ----------------------------
DROP TABLE IF EXISTS `oms_pdd_refund`;
CREATE TABLE `oms_pdd_refund`  (
  `id` bigint NOT NULL COMMENT '售后编号',
  `shop_id` int NOT NULL COMMENT '内部店铺ID',
  `order_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `after_sales_type` int NOT NULL COMMENT '售后类型 1：全部 2：仅退款 3：退货退款 4：换货 5：缺货补寄 6：维修',
  `after_sales_status` int NOT NULL COMMENT '售后状态 0：无售后 2：买家申请退款，待商家处理 3：退货退款，待商家处理 4：商家同意退款，退款中 5：平台同意退款，退款中 6：驳回退款，待买家处理 7：已同意退货退款,待用户发货 8：平台处理中 9：平台拒绝退款，退款关闭 10：退款成功 11：买家撤销 12：买家逾期未处理，退款失败 13：买家逾期，超过有效期 14：换货补寄待商家处理 15：换货补寄待用户处理 16：换货补寄成功 17：换货补寄失败 18：换货补寄待用户确认完成 21：待商家同意维修 22：待用户确认发货 24：维修关闭 25：维修成功 27：待用户确认收货 31：已同意拒收退款，待用户拒收 32：补寄待商家发货 33：待商家召回',
  `after_sale_reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后原因',
  `confirm_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单成团时间',
  `created_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建时间',
  `discount_amount` double NOT NULL COMMENT '订单折扣金额（元）',
  `dispute_refund_status` double NULL DEFAULT NULL COMMENT '1纠纷退款 0非纠纷退款',
  `goods_image` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_id` bigint NULL DEFAULT NULL COMMENT '拼多多商品id',
  `goods_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_price` double NOT NULL COMMENT '商品价格，单位：元',
  `order_amount` double NOT NULL COMMENT '订单金额（元）',
  `refund_amount` double NOT NULL COMMENT '退款金额（元）',
  `refund_operator_role` int NULL DEFAULT NULL COMMENT '同意退款操作人角色0:\"默认\",1:\"用户\",2:\"商家\",3:\"平台\",4:\"系统\",5:\"团长\",6:\"司机\",7:\"代理人\"',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '拼多多商品skuid',
  `outer_goods_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家外部编码（商品）',
  `outer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商家外部编码（sku）',
  `goods_spec` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品规格',
  `goods_number` int NOT NULL COMMENT '数量',
  `shipping_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退货物流公司名称',
  `speed_refund_flag` int NULL DEFAULT NULL COMMENT '极速退款标志位 1：极速退款，0：非极速退款',
  `speed_refund_status` int NULL DEFAULT NULL COMMENT '极速退款状态，\"1\"：有极速退款资格，\"2\"：极速退款失败, \"3\" 表示极速退款成功，其他表示非极速退款',
  `user_shipping_status` int NULL DEFAULT NULL COMMENT '0-未勾选 1-消费者选择的收货状态为未收到货 2-消费者选择的收货状态为已收到货',
  `tracking_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `updated_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼多多订单退款表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_pdd_refund
-- ----------------------------

-- ----------------------------
-- Table structure for oms_pdd_waybill_account
-- ----------------------------
DROP TABLE IF EXISTS `oms_pdd_waybill_account`;
CREATE TABLE `oms_pdd_waybill_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `seller_id` bigint NULL DEFAULT NULL COMMENT '商家ID',
  `cp_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流服务商编码',
  `cp_type` int NULL DEFAULT NULL COMMENT '1是直营，2是加盟',
  `quantity` int NULL DEFAULT NULL COMMENT '可用单数',
  `allocated_quantity` int NULL DEFAULT NULL COMMENT '已用单数',
  `branch_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点ID',
  `branch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点名称',
  `print_quantity` int NULL DEFAULT NULL COMMENT '已经打印的面单总数',
  `cancel_quantity` int NULL DEFAULT NULL COMMENT '取消的面对总数',
  `waybill_address_id` bigint NULL DEFAULT NULL COMMENT 'waybill 地址记录ID(非地址库ID)',
  `province` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称（一级地址）',
  `city` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称（二级地址）',
  `area` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称（三级地址）',
  `address_detail` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `mobile` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货手机号',
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货固定电话',
  `is_show` int NULL DEFAULT NULL COMMENT '是否前台显示1显示0不显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼多多电子面单账户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_pdd_waybill_account
-- ----------------------------

-- ----------------------------
-- Table structure for oms_tao_goods
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_goods`;
CREATE TABLE `oms_tao_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `iid` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `num_iid` bigint NULL DEFAULT NULL COMMENT '商品数字id',
  `title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `nick` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '卖家昵称',
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品类型(fixed:一口价;auction:拍卖)注：取消团购',
  `cid` bigint NULL DEFAULT NULL COMMENT '商品所属的叶子类目 id',
  `seller_cids` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品所属的店铺内卖家自定义类目列表',
  `pic_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主图',
  `num` int NULL DEFAULT NULL COMMENT '商品数量',
  `props` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品属性 格式：pid:vid;pid:vid',
  `valid_thru` int NULL DEFAULT NULL COMMENT '有效期,7或者14（默认是7天）',
  `has_discount` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '支持会员打折,true/false',
  `has_invoice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否有发票,true/false',
  `has_warranty` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否有保修,true/false',
  `has_showcase` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '橱窗推荐,true/false',
  `modified` datetime NULL DEFAULT NULL COMMENT '商品修改时间（格式：yyyy-MM-dd HH:mm:ss）',
  `delist_time` datetime NULL DEFAULT NULL COMMENT '下架时间（格式：yyyy-MM-dd HH:mm:ss）',
  `postage_id` bigint NULL DEFAULT NULL COMMENT '宝贝所属的运费模板ID，如果没有返回则说明没有使用运费模板',
  `outer_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家外部编码(可与商家外部系统对接)。需要授权才能获取。',
  `list_time` datetime NULL DEFAULT NULL COMMENT '上架时间（格式：yyyy-MM-dd HH:mm:ss）',
  `price` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品价格，格式：5.00；单位：元；精确到：分',
  `remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_ex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否在外部网店显示',
  `is_virtual` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '虚拟商品的状态字段',
  `is_taobao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否在淘宝显示',
  `sold_quantity` int NULL DEFAULT 0 COMMENT '商品销量',
  `is_cspu` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否为达尔文挂接成功了的商品',
  `first_starts_time` datetime NULL DEFAULT NULL COMMENT '商品首次上架时间',
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT 'erp商品id',
  `erp_supplier_id` bigint NULL DEFAULT NULL COMMENT 'erp系统供应商ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1800363757383634947 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '淘宝商品表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for oms_tao_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_goods_sku`;
CREATE TABLE `oms_tao_goods_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num_iid` bigint NOT NULL COMMENT 'sku所属商品数字id',
  `iid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku所属商品id(注意：iid近期即将废弃，请用num_iid参数)',
  `sku_id` bigint NOT NULL COMMENT '商品skuid，阿里',
  `properties` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku的销售属性组合字符串（颜色，大小，等等，可通过类目API获取某类目下的销售属性）,格式是p1:v1;p2:v2',
  `properties_name` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku所对应的销售属性的中文名字串，格式如：pid1:vid1:pid_name1:vid_name1;pid2:vid2:pid_name2:vid_name2……',
  `quantity` bigint NULL DEFAULT NULL COMMENT '属于这个sku的商品的数量，',
  `spec` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'specId',
  `price` double NULL DEFAULT NULL COMMENT '属于这个sku的商品的价格 取值范围:0-100000000;精确到2位小数;单位:元。如:200.07，表示:200元7分。',
  `outer_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家设置的外部id。',
  `created` datetime NULL DEFAULT NULL COMMENT 'sku创建日期 时间格式：yyyy-MM-dd HH:mm:ss',
  `modified` datetime NULL DEFAULT NULL COMMENT 'sku最后修改日期 时间格式：yyyy-MM-dd HH:mm:ss',
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku状态。	normal',
  `sku_spec_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表示SKu上的产品规格信息',
  `barcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品级别的条形码',
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT '商品id(o_goods外键)',
  `erp_goods_sku_id` bigint NULL DEFAULT NULL COMMENT '商品skuid(o_goods_sku外键)',
  `shop_id` bigint NULL DEFAULT NULL COMMENT '店铺id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1800370800777670659 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '淘宝商品SKU表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for oms_tao_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_order`;
CREATE TABLE `oms_tao_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `shop_id` int NOT NULL DEFAULT 0 COMMENT '店铺id',
  `tid` bigint NOT NULL COMMENT '交易编号 (父订单的交易编号)',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易标题，以店铺名作为此标题的值。',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易类型列表，同时查询多种交易类型可用逗号分隔。',
  `seller_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家备注旗帜（与淘宝网上订单的卖家备注旗帜对应，只有卖家才能查看该字段）红、黄、绿、蓝、紫 分别对应 1、2、3、4、5',
  `has_buyer_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '判断订单是否有买家留言，有买家留言返回true，否则返回false',
  `credit_card_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用信用卡支付金额数',
  `step_trade_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分阶段付款的订单状态（例如万人团订单等），目前有三返回状态FRONT_NOPAID_FINAL_NOPAID(定金未付尾款未付)，FRONT_PAID_FINAL_NOPAID(定金已付尾款未付)，FRONT_PAID_FINAL_PAID(定金和尾款都付)',
  `step_paid_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分阶段付款的已付金额（万人团订单已付金额）',
  `buyer_open_uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家OpenUid',
  `mark_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单出现异常问题的时候，给予用户的描述,没有异常的时候，此值为空',
  `buyer_nick` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '买家昵称',
  `num_iid` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品数字编号',
  `num` int NULL DEFAULT NULL COMMENT '商品购买数量。取值范围：大于零的整数,对于一个trade对应多个order的时候（一笔主订单，对应多笔子订单），num=0，num是一个跟商品关联的属性，一笔订单对应多比子订单的时候，主订单上的num无意义。',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格。精确到2位小数；单位：元。如：200.07，表示：200元7分',
  `total_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品金额（商品价格乘以数量的总金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `adjust_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '卖家手工调整金额，精确到2位小数，单位：元。如：200.07',
  `post_fee` decimal(5, 2) NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `discount_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `payment` decimal(10, 2) NOT NULL COMMENT '实付金额',
  `received_payment` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '卖家实际收到的支付宝打款金额（由于子订单可以部分确认收货，这个金额会随着子订单的确认收货而不断增加，交易成功后等于买家实付款减去退款金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `available_confirm_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '交易中剩余的确认收货金额（这个金额会随着子订单确认收货而不断减少，交易成功后会变为零）。精确到2位小数;单位:元。如:200.07，表示:200 元7分',
  `cod_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '货到付款服务费。',
  `cod_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货到付款物流状态。初始状态 NEW_CREATED,接单成功 ACCEPTED_BY_COMPANY,接单失败 REJECTED_BY_COMPANY,接单超时 RECIEVE_TIMEOUT,揽收成功 TAKEN_IN_SUCCESS,揽收失败 TAKEN_IN_FAILED,揽收超时 TAKEN_TIMEOUT,签收成功 SIGN_IN,签收失败 REJECTED_BY_OTHER_SIDE,订单等待发送给物流公司 WAITING_TO_BE_SENT,用户取消物流订单 CANCELED',
  `buyer_cod_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家货到付款服务费',
  `seller_cod_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家货到付款服务费',
  `express_agency_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递代收款。',
  `commission_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '交易佣金。',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建交易时的物流方式（交易完成前，物流方式有可能改变，但系统里的这个字段一直不变）。可选值：free(卖家包邮),post(平邮),express(快递),ems(EMS),virtual(虚拟发货)，25(次日必达)，26(预约配送)。',
  `created` datetime NOT NULL COMMENT '交易创建时间。格式:yyyy-MM-dd HH:mm:ss',
  `modified` datetime NULL DEFAULT NULL COMMENT '交易修改时间(用户对订单的任何修改都会更新此字段)。格式:yyyy-MM-dd HH:mm:ss',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '付款时间。格式:yyyy-MM-dd HH:mm:ss。订单的付款时间即为物流订单的创建时间。',
  `consign_time` datetime NULL DEFAULT NULL COMMENT '卖家发货时间。格式:yyyy-MM-dd HH:mm:ss',
  `end_time` datetime NULL DEFAULT NULL COMMENT '交易结束时间。交易成功时间(更新交易状态为成功的同时更新)/确认收货时间或者交易关闭时间 。格式:yyyy-MM-dd HH:mm:ss',
  `seller_memo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '卖家备忘信息',
  `buyer_memo` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '买家备注',
  `buyer_message` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '买家留言',
  `point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家使用积分,下单时生成，且一直不变。格式:100;单位:个.',
  `real_point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家实际使用积分（扣除部分退款使用的积分），交易完成后生成（交易成功或关闭），交易未完成时该字段值为0。格式:100;单位:个',
  `buyer_obtain_point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家获得积分,返点的积分。格式:100;单位:个。返点的积分要交易成功之后才能获得。',
  `receiving_time` datetime NULL DEFAULT NULL COMMENT '收货时间，这里返回的是完全收货时间',
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '交易状态。可选值: * TRADE_NO_CREATE_PAY(没有创建支付宝交易) * WAIT_BUYER_PAY(等待买家付款) * SELLER_CONSIGNED_PART(卖家部分发货) * WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) * WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) * TRADE_BUYER_SIGNED(买家已签收,货到付款专用) * TRADE_FINISHED(交易成功) * TRADE_CLOSED(付款以后用户退款成功，交易自动关闭) * TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易) * PAY_PENDING(国际信用卡支付付款确认中) * WAIT_PRE_AUTH_CONFIRM(0元购合约中) * PAID_FORBID_CONSIGN(拼团中订单或者发货强管控的订单，已付款但禁止发货)',
  `trade_memo` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '交易备注。',
  `create_time` datetime NULL DEFAULT NULL COMMENT '数据库创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '数据库更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据库更新人',
  `oaid` varchar(2552) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '（收货人+手机号+座机+收货地址+create）5个字段组合成oaid，原始订单上座机为空也满足条件，否则生成不了oaid',
  `aid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址aid字段',
  `receiver_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人国籍',
  `receiver_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的所在省份',
  `receiver_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的所在城市',
  `receiver_district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的所在地区',
  `receiver_town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人街道地址',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的详细地址',
  `receiver_zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的邮编',
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的姓名',
  `receiver_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的手机号码',
  `receiver_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的电话号码',
  `seller_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家是否已评价。可选值:true(已评价),false(未评价)',
  `seller_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家昵称',
  `buyer_rate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '买家是否已评价。可选值:true(已评价),false(未评价)。如买家只评价未打分，此字段仍返回false',
  `buyer_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家下单的地区',
  `alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号，如：2009112081173831',
  `buyer_alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家支付宝账号',
  `buyer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家邮件地址',
  `seller_alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家支付宝账号',
  `has_post_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否包含邮费。与available_confirm_fee同时使用。可选值:true(包含),false(不包含)',
  `timeout_action_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '超时到期时间。格式:yyyy-MM-dd HH:mm:ss。业务规则：前提条件：只有在买家已付款，卖家已发货的情况下才有效如果申请了退款，那么超时会落在子订单上；比如说3笔ABC，A申请了，那么返回的是BC的列表, 主定单不存在如果没有申请过退款，那么超时会挂在主定单上；比如ABC，返回主定单，ABC的超时和主定单相同',
  `snapshot_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易快照地址',
  `promotion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易促销详细信息',
  `yfx_fee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单的运费险，单位为元',
  `has_yfx` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单中是否包含运费险订单，如果包含运费险订单返回true，不包含运费险订单，返回false',
  `send_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单将在此时间前发出，主要用于预售订单',
  `is_part_consign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是多次发货的订单如果卖家对订单进行多次发货，则为true否则为false',
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流运单号',
  `tmall_coupon_fee` bigint NULL DEFAULT NULL COMMENT '天猫商家使用，订单使用的红包信息',
  `audit_status` int NULL DEFAULT NULL COMMENT '订单审核状态（0待审核1已审核）',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  `erp_send_company` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递公司',
  `erp_send_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递单号',
  `erp_send_status` int NULL DEFAULT 0 COMMENT 'erp发货状态（1已取号2已打印3已发货10手动发货）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1801155298566070275 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for oms_tao_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_order_item`;
CREATE TABLE `oms_tao_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tid` bigint NOT NULL COMMENT '订单id',
  `oid` bigint NOT NULL COMMENT '子订单编号',
  `total_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（商品价格 * 商品数量 + 手工调整金额 - 子订单级订单优惠金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `discount_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '子订单级订单优惠金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `adjust_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '手工调整金额.格式为:1.01;单位:元;精确到小数点后两位.',
  `divide_order_fee` float NULL DEFAULT NULL COMMENT '分摊之后的实付金额',
  `part_mjz_discount` float NULL DEFAULT NULL COMMENT '优惠分摊',
  `payment` float NULL DEFAULT NULL COMMENT '子订单实付金额。精确到2位小数，单位:元。如:200.07，表示:200元7分。对于多子订单的交易，计算公式如下：payment = price * num + adjust_fee - discount_fee ；单子订单交易，payment与主订单的payment一致，对于退款成功的子订单，由于主订单的优惠分摊金额，会造成该字段可能不为0.00元。建议使用退款前的实付金额减去退款单中的实际退款金额计算。',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `pic_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `num_iid` bigint NULL DEFAULT NULL COMMENT '商品数字ID',
  `sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品的最小库存单位Sku的id.可以通过taobao.item.sku.get获取详细的Sku信息天猫的SKUID',
  `outer_iid` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家外部编码(可与商家外部系统对接)。',
  `outer_sku_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '外部网店自己定义的Sku编号',
  `sku_properties_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'SKU的值。如：机身颜色:黑色;手机套餐:官方标配',
  `item_meal_id` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐ID',
  `item_meal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐的值。如：M8原装电池:便携支架:M8专用座充:莫凡保护袋',
  `num` int NULL DEFAULT NULL COMMENT '数量',
  `timeout_action_time` datetime NULL DEFAULT NULL COMMENT '订单超时到期时间。格式:yyyy-MM-dd HH:mm:ss',
  `item_memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品备注',
  `buyer_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家是否已评价。可选值：true(已评价)，false(未评价)',
  `seller_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家是否已评价。可选值：true(已评价)，false(未评价)',
  `seller_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家类型，可选值为：B（商城商家），C（普通卖家）',
  `cid` bigint NULL DEFAULT NULL COMMENT '交易商品对应的类目ID',
  `is_oversold` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	是否超卖',
  `end_time` datetime NULL DEFAULT NULL COMMENT '子订单的交易结束时间说明：子订单有单独的结束时间，与主订单的结束时间可能有所不同，在有退款发起的时候或者是主订单分阶段付款的时候，子订单的结束时间会早于主订单的结束时间，所以开放这个字段便于订单结束状态的判断',
  `order_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单来源,如jhs(聚划算)、taobao(淘宝)、wap(无线)',
  `is_service_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是服务订单，是返回true，否返回false。',
  `consign_time` datetime NULL DEFAULT NULL COMMENT '子订单发货时间，当卖家对订单进行了多次发货，子订单的发货时间和主订单的发货时间可能不一样了，那么就需要以子订单的时间为准。（没有进行多次发货的订单，主订单的发货时间和子订单的发货时间都一样）',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单的运送方式（卖家对订单进行多次发货之后，一个主订单下的子订单的运送方式可能不同，用order.shipping_type来区分子订单的运送方式）',
  `logistics_company` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单发货的快递公司名称',
  `invoice_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单所在包裹的运单号',
  `bind_oid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '捆绑的子订单号，表示该子订单要和捆绑的子订单一起发货，用于卖家子订单捆绑发货',
  `status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单状态（请关注此状态，如果为TRADE_CLOSED_BY_TAOBAO状态，则不要对此订单进行发货，切记啊！）。可选值:\r\nTRADE_NO_CREATE_PAY(没有创建支付宝交易)\r\nWAIT_BUYER_PAY(等待买家付款)\r\nWAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款)\r\nWAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货)\r\nTRADE_BUYER_SIGNED(买家已签收,货到付款专用)\r\nTRADE_FINISHED(交易成功)\r\nTRADE_CLOSED(付款以后用户退款成功，交易自动关闭)\r\nTRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易)\r\nPAY_PENDING(国际信用卡支付付款确认中)',
  `refund_status` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'NO_REFUND' COMMENT '退款状态。退款状态。可选值 WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
  `refund_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近退款ID',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1801155298620596227 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单明细表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for oms_tao_order_promotion
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_order_promotion`;
CREATE TABLE `oms_tao_order_promotion`  (
  `id` bigint NOT NULL COMMENT '交易的主订单或子订单号',
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠信息的名称',
  `discount_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠金额（免运费、限时打折时为空）,单位：元',
  `gift_item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '满就送商品时，所送商品的名称',
  `gift_item_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '赠品的宝贝id',
  `gift_item_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '满就送礼物的礼物数量',
  `promotion_desc` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠活动的描述',
  `promotion_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠id，(由营销工具id、优惠活动id和优惠详情id组成，结构为：营销工具id-优惠活动id_优惠详情id，如mjs-123024_211143）',
  `kd_discount_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分摊优惠金额（免运费、限时打折时为空）,单位：元',
  `kd_child_discount_fee` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '若优惠项在主订单上，返回子订单的分摊信息'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单优惠明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_tao_order_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for oms_tao_refund
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_refund`;
CREATE TABLE `oms_tao_refund`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款id',
  `dispute_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款类型，可选值REFUND(仅退款),REFUND_AND_RETURN(退货退款),TMALL_EXCHANGE(天猫换货),TAOBAO_EXCHANGE(淘宝换货),REPAIR(维修),RESHIPPING(补寄),OTHERS(其他)',
  `shop_id` int NOT NULL COMMENT '店铺id',
  `tid` bigint NULL DEFAULT NULL COMMENT '淘宝交易单号（订单号）',
  `oid` bigint NULL DEFAULT NULL COMMENT '子订单号。如果是单笔交易oid会等于tid',
  `payment` float NULL DEFAULT NULL COMMENT '支付给卖家的金额(交易总金额-退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `price` float NULL DEFAULT NULL COMMENT '商品价格。',
  `total_fee` float NULL DEFAULT NULL COMMENT '交易总金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `refund_fee` float NULL DEFAULT NULL COMMENT '退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `split_seller_fee` float NULL DEFAULT NULL COMMENT '	分账给卖家的钱',
  `split_taobao_fee` float NULL DEFAULT NULL COMMENT '分账给淘宝的钱',
  `created` datetime NULL DEFAULT NULL COMMENT '退款申请时间。格式:yyyy-MM-dd HH:mm:ss',
  `modified` datetime NULL DEFAULT NULL COMMENT '更新时间。格式:yyyy-MM-dd HH:mm:ss',
  `seller_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家昵称',
  `cs_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '不需客服介入1;需要客服介入2;客服已经介入3;客服初审完成4;客服主管复审失败5;客服处理完成6;系统撤销(B2B使用)，维权撤销(集市使用) 7;支持买家 8;支持卖家 9;举证中 10;开放申诉 11;',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款状态。可选值WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款对应的订单交易状态。可选值TRADE_NO_CREATE_PAY(没有创建支付宝交易) WAIT_BUYER_PAY(等待买家付款) WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) TRADE_BUYER_SIGNED(买家已签收,货到付款专用) TRADE_FINISHED(交易成功) TRADE_CLOSED(交易关闭) TRADE_CLOSED_BY_TAOBAO(交易被淘宝关闭) ALL_WAIT_PAY(包含：WAIT_BUYER_PAY、TRADE_NO_CREATE_PAY) ALL_CLOSED(包含：TRADE_CLOSED、TRADE_CLOSED_BY_TAOBAO) 取自\"http://open.taobao.com/dev/index.php/%E4%BA%A4%E6%98%93%E7%8A%B6%E6%80%81\"',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家收货地址',
  `advance_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款先行垫付默认的未申请状态 0;退款先行垫付申请中 1;退款先行垫付，垫付完成 2;退款先行垫付，卖家拒绝收货 3;退款先行垫付，垫付关闭 4;退款先行垫付，垫付分账成功 5;',
  `alipay_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号',
  `good_return_time` datetime NULL DEFAULT NULL COMMENT '退货时间。格式:yyyy-MM-dd HH:mm:ss',
  `good_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '货物状态。可选值BUYER_NOT_RECEIVED (买家未收到货) BUYER_RECEIVED (买家已收到货) BUYER_RETURNED_GOODS (买家已退货)',
  `has_good_return` int NULL DEFAULT NULL COMMENT '买家是否需要退货。可选值:true(是),false(否)',
  `num_iid` bigint NULL DEFAULT NULL COMMENT '申请退款的商品数字编号',
  `num` bigint NOT NULL DEFAULT 0 COMMENT '退货数量',
  `outer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品外部商家编码',
  `reason` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款原因',
  `refund_phase` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款阶段，可选值：onsale/aftersale',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流方式.可选值:free(卖家包邮),post(平邮),express(快递),ems(EMS).',
  `desc1` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款说明',
  `company_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `sid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退货运单号',
  `send_time` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '买家发货时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '	完结时间。格式:yyyy-MM-dd HH:mm:ss',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `sku` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品SKU信息',
  `buyer_open_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家openUid',
  `buyer_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家昵称',
  `combine_item_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合品信息\r\nnum_iid	String	2342344	商品数字编号\r\nitem_name	String	测试商品	商品标题\r\nquantity	Number	123	数量\r\nsku_id	String	123	sku_id\r\nouter_iid	String	123	商家外部编码(可与商家外部系统对接)\r\nouter_sku_id	String	123	123',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pull_status` int NULL DEFAULT NULL COMMENT '推送状态（0未推送；1推送成功；2推送失败）',
  `pull_time` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1803592791513006083 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝退款表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_tao_refund
-- ----------------------------
INSERT INTO `oms_tao_refund` VALUES (1786655103661359105, '154686037032128162', 'REFUND', 6, 2137984935735126281, 2137984935736126281, 0, NULL, 3378, 3378, NULL, NULL, '2024-05-04 13:04:42', '2024-05-04 13:04:43', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-04 13:04:43', '曲美家居现代简约双人板式床舒适婚床卧室多功能储物床', '4988190157320|颜色分类:木本色架子床+独袋乳胶床垫;尺寸:1500mm*2000mm', 'AAH3HVMUAAJ_dKyzaDW__rrF', '阿绿碎碎念', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103690719234, '272863119053250876', 'REFUND', 6, 3873446498759257608, 3873446498760257608, 0, NULL, 9999, 9999, NULL, NULL, '2024-05-04 09:10:40', '2024-05-04 09:10:54', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '订单信息拍错（规格/尺码/颜色等）', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-04 09:10:54', '曲美lab墩墩沙发现代简约轻奢风自由模块组合布艺别墅客厅沙发', '5015802656260|适用人数:组合;颜色分类:【适用4人】灯芯绒-燕麦白', 'AAEeHVMUAAJ_dKyzaDWtYDsb', 'yina_1217', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103757828097, '272811564981003461', 'REFUND', 6, 3867452064428006134, 3867452064429006134, 0, NULL, 12359, 12359, NULL, NULL, '2024-05-04 00:20:08', '2024-05-04 08:46:35', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '没用/少用优惠', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-04 08:46:36', '曲美lab墩墩沙发现代简约轻奢风自由模块组合布艺别墅客厅沙发', '5015802656265|适用人数:组合;颜色分类:【适用4人】灯芯绒-奶茶灰', 'AAFlHVMUAAJ_dKyzaDUeaMJi', '亲你妹夫亲', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103757828098, '272807678894920119', 'REFUND_AND_RETURN', 6, 3851109505623921901, 3851109505624921901, 0, NULL, 2104.03, 2104.03, NULL, NULL, '2024-05-03 19:17:13', '2024-05-03 19:42:33', '曲美家具官方旗舰店', NULL, 'WAIT_SELLER_AGREE', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 1, 1298098439, 1, 'ZQB-2011C-WG1', '商品无法安装使用', 'aftersale', NULL, '', NULL, NULL, NULL, NULL, '【新风潮价】曲美家居现代简约实木衣柜卧室衣帽柜平开门衣橱环保板材储物柜', '4600898994639|颜色分类:木本色衣柜;门数量:2门;是否组装:组装', 'AAGyHVMUAAJ_dKyzaDUwia6Q', '无忌上', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 16:16:34', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103824936962, '154544811395929773', 'REFUND', 6, 2121326583552927397, 2121326583553927397, 0, NULL, 2135, 2135, NULL, NULL, '2024-05-03 17:49:22', '2024-05-03 17:49:23', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-03 17:49:23', '【活动价】曲美lab墩墩沙发现代简约模块布艺真皮沙发别墅客厅沙发自由搭配', '5451881559814|适用人数:组合;颜色分类:灯芯绒坐包-燕麦白;尺寸:84x84x40cm', 'AAHCHVMUAAJ_dKyzaDUfiNYK', 'nono璐hly', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103824936963, '154486920027549058', 'REFUND', 6, 2088964452215545890, 2088964452216545890, 1236.4, NULL, 1256.4, 20, NULL, NULL, '2024-05-03 17:10:19', '2024-05-03 17:10:21', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 0, 1684779514, 2, 'ZH-SF-04-DS-F9-QM20A-NT3', '与商家协商一致退款', 'aftersale', NULL, '', NULL, NULL, NULL, '2024-05-03 17:10:21', '曲美家居轻奢简约现代床头柜储物双抽床边柜皮质卧室置物储藏柜', '4902529397704|颜色分类:奶油白;安装方式:组装', 'AAHRHVMUAAJ_dKyzaDVwM06l', 'cfzxl365', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 20:31:50', 1, '2024-05-04 20:31:55');
INSERT INTO `oms_tao_refund` VALUES (1800472077964623874, '279871093213751685', 'REFUND', 4, 3861577406012758516, 3861577406013758516, 0, NULL, 2362, 2362, NULL, NULL, '2024-06-11 18:08:41', '2024-06-12 10:31:58', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, 'F6-23E-LAB-ZH1-M', '与商家协商一致退款', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-12 10:31:58', '曲美lab墩墩沙发现代简约模块布艺真皮沙发别墅客厅沙发门店同款', '5268494773128|适用人数:组合;颜色分类:【适用1-2人】头层牛皮-岩石灰', 'AAEQHVMUAAJ_dKyzaDUdRVEi', 'zz57401472', NULL, '2024-06-11 18:16:09', NULL, NULL, '2024-06-12 11:35:41', 1, '2024-06-12 11:35:41');
INSERT INTO `oms_tao_refund` VALUES (1800472078736375810, '279868104304722964', 'REFUND', 4, 3879460658822726429, 3879460658824726429, 0, NULL, 346.67, 346.67, NULL, NULL, '2024-06-11 13:52:57', '2024-06-11 13:52:58', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 8, '23E-219484', '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 13:52:58', '曲美家居现代简约岩板玻璃餐桌椅多功能可伸缩方行圆形餐桌潘多拉', '5421207317912|颜色分类:【预售】岩板+钢化玻璃可伸缩餐桌', 'AAHvHVMUAAJ_dKyzaDW8-M2z', '冰噬爱梦', NULL, '2024-06-11 18:16:09', NULL, NULL, '2024-06-12 11:35:41', 1, '2024-06-12 11:35:41');
INSERT INTO `oms_tao_refund` VALUES (1800472078904147970, '279868104303722964', 'REFUND', 4, 3879460658822726429, 3879460658823726429, 0, NULL, 563.33, 563.33, NULL, NULL, '2024-06-11 13:52:57', '2024-06-11 13:52:57', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 13, 'QM24-B4', '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 13:52:58', '曲美家居意式真皮床卧室主卧拉点皮床头层牛皮软包双人床华夫格', '5587595162215|家具结构:框架结构;颜色分类:【预售】黑色;尺寸:1800mm*2000mm', 'AAHvHVMUAAJ_dKyzaDW8-M2z', '冰噬爱梦', NULL, '2024-06-11 18:16:09', NULL, NULL, '2024-06-12 11:35:41', 1, '2024-06-12 11:35:41');
INSERT INTO `oms_tao_refund` VALUES (1800472079021588481, '161269683741425355', 'REFUND', 4, 2187488283548425553, 2187488283549425553, 0, NULL, 9970.91, 9970.91, NULL, NULL, '2024-06-11 13:52:50', '2024-06-11 14:07:59', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, 'F1-23E-LAB-ZD1*3&F1-23E-LAB-FS1*5', '订单信息拍错（规格/尺码/颜色等）', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 14:07:59', '【狂欢价】曲美lab墩墩沙发现代简约轻奢风自由模块组合布艺别墅客厅沙发', '5015802656260|适用人数:组合;颜色分类:【适用4人】灯芯绒-燕麦白', 'AAEyHVMUAAJ_dKyzaDWnBCAs', '豆蔻年华0707', NULL, '2024-06-11 18:16:09', NULL, NULL, '2024-06-12 11:35:41', 1, '2024-06-12 11:35:41');
INSERT INTO `oms_tao_refund` VALUES (1800472079139028993, '279864144869722964', 'REFUND', 4, 3879460658819726429, 3879460658820726429, 0, NULL, 390, 390, NULL, NULL, '2024-06-11 13:52:45', '2024-06-11 13:52:46', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 9, 'QM24-S5', '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 13:52:47', '曲美轻奢复古全真皮沙发客厅直排三人头层牛皮油蜡皮美拉德沙发', '5590041835567|颜色分类:【预售】栗壳棕;尺寸:286x91x104cm', 'AAHvHVMUAAJ_dKyzaDW8-M2z', '冰噬爱梦', NULL, '2024-06-11 18:16:09', NULL, NULL, '2024-06-12 11:35:41', 1, '2024-06-12 11:35:41');
INSERT INTO `oms_tao_refund` VALUES (1800472079243886593, '279821197232722964', 'REFUND', 4, 3879488414076726429, 3879488414078726429, 0, NULL, 349.47, 349.47, NULL, NULL, '2024-06-11 13:52:35', '2024-06-11 13:52:35', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 8, 'QM24-S4', '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 13:52:36', '曲美美式简约全真皮沙发客厅家用头层牛皮复古油蜡皮直排华夫格', '5590062491663|颜色分类:【预售】奶茶棕;尺寸:342x110x68cm', 'AAHvHVMUAAJ_dKyzaDW8-M2z', '冰噬爱梦', NULL, '2024-06-11 18:16:10', NULL, NULL, '2024-06-12 11:35:41', 1, '2024-06-12 11:35:41');
INSERT INTO `oms_tao_refund` VALUES (1800472079361327106, '279821197231722964', 'REFUND', 4, 3879488414076726429, 3879488414077726429, 0, NULL, 480.53, 480.53, NULL, NULL, '2024-06-11 13:52:35', '2024-06-11 13:52:36', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 11, 'QM24-B3', '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 13:52:36', '曲美家居意式复古真皮床轻奢现代主卧头层牛皮软包皮艺床大黑牛', '5590074319522|家具结构:框架结构;颜色分类:【预售】;尺寸:1800mm*2000mm', 'AAHvHVMUAAJ_dKyzaDW8-M2z', '冰噬爱梦', NULL, '2024-06-11 18:16:10', NULL, NULL, '2024-06-12 11:35:41', 1, '2024-06-12 11:35:41');
INSERT INTO `oms_tao_refund` VALUES (1800472079466184705, '279878906135722964', 'REFUND', 4, 3880414333492726429, 3880414333494726429, 0, NULL, 263.08, 263.08, NULL, NULL, '2024-06-11 13:52:16', '2024-06-11 13:52:17', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 6, 'QM24-M2', '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 13:52:17', '曲美家居防螨抑菌泰国乳胶床垫亲肤绒毛面料双面可用奶茶啵啵床垫', '5423494769324|尺寸:1800mm*2000mm;颜色分类:【预售】牛油果色', 'AAHvHVMUAAJ_dKyzaDW8-M2z', '冰噬爱梦', NULL, '2024-06-11 18:16:10', NULL, NULL, '2024-06-12 11:35:41', 1, '2024-06-12 11:35:41');
INSERT INTO `oms_tao_refund` VALUES (1800472079571042305, '279878906134722964', 'REFUND', 4, 3880414333492726429, 3880414333493726429, 0, NULL, 306.92, 306.92, NULL, NULL, '2024-06-11 13:52:16', '2024-06-11 13:52:17', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 7, 'QM24-M1', '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 13:52:18', '曲美家居可拆洗泰国乳胶席梦思黄麻独立弹簧双面可用多米诺床垫', '5420509836595|尺寸:1800mm*2000mm;颜色分类:【预售】款式B', 'AAHvHVMUAAJ_dKyzaDW8-M2z', '冰噬爱梦', NULL, '2024-06-11 18:16:10', NULL, NULL, '2024-06-12 11:35:41', 1, '2024-06-12 11:35:41');
INSERT INTO `oms_tao_refund` VALUES (1800472079675899905, '279783361592991009', 'REFUND', 4, 3893206141510990910, 3893206141511990910, 3599, NULL, 3839, 240, NULL, NULL, '2024-06-11 10:37:37', '2024-06-11 10:49:47', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 0, NULL, 1, 'QM19-B12-F', '退运费', 'aftersale', NULL, '', NULL, NULL, NULL, '2024-06-11 10:49:47', '曲美家居头层真皮床轻奢现代简约方糖皮床主卧室多功能储物大床', '5070181490182|家具结构:箱框结构;颜色分类:奶油白【进口头层牛皮+升级10cm松木排骨条】;尺寸:1800mm*2000mm', 'AAHqHVMUAAJ_dKyzaDWK8G_G', '柠檬味の小清新', NULL, '2024-06-11 18:16:10', NULL, NULL, NULL, 1, '2024-06-11 18:16:10');
INSERT INTO `oms_tao_refund` VALUES (1800472079776563202, '161242107136097290', 'REFUND', 4, 2164756011432099072, 2164756011433099072, 2573.85, NULL, 2802.85, 229, NULL, NULL, '2024-06-11 10:33:12', '2024-06-11 10:33:14', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 0, NULL, 1, 'QM23-B12', '与商家协商一致退款', 'aftersale', NULL, '', NULL, NULL, NULL, '2024-06-11 10:33:14', '【狂欢价】曲美家居简约实木框架大气现代进口头层牛皮床主卧室床原野床新品', '5149921492104|家具结构:框架结构;颜色分类:（白茶杏+茶咖色）-原野皮床;尺寸:1500mm*2000mm', 'AAEnHVMUAAJ_dKyzaDUxAA6t', 'ksnake1', NULL, '2024-06-11 18:16:10', NULL, NULL, NULL, 1, '2024-06-11 18:16:10');
INSERT INTO `oms_tao_refund` VALUES (1800472079898198017, '279835886642212497', 'REFUND', 4, 3821416742006219724, 3821416742007219724, 16038.3, NULL, 16098.3, 60, NULL, NULL, '2024-06-11 09:53:45', '2024-06-11 09:53:47', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 0, NULL, 1, 'F1-23E-LAB-ZD1*4&F1-23E-LAB-FS1*5', '与商家协商一致退款', 'aftersale', NULL, '', NULL, NULL, NULL, '2024-06-11 09:53:47', '曲美lab墩墩沙发现代简约轻奢风自由模块组合布艺别墅客厅沙发', '5435508414654|适用人数:组合;颜色分类:【4人贵妃躺】灯芯绒-燕麦白', 'AAETHVMUAAJ_dKyzaDUa_gq2', '我爱睡觉觉000', NULL, '2024-06-11 18:16:10', NULL, NULL, NULL, 1, '2024-06-11 18:16:10');
INSERT INTO `oms_tao_refund` VALUES (1800472080011444225, '279777709392212497', 'REFUND', 4, 3821416742009219724, 3821416742010219724, 82.58, NULL, 247.74, 165.16, NULL, NULL, '2024-06-11 09:51:36', '2024-06-11 09:51:38', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 0, NULL, 3, NULL, '与商家协商一致退款', 'aftersale', NULL, '', NULL, NULL, NULL, '2024-06-11 09:51:39', '曲美lab墩墩沙发现代简约模块布艺真皮沙发别墅客厅沙发门店同款', '5268494773110|适用人数:组合;颜色分类:详询客服享优惠~', 'AAETHVMUAAJ_dKyzaDUa_gq2', '我爱睡觉觉000', NULL, '2024-06-11 18:16:10', NULL, NULL, NULL, 1, '2024-06-11 18:16:10');
INSERT INTO `oms_tao_refund` VALUES (1800472080124690434, '279824004278902712', 'REFUND', 4, 3832222068122901227, 3832222068123901227, 702.96, NULL, 845.96, 143, NULL, NULL, '2024-06-11 09:44:42', '2024-06-11 09:44:44', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 0, NULL, 1, 'ZH-PTCD-DS-QM23-M1-12', '与商家协商一致退款', 'aftersale', NULL, '', NULL, NULL, NULL, '2024-06-11 09:44:45', '【家装节价】曲美家居独袋弹簧天然乳胶床垫家用软硬厚床垫保护脊椎舒星床垫', '5195672626945|尺寸:1200mm*2000mm;颜色分类:【升级款】独袋弹簧乳胶床垫', 'AAH_HVMUAAJ_dKyzaDW0Cajf', 'gaoshan19711225', NULL, '2024-06-11 18:16:10', NULL, NULL, NULL, 1, '2024-06-11 18:16:10');
INSERT INTO `oms_tao_refund` VALUES (1800472080221159426, '161299417904619180', 'REFUND', 4, 2160429269476618091, 2160429269479618091, 0, NULL, 4158.04, 4158.04, NULL, NULL, '2024-06-11 08:45:27', '2024-06-11 08:45:28', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 2, 'F1-GRQHT-23E-WQM-D3*2', '不想要了', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 08:45:29', '曲美家居现代简约北欧风实木餐桌椅弯曲木工艺餐厅长方形流光餐桌', '5126575889578|颜色分类:流光餐椅戈尔浅胡桃奶油白*2', 'AAESHVMUAAJ_dKyzaDUmN-8L', 'tb_christy', NULL, '2024-06-11 18:16:10', NULL, NULL, NULL, 1, '2024-06-11 18:16:10');
INSERT INTO `oms_tao_refund` VALUES (1800472080359571457, '161299957703619180', 'REFUND', 4, 2160429269476618091, 2160429269477618091, 0, NULL, 1399.07, 1399.07, NULL, NULL, '2024-06-11 08:45:24', '2024-06-11 08:45:25', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, 'GRQHT-23E-WQM-DT1-1-M', '不想要了', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 08:45:25', '曲美家居现代简约北欧风实木餐桌椅弯曲木工艺餐厅长方形流光餐桌', '5126544969425|颜色分类:流光戈尔浅胡桃色餐桌1.4米（140*85*75）', 'AAESHVMUAAJ_dKyzaDUmN-8L', 'tb_christy', NULL, '2024-06-11 18:16:10', NULL, NULL, NULL, 1, '2024-06-11 18:16:10');
INSERT INTO `oms_tao_refund` VALUES (1800472080443457538, '279835239913753097', 'REFUND', 4, 3926640133734759730, 3926640133735759730, 0, NULL, 5190, 5190, NULL, NULL, '2024-06-11 08:06:36', '2024-06-11 08:07:23', '曲美家具官方旗舰店', NULL, 'CLOSED', 'WAIT_SELLER_SEND_GOODS', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, 'QM23-B1', '地址/电话信息填写错误', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 08:07:24', '【狂欢价】曲美家居北欧简约真皮床轻奢高级温柔风主卧高脚左岸花园皮床新品', '5094700576945|家具结构:框架结构;颜色分类:储物款-浅咖色 进口真皮软床+黑骑士M2黄麻乳胶床垫;尺寸:1500mm*2000mm', 'AAH_HVMUAAJ_dKyzaDU1Zbzu', 'yangrenmincs', NULL, '2024-06-11 18:16:10', NULL, NULL, NULL, 1, '2024-06-11 18:16:10');
INSERT INTO `oms_tao_refund` VALUES (1800733683390795778, '161294808264568656', 'REFUND', 4, 2187649164932565686, 2187649164933565686, 0, NULL, 1021.2, 1021.2, NULL, NULL, '2024-06-11 22:20:26', '2024-06-11 22:20:27', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, 'QM23-M1', '没用/少用优惠', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 22:20:28', '【狂欢价】曲美家居独袋弹簧天然乳胶床垫家用软硬厚床垫保护脊椎舒星床垫', '5431176608029|尺寸:1800mm*2000mm;颜色分类:【升级款】独袋弹簧乳胶床垫', 'AAHJHVMUAAJ_dKyzaDWrA6m3', '闪耀你杨哥', NULL, '2024-06-12 11:35:41', NULL, NULL, NULL, 1, '2024-06-12 11:35:41');
INSERT INTO `oms_tao_refund` VALUES (1800733684028329986, '161294916243568656', 'REFUND', 4, 2186979458733565686, 2186979458734565686, 0, NULL, 1999, 1999, NULL, NULL, '2024-06-11 22:19:49', '2024-06-11 22:19:50', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, 'QM23-B9', '没用/少用优惠', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-11 22:19:50', '【现货速发】现代意式复古头层真皮床黑色欧包高级侘寂风主卧大床', '5175363035184|家具结构:框架结构;颜色分类:曜石黑-【进口全青皮+出口级海绵+全实木加密排骨架】;尺寸:1800mm*2000mm', 'AAHJHVMUAAJ_dKyzaDWrA6m3', '闪耀你杨哥', NULL, '2024-06-12 11:35:41', NULL, NULL, NULL, 1, '2024-06-12 11:35:41');
INSERT INTO `oms_tao_refund` VALUES (1803592736001392642, '281459845837100646', 'REFUND', 4, 3939191497973104606, 3939191497974104606, 0, NULL, 2463.88, 2463.88, NULL, NULL, '2024-06-19 23:52:40', '2024-06-19 23:52:41', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, 'QM23-B1', '订单信息拍错（规格/尺码/颜色等）', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-19 23:52:42', '【狂欢价】曲美北欧简约真皮床婚床次卧床轻奢主卧双人床左岸花园床', '5059915352702|家具结构:框架结构;颜色分类:架子款-奶油白【进口真皮+双层海绵+松木排骨架】;尺寸:1800mm*2000mm', 'AAEGHVMUAAJ_dKyzaDVYZ8vB', '崔丽颖1234', NULL, '2024-06-20 08:56:32', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1803592789910781953, '281525979098970365', 'REFUND', 4, 3935902249371976503, 3935902249372976503, 0, NULL, 1758.52, 1758.52, NULL, NULL, '2024-06-19 22:40:27', '2024-06-19 22:40:28', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, '09zc-lb', '不想要了', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-19 22:40:28', '【狂欢价】曲美家居北欧卧室抽屉柜五斗柜客厅餐厅储物柜收纳柜子09ZC', '4429419976425|颜色分类:深橡色+荷花白色;安装方式:组装', 'AAFSHVMUAAJ_dKyzaDUyRAca', '他喜欢佟湘玉', NULL, '2024-06-20 08:56:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1803592790191800322, '162735674531397885', 'REFUND', 4, 2198879185397398578, 2198879185398398578, 0, NULL, 2400, 2400, NULL, NULL, '2024-06-19 20:37:34', '2024-06-20 08:48:50', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, '2017E-DB1-1', '订单信息拍错（规格/尺码/颜色等）', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-20 08:48:50', '【狂欢价】曲美家居北欧简约风餐边柜多门带抽屉时尚餐厅储物茶水碗橱收纳柜', '4428770372777|颜色分类:深橡色+ 荷花白 餐边柜;门数量:3门', 'AAEZHVMUAAJ_dKyzaDUHCzIa', 'pingan64', NULL, '2024-06-20 08:56:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1803592790548316162, '162720987093138171', 'REFUND', 4, 2195902489725137181, 2195902489726137181, 0, NULL, 2194, 2194, NULL, NULL, '2024-06-19 16:42:43', '2024-06-19 16:42:44', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, 'QM19-B12-F', '订单信息拍错（规格/尺码/颜色等）', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-19 16:42:45', '【狂欢价】曲美家居头层真皮床轻奢现代简约方糖皮床主卧室多功能储物大床', '5070181490181|家具结构:框架结构;颜色分类:奶油白【进口头层牛皮+升级10cm松木排骨条】;尺寸:1800mm*2000mm', 'AAERHVMUAAJ_dKyzaDUeZjac', '安全到家77', NULL, '2024-06-20 08:56:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1803592790909026305, '281402678879871947', 'REFUND', 4, 3892931388966874719, 3892931388967874719, 1430, NULL, 1549, 119, NULL, NULL, '2024-06-19 13:16:28', '2024-06-19 13:16:29', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 0, NULL, 1, 'ZH-PTCD-DS-QM23-M2-18', '与商家协商一致退款', 'aftersale', NULL, '119差价', NULL, NULL, NULL, '2024-06-19 13:16:30', '曲美家居防螨抑菌透气床垫黄麻乳胶独袋弹簧双面可用黑骑士床垫', '5182018783835|尺寸:1800mm*2000mm;颜色分类:【升级款】独袋乳胶黄麻双面床垫', 'AAEYHVMUAAJ_dKyzaDU7f3cs', 'liuhuiyu8238024', NULL, '2024-06-20 08:56:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1803592791215210497, '280870849488854631', 'REFUND_AND_RETURN', 4, 3929000905695853146, 3929000905696853146, 0, NULL, 499, 499, NULL, NULL, '2024-06-17 11:00:47', '2024-06-19 12:52:43', '曲美家具官方旗舰店', NULL, 'CLOSED', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 1, NULL, 1, 'ZH-SF-04-DS-F2-QM23-NT1(L)', '不想要了', 'aftersale', NULL, '', NULL, NULL, NULL, '2024-06-19 12:52:43', '【狂欢价】【现货速发】现代轻奢简约床头柜床边储物柜皮质卧室置物储藏柜', '5187574270691|颜色分类:奥利奥黑-左;安装方式:组装', 'AAG7HVMUAAJ_dKyzaDVDhzaA', '张茹芸66', NULL, '2024-06-20 08:56:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1803592791513006082, '280916964218854631', 'REFUND', 4, 3928944925406853146, 3928944925407853146, 170, NULL, 1999, 1829, NULL, NULL, '2024-06-17 10:56:18', '2024-06-19 09:22:40', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, 'QM23-B9', '不想要了', 'onsale', NULL, '', NULL, NULL, NULL, '2024-06-19 09:22:41', '【狂欢价】【现货速发】现代意式复古头层真皮床黑色欧包高级侘寂风主卧大床', '5175363035184|家具结构:框架结构;颜色分类:曜石黑-【进口全青皮+出口级海绵+全实木加密排骨架】;尺寸:1800mm*2000mm', 'AAG7HVMUAAJ_dKyzaDVDhzaA', '张茹芸66', NULL, '2024-06-20 08:56:45', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_tao_waybill_account
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_waybill_account`;
CREATE TABLE `oms_tao_waybill_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `seller_id` bigint NULL DEFAULT NULL COMMENT '商家ID',
  `cp_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流服务商编码',
  `cp_type` int NULL DEFAULT NULL COMMENT '1是直营，2是加盟',
  `quantity` int NULL DEFAULT NULL COMMENT '可用单数',
  `allocated_quantity` int NULL DEFAULT NULL COMMENT '已用单数',
  `branch_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点ID',
  `branch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点名称',
  `print_quantity` int NULL DEFAULT NULL COMMENT '已经打印的面单总数',
  `cancel_quantity` int NULL DEFAULT NULL COMMENT '取消的面对总数',
  `waybill_address_id` bigint NULL DEFAULT NULL COMMENT 'waybill 地址记录ID(非地址库ID)',
  `province` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称（一级地址）',
  `city` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称（二级地址）',
  `area` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称（三级地址）',
  `address_detail` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `mobile` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货手机号',
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货固定电话',
  `is_show` int NULL DEFAULT NULL COMMENT '是否前台显示1显示0不显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝电子面单账户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_tao_waybill_account
-- ----------------------------
INSERT INTO `oms_tao_waybill_account` VALUES (1, 4, 2200787809358, 'STO', 2, 0, 0, '100591', '北京朝阳区东坝公司', 0, 0, 191112062, '北京', '北京市', '顺义区', '南彩镇坞里村中街68号曲美家居', NULL, NULL, NULL, 1);
INSERT INTO `oms_tao_waybill_account` VALUES (2, 4, 2200787809358, 'YTO', 2, 0, 229, '075724', '广东省佛山市南海区西樵官山分部', 0, 14, 213564083, '广东省', '佛山市', '顺德区', '龙江镇仙塘村委会西区一路8号之一顺德万洋众创园15幢202中铁', NULL, NULL, NULL, 1);
INSERT INTO `oms_tao_waybill_account` VALUES (3, 4, 2200787809358, 'YUNDA', 2, 1, 67, '352289', '江苏南通海门东城公司金盛超市分部', 0, 5, 195470021, '江苏省', '南通市', '海门区', '三星镇金色阳光花苑', NULL, NULL, NULL, 1);
INSERT INTO `oms_tao_waybill_account` VALUES (4, 4, 2200787809358, 'YUNDA', 2, 0, 0, '581795', '河北深泽县服务部', 0, 0, 228182374, '河北省', '石家庄市', '深泽县', '东环路洛曼家具', NULL, NULL, NULL, 1);
INSERT INTO `oms_tao_waybill_account` VALUES (5, 4, 2200787809358, 'HTKY', 2, 0, 108, '3513238', '南通海门绣女路网点', 0, 3, 200644146, '江苏省', '南通市', '海门区', '三星镇家纺城', NULL, NULL, NULL, 1);
INSERT INTO `oms_tao_waybill_account` VALUES (6, 4, 2200787809358, 'POSTB', 1, 0, 144, 'POSTB', NULL, 0, 42, 223634022, '河北省', '石家庄市', '深泽县', '东环路洛曼家具', NULL, NULL, NULL, 1);
INSERT INTO `oms_tao_waybill_account` VALUES (7, 4, 2200787809358, 'CP446881', 2, 999, 1, '660605', '南海区站点', 0, 0, 242872489, '广东省', '佛山市', '南海区', '九江镇九江大道珠银库房A1栋（京东仓）', '启航', '15818590000', '', 1);
INSERT INTO `oms_tao_waybill_account` VALUES (8, 4, 2200787809358, 'CP446881', 2, 19988, 12, '682387', '都江堰市网点', 0, 10, 211952169, '四川省', '成都市', '都江堰市', '四川省成都市都江堰市四川都江堰经济开发区团结路 32响', NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for oms_wei_goods
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_goods`;
CREATE TABLE `oms_wei_goods`  (
  `id` bigint NOT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台商品id',
  `out_product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家编码id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `head_imgs` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主图集合',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一张主图',
  `desc_info` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品详情字符串',
  `attrs` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性字符串',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `edit_status` int NULL DEFAULT NULL COMMENT '编辑状态',
  `min_price` int NULL DEFAULT NULL COMMENT '商品 SKU 最小价格（单位：分）',
  `spu_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `product_type` int NULL DEFAULT NULL COMMENT '商品类型。1: 小店普通自营商品；2: 福袋抽奖商品；3: 直播间闪电购商品。注意: 福袋抽奖、直播间闪电购类型的商品为只读数据，不支持编辑、上架操作，不支持用data_type=2的参数获取。',
  `edit_time` int NULL DEFAULT NULL COMMENT '商品草稿最近一次修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_wei_goods
-- ----------------------------
INSERT INTO `oms_wei_goods` VALUES (1795636754709454849, 2, '10000111645565', '', '2024春季农家燕麦麸皮高纤高蛋白营养 500g/罐', '', '[\"https://mmecimage.cn/p/wx62136b9e9b09930b/HLOZRDqDEXQ_EGmghk51hxJ_PR4KCrYoOPcfH9J5Xg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HPG64VQI8TgYbozanWRE_EpUPK_3IBg1D0SyqyO2YA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HCwlWhJ8Rnf9E9mr0K8rNitszIKsvZYV9SMWeHdd8A\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HK7U3nbCJBxlWg5vS9eomdWq4Ew-qIDh7CGVM4zGEw\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HJdu7_pEwPIPchGaER5LGrjB43N2gEtJJRxVVjJd8A\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HAsXf4yboP7cTb-wiME6A3hDDI_R4IrYzRd8nMNJtA\"]', 'https://mmecimage.cn/p/wx62136b9e9b09930b/HLOZRDqDEXQ_EGmghk51hxJ_PR4KCrYoOPcfH9J5Xg', '{\"imgs\":[\"https://mmecimage.cn/p/wx62136b9e9b09930b/HDY4CjYY82wM9sNVrii4n03NKTFKS5If-1-1pvisZg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HKRQPaKpvRI9mYRs4iRnOrHMmF2MXlpOSXj3-kbAFA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HMnHX5wEVew97BUpgUrT5-uvSmB42J_4d-g2DIsOMw\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HBQ3O7M7mnE04x6Eyc7KfxE3lIBoOOFoMVJBBbgvmQ\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HBhOuGd_LrdCLkoS0i4hhPSQS3ks7lpY3P8TVMFOiA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HH0VjlDP4IZEPdl5iDnN-D_6bE1xdIXghbGFMaknAg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HMrzEqpgmQ5edyWMUWlLl649f8hYgDoJuSEcp-9eQg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HGt0zPl64XfxhN790pd8xXuSJ72RrjzdUswrooBBKg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HG6dKgcealo0SVHHusC5tPdEbjwFImfjJLffJEQ-ag\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HPRo1veYHfEEdEaVYiBjPJLY10mML_9UE_FBjaGFKA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HGA6NerR9cRmXxpL8MU0g1twXepwSXu4JVosXNmmuQ\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HMVGHBLwzFR8qDwKkCJiFV4FTrg9LfmdMvjn-dBC_w\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"麦曲丰\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"山东维美食品有限公司\"},{\"attr_key\":\"配料表\",\"attr_value\":\"燕麦\"},{\"attr_key\":\"保质期\",\"attr_value\":\"240 天\"},{\"attr_key\":\"净含量\",\"attr_value\":\"500 g\"}]', 5, NULL, 9990, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1795636755195994114, 2, '10000114346861', '', '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', '', '[\"https://mmecimage.cn/p/wx62136b9e9b09930b/HBA00xcXpgSCJfACpAwipmecGfNQ5B9F2jH0k9DX-w\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HL_ErqQ-eBozdnUSc9F1S-yHJCW9vjyweeA5TeooDA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HETf8g8Ec8dDl5WP5P_DE-80b2kHRkmjBbjOHuCvHw\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HFtrXLWMPQ0cD50CZyWfjqsF2zyHsg3fA6ssEPTgaA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HMEiYPjqHTlDnMsalOjfXAoMNXaNq76pdt8ce_N1hA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HIjWZ5fNYcdULHZuzdzlHR9YtjUQF98PMgCBwgsZ4A\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HBQ0LHKpiVL_8W7I4L6Ow8-J2jP93FQdCRyuT68-Yg\"]', 'https://mmecimage.cn/p/wx62136b9e9b09930b/HBA00xcXpgSCJfACpAwipmecGfNQ5B9F2jH0k9DX-w', '{\"imgs\":[\"https://mmecimage.cn/p/wx62136b9e9b09930b/HOKY3NswtH3fFEMchWtsny45eCiSDW4H2vmsxjpU8g\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HEqtYcwsXkJpA2cRcCZIKZo0Fh18eiGL1c5NIVwclg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HG5vuxZlj7lSSmQkbA8qrzCg6XMLYjkpjNxMiehmfg\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"安徽意茗堂生物科技有限公司\"},{\"attr_key\":\"配料表\",\"attr_value\":\"苦荞麦\"},{\"attr_key\":\"保质期\",\"attr_value\":\"12 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"250 g\"}]', 5, NULL, 9990, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402950042382337, 2, '10000128621274', '', '云南特产 龙牙百合', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HHAM8R6aAB6AyAhqquS0rL149zk7D65rf_uIsImsxXI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPfwrH5Tlx__JqQQ0hVyEsZc3h8NZkNTfgeAe26LNDE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPgIkadbhwvtBI2A0JSMqHPRWcZdbC5BHBdLxNnvgL8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGGJP4fznGcLxbqTd-JIRiCssmRomyxriKHHtuyRoN4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAekgyfFrk88gUoxQprX0jPTbz55v5GHwLAmk47Aso8\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HHAM8R6aAB6AyAhqquS0rL149zk7D65rf_uIsImsxXI', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HPPapQCA69xpK7GoF6slqyE-PTg9zJXYPoL1ODMZieY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBAK9tBSL0y6mUDBPbh6cupr1wFOXGz7l1S5Mh5dBjo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJHFdRR1opFBVxoLPCw3qi145YXS3SG3A8Hk1vLoGaE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLCYlyWRoyTbxbPZM_C_RQamx-aaajDxMc9ZN_1Sq84\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPZY1bVm8T6EIoKaYzXSYKuZj9qJMsccLarCdVdJA7E\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"12 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"30 g\"}]', 5, NULL, 680, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402950138851329, 2, '10000022645693', '', '湖北特产湘之忆农家风干鸡500g腊鸡腊肉咸鸡散养土鸡整只', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HKKKrojCv73Z-JQ3U0pAs8P9XREXZLk_Cd2i_CPlbQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOcezUA8SDo0LpN4YxZq1HhaABQQLYejlW1OfZfFOQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJWZ_HQmW8GRqzErD745KzindZxdOrEaK20aFYFL7A\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCtPyUy7dSA-H9wZ-haifDfeIQ699UDXE5yLo1IeIg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOFO1tziSlhGDn5F86syjNDeR2pafZpqqC5ymV2i4w\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HFyip0z62hVGhPHS59awtreMIdpNdvuh0_-UGRsP3Q\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAJ4B8UdEi38Dt2lP70D-jRiiIwd_UeYPIRmqjdiLQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKFbV3_BLCBS4GGMRPqYYGrrzVCVt4qqWbj7aHwz5A\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKJfewxesbezzzMhqdVYzEj1C1ZTThoQu7RZJed3XA\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HKKKrojCv73Z-JQ3U0pAs8P9XREXZLk_Cd2i_CPlbQ', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HDnPp38gFMMHlc_S5ZIR_-OOM8oamiT88hO3joCFNg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIy6EuZiEbYrCZ8M2aOsLxBEZAk2ZYnwJOTb-16LAA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HByNMJifcLiLRqQrZBaYOLbxR3FoM69HpyoKNbPLqg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HITx7k64qx4iTV-iWRYCpqownbzwZCltZ11g1cqp5g\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAs_ASezAQHoM7XjCHz0VD_MtpDm1ZL4VrOmUj1ikQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HMF3ccl4louDidn0Gv0QqmAVq_YwJEe5ZsvIVXLVqQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HA6Wr3Bpt9Tqi_j0R334xRS3fJYvMRnZUwzKit8BDw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HMxSYJ0BpxSe9ydk2wnipSXfYWoJp7GXYiS7_I4RAQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HP1I2AYvW3FneaHnpcuKGbR9y43avuzK8A6u7rCAPg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPGP2ANGCEB3-cDY1vuJj-4d-oLGhRheCUIM_4jBMg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOOoQsq1Lno2-i6F3VFgTsudHLLHefpAzQVc5Zi3ZA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBkGzdEBYnl2DPtMgZG7ZTGVgqK370k65VT5V_Q3mg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJk5jlsC16mZr-ohQTNjcCcyNe8T73qxqBt7w_K2qg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIcTIIQphuSnmZsmuSraE40DRMONYYaB8zd6mSlUDQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HA0yhhIS1Hkq65Tbrwm6451QEw71XeDZwHnzF9skrg\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"湘之忆\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"武汉湘之忆食品有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"配料表\",\"attr_value\":\"土鸡\"},{\"attr_key\":\"保质期（天/月/年）\",\"attr_value\":\"1年\"},{\"attr_key\":\"单个商品重量（g）\",\"attr_value\":\"500g\"}]', 5, NULL, 5290, '风干鸡', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402950247903234, 2, '10000068427840', '', '肚包肉内蒙古羊肚包羊肉肠1斤/2斤', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HK2gcdUuMRiHZUEU7-ZdYNUJhFLlyTcTFRHa45FTRBs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEPJHxL-9TSABbAgH3D2liNyiwsyG95LIs1Ecw_cHmE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNJgcQnoPVXZGLrM8DvA8QUyaec5eY1vW-ahiUKUT3E\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDiO7yOb-T0F8xo1ZJ0Np1exGP-dCAoEnSJazV-3bQ0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLyQ4PosNpYcAJQU0f0qBOoWW4clSAs2B1N0O-jlr-o\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPz2owRw2eokzeF8DLgZ_VOr-jMRtBekKzjFK4LFfXc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HH-XNbhcZgiOjQBa4nIb8McyVTBghwl-CZToYHceLqQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJi_1GRhaGvmDANSo_-JoUldMVh9gY-IJiiPJXbzqz0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGX5AVvnv_H0Q6DM9KfeEIhfsTq-wZ77G9KJrywx2cE\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HK2gcdUuMRiHZUEU7-ZdYNUJhFLlyTcTFRHa45FTRBs', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HILL46-kI8_gIbFUoXhYTUtoLF5JioG_cgsYvZoPD7o\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HN46_Dn4s2-twF-RpwUpvzx5PwfQMK6YnBuIwipDLQU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJGS0mezZg38n_tZLr0Lz835Ympf8aTPSo1UbFaNvTs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HN7246T3YsPpZQ9W9D4AckZBLSooIOmR1Raq28c98xY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HA5iD6wiQo40BaCFgeF15UVG-uAXVa_laiKd1l-mkKQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHMd3SrKR-eApFB4E-ajtCmeuYwq5U8csm42KjZYngU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HFocUD5nvu9q52LQaRCM-Nc2HdS1dUaS9z66D1Yb198\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDcB3iRQ2ZOWraClq91yXtdjFO2quD6-TbcaQgSV44I\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOQ7u6bXmfV8UA_QPOGT48lD9n5rb2zCkhGLnD9sOEM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HF2b14cKE6gMvXoVQQrDJvSO2D4nAkOeSf3WXDoFhwc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDremk7n62W2Sn38MRye7SWZeSEL_8W9E6_CZUIK5Vs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HG9Kr7mjZisB88Kxx0IKTQ2gcllLBAtf95dfjhc2PXc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HMlmos53-b2E8adS88D8oBZhXpdljo6cjqCFM7EtxIg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKLK0zQEPMpSH4kPLe6qdFNBlh75jdw6LC3TwDfbipo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HFZxx3ChjOxnBkqpHVZtW6xQASgw6KTAYSztuphwVOg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGZfEFoIvjCeL7QMR7t4KRUeRG9I3NUMbOxgfbLmhm8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPAEUqLrQULfPHjrbrKkF6a5smde43Kl0jgw0brg5JI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHZH-xIIcbJwVlIeAQPGhwO8N-rx0MH6b-Vj8KC7Czk\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIWfwG7SvlWMzcPC3qyXJLowRu3SYmGAus4zrYl9wVI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HFJ4C9dPKZ0zOZYeDZ1WgwJuk_FCySkP2N9K36SZ-aI\"],\"desc\":\"顺丰肚包肉内蒙古羊肚包羊肉肠羊肚包脑网红肚包肉羊肉肠饭店\"}', '[{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"生鲜运营条件\",\"attr_value\":\"冷冻（-18°C）\"},{\"attr_key\":\"肉部位\",\"attr_value\":\"羊肉\"},{\"attr_key\":\"产地\",\"attr_value\":\"内蒙古\"},{\"attr_key\":\"国产/进口\",\"attr_value\":\"国产\"},{\"attr_key\":\"储存条件\",\"attr_value\":\"冷冻（0°C以下）\"}]', 5, NULL, 8900, '220857274171', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402950411481090, 2, '10000068453656', '', '2024年农家小麦胚芽 高纤高蛋白营养 500g/罐', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HFE3FFCf-54PpMUegnI1gg74A8NtIT9ClKb7H62IzbY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKQTnVJrE-gIq7w-AkUdJZKU7biwPH7XoJ8hMaTtGpU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDsQ3KTJO-QP_jUYLh7T31zKasFQ1XFya6qxKaIAdYs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIDGAwkWnrvP7EVTkCFiuMYIQFiy_dxA55Dn9fOlvvw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNqQfQu5Wb5Uz075-g03JdNdgDYhzt64XDl--G-KUJo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNnR7O2LqL0_CznU0MWfQCWf5y6SZWabOIB9eRN5RyI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HA77IwMV736nFc2ZXhxaEumf30rFmkLf9ZnmaPIjTLs\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HFE3FFCf-54PpMUegnI1gg74A8NtIT9ClKb7H62IzbY', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HCztTaLE7G2J8zRLIXe8ERn61t1uc3NvoKi7npoYn7M\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HC1QGBlwO76mSNUtBoC8JL9aAXQbDFiN39NQgBntbNA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOYTNW2-tFk_QL4sTV1qNDPJ_pqu57yZEJb7BFmc4jk\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHndE0cwRQ5mhdLLRPmf-67lsLCzXr2mWQq41pfdjZI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJ0T57HKpcc71MS4unHEAJMjJJnnIiXHFXaKNcxKjmw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOpVik26ubJrq25P2dQYsEXEPPdQny-17Fdo7lvAb6Q\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJtyzhNluJLt7iajFCf8rDfYadvkUlU8WEhIp15COuI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HC-QDws6GC8Fz2xdwy9SM7xUKYEKzWc7qT7FMUxhaxI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLJwezNBxNePLBVRu240aT-jf3WMOhp4X3AMBHosunA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJJmKTrLnSyHRLj2Pj5y6lxdgSxvQH7RJ0bm17uH7ac\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HP4eFZma4CLBAU96Wp2bfD2QjSCc2RN475qdguR73zE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HFo9gQIpBKAsmStmTCFqCn1Qof2FJBvbOY1xgFBa_zM\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无品牌\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"河南皓一泽食品有限公司\"},{\"attr_key\":\"配料表\",\"attr_value\":\"小麦胚芽\"},{\"attr_key\":\"保质期\",\"attr_value\":\"12 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"500 g\"}]', 5, NULL, 9900, '10000063139436', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402950478589953, 2, '10000088963322', '', '气质妈妈装显瘦裙大码阔太太洋气中老年女装夏季新款中长款连衣裙', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HFytFb3lYLhAi1s2MJrXoar8wkx3KlcDck1e3Ushe6k\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBd08UxHD8CLsuiZGnQDaaLWBIOM4M08qjRNOjtBq-Y\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKxEFLmV94NYWS-Ekk93SBroOKVV3rlMXsHuAYbWVKw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HH22j610dWenIdpChPk2Aue88MmPd7Pt6KX9qOzd_3I\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGnPZIEizgY0kKezb4_MC3xW6FgMLmHRW5HNHkfUyYA\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HFytFb3lYLhAi1s2MJrXoar8wkx3KlcDck1e3Ushe6k', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HPBGs4tR7pxsiiK7H_X5WdbZjDAxwrOlJVKsGTAnook\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPVzXrWDTmy2HGlUJqYiztjnFXGIHigybVFb2ZBXkQQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEKyMk95Vh4HdiEcsoXjP2OYV0ZK85QYk1D4ktHSWi8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HK_xwpdSZKTYthbvhww5gZ_OEETZfGq3ZRXL98RGGuA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HB3-mZlY_5QabA70EOf9eVkTloWhMRcBMkl9Ok-zLHo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLU3pbfZKHwDaVCoz_t7eduLfzc-x_LTdoIqOgVDvLc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAyzp-l6SBYBxqku9BPrNf0AkrFb3R7N44uqoEEcDiQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HM9lFNuxSwcvW8Y8J4QYiG2ygIp-LApKNcLtoycqdic\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBR4ClA8iH2kaudgqWTsJnAtXXn9gwCfK4IwAhrOFHM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HI5s6tkCuu-553QKkh2ityzCztDGdofsnMJgrl8LTlY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIOPhP3PqvtUx6-WsfgvKnfhluISlqQGge22261ZMCg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDjaFXumO5o53DtavkyWlajRzpM_KP2yhwWKI6p3eIc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HFDQGRo-Nmfq75NkMLPcWloQoMnaAOvXYLZCvFKzv4E\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HF8aXadcftYh6nB4-PxfxQ6HgecRorYcle8AXFuXL-I\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPD1aEYldG2nG8Uz-Szx_pQTCjuTUMniUdxtQMWsJt8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HD7XnCETOhSZ3zh6BOuz3iLaNMRFJUKuwgel35GHIIw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIg6FPmgaEzvRYr5EXAOL_D1Y1NaeYi9dEJ9z1XZMGk\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJ1_R8gfZM03WgQ2QLaHeymb1I85UOb2-pRBVw1bcyI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIZV3XeUEl89y4oAeA4Xtw_EZwsS70XwBXHP9KrCuNw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHFZPeiO7vPpEE7Bv6w-msVTPe2uHGUYsKecGrTA2xE\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无品牌\"},{\"attr_key\":\"面料材质\",\"attr_value\":\"丙纶\"},{\"attr_key\":\"风格\",\"attr_value\":\"中东风\"},{\"attr_key\":\"袖长\",\"attr_value\":\"短袖\"},{\"attr_key\":\"裙长\",\"attr_value\":\"中长裙\"},{\"attr_key\":\"裙型\",\"attr_value\":\"铅笔裙\"},{\"attr_key\":\"款式\",\"attr_value\":\"圆领\"},{\"attr_key\":\"面料材质成分含量\",\"attr_value\":\"50%\"},{\"attr_key\":\"颜色\",\"attr_value\":\"紫色\"},{\"attr_key\":\"安全等级\",\"attr_value\":\"A类\"}]', 5, NULL, 28320, 'FMNFSYE9317-1', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402950558281730, 2, '10000093570949', '', '农家自然晾晒泡水煮茶解酒葛根切片现切500/1000g袋装', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HH88r1ZWDHg09Z6gJ8Z467iPy_sO2TLjFdKCbNn7-gc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HB8xFls1cY4j9wvDV_hi0aRPjB6hW9rb8Bk_78H49-E\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HN8ha2ShElg2fR4JwzNPZprOp-eocIgfHFGytu1hYxM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDmzE_NFEPk1VXgLb0IqldeQdM5SOMR-tzYJu2O85Ko\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HH88r1ZWDHg09Z6gJ8Z467iPy_sO2TLjFdKCbNn7-gc', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HPT8EtOPJa2Vw5ZXRinvTMGh9WahfSaW5Lmi-ybg-DY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOQR1lhkt9fBqM-lSjECC3iZ7Y4zQYJkJAJg8WiKkoE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIAS7v3Znkgems1mH00GZ5qWqZcI-IaWojgwkjVUdXA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGIICe_z30Y-1AyQ9XqDwehuvl06V8q3AT6_f919YZE\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无品牌\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳市望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期（天/月/年）\",\"attr_value\":\"一年\"}]', 5, NULL, 1990, 'E', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402950667333633, 2, '10000093951688', '', '冬季煮水泡水专用葛根煲汤解酒500/1000g袋装', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HHIYspvf7HAuDpXnYfxioBPe-8pRKx6U7ZgMOp7e13M\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCEhfMUKVPWhZANM9FRTZA8SlxqMv4pxRrfq_HDyD-E\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGUoC2x-2HNxY3a0z05TksMLznf0HamxHLsIA7qRwck\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HElAKtYfdrpKxpEFVCf5vwA0utdrJmjKu8e0XBsAVGw\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HHIYspvf7HAuDpXnYfxioBPe-8pRKx6U7ZgMOp7e13M', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HCkRBDkZWBoIM3DcJDm-l2j4o89xNArD669R0VqfIrI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKuoTDL7DCUbEZzglGHubd3OY_oHlFWCWltxDHu4WX4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLS1Szd-Ukjqj7AFU8KP-7xMsjmCliCNGYpYWPlRooQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HMTlnw87Pcnt4LpUfPapG6G1j9B1fEDFtWwft17L4z8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIbgu8QEkj0hAAoCMlEiwe5Lcflj7pskUeLFYAnvsKk\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无品牌\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳市望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期（天/月/年）\",\"attr_value\":\"一年\"}]', 5, NULL, 1990, 'E', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402950784774146, 2, '10000128621091', '', '（拍一发五）云南山货 羊肚菌 食用新干货煲汤炖汤营养美味菌菇肉质厚实20克', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HEh8a6bK3-Mh_OOXU0i4uRooZ4mFYRMiApZVEl81wUs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HABMt4HFOdPC7zId8vBXFljyi5AgagELR4VioIP5y-c\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLyP7FH2a0qG_7a3dSQ45vuFKTp2_6riWLun3PWeNRU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBVHB6kBThnnBMpHjxa5r8vzWwcZxkj9zTGcJ_m1Afc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HERDmXhZ5o6KamFGSXbYkFjqdv3_h-ElPIGjF0A-NQE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDr4RFE_svDkp1Iunu8XpKrCXE7SnVxarZYO937qLf4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOoyMiR8I9JGR6I0L34CbzgCXetH5gqEI6pHba-JQ5Y\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HEh8a6bK3-Mh_OOXU0i4uRooZ4mFYRMiApZVEl81wUs', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HNDpbi-rli9ULpG8ww1cEE4T2wbU0V2d9EaXEvRIzXw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLI7nET-Fr6UUXsjhNdVyjIbw772RFjJKXWDwpNJzoA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBO_LNWJ4Eaey8Rts88YDYFnBbhAxbUZCZ48I1prUaM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAWxI4z5E5PpxT_TdsnQ2w2lp19d5Y3OFgCF_9xdoGc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJ9ikKQ2Kw9tiJRQxTF8mhZNbALD0hWzaDA2oFx1gZU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJXObJxraScNqatna-Qd8gRLA38DEROQOzEl47y-HSo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNWGn1z7jV8Q-lcO8r724w-HOIQUUWRxexK1mC88B1Y\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"产地\",\"attr_value\":\"云南\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"365 年\"},{\"attr_key\":\"净含量\",\"attr_value\":\"100 g\"}]', 5, NULL, 16800, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402950851883009, 2, '10000128735759', '', '云南深山牛樟  灵芝500克每袋泡水煲汤', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HPvwwo2Z7lmYNR1Lqy2WYHspA0XvE45RurGI9x78brY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEu1H1PVB9K64SLuzsO3EgzjGh_7HEegdpjcjr9wMOo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAtnB1BGS_z6uloQ4qJrlO361PLPKHE53GUqkGQKJmc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEZnvRK7WzkrYKxbvExn9TbNCbGxGBfdnU_sxr1yCj4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDPh3jAQQKc7Ze0Uw_YH99BhrhAPpeO4yDRpFafKSGQ\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HPvwwo2Z7lmYNR1Lqy2WYHspA0XvE45RurGI9x78brY', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HL0z5R2hmCMyf7_-VMvM3wq2FX0TbNpvo8TiACT3O6A\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HODx4VnUshV2F87RIq-i55XgQwQMqlHdVY1ESkoQPt0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPI6V6mlwEDUfibqX0nKtaHegyJ6Y_W5rZlj9hUgT6s\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKCU9Tc6aGHOSZb9f-3NSNYMy34ceAN61u2qDNpM2wg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HFAIAdC2-CqmvQV5Ka_BFOepmqfXiZhRyL9IsWxePVs\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"产地\",\"attr_value\":\"云南\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"720 天\"},{\"attr_key\":\"净含量\",\"attr_value\":\"500 g\"}]', 5, NULL, 6800, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402950927380482, 2, '10000128717048', '', '云南山货 乌蒙山茯苓块 250克/500克', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HB-WAMH7bZXfBBlgROvcsonjAQbOt_mCSxr5WXgMwYI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNJPx3YTu7iiAwIoFGEIy7311EG8D3Le_SXbv0gYpU4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAc21KiCrEsuNdSTFdaHPN1OvMnal2eNSjI-xy2quYQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDAo0RV7_HCHQ-RJItg_eOneEWD8oj8tXkPNnu8A-sY\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HB-WAMH7bZXfBBlgROvcsonjAQbOt_mCSxr5WXgMwYI', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HFtrGUp4CPPi7-PjuQhjlxb_zOT58O_GRvb7GiZp_4Q\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAOxjN9KfX8z0JRY2h6gcj7PqMZMp3IDvoNvS-H6NvA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEf6eYypopr5bFtgb9ENBMugOrJsILQhNESHoHkeMlg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCLDkMf3F68zs8r__KpbLeFgXQjLJIzPrcTRzuMJJjY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEl2m2fs_Vjv6ndPh3usXAO7qaMI25uuGau2zs2IOCE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HG9QBaPkKXJtsu9DyiPC-PD2t3-zW00mqSiNJgunat0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HO20kAG0aLm6YDRUOabtW4OBwvkpAW9gPXR_-2X1aHw\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"365 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"250 g\"}]', 5, NULL, 2300, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402950998683649, 2, '10000128678989', '', '云南特产山货 金丝皇菊 花茶100克/袋', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HBtV6EGoeFG6ojSGxZ8Juqi9KJkRk2i00udQlhduQZM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIxhLmHe42lIuDktAzqXXgAzUMkogcdQLjKASoOCQew\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HC_Rnk8S8kFa2JFsSCWt7qMeg0QVA3Fv1E3uXWdIr00\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HODGeHRnEaEinVhYqkYA-eo1dSCVTtR9HRe2bz_r1yI\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HBtV6EGoeFG6ojSGxZ8Juqi9KJkRk2i00udQlhduQZM', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HK2m3jw8IQDIA2WJ1r1kx8mJxD_RIF8ft7tbwz8NBkY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HA4XcDL06bBB3D0AfNwML-UcVmC8fof14_X29FPXRfw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HG9GB45Lq2ZeUbDm71w2fjgkCnjvmsUr_FhXGwLhkUc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGqPUDcNDU17IEAL6sxplaJVNYOI6YYj1oxJ8xo_ETY\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"产地\",\"attr_value\":\"云南\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"净含量\",\"attr_value\":\"500 g\"},{\"attr_key\":\"配料表\",\"attr_value\":\"金丝皇菊\"},{\"attr_key\":\"茶种类\",\"attr_value\":\"菊花茶\"},{\"attr_key\":\"保质期\",\"attr_value\":\"12 月\"}]', 5, NULL, 1990, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951069986818, 2, '10000128665468', '', '1.8大片，正宗长白山红参片 煲汤泡酒厚切大片', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HNQjoX75styiRbjtf8wZWfTo1apemrThdO7bPndsJXo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HELrq-ljoe9xdNEUcZiAt3mN_NL9Rjqr1lkotPn7wYo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNf6jCY1ASsLZb-siu1xW7SmPWTn4tlr1tc0O_wnv1w\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOvn3yGusnpGjhcFTjbPc9BtJ0B1WMqCM65jKDfY91s\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPRp02JLmcMoAPyMibFLbiIOPCMRjbozoxUwywgQjlA\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HNQjoX75styiRbjtf8wZWfTo1apemrThdO7bPndsJXo', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HAfr1CK0j4lM1tJY7DR0bgV2TzWtaNA5za8y6P9AWZA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKcAWPbmwnOs-vAF07xHqD2uWOe6j8mEd67Yctwxzi8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHBi8MUFPkzEApqEZogn61fXsqQOp7BL0CD1fE72HiY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHjQKYa2KgdCJyY6k96Da0jX1mejcJqE7fPBWArbeRo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEoYqkgok9UqHBp6unCCz-j9UjMpKR2m8SxFCFm6jCE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEVp_6UNFudjkq4uDdu6ijWRZkrNGWuqy4Wah6HdC9E\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"聚善缘山货行\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"12 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"30 g\"}]', 5, NULL, 990, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951145484289, 2, '10000128726399', '', '干草片250克/袋', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HEPOREBb_H_1N7BgGqQQ9h3XmKlPsJRjR5fDq7bTfC4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBbF9cjtloIY9vpcC_vcQtx2T2weklMFXZNQpz5uXXQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKRwIHtJzJzdQ5KI70OAI0y41GiTXmyRzI7DD6FrvRs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEmQ7efblt1_eO6Z7t_30Rai_gdTAfpockqgGYWHqdk\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPagVifi4itE9ZKNqhmuxJHN6FKS1y3JCypdPSsRAB4\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HEPOREBb_H_1N7BgGqQQ9h3XmKlPsJRjR5fDq7bTfC4', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HCJLc7Dvi-nn8FtZKyv8J5oZIsbg6LnOQo7jCXvKKGQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEYUS0AoTf99wptJPmnK9mMFwhj9ZKNNmJfsBxmJGTI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDhdjR9Nz6cr5fTygyVnmWIft0H4zZHmIFpdoc6N80U\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HMvpg5FnET8GyK8koWmZ5RobdEcRv0Zli7eX92wxDQw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBVBB8aI6mkKPecD3qdNkCHkHOYR7JuWdyUoAwmDHo0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAJJPrWZAB2_KtTEZwCuqXxtEt5VcMpeyCz5gbebvjA\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"365 天\"},{\"attr_key\":\"净含量\",\"attr_value\":\"50 g\"}]', 5, NULL, 2680, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951216787458, 2, '10000128693506', '', '长白山西洋参片 泡水泡酒炖汤1.4CM', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HOS8YVVaZsadA7MSkrVLadqCNG90gyS0EL1Ogu-mF-8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHSUCBO7SGo1N94r0qKCs9kQSnupIs6zfX1aPyYiZ-Y\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKQK4owxFiXvheutXGaRoTQ0Pe4w3Ap6gltb2QU66EQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HL9bWkBtiKbNhd4xXCY_LKMv2-jJj3D9xh-ekEwXgv8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HE7KByD4un-Ua8EeZv_T2WS3Gwww_Yc1jZYljTnAIK0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HN1DMaQ8imO63gRbEaY26lBdc5ClJO82Beebf2faEgM\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HOS8YVVaZsadA7MSkrVLadqCNG90gyS0EL1Ogu-mF-8', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HJkYg27eFyJW0wkm1x3UQMG7z2xzB07rTnLiTI8SOTo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HF_R1H9tbrAmz_h549PunUgD01tp7wO0suhVBOQRdbM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAcLGELRuSB-RYBV5ofikR9qUhNCjzkKENNef7nI0qA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCr7N4C59qISkeG09qFFRAffaCu_wFWnpuk7VpK-P5s\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPbIeDWWboFQVta-B1uDyjC2B5ieQWpk-Ow8Ah90m6w\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HN3G4YORjRvKy5O_iLJh2cKd-IKH_j8RDBddJTLEgqA\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"产地\",\"attr_value\":\"长白山\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"2 年\"},{\"attr_key\":\"净含量\",\"attr_value\":\"500 g\"},{\"attr_key\":\"人参形状\",\"attr_value\":\"片状\"},{\"attr_key\":\"参种类\",\"attr_value\":\"西洋参\"},{\"attr_key\":\"年限\",\"attr_value\":\"3 年\"}]', 5, NULL, 4900, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951283896321, 2, '10000129131746', '', '吉林长白山 灵芝袍子粉超细粉 250克/罐家庭装', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HCwgAXIH66hoXLM3LHTB3Yci5Gv8eCzbC9KUB2Wj6pM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPxWKZ18hdiV6bxjBKsPd56AGLZR06Kebn3wk1kh54c\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOxp-M4jC9p80nW_MHuTgmMXM7I7dLWo5BlAwJwuk6s\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HM7m8tMOOcwuQYcWOR9M0i7BACK-5wGVvsc0SMrvhKo\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HCwgAXIH66hoXLM3LHTB3Yci5Gv8eCzbC9KUB2Wj6pM', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HM7mKWA5CZdc22RT-UNyhWDQPo99eTtJbZAtWM1Hhpg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAOfDjsQULoFG7p5JEoxrawDh5ZXWDrpRhp4LJzFQf0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HC2VZEn3MerbOb39CzUy-KGCY0yc-hVkrY5c49DDfC8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HMDUKolTkh-15HSOjA6EVPQAqlKoB0aSz8hwCbCCF9Y\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"吉林冠农食用菌科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"2 年\"},{\"attr_key\":\"净含量\",\"attr_value\":\"250 g\"},{\"attr_key\":\"产地\",\"attr_value\":\"长白山\"}]', 5, NULL, 31800, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951355199489, 2, '10000131202826', '', '红枣片正宗新疆红枣干片无核免洗50g/袋', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HNVcxmj1Ph12mjr1jYPH6yenW4eHwGNk7VVyIBzKnN8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLjYPsm_tiWyyoadvCAbZObhmNP1ql23E3Zg268Ad6c\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCDQ2eZk7l1Ta-2T_WN0el52OwOtHBzWFGvc3mQ2WMY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGQ86_SGoPzftzEearrh3lm9OoCXJKpkQm3uBXsiaUk\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HNVcxmj1Ph12mjr1jYPH6yenW4eHwGNk7VVyIBzKnN8', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HM4S5fNi_H0iMo_Trb3bLYLeQgxHHAZJ__1Fmi1wyis\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJHM2FIF7DXvM_PsEM4IVHrQX-8X3BBS1ZCmylJ46hQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEHjWc-xtKyQruyVQxcMdZKt51HL8fRq-muLmQ2sJNI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNgglj70V4O8BGaJyp6k0mA4zjGYwWbocTYo-UjZCqk\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJhWVTg11FS1Z-J5jw4TqmXrb0SXMS-AgSA32uZLKlg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJHtJXde9ydsJ3HgPTLpNUDuZM1-bOLhJcEI7TOUXTw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBlWh4YxFOJRO1znx0A0njszA9MPsBL2rrIgMT3VgMQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBX0TxfqZd3j6_l30U10r_JieYuHT2FxgNwTf0Vsznk\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HMbgfS74TOD-9kIiT6r086eXvpd4gKM8Pox2_EfcmGY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HC9hb6WKrE5Ideae5w-t1LKf2Amob3s6qId00_OXHZE\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"24 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"50 g\"}]', 5, NULL, 10, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951397142529, 2, '10000131183510', '', '正宗新疆红枣干果泡水泡茶煮粥煲汤零食50g/袋', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HCFYyfDYH1-c87ERO81fdQLvXFV9zCaVBxpTGKlpvZA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HD1_087uvxcp8C7nWNFb3Ulqh9q1HRGafSZH6eSKYHw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGuaajnzhZjO7fcUGXbrERGwNrVIPhKehOW1xi1liZ4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNtYYjAhfIsYJiEsCxW6PPY6LFTYhAVH8ZYvZF6cDNA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHg-l4MizN6NMYFS8UDblE67cSx5BJyUDYQ9b8Xgs2s\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HCFYyfDYH1-c87ERO81fdQLvXFV9zCaVBxpTGKlpvZA', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HIiDWarWqtOWWdLIoJVNQwzXGMRHwKOLAxABkIhz8lM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCF9P2fpWBWbdZvfbaGVMHxWxYckvW2lsHmUN7cO5fQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEa79R0PKCEVxtnWbzMfFcYo7qPn0Xx0bVb-bzE8k7o\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HN3v9eNgAyBl6OFhtChmcr2iQvyDQPgTRsM074Lm0ew\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEpeB38Fi3z16W_qi6JvcuO88P2njsKMa6TKV_56v5M\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAvWDxQ9dTJhB0_DXRTh3GpeDfxa5IpB_gk-L1z6CFQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJdUpZcAcLtCl3_QxLhiH6yn9WX_I2xwcbjmQS6KSGQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBY8m6cHddch-Qs_-m1NFZXAC_D2_dN3BnfZQmoZdL4\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"12 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"50 g\"}]', 5, NULL, 100, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951451668482, 2, '10000131195179', '', '新货莆田桂圆干龙眼干核小肉厚 非无核桂圆50g/袋', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HByk5IDc3USkVXDEpLbVtHGyTP18m_E4UINrS0IluAI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJaKmR1rzbpl41Y89Tkr-Loj4VvL51zOq2cVtPtuCDs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJh0oT74rSVMTJ1ubJgUDxuqb9LUwQc2WCgsOFsN-Ok\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HD1Z6eG_ITTA2H72yMjngwL1A2xny4kH0hBW0jmhzn4\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HByk5IDc3USkVXDEpLbVtHGyTP18m_E4UINrS0IluAI', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HK-t2ctK5sIZvTIV_61SU4A4ehNGa0Eb_nvLps_BAAw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPuHqtpq85yCBNYQJl5fAySnVjSxhjdSXWVPgmc5nmE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKu_qSOvSsBtMMeNpaT_YYSy7nnAJGmzH9ViP4x9a1E\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEXTuwi2cq4e9wLydKcLa0L_UZeH-B4pOXGqgDg-Jxg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNUlYbaWoKy0XAs5dGKN-EZbEqFFKosdPlsuspA4WE8\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"12 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"50 g\"}]', 5, NULL, 100, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951506194434, 2, '10000128752685', '', '乾佑 雪梨片', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HFSDYimsHfqsNo3BcpZTrggc7SzQFuGL4XqGqjHNBuc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDTWam-QfdAwmP7ggJDSj4l6poM0R8WgBZmthVMF1FI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HC8h0BSRPw-EUMB_WPZjnN7DNLE5SZW2SetvmOB_n70\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HI2Nt7U5jvDCqH4Y3n1UwxEYnhqUuJlBPtCeMEo1Cs8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HE9ojpJlT6OkWkEI1g5XGR6ackpCylczg63MbbhzJEM\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HFSDYimsHfqsNo3BcpZTrggc7SzQFuGL4XqGqjHNBuc', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HFgVSvTPVtp6ZxMCEdsMa9tV7pDY1JPc4GUQVRTL0Ek\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HI8hGkrT2XRAP-l4DFFpnboE5PsK7X6LJeZSvSZiE44\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HClDSxc6heo5fd9VyV96IqZA8wvAWnqebt_r0lZLujE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGxyDN6cj8pTXl-FXABLpyz0EHz16lKp6L_pWnE5LiA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAbj7NEohjplZFMmgsX3eGgAOQ98uOws9EaZDXFbbVk\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"365 天\"},{\"attr_key\":\"净含量\",\"attr_value\":\"250 g\"},{\"attr_key\":\"产地\",\"attr_value\":\"云南\"}]', 5, NULL, 100, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951560720386, 2, '10000128693777', '', '无沙 桑葚  50克/袋', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HJXXDaPsnSmJdj5l8eVH8e15gvsSi0p0A6iUbUygAKU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGEr--MDltW6_Kgklm3_T468h37EzJj6jsH60N5zMvA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAc3xWkJZBCFZ-Lj5mv0mm4SJq3U54ul9dpvodKR42E\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKOEZuZahCLiQJq66qRwlF4HTlqtI1_Wk6-T_78yLJg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJ9pHLyEOQCdiYyfhHF49Jgpd8oAi1cTMY2lNSyNBRQ\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HJXXDaPsnSmJdj5l8eVH8e15gvsSi0p0A6iUbUygAKU', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HHDDH3xbMpQGYcmRynUoX_etq__uH4Huk_ZFNb6fvRs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNmnYeEK3qNzfHZeml6HDb6B5dqZfamtjUpooTaq8AA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCx2JdvXhC6rRWDs9KSVh0mNAIeb2rPdf6PS4DHCr8w\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHT52m32MoEyx3vV7iJgj6Gnw0pJwWK7LfLnPOYzROQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPPnDKMwyqCDcBKQsEIf80omD7BH0Y2stAzr82faryk\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"乾佑易真商贸商行\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"365 天\"}]', 5, NULL, 100, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951606857729, 2, '10000128655039', '', '云南山货 牛蒡根 净重100克/袋', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HLkMs8Z3QXfIVeYT2A8LSm_aD3Z2mRswo54-d1FD5OM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HFMbp0QseqwQr6PGybRYRvmkSE5D6hFY5zZjonjJruM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HMzHWodjoraLbgKTvKdRfoxB9ehpt-X8sZ0MALFNYSs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HH5g9_ps3vddrgpek1I9w-Jwt611Nz8hIW9u7kmuvf4\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HLkMs8Z3QXfIVeYT2A8LSm_aD3Z2mRswo54-d1FD5OM', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HPfcmePXsx2hn7iGjK9CLI85paDqTUc8ehiaOBZHWeU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HL4DL5Yt6OOpf5SGIj17Wmdg3UuLTw6YE1sv9BjJX1k\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJur-Os9YnjyRjfhsFwagBtLAPDFabTkmVL1MfttDY0\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"365 天\"},{\"attr_key\":\"净含量\",\"attr_value\":\"250 g\"}]', 5, NULL, 880, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951669772289, 2, '10000128631655', '', '云南高山薄皮绿豆', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HLHgbGr9c6_KGi21XEZAAoepF3Ppz0V8sORuLrexVa4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HF27Eazg_7dS-eC58hCZQKARGJZvmvjtlRXiQaXDuhM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCNKmmxaviMp--42oVYOFz4hDOZ--LMoeW6K_Dr1RdY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HI6LSoEmq4amq9JlCWFGWADPR3-dcGRpSZ9hSjpVDxU\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HLHgbGr9c6_KGi21XEZAAoepF3Ppz0V8sORuLrexVa4', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HFttEzhOfSBMQmr3GF5aiXYRwWQwNBRlODZdo9OuKf4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPm0ASyJbbcWUF5Gjyfx6SXkQ35Q__7PTfeIXZE4N-M\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HI-tQMWYK-8kGWDmofe8n2FAotgVO7nOQ_TtVFKIZ6k\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGbHH4bbNuOodfoYUb3tSSamDeQXXVGZUcfQsnpMwmU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKkT2bAc_j4NfBPK4FHD2UCwjIW8Mv7v_cSVbLldO1o\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDeK3HDgZHeDQ4ImXoj15DPdGErOhrX9KqbrwUmc4NI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HC-fkijPHebLrZa7Jsms-TWhSFfDJFP7SXSBWiOaUbA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDIRliNF1eSKBadqhfHT86Gawdc0XOJ4_YVL5EK5HGc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDaaOA5J9EC_aL3U1xgE9NaivNUDfM4TyW7Cw3VbMlY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBQ4FkcAXf_7An5X6BqoAc0NrXfqAjMz64S6bQ8r2wo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKiAd3bZIQpKQLkjeWAxQKcACLwqi1kMUzIYZjPwDkM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOtR2_D7k00skZoO9oC5Ctb5pB5aU7tc8nswBVxMzkk\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"产地\",\"attr_value\":\"云南\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"365 年\"}]', 5, NULL, 100, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951724298242, 2, '10000093794934', '', '甘肃煮水煲汤专用葛根500/1000/2000g袋装', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HO9oqrbYHqFbHJZu-wipvAWatQxrV6qAjOrR14lQ_bg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOtgqEGegxXAL2012Alxh0YvsVLDt_0ufyKg8rY7xlI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HP4HNUOyA8mPyB-d5CBUAQjWHujSLmqNSbr7qT4RBHU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDSzYJZrmu0hq0DRHW5sxAXWMyR8nW_BIq8u1LVHZi0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HMEgvxnkjlghhrzq8ojaDi5vOc6qkUHpHcNiWm3OwAc\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HO9oqrbYHqFbHJZu-wipvAWatQxrV6qAjOrR14lQ_bg', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HDGNzbry6Xros65Y_370DkQ1uQQNEhDUBJRDDztqmjs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HN2g5SdiOLwkqhCt6Jbrk7FuV1pFdsABDRSp96nxyKg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPQV1HivePbY_hkER6ybO7Shqy8KlK36chJQsE1MDNo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HA6u2l71KvTJT6hvxhK9mfylVaCK8IeZJy54Vsa7ceE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKvzEyaT1-0UkH-y64wUCLl0oYNAxP_gjcuIZ1gaKJg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCYLHBYNcxoienOICcpvfL4wwO3impPOkquXexeN-Vg\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无品牌\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳市望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期（天/月/年）\",\"attr_value\":\"一年\"}]', 5, NULL, 1990, 'E', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951841738753, 2, '10000095738813', '', '陕西汉中特产高海拔老树皮产地发自然晾晒无硫煮水泡茶泡酒500g袋装', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HFbNgtP-K-hLsFALruZSWN8XlkWig1Q4qspmLnY3TzU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNnQ8Dqs9AIJBLQQuMyOC12GYaRSjd6jfbbn_wmLz-U\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNmsdzGl8mNn5Db9d2NvA02HCli9Eql1hJ6ONQkLPw4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HEbNTirKlh_Yzj55GD3y0eQtQ-7TnjKyNFQmADJttAk\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HFbNgtP-K-hLsFALruZSWN8XlkWig1Q4qspmLnY3TzU', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HM84e960I9O6ZFHVjuyfd4qEBIVN0aYzAnYpTpmFEUk\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HH7VHXn5H7dok6ujKyd5ERx2FxcisBJfDP9qc8I-ZhU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBMGZCEKY0od3s_POcy_Hkk7xVWl1gIwv6y7BQjqB_Q\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDHNMX2KKGIZenhWNEYwiSSn1VwkrdXT6yogmUVHPNc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKqU6DjXuRALh6yS4hKHUmO64Hl5xt_4jd21azvQ8VQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HI78xt-s-C4OKf1hQDCBPZe78Sh5uptNyXU7y6V0X6M\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKa7E37BcaWRFzynUvRRVX3tCqBClfleYOoQxz4TUrM\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无品牌\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期（天/月/年）\",\"attr_value\":\"2年\"},{\"attr_key\":\"产地\",\"attr_value\":\"陕西\"}]', 5, NULL, 7900, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402951921430530, 2, '10000094036646', '', '陕西汉中特产高海拔拉丝贵皮产地发自然晾晒无硫500g袋装', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HGkiIyOCbIOFzYlVLvLTpIncm7VATMzWd1JrWDJ-fy0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLV8eQVYXYehoKcrgq66Hxig6IHhiubyZU-S-_2MO_I\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCmmfd1F5Meg7yOPH4uIE_DPo6NAlsckoVzPEC0latA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOJGFgBGQkRTJpmxMEyvEsaU7V2fg6vBuKPOBMh1jRk\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HGkiIyOCbIOFzYlVLvLTpIncm7VATMzWd1JrWDJ-fy0', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HD1ilP6cbdcGhA9qbqgBTkwKZfZkXd37ob0wIyotI1Q\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOE84teeCIM_gy-2wJvgNoLuGAjFOTXHwm71bwBvx3E\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGbYJuNg1viNmhGdcIG5nOmfau203F9k3a_kKX8mbGY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLTTGjBEzYiA9bBEirxyORT5VLi8fXq96xxlvTMPDoQ\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无品牌\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期（天/月/年）\",\"attr_value\":\"一年\"},{\"attr_key\":\"产地\",\"attr_value\":\"陕西\"}]', 5, NULL, 6900, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402952009510914, 2, '10000095746487', '', '陕西汉中特产高海拔老树皮产地发自然晾晒无硫煮水泡茶泡酒500g袋装', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HOmDnqtevkhjURQMxHsvF4lEhGoVzkGxh7_ickWsTQI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOz4s9dUTdccY6JKsfAfbFZKN0keRpjQ_urcEJfyi34\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBxVT7KE9Ho64wobdmnBquqymA0nKhQ-XsLQ6FvBs20\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HFNYC1OCRy5ih8xqlvFVHaBCj7Xut9S8dPsfCX8is3s\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HOmDnqtevkhjURQMxHsvF4lEhGoVzkGxh7_ickWsTQI', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HH1cjFIDplaE25zF4Porr7rdxOFkJfhcwrdPhDScJ34\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJywasRhItkUcvAXefJgc3_ivVbyY8MEcJR4ZrWuhWc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCuok8Y1D-0c5oh4XiJIv1hQP-3UcjXIboVwxxT0QlM\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJYCS3YYw_8n3Xuk56aXEdHbVAUVk-2NmCCQaofXajY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKkPXhGZJpXU8HzXj6i6Kv5wWwkCbTQDRSYlzNXWxRw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGdU6me5oA_GgK11tfgLzWz0zhb0lCTo7u-b7bTGoDc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HF9FMRhQ0cIcXXkEClS_z24SahULJ_Jcvbikjbjhfko\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无品牌\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期（天/月/年）\",\"attr_value\":\"2年\"},{\"attr_key\":\"产地\",\"attr_value\":\"陕西\"}]', 5, NULL, 7900, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1800402952147922945, 2, '10000128688394', '', '云南深山牛樟 灵芝500克每袋泡水煲汤', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HDucz8vlMlHnqgyd3EX7977tLwinJXk6nqNK00a5ETQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHVe_2GE2Alg8qKzUZv2Z2YTv9tWjaXiEKezAHIwJbU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAn1eVjNe-5NFCHVLl9ptvNvQzzGd8djZ8sros4K5Js\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKiRfD_f4VulOPb6vD4cnezgHCHJA2Dd1F2r1rfhs_8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HKDCbZxMGD9XLfoJGxNxhrkdkOTUKinPkdY1sdZCE_c\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HDucz8vlMlHnqgyd3EX7977tLwinJXk6nqNK00a5ETQ', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HD-p2w5RFOABcijGsk06CorLITgbeJRlORVIPrPYEtY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDuzM73yXiUZ4mpkJBCzh8cz5ybN59VGNdG7smPhPlc\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJGx-Fv8isGQyNlxXPwt6O35F5pdovgXQII5MIwOWzA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPDVTRZn3pnMWb3AS8aVd4FNeBWQP0ezZy9FXxP93Mg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HMJFvFP0XrythGvEXojLv_OfY8KKBszJBRggfgdHGOE\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"深圳望山科技有限公司\"},{\"attr_key\":\"产地\",\"attr_value\":\"云南\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"720 天\"},{\"attr_key\":\"净含量\",\"attr_value\":\"500 g\"}]', 5, NULL, 6800, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1830213584706121729, 2, '10000141097100', '', '西洋参草本饮片含片切片泡茶正品', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HLKk_cgGKkxyFV0PFM0WGbKojp19Rppo1Jc-mSEsTH0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIb4Z3WnXAsQK5U28rb0f24owxKnvchVmDNleJO2ZzE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDNL9mK1pcJZurlS8haAN9v_18o_7XpqUYqOnIvrBjs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHoAZx-l8O8AsnLYRTpK50niYFz2PihToEJemsfrCJ4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBQ1gQs8nix32pWEqMr6ASm3PyFgqU2cPmRYvntjiHs\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBczaay5C4xDg2Vi8XaOif5XRJp7L3pNlB2CDkr9UU8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJW7_z51nGv80w3nHVTak-4o5D8pPzGx73lvAuCiyec\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HLKk_cgGKkxyFV0PFM0WGbKojp19Rppo1Jc-mSEsTH0', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HAOhz2RS-u9h178PK8i6NeCc4WJLqHVrfajgJe4DlHg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDnJdYlSCI8BdfPww-_ZE2ooYQVRvjax6RkqNZCGLGU\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPy8N-Gp3Pglk45IrfK1IrO62rokgUHDVxkl85UcAEg\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HF6f-X4yUmS9r7i3h3badqGd0Fn3JVTUFP-o7ZCd1AU\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"24 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"1.5 g\"},{\"attr_key\":\"产地\",\"attr_value\":\"长白山\"},{\"attr_key\":\"人参形状\",\"attr_value\":\"片状\"},{\"attr_key\":\"参种类\",\"attr_value\":\"西洋参\"},{\"attr_key\":\"年限\",\"attr_value\":\"5 年\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"聚善缘山货行\"},{\"attr_key\":\"贮存条件\",\"attr_value\":\"阴凉干燥处\"},{\"attr_key\":\"食品名称\",\"attr_value\":\"西洋参\"}]', 5, NULL, 100, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1830213584769036290, 2, '10000140599520', '', '农家山货 龙牙百合煲汤搭配佳品', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HLCqeTZdOaL_ua2_etkmk6_zjUKT9pKG8I2bPZoPn20\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOhFaT2sIvS-U-k-GmgNBItY2t_ADkHpUUO79nfxYqw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HImzRIZ4u77Y3gmk_ZfR30iTHA351rn-vL97lwcgBFA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HE3Ct_crHT6l9kFqSGiGRJgaLafF9W5PzcLHGqNpaGc\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HLCqeTZdOaL_ua2_etkmk6_zjUKT9pKG8I2bPZoPn20', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HKftJQLpgx0GKLgWE2FIeNymkJ4_HMLgKXMOon81tXI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDUDVUrF3aHBHEFvxg5iw0KEpzuCR2rB9fIdWS_Cjms\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBdHTpJwEIfWb0p9btwbCC8it92taaa2jgfIZRm1AmA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HL4wjj4SEXZ9dIr4nXt-qkolbHgMtN-tzK7T3NRzeC4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HE6IFBRrBNB3Nct_5n3qQJRhq48yaO3iYqsBMz6K4qQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOaDYdxk5Kd1EAMFXFH8OZ0_O-r_kV6DwrSvEmtpMeA\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJiKPcuZavyF4pR5lfAYp8ObcnSS4FrEorhiUVezw7g\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"乾佑易真商贸商行\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"12 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"20 g\"}]', 5, NULL, 380, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1830213584836145154, 2, '10000140638654', '', '（红参片）正宗长白山大片精选红参无蔗糖无硫整枝切片煮水1.5g/袋', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HLfx7jYbfMya4UMZw-9NYDH4zlQxEwlgOknMjveS7Z8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDtBbv2OshRbx4-6Iee6nGqBpSPKD1JTYsYoKnFz6bQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HE9zfBKxj006HcdYEzEa8macy6JslvesYHsiZ-IMN9M\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HF8R_CGWphifqdZt4atJsDtAh66jDyth0KTNWx3lY1w\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HLfx7jYbfMya4UMZw-9NYDH4zlQxEwlgOknMjveS7Z8', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HNWve8IAukbhWICUMFPPtdF_hq6Y3FGuybYqmaB8UA0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HPav6uHG-P6kYjFi8W7lWuzhVN3qvYjN_LbGPc3V3NE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HG5VPA0i9l_NJScUmG3q73Hlz2FRSQu5FmpertY16FY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGcqQa9CB9GHjf3BaMSbINf27O4fYU6aqLCTtrWP58E\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNhoMuQfKyk70q4SCx3shjWo8qq6mIGHzRjX5Gz-4lw\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"散装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"2 年\"},{\"attr_key\":\"净含量\",\"attr_value\":\"1.5 g\"},{\"attr_key\":\"产地\",\"attr_value\":\"长白山\"},{\"attr_key\":\"人参形状\",\"attr_value\":\"片状\"},{\"attr_key\":\"参种类\",\"attr_value\":\"红参\"},{\"attr_key\":\"年限\",\"attr_value\":\"2 年\"}]', 5, NULL, 100, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1830213584836145156, 2, '10000140587752', '', '云南拉丝雪燕（50克一家人一次的用量）植物燕窝', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HG4cZi7eNMAHGIeB333RGABznZN5UuT_FIeYfv2PMEQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HNG7203Liq3jvnmvMeVmEKfT7k9LQVsdVDvJKciGDg8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HGU02TyzD06oPZ0ktX7hi0LGvFqFWdaYQUd6-lxoV4g\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HBKoJUGOEYYZFEcGn15xisoAUBMaF4zHITGtVQlwwsU\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HG4cZi7eNMAHGIeB333RGABznZN5UuT_FIeYfv2PMEQ', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HKU0gfAjva0Bplk4R3dN0NKvfri7LdlbGC91km7RHrI\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HAiI8_Kb2tzc4QvUs-RNerqtjm9SCPnFrXmt_aTrHp8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJJEyhKfHzw97F1cNHoKACyxfOYCRZdD85c4ylTyZEQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJtAI0-yeNxUE8XaKXoFVl34qJCbwnNgo9OVfODKnU8\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HHVX2evH8XzNE-uWI5VWFOI7urnoMXTlWdQQqVU9yZQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HMsAxYrICEMMAWEJ8bN1PRAh4JQLzzvBwXEFe0QGKLE\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HFuRiy_5HM1NVjOSWZKLEnVX7YbJlLbx1q3q6OGvh-4\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HIz2cDDOpVYv1PvTLKs7b8iF8IsiZptfcYGmaj_ZUVQ\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLCGJVPeg_v05dF3hTyPcs64VgXRHs8cHsiu7D4UiZw\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"365 天\"},{\"attr_key\":\"净含量\",\"attr_value\":\"500 g\"},{\"attr_key\":\"产地\",\"attr_value\":\"云南\"},{\"attr_key\":\"燕窝形状\",\"attr_value\":\"其他\"}]', 5, NULL, 100, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1830213584966168578, 2, '10000137108422', '', '高山 (牛蒡根)牛干菜 一斤 两斤包邮', '', '[\"https://mmecimage.cn/p/wx720ff3dc86188107/HPOGDQu_z_VsjvLVPOjvRAgunzQMC0MK-dcoF71EH8g\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HK10l4QogjE8i0FdclLpZyfEztoIUg_XKjFq8jjMwyo\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HCMo3d8M7rD7moiJWS_FfRkdMcYtS_2K181tHxtMz6Y\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HK5P7EbeYFD3QuyQ72n1buy8K5s3VERHY6bw8r38HQY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HLhLm1V2ij-rDR414IidRZhAYICeMA49eSP59h8iVFE\"]', 'https://mmecimage.cn/p/wx720ff3dc86188107/HPOGDQu_z_VsjvLVPOjvRAgunzQMC0MK-dcoF71EH8g', '{\"imgs\":[\"https://mmecimage.cn/p/wx720ff3dc86188107/HC2FrlbI1pzg6yeRqfOtvJSezSvG3mhCcGQ2JOKFTg0\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HL0S1oakw1N67lhp_uD_A8UEkdH7zWENje7zA2AcxPw\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HDU0oal5eckJ5Fs5vNO7RyvBrDfZForVI4Y1bGxtQcY\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HOCF9yClSnBP4L-eBlj4dt9hjBGQ39ktTiDtwwbGd4Y\",\"https://mmecimage.cn/p/wx720ff3dc86188107/HJ6mciAeUApT214IkJ4-J6J-UWf_ZVXBPHGBdJifTOc\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"龙泉市娇点电子商务商行\"},{\"attr_key\":\"包装方式\",\"attr_value\":\"袋装\"},{\"attr_key\":\"保质期\",\"attr_value\":\"24 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"500 g\"}]', 5, NULL, 4800, '', 1, 0);

-- ----------------------------
-- Table structure for oms_wei_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_goods_sku`;
CREATE TABLE `oms_wei_goods_sku`  (
  `id` bigint NOT NULL,
  `shop_id` bigint NULL DEFAULT NULL COMMENT '店铺id',
  `product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品id',
  `sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'skuID',
  `out_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家自定义skuID。如果添加时没录入，回包可能不包含该字段',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `thumb_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku小图',
  `sale_price` int NULL DEFAULT NULL COMMENT '售卖价格，以分为单位',
  `stock_num` int NULL DEFAULT NULL COMMENT 'sku库存',
  `sku_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `status` int NULL DEFAULT NULL COMMENT 'sku状态',
  `sku_attr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku属性',
  `sku_attrs` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku_attrs',
  `sku_deliver_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku_deliver_info',
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT 'erp系统商品id',
  `erp_goods_sku_id` bigint NULL DEFAULT NULL COMMENT 'erp系统商品skuid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_wei_goods_sku
-- ----------------------------
INSERT INTO `oms_wei_goods_sku` VALUES (1796070070747123714, 2, '10000111645565', '2198772498', '', '2024春季农家燕麦麸皮高纤高蛋白营养 500g/罐', 'https://mmecimage.cn/p/wx62136b9e9b09930b/HLOZRDqDEXQ_EGmghk51hxJ_PR4KCrYoOPcfH9J5Xg', 9990, 10000, '', 5, '拍3罐送1罐到手4斤 ; 7天无理由试喝及运费险 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍3罐送1罐到手4斤\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天无理由试喝及运费险\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1796070070893924354, 2, '10000114346861', '2239632777', '', '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 'https://mmecimage.cn/p/wx62136b9e9b09930b/HBA00xcXpgSCJfACpAwipmecGfNQ5B9F2jH0k9DX-w', 9990, 9989, '', 5, '拍1发4=到手4罐 ; 7天试喝及运费险 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1800402952043065346, 2, '10000095746487', '1989036853', '', '陕西汉中特产高海拔老树皮产地发自然晾晒无硫煮水泡茶泡酒500g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HOmDnqtevkhjURQMxHsvF4lEhGoVzkGxh7_ickWsTQI', 7900, 0, '', 5, '热销十万件好评 ; 500g【尝鲜装，推荐】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"500g【尝鲜装，推荐】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1800402952089202690, 2, '10000095746487', '1989060334', '', '陕西汉中特产高海拔老树皮产地发自然晾晒无硫煮水泡茶泡酒500g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HOmDnqtevkhjURQMxHsvF4lEhGoVzkGxh7_ickWsTQI', 13900, 0, '', 5, '热销十万件好评 ; 1000g【实惠装，强烈推荐】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"1000g【实惠装，强烈推荐】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1800402952126951425, 2, '10000095746487', '1989029011', '', '陕西汉中特产高海拔老树皮产地发自然晾晒无硫煮水泡茶泡酒500g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HOmDnqtevkhjURQMxHsvF4lEhGoVzkGxh7_ickWsTQI', 24900, 0, '', 5, '热销十万件好评 ; 2000g【囤货装，超高性价比】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"2000g【囤货装，超高性价比】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1800402952189865985, 2, '10000128688394', '2303651789', '', '云南深山牛樟 灵芝500克每袋泡水煲汤', 'https://mmecimage.cn/p/wx720ff3dc86188107/HDucz8vlMlHnqgyd3EX7977tLwinJXk6nqNK00a5ETQ', 6800, 7888, '', 5, '100克（一个月两） ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"100克（一个月两）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, 1266);
INSERT INTO `oms_wei_goods_sku` VALUES (1800402952206643201, 2, '10000128688394', '2303666454', '', '云南深山牛樟 灵芝500克每袋泡水煲汤', 'https://mmecimage.cn/p/wx720ff3dc86188107/HDucz8vlMlHnqgyd3EX7977tLwinJXk6nqNK00a5ETQ', 25800, 5555, '', 5, '500克/一斤（半年量） ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"500克/一斤（半年量）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, 123400);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685322616834, 2, '10000141097100', '2449187716', '', '西洋参草本饮片含片切片泡茶正品', 'https://mmecimage.cn/p/wx720ff3dc86188107/HLKk_cgGKkxyFV0PFM0WGbKojp19Rppo1Jc-mSEsTH0', 100, 0, '', 5, '热销10万件好评 ; 1.5克 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"1.5克\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685385531394, 2, '10000140599520', '2443259653', '', '农家山货 龙牙百合煲汤搭配佳品', 'https://mmecimage.cn/p/wx720ff3dc86188107/HLCqeTZdOaL_ua2_etkmk6_zjUKT9pKG8I2bPZoPn20', 380, 0, '', 5, '热销10万件好评 ; 10/g ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"10/g\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685385531395, 2, '10000140638654', '2443155603', '', '（红参片）正宗长白山大片精选红参无蔗糖无硫整枝切片煮水1.5g/袋', 'https://mmecimage.cn/p/wx720ff3dc86188107/HLfx7jYbfMya4UMZw-9NYDH4zlQxEwlgOknMjveS7Z8', 100, 0, '', 5, '热销10万件好评 ; 红参片一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"红参片一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685452640257, 2, '10000140587752', '2443318788', '', '云南拉丝雪燕（50克一家人一次的用量）植物燕窝', 'https://mmecimage.cn/p/wx720ff3dc86188107/HG4cZi7eNMAHGIeB333RGABznZN5UuT_FIeYfv2PMEQ', 100, 0, '', 5, '50g ; 一家人一次的用量 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"50g\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"一家人一次的用量\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685519749122, 2, '10000131202826', '2330243972', '', '红枣片正宗新疆红枣干片无核免洗50g/袋', 'https://mmecimage.cn/p/wx720ff3dc86188107/HNVcxmj1Ph12mjr1jYPH6yenW4eHwGNk7VVyIBzKnN8', 10, 0, '', 5, '50克一袋 ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"50克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685519749123, 2, '10000137108422', '2402758723', '', '高山 (牛蒡根)牛干菜 一斤 两斤包邮', 'https://mmecimage.cn/p/wx720ff3dc86188107/HPOGDQu_z_VsjvLVPOjvRAgunzQMC0MK-dcoF71EH8g', 4800, 9952, '', 5, '体验装 1斤【不划算，贵在运费】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"体验装 1斤【不划算，贵在运费】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685519749124, 2, '10000137108422', '2402874073', '', '高山 (牛蒡根)牛干菜 一斤 两斤包邮', 'https://mmecimage.cn/p/wx720ff3dc86188107/HPOGDQu_z_VsjvLVPOjvRAgunzQMC0MK-dcoF71EH8g', 15600, 10000, '', 5, '钜惠装4斤【强烈推荐，超划算】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"钜惠装4斤【强烈推荐，超划算】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685519749125, 2, '10000137108422', '2403284689', '', '高山 (牛蒡根)牛干菜 一斤 两斤包邮', 'https://mmecimage.cn/p/wx720ff3dc86188107/HPOGDQu_z_VsjvLVPOjvRAgunzQMC0MK-dcoF71EH8g', 8800, 9965, '', 5, '福利装 2斤【推荐,高性价比】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"福利装 2斤【推荐,高性价比】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685578469378, 2, '10000128665468', '2399809237', '', '1.8大片，正宗长白山红参片 煲汤泡酒厚切大片', 'https://mmecimage.cn/p/wx720ff3dc86188107/HNQjoX75styiRbjtf8wZWfTo1apemrThdO7bPndsJXo', 990, 363, '', 5, '热销10万件好评 ; 30g多拍多划算 炸半天，10单一个疗效 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"30g多拍多划算 炸半天，10单一个疗效\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685578469379, 2, '10000068453656', '1628141782', '', '2024年农家小麦胚芽 高纤高蛋白营养 500g/罐', 'https://mmecimage.cn/p/wx720ff3dc86188107/HFE3FFCf-54PpMUegnI1gg74A8NtIT9ClKb7H62IzbY', 9990, 8184, '1541002121', 5, '买2斤送2斤到手4斤 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"买2斤送2斤到手4斤\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685641383938, 2, '10000068453656', '1628135820', '', '2024年农家小麦胚芽 高纤高蛋白营养 500g/罐', 'https://mmecimage.cn/p/wx720ff3dc86188107/HFE3FFCf-54PpMUegnI1gg74A8NtIT9ClKb7H62IzbY', 9900, 0, '1592771899', 5, '买2斤送1斤到手3斤 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"买2斤送1斤到手3斤\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685641383939, 2, '10000128621274', '2304029635', '', '云南特产 龙牙百合', 'https://mmecimage.cn/p/wx720ff3dc86188107/HHAM8R6aAB6AyAhqquS0rL149zk7D65rf_uIsImsxXI', 680, 0, '', 5, '热销10万件好评 ; 30克一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"30克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685704298498, 2, '10000022645693', '1135568233', '', '湖北特产湘之忆农家风干鸡500g腊鸡腊肉咸鸡散养土鸡整只', 'https://mmecimage.cn/p/wx720ff3dc86188107/HKKKrojCv73Z-JQ3U0pAs8P9XREXZLk_Cd2i_CPlbQ', 12990, 9997, '', 5, '3只装【超实惠】 ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"3只装【超实惠】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685704298499, 2, '10000022645693', '1135521882', '', '湖北特产湘之忆农家风干鸡500g腊鸡腊肉咸鸡散养土鸡整只', 'https://mmecimage.cn/p/wx720ff3dc86188107/HKKKrojCv73Z-JQ3U0pAs8P9XREXZLk_Cd2i_CPlbQ', 8990, 9998, '', 5, '2只装【试吃】 ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"2只装【试吃】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685704298500, 2, '10000022645693', '1135552812', '', '湖北特产湘之忆农家风干鸡500g腊鸡腊肉咸鸡散养土鸡整只', 'https://mmecimage.cn/p/wx720ff3dc86188107/HKKKrojCv73Z-JQ3U0pAs8P9XREXZLk_Cd2i_CPlbQ', 19990, 9998, '', 5, '5只装【超划算、性价比】 ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"5只装【超划算、性价比】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685704298501, 2, '10000022645693', '1135547084', '', '湖北特产湘之忆农家风干鸡500g腊鸡腊肉咸鸡散养土鸡整只', 'https://mmecimage.cn/p/wx720ff3dc86188107/HKKKrojCv73Z-JQ3U0pAs8P9XREXZLk_Cd2i_CPlbQ', 5290, 9998, '', 5, '1只装【贵在运费不推荐】 ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"1只装【贵在运费不推荐】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685767213058, 2, '10000068427840', '1628182006', '', '肚包肉内蒙古羊肚包羊肉肠1斤/2斤', 'https://mmecimage.cn/p/wx720ff3dc86188107/HK2gcdUuMRiHZUEU7-ZdYNUJhFLlyTcTFRHa45FTRBs', 35990, 10000, '', 5, '2斤羊肉肠+2斤肚包肉（韭花酱白蘑菇酱炖料） ; ', '[{\"attr_key\":\"套餐\",\"attr_value\":\"2斤羊肉肠+2斤肚包肉（韭花酱白蘑菇酱炖料）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685830127617, 2, '10000068427840', '1628131741', '', '肚包肉内蒙古羊肚包羊肉肠1斤/2斤', 'https://mmecimage.cn/p/wx720ff3dc86188107/HK2gcdUuMRiHZUEU7-ZdYNUJhFLlyTcTFRHa45FTRBs', 20900, 10000, '', 5, '1斤羊肉肠+1斤肚包肉（瓶韭花酱、炖肉料） ; ', '[{\"attr_key\":\"套餐\",\"attr_value\":\"1斤羊肉肠+1斤肚包肉（瓶韭花酱、炖肉料）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685830127618, 2, '10000068427840', '1628137529', '', '肚包肉内蒙古羊肚包羊肉肠1斤/2斤', 'https://mmecimage.cn/p/wx720ff3dc86188107/HK2gcdUuMRiHZUEU7-ZdYNUJhFLlyTcTFRHa45FTRBs', 12900, 10000, '', 5, '1斤肚包羊肉（送韭菜花酱、炖肉料） ; ', '[{\"attr_key\":\"套餐\",\"attr_value\":\"1斤肚包羊肉（送韭菜花酱、炖肉料）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685830127619, 2, '10000068427840', '1628133676', '', '肚包肉内蒙古羊肚包羊肉肠1斤/2斤', 'https://mmecimage.cn/p/wx720ff3dc86188107/HK2gcdUuMRiHZUEU7-ZdYNUJhFLlyTcTFRHa45FTRBs', 20900, 10000, '', 5, '2斤肚包羊肉（送瓶韭菜花酱、炖肉料） ; ', '[{\"attr_key\":\"套餐\",\"attr_value\":\"2斤肚包羊肉（送瓶韭菜花酱、炖肉料）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685830127620, 2, '10000068427840', '1628158868', '', '肚包肉内蒙古羊肚包羊肉肠1斤/2斤', 'https://mmecimage.cn/p/wx720ff3dc86188107/HK2gcdUuMRiHZUEU7-ZdYNUJhFLlyTcTFRHa45FTRBs', 8900, 9999, '', 5, '1斤羊肉肠（送韭菜花酱、炖肉料） ; ', '[{\"attr_key\":\"套餐\",\"attr_value\":\"1斤羊肉肠（送韭菜花酱、炖肉料）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685830127621, 2, '10000068427840', '1628172541', '', '肚包肉内蒙古羊肚包羊肉肠1斤/2斤', 'https://mmecimage.cn/p/wx720ff3dc86188107/HK2gcdUuMRiHZUEU7-ZdYNUJhFLlyTcTFRHa45FTRBs', 16900, 10000, '', 5, '2斤羊肉肠（送瓶韭菜花酱、炖肉料） ; ', '[{\"attr_key\":\"套餐\",\"attr_value\":\"2斤羊肉肠（送瓶韭菜花酱、炖肉料）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685893042177, 2, '10000088963322', '1925093856', '', '气质妈妈装显瘦裙大码阔太太洋气中老年女装夏季新款中长款连衣裙', 'https://mmecimage.cn/p/wx720ff3dc86188107/HFytFb3lYLhAi1s2MJrXoar8wkx3KlcDck1e3Ushe6k', 28320, 0, 'FMNFSYE9317-1', 5, '紫色 ; XL ; ', '[{\"attr_key\":\"颜色\",\"attr_value\":\"紫色\"},{\"attr_key\":\"尺码\",\"attr_value\":\"XL\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685960151042, 2, '10000093570949', '1969829252', '', '农家自然晾晒泡水煮茶解酒葛根切片现切500/1000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HH88r1ZWDHg09Z6gJ8Z467iPy_sO2TLjFdKCbNn7-gc', 1990, 10000, '', 5, '热销10万件99.9%好评 ; 体验装50克*手工大片【贵在运费】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件99.9%好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"体验装50克*手工大片【贵在运费】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685960151043, 2, '10000093570949', '1969846905', '', '农家自然晾晒泡水煮茶解酒葛根切片现切500/1000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HH88r1ZWDHg09Z6gJ8Z467iPy_sO2TLjFdKCbNn7-gc', 7990, 9978, '', 5, '热销10万件99.9%好评 ; 500克*手工大片 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件99.9%好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"500克*手工大片\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685960151044, 2, '10000093570949', '1969827375', '', '农家自然晾晒泡水煮茶解酒葛根切片现切500/1000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HH88r1ZWDHg09Z6gJ8Z467iPy_sO2TLjFdKCbNn7-gc', 13990, 9996, '', 5, '热销10万件99.9%好评 ; 1000克*手工大片【懂得都选它，聚划算】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件99.9%好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"1000克*手工大片【懂得都选它，聚划算】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215685960151045, 2, '10000093570949', '1969874207', '', '农家自然晾晒泡水煮茶解酒葛根切片现切500/1000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HH88r1ZWDHg09Z6gJ8Z467iPy_sO2TLjFdKCbNn7-gc', 25990, 10000, '', 5, '热销10万件99.9%好评 ; 2000克*手工大片 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件99.9%好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"2000克*手工大片\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686023065601, 2, '10000093951688', '1972299668', '', '冬季煮水泡水专用葛根煲汤解酒500/1000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HHIYspvf7HAuDpXnYfxioBPe-8pRKx6U7ZgMOp7e13M', 1990, 0, '', 5, '热销10万件好评 ; 体验装50克*手工大片【贵在运费】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"体验装50克*手工大片【贵在运费】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686023065602, 2, '10000093951688', '1972293996', '', '冬季煮水泡水专用葛根煲汤解酒500/1000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HHIYspvf7HAuDpXnYfxioBPe-8pRKx6U7ZgMOp7e13M', 7990, 9999, '', 5, '热销10万件好评 ; 500克*手工大片 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"500克*手工大片\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686023065603, 2, '10000093951688', '1972336566', '', '冬季煮水泡水专用葛根煲汤解酒500/1000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HHIYspvf7HAuDpXnYfxioBPe-8pRKx6U7ZgMOp7e13M', 13990, 10000, '', 5, '热销10万件好评 ; 1000克*手工大片【懂得都选它，聚划算】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"1000克*手工大片【懂得都选它，聚划算】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686023065604, 2, '10000093951688', '1972319129', '', '冬季煮水泡水专用葛根煲汤解酒500/1000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HHIYspvf7HAuDpXnYfxioBPe-8pRKx6U7ZgMOp7e13M', 25990, 10000, '', 5, '热销10万件好评 ; 2000*手工大片【家庭囤货装 】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"2000*手工大片【家庭囤货装 】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686085980161, 2, '10000128621091', '2303633390', '', '（拍一发五）云南山货 羊肚菌 食用新干货煲汤炖汤营养美味菌菇肉质厚实20克', 'https://mmecimage.cn/p/wx720ff3dc86188107/HEh8a6bK3-Mh_OOXU0i4uRooZ4mFYRMiApZVEl81wUs', 16800, 18888, '', 5, '（4包+1包）*20克 ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"（4包+1包）*20克\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686085980162, 2, '10000128735759', '2303677649', '', '云南深山牛樟  灵芝500克每袋泡水煲汤', 'https://mmecimage.cn/p/wx720ff3dc86188107/HPvwwo2Z7lmYNR1Lqy2WYHspA0XvE45RurGI9x78brY', 6800, 7888, '', 5, '100克（一个月两） ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"100克（一个月两）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686085980163, 2, '10000128735759', '2303657923', '', '云南深山牛樟  灵芝500克每袋泡水煲汤', 'https://mmecimage.cn/p/wx720ff3dc86188107/HPvwwo2Z7lmYNR1Lqy2WYHspA0XvE45RurGI9x78brY', 25800, 5555, '', 5, '500克/一斤（半年量） ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"500克/一斤（半年量）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686148894721, 2, '10000128717048', '2304105845', '', '云南山货 乌蒙山茯苓块 250克/500克', 'https://mmecimage.cn/p/wx720ff3dc86188107/HB-WAMH7bZXfBBlgROvcsonjAQbOt_mCSxr5WXgMwYI', 2300, 1111, '', 5, '热销10万件好评 ; 250克一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"250克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686148894722, 2, '10000128717048', '2304152163', '', '云南山货 乌蒙山茯苓块 250克/500克', 'https://mmecimage.cn/p/wx720ff3dc86188107/HB-WAMH7bZXfBBlgROvcsonjAQbOt_mCSxr5WXgMwYI', 3800, 1111, '', 5, '热销10万件好评 ; 500克一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"500克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686211809281, 2, '10000128678989', '2304064513', '', '云南特产山货 金丝皇菊 花茶100克/袋', 'https://mmecimage.cn/p/wx720ff3dc86188107/HBtV6EGoeFG6ojSGxZ8Juqi9KJkRk2i00udQlhduQZM', 1990, 99996, '', 5, '100克/袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"100克/袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686274723841, 2, '10000128726399', '2304202004', '', '干草片250克/袋', 'https://mmecimage.cn/p/wx720ff3dc86188107/HEPOREBb_H_1N7BgGqQQ9h3XmKlPsJRjR5fDq7bTfC4', 2680, 111, '', 5, '热销10万件 ; 250克一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"250克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686274723842, 2, '10000128726399', '2304172827', '', '干草片250克/袋', 'https://mmecimage.cn/p/wx720ff3dc86188107/HEPOREBb_H_1N7BgGqQQ9h3XmKlPsJRjR5fDq7bTfC4', 2880, 1111, '', 5, '热销10万件 ; 500克一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"500克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686274723843, 2, '10000128693506', '2304476184', '', '长白山西洋参片 泡水泡酒炖汤1.4CM', 'https://mmecimage.cn/p/wx720ff3dc86188107/HOS8YVVaZsadA7MSkrVLadqCNG90gyS0EL1Ogu-mF-8', 4900, 11111, '', 5, '热销十万件好评 ; 100克一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"100克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686274723844, 2, '10000128693506', '2304446416', '', '长白山西洋参片 泡水泡酒炖汤1.4CM', 'https://mmecimage.cn/p/wx720ff3dc86188107/HOS8YVVaZsadA7MSkrVLadqCNG90gyS0EL1Ogu-mF-8', 11800, 78787, '', 5, '热销十万件好评 ; 250克一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"250克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686337638401, 2, '10000128693506', '2304450296', '', '长白山西洋参片 泡水泡酒炖汤1.4CM', 'https://mmecimage.cn/p/wx720ff3dc86188107/HOS8YVVaZsadA7MSkrVLadqCNG90gyS0EL1Ogu-mF-8', 21800, 33333, '', 5, '热销十万件好评 ; 500克一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"500克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686337638402, 2, '10000129131746', '2308608894', '', '吉林长白山 灵芝袍子粉超细粉 250克/罐家庭装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HCwgAXIH66hoXLM3LHTB3Yci5Gv8eCzbC9KUB2Wj6pM', 31800, 111111, '', 5, '热销10万件好评 ; 买2送2【家庭装】（共1000克） ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"买2送2【家庭装】（共1000克）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686337638403, 2, '10000129131746', '2308624563', '', '吉林长白山 灵芝袍子粉超细粉 250克/罐家庭装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HCwgAXIH66hoXLM3LHTB3Yci5Gv8eCzbC9KUB2Wj6pM', 59800, 11111, '', 5, '热销10万件好评 ; 买4送4【长效装】（共2000克） ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"买4送4【长效装】（共2000克）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686400552961, 2, '10000131183510', '2330410502', '', '正宗新疆红枣干果泡水泡茶煮粥煲汤零食50g/袋', 'https://mmecimage.cn/p/wx720ff3dc86188107/HCFYyfDYH1-c87ERO81fdQLvXFV9zCaVBxpTGKlpvZA', 100, 0, '', 5, '50克一袋 ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"50克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686400552962, 2, '10000131195179', '2331612598', '', '新货莆田桂圆干龙眼干核小肉厚 非无核桂圆50g/袋', 'https://mmecimage.cn/p/wx720ff3dc86188107/HByk5IDc3USkVXDEpLbVtHGyTP18m_E4UINrS0IluAI', 100, 0, '', 5, '50克一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686467661825, 2, '10000128752685', '2304653289', '', '乾佑 雪梨片', 'https://mmecimage.cn/p/wx720ff3dc86188107/HFSDYimsHfqsNo3BcpZTrggc7SzQFuGL4XqGqjHNBuc', 100, 0, '', 5, '热销十万件好评 ; 50克一袋 ; ', '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686530576386, 2, '10000128693777', '2304555042', '', '无沙 桑葚  50克/袋', 'https://mmecimage.cn/p/wx720ff3dc86188107/HJXXDaPsnSmJdj5l8eVH8e15gvsSi0p0A6iUbUygAKU', 100, 0, '', 5, '50克一袋 ; 热销十万件好评 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686530576387, 2, '10000128655039', '2303968844', '', '云南山货 牛蒡根 净重100克/袋', 'https://mmecimage.cn/p/wx720ff3dc86188107/HLkMs8Z3QXfIVeYT2A8LSm_aD3Z2mRswo54-d1FD5OM', 880, 0, '', 5, '250克一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"250克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686530576388, 2, '10000128655039', '2304004055', '', '云南山货 牛蒡根 净重100克/袋', 'https://mmecimage.cn/p/wx720ff3dc86188107/HLkMs8Z3QXfIVeYT2A8LSm_aD3Z2mRswo54-d1FD5OM', 1580, 0, '', 5, '100克一袋 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"100克一袋\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686597685250, 2, '10000128631655', '2304102734', '', '云南高山薄皮绿豆', 'https://mmecimage.cn/p/wx720ff3dc86188107/HLHgbGr9c6_KGi21XEZAAoepF3Ppz0V8sORuLrexVa4', 100, 0, '', 5, '热销10万件好评 ; 50克 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"50克\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686660599810, 2, '10000093794934', '1970248596', '', '甘肃煮水煲汤专用葛根500/1000/2000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HO9oqrbYHqFbHJZu-wipvAWatQxrV6qAjOrR14lQ_bg', 1990, 10000, '', 5, '热销10万件好评 ; 体验装50克*手工大片【贵在运费】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"体验装50克*手工大片【贵在运费】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686660599811, 2, '10000093794934', '1970234803', '', '甘肃煮水煲汤专用葛根500/1000/2000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HO9oqrbYHqFbHJZu-wipvAWatQxrV6qAjOrR14lQ_bg', 7990, 10000, '', 5, '热销10万件好评 ; 500克*手工大片 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"500克*手工大片\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686660599812, 2, '10000093794934', '1970254447', '', '甘肃煮水煲汤专用葛根500/1000/2000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HO9oqrbYHqFbHJZu-wipvAWatQxrV6qAjOrR14lQ_bg', 13990, 10000, '', 5, '热销10万件好评 ; 1000克*手工大片【懂得都选它，聚划算】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"1000克*手工大片【懂得都选它，聚划算】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686660599813, 2, '10000093794934', '1972183154', '', '甘肃煮水煲汤专用葛根500/1000/2000g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HO9oqrbYHqFbHJZu-wipvAWatQxrV6qAjOrR14lQ_bg', 25990, 10000, '', 5, '热销10万件好评 ; 2000*手工大片【家庭囤货装 】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销10万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"2000*手工大片【家庭囤货装 】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686727708674, 2, '10000095738813', '1989036978', '', '陕西汉中特产高海拔老树皮产地发自然晾晒无硫煮水泡茶泡酒500g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HFbNgtP-K-hLsFALruZSWN8XlkWig1Q4qspmLnY3TzU', 7900, 9993, '', 5, '热销十万件好评 ; 500g【尝鲜装，推荐】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"500g【尝鲜装，推荐】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686727708675, 2, '10000095738813', '1989017408', '', '陕西汉中特产高海拔老树皮产地发自然晾晒无硫煮水泡茶泡酒500g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HFbNgtP-K-hLsFALruZSWN8XlkWig1Q4qspmLnY3TzU', 13900, 9998, '', 5, '热销十万件好评 ; 1000g【实惠装，强烈推荐】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"1000g【实惠装，强烈推荐】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686727708676, 2, '10000095738813', '1989044819', '', '陕西汉中特产高海拔老树皮产地发自然晾晒无硫煮水泡茶泡酒500g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HFbNgtP-K-hLsFALruZSWN8XlkWig1Q4qspmLnY3TzU', 24900, 9998, '', 5, '热销十万件好评 ; 2000g【囤货装，超高性价比】 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"新人福利活动倒计时00：03\",\"attr_value\":\"2000g【囤货装，超高性价比】\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686727708677, 2, '10000094036646', '1972977313', '', '陕西汉中特产高海拔拉丝贵皮产地发自然晾晒无硫500g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HGkiIyOCbIOFzYlVLvLTpIncm7VATMzWd1JrWDJ-fy0', 29900, 10000, '', 5, '【30年老皮】五斤（超划算泡酒用） ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"【30年老皮】五斤（超划算泡酒用）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686727708678, 2, '10000094036646', '1972998924', '', '陕西汉中特产高海拔拉丝贵皮产地发自然晾晒无硫500g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HGkiIyOCbIOFzYlVLvLTpIncm7VATMzWd1JrWDJ-fy0', 12900, 10000, '', 5, '【30年老皮】二斤（泡茶煲汤专用） ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"【30年老皮】二斤（泡茶煲汤专用）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1830215686790623234, 2, '10000094036646', '1973016521', '', '陕西汉中特产高海拔拉丝贵皮产地发自然晾晒无硫500g袋装', 'https://mmecimage.cn/p/wx720ff3dc86188107/HGkiIyOCbIOFzYlVLvLTpIncm7VATMzWd1JrWDJ-fy0', 6900, 10000, '', 5, '【30年老皮】一斤（泡茶款） ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"【30年老皮】一斤（泡茶款）\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);

-- ----------------------------
-- Table structure for oms_wei_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_order`;
CREATE TABLE `oms_wei_order`  (
  `id` bigint NOT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `openid` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家身份标识',
  `create_time` int NULL DEFAULT NULL COMMENT '秒级时间戳',
  `update_time` int NULL DEFAULT NULL COMMENT '秒级时间戳',
  `unionid` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL COMMENT '状态10	待付款；20	待发货；21	部分发货；30	待收货；100	完成；200	全部商品售后之后，订单取消；250	未付款用户主动取消或超时未付款订单自动取消；',
  `aftersale_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '售后信息json',
  `pay_info` varchar(5500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付信息json',
  `product_price` int NULL DEFAULT NULL COMMENT '商品总价，单位为分',
  `order_price` int NULL DEFAULT NULL COMMENT '订单金额，单位为分，order_price=original_order_price-discounted_price-deduction_price-change_down_price',
  `freight` int NULL DEFAULT NULL COMMENT '运费，单位为分',
  `discounted_price` int NULL DEFAULT NULL COMMENT '优惠券优惠金额，单位为分',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `county_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `tel_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式\r\n',
  `house_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门牌号码',
  `virtual_order_tel_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '虚拟发货订单联系方式(deliver_method=1时返回)',
  `tel_number_ext_info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '额外的联系方式信息（虚拟号码相关）',
  `use_tel_number` int NULL DEFAULT NULL COMMENT '0：不使用虚拟号码，1：使用虚拟号码',
  `hash_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标识当前店铺下一个唯一的用户收货地址',
  `delivery_product_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发货物流信息JSON',
  `ship_done_time` int NULL DEFAULT NULL COMMENT '发货完成时间，秒级时间戳',
  `ewaybill_order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子面单代发时的订单密文\r\n',
  `settle_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算信息json',
  `audit_status` int NULL DEFAULT NULL COMMENT '订单审核状态（0待审核1已审核）',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  `erp_send_company` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递公司',
  `erp_send_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递单号',
  `erp_send_status` int NULL DEFAULT 0 COMMENT 'erp发货状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_wei_order
-- ----------------------------
INSERT INTO `oms_wei_order` VALUES (1787451057007726594, 2, '3719632105698365440', 'oTci56wpEC3rpLzBLpqgca9RxPVE', 1714880617, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx051143383371820d4bc111707233960000\",\"prepay_time\":1714880618,\"pay_time\":1714880636,\"transaction_id\":\"4339401087202405058204364146\"}', 9990, 9990, 0, NULL, '陈*', '401120', '重庆市', '重庆市', '渝北区', '****', '151****3175', '', '', 'null', 0, '76c5d95a69fa3e2f3df3fa130c544b1e', '[{\"waybill_id\":\"73611068324382\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofoTfAD_tpK6Oj6pD5EZn0X6VvDfkvcvnlmaRnrVRQQnd1z7vKd8wIYBV95WZKSMi0gJOH2iKHJw', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057125167105, 2, '3719632099578611200', 'oTci56zcnCjfcfUfYwq73nCHsV8I', 1714880593, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05114314861727bb07cc30ececbdcf0001\",\"prepay_time\":1714880595,\"pay_time\":1714880603,\"transaction_id\":\"4327500968202405056312947579\"}', 9990, 9990, 0, NULL, '丁', '510145', '广东省', '广州市', '荔湾区', '****', '153****3552', '', '', 'null', 0, '27a59189b23a462344802f09f13cc250', '[{\"waybill_id\":\"73611068324461\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'of2RLT2XA-d89xt4GX9sSerSB6YeVylmdbAlfELihMWDfpqbrZrnyU6k8BPG7ONUWYwYHLM1U6tA', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057183887362, 2, '3719632099131658496', 'oTci56xFJpSZmNaWM1w_o2Z6nPUc', 1714880592, 1714881184, NULL, 200, '{\"aftersale_order_list\":[{\"aftersale_order_id\":\"2000000461410155\",\"status\":13}],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05114313221244597b4b5445a0690c0000\",\"prepay_time\":1714880593,\"pay_time\":1714880600,\"transaction_id\":\"4307600956202405052225014361\"}', 9990, 9990, 0, NULL, '陶**', '210018', '江苏省', '南京市', '玄武区', '****', '199****6061', '', '19951926061', 'null', 0, 'e389beb4326308c27465df67347443e5', '[]', 0, 'of-7gCCdnYPV5MNNCBnlEad93OJsbNYsg6L4eYE35G2DSF8P46vda8XX2XDGHSbuw3Ik819eujIQ', '{\"predict_commission_fee\":0}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057242607617, 2, '3719631864896819456', 'oTci56-6X4j_LA4RkNHDIwcf-Ftg', 1714879698, 1714881565, NULL, 200, '{\"aftersale_order_list\":[{\"aftersale_order_id\":\"2000000461361268\",\"status\":13}],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx051128196745141d0919125a1299920001\",\"prepay_time\":1714879699,\"pay_time\":1714879708,\"transaction_id\":\"4347801086202405057172952617\"}', 9990, 9990, 0, NULL, '张**', '430014', '湖北省', '武汉市', '江岸区', '****', '153****4753', '', '', 'null', 0, '251b08a9fac95dcc13a90bf26dc7a59d', '[]', 0, 'ofBGPtEuAZdRoApr0etNKO0tALhHaesftNWei-US-LqA5688odSWs85m50sI5iP6q9esTAdXO0pQ', '{\"predict_commission_fee\":0}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057313910785, 2, '3719631857821552640', 'oTci565jaCWcbHcn8IEkbwGcgIq0', 1714879671, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05112752894216323c638abb5e0c420000\",\"prepay_time\":1714879673,\"pay_time\":1714879681,\"transaction_id\":\"4321700963202405055592435124\"}', 9990, 9990, 0, NULL, '邓**', '200333', '上海市', '上海市', '普陀区', '****', '150****8494', '', '', 'null', 0, '0ef19b8c4676fb859dfc114d1dd70f2f', '[{\"waybill_id\":\"73611068324740\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofS4hfM5rE6TSWpWfWG_09kFABSuH3tET-s_-VxstfmzqgacA-gcg4T0RkZ3f1_QONfNqYRDTuSw', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057393602562, 2, '3719630802894587136', 'oTci56yTyGHiR1MkQ3rdDthSDxs8', 1714875647, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05102048444074f78da72845c942460001\",\"prepay_time\":1714875648,\"pay_time\":1714875655,\"transaction_id\":\"4301400970202405058762940615\"}', 9990, 9990, 0, NULL, '廖**', '528400', '广东省', '中山市', '石岐区街道', '****', '136****5688', '', '', 'null', 0, '9623b4b9306bd90c934a61657067921a', '[{\"waybill_id\":\"73611068324604\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofwJA3SzcMUKiC9X4g1QlJUH2iaWH6m-Fyye_df58Q1Cxz3oGV-QDiUzN83imYsydxVUY5lrEB9Q', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057527820289, 2, '3719630104256712960', 'oTci56xiDZigZxCYfTKSpSXT6Tvs', 1714872982, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx050936233660315bb0c63bd05634270000\",\"prepay_time\":1714872983,\"pay_time\":1714872991,\"transaction_id\":\"4315201103202405051609869638\"}', 9990, 9990, 0, NULL, '侯**', '311200', '浙江省', '杭州市', '萧山区', '****', '185****3029', '', '', 'null', 0, '6da48e88729025e89cb7cc0196230af5', '[{\"waybill_id\":\"73611068324525\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofHTmkRoMt5ffRGWY5GxQZORIgrdaJkzq8_m_q3WQ8DHh9e_8Oi6L3GMWb7D-cJQKdRsBYmW-VdA', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057628483586, 2, '3719609573252662528', 'oTci567Uey7oSR1QR-bfoyb-oogM', 1714794662, 1714795563, NULL, 250, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"prepay_id\":\"up_wx041151038576758a3094d77dd75af70001\",\"prepay_time\":1714794664}', 9990, 9990, 0, NULL, '吕**', '200333', '上海市', '上海市', '普陀区', '****', '152****2015', '', '', 'null', 0, 'f30ce3965c796262f2653c3c7868953d', '[]', 0, 'ofxy9FxYC-Qj7cWe1Hdy7d_T64qAemLp5T7RZgw2okf7PWnlxU7n1MPzctDX-xZtNYf7SpRPffLg', '{\"predict_commission_fee\":0}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057733341185, 2, '3719609207888941056', 'oTci561cdcRmgu9LC7fuhTC2KZDo', 1714793268, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx04112749896102e6c7c82c097077fb0000\",\"prepay_time\":1714793270,\"pay_time\":1714793275,\"transaction_id\":\"4344501088202405048410251099\"}', 9990, 9990, 0, NULL, '朱**', '322000', '浙江省', '金华市', '义乌市', '****', '130****7068', '', '', 'null', 0, '23399086d10638828a7cc6758e1f57f6', '[{\"waybill_id\":\"73611068322959\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofAJAg33082uvirnNPy6UvESlcwDTRt9-nP7k0h51hK_uy5vYs63UbDgriNvUn7pJU5Z8ZFSY7Sg', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057792061442, 2, '3719608045550570496', 'oTci56_mnmDsnspHd_o1pdFxMyYs', 1714788834, 1714983118, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx04101356264587a370a7b255ee58220000\",\"prepay_time\":1714788836,\"pay_time\":1714788846,\"transaction_id\":\"4333800973202405048639385067\"}', 9990, 9990, 0, NULL, '老*', '300400', '天津市', '天津市', '北辰区', '****', '136****5987', '', '', 'null', 0, 'fb3640edbd9496e1c29186ea6f59f1e2', '[{\"waybill_id\":\"73611068329514\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983117,\"deliver_type\":1}]', 1714983117, 'ofbMZeC-SsLYYEwkBYwldGkYj09Ugwuo5G0fEMPRcCvI9hDwglE34HJBHhV-T1TQHuAmIMOK-UsA', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057859170306, 2, '3719607305622392832', 'oTci56yzAUABB6pTqNALQJfN0abk', 1714786012, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx04092653618057576501ea2b67ddd50001\",\"prepay_time\":1714786013,\"pay_time\":1714786022,\"transaction_id\":\"4331000950202405041318661925\"}', 9990, 9990, 0, NULL, '许**', '200030', '上海市', '上海市', '徐汇区', '****', '186****9879', '', '', 'null', 0, 'b1d6bdbdf2981082076696cbf9e751fa', '[{\"waybill_id\":\"73611068323266\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'of0IpgPtXnOq0TZI30xp0t6Hnpfr3O97l2XieeHYSLGX1qUWZnmadmqX0QSyA2wlT4Xc6ennDYhg', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057926279169, 2, '3719541152804638976', 'oTci56xaqRXPCRPfRzDUtxuZJSZ8', 1714533659, 1714697637, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx01112100729847fea6fdafc1704c820000\",\"prepay_time\":1714533660,\"pay_time\":1714533680,\"transaction_id\":\"4333901104202405015394319422\"}', 9990, 9990, 0, NULL, '王**', '130031', '吉林省', '长春市', '二道区', '****', '130****4298', '', '13069004298', 'null', 0, '0f62238c3bd1bad24ceabe674cc5cdbf', '[{\"waybill_id\":\"73611002395494\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'ofIRNqZCqBqEOCAA6Rh5sKt58nxz1OcChK14fjF7aiCQv3wF3Yjyk8oiBpsk0heVFdUu8qAm6Ifg', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451057989193729, 2, '3719539678347396352', 'oTci56wYmCTDuJ4ue-moWXT92HPE', 1714528034, 1714745479, NULL, 100, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx0109471569243797b50c10594f5e8f0001\",\"prepay_time\":1714528035,\"pay_time\":1714528054,\"transaction_id\":\"4349701099202405014937039682\"}', 9990, 9990, 0, NULL, '金**', '200135', '上海市', '上海市', '浦东新区', '****', '139****8081', '', '', 'null', 0, '77b3c31b2b4a868713b389017191e22e', '[{\"waybill_id\":\"73611002395318\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'of_c0fGfAQkqOZqu293F5yc7PbME_r8hjE80GgC-kMyQTEFj3D7uLzI54vdbuJBVo_A3NE3T1Agw', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058043719681, 2, '3719539645519627776', 'oTci56wYmCTDuJ4ue-moWXT92HPE', 1714527909, 1714528810, NULL, 250, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"prepay_id\":\"up_wx010945106537123355f2ead7cb142e0001\",\"prepay_time\":1714527910}', 9990, 9990, 0, NULL, '金**', '200135', '上海市', '上海市', '浦东新区', '****', '139****8081', '', '', 'null', 0, '77b3c31b2b4a868713b389017191e22e', '[]', 0, 'of1_iH2tIUsDV3KXhk1svg-cYzBFy480quEl_uTiPIHTEKbty0XsM3s8yS7zYPPhhrkKlYt2aSRg', '{\"predict_commission_fee\":0}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058127605762, 2, '3719539305125645313', 'oTci566M87SOPp9t4gt0FOAOkS9Y', 1714526611, 1714712410, NULL, 100, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx01092332254413e24d734dda95c4050001\",\"prepay_time\":1714526612,\"pay_time\":1714526623,\"transaction_id\":\"4337701108202405010523448017\"}', 9990, 9990, 0, NULL, '张*', '710004', '陕西省', '西安市', '新城区', '****', '133****8076', '', '', 'null', 0, '6f45a66533b814649894b1f164d70294', '[{\"waybill_id\":\"73611002395387\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'of6LTdryuGRHX5q6lLFMvrsQzgBgiuC4WL5siLy2FM-P0NaVGGmK18e_reU3-yVytK-lEUd3CoXg', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058186326018, 2, '3719539303409911296', 'oTci56yAxVf7oKTlnW7UbOMdPhuE', 1714526604, 1714737259, NULL, 100, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx010923254698878ffcdc29160c99740001\",\"prepay_time\":1714526605,\"pay_time\":1714526614,\"transaction_id\":\"4326200966202405017664125441\"}', 9990, 9990, 0, NULL, '侯*', '110031', '辽宁省', '沈阳市', '皇姑区', '****', '135****3408', '', '', 'null', 0, '081b534b88aeebfef16cfebed7e9b45e', '[{\"waybill_id\":\"73611002395438\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'of-GOTNJSemfmNl3doRG3ADLhd9rJumWqTVh0pVIaclreLy4kU-r_dLNuXgLMnZuXdm6RiA_jjCQ', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058228269058, 2, '3719520228905715200', 'oTci56zlEZt2Sw_gD78eJnTFpbdU', 1714453840, 1714454741, NULL, 250, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"prepay_id\":\"up_wx3013104207123594f733e51396d8d90000\",\"prepay_time\":1714453842}', 9990, 9990, 0, NULL, '安**', '264300', '山东省', '威海市', '荣成市', '****', '139****3719', '', '', 'null', 0, '59da071f50719e09f01a491b3c4315c6', '[]', 0, 'of76j3Y1qZfzJ7qnZcuXHBVsiEv_YGvumzBV0RRS9XGGtPy-mXi2XVWb9YP51amVHXxafUba-7Ig', '{\"predict_commission_fee\":0}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058282795010, 2, '3719520157597830144', 'oTci569yPmUpaaEDB0-gc_61_bQg', 1714453569, 1714705510, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx301306104568162ebb785c7203a7c70001\",\"prepay_time\":1714453570,\"pay_time\":1714453580,\"transaction_id\":\"4336700950202404301822641011\"}', 9990, 9990, 0, NULL, '勾**', '110200', '辽宁省', '沈阳市', '辽中区', '****', '130****0299', '', '', 'null', 0, 'c48111b669f63885475971cd00d81aa0', '[{\"waybill_id\":\"73610991878978\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714460708,\"deliver_type\":1}]', 1714460708, 'of5tnacXLYJ7k_JRfJUq85GlpAGlEu7KyFgjDirvw5lQ-hQ3hjeO1ZWItxFZpOdC-2HN7cXvBf2A', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058337320961, 2, '3719519937814465536', 'oTci561Dyp_40Q_i3l36a2OLirWU', 1714452730, 1714647910, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30125211642150cbd118620b179cd80001\",\"prepay_time\":1714452731,\"pay_time\":1714452747,\"transaction_id\":\"4350800963202404301894276925\"}', 9990, 9990, 0, NULL, '饶**', '430061', '湖北省', '武汉市', '武昌区', '****', '153****8831', '', '', 'null', 0, 'df443b7b536055c5fe650f92b6228df3', '[{\"waybill_id\":\"73610991879137\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714460708,\"deliver_type\":1}]', 1714460708, 'ofXIDtyH-kbHU90oiz0HZKqigOJviDHbfy6rmwuAvLLkIMgS82dLPX4RE_un9w48adpnZmzVDnuw', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058370875393, 2, '3719519606137030144', 'oTci568uIDQFQ4e5Ga00NQXmQ9Uc', 1714451465, 1714697969, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30123106363630bc2040a0467b90a20001\",\"prepay_time\":1714451466,\"pay_time\":1714451480,\"transaction_id\":\"4309201107202404302139171466\"}', 9990, 9990, 0, NULL, '陈**', '523000', '广东省', '东莞市', '中堂镇', '****', '130****1245', '', '', 'null', 0, '38dd665ed63e43daf07f8dbe090c0131', '[{\"waybill_id\":\"73610989601585\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453167,\"deliver_type\":1}]', 1714453167, 'ofLRybOEXAL4PRcsgIDOf8_UnYB8oHnhM_yTY0A1tFs_Kgs_cBxcdgfCvHW2aA5OjE0lVvPB97Dw', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058421207041, 2, '3719519603625955328', 'oTci564sE_0MrrIeKuN6zmoTePOA', 1714451455, 1714813169, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30123056815634f8d686831832aaf40000\",\"prepay_time\":1714451456,\"pay_time\":1714451464,\"transaction_id\":\"4313001088202404307373318969\"}', 9990, 9990, 0, NULL, '王**', '266100', '山东省', '青岛市', '崂山区', '****', '136****3948', '', '', 'null', 0, '7d6287d18fbf6a59f7c1375a7d5fb476', '[{\"waybill_id\":\"73610989601736\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453167,\"deliver_type\":1}]', 1714453167, 'of1JpdpO9xG2sxfhrvqIoZ7iVC9l_FauPBzV94Yoe8usahUFUyVl_fBHCk0OmuQk1h95No3QIDkQ', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058471538689, 2, '3719519600843559168', 'oTci5617Ek2kYfoh1ITAL6WOGgGU', 1714451445, 1714885171, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30123046157394a51a01b6bc7aab010001\",\"prepay_time\":1714451446,\"pay_time\":1714451455,\"transaction_id\":\"4335701114202404300011618746\"}', 9990, 9990, 0, NULL, '陈**', '514400', '广东省', '梅州市', '五华县', '****', '158****9887', '', '', 'null', 0, 'ebac3b596b79b553110c40135e6b2698', '[{\"waybill_id\":\"73610989601891\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453167,\"deliver_type\":1}]', 1714453167, 'of8FvFaFQ7KCggonIA7JxIlYq_cNp1zYRZXifUoYcug1_vBtghTtWm5QP2ePaHfK2k3tc9z2fHLw', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058538647554, 2, '3719519482018137600', 'oTci568uIDQFQ4e5Ga00NQXmQ9Uc', 1714450992, 1714697969, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx3012231342018305f098afaa80b4710001\",\"prepay_time\":1714450993,\"pay_time\":1714451006,\"transaction_id\":\"4320101110202404301218860173\"}', 3990, 890, 0, 3100, '陈**', '523000', '广东省', '东莞市', '中堂镇', '****', '130****1245', '', '', 'null', 0, '38dd665ed63e43daf07f8dbe090c0131', '[{\"waybill_id\":\"73610989601585\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000111746307\",\"sku_id\":\"2198803586\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453168,\"deliver_type\":1}]', 1714453168, 'ofNuRT7esXCFoI0V5mKKvPqZ7cQb85NfCDzG_U7g4vsz31Dr_BjXrihxSTZEcM9vnRZdOUA-Dt-w', '{\"predict_commission_fee\":8}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058584784898, 2, '3719518635971448832', 'oTci566RMss7nywmYedj2xhw1138', 1714447764, 1714622183, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30112925609856241bcbef965ef21a0001\",\"prepay_time\":1714447765,\"pay_time\":1714447801,\"transaction_id\":\"4328501115202404306928504907\"}', 9990, 9990, 0, NULL, '赵**', '710014', '陕西省', '西安市', '未央区', '****', '133****0691', '', '', 'null', 0, '8f32eb87a3e85178705ab54e350ba348', '[{\"waybill_id\":\"73610988706596\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'of4qbkRf3y3W9ilLM6NrYTRExiTYcRqcDLkFqdBTR_azBx8aalYn15ml3RbK7ou0Srrllek1fQ7w', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058635116546, 2, '3719518158959545344', 'oTci563sc2PSk0ZnDmh6rZlvryEE', 1714445944, 1714535782, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx301059059358676edac4b59314f3830001\",\"prepay_time\":1714445946,\"pay_time\":1714445960,\"transaction_id\":\"4314000957202404307168217552\"}', 9990, 9990, 0, NULL, '龚**', '475000', '河南省', '开封市', '龙亭区', '****', '158****2113', '', '', 'null', 0, '7d7e2964c99206f08f078bf51b5317da', '[{\"waybill_id\":\"73610988706506\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'ofR-obOLEyNvQwW-qEXr8WogeY8BhTAtd1HgiCS1PTSmNw9-nlgExJzN0kiGH9En7cBpGjee1Zvw', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058677059585, 2, '3719517933804327168', 'oTci565UymC1Yinw1X1v2VLcE03E', 1714445085, 1714607782, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30104447137134c2dd50d32b9e592d0001\",\"prepay_time\":1714445087,\"pay_time\":1714445094,\"transaction_id\":\"4310301091202404307004951062\"}', 9990, 9990, 0, NULL, '谭**', '510080', '广东省', '广州市', '白云区', '****', '199****3703', '', '', 'null', 0, 'e27ca827e7eb0ea8d1c69c62b479eafe', '[{\"waybill_id\":\"73610988706116\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'ofKTUD8p_EoEG8HIhKLu2-VAPQ2pN9f5s02haeV_Bja8hM6TwZy9AKdkgJujN-Nc731EYpKkYdFA', '{\"predict_commission_fee\":99}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1787451058756751361, 2, '3719517651511152896', 'oTci569gEFexljgK9lXxy-NMo_1c', 1714444009, 1715152963, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30102650200648ca736e2c92422beb0001\",\"prepay_time\":1714444010,\"pay_time\":1714444018,\"transaction_id\":\"4303801112202404305816754375\"}', 9990, 9990, 0, NULL, '胡**', '430080', '湖北省', '武汉市', '青山区', '****', '188****9606', '', '18871199606', 'null', 0, '03dc775d1a67f0366a8bc586f815ce90', '[{\"waybill_id\":\"73610988706391\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'ofs9B72VMq1tNhN0tTmE4sfKufM_tjMar_-u8_S_v8mGiyjnS6oLEZ0Z36BfhzEWHXid75BnBuOg', '{\"predict_commission_fee\":99}', 1, '2024-05-08 15:22:43', NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1797557230465679362, 2, '3720294016289213440', 'o9XkH4xuUXSPdAC3B2kRTYdcP9YM', 1717405606, 1717405624, 'o9a2459emkkI9wUWEV3nAWgRKxQQ', 20, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx031706471502046454d598dd1494330000\",\"prepay_time\":1717405607,\"pay_time\":1717405613,\"transaction_id\":\"4307502261202406033741322292\"}', 500, 500, 0, NULL, '刘*', '264001', '山东省', '烟台市', '芝罘区', '****', '151****6166', '', '', 'null', 0, 'be2a765e3b5bb57d17a9ba6ca75e4ad6', '[]', 0, 'ofWKEpTDpC3rstQnucuNCNLXca-iApUURgELSMImutP9Qv5xZkiS-LA_KdYj_ROrY6XYVbhTjkCQ', '{\"predict_commission_fee\":10}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1797557231401009154, 2, '3720293614579748864', 'o9XkH46_AqxdfnRqs0CPr_I3Hcpg', 1717404073, 1717404099, 'o9a245znUkrtTeqBl3SoUkN85SWs', 20, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx0316411519515292aac41f8ea2aebe0000\",\"prepay_time\":1717404075,\"pay_time\":1717404088,\"transaction_id\":\"4313302271202406039012768919\"}', 500, 500, 0, NULL, '张**', '050051', '河北省', '石家庄市', '新华区', '****', '155****6722', '', '', 'null', 0, 'f30f4ceef62addb1cf295b0516604ce5', '[]', 0, 'ofsImV3Lm0xhFeQwGa87XOpGlTgsGfydYn-YlJ_iaJWbLJe3S9KbfufHxi5zvbSUMv-OF5KUxNZw', '{\"predict_commission_fee\":15}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1797557232608968706, 2, '3720293547321459968', 'o9XkH43HJU24k6H8pXCmHr0ds0bg', 1717403817, 1717403835, 'o9a2452jTwJBAkNKnboqaruhHZoM', 20, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx0316365815689937b1ad5e7848bac20000\",\"prepay_time\":1717403818,\"pay_time\":1717403824,\"transaction_id\":\"4341602275202406038662383894\"}', 1000, 1000, 0, NULL, '王**', '300300', '天津市', '天津市', '东丽区', '****', '189****1121', '', '', 'null', 0, '4fd0fd42dee36ac0da4c6b0e4a1e42dd', '[]', 0, 'ofaYK1cOaMGBx4sqNV4wAYR7oS8Z3Y_4YBGvGucoIKcnI78B6cKrtfy66OOEMtgC87-MTtrh86-g', '{\"predict_commission_fee\":30}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1797557233342971905, 2, '3720293483479699456', 'o9XkH49SgJrM-wVjWaAHU_xbMCrA', 1717403573, 1717403596, 'o9a2451tdKxcsm-RDC6ps9jRlO28', 20, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx03163255074413488964d49f18e3710001\",\"prepay_time\":1717403575,\"pay_time\":1717403584,\"transaction_id\":\"4328102289202406030968217281\"}', 100, 100, 0, NULL, '张*', '271000', '山东省', '泰安市', '岱岳区', '****', '133****6752', '', '', 'null', 0, 'c5a8cf197b858169a187c52d557bcc0f', '[]', 0, 'ofiMjHhH0LlKLmTcuQvnTAl2OKQYObqd6mi7J3AMWwxXWIf4gQ7JWi-dY0k0GKyJQ8tFu7GzKb1A', '{\"predict_commission_fee\":2}', NULL, NULL, NULL, NULL, 0);
INSERT INTO `oms_wei_order` VALUES (1797557233938563073, 2, '3720293415509954816', 'o9XkH4zuadxRCuw_GArPyzrNeE8k', 1717403314, 1717403332, 'o9a2451WSrYjcvuOY7L1-eZoLiYA', 20, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx0316283529560425a5ef89cc0802d90001\",\"prepay_time\":1717403315,\"pay_time\":1717403322,\"transaction_id\":\"4322202271202406031768098083\"}', 100, 100, 0, NULL, '宣**', '200135', '上海市', '上海市', '浦东新区', '****', '137****3840', '', '', 'null', 0, '213ee87f2f991566a3961d6cf70195b7', '[]', 0, 'ofJszy4c69wfdWayBcaWutYd1Av_iTf8mEDf_PDSQl2NkruOmd40eeliAF5vvLCxkzZjsjIzslyg', '{\"predict_commission_fee\":3}', NULL, NULL, 'ZTO', '73611699835312', 2);
INSERT INTO `oms_wei_order` VALUES (1797557234437685250, 2, '3720293313330939136', 'o9XkH4wvo4witHYz40GKXuX4SBGA', 1717402924, 1717403824, 'o9a2452HfxRPPJsK_0kukxICkpg8', 250, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"prepay_id\":\"up_wx03162205728625595e7204442a2fbf0000\",\"prepay_time\":1717402925}', 1000, 1000, 0, NULL, '欧**', '510030', '广东省', '广州市', '越秀区', '****', '188****4438', '', '', 'null', 0, 'd4d45041d91bcc833dfa92ee04b35a39', '[]', 0, 'of7Gdkvf2kRj444XFf1R-s91R1py32uorOxoseqv-bSH8_pYTMAQzWm4V205amzyTZ_ezSw76pzQ', '{\"predict_commission_fee\":0}', NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for oms_wei_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_order_item`;
CREATE TABLE `oms_wei_order_item`  (
  `id` bigint NOT NULL,
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单id（平台订单id）',
  `product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品spuid',
  `sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品skuid\r\n',
  `thumb_img` varchar(550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku小图',
  `sku_cnt` int NULL DEFAULT NULL COMMENT 'sku数量',
  `sale_price` int NULL DEFAULT NULL COMMENT '售卖单价（单位：分）',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `on_aftersale_sku_cnt` int NULL DEFAULT NULL COMMENT '正在售后/退款流程中的 sku 数量',
  `finish_aftersale_sku_cnt` int NULL DEFAULT NULL COMMENT '完成售后/退款的 sku 数量',
  `sku_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `market_price` int NULL DEFAULT NULL COMMENT '市场单价（单位：分）',
  `sku_attrs` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku属性JSON',
  `real_price` int NULL DEFAULT NULL COMMENT 'sku实付总价，取estimate_price和change_price中较小值',
  `out_product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品外部spuid',
  `out_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品外部skuid',
  `is_discounted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否有优惠金额，非必填，默认为false',
  `estimate_price` int NULL DEFAULT NULL COMMENT '优惠后sku总价，非必填，is_discounted为true时有值',
  `is_change_price` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否修改过价格，非必填，默认为false',
  `change_price` int NULL DEFAULT NULL COMMENT '改价后sku总价，非必填，is_change_price为true时有值',
  `out_warehouse_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域库存id',
  `sku_deliver_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品发货信息JSON',
  `extra_service` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品额外服务信息JSON',
  `use_deduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否使用了会员积分抵扣\r\n',
  `deduction_price` int NULL DEFAULT NULL COMMENT '会员积分抵扣金额，单位为分',
  `order_product_coupon_info_list` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品优惠券信息，逐步替换 order.order_detail.coupon_info',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_wei_order_item
-- ----------------------------
INSERT INTO `oms_wei_order_item` VALUES (1787451057062252545, 2, '3719632105698365440', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057141944322, 2, '3719632099578611200', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057196470274, 2, '3719632099131658496', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 1, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057259384833, 2, '3719631864896819456', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 1, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057326493697, 2, '3719631857821552640', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057473294337, 2, '3719630802894587136', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057552986113, 2, '3719630104256712960', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057674620929, 2, '3719609573252662528', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057741729794, 2, '3719609207888941056', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057813032961, 2, '3719608045550570496', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057867558913, 2, '3719607305622392832', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057943056386, 2, '3719541152804638976', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057997582337, 2, '3719539678347396352', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058064691201, 2, '3719539645519627776', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058144382978, 2, '3719539305125645313', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058194714626, 2, '3719539303409911296', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058245046274, 2, '3719520228905715200', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058299572225, 2, '3719520157597830144', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058345709570, 2, '3719519937814465536', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058387652610, 2, '3719519606137030144', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058437984258, 2, '3719519603625955328', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058509287426, 2, '3719519600843559168', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058551230466, 2, '3719519482018137600', '10000111746307', '2198803586', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/65ec1433000821ae1f038c66db60b01e000000a000004f50', 1, 3990, '泷御堂冲饮谷物 赤小豆薏米芡实330g*罐', 0, 0, '', 3990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"1罐体验装【贵在运费】(5%人选择)\"}]', 890, NULL, NULL, 'true', 890, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":0,\"freight_insurance\":1}', 'null', NULL, '[{\"user_coupon_id\":\"5215692320178179\"}]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058597367810, 2, '3719518635971448832', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058643505153, 2, '3719518158959545344', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058693836801, 2, '3719517933804327168', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058773528578, 2, '3719517651511152896', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557230960607234, 2, '3720294016289213440', '10000128752685', '2304653289', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f02d3000577bc183b254de97c0d15000000a000004f50', 5, 100, '乾佑 雪梨片', 0, 0, '', 100, '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"}]', 500, NULL, NULL, 'false', 500, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557231921102850, 2, '3720293614579748864', '10000128693777', '2304555042', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f051f000ac91c17542e128e89bc1e000000a000004f50', 5, 100, '无沙 桑葚  50克/袋', 0, 0, '', 100, '[{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"}]', 500, NULL, NULL, 'false', 500, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557232864821250, 2, '3720293547321459968', '10000128693777', '2304555042', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f051f000ac91c17542e128e89bc1e000000a000004f50', 10, 100, '无沙 桑葚  50克/袋', 0, 0, '', 100, '[{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"}]', 1000, NULL, NULL, 'false', 1000, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557233531715585, 2, '3720293483479699456', '10000128752685', '2304653289', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f02d3000577bc183b254de97c0d15000000a000004f50', 1, 100, '乾佑 雪梨片', 0, 0, '', 100, '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"}]', 100, NULL, NULL, 'false', 100, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557234165055489, 2, '3720293415509954816', '10000128693777', '2304555042', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f051f000ac91c17542e128e89bc1e000000a000004f50', 1, 100, '无沙 桑葚  50克/袋', 0, 0, '', 100, '[{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"}]', 100, NULL, NULL, 'false', 100, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557234727092226, 2, '3720293313330939136', '10000128693777', '2304555042', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f051f000ac91c17542e128e89bc1e000000a000004f50', 10, 100, '无沙 桑葚  50克/袋', 0, 0, '', 100, '[{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"}]', 1000, NULL, NULL, 'false', 1000, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');

-- ----------------------------
-- Table structure for oms_wei_refund
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_refund`;
CREATE TABLE `oms_wei_refund`  (
  `id` bigint NOT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `after_sale_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后单号',
  `status` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后单当前状态，参考：\r\nUSER_CANCELD	用户取消申请\r\nMERCHANT_PROCESSING	商家受理中\r\nMERCHANT_REJECT_REFUND	商家拒绝退款\r\nMERCHANT_REJECT_RETURN	商家拒绝退货退款\r\nUSER_WAIT_RETURN	待买家退货\r\nRETURN_CLOSED	退货退款关闭\r\nMERCHANT_WAIT_RECEIPT	待商家收货\r\nMERCHANT_OVERDUE_REFUND	商家逾期未退款\r\nMERCHANT_REFUND_SUCCESS	退款完成\r\nMERCHANT_RETURN_SUCCESS	退货退款完成\r\nPLATFORM_REFUNDING	平台退款中\r\nPLATFORM_REFUND_FAIL	平台退款失败\r\nUSER_WAIT_CONFIRM	待用户确认\r\nMERCHANT_REFUND_RETRY_FAIL	商家打款失败，客服关闭售后\r\nMERCHANT_FAIL	售后关闭\r\nUSER_WAIT_CONFIRM_UPDATE	待用户处理商家协商\r\nUSER_WAIT_HANDLE_MERCHANT_AFTER_SALE	待用户处理商家代发起的售后申请',
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家身份标识',
  `unionid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家在开放平台的唯一标识符，若当前视频号小店已绑定到微信开放平台账号下会返回',
  `product_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品spuid',
  `sku_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品skuid',
  `count` int NULL DEFAULT NULL COMMENT '售后数量',
  `fast_refund` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否极速退款RefundInfo',
  `refund_reason` int NULL DEFAULT NULL COMMENT '标明售后单退款直接原因, 枚举值参考 RefundReason',
  `refund_amount` int NULL DEFAULT NULL COMMENT '退款金额（分）',
  `return_waybill_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `return_delivery_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司id',
  `return_delivery_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司名称',
  `merchant_upload_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '售后相关商品信息JSON',
  `create_time` int NULL DEFAULT NULL COMMENT '售后单创建时间戳',
  `update_time` int NULL DEFAULT NULL COMMENT '售后单更新时间戳',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原因',
  `reason_text` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原因解释',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后类型。REFUND:退款；RETURN:退货退款。',
  `order_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号，该字段可用于获取订单',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'detail json',
  `complaint_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纠纷id，该字段可用于获取纠纷信息',
  `refund_resp` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信支付退款的响应',
  `pull_status` int NULL DEFAULT NULL COMMENT '推送状态（0未推送；1推送成功；2推送失败）',
  `pull_time` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频号小店退款' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_wei_refund
-- ----------------------------
INSERT INTO `oms_wei_refund` VALUES (1787746259370975234, 2, '2000000461361268', 'MERCHANT_REFUND_SUCCESS', 'oTci56-6X4j_LA4RkNHDIwcf-Ftg', NULL, '10000114346861', '2239632777', 1, 'true', 4, 9990, '', '', '', '{\"reject_reason\":\"\",\"refund_certificates\":[]}', 1714881502, 1714881513, '10000000', '不想要了', 'REFUND', '3719631864896819456', '{\"desc\":\"\",\"receive_product\":false,\"prove_imgs\":[],\"tel_number\":\"15337124753\",\"media_id_list\":[]}', '0', '{\"code\":\"\",\"ret\":0,\"message\":\"\"}', NULL, NULL);
INSERT INTO `oms_wei_refund` VALUES (1787746259496804354, 2, '2000000461410155', 'MERCHANT_REFUND_SUCCESS', 'oTci56xFJpSZmNaWM1w_o2Z6nPUc', NULL, '10000114346861', '2239632777', 1, 'true', 4, 9990, '', '', '', '{\"reject_reason\":\"\",\"refund_certificates\":[]}', 1714881120, 1714881142, '10000059', '拍错/少用优惠', 'REFUND', '3719632099131658496', '{\"desc\":\"\",\"receive_product\":false,\"prove_imgs\":[],\"tel_number\":\"19951926061\",\"media_id_list\":[]}', '0', '{\"code\":\"\",\"ret\":0,\"message\":\"\"}', NULL, NULL);
INSERT INTO `oms_wei_refund` VALUES (1788119147705950209, 2, '2000000476685963', 'MERCHANT_PROCESSING', 'oTci56-icFjAKlQ-2KXeCxM38M7M', NULL, '10000113792713', '2231619925', 1, 'false', NULL, 9990, '', '', '', '{\"reject_reason\":\"\",\"refund_certificates\":[]}', 1715080222, 1715080222, '10000021', '质量问题', 'RETURN', '3719496358260248576', '{\"desc\":\"收到了冲一遍就没有味儿了\",\"receive_product\":true,\"prove_imgs\":[],\"tel_number\":\"18341693403\",\"media_id_list\":[\"LGa74OroReJJ8cb6ouPvbv1da72vrvKNQMK48Ei7WXgaUMc2Y_qkjcavzCmZMD1lvSOM2oFk5uO6Xzw0-nswBw\"]}', '0', '{\"code\":\"\",\"ret\":0,\"message\":\"\"}', 1, '2024-05-08 16:10:01');

-- ----------------------------
-- Table structure for oms_wei_waybill_account
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_waybill_account`;
CREATE TABLE `oms_wei_waybill_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `seller_shop_id` bigint NULL DEFAULT NULL COMMENT '平台店铺id，全局唯一，一个店铺分配一个shop_id',
  `delivery_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司编码',
  `company_type` int NULL DEFAULT NULL COMMENT '快递公司类型1：加盟型 2：直营型',
  `site_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点编码',
  `site_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点名称',
  `acct_id` bigint NULL DEFAULT NULL COMMENT '电子面单账号id，每绑定一个网点分配一个acct_id',
  `acct_type` int NULL DEFAULT NULL COMMENT '面单账号类型0：普通账号 1：共享账号',
  `status` int NULL DEFAULT NULL COMMENT '面单账号状态',
  `available` int NULL DEFAULT NULL COMMENT '面单余额',
  `allocated` int NULL DEFAULT NULL COMMENT '累积已取单',
  `cancel` int NULL DEFAULT NULL COMMENT '累计已取消',
  `recycled` int NULL DEFAULT NULL COMMENT '累积已回收',
  `monthly_card` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月结账号，company_type 为直营型时有效',
  `site_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '网点信息JSON',
  `sender_province` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称（一级地址）',
  `sender_city` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称（二级地址）',
  `sender_county` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sender_street` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sender_address` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `mobile` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货手机号',
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货固定电话',
  `is_show` int NULL DEFAULT NULL COMMENT '是否前台显示1显示0不显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频号小店电子面单账户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_wei_waybill_account
-- ----------------------------
INSERT INTO `oms_wei_waybill_account` VALUES (1, 2, 5009820308512, 'ZTO', 1, '55830', '亳州', 6620708429, 0, 3, 535, 0, 0, 32, '', '{\"address\":{\"city_code\":\"341600000\",\"city_name\":\"亳州市\",\"country_code\":\"1\",\"detail_address\":\"夏侯渊路\",\"district_code\":\"341602000\",\"district_name\":\"谯城区\",\"province_code\":\"340000000\",\"province_name\":\"安徽省\",\"street_code\":\"341602400\",\"street_name\":\"亳州市经济开发区\"},\"contact\":{\"mobile\":\"13805678799\",\"name\":\"侯保会\",\"phone\":\"\"},\"delivery_id\":\"ZTO\",\"site_code\":\"55830\",\"site_fullname\":\"安徽省亳州市谯城区亳州\",\"site_name\":\"亳州\",\"site_status\":1}', '安徽省', '亳州市', '谯城区', '亳州市经济开发区', '花戏楼街道神龙谷交易中心', '启航', '13630005333', NULL, 1);
INSERT INTO `oms_wei_waybill_account` VALUES (2, 2, 5009820308512, 'STO', 1, '236800', '安徽亳州公司', 6620670016, 0, 3, 45, 0, 0, 0, '', '{\"address\":{\"city_code\":\"341600000\",\"city_name\":\"亳州市\",\"detail_address\":\"芍花路与庄周路交叉口安徽盛荣电子产业园\",\"district_code\":\"341602000\",\"district_name\":\"谯城区\",\"province_code\":\"340000000\",\"province_name\":\"安徽省\",\"street_code\":\"\",\"street_name\":\"\"},\"contact\":{\"mobile\":\"13155671169\",\"name\":\"王波\",\"phone\":\"13155671169\"},\"delivery_id\":\"STO\",\"site_code\":\"236800\",\"site_fullname\":\"安徽亳州公司\",\"site_name\":\"安徽亳州公司\",\"site_status\":1}', '甘肃省', '定西市', '陇西县', '', '首阳镇首阳村十社', NULL, NULL, NULL, 1);
INSERT INTO `oms_wei_waybill_account` VALUES (3, 2, 5009820308512, 'JTSD', 1, '8932206', '定西市陇西网点', 6620699387, 0, 3, 0, 0, 0, 0, '', '{\"address\":{\"city_code\":\"621100000\",\"city_name\":\"定西市\",\"detail_address\":\"甘肃省定西市陇西县巩昌镇景家桥2号楼23号商铺\",\"district_code\":\"621122000\",\"district_name\":\"陇西县\",\"province_code\":\"620000000\",\"province_name\":\"甘肃省\",\"street_code\":\"\",\"street_name\":\"\"},\"contact\":{\"mobile\":\"13830269211\",\"name\":\"范世明\",\"phone\":\"13830269211\"},\"delivery_id\":\"JTSD\",\"site_code\":\"8932206\",\"site_fullname\":\"定西市陇西网点\",\"site_name\":\"定西市陇西网点\",\"site_status\":1}', '甘肃省', '定西市', '陇西县', '', '首阳镇首阳村十社', NULL, NULL, NULL, 1);
INSERT INTO `oms_wei_waybill_account` VALUES (4, 2, 5009820308512, 'YTO', 1, '558320', '安徽省亳州市涡阳县', 6620669487, 0, 3, 10, 632, 7, 10, '', '{\"address\":{\"city_code\":\"341600000\",\"city_name\":\"亳州市\",\"country_code\":\"CHN\",\"detail_address\":\"工业园集聚区6号仓库\",\"district_code\":\"341621000\",\"district_name\":\"涡阳县\",\"province_code\":\"340000000\",\"province_name\":\"安徽省\"},\"contact\":{\"mobile\":\"18205678088\",\"name\":\"李泉\",\"phone\":\"18205678088\"},\"delivery_id\":\"YTO\",\"site_code\":\"558320\",\"site_fullname\":\"安徽省亳州市涡阳县\",\"site_name\":\"安徽省亳州市涡阳县\",\"site_status\":1}', '安徽省', '亳州市', '谯城区', NULL, '十九里镇康美中药城', NULL, NULL, NULL, 1);
INSERT INTO `oms_wei_waybill_account` VALUES (5, 2, 5009820308512, 'ZTO', 1, '56102', '亳州十九里镇', 6620689421, 0, 3, 0, 0, 0, 0, '', '{\"address\":{\"city_code\":\"341600000\",\"city_name\":\"亳州市\",\"country_code\":\"1\",\"detail_address\":\"百货街西头\",\"district_code\":\"341602000\",\"district_name\":\"谯城区\",\"province_code\":\"340000000\",\"province_name\":\"安徽省\",\"street_code\":\"341602109\",\"street_name\":\"十九里镇\"},\"contact\":{\"mobile\":\"18756286555\",\"name\":\"李昔豪\",\"phone\":\"\"},\"delivery_id\":\"ZTO\",\"site_code\":\"56102\",\"site_fullname\":\"安徽省亳州市谯城区亳州十九里镇\",\"site_name\":\"亳州十九里镇\",\"site_status\":1}', '安徽省', '亳州市', '谯城区', '十九里镇', '十九里镇文化小区', NULL, NULL, NULL, 1);
INSERT INTO `oms_wei_waybill_account` VALUES (6, 2, 5009820308512, 'YTO', 1, '558300', '安徽省亳州市', 6620691495, 0, 5, 0, 0, 0, 0, '', '{\"address\":{\"city_code\":\"341600000\",\"city_name\":\"亳州市\",\"country_code\":\"CHN\",\"detail_address\":\"合欢路与漆园路交叉口东南100米\",\"district_code\":\"341602000\",\"district_name\":\"谯城区\",\"province_code\":\"340000000\",\"province_name\":\"安徽省\"},\"contact\":{\"mobile\":\"18005671555\",\"name\":\"王体珊\",\"phone\":\"18005671555\"},\"delivery_id\":\"YTO\",\"site_code\":\"558300\",\"site_fullname\":\"安徽省亳州市\",\"site_name\":\"安徽省亳州市\",\"site_status\":1}', '安徽省', '亳州市', '谯城区', NULL, '十九里镇康美中药城', NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for s_kwai_order
-- ----------------------------
DROP TABLE IF EXISTS `s_kwai_order`;
CREATE TABLE `s_kwai_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'dc订单id',
  `oid` bigint NOT NULL COMMENT '快手订单id',
  `createTime` bigint NOT NULL DEFAULT 0 COMMENT '创建时间',
  `discountFee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '折扣价格',
  `expressFee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '运费',
  `num` int NOT NULL COMMENT 'sku数量',
  `consignee` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '收件人姓名',
  `mobile` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `payTime` bigint NOT NULL DEFAULT 0 COMMENT '支付时间',
  `buyerRemark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '买家备注',
  `sellerRemark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '卖家备注',
  `status` int NOT NULL DEFAULT 0 COMMENT '订单状态',
  `refund` int NOT NULL DEFAULT 0 COMMENT '是否退款 0未退款 1该订单申请过退款',
  `totalFee` decimal(10, 2) NOT NULL COMMENT '子订单商品总价',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '市',
  `district` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '区',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `logisticsCompany` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `logisticsCompanyCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '快递公司编码',
  `logisticsCode` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `auditStatus` int NOT NULL DEFAULT 0 COMMENT '订单审核状态（0待审核1已审核）',
  `createOn` bigint NOT NULL DEFAULT 0 COMMENT '创建时间',
  `sendStatus` int NULL DEFAULT 0 COMMENT '发货状态（0待出库1拣货中2已拣货3已出库4已发货）',
  `sendTime` bigint NULL DEFAULT NULL COMMENT '发货时间（仓库真实发货时间）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '快手订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_kwai_order
-- ----------------------------

-- ----------------------------
-- Table structure for s_kwai_orders_item
-- ----------------------------
DROP TABLE IF EXISTS `s_kwai_orders_item`;
CREATE TABLE `s_kwai_orders_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id，自增',
  `itemId` bigint NOT NULL COMMENT '快手子订单id',
  `orderId` bigint NOT NULL COMMENT '订单ID',
  `erpGoodsId` int NOT NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `erpGoodsSpecId` int NOT NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  `itemTitle` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称',
  `itemPicUrl` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goodsNum` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品编码',
  `goodsSpec` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品规格',
  `skuNick` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品规格编码',
  `price` double NOT NULL COMMENT '商品单价',
  `num` int NOT NULL COMMENT '商品数量',
  `refundId` bigint NOT NULL COMMENT '退货Id',
  `refundStatus` int NOT NULL COMMENT '退货状态',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isGift` int NOT NULL DEFAULT 0 COMMENT '是否赠品0:否1:是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_kwai_orders_item
-- ----------------------------

-- ----------------------------
-- Table structure for s_shop
-- ----------------------------
DROP TABLE IF EXISTS `s_shop`;
CREATE TABLE `s_shop`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺名',
  `nick_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺别名',
  `ename` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标识',
  `company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺主题',
  `platform` int NOT NULL COMMENT '对应第三方平台Id',
  `shop_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺url',
  `order_num` int NOT NULL DEFAULT 9 COMMENT '排序',
  `is_delete` int NOT NULL DEFAULT 0 COMMENT '是否删除0否1是',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `seller_shop_id` bigint NOT NULL DEFAULT 0 COMMENT '第三方平台店铺id',
  `app_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Appkey(微信视频号小店专用)',
  `app_sercet` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Appsercet(微信视频号小店专用)',
  `access_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '第三方平台sessionKey（access_token）',
  `access_expires_in` bigint NULL DEFAULT NULL COMMENT 'accessToken到期（秒）',
  `access_token_begin` bigint NULL DEFAULT NULL COMMENT 'access_token开始时间',
  `refresh_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刷新token',
  `refresh_token_timeout` bigint NULL DEFAULT NULL COMMENT '刷新token过期时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电商平台店铺表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_shop
-- ----------------------------
INSERT INTO `s_shop` VALUES (1, '其他渠道', 'aaa', NULL, NULL, 99, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, NULL, 0, '2024-06-04 11:19:49', '2024-06-04 15:07:44');
INSERT INTO `s_shop` VALUES (2, '视频号店铺-测试', '视频号-梦小妮', 'wei', '煜梦服饰', 2, NULL, 0, 0, '', 100061591, 'wx720ff3dc86188107', 'b2fd7647ebcd88860de8087eb3ac4254', '', 0, 0, NULL, 0, '2024-06-04 11:19:54', '2024-06-04 12:33:00');
INSERT INTO `s_shop` VALUES (3, '测试京东POP', '拼多多-梦小妮', 'jd', '煜梦服饰', 3, NULL, 0, 0, '', 10706, NULL, NULL, '', 0, 0, NULL, 0, '2024-06-04 11:19:58', NULL);
INSERT INTO `s_shop` VALUES (4, '梦小妮牛仔裤-淘宝', '淘宝-梦小妮', 'taobao', '煜梦服饰', 4, NULL, 0, 0, '', 2200787809358, NULL, NULL, '', 0, 0, NULL, 0, '2024-06-04 11:20:01', NULL);
INSERT INTO `s_shop` VALUES (5, '启航牛ERP系统', '启航牛ERP系统-拼多多', 'pdd', '煜梦服饰', 5, NULL, 0, 0, '', 100061591, NULL, NULL, '', 0, 0, NULL, 0, '2024-06-04 11:20:04', '2024-09-01 19:02:17');
INSERT INTO `s_shop` VALUES (6, '梦小妮牛仔裤-抖店', '抖音-梦小妮', 'douyin', '华衣云商', 6, NULL, 0, 0, NULL, 90158786, NULL, NULL, '', 0, 0, NULL, 0, '2024-06-04 11:20:07', NULL);
INSERT INTO `s_shop` VALUES (7, '珍姐姐de衣柜的店-小红书', '启航家常菜的店-小红书', 'xhs', '启航', 7, NULL, 0, 0, NULL, 21, NULL, NULL, '', 0, 0, NULL, 0, '2024-06-04 11:20:10', NULL);
INSERT INTO `s_shop` VALUES (8, '梦小妮牛仔裤-快手', '快手小店', 'kuaishou', '华衣云商', 8, NULL, 0, 0, '1', 12, NULL, NULL, NULL, 0, 0, NULL, 0, '2024-06-04 11:20:13', '2024-06-04 12:07:55');

-- ----------------------------
-- Table structure for s_shop_platform
-- ----------------------------
DROP TABLE IF EXISTS `s_shop_platform`;
CREATE TABLE `s_shop_platform`  (
  `id` int NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '平台名',
  `app_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'appKey',
  `app_secret` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'appSecret',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `server_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务url',
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回调url',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '电商平台配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_shop_platform
-- ----------------------------
INSERT INTO `s_shop_platform` VALUES (1, '1688', '', '', '1688开放平台', 'http://api.1688.com', 'http://qihangerp.cn', NULL, '2024-06-04 11:10:58');
INSERT INTO `s_shop_platform` VALUES (2, '视频号', ' ', ' ', NULL, 'https://api.weixin.qq.com/', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (3, '京东POP', '', '', NULL, NULL, 'http://qihangerp.cn', NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (4, '淘宝天猫', '', '', '淘宝开放平台', 'http://gw.api.taobao.com/router/rest', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (5, '拼多多', '', '', '拼多多开放平台', 'https://gw-api.pinduoduo.com/api/router', 'http://qihangerp.cn:8099/home', NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (6, '抖店', '', '', NULL, 'https://openapi-fxg.jinritemai.com', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (7, '小红书', '', '', NULL, 'https://ark.xiaohongshu.com/ark/open_api/v3/common_controller', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (8, '快手', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (99, 'ERP系统', '', '', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for s_shop_pull_lasttime
-- ----------------------------
DROP TABLE IF EXISTS `s_shop_pull_lasttime`;
CREATE TABLE `s_shop_pull_lasttime`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `pull_type` enum('ORDER','REFUND') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型（ORDER:订单，REFUND:退款）',
  `lasttime` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2128068612 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺更新最后时间记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_shop_pull_lasttime
-- ----------------------------
INSERT INTO `s_shop_pull_lasttime` VALUES (1, 1, 'ORDER', '2024-04-09 16:23:00', '2024-03-23 15:56:13', '2024-04-09 16:23:00');
INSERT INTO `s_shop_pull_lasttime` VALUES (2, 1, 'REFUND', '2024-04-09 17:43:00', '2024-03-24 13:03:54', '2024-04-09 17:43:00');
INSERT INTO `s_shop_pull_lasttime` VALUES (3, 2, 'ORDER', '2024-04-09 19:44:00', '2024-03-10 13:00:07', '2024-04-09 19:44:00');
INSERT INTO `s_shop_pull_lasttime` VALUES (4, 2, 'REFUND', '2024-04-10 23:35:56', '2024-03-24 13:50:24', '2024-04-11 11:35:58');
INSERT INTO `s_shop_pull_lasttime` VALUES (5, 4, 'ORDER', '2024-06-13 15:30:58', '2024-06-13 14:53:16', '2024-06-13 15:31:02');
INSERT INTO `s_shop_pull_lasttime` VALUES (6, 6, 'ORDER', '2024-05-25 15:27:38', '2024-05-10 10:23:23', '2024-06-19 15:12:01');
INSERT INTO `s_shop_pull_lasttime` VALUES (2128068611, 4, 'REFUND', '2024-06-20 08:56:07', '2024-06-20 08:56:45', NULL);

-- ----------------------------
-- Table structure for s_shop_pull_logs
-- ----------------------------
DROP TABLE IF EXISTS `s_shop_pull_logs`;
CREATE TABLE `s_shop_pull_logs`  (
  `id` bigint NOT NULL COMMENT '主键Id',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `shop_type` int NOT NULL COMMENT '平台id',
  `pull_type` enum('ORDER','REFUND','GOODS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型（ORDER订单，GOODS商品，REFUND退款）',
  `pull_way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拉取方式（主动拉取、定时任务）',
  `pull_params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拉取参数',
  `pull_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '拉取结果',
  `pull_time` datetime NULL DEFAULT NULL COMMENT '拉取时间',
  `duration` bigint NULL DEFAULT NULL COMMENT '耗时（毫秒）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺更新日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_shop_pull_logs
-- ----------------------------
INSERT INTO `s_shop_pull_logs` VALUES (1800363757492686849, 4, 4, 'GOODS', '主动拉取', '{PageNo:1,PageSize:100}', '{successTotal:67}', '2024-06-11 11:05:35', 8949);
INSERT INTO `s_shop_pull_logs` VALUES (1801145794080260098, 4, 4, 'ORDER', '主动拉取', '{startTime:2024-06-12T14:51:59.107741300,endTime:2024-06-13T14:51:59.107741300}', '{insert:75,update:9,fail:0}', '2024-06-13 14:51:59', 76579);
INSERT INTO `s_shop_pull_logs` VALUES (1801147727423606786, 4, 4, 'ORDER', '主动拉取', '{startTime:2024-06-13T13:51:59,endTime:2024-06-13T15:00:26.824042500}', '{insert:0,update:4,fail:0}', '2024-06-13 15:00:27', 29766);
INSERT INTO `s_shop_pull_logs` VALUES (1801148172342792194, 4, 4, 'ORDER', '主动拉取', '{startTime:2024-06-13T14:00:27,endTime:2024-06-13T15:02:32.864323100}', '{insert:0,update:3,fail:0}', '2024-06-13 15:02:33', 9804);
INSERT INTO `s_shop_pull_logs` VALUES (1801148694571388930, 4, 4, 'ORDER', '主动拉取', '{startTime:2024-06-13T14:02:33,endTime:2024-06-13T15:04:46.705654400}', '{insert:0,update:3,fail:0}', '2024-06-13 15:04:47', 468);
INSERT INTO `s_shop_pull_logs` VALUES (1801151495233998850, 4, 4, 'ORDER', '主动拉取', '{startTime:2024-06-13T14:04:47,endTime:2024-06-13T15:15:54.368214700}', '{insert:0,update:3,fail:0}', '2024-06-13 15:15:54', 534);
INSERT INTO `s_shop_pull_logs` VALUES (1801152518874861570, 4, 4, 'ORDER', '主动拉取', '{startTime:2024-06-13T14:15:54,endTime:2024-06-13T15:19:58.532769600}', '{insert:0,update:2,fail:0}', '2024-06-13 15:19:59', 431);
INSERT INTO `s_shop_pull_logs` VALUES (1801153650531635202, 4, 4, 'ORDER', '主动拉取', '{startTime:2024-06-13T14:19:59,endTime:2024-06-13T15:24:28.077552900}', '{insert:3,update:0,fail:0}', '2024-06-13 15:24:28', 648);
INSERT INTO `s_shop_pull_logs` VALUES (1801155298842894337, 4, 4, 'ORDER', '主动拉取', '{startTime:2024-06-13T14:24:28,endTime:2024-06-13T15:30:57.981538400}', '{insert:3,update:0,fail:0}', '2024-06-13 15:30:58', 3836);
INSERT INTO `s_shop_pull_logs` VALUES (1803318846293458945, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-10 09:27:38,endTime:2024-05-11 09:27:38}', '{insert:0,update:3,fail:0}', '2024-06-19 14:48:08', 3572);
INSERT INTO `s_shop_pull_logs` VALUES (1803318931274252289, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-11 08:27:38,endTime:2024-05-12 08:27:38}', '{insert:0,update:3,fail:0}', '2024-06-19 14:48:31', 456);
INSERT INTO `s_shop_pull_logs` VALUES (1803318999888871426, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-12 07:27:38,endTime:2024-05-13 07:27:38}', '{insert:0,update:3,fail:0}', '2024-06-19 14:48:48', 474);
INSERT INTO `s_shop_pull_logs` VALUES (1803319288897388546, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-13 06:27:38,endTime:2024-05-14 06:27:38}', '{insert:0,update:3,fail:0}', '2024-06-19 14:49:13', 44010);
INSERT INTO `s_shop_pull_logs` VALUES (1803320761299406849, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-14 05:27:38,endTime:2024-05-15 05:27:38}', '无订单可以更新', '2024-06-19 14:55:19', 28366);
INSERT INTO `s_shop_pull_logs` VALUES (1803321110533935105, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-14 05:27:38,endTime:2024-05-15 05:27:38}', '无订单可以更新', '2024-06-19 14:56:14', 57810);
INSERT INTO `s_shop_pull_logs` VALUES (1803321780238442498, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-14 05:27:38,endTime:2024-05-15 05:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 14:59:31', 19413);
INSERT INTO `s_shop_pull_logs` VALUES (1803321908961632257, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-15 04:27:38,endTime:2024-05-16 04:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:00:22', 257);
INSERT INTO `s_shop_pull_logs` VALUES (1803321929354338305, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-16 03:27:38,endTime:2024-05-17 03:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:00:26', 264);
INSERT INTO `s_shop_pull_logs` VALUES (1803321947377262594, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-17 02:27:38,endTime:2024-05-18 02:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:00:31', 247);
INSERT INTO `s_shop_pull_logs` VALUES (1803321967539281921, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-18 01:27:38,endTime:2024-05-19 01:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:00:36', 258);
INSERT INTO `s_shop_pull_logs` VALUES (1803322452493176833, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-19 00:27:38,endTime:2024-05-20 00:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:02:30', 986);
INSERT INTO `s_shop_pull_logs` VALUES (1803322484067897346, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-19 23:27:38,endTime:2024-05-20 23:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:02:39', 261);
INSERT INTO `s_shop_pull_logs` VALUES (1803322519690121218, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-20 22:27:38,endTime:2024-05-21 22:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:02:47', 259);
INSERT INTO `s_shop_pull_logs` VALUES (1803322541861212161, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-21 21:27:38,endTime:2024-05-22 21:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:02:52', 285);
INSERT INTO `s_shop_pull_logs` VALUES (1803322565525475329, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-22 20:27:38,endTime:2024-05-23 20:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:02:58', 277);
INSERT INTO `s_shop_pull_logs` VALUES (1803322583531622401, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-23 19:27:38,endTime:2024-05-24 19:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:03:02', 333);
INSERT INTO `s_shop_pull_logs` VALUES (1803322601407746049, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-24 18:27:38,endTime:2024-05-25 18:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:03:07', 346);
INSERT INTO `s_shop_pull_logs` VALUES (1803323642283003906, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-24 17:27:38,endTime:2024-05-25 17:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:05:52', 82744);
INSERT INTO `s_shop_pull_logs` VALUES (1803324284355448834, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-24 16:27:38,endTime:2024-05-25 16:27:38}', '{insert:0,update:0,fail:0}', '2024-06-19 15:08:19', 88797);
INSERT INTO `s_shop_pull_logs` VALUES (1803324874317819905, 6, 6, 'ORDER', '主动拉取订单', '{startTime:2024-05-24 15:27:38,endTime:2024-05-25 15:27:38}', '{insert:1,update:0,fail:0}', '2024-06-19 15:10:48', 77677);
INSERT INTO `s_shop_pull_logs` VALUES (1803592792129568770, 4, 4, 'REFUND', '主动拉取', '{startTime:2024-06-19T08:56:07.415911500,endTime:2024-06-20T08:56:07.415911500}', '{insert:7,update:0,fail:0}', '2024-06-20 08:55:38', 66837);

-- ----------------------------
-- Table structure for s_shop_setting
-- ----------------------------
DROP TABLE IF EXISTS `s_shop_setting`;
CREATE TABLE `s_shop_setting`  (
  `id` int NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置名',
  `app_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'appKey',
  `app_secret` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'appSecret',
  `access_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '阿里access token',
  `expires_in` bigint NULL DEFAULT NULL COMMENT '到期',
  `access_token_begin` bigint NULL DEFAULT NULL COMMENT 'access_token开始时间',
  `refresh_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刷新token',
  `refresh_token_timeout` bigint NULL DEFAULT NULL COMMENT '刷新token过期时间',
  `modify_on` bigint NOT NULL COMMENT '更新时间',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `request_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求url',
  `third_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '第三方店铺id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '第三方平台设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_shop_setting
-- ----------------------------
INSERT INTO `s_shop_setting` VALUES (1, '1688', '9380846', 'MJC3doohMxCG', '', NULL, NULL, '', NULL, 1620181504, '1688开放平台', NULL, NULL);
INSERT INTO `s_shop_setting` VALUES (2, '视频号', ' ', ' ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `s_shop_setting` VALUES (3, '京东POP', 'FB4CC3688E6F9065D4FF510A53BB60FF', '40e8c8b2427f4e6db8f4a39af27d719e', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `s_shop_setting` VALUES (4, '淘宝天猫', '31014100', '7b0769269b0c0ca88949791c14eb3a5c', '', NULL, NULL, NULL, NULL, 1573610045, '淘宝开放平台', 'http://gw.api.taobao.com/router/rest', NULL);
INSERT INTO `s_shop_setting` VALUES (5, '拼多多', 'b92194d1af904c8a86a2c9eff6f9bfb0', '8da714f8dcbfb12d3972626ef8acfc0737aacecb', '', NULL, NULL, '', NULL, 1625123356, '拼多多开放平台', 'https://gw-api.pinduoduo.com/api/router', '');
INSERT INTO `s_shop_setting` VALUES (6, '抖音', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, 'https://openapi-fxg.jinritemai.com', NULL);
INSERT INTO `s_shop_setting` VALUES (7, '小红书', '621919dd99484598a69c', '1747d77da2ce58b97483932041c5503e', NULL, NULL, NULL, NULL, NULL, 0, NULL, 'https://ark.xiaohongshu.com', NULL);
INSERT INTO `s_shop_setting` VALUES (8, '快手', '', '', '', NULL, NULL, '', NULL, 1593392516, NULL, NULL, NULL);
INSERT INTO `s_shop_setting` VALUES (99, 'ERP系统', '', '', NULL, NULL, NULL, NULL, NULL, 1573610045, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for s_xhs_order
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_order`;
CREATE TABLE `s_xhs_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id（自增长）',
  `orderId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '订单号（第三方平台orderId）',
  `shopType` int NOT NULL DEFAULT 0 COMMENT '订单来源（dc_sys_third_setting表id）',
  `shopId` int NOT NULL DEFAULT 0 COMMENT '店铺ID（dc_shop表id）',
  `orderType` int NOT NULL DEFAULT 0 COMMENT '订单类型：（小红书：订单类型，1普通 2定金预售 3全款预售 4延迟发货 5换货补发）',
  `orderStatus` int NOT NULL DEFAULT 0 COMMENT '小红书订单状态，1已下单待付款 2已支付处理中 3清关中 4待发货 5部分发货 6待收货 7已完成 8已关闭 9已取消 10换货申请中',
  `afterSalesStatus` int NOT NULL DEFAULT 0 COMMENT '小红书售后状态，1无售后 2售后处理中 3售后完成(含取消)',
  `cancelStatus` int NOT NULL DEFAULT 0 COMMENT '申请取消状态，0未申请取消 1取消处理中',
  `orderCreatedTime` bigint NOT NULL DEFAULT 0 COMMENT '订单创建时间 单位ms',
  `orderPaidTime` bigint NOT NULL DEFAULT 0 COMMENT '订单支付时间 单位ms',
  `orderUpdateTime` bigint NOT NULL DEFAULT 0 COMMENT '订单更新时间 单位ms',
  `orderDeliveryTime` bigint NOT NULL DEFAULT 0 COMMENT '订单发货时间 单位ms',
  `orderCancelTime` bigint NOT NULL DEFAULT 0 COMMENT '订单取消时间 单位ms',
  `orderFinishTime` bigint NOT NULL DEFAULT 0 COMMENT '订单完成时间 单位ms',
  `promiseLastDeliveryTime` bigint NOT NULL DEFAULT 0 COMMENT '承诺最晚发货时间 单位ms',
  `customerRemark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户备注',
  `sellerRemark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '商家标记备注',
  `sellerRemarkFlag` int NOT NULL DEFAULT 0 COMMENT '商家标记优先级，ark订单列表展示旗子颜色 1灰旗 2红旗 3黄旗 4绿旗 5蓝旗 6紫旗',
  `presaleDeliveryStartTime` bigint NOT NULL DEFAULT 0 COMMENT '预售最早发货时间 单位ms',
  `presaleDeliveryEndTime` bigint NOT NULL DEFAULT 0 COMMENT '预售最晚发货时间 单位ms',
  `originalPackageId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '原始关联订单号(退换订单的原订单)',
  `totalPayAmount` int NOT NULL DEFAULT 0 COMMENT '订单实付金额(包含运费) 单位分',
  `totalShippingFree` int NOT NULL DEFAULT 0 COMMENT '订单运费 单位分',
  `expressTrackingNo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '快递单号',
  `expressCompanyCode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '快递公司编码',
  `openAddressId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '收件人姓名+手机+地址等计算得出，用来查询收件人详情',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '区',
  `auditStatus` int NULL DEFAULT 0 COMMENT '订单审核状态（0待审核1已审核）',
  `auditTime` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  `settleStatus` smallint NOT NULL DEFAULT 0 COMMENT '结算状态0未结算1已结算',
  `settleAmount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '结算金额',
  `sendStatus` int NOT NULL DEFAULT 0 COMMENT 'ERP发货状态0待处理1出库中2已出库3已发货',
  `sendTime` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（系统）',
  `createBy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间（系统）',
  `updateBy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小红书订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_xhs_order
-- ----------------------------
INSERT INTO `s_xhs_order` VALUES (1, 'P650205653267210151', 7, 21, 1, 7, 1, 0, 1650205653326, 1650205660000, 1650962588360, 1650769924771, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405490267', 'jtexpress', 'f8dcd97a570a0af01c335012be0b27e2', '浙江省', '杭州市', '富阳区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:57', NULL, '2022-05-22 19:21:01', NULL);
INSERT INTO `s_xhs_order` VALUES (2, 'P650204635265986711', 7, 21, 1, 7, 1, 0, 1650204635321, 1650204643000, 1651059206898, 1650769617344, 0, 1651059206862, 1651414567000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405963516', 'jtexpress', '08b7b137457406e72a09ea87c0f08ca8', '广东省', '广州市', '天河区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (3, 'P650204286108172701', 7, 21, 1, 7, 1, 0, 1650204286185, 1650204300000, 1651059912532, 1650769486417, 0, 0, 1651414250000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405628710', 'jtexpress', '5423ae97f11f817670be3803ebd06c1c', '湖北省', '十堰市', '茅箭区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-22 19:21:01', NULL);
INSERT INTO `s_xhs_order` VALUES (4, 'P650201514407536671', 7, 21, 1, 7, 1, 0, 1650201514465, 1650201522000, 1650799261498, 1650769397865, 0, 0, 1651411441000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405675548', 'jtexpress', '34154c88caf6375904d658b7d3b85ee7', '湖南省', '衡阳市', '耒阳市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-22 19:21:01', NULL);
INSERT INTO `s_xhs_order` VALUES (5, 'P650198151453596501', 7, 21, 1, 7, 1, 0, 1650198151510, 1650198164000, 1651302485258, 1650690024313, 0, 0, 1651408081000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001376195118', 'jtexpress', 'c6a961afcad1f245ad9f297c0af89a23', '山东省', '青岛市', '城阳区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (6, 'P650192591567693891', 7, 21, 1, 7, 1, 0, 1650192591625, 1650192601000, 1651213744870, 1650689917427, 0, 0, 1651402529000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001376195107', 'jtexpress', 'e79be334795c55cfd0eac0b6289c91c0', '安徽省', '合肥市', '庐阳区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (7, 'P650179651361905981', 7, 21, 1, 7, 1, 0, 1650179651420, 1650179659000, 1651325341123, 1650689875253, 0, 0, 1651389574000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001376195096', 'jtexpress', 'ecd089ef2236bdfae6883b46ecd0876e', '福建省', '厦门市', '思明区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (8, 'P650179468150156771', 7, 21, 1, 7, 1, 0, 1650179468203, 1650179475000, 1650712443521, 1650689720446, 0, 0, 1651389418000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001376195085', 'jtexpress', '8ce9d59be75139c80531e6d9c5cc4919', '广西壮族自治区', '贵港市', '港北区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (9, 'P650171958868691791', 7, 21, 1, 7, 1, 0, 1650171958927, 1650171968000, 1650790982529, 1650596513803, 0, 0, 1651381868000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '432515769736345', 'yunda', '5423ae97f11f817670be3803ebd06c1c', '湖北省', '十堰市', '茅箭区', 0, NULL, 1, 9.33, 1, NULL, '2022-04-17 22:28:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (10, 'P650171894797139901', 7, 21, 1, 9, 1, 0, 1650171894855, 0, 1650173700260, 0, 1650173700260, 0, 0, NULL, NULL, 0, 0, 0, NULL, 990, 0, NULL, NULL, '5423ae97f11f817670be3803ebd06c1c', '湖北省', '十堰市', '茅箭区', 0, NULL, 0, 0.00, 0, NULL, '2022-04-17 22:28:58', NULL, '2022-04-17 22:28:58', NULL);
INSERT INTO `s_xhs_order` VALUES (11, 'P650171459360675721', 7, 21, 1, 7, 1, 0, 1650171459417, 1650171467000, 1650886144398, 1650596329580, 0, 0, 1651381382000, NULL, NULL, 0, 0, 0, NULL, 1980, 0, '432515761274733', 'yunda', '56467f29809a9519b0f595adb156ba51', '福建省', '龙岩市', '新罗区', 0, NULL, 1, 18.67, 1, NULL, '2022-04-17 22:28:59', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (12, 'P650171091036317141', 7, 21, 1, 9, 1, 0, 1650171091104, 0, 1650172900174, 0, 1650172900174, 0, 0, NULL, NULL, 0, 0, 0, NULL, 990, 0, NULL, NULL, 'ae723519496681c63bd4ca05c5df7f81', '陕西省', '渭南市', '华阴市', 0, NULL, 0, 0.00, 0, NULL, '2022-04-17 22:28:59', NULL, '2022-04-17 22:28:59', NULL);
INSERT INTO `s_xhs_order` VALUES (13, 'P650167408349459561', 7, 21, 1, 7, 1, 0, 1650167408412, 1650167419000, 1650596170413, 1650596170395, 0, 0, 1651377377000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '43251575676208', 'yunda', '3570b8c9e35ad02d401575fcd51bde87', '广东省', '揭阳市', '揭西县', 0, NULL, 1, 9.33, 1, NULL, '2022-04-17 22:28:59', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (14, 'P650160674547164571', 7, 21, 1, 7, 1, 0, 1650160674605, 1650160683000, 1650765061345, 1650596107605, 0, 0, 1651370592000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '432515765103498', 'yunda', '63ab28bbabfbad5cc43d41631badd65a', '湖南省', '长沙市', '望城区', 0, NULL, 1, 9.33, 1, NULL, '2022-04-17 22:28:59', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (15, 'P650158023327622691', 7, 21, 1, 7, 1, 0, 1650158023382, 1650158032000, 1650788642724, 1650595913822, 0, 0, 1651367966000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '432515769726250', 'yunda', '0c42cff3e1792d0f9ea9ee8b2db54b57', '四川省', '广元市', '利州区', 0, NULL, 1, 9.33, 1, NULL, '2022-04-17 22:28:59', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (16, 'P650152018833195301', 7, 21, 1, 7, 1, 0, 1650152018893, 1650152027000, 1650691622675, 1650373546172, 0, 0, 1651361939000, NULL, NULL, 0, 0, 0, NULL, 1980, 0, '432512177214777', 'yunda', '1b404ce4114b05aed7290439fe35b987', '广东省', '惠州市', '博罗县', 0, NULL, 1, 18.67, 1, NULL, '2022-04-17 22:28:59', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (17, 'P650239311288237481', 7, 21, 1, 7, 1, 0, 1650239311346, 1650239327000, 1650977821437, 1650770005891, 0, 0, 1651449279000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405915638', 'jtexpress', '1e8faca03c6abec3ecb161ed8f82dac5', '湖北省', '十堰市', '张湾区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 08:29:36', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (18, 'P650251473635210141', 7, 21, 1, 7, 1, 0, 1650251473689, 1650251481000, 1650890580933, 1650770239932, 0, 0, 1651461411000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405675704', 'jtexpress', '1f9697fd5dada759959714c6e5e913d8', '广东省', '广州市', '越秀区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 11:36:46', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (19, 'P650251254103670461', 7, 21, 1, 7, 1, 0, 1650251254164, 1650251262000, 1650798421958, 1650770165888, 0, 0, 1651461177000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405719269', 'jtexpress', 'a8131e0d25bc781091886834f2babc9b', '浙江省', '台州市', '临海市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 11:36:46', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (20, 'P650250238123400311', 7, 21, 1, 7, 1, 0, 1650250238181, 1650250246000, 1650880624181, 1650770100194, 0, 0, 1651460153000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405398144', 'jtexpress', '95bc2242d0ccdec4a45c8579d1b0c088', '广东省', '广州市', '从化区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 11:36:46', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (21, 'P650247353773712021', 7, 21, 1, 9, 1, 0, 1650247353832, 0, 1650249160358, 0, 1650249160358, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, 'b2b1f9597c661266a05d4769045acb66', '湖北省', '武汉市', '东西湖区', 0, NULL, 0, 0.00, 0, NULL, '2022-04-18 11:36:46', NULL, '2022-04-18 11:36:46', NULL);
INSERT INTO `s_xhs_order` VALUES (22, 'P650254826789409301', 7, 21, 1, 9, 3, 1, 1650254826848, 1650254835000, 1650449219155, 0, 1650449219155, 0, 1651464745000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, '9a5446aa7683120cc170957153fe77e1', '福建省', '莆田市', '仙游县', 0, NULL, 0, 0.00, 0, NULL, '2022-04-18 12:51:09', NULL, '2022-05-01 20:02:19', NULL);
INSERT INTO `s_xhs_order` VALUES (23, 'P650254633938588711', 7, 21, 1, 7, 1, 0, 1650254633995, 1650254642000, 1650890580895, 1650770380145, 0, 0, 1651464550000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001406012626', 'jtexpress', 'c6d94c2203ef560685a6f09b428438d2', '广东省', '阳江市', '江城区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 12:51:09', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (24, 'P650253875620338531', 7, 21, 1, 7, 1, 0, 1650253875672, 1650253886000, 1650964925452, 1650770314869, 0, 0, 1651463799000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405443251', 'jtexpress', '714b8caf66c560fb94bf2d7dba72052a', '浙江省', '宁波市', '宁海县', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 12:51:09', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (25, 'P650258991490298871', 7, 21, 1, 7, 1, 0, 1650258991545, 1650259003000, 1650881280901, 1650771016966, 0, 0, 1651468936000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405719369', 'jtexpress', 'e8f2f2ec3a00118044947e0627ecc597', '广东省', '广州市', '天河区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 13:23:57', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (26, 'P650266326386558551', 7, 21, 1, 7, 1, 0, 1650266326460, 1650266333000, 1651050908798, 1650771932610, 0, 0, 1651476257000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405629160', 'jtexpress', 'ffc365e415365c5c43c7ffa5e3d3aa06', '福建省', '福州市', '晋安区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 15:32:05', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (27, 'P650263987743987401', 7, 21, 1, 7, 1, 0, 1650263987812, 1650263998000, 1650857340455, 1650771884748, 0, 0, 1651473955000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405398477', 'jtexpress', 'd7cc1df64995afa8fa54eae94611f7b0', '广东省', '清远市', '清城区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 15:32:05', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (28, 'P650262840072315461', 7, 21, 1, 9, 3, 1, 1650262840128, 1650262846000, 1650771623812, 0, 1650771623812, 0, 1651472760000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, '49207720571e8bf08711d96bb21f4fc6', '湖北省', '十堰市', '竹山县', 0, NULL, 0, 0.00, 2, NULL, '2022-04-18 15:32:05', NULL, '2022-05-01 20:02:19', NULL);
INSERT INTO `s_xhs_order` VALUES (29, 'P650267146717991681', 7, 21, 1, 7, 1, 0, 1650267146777, 1650267160000, 1650771780643, 1650690152640, 0, 0, 1651477081000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001376905229', 'jtexpress', 'a07a4e4403c6b3678a992e45beeea25a', '广东省', '东莞市', '', 0, NULL, 1, 24.33, 2, NULL, '2022-04-18 17:02:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (30, 'P650273202701600891', 7, 21, 1, 7, 1, 0, 1650273202761, 1650273212155, 1651048996842, 1650771965189, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405443439', 'jtexpress', 'd5fd9fc1e9f97a8ebeb6eeac78401011', '广西壮族自治区', '梧州市', '岑溪市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 17:59:27', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (31, 'P650278762052431911', 7, 21, 1, 7, 1, 0, 1650278762112, 1650278770000, 1650963427579, 1650771984307, 0, 0, 1651488703000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405865960', 'jtexpress', '99595319f4dd4220d1c99bfdf2efe2fe', '福建省', '泉州市', '晋江市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 19:26:00', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (32, 'P650293854639134681', 7, 21, 1, 7, 1, 0, 1650293854698, 1650293864000, 1650889740627, 1650772022486, 0, 0, 1651503821000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001406156692', 'jtexpress', 'b1d9350b96044ecd458c8a57ef9003ca', '广东省', '肇庆市', '四会市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 23:24:09', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (33, 'P650335287016742621', 7, 21, 1, 7, 1, 0, 1650335287105, 1650335295000, 1651071000764, 1650772045423, 0, 0, 1651545207000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405719903', 'jtexpress', '50056270c64b55f848a98091a9241dce', '辽宁省', '营口市', '站前区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-19 11:19:47', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (34, 'P650317045870614531', 7, 21, 1, 9, 1, 0, 1650317045929, 0, 1650318860147, 0, 1650318860147, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, '6fdf9a7815b5926d04dd7597fefe7187', '广东省', '惠州市', '惠东县', 0, NULL, 0, 0.00, 0, NULL, '2022-04-19 11:19:48', NULL, '2022-04-19 11:19:48', NULL);
INSERT INTO `s_xhs_order` VALUES (35, 'P650340391360421501', 7, 21, 1, 7, 1, 0, 1650340391420, 1650340401000, 1650974642017, 1650772073820, 0, 0, 1651550316000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001406058624', 'jtexpress', '9b9a768e982a457c0e338d93f0a8ee61', '福建省', '厦门市', '集美区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-19 12:49:12', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (36, 'P650383653706249041', 7, 21, 1, 7, 1, 0, 1650383653765, 1650383659000, 1651041785584, 1650855849023, 0, 0, 1651593604000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001461317429', 'jtexpress', '8ccfad0a875bf2e3a7f92805e0ddbe7f', '浙江省', '杭州市', '西湖区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-20 11:21:16', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (37, 'P650383282927259341', 7, 21, 1, 7, 1, 0, 1650383282987, 1650383293000, 1650969786428, 1650772100973, 0, 0, 1651593250000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001406013332', 'jtexpress', 'c91b26e77df55bfcb41f64faf46dbe73', '广西壮族自治区', '玉林市', '玉州区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-20 11:21:16', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (38, 'P650354860921382131', 7, 21, 1, 7, 1, 0, 1650354860982, 1650354871000, 1650690314615, 1650690314593, 0, 0, 1651564822000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT300137690524', 'jtexpress', '604f453ef493e8454ab834f983854395', '湖北省', '武汉市', '洪山区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-20 11:21:16', NULL, '2022-05-21 21:18:21', NULL);
INSERT INTO `s_xhs_order` VALUES (39, 'P650350589611937961', 7, 21, 1, 7, 1, 0, 1650350589671, 1650350597000, 1650779400430, 1650690239718, 0, 0, 1651560548000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001376905230', 'jtexpress', '608401a29ab4b22b700f3816f751959d', '广东省', '佛山市', '南海区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-20 11:21:16', NULL, '2022-05-21 21:18:24', NULL);
INSERT INTO `s_xhs_order` VALUES (40, 'P650539319449109001', 7, 21, 1, 7, 1, 0, 1650539319507, 1650539330000, 1650539674273, 1650855735706, 0, 0, 0, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3001461172457', 'jtexpress', '9a7eb85923b015eee6dbe9dd7fb641e3', '湖南省', '长沙市', '浏阳市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-21 19:09:36', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (41, 'P650524724621383351', 7, 21, 1, 7, 1, 0, 1650524724680, 1650524736000, 1650525048985, 1650855786731, 0, 0, 1651734648000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3001461036836', 'jtexpress', 'b1980eccfcc56e6ab5956c766b2d7b7b', '重庆', '重庆市', '江津区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-21 19:09:36', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (42, 'P650607608703188391', 7, 21, 1, 7, 1, 0, 1650607608766, 1650607617000, 1650607932885, 1650855355436, 0, 0, 1651817532000, NULL, '淘宝已下单', 0, 0, 0, NULL, 2580, 0, 'JT3001461172402', 'jtexpress', '4c7ea18e13518249c8be6990c58c9d6e', '广东省', '惠州市', '惠阳区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-22 15:45:20', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (43, 'P650639118014134591', 7, 21, 1, 7, 1, 0, 1650639118078, 1650639132000, 1650639474606, 1650855681882, 0, 0, 1651849074000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3001460796543', 'jtexpress', 'b6927ef7086dbdac8f6ad7d72cca8c36', '广东省', '茂名市', '茂南区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-23 11:10:46', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (44, 'P650689352935451771', 7, 21, 1, 7, 1, 0, 1650689352998, 1650689359000, 1650689671979, 1650855445026, 0, 0, 1651899271000, NULL, '淘宝已下单', 0, 0, 0, NULL, 2580, 0, 'JT3001461080981', 'jtexpress', '2140205662905463f8711bb07f73c8a4', '广东省', '深圳市', '南山区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-23 12:56:21', NULL, '2022-05-16 18:24:32', NULL);
INSERT INTO `s_xhs_order` VALUES (45, 'P650722151211113551', 7, 21, 1, 7, 1, 0, 1650722151275, 1650722169000, 1650722470160, 1650855546917, 0, 0, 1651932070000, NULL, '淘宝已下单', 0, 0, 0, NULL, 6450, 0, 'JT3001460843527', 'jtexpress', '8ee13a2449a0e2dcd9e4400e082ca072', '辽宁省', '鞍山市', '立山区', 0, NULL, 1, 60.82, 2, NULL, '2022-04-23 22:55:59', NULL, '2022-05-16 18:24:32', NULL);
INSERT INTO `s_xhs_order` VALUES (46, 'P650730626873861291', 7, 21, 1, 7, 1, 0, 1650730626941, 1650730636000, 1650730982899, 1650855626874, 0, 0, 1651940582000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3001461224014', 'jtexpress', 'dad5d743ccb5d479c85a7e35757505dd', '广东省', '东莞市', '', 0, NULL, 1, 12.16, 2, NULL, '2022-04-24 08:27:39', NULL, '2022-05-16 18:24:32', NULL);
INSERT INTO `s_xhs_order` VALUES (47, 'P650962492423135701', 7, 21, 1, 7, 1, 0, 1650962492492, 1650962518000, 1650962864306, 1651031506516, 0, 0, 1652172464000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, '9887351628811', 'youzhengguonei', '329f63916e6805a66e0690f20d3f8a21', '浙江省', '绍兴市', '诸暨市', 0, NULL, 1, 24.33, 2, NULL, '2022-04-26 20:56:23', NULL, '2022-05-16 18:24:32', NULL);
INSERT INTO `s_xhs_order` VALUES (48, 'P651028113417290361', 7, 21, 1, 7, 1, 0, 1651028113481, 1651028131000, 1651028464301, 1651115982886, 0, 0, 1652238064000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001632496233', 'jtexpress', '3b2a753b158d7785d65333bc79acac3e', '广西壮族自治区', '贵港市', '桂平市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-27 11:49:31', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (49, 'P651060035066681871', 7, 21, 1, 7, 1, 0, 1651060035133, 1651060043000, 1651060400045, 1651115999510, 0, 0, 1652269999000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001632543339', 'jtexpress', 'b30c45b1090ebc0c45bc460402157f56', '广东省', '深圳市', '宝安区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-27 21:35:22', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (50, 'P651059947801802851', 7, 21, 1, 9, 1, 0, 1651059947865, 0, 1651061760378, 0, 1651061760378, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, 'fe552107e23704df601caa653c8a6604', '广东省', '深圳市', '宝安区', 0, NULL, 0, 0.00, 0, NULL, '2022-04-27 21:35:22', NULL, '2022-04-27 21:35:22', NULL);
INSERT INTO `s_xhs_order` VALUES (51, 'P651244863186803631', 7, 21, 1, 7, 1, 0, 1651244863248, 1651244871000, 1651245180622, 1651370939239, 0, 0, 1652543999000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001802941464', 'jtexpress', '438de7cdb256bcc016926dda9d122792', '广西壮族自治区', '南宁市', '邕宁区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-30 09:05:47', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (52, 'P651300639424889331', 7, 21, 1, 7, 1, 0, 1651300639513, 1651300649000, 1651370920852, 1651370920831, 0, 0, 1652543999000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001803182995', 'jtexpress', 'f4cb08ce935091e53314e828861922cb', '广东省', '惠州市', '惠阳区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-30 15:15:02', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (53, 'P651365028037549841', 7, 21, 1, 7, 1, 0, 1651365028104, 1651365035000, 1651365375666, 1651459424666, 0, 0, 1652574975000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001866992683', 'jtexpress', 'e6bb9ab6d82624472a4eedb0b11503e4', '广东省', '深圳市', '宝安区', 0, NULL, 1, 12.16, 2, NULL, '2022-05-01 10:09:20', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (54, 'P651443046272776771', 7, 21, 1, 7, 1, 0, 1651443046339, 1651443061000, 1651443391202, 1651543539931, 0, 0, 1652652991000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001912727034', 'jtexpress', '8df1d309c32f5affccdcadf06d115689', '湖南省', '常德市', '武陵区', 0, NULL, 1, 24.33, 2, NULL, '2022-05-02 09:35:24', NULL, '2022-05-22 10:23:53', NULL);
INSERT INTO `s_xhs_order` VALUES (55, 'P651498332963710841', 7, 21, 1, 7, 1, 0, 1651498333022, 1651498342000, 1651498682299, 1651543592182, 0, 0, 1652708282000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001912880221', 'jtexpress', 'f9b92a34e39bb7ec16a5d358ed780fec', '福建省', '厦门市', '湖里区', 0, NULL, 1, 24.33, 2, NULL, '2022-05-02 21:46:07', NULL, '2022-05-22 10:23:53', NULL);
INSERT INTO `s_xhs_order` VALUES (56, 'P651498307540816011', 7, 21, 1, 1, 1, 0, 1651498307611, 0, 1651498307611, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, 'f9b92a34e39bb7ec16a5d358ed780fec', '福建省', '厦门市', '湖里区', 0, NULL, 0, 0.00, 0, NULL, '2022-05-02 21:46:07', NULL, '2022-05-02 21:46:07', NULL);
INSERT INTO `s_xhs_order` VALUES (57, 'P651745605368708111', 7, 21, 1, 7, 1, 0, 1651745605436, 1651745613000, 1651745941135, 1651839256269, 0, 0, 1652955541000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002105950361', 'jtexpress', '707dbef63d281fd17c175e87b78b464b', '广东省', '深圳市', '宝安区', 0, NULL, 1, 12.16, 2, NULL, '2022-05-05 19:56:29', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (58, 'P651877675430739391', 7, 21, 1, 7, 1, 0, 1651877675511, 1651877684000, 1651878010966, 1652001797082, 0, 0, 1653087610000, NULL, NULL, 0, 0, 0, NULL, 2691, 0, 'JT3002240056944', 'jtexpress', '27b0b0ae37f7937e2f8a1f1c9af5ba4b', '江苏省', '盐城市', '大丰区', 0, NULL, 1, 28.21, 2, NULL, '2022-05-07 21:04:31', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (59, 'P651941129187172881', 7, 21, 1, 7, 1, 0, 1651941129263, 1651941137000, 1651941480962, 1652075325387, 0, 0, 1653151080000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002296592389', 'jtexpress', 'f579fa4084d6e52b9682a153dc78342b', '广东省', '广州市', '荔湾区', 0, NULL, 1, 12.16, 2, NULL, '2022-05-08 11:13:26', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (60, 'P652006673545485701', 7, 21, 1, 7, 1, 0, 1652006673604, 1652006685000, 1652007026959, 1652075558716, 0, 0, 1653216626000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002296648768', 'jtexpress', '9cafc84c3b2ec21c8de31f0a0bd64720', '江西省', '赣州市', '章贡区', 0, NULL, 1, 12.16, 2, NULL, '2022-05-08 19:00:56', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (61, 'P652108040599855541', 7, 21, 1, 7, 1, 0, 1652108040656, 1652108048000, 1652108390516, 1652238053197, 0, 0, 1653317990000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3002437463477', 'jtexpress', '06850661b0fbc2093dc67e784d8e0c73', '浙江省', '金华市', '义乌市', 0, NULL, 1, 12.16, 2, NULL, '2022-05-10 14:12:23', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (62, 'P652107941351324701', 7, 21, 1, 7, 1, 0, 1652107941417, 1652107949000, 1652108281189, 1652238425807, 0, 0, 1653317881000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1990, 0, 'YT6479046468338', 'yuantong', '06850661b0fbc2093dc67e784d8e0c73', '浙江省', '金华市', '义乌市', 0, NULL, 1, 18.76, 2, NULL, '2022-05-10 14:12:24', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (63, 'P652340945430389721', 7, 21, 1, 6, 1, 0, 1652340945490, 1652340955000, 1652341270887, 1652410285883, 0, 0, 1653753599000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3002568648261', 'jtexpress', '0a64d472fc8a926142f0b9980cdb6b6a', '广东省', '深圳市', '盐田区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-12 19:53:33', NULL, '2022-05-13 10:51:25', NULL);
INSERT INTO `s_xhs_order` VALUES (64, 'P652331849177761981', 7, 21, 1, 7, 1, 0, 1652331849248, 1652331866000, 1652332218898, 1652410264346, 0, 0, 1653753599000, NULL, '淘宝已下单', 0, 0, 0, NULL, 290, 0, 'JT3002568648205', 'jtexpress', '6e703554c7a18e4773bb5c3488ceae5f', '广东省', '湛江市', '霞山区', 0, NULL, 1, 12.23, 2, NULL, '2022-05-12 19:53:33', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (65, 'P652323086561298701', 7, 21, 1, 6, 1, 0, 1652323086617, 1652323103000, 1652323442265, 1652410244011, 0, 0, 1653753599000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1161, 0, 'JT3002569201412', 'jtexpress', '70915451c748f7ecc7705d22c5872d80', '广东省', '深圳市', '龙华区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-12 19:53:33', NULL, '2022-05-13 10:50:44', NULL);
INSERT INTO `s_xhs_order` VALUES (66, 'P652320603621637491', 7, 21, 1, 6, 1, 0, 1652320603685, 1652320612000, 1652320954690, 1652410211732, 0, 0, 1653753599000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3002568739198', 'jtexpress', '4150c58664273eb70672cdcd0d4533b7', '广东省', '惠州市', '惠阳区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-12 19:53:33', NULL, '2022-05-13 10:50:11', NULL);
INSERT INTO `s_xhs_order` VALUES (67, 'P652432706269218671', 7, 21, 1, 6, 1, 0, 1652432706333, 1652432724000, 1652433034942, 1652498293593, 0, 0, 1653753599000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3002636428891', 'jtexpress', '1a7cd3871095bfaddb4fb33658f9380a', '广东省', '潮州市', '潮安区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-13 20:40:27', NULL, '2022-05-14 11:18:13', NULL);
INSERT INTO `s_xhs_order` VALUES (68, 'P652611011026109501', 7, 21, 1, 6, 1, 0, 1652611011091, 1652611018000, 1652668736304, 1652668736280, 0, 0, 1653820930000, NULL, NULL, 0, 0, 0, NULL, 1136, 0, 'JT3002789458117', 'jtexpress', '1eebf619caf33dc02961939659f0de17', '福建省', '南平市', '顺昌县', 0, NULL, 0, 0.00, 2, NULL, '2022-05-15 20:09:49', NULL, '2022-05-16 13:41:47', NULL);
INSERT INTO `s_xhs_order` VALUES (69, 'P652572596040656061', 7, 21, 1, 6, 1, 0, 1652572596098, 1652572606000, 1652572913122, 1652668713949, 0, 0, 1653782512000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002789048211', 'jtexpress', 'ed902994a5480eb9d514da7533d2db0d', '广东省', '肇庆市', '四会市', 0, NULL, 0, 0.00, 2, NULL, '2022-05-15 20:09:49', NULL, '2022-05-16 10:38:34', NULL);
INSERT INTO `s_xhs_order` VALUES (70, 'P652630097148619501', 7, 21, 1, 6, 1, 0, 1652630097204, 1652630105000, 1652630460606, 1652759819699, 0, 0, 1653840060000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002846641634', 'jtexpress', '9ae14199faabdb48e52af6af00021453', '广东省', '中山市', '', 0, NULL, 0, 0.00, 2, NULL, '2022-05-16 07:51:30', NULL, '2022-05-17 11:56:59', NULL);
INSERT INTO `s_xhs_order` VALUES (71, 'P652714294934637211', 7, 21, 1, 6, 1, 0, 1652714294998, 1652714304000, 1652714659991, 1652848120252, 0, 0, 1653924259000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002943027867', 'jtexpress', 'd3c6e2c5093ebf53280793f5fd02f0a6', '广东省', '深圳市', '宝安区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-17 11:56:04', NULL, '2022-05-18 12:28:40', NULL);
INSERT INTO `s_xhs_order` VALUES (72, 'P652778175558617641', 7, 21, 1, 6, 1, 0, 1652778175624, 1652778184000, 1652778494336, 1652848180394, 0, 0, 1653988094000, NULL, NULL, 0, 0, 0, NULL, 2322, 0, 'JT3002942887420', 'jtexpress', '9148231a92329ecd3b0b99d59f34ae33', '广东省', '江门市', '蓬江区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-17 21:22:54', NULL, '2022-05-18 12:29:40', NULL);
INSERT INTO `s_xhs_order` VALUES (73, 'P652863889529663301', 7, 21, 1, 6, 1, 0, 1652863889614, 1652863899000, 1652938388527, 1652938388507, 0, 0, 1654073807000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003010221318', 'jtexpress', '96e99bf181119b963ae9d25cd44cb6ce', '广东省', '江门市', '台山市', 0, NULL, 0, 0.00, 2, NULL, '2022-05-18 21:33:05', NULL, '2022-05-19 13:33:15', NULL);
INSERT INTO `s_xhs_order` VALUES (74, 'P653135539462453911', 7, 21, 1, 6, 1, 0, 1653135539523, 1653135547000, 1653185775843, 1653185775820, 0, 0, 1654345485000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003231543305', 'jtexpress', 'da318f84c20838c652755b80a66d466b', '广西壮族自治区', '钦州市', '浦北县', 0, NULL, 0, 0.00, 2, NULL, '2022-05-21 21:00:49', NULL, '2022-05-22 10:16:19', NULL);
INSERT INTO `s_xhs_order` VALUES (75, 'P653144704533687431', 7, 21, 1, 6, 1, 0, 1653144704607, 1653144714000, 1653218393809, 1653218393789, 0, 0, 1654354664000, NULL, NULL, 0, 0, 0, NULL, 1990, 0, '773161531277980', 'shentong', '9e5628b022c75bd3b5c3aaffb32adf74', '湖北省', '武汉市', '硚口区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-22 10:16:19', NULL, '2022-05-22 19:20:03', NULL);
INSERT INTO `s_xhs_order` VALUES (76, 'P653208486268312851', 7, 21, 1, 6, 1, 0, 1653208486334, 1653208494000, 1653276564531, 1653276564512, 0, 0, 1654418418000, NULL, NULL, 0, 0, 0, NULL, 1161, 0, 'JT3003288049689', 'jtexpress', '4d29cc288e4fa731129cb493d715dc7e', '广东省', '汕头市', '澄海区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-22 19:20:03', NULL, '2022-05-23 11:29:27', NULL);
INSERT INTO `s_xhs_order` VALUES (77, 'P653220280689380791', 7, 21, 1, 9, 1, 0, 1653220280755, 0, 1653222100295, 0, 1653222100295, 0, 0, NULL, NULL, 0, 0, 0, NULL, 990, 0, NULL, NULL, '10d6c6000f953ed66bdc8a6695072080', '广东省', '深圳市', '宝安区', 0, NULL, 0, 0.00, 0, NULL, '2022-05-23 11:29:27', NULL, '2022-05-23 11:29:27', NULL);
INSERT INTO `s_xhs_order` VALUES (78, 'P653317470153912441', 7, 21, 1, 6, 1, 0, 1653317470228, 1653317476000, 1653317802177, 1653484140631, 0, 0, 1654527401000, NULL, '1688已下单', 0, 0, 0, NULL, 290, 0, 'JT3003424457414', 'jtexpress', '7e9ca85dc737c5a5c20b152698cb0cb2', '山东省', '临沂市', '郯城县', 0, NULL, 0, 0.00, 2, NULL, '2022-05-24 10:19:28', NULL, '2022-05-25 21:09:00', NULL);
INSERT INTO `s_xhs_order` VALUES (79, 'P653567290802427841', 7, 21, 1, 6, 1, 0, 1653567290997, 1653567297000, 1653617427728, 1653617427703, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003602860095', 'jtexpress', 'cc95f27f751d08f0e89198e481245325', '陕西省', '西安市', '雁塔区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-26 20:27:42', NULL, '2022-05-27 10:10:30', NULL);
INSERT INTO `s_xhs_order` VALUES (80, 'P653544659683153591', 7, 21, 1, 6, 1, 0, 1653544659748, 1653544667000, 1653617408552, 1653617408531, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003602904594', 'jtexpress', '8be8a595a967affce86896f6e6c0ee48', '四川省', '成都市', '龙泉驿区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-26 20:27:42', NULL, '2022-05-27 10:10:30', NULL);
INSERT INTO `s_xhs_order` VALUES (81, 'P653646659063908311', 7, 21, 1, 6, 1, 0, 1653646659146, 1653646667000, 1653705950853, 1653705950825, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003679293080', 'jtexpress', 'a38612467d9d2cf240f91903103dec00', '广东省', '东莞市', '', 0, NULL, 0, 0.00, 2, NULL, '2022-05-27 18:22:46', NULL, '2022-05-28 10:46:12', NULL);
INSERT INTO `s_xhs_order` VALUES (82, 'P653645962294360321', 7, 21, 1, 6, 1, 0, 1653645962372, 1653645973000, 1653705928660, 1653705928569, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 280, 0, 'YT6517452100608', 'yuantong', 'd99a4a5e6e051550472ad7dfe1bcf468', '湖南省', '湘潭市', '湘乡市', 0, NULL, 0, 0.00, 2, NULL, '2022-05-27 18:22:46', NULL, '2022-05-28 10:46:12', NULL);
INSERT INTO `s_xhs_order` VALUES (83, 'P653634893760982221', 7, 21, 1, 6, 1, 0, 1653634894789, 1653634905000, 1653705969289, 1653705969212, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3003679471288', 'jtexpress', 'ba7b62f00ea0e48f4c2a702d33e89fd3', '广西壮族自治区', '来宾市', '兴宾区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-27 18:22:46', NULL, '2022-05-28 10:46:12', NULL);
INSERT INTO `s_xhs_order` VALUES (84, 'P653723125891998301', 7, 21, 1, 6, 1, 0, 1653723125963, 1653723136000, 1653793425367, 1653793425347, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003751158081', 'jtexpress', '0ccbf55d9dadadac0f459cc8ddc46446', '湖南省', '常德市', '武陵区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-28 22:01:49', NULL, '2022-05-29 11:03:48', NULL);
INSERT INTO `s_xhs_order` VALUES (85, 'P653719930037699091', 7, 21, 1, 6, 1, 0, 1653719930100, 1653719942000, 1653793407148, 1653793407125, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 1161, 0, 'JT3003751063621', 'jtexpress', '2250abd9d8eff1470c293aafe0e7d0e8', '广东省', '深圳市', '光明区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-28 22:01:49', NULL, '2022-05-29 11:03:48', NULL);
INSERT INTO `s_xhs_order` VALUES (86, 'P653708051414315701', 7, 21, 1, 6, 1, 0, 1653708051481, 1653708065000, 1653793389320, 1653793389301, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3003750965927', 'jtexpress', '3a5123d2ecce034a0897b1a446f50527', '广西壮族自治区', '南宁市', '西乡塘区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-28 22:01:49', NULL, '2022-05-29 11:03:49', NULL);
INSERT INTO `s_xhs_order` VALUES (87, 'P653888030003741751', 7, 21, 1, 6, 1, 0, 1653888030082, 1653888038000, 1653965399726, 1653965399688, 0, 0, 1655097957000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432582021828458', 'yunda', '75603a5f0978bd792127613240e24183', '山东省', '青岛市', '市北区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-30 14:56:59', NULL, '2022-05-31 10:50:18', NULL);
INSERT INTO `s_xhs_order` VALUES (88, 'P653999706956258091', 7, 21, 1, 6, 1, 0, 1653999707028, 1653999714000, 1654050495195, 1654050495175, 0, 0, 1655209633000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432584518143069', 'yunda', '4c51728b8a4c4c572191546322c1d3e7', '辽宁省', '鞍山市', '铁西区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-31 21:35:27', NULL, '2022-06-01 10:28:39', NULL);
INSERT INTO `s_xhs_order` VALUES (89, 'P653987459525810271', 7, 21, 1, 6, 1, 0, 1653987459604, 1653987466000, 1654050470766, 1654050470745, 0, 0, 1655197396000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432584536121390', 'yunda', '067fa655af50db8a08211452aedb98c6', '广东省', '广州市', '天河区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-31 21:35:27', NULL, '2022-06-01 10:28:39', NULL);
INSERT INTO `s_xhs_order` VALUES (90, 'P654004804836532561', 7, 21, 1, 6, 1, 0, 1654004804906, 1654004855000, 1654050516457, 1654050516437, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1990, 0, '432584533223757', 'yunda', '0059f88fe329cea51c5dd452a1e05f42', '广东省', '深圳市', '宝安区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-31 21:52:41', NULL, '2022-06-01 10:28:39', NULL);
INSERT INTO `s_xhs_order` VALUES (91, 'P654326589566228171', 7, 21, 1, 6, 1, 0, 1654326589634, 1654326599000, 1654601346502, 1654400179609, 0, 0, 1655536511000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '773163908746135', 'shentong', '8f690075129429b25ebf21c37cbea82c', '广东省', '广州市', '荔湾区', 0, NULL, 0, 0.00, 2, NULL, '2022-06-04 18:02:12', NULL, '2022-06-07 20:54:50', NULL);
INSERT INTO `s_xhs_order` VALUES (92, 'P654308982054596471', 7, 21, 1, 6, 1, 0, 1654308982141, 1654308989000, 1654479600606, 1654400138595, 0, 0, 1655518919000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432593624343723', 'yunda', '4ef2ab404861d77517b9fbb89f20200f', '浙江省', '台州市', '临海市', 0, NULL, 0, 0.00, 2, NULL, '2022-06-04 18:02:12', NULL, '2022-06-07 20:54:50', NULL);
INSERT INTO `s_xhs_order` VALUES (93, 'P654527865303868421', 7, 21, 1, 6, 1, 0, 1654527865366, 1654527873000, 1654528229197, 1654677929834, 0, 0, 1655737829000, NULL, '淘宝已下单0607', 0, 0, 0, NULL, 1791, 0, 'YT6543639546587', 'yuantong', '5c59b4adff960fcbc76e663ed40d8b70', '广东省', '广州市', '增城区', 0, NULL, 0, 0.00, 2, NULL, '2022-06-07 20:54:25', NULL, '2022-06-08 16:45:29', NULL);
INSERT INTO `s_xhs_order` VALUES (94, 'P654918013009797431', 7, 21, 1, 6, 1, 0, 1654918013174, 1654918022000, 1655182615611, 1655169894927, 0, 0, 1656127949000, NULL, NULL, 0, 0, 0, NULL, 280, 0, '75888276950532', 'zto', '722abae4f13b162a7b8d2884871e4e4a', '广东省', '中山市', '', 0, NULL, 0, 0.00, 2, NULL, '2022-06-13 15:28:02', NULL, '2022-06-14 17:13:52', NULL);
INSERT INTO `s_xhs_order` VALUES (95, 'P654902252061493981', 7, 21, 1, 9, 1, 0, 1654902252120, 0, 1654904060194, 0, 1654904060194, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1280, 0, NULL, NULL, 'd42803b3095ba8eb1b27e4c48ac607bc', '河北省', '保定市', '高碑店市', 0, NULL, 0, 0.00, 0, NULL, '2022-06-13 15:28:03', NULL, '2022-06-13 15:28:03', NULL);
INSERT INTO `s_xhs_order` VALUES (96, 'P655164209297185071', 7, 21, 1, 6, 1, 0, 1655164209363, 1655164230000, 1655471701849, 1655266974183, 0, 0, 1657019155000, NULL, NULL, 0, 0, 0, NULL, 3690, 0, 'JT3005149047370', 'jtexpress', '2388ccdeb36a811797014335e85f6b67', '江苏省', '苏州市', '相城区', 0, NULL, 0, 0.00, 2, NULL, '2022-06-14 17:13:43', NULL, '2022-06-23 10:59:04', NULL);
INSERT INTO `s_xhs_order` VALUES (97, 'P655907217047288121', 7, 21, 1, 7, 1, 0, 1655907217117, 1655907227000, 1657027485014, 1655990684830, 0, 1657027484977, 1657117168000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, '432632780754891', 'yunda', 'f00c0c345eda1d0413d7b9c500def1dd', '辽宁省', '大连市', '沙河口区', 0, NULL, 0, 0.00, 2, NULL, '2022-06-23 10:58:52', NULL, '2022-09-11 15:29:00', NULL);
INSERT INTO `s_xhs_order` VALUES (98, 'P655895456352234021', 7, 21, 1, 7, 1, 0, 1655895456422, 1655895464000, 1656993698071, 1655956581085, 0, 1656993381219, 1657105417000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432631017320265', 'yunda', '1a642f9d01e7dfd04b1b79957feb05e2', '湖北省', '襄阳市', '枣阳市', 0, NULL, 0, 0.00, 2, NULL, '2022-06-23 10:58:52', NULL, '2022-07-20 15:45:10', NULL);
INSERT INTO `s_xhs_order` VALUES (99, 'P655306083910895681', 7, 21, 1, 6, 1, 0, 1655306083981, 1655306092000, 1655602201013, 1655467319110, 0, 0, 1657019155000, NULL, NULL, 0, 0, 0, NULL, 1990, 0, 'YT6564757376366', 'yuantong', '0090de1a01addc823ede8fb036ffd216', '福建省', '泉州市', '南安市', 0, NULL, 0, 0.00, 0, NULL, '2022-06-23 10:59:12', NULL, '2022-06-23 10:59:12', NULL);
INSERT INTO `s_xhs_order` VALUES (100, 'P655861236319479691', 7, 21, 1, 7, 1, 0, 1655861236401, 1655861242000, 1656993362259, 1655956562027, 0, 1656993362162, 1657071162000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432631019537001', 'yunda', '68f1bc1f82f2f7997a57d689c5aa66b4', '四川省', '成都市', '青羊区', 0, NULL, 0, 0.00, 2, NULL, '2022-06-23 10:59:53', NULL, '2022-07-20 15:45:10', NULL);
INSERT INTO `s_xhs_order` VALUES (101, 'P656077804604507781', 7, 21, 1, 9, 1, 0, 1656077804674, 0, 1656077889299, 0, 1656077889299, 0, 0, NULL, NULL, 0, 0, 0, NULL, 290, 0, NULL, NULL, 'ef4f1a4b5bbfe3866288bee28cba83b7', '福建省', '福州市', '福清市', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:45:30', NULL, '2022-07-20 15:45:30', NULL);
INSERT INTO `s_xhs_order` VALUES (102, 'P656138236641436701', 7, 21, 1, 9, 3, 1, 1656138236707, 1656138249000, 1656209706278, 0, 1656209706278, 0, 1657348168000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, 'e84cc723d75a4b833756b5c7879a12cb', '北京', '北京市', '顺义区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:45:40', NULL, '2022-07-20 15:45:40', NULL);
INSERT INTO `s_xhs_order` VALUES (103, 'P656131592886653951', 7, 21, 1, 7, 1, 0, 1656131592957, 1656131599000, 1657440877002, 1656404076523, 0, 1657440876899, 1657341536000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432640173985829', 'yunda', '9a81135efc9b29256d6d437c1174a6a0', '浙江省', '台州市', '椒江区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:45:40', NULL, '2022-07-20 15:45:40', NULL);
INSERT INTO `s_xhs_order` VALUES (104, 'P656428167541196101', 7, 21, 1, 7, 1, 0, 1656428167611, 1656428177000, 1657597117291, 1656560317055, 0, 1657597117257, 1657638086000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432643807350250', 'yunda', '6bdf54e7194210d2a31c89698f818f0b', '辽宁省', '大连市', '甘井子区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:46:17', NULL, '2022-07-20 15:46:17', NULL);
INSERT INTO `s_xhs_order` VALUES (105, 'P656412970413495211', 7, 21, 1, 7, 1, 0, 1656412970482, 1656413001000, 1657511749230, 1656474949056, 0, 1657511749191, 1657622918000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '432642060066682', 'yunda', '0608259b1033dfb14ee4c58f3674ec6f', '浙江省', '宁波市', '海曙区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:46:18', NULL, '2022-07-20 15:46:18', NULL);
INSERT INTO `s_xhs_order` VALUES (106, 'P656575170906937241', 7, 21, 1, 9, 1, 0, 1656575170973, 0, 1656576980325, 0, 1656576980325, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1990, 0, NULL, NULL, '7100c0fffd4fd56b4ae1c63a56ca31dd', '重庆', '重庆市', '荣昌区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:46:33', NULL, '2022-07-20 15:46:33', NULL);
INSERT INTO `s_xhs_order` VALUES (107, 'P656748207113734701', 7, 21, 1, 9, 1, 0, 1656748207190, 0, 1656750020304, 0, 1656750020303, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1280, 0, NULL, NULL, '197b752dffdca268b04ac405b1d7afeb', '北京', '北京市', '昌平区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:46:46', NULL, '2022-07-20 15:46:46', NULL);
INSERT INTO `s_xhs_order` VALUES (108, 'P656848564205726681', 7, 21, 1, 7, 1, 0, 1656848564271, 1656848571000, 1657940258751, 1656903458412, 0, 1657940258716, 1658058482000, NULL, NULL, 0, 0, 0, NULL, 1990, 0, '432650839190733', 'yunda', 'c3e2abb2de87b1069d129602b49eac47', '山东省', '淄博市', '张店区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:46:52', NULL, '2022-07-20 15:46:52', NULL);
INSERT INTO `s_xhs_order` VALUES (109, 'P657124492725901641', 7, 21, 1, 7, 1, 0, 1657124492800, 1657124509000, 1658286563492, 1657249763117, 0, 1658286563457, 1658334465000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, '432658338105728', 'yunda', '7ea3369e4c236d53ba04add9ec50374a', '贵州省', '贵阳市', '云岩区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:47:17', NULL, '2022-07-20 15:47:17', NULL);

-- ----------------------------
-- Table structure for s_xhs_order_item
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_order_item`;
CREATE TABLE `s_xhs_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderId` bigint NOT NULL COMMENT '订单id',
  `itemId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `itemName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `erpcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家编码(若为组合品，暂不支持组合品的商家编码，但skulist会返回子商品商家编码)',
  `itemSpecCode` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格编码',
  `itemSpec` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '规格',
  `itemImage` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片url',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `quantity` int NOT NULL COMMENT '数量',
  `totalPaidAmount` bigint NOT NULL DEFAULT 0 COMMENT '总支付金额（考虑总件数）商品总实付',
  `totalMerchantDiscount` bigint NOT NULL DEFAULT 0 COMMENT '商家承担总优惠',
  `totalRedDiscount` bigint NOT NULL DEFAULT 0 COMMENT '平台承担总优惠',
  `itemTag` int NOT NULL COMMENT '是否赠品，1 赠品 0 普通商品',
  `erpSendStatus` int NOT NULL DEFAULT 0 COMMENT 'ERP发货状态0待处理1出库中2已出库3已发货',
  `erpGoodsId` int NOT NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `erpGoodsSpecId` int NOT NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小红书订单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_xhs_order_item
-- ----------------------------
INSERT INTO `s_xhs_order_item` VALUES (1, 1, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (2, 2, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (3, 3, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (4, 4, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (5, 5, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (6, 6, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (7, 7, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 1, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (8, 8, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 1, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (9, 9, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (10, 10, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (11, 11, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 1980, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (12, 12, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (13, 13, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (14, 14, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (15, 15, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (16, 16, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 1980, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (17, 17, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (18, 18, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (19, 19, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (20, 20, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (21, 21, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (22, 22, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (23, 23, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (24, 24, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (25, 25, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (26, 26, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (27, 27, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (28, 28, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (29, 29, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (30, 30, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (31, 31, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (32, 32, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (33, 33, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (34, 34, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (35, 35, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (36, 36, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (37, 37, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (38, 38, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (39, 39, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (40, 40, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (41, 41, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (42, 42, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (43, 43, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (44, 44, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (45, 45, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 5, 6450, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (46, 46, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (47, 47, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (48, 48, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (49, 49, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (50, 50, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (51, 51, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (52, 52, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (53, 53, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (54, 54, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (55, 55, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (56, 56, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (57, 57, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (58, 58, '6260e4559882460001404817', '2瓶油泼辣子香辣麻辣红四川风味油辣椒油家庭辣椒酱凉拌菜调料 香辣味1瓶+麻辣味1瓶', NULL, NULL, '香辣味1瓶+麻辣味1瓶', '//qimg.xiaohongshu.com/arkgoods/01024l01kd5bhe81cua0l0robsz8e0su8h?itemId=6260e4559882460001404817&imageView2/1/w/320/h/320/q/90', NULL, 1, 2691, 0, 299, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (59, 59, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (60, 60, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (61, 61, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (62, 62, '6268ea4798b03b000118edb8', '干裙带菜干货韩国优质海带脂肪儿童宝宝孕妇无沙免洗 100g一袋', NULL, NULL, '100g一袋', '//qimg.xiaohongshu.com/arkgoods/01024r01kd5bhe81cua0l0w5v7kcd8t42c?itemId=6268ea4798b03b000118edb8&imageView2/1/w/320/h/320/q/90', NULL, 1, 1990, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (63, 63, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (64, 64, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (65, 65, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1161, 0, 129, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (66, 66, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (67, 67, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (68, 68, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1136, 0, 154, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (69, 69, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (70, 70, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (71, 71, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (72, 72, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 2, 2322, 0, 258, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (73, 73, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (74, 74, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (75, 75, '6284ddd4ec09650001a14bb5', '甜酒曲 米酒曲醪糟曲子 做糯米酒酿酵母甜味型风味型8克20袋 8g一袋*20袋', NULL, NULL, '8g一袋*20袋', '//qimg.xiaohongshu.com/arkgoods/01025i01kd5bhe81cua0l16j4yactsbl5o?itemId=6284ddd4ec09650001a14bb5&imageView2/1/w/320/h/320/q/90', NULL, 1, 1990, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (76, 76, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1161, 0, 129, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (77, 77, '6284ddd4ec09650001a14bb5', '甜酒曲 米酒曲醪糟曲子 做糯米酒酿酵母甜味型风味型8克20袋 8g一袋*20袋', NULL, NULL, '8g一袋*20袋', '//qimg.xiaohongshu.com/arkgoods/01025i01kd5bhe81cua0l16j4yactsbl5o?itemId=6284ddd4ec09650001a14bb5&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 1000, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (78, 78, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (79, 79, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (80, 80, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (81, 81, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (82, 82, '6267d2fd5c083a0001f08d46', '正宗盐焗鸡粉家用盐局虾焗海鲜调味专用配料 盐焗粉30g*5包', NULL, NULL, '盐焗粉30g*5包', '//qimg.xiaohongshu.com/arkgoods/01024q01kd5bhe81cua0l14yz5i7frbtze?itemId=6267d2fd5c083a0001f08d46&imageView2/1/w/320/h/320/q/90', NULL, 1, 280, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (83, 83, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (84, 84, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (85, 85, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1161, 0, 129, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (86, 86, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (87, 87, '627796fcc618a40001fe185d', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 欧美白 5寸', NULL, NULL, '欧美白 5寸', '//qimg.xiaohongshu.com/arkgoods/b4acfb19d112eb6a0cbd6f11e055917fb1100c20?itemId=627796fcc618a40001fe185d&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (88, 88, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (89, 89, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (90, 90, '627796f8c618a40001fe1811', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 8寸', NULL, NULL, '深蓝色 8寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f8c618a40001fe1811&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1990, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (91, 91, '6268ea4798b03b000118edb8', '干裙带菜干货韩国优质海带脂肪儿童宝宝孕妇无沙免洗 100g一袋', NULL, NULL, '100g一袋', '//qimg.xiaohongshu.com/arkgoods/01024r01kd5bhe81cua0l0w5v7kcd8t42c?itemId=6268ea4798b03b000118edb8&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (92, 92, '627796fcc618a40001fe185d', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 欧美白 5寸', NULL, NULL, '欧美白 5寸', '//qimg.xiaohongshu.com/arkgoods/b4acfb19d112eb6a0cbd6f11e055917fb1100c20?itemId=627796fcc618a40001fe185d&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (93, 93, '6284ddd4ec09650001a14bb5', '甜酒曲 米酒曲醪糟曲子 做糯米酒酿酵母甜味型风味型8克20袋 8g一袋*20袋', NULL, NULL, '8g一袋*20袋', '//qimg.xiaohongshu.com/arkgoods/01025i01kd5bhe81cua0l16j4yactsbl5o?itemId=6284ddd4ec09650001a14bb5&imageView2/1/w/320/h/320/q/90', NULL, 1, 1791, 0, 199, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (94, 94, '6267d2fd5c083a0001f08d46', '正宗盐焗鸡粉家用盐局虾焗海鲜调味专用配料 盐焗粉30g*5包', NULL, NULL, '盐焗粉30g*5包', '//qimg.xiaohongshu.com/arkgoods/01024q01kd5bhe81cua0l14yz5i7frbtze?itemId=6267d2fd5c083a0001f08d46&imageView2/1/w/320/h/320/q/90', NULL, 1, 280, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (95, 95, '6267d2fd5c083a0001f08d46', '正宗盐焗鸡粉家用盐局虾焗海鲜调味专用配料 盐焗粉30g*5包', NULL, NULL, '盐焗粉30g*5包', '//qimg.xiaohongshu.com/arkgoods/01024q01kd5bhe81cua0l14yz5i7frbtze?itemId=6267d2fd5c083a0001f08d46&imageView2/1/w/320/h/320/q/90', NULL, 1, 1280, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (96, 96, '6260e4559882460001404817', '2瓶油泼辣子香辣麻辣红四川风味油辣椒油家庭辣椒酱凉拌菜调料 香辣味1瓶+麻辣味1瓶', NULL, NULL, '香辣味1瓶+麻辣味1瓶', '//qimg.xiaohongshu.com/arkgoods/01024l01kd5bhe81cua0l0robsz8e0su8h?itemId=6260e4559882460001404817&imageView2/1/w/320/h/320/q/90', NULL, 1, 3690, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (97, 97, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (98, 98, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (99, 99, '6284ddd4ec09650001a14bb5', '甜酒曲 米酒曲醪糟曲子 做糯米酒酿酵母甜味型风味型8克20袋 8g一袋*20袋', NULL, NULL, '8g一袋*20袋', '//qimg.xiaohongshu.com/arkgoods/01025i01kd5bhe81cua0l16j4yactsbl5o?itemId=6284ddd4ec09650001a14bb5&imageView2/1/w/320/h/320/q/90', NULL, 1, 1990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (100, 100, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (101, 101, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (102, 102, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (103, 103, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (104, 104, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (105, 105, '627796fdc618a40001fe1870', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 欧美白 6寸', NULL, NULL, '欧美白 6寸', '//qimg.xiaohongshu.com/arkgoods/b4acfb19d112eb6a0cbd6f11e055917fb1100c20?itemId=627796fdc618a40001fe1870&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 990, 0, 1000, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (106, 106, '6284ddd4ec09650001a14bb5', '甜酒曲 米酒曲醪糟曲子 做糯米酒酿酵母甜味型风味型8克20袋 8g一袋*20袋', NULL, NULL, '8g一袋*20袋', '//qimg.xiaohongshu.com/arkgoods/01025i01kd5bhe81cua0l16j4yactsbl5o?itemId=6284ddd4ec09650001a14bb5&imageView2/1/w/320/h/320/q/90', NULL, 1, 1990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (107, 107, '6267d2fd5c083a0001f08d46', '正宗盐焗鸡粉家用盐局虾焗海鲜调味专用配料 盐焗粉30g*5包', NULL, NULL, '盐焗粉30g*5包', '//qimg.xiaohongshu.com/arkgoods/01024q01kd5bhe81cua0l14yz5i7frbtze?itemId=6267d2fd5c083a0001f08d46&imageView2/1/w/320/h/320/q/90', NULL, 1, 1280, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (108, 108, '627796fdc618a40001fe1870', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 欧美白 6寸', NULL, NULL, '欧美白 6寸', '//qimg.xiaohongshu.com/arkgoods/b4acfb19d112eb6a0cbd6f11e055917fb1100c20?itemId=627796fdc618a40001fe1870&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (109, 109, '627796fcc618a40001fe185d', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 欧美白 5寸', NULL, NULL, '欧美白 5寸', '//qimg.xiaohongshu.com/arkgoods/b4acfb19d112eb6a0cbd6f11e055917fb1100c20?itemId=627796fcc618a40001fe185d&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for s_xhs_order_receiver
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_order_receiver`;
CREATE TABLE `s_xhs_order_receiver`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderId` bigint NOT NULL DEFAULT 0 COMMENT '外键',
  `receiver` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '市',
  `district` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '区',
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单收件人信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_xhs_order_receiver
-- ----------------------------
INSERT INTO `s_xhs_order_receiver` VALUES (1, 17, '张玉慧', '13733564533', '中国', '湖北省', '十堰市', '张湾区', '湖北省十堰市张湾区阳光蓝山郡4-901');
INSERT INTO `s_xhs_order_receiver` VALUES (2, 1, '项一妹', '15988130699', '中国', '浙江省', '杭州市', '富阳区', '浙江省杭州市富阳区鹿山街道陆家村100号');
INSERT INTO `s_xhs_order_receiver` VALUES (3, 2, '黄淑芳', '18922198259', '中国', '广东省', '广州市', '天河区', '广东省广州市天河区广东省广州市天河区黄埔大道中天一庄锦茵阁1004房');
INSERT INTO `s_xhs_order_receiver` VALUES (4, 18, '曾桂华', '13189016523', '中国', '广东省', '广州市', '越秀区', '广东省广州市越秀区达道路丛桂访4号之二402');
INSERT INTO `s_xhs_order_receiver` VALUES (5, 16, '何惠新', '13532112794', '中国', '广东省', '惠州市', '博罗县', '广东省惠州市博罗县观音阁镇桂花街25号霞妹杂货店');
INSERT INTO `s_xhs_order_receiver` VALUES (7, 22, '小林', '13386900590', '中国', '福建省', '莆田市', '仙游县', '福建省莆田市仙游县师范路198号');
INSERT INTO `s_xhs_order_receiver` VALUES (8, 15, '樊爱早', '13881213299', '中国', '四川省', '广元市', '利州区', '四川省广元市利州区恒星城一期');
INSERT INTO `s_xhs_order_receiver` VALUES (9, 14, '朱美玲', '15116201196', '中国', '湖南省', '长沙市', '望城区', '湖南省长沙市望城区白沙洲街道晟通城17栋妈妈团');
INSERT INTO `s_xhs_order_receiver` VALUES (10, 13, '小林', '18683617471', '中国', '广东省', '揭阳市', '揭西县', '广东省揭阳市揭西县凤江镇东新村委五乡村68号');
INSERT INTO `s_xhs_order_receiver` VALUES (11, 11, '林秀荣', '18605094699', '中国', '福建省', '龙岩市', '新罗区', '福建省龙岩市新罗区龙岩技师学院凤凰北路八号');
INSERT INTO `s_xhs_order_receiver` VALUES (12, 9, '何敏', '13971904342', '中国', '湖北省', '十堰市', '茅箭区', '湖北省十堰市茅箭区北京路市民服务中心203室');
INSERT INTO `s_xhs_order_receiver` VALUES (13, 8, '杨霞', '18877125058', '中国', '广西壮族自治区', '贵港市', '港北区', '广西壮族自治区贵港市港北区贵港市港北区恒大城7栋2单元2001房');
INSERT INTO `s_xhs_order_receiver` VALUES (14, 7, '郭娜玲', '13728188777', '中国', '福建省', '厦门市', '思明区', '福建省厦门市思明区莲兴路61号1102');
INSERT INTO `s_xhs_order_receiver` VALUES (15, 6, '董梦莲', '15956546777', '中国', '安徽省', '合肥市', '庐阳区', '安徽省合肥市庐阳区安徽省合肥市庐阳区庐江县达观天下一单元9栋1101');
INSERT INTO `s_xhs_order_receiver` VALUES (16, 5, '你妍妡', '18518634959', '中国', '山东省', '青岛市', '城阳区', '山东省青岛市城阳区时光里3号楼二单元701');
INSERT INTO `s_xhs_order_receiver` VALUES (21, 37, '江帆', '13978529908', '中国', '广西壮族自治区', '玉林市', '玉州区', '广西壮族自治区玉林市玉州区民主中路175号');
INSERT INTO `s_xhs_order_receiver` VALUES (22, 38, '贺红云', '13797396828', '中国', '湖北省', '武汉市', '洪山区', '湖北省武汉市洪山区狮子山街道南李路金地圣爱米伦三号楼二单元2104室');
INSERT INTO `s_xhs_order_receiver` VALUES (23, 39, '陈巧谊', '13516555305', '中国', '广东省', '佛山市', '南海区', '广东省佛山市南海区大沥盐步河东虎榜旧村543号');
INSERT INTO `s_xhs_order_receiver` VALUES (24, 35, '黄女士', '15880291352', '中国', '福建省', '厦门市', '集美区', '福建省厦门市集美区杏林街道杏东路20号香港公馆');
INSERT INTO `s_xhs_order_receiver` VALUES (25, 33, '马红', '19818665666', '中国', '辽宁省', '营口市', '站前区', '辽宁省营口市站前区辽宁省营口市站前区东方庭院A11-22');
INSERT INTO `s_xhs_order_receiver` VALUES (26, 32, '潘金玲', '13544120505', '中国', '广东省', '肇庆市', '四会市', '广东省肇庆市四会市东城街道四会大道南水岸名都水逸角三座');
INSERT INTO `s_xhs_order_receiver` VALUES (27, 31, '许丽涵', '13808543878', '中国', '福建省', '泉州市', '晋江市', '福建省泉州市晋江市安海镇侨城海景湾1期32栋');
INSERT INTO `s_xhs_order_receiver` VALUES (28, 30, '覃维茵', '13677744922', '中国', '广西壮族自治区', '梧州市', '岑溪市', '广西壮族自治区梧州市岑溪市三堡镇三堡中学对面87号');
INSERT INTO `s_xhs_order_receiver` VALUES (29, 29, '何肖合', '18988712207', '中国', '广东省', '东莞市', '', '广东省东莞市广东省东莞市东城区主山上三杞如意四巷14号');
INSERT INTO `s_xhs_order_receiver` VALUES (32, 26, '张榕珍', '13906916876', '中国', '福建省', '福州市', '晋安区', '福建省福州市晋安区西井支路5号建发国宾府一号楼703');
INSERT INTO `s_xhs_order_receiver` VALUES (33, 27, '潘穗钰', '13679537946', '中国', '广东省', '清远市', '清城区', '广东省清远市清城区源潭镇龙凤花苑金太阳托管园');
INSERT INTO `s_xhs_order_receiver` VALUES (34, 28, '杨娇', '13349797723', '中国', '湖北省', '十堰市', '竹山县', '湖北省十堰市竹山县城关镇北大街供销合作社4栋701');
INSERT INTO `s_xhs_order_receiver` VALUES (35, 25, '宁宁', '13533246971', '中国', '广东省', '广州市', '天河区', '广东省广州市天河区沙太路牛利岗天平花苑80号');
INSERT INTO `s_xhs_order_receiver` VALUES (36, 23, '关瑞红', '15819165470', '中国', '广东省', '阳江市', '江城区', '广东省阳江市江城区金碧路9号金碧园西街12号');
INSERT INTO `s_xhs_order_receiver` VALUES (37, 24, '章可可', '13732472279', '中国', '浙江省', '宁波市', '宁海县', '浙江省宁波市宁海县西店镇爱森电器有限公司');
INSERT INTO `s_xhs_order_receiver` VALUES (38, 19, '杨肖肖', '15657670673', '中国', '浙江省', '台州市', '临海市', '浙江省台州市临海市伟星和院1-1-501室');
INSERT INTO `s_xhs_order_receiver` VALUES (40, 4, '谢三琳', '15874715678', '中国', '湖南省', '衡阳市', '耒阳市', '湖南省衡阳市耒阳市南外街79号前进小学');
INSERT INTO `s_xhs_order_receiver` VALUES (41, 3, '何敏', '13971904342', '中国', '湖北省', '十堰市', '茅箭区', '湖北省十堰市茅箭区北京路市民服务中心203室');
INSERT INTO `s_xhs_order_receiver` VALUES (42, 20, '王倪玲', '15917358816', '中国', '广东省', '广州市', '从化区', '广东省广州市从化区街口街镇南路32岁');
INSERT INTO `s_xhs_order_receiver` VALUES (43, 36, '邓婉华', '15397082367', '中国', '浙江省', '杭州市', '西湖区', '浙江省杭州市西湖区石马新村186-1');
INSERT INTO `s_xhs_order_receiver` VALUES (45, 41, '郑文武', '13609412345', '中国', '重庆', '重庆市', '江津区', '重庆重庆市江津区维多利亚菜鸟驿站');
INSERT INTO `s_xhs_order_receiver` VALUES (46, 40, '吉江玲', '13574894292', '中国', '湖南省', '长沙市', '浏阳市', '湖南省长沙市浏阳市恒大华府一期20栋');
INSERT INTO `s_xhs_order_receiver` VALUES (47, 42, '曹晓红', '13530655282', '中国', '广东省', '惠州市', '惠阳区', '广东省惠州市惠阳区秋长镇白石唐井人才公寓管理处');
INSERT INTO `s_xhs_order_receiver` VALUES (48, 43, '张静瑶', '13318519872', '中国', '广东省', '茂名市', '茂南区', '广东省茂名市茂南区茂名市中德大道碧桂园城央首府');
INSERT INTO `s_xhs_order_receiver` VALUES (51, 46, '李冬', '13536758882', '中国', '广东省', '东莞市', '', '广东省东莞市厚街镇白濠世纪绿洲顺景轩3单元1604');
INSERT INTO `s_xhs_order_receiver` VALUES (52, 45, '孟令敏', '13942294413', '中国', '辽宁省', '鞍山市', '立山区', '辽宁省鞍山市立山区通山街8栋37号');
INSERT INTO `s_xhs_order_receiver` VALUES (53, 44, '刘志', '13631622122', '中国', '广东省', '深圳市', '南山区', '广东省深圳市南山区华侨城佛山街2栋010');
INSERT INTO `s_xhs_order_receiver` VALUES (54, 47, '蔡丁妍', '13675778087', '中国', '浙江省', '绍兴市', '诸暨市', '浙江省绍兴市诸暨市浙江省绍兴市诸暨市陶朱街道北二环路29号富润纺织有限公司');
INSERT INTO `s_xhs_order_receiver` VALUES (55, 49, '陈姗姗', '18681535607', '中国', '广东省', '深圳市', '宝安区', '广东省深圳市宝安区宝民一路1巷65号新玥庭3单元715');
INSERT INTO `s_xhs_order_receiver` VALUES (56, 48, '杨伟', '18307851333', '中国', '广西壮族自治区', '贵港市', '桂平市', '广西壮族自治区贵港市桂平市广西壮族自治区贵港市桂平市白沙镇政府门边');
INSERT INTO `s_xhs_order_receiver` VALUES (57, 51, '郑霞', '13788215648', '中国', '广西壮族自治区', '南宁市', '邕宁区', '广西壮族自治区南宁市邕宁区广西壮族自治区南宁市邕宁区滨堤路万达茂御峰国际D9栋一单元');
INSERT INTO `s_xhs_order_receiver` VALUES (58, 52, '喜乐', '13612843357', '中国', '广东省', '惠州市', '惠阳区', '广东省惠州市惠阳区龙光城北二期');
INSERT INTO `s_xhs_order_receiver` VALUES (59, 53, '贺爱群', '13590470149', '中国', '广东省', '深圳市', '宝安区', '广东省深圳市宝安区福永怀德翠岗工业五区A栋');
INSERT INTO `s_xhs_order_receiver` VALUES (60, 54, '刘晓枝', '15173604588', '中国', '湖南省', '常德市', '武陵区', '湖南省常德市武陵区湖南常德武陵区锦都豪苑8栋一单元201');
INSERT INTO `s_xhs_order_receiver` VALUES (61, 55, '王金芝', '18500338140', '中国', '福建省', '厦门市', '湖里区', '福建省厦门市湖里区兴隆路博士山庄272号');
INSERT INTO `s_xhs_order_receiver` VALUES (62, 57, '韦红春', '18922853408', '中国', '广东省', '深圳市', '宝安区', '广东省深圳市宝安区沙井街道共和社区福和路西四巷二十九号');
INSERT INTO `s_xhs_order_receiver` VALUES (63, 58, '雪儿', '15371179788', '中国', '江苏省', '盐城市', '大丰区', '江苏省盐城市大丰区朝阳景都21号楼');
INSERT INTO `s_xhs_order_receiver` VALUES (64, 59, '宋女士', '13925052889', '中国', '广东省', '广州市', '荔湾区', '广东省广州市荔湾区黄沙大道201号2305');
INSERT INTO `s_xhs_order_receiver` VALUES (65, 60, '段香凤', '13970717838', '中国', '江西省', '赣州市', '章贡区', '江西省赣州市章贡区恒大名都6栋3204');
INSERT INTO `s_xhs_order_receiver` VALUES (66, 61, '维维', '15868600530', '中国', '浙江省', '金华市', '义乌市', '浙江省金华市义乌市浙江省金华市义乌市北苑街道四季三区16栋5单元202 ');
INSERT INTO `s_xhs_order_receiver` VALUES (67, 62, '维维', '15868600530', '中国', '浙江省', '金华市', '义乌市', '浙江省金华市义乌市浙江省金华市义乌市北苑街道四季三区16栋5单元202 ');
INSERT INTO `s_xhs_order_receiver` VALUES (68, 63, '邵金海', '13066910777', '中国', '广东省', '深圳市', '盐田区', '广东省深圳市盐田区北山道138号中国交建');
INSERT INTO `s_xhs_order_receiver` VALUES (69, 64, '雪花', '15946636877', '中国', '广东省', '湛江市', '霞山区', '广东省湛江市霞山区文明北一路南苑家属区');
INSERT INTO `s_xhs_order_receiver` VALUES (70, 65, '朱红芳', '18680677802', '中国', '广东省', '深圳市', '龙华区', '广东省深圳市龙华区民治街道龙岸花园5栋21A');
INSERT INTO `s_xhs_order_receiver` VALUES (71, 66, '方平', '13751576178', '中国', '广东省', '惠州市', '惠阳区', '广东省惠州市惠阳区大亚湾西区龙海二路42号阳光圣菲1栋');
INSERT INTO `s_xhs_order_receiver` VALUES (72, 67, '小谢', '13715774207', '中国', '广东省', '潮州市', '潮安区', '广东省潮州市潮安区广东省潮州市潮安区金石镇后溪街桐君堂');
INSERT INTO `s_xhs_order_receiver` VALUES (73, 68, '叶琳', '13509538299', '中国', '福建省', '南平市', '顺昌县', '福建省南平市顺昌县顺兴小区发展楼46号新诚广告');
INSERT INTO `s_xhs_order_receiver` VALUES (74, 69, '伍燕霞', '13536990569', '中国', '广东省', '肇庆市', '四会市', '广东省肇庆市四会市贞山区美的公园大观一诺教育');
INSERT INTO `s_xhs_order_receiver` VALUES (75, 70, '孙惠莉', '18680164427', '中国', '广东省', '中山市', '', '广东省中山市石岐区清溪路万科金域蓝湾一期5标1栋502');
INSERT INTO `s_xhs_order_receiver` VALUES (76, 71, '莫生', '18565688823', '中国', '广东省', '深圳市', '宝安区', '广东省深圳市宝安区石岩街道科技四路悦城小区E5-1-1608');
INSERT INTO `s_xhs_order_receiver` VALUES (77, 72, '卢大仁', '13902880730', '中国', '广东省', '江门市', '蓬江区', '广东省江门市蓬江区迎宾大道西九号（农业银行）');
INSERT INTO `s_xhs_order_receiver` VALUES (78, 73, '李丽华', '13600359797', '中国', '广东省', '江门市', '台山市', '广东省江门市台山市冲蒌镇，沙坦村');
INSERT INTO `s_xhs_order_receiver` VALUES (79, 74, '容秀辉', '18807872003', '中国', '广西壮族自治区', '钦州市', '浦北县', '广西壮族自治区钦州市浦北县小江镇自取（备注：请不要发申通快递，谢谢）');
INSERT INTO `s_xhs_order_receiver` VALUES (80, 75, '贺康华', '15171472506', '中国', '湖北省', '武汉市', '硚口区', '湖北省武汉市硚口区宝丰街道雍豪府20-2-3103');
INSERT INTO `s_xhs_order_receiver` VALUES (81, 76, '林培贞', '13433399682', '中国', '广东省', '汕头市', '澄海区', '广东省汕头市澄海区澄江路金璟苑');
INSERT INTO `s_xhs_order_receiver` VALUES (82, 78, '李学成', '18769994321', '中国', '山东省', '临沂市', '郯城县', '山东省临沂市郯城县庙山镇陈邵庄村');
INSERT INTO `s_xhs_order_receiver` VALUES (83, 80, '张燕', '13880718505', '中国', '四川省', '成都市', '龙泉驿区', '四川省成都市龙泉驿区四川省成都市龙泉驿区柏合镇黎明新村四期B区三栋二单元');
INSERT INTO `s_xhs_order_receiver` VALUES (84, 79, '秦洁霞', '13772018023', '中国', '陕西省', '西安市', '雁塔区', '陕西省西安市雁塔区高新路水晶城A座');
INSERT INTO `s_xhs_order_receiver` VALUES (85, 83, '谢洪淋', '15107821559', '中国', '广西壮族自治区', '来宾市', '兴宾区', '广西壮族自治区来宾市兴宾区平阳镇学校小学部');
INSERT INTO `s_xhs_order_receiver` VALUES (86, 82, '陈玲', '18173201308', '中国', '湖南省', '湘潭市', '湘乡市', '湖南省湘潭市湘乡市云锦花苑3栋1101');
INSERT INTO `s_xhs_order_receiver` VALUES (87, 81, '李槟槟', '13686236492', '中国', '广东省', '东莞市', '', '广东省东莞市南城区城市立方1栋410');
INSERT INTO `s_xhs_order_receiver` VALUES (88, 86, '黄强', '18376777956', '中国', '广西壮族自治区', '南宁市', '西乡塘区', '广西壮族自治区南宁市西乡塘区广西南宁市西乡塘区安吉街道屯里村安圩路23号');
INSERT INTO `s_xhs_order_receiver` VALUES (89, 85, '陈记', '13537752390', '中国', '广东省', '深圳市', '光明区', '广东省深圳市光明区圳美新围313号');
INSERT INTO `s_xhs_order_receiver` VALUES (90, 84, '刘俐君', '13973626964', '中国', '湖南省', '常德市', '武陵区', '湖南省常德市武陵区丹阳路紫荆庭院2栋3单元205');
INSERT INTO `s_xhs_order_receiver` VALUES (91, 87, '薛婷', '19811784698', '中国', '山东省', '青岛市', '市北区', '山东省青岛市市北区阜新路抚顺路11号青岛理工大学市北校区');
INSERT INTO `s_xhs_order_receiver` VALUES (93, 88, '高雪', '13644926024', '中国', '辽宁省', '鞍山市', '铁西区', '辽宁省鞍山市铁西区永发街道马驿屯菜鸟驿站');
INSERT INTO `s_xhs_order_receiver` VALUES (94, 89, '陈久久', '13450333376', '中国', '广东省', '广州市', '天河区', '广东省广州市天河区车陂街道车陂东溪大街23号');
INSERT INTO `s_xhs_order_receiver` VALUES (95, 90, '齐李平', '1812****144', '中国', '广东省', '深圳市', '宝安区', '广东省深圳市宝安区新安街道海富社区新城花园四栋407');
INSERT INTO `s_xhs_order_receiver` VALUES (96, 91, '周梦颖', '18770452994', '中国', '广东省', '广州市', '荔湾区', '广东省广州市荔湾区龙津街道人民中路375号(近儿童医院) 广州东升医院三围街3号302房');
INSERT INTO `s_xhs_order_receiver` VALUES (97, 92, '陈彬彬', '15669836389', '中国', '浙江省', '台州市', '临海市', '浙江省台州市临海市经济开发区东方大道605号');
INSERT INTO `s_xhs_order_receiver` VALUES (98, 93, '邱红梅', '15986410557', '中国', '广东省', '广州市', '增城区', '广东省广州市增城区中新镇福和车站对面驿站');
INSERT INTO `s_xhs_order_receiver` VALUES (99, 94, '小九', '18878945311', '中国', '广东省', '中山市', '', '广东省中山市东升镇同乐村委后面G2栋');
INSERT INTO `s_xhs_order_receiver` VALUES (100, 96, '朱华丽', '13914051339', '中国', '江苏省', '苏州市', '相城区', '江苏省苏州市相城区相城区黄桥镇荷美各邸');
INSERT INTO `s_xhs_order_receiver` VALUES (101, 100, '陈佳歆', '15892610731', '中国', '四川省', '成都市', '青羊区', '四川省成都市青羊区楞伽庵街37号3单元');
INSERT INTO `s_xhs_order_receiver` VALUES (102, 98, '吴诗薇', '15623934952', '中国', '湖北省', '襄阳市', '枣阳市', '湖北省襄阳市枣阳市人民路 新华书店 门卫室');
INSERT INTO `s_xhs_order_receiver` VALUES (103, 97, '曲圣全', '15040639321', '中国', '辽宁省', '大连市', '沙河口区', '辽宁省大连市沙河口区大连市 沙河口区 五一广场 大胜街 鑫联友汽配');
INSERT INTO `s_xhs_order_receiver` VALUES (104, 0, '英', '15068659387', '中国', '浙江省', '台州市', '温岭市', '太平街道星光南路99号A幢4单元707');
INSERT INTO `s_xhs_order_receiver` VALUES (105, 0, '丁辰', '13863151151', '中国', '山东省', '威海市', '环翠区', '高区一品莲花城合家欢');

-- ----------------------------
-- Table structure for s_xhs_order_settle
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_order_settle`;
CREATE TABLE `s_xhs_order_settle`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单号',
  `afterSaleNo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '售后单号',
  `orderCreateTime` datetime NOT NULL COMMENT '订单创建时间',
  `orderSettleTime` datetime NOT NULL COMMENT '结算时间',
  `transactionType` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '交易类型',
  `settleAccount` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '结算账户',
  `amount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '动账金额',
  `settleAmount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '结算金额',
  `goodsAmount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '商品实付/实退',
  `freightAmount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '运费实付/实退',
  `platformDiscount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '平台优惠',
  `goodsTax` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '商品税金',
  `freightTax` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '运费税金',
  `commission` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金',
  `paymentChannelFee` decimal(6, 2) NOT NULL COMMENT '支付渠道费',
  `distributionCommission` decimal(6, 2) NOT NULL COMMENT '分销佣金',
  `huabeiFee` decimal(6, 2) NOT NULL COMMENT '花呗手续费',
  `remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '小红书店铺订单结算明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_xhs_order_settle
-- ----------------------------
INSERT INTO `s_xhs_order_settle` VALUES (1, 'P650962492423135701', '-', '2022-04-26 16:41:32', '2022-05-14 14:43:54', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-16 18:24:32');
INSERT INTO `s_xhs_order_settle` VALUES (2, 'P650730626873861291', '-', '2022-04-24 00:17:06', '2022-05-14 11:12:36', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:32');
INSERT INTO `s_xhs_order_settle` VALUES (3, 'P650689352935451771', '-', '2022-04-23 12:49:12', '2022-05-14 11:08:31', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-16 18:24:32');
INSERT INTO `s_xhs_order_settle` VALUES (4, 'P650722151211113551', '-', '2022-04-23 21:55:51', '2022-05-14 11:08:29', '结算入账', '店铺余额', 60.82, 64.50, 64.50, 0.00, 0.00, 0.00, 0.00, -3.23, -0.45, 0.00, 0.00, '', '2022-05-16 18:24:32');
INSERT INTO `s_xhs_order_settle` VALUES (5, 'P650639118014134591', '-', '2022-04-22 22:51:58', '2022-05-14 11:07:23', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (6, 'P650607608703188391', '-', '2022-04-22 14:06:48', '2022-05-14 11:07:20', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (7, 'P650524724621383351', '-', '2022-04-21 15:05:24', '2022-05-14 11:07:09', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (8, 'P650539319449109001', '-', '2022-04-21 19:08:39', '2022-05-14 11:07:04', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (9, 'P650383653706249041', '-', '2022-04-19 23:54:13', '2022-05-14 11:06:56', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (10, 'P650204635265986711', '-', '2022-04-17 22:10:35', '2022-05-04 20:03:28', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (11, 'P650354860921382131', '-', '2022-04-19 15:54:20', '2022-05-21 13:33:24', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-21 21:18:21');
INSERT INTO `s_xhs_order_settle` VALUES (12, 'P650350589611937961', '-', '2022-04-19 14:43:09', '2022-05-21 13:33:23', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-21 21:18:24');
INSERT INTO `s_xhs_order_settle` VALUES (13, 'P650267146717991681', '-', '2022-04-18 15:32:26', '2022-05-21 13:03:39', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (14, 'P650192591567693891', '-', '2022-04-17 18:49:51', '2022-05-21 13:03:32', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (15, 'P650198151453596501', '-', '2022-04-17 20:22:31', '2022-05-21 13:03:32', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (16, 'P650179651361905981', '-', '2022-04-17 15:14:11', '2022-05-21 13:03:28', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (17, 'P650179468150156771', '-', '2022-04-17 15:11:08', '2022-05-21 13:03:28', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (18, 'P651365028037549841', '-', '2022-05-01 08:30:28', '2022-05-21 10:46:13', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (19, 'P650167408349459561', '-', '2022-04-17 11:50:08', '2022-05-20 11:03:23', '结算入账', '店铺余额', 9.33, 9.90, 9.90, 0.00, 0.00, 0.00, 0.00, -0.50, -0.07, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (20, 'P650171958868691791', '-', '2022-04-17 13:05:58', '2022-05-20 11:03:23', '结算入账', '店铺余额', 9.33, 9.90, 9.90, 0.00, 0.00, 0.00, 0.00, -0.50, -0.07, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (21, 'P650171459360675721', '-', '2022-04-17 12:57:39', '2022-05-20 11:03:23', '结算入账', '店铺余额', 18.67, 19.80, 19.80, 0.00, 0.00, 0.00, 0.00, -0.99, -0.14, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (22, 'P650158023327622691', '-', '2022-04-17 09:13:43', '2022-05-20 11:03:22', '结算入账', '店铺余额', 9.33, 9.90, 9.90, 0.00, 0.00, 0.00, 0.00, -0.50, -0.07, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (23, 'P650160674547164571', '-', '2022-04-17 09:57:54', '2022-05-20 11:03:22', '结算入账', '店铺余额', 9.33, 9.90, 9.90, 0.00, 0.00, 0.00, 0.00, -0.50, -0.07, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (24, 'P651244863186803631', '-', '2022-04-29 23:07:43', '2022-05-20 10:40:04', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (25, 'P651300639424889331', '-', '2022-04-30 14:37:19', '2022-05-20 10:12:45', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (26, 'P650152018833195301', '-', '2022-04-17 07:33:38', '2022-05-17 21:31:30', '结算入账', '店铺余额', 18.67, 19.80, 19.80, 0.00, 0.00, 0.00, 0.00, -0.99, -0.14, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (27, 'P651060035066681871', '-', '2022-04-27 19:47:15', '2022-05-17 11:39:19', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (28, 'P651028113417290361', '-', '2022-04-27 10:55:13', '2022-05-17 11:39:01', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (29, 'P651498332963710841', '-', '2022-05-02 21:32:12', '2022-05-22 10:18:31', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-22 10:23:53');
INSERT INTO `s_xhs_order_settle` VALUES (30, 'P651443046272776771', '-', '2022-05-02 06:10:46', '2022-05-22 10:18:08', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-22 10:23:53');
INSERT INTO `s_xhs_order_settle` VALUES (31, 'P650383282927259341', '-', '2022-04-19 23:48:02', '2022-05-22 12:03:59', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (32, 'P650340391360421501', '-', '2022-04-19 11:53:11', '2022-05-22 12:03:58', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (33, 'P650335287016742621', '-', '2022-04-19 10:28:07', '2022-05-22 12:03:57', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (34, 'P650278762052431911', '-', '2022-04-18 18:46:02', '2022-05-22 12:03:51', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (35, 'P650293854639134681', '-', '2022-04-18 22:57:34', '2022-05-22 12:03:51', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (36, 'P650263987743987401', '-', '2022-04-18 14:39:47', '2022-05-22 12:03:50', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (37, 'P650266326386558551', '-', '2022-04-18 15:18:46', '2022-05-22 12:03:50', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (38, 'P650273202701600891', '-', '2022-04-18 17:13:22', '2022-05-22 12:03:50', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (39, 'P650251254103670461', '-', '2022-04-18 11:07:34', '2022-05-22 11:33:02', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (40, 'P650239311288237481', '-', '2022-04-18 07:48:31', '2022-05-22 11:33:02', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (41, 'P650250238123400311', '-', '2022-04-18 10:50:38', '2022-05-22 11:33:02', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (42, 'P650251473635210141', '-', '2022-04-18 11:11:13', '2022-05-22 11:33:02', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (43, 'P650254633938588711', '-', '2022-04-18 12:03:53', '2022-05-22 11:33:01', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (44, 'P650258991490298871', '-', '2022-04-18 13:16:31', '2022-05-22 11:33:01', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (45, 'P650253875620338531', '-', '2022-04-18 11:51:15', '2022-05-22 11:33:00', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (46, 'P650205653267210151', '-', '2022-04-17 22:27:33', '2022-05-22 11:32:55', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:01');
INSERT INTO `s_xhs_order_settle` VALUES (47, 'P650204286108172701', '-', '2022-04-17 22:04:46', '2022-05-22 11:32:55', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:01');
INSERT INTO `s_xhs_order_settle` VALUES (48, 'P650201514407536671', '-', '2022-04-17 21:18:34', '2022-05-22 11:32:54', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:01');
INSERT INTO `s_xhs_order_settle` VALUES (49, 'P652107941351324701', '-', '2022-05-09 22:52:21', '2022-05-30 11:35:41', '结算入账', '店铺余额', 18.76, 19.90, 19.90, 0.00, 0.00, 0.00, 0.00, -1.00, -0.14, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (50, 'P652108040599855541', '-', '2022-05-09 22:54:00', '2022-05-30 11:05:58', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (51, 'P652331849177761981', '-', '2022-05-12 13:04:09', '2022-05-28 22:36:10', '结算入账', '店铺余额', 12.23, 12.90, 2.90, 0.00, 10.00, 0.00, 0.00, -0.65, -0.02, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (52, 'P652006673545485701', '-', '2022-05-08 18:44:33', '2022-05-28 14:09:22', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (53, 'P651941129187172881', '-', '2022-05-08 00:32:09', '2022-05-28 14:08:56', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (54, 'P651877675430739391', '-', '2022-05-07 06:54:35', '2022-05-27 17:37:38', '结算入账', '店铺余额', 28.21, 29.90, 26.91, 0.00, 2.99, 0.00, 0.00, -1.50, -0.19, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (55, 'P651745605368708111', '-', '2022-05-05 18:13:25', '2022-05-26 11:04:34', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-31 21:35:07');

-- ----------------------------
-- Table structure for s_xhs_refund
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_refund`;
CREATE TABLE `s_xhs_refund`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `returnsId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '小红书店铺售后id',
  `returnType` int NOT NULL COMMENT '退货类型 1-退货退款, 2-换货, 3:仅退款(old) 4:仅退款(new) 理论上不会有3出现 5:未发货仅退款',
  `reasonId` int NULL DEFAULT NULL COMMENT '售后原因id',
  `shopId` int NOT NULL,
  `reason` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '售后原因说明',
  `status` int NOT NULL COMMENT '售后状态 1:待审核 2:待用户寄回 3:待收货 4:完成 5:取消 6:关闭 9:拒绝 9999:删除',
  `subStatus` int NULL DEFAULT NULL COMMENT '售后子状态 301-待审核 302-快递已签收 304-收货异常',
  `receiveAbnormalType` int NULL DEFAULT NULL COMMENT '收货异常类型',
  `packageId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单id',
  `exchangePackageId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '换货订单id',
  `createdTime` bigint NOT NULL DEFAULT 0,
  `returnExpressNo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0',
  `returnExpressCompany` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0',
  `returnAddress` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0',
  `shipNeeded` int NOT NULL DEFAULT 0 COMMENT '是否需要寄回 1-需要 0-不需要',
  `refunded` tinyint NOT NULL DEFAULT 0 COMMENT '是否已退款',
  `refundStatus` int NOT NULL DEFAULT 0 COMMENT '退款状态 108触发退款 1退款中 3退款失败 2退款成功 401已取消 101已创建 201待审核 301审核通过 302审核不通过 402自动关闭',
  `refundTime` bigint NOT NULL DEFAULT 0 COMMENT '退款时间',
  `fillExpressTime` bigint NOT NULL DEFAULT 0,
  `expressSignTime` bigint NOT NULL DEFAULT 0,
  `refundFee` double NOT NULL DEFAULT 0,
  `returnExpressRefundable` int NOT NULL DEFAULT 0,
  `returnExpressRefunded` int NOT NULL DEFAULT 0,
  `expectRefundFee` double NOT NULL DEFAULT 0,
  `autoReceiveDeadline` bigint NOT NULL DEFAULT 0 COMMENT '自动确认收货时间',
  `updateTime` bigint NOT NULL DEFAULT 0,
  `erpSendStatus` int NOT NULL DEFAULT 0 COMMENT 'erp系统发货状态（判断是否出库是否需要拦截）0未处理2已出库',
  `returnExpressCompanyCode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '退货快递公司编号',
  `createOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifyOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小红书订单退款表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_xhs_refund
-- ----------------------------
INSERT INTO `s_xhs_refund` VALUES (1, 'R8940930165177103', 5, 600094, 21, '多拍/拍错/不想要', 4, 201, 0, 'P650254826789409301', NULL, 1650365177103, NULL, NULL, NULL, -1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1650449230818, 0, NULL, '2022-04-20 12:28:11', '2022-04-20 18:07:10');
INSERT INTO `s_xhs_refund` VALUES (2, 'R7231546168933888', 5, 600097, 21, '发货时间太长', 4, 201, 0, 'P650262840072315461', NULL, 1650768933888, NULL, NULL, NULL, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1650772500834, 2, NULL, '2022-05-01 19:53:14', '2022-05-02 11:11:18');

-- ----------------------------
-- Table structure for s_xhs_refund_item
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_refund_item`;
CREATE TABLE `s_xhs_refund_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `refundId` bigint NOT NULL COMMENT '外键',
  `itemId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '商品id',
  `itemName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `boughtCount` int NULL DEFAULT NULL,
  `appliedCount` int NULL DEFAULT NULL,
  `returnedCount` int NULL DEFAULT NULL,
  `refundedCount` int NULL DEFAULT NULL,
  `returnPrice` int NULL DEFAULT NULL,
  `exchangeItemId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `exchangeItemName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `exchangeItemImage` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `skucode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `exchangeSkucode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小红书订单退款明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of s_xhs_refund_item
-- ----------------------------

-- ----------------------------
-- Table structure for scm_purchase_contract
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_contract`;
CREATE TABLE `scm_purchase_contract`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact_id` bigint NULL DEFAULT NULL COMMENT '供应商id',
  `bill_no` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '单据编号',
  `contractNo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `billDate` date NULL DEFAULT NULL COMMENT '单据日期',
  `userId` smallint NULL DEFAULT 0 COMMENT '制单人id',
  `userName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '制单人',
  `transType` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '交易类型:BUY购货 BUYR退货 SALE销售 SALER退销 OTHER其他入库',
  `transTypeName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '交易类型名称',
  `totalAmount` decimal(10, 2) NULL DEFAULT NULL COMMENT '购货总金额',
  `disRate` double NULL DEFAULT 0 COMMENT '整单折扣率',
  `disAmount` double NULL DEFAULT 0 COMMENT '整单折扣金额',
  `amount` double NULL DEFAULT 0 COMMENT '折扣后金额',
  `totalDiscount` double NULL DEFAULT 0 COMMENT '总折扣（计算商品折扣和整单折扣之和）',
  `totalQuantity` bigint NULL DEFAULT 0 COMMENT '总数量',
  `qualifiedQuantity` bigint NULL DEFAULT 0 COMMENT '合格数量',
  `inQuantity` bigint NULL DEFAULT 0 COMMENT '已入库数量(已出库数量)',
  `rpAmount` double NULL DEFAULT 0 COMMENT '本次付款',
  `arrears` double NULL DEFAULT 0 COMMENT '本次欠款',
  `freight` double NULL DEFAULT 0 COMMENT '运费',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `billType` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'PO采购订单 OI其他入库 PUR采购入库 BAL初期余额',
  `billStatus` tinyint(1) NULL DEFAULT 0 COMMENT '订单状态 0待审核1正常2已作废3已入库 11已验货',
  `isDelete` tinyint(1) NULL DEFAULT 0 COMMENT '1删除  0正常',
  `checkName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '采购单审核人',
  `checked` tinyint(1) NULL DEFAULT 0 COMMENT '采购单审核状态0待审核1已审核',
  `createTime` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `modifyTime` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `salesId` smallint NULL DEFAULT NULL,
  `customerFree` double NULL DEFAULT 0 COMMENT '客户承担费用',
  `hxStateCode` tinyint NULL DEFAULT 0 COMMENT '核销状态 0未付款  1部分付款  2全部付款',
  `hxAmount` double NULL DEFAULT 0 COMMENT '本次核销金额',
  `payment` double NULL DEFAULT 0 COMMENT '本次预收款',
  `srcOrderNo` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '订单编号',
  `srcOrderId` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `logisticsNo` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '快递物流单号（）',
  `logisticsCompany` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `logisticsCompanyCode` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物流公司代码',
  `logisticsNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `locationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '仓库id多个,分割',
  `inLocationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '调入仓库ID多个,分割',
  `outLocationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '调出仓库ID多个,分割',
  `serialno` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '序列号',
  `checkoutName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检验人',
  `checkoutTime` bigint NULL DEFAULT 0 COMMENT '检验时间',
  `checkoutStatus` int NULL DEFAULT 0 COMMENT '0 未检验  1已检验',
  `qualifiedStatus` int NULL DEFAULT 0 COMMENT '0为合格数量为0,1为合格数量不为0',
  `stockInName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '入库人',
  `stockInTime` bigint NULL DEFAULT 0 COMMENT '入库时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '采购单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_purchase_contract
-- ----------------------------

-- ----------------------------
-- Table structure for scm_purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_order`;
CREATE TABLE `scm_purchase_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact_id` bigint NOT NULL COMMENT '供应商id',
  `order_no` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_date` date NOT NULL COMMENT '订单日期',
  `order_time` bigint NOT NULL COMMENT '订单创建时间',
  `order_amount` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `ship_amount` decimal(6, 2) NOT NULL COMMENT '物流费用',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态 0待审核1已审核101供应商已确认102供应商已发货2已收货3已入库',
  `audit_user` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '采购单审核人',
  `audit_time` bigint NULL DEFAULT 0 COMMENT '审核时间',
  `supplier_confirm_time` datetime NULL DEFAULT NULL COMMENT '供应商确认时间',
  `supplier_delivery_time` datetime NULL DEFAULT NULL COMMENT '供应商发货时间',
  `received_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `stock_in_time` datetime NULL DEFAULT NULL COMMENT '入库时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 470 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '采购订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_purchase_order
-- ----------------------------
INSERT INTO `scm_purchase_order` VALUES (466, 33, 'PUR20240116144408', '2024-01-16', 1705387448, 190.00, 0.00, NULL, 3, '启航', 1705387461, '2024-01-16 14:44:30', '2024-01-16 14:49:49', '2024-01-16 00:00:00', '2024-01-16 14:50:58', 'admin', '2024-01-16 14:44:09', 'admin', '2024-01-16 14:50:58');
INSERT INTO `scm_purchase_order` VALUES (467, 33, 'PUR20240128113656', '2024-01-28', 1706413016, 42.00, 10.00, NULL, 102, '启航', 1706413030, '2024-01-28 11:42:19', '2024-01-28 12:07:32', NULL, NULL, 'admin', '2024-01-28 11:36:56', 'admin', '2024-01-28 12:07:32');
INSERT INTO `scm_purchase_order` VALUES (468, 31, 'PUR20240424162152', '2024-04-24', 1713946912, 420.00, 12.00, NULL, 3, 'qh', 1713946921, '2024-04-24 16:22:14', '2024-04-24 16:22:40', '2024-05-25 00:00:00', '2024-05-25 09:40:04', 'admin', '2024-04-24 16:21:52', 'admin', '2024-05-25 09:40:04');
INSERT INTO `scm_purchase_order` VALUES (469, 33, 'PUR20240525093505', '2024-05-25', 1716600905, 210.00, 0.00, NULL, 3, 'q', 1716600916, '2024-05-25 09:35:21', '2024-05-25 09:35:36', '2024-05-25 00:00:00', '2024-05-25 09:35:57', 'admin', '2024-05-25 09:35:06', 'admin', '2024-05-25 09:35:57');

-- ----------------------------
-- Table structure for scm_purchase_order_cost
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_order_cost`;
CREATE TABLE `scm_purchase_order_cost`  (
  `id` bigint NOT NULL COMMENT '采购单ID（主键）',
  `order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '采购单金额',
  `order_date` date NULL DEFAULT NULL COMMENT '采购订单日期',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采购订单编号',
  `order_spec_unit` int NULL DEFAULT NULL COMMENT '采购订单商品规格数',
  `order_goods_unit` int NULL DEFAULT NULL COMMENT '采购订单商品数',
  `order_spec_unit_total` int NULL DEFAULT NULL COMMENT '采购订单总件数',
  `actual_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际金额',
  `freight` decimal(6, 2) NULL DEFAULT NULL COMMENT '运费',
  `confirm_user` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认人',
  `confirm_time` datetime NULL DEFAULT NULL COMMENT '确认时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '已支付金额',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `pay_count` int NULL DEFAULT NULL COMMENT '支付次数',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  `status` int NULL DEFAULT NULL COMMENT '状态（0未支付1已支付）',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采购订单费用确认表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_purchase_order_cost
-- ----------------------------
INSERT INTO `scm_purchase_order_cost` VALUES (466, 190.00, '2024-01-16', 'PUR20240116144408', 1, 1, 10, 190.00, 0.00, '启航', '2024-01-16 00:00:00', 'admin', 190.00, NULL, 0, NULL, 0, 'admin', '2024-04-17 14:02:43');
INSERT INTO `scm_purchase_order_cost` VALUES (468, 420.00, '2024-04-24', 'PUR20240424162152', 1, 1, 10, 420.00, 0.00, 'q', '2024-04-24 00:00:00', 'admin', 12.00, '2024-04-24 00:00:00', 0, '12', 0, 'admin', '2024-04-24 16:23:47');
INSERT INTO `scm_purchase_order_cost` VALUES (469, 210.00, '2024-05-25', 'PUR20240525093505', 1, 1, 10, 210.00, 0.00, 'q', '2024-05-25 09:35:21', 'admin', 0.00, NULL, 0, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for scm_purchase_order_item
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_order_item`;
CREATE TABLE `scm_purchase_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NULL DEFAULT 0 COMMENT '订单id',
  `order_no` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '订单编号',
  `transType` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '150501采购 150502退货',
  `amount` double NULL DEFAULT 0 COMMENT '购货金额',
  `order_date` date NULL DEFAULT NULL COMMENT '订单日期',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  `goods_id` bigint NULL DEFAULT 0 COMMENT '商品ID',
  `goods_num` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `spec_id` bigint NULL DEFAULT 0 COMMENT '商品规格id',
  `spec_num` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品规格编码',
  `color_value` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `color_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `size_value` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `style_value` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '款式',
  `price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '单价',
  `dis_amount` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '折扣额',
  `dis_rate` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '折扣率',
  `quantity` bigint NOT NULL DEFAULT 0 COMMENT '数量(采购单据)',
  `inQty` bigint NOT NULL DEFAULT 0 COMMENT '已入库数量',
  `locationId` int NULL DEFAULT NULL COMMENT '入库的仓库id',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '1删除 0正常',
  `status` int NULL DEFAULT 0 COMMENT '状态（同billStatus）0待审核1正常2已作废3已入库',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`transType`) USING BTREE,
  INDEX `billdate`(`order_date`) USING BTREE,
  INDEX `invId`(`goods_id`) USING BTREE,
  INDEX `transType`(`transType`) USING BTREE,
  INDEX `iid`(`order_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1966 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '采购订单明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_purchase_order_item
-- ----------------------------
INSERT INTO `scm_purchase_order_item` VALUES (1962, 466, 'PUR20240116144408', 'Purchase', 190, '2024-01-16', '', 9, 'HN8026', 'HN8026牛仔短裤', 32, '2720210080260105', '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', '2XL', '', 19.00, 0.00, 0.00, 10, 0, NULL, 0, 0);
INSERT INTO `scm_purchase_order_item` VALUES (1963, 467, 'PUR20240128113656', 'Purchase', 42, '2024-01-28', '', 29, 'HNP182', 'HNP182弹力紧身贴标牛仔短裤女ins', 438, 'HNP1825004', '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 'XL', '', 21.00, 0.00, 0.00, 2, 0, NULL, 0, 0);
INSERT INTO `scm_purchase_order_item` VALUES (1964, 468, 'PUR20240424162152', 'Purchase', 420, '2024-04-24', '', 68, 'JKL3112', 'JKL3112松紧腰束脚哈伦裤', 1327, 'JKL31120705', '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', '2XL', '', 42.00, 0.00, 0.00, 10, 0, NULL, 0, 0);
INSERT INTO `scm_purchase_order_item` VALUES (1965, 469, 'PUR20240525093505', 'Purchase', 210, '2024-05-25', '', 29, 'HNP182', 'HNP182弹力紧身贴标牛仔短裤女ins', 439, 'HNP1825005', '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', '2XL', '', 21.00, 0.00, 0.00, 10, 0, NULL, 0, 0);

-- ----------------------------
-- Table structure for scm_purchase_order_payable
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_order_payable`;
CREATE TABLE `scm_purchase_order_payable`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL COMMENT '供应商id',
  `supplier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商名称',
  `amount` decimal(10, 2) NOT NULL COMMENT '应付金额',
  `date` date NOT NULL COMMENT '应付日期',
  `invoice_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票号码',
  `purchase_order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采购单号',
  `purchase_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采购说明',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int NOT NULL COMMENT '状态（0已生成1已结算)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采购单应付款' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_purchase_order_payable
-- ----------------------------
INSERT INTO `scm_purchase_order_payable` VALUES (1, 33, '中山裤豪', 52.00, '2024-01-28', NULL, 'PUR20240128113656', '{采购商品总数量:2,不同款式:1,不同SKU:1,商品总价:42.00,运费:10}', NULL, 0, '2024-01-28 12:07:32', 'admin', NULL, NULL);
INSERT INTO `scm_purchase_order_payable` VALUES (2, 31, '中山市金客隆服饰有限公司', 432.00, '2024-04-24', NULL, 'PUR20240424162152', '{采购商品总数量:10,不同款式:1,不同SKU:1,商品总价:420.00,运费:12}', '1', 0, '2024-04-24 16:22:40', 'admin', '2024-04-24 17:20:49', NULL);
INSERT INTO `scm_purchase_order_payable` VALUES (3, 33, '中山裤豪', 210.00, '2024-05-25', NULL, 'PUR20240525093505', '{采购商品总数量:10,不同款式:1,不同SKU:1,商品总价:210.00,运费:0}', NULL, 0, '2024-05-25 09:35:36', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for scm_purchase_order_ship
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_order_ship`;
CREATE TABLE `scm_purchase_order_ship`  (
  `id` bigint NOT NULL COMMENT '采购单ID（主键）',
  `ship_company` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `ship_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `freight` decimal(6, 0) NULL DEFAULT NULL COMMENT '运费',
  `ship_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `receipt_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` int NULL DEFAULT NULL COMMENT '状态（0未收货1已收货2已入库）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  `back_count` int NULL DEFAULT NULL COMMENT '退回数量',
  `stock_in_time` datetime NULL DEFAULT NULL COMMENT '入库时间',
  `stock_in_count` int NULL DEFAULT NULL COMMENT '入库数量',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `order_date` date NULL DEFAULT NULL COMMENT '采购订单日期',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采购订单编号',
  `order_spec_unit` int NULL DEFAULT NULL COMMENT '采购订单商品规格数',
  `order_goods_unit` int NULL DEFAULT NULL COMMENT '采购订单商品数',
  `order_spec_unit_total` int NULL DEFAULT NULL COMMENT '采购订单总件数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采购订单物流表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_purchase_order_ship
-- ----------------------------
INSERT INTO `scm_purchase_order_ship` VALUES (466, '菜鸟速递', 'CN223533300022', 0, '2024-01-16 00:00:00', '2024-01-16 00:00:00', 'admin', '2024-01-16 14:49:49', 2, NULL, 0, '2024-01-16 14:50:58', 0, 'admin', '2024-01-16 14:50:58', '2024-01-16', 'PUR20240116144408', 1, 1, 10);
INSERT INTO `scm_purchase_order_ship` VALUES (467, '菜鸟速递', 'CN345565767', 10, '2024-01-28 00:00:00', NULL, 'admin', '2024-01-28 12:07:32', 0, NULL, 0, NULL, 0, NULL, NULL, '2024-01-28', 'PUR20240128113656', 1, 1, 2);
INSERT INTO `scm_purchase_order_ship` VALUES (468, '菜鸟速递', 'SF232323', 12, '2024-04-24 00:00:00', '2024-05-25 00:00:00', 'admin', '2024-04-24 16:22:40', 2, '11111', 0, '2024-05-25 09:40:04', 0, 'admin', '2024-05-25 09:40:04', '2024-04-24', 'PUR20240424162152', 1, 1, 10);
INSERT INTO `scm_purchase_order_ship` VALUES (469, '菜鸟速递', 'qdd', 0, '2024-05-25 00:00:00', '2024-05-25 00:00:00', 'admin', '2024-05-25 09:35:36', 2, '2', 0, '2024-05-25 09:35:57', 0, 'admin', '2024-05-25 09:35:57', '2024-05-25', 'PUR20240525093505', 1, 1, 10);

-- ----------------------------
-- Table structure for scm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `scm_supplier`;
CREATE TABLE `scm_supplier`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `number` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商编码',
  `taxRate` double NULL DEFAULT 0 COMMENT '税率',
  `amount` double NULL DEFAULT 0 COMMENT '期初应付款',
  `periodMoney` double NULL DEFAULT 0 COMMENT '期初预付款',
  `difMoney` double NULL DEFAULT 0 COMMENT '初期往来余额',
  `beginDate` date NULL DEFAULT NULL COMMENT '余额日期',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `place` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '职位',
  `linkMan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系方式',
  `province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区县',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货地址详情',
  `pinYin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `disable` tinyint(1) NULL DEFAULT 0 COMMENT '0启用   1禁用',
  `isDelete` tinyint(1) NULL DEFAULT 0 COMMENT '0正常 1删除',
  `purchaserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分管采购员',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_supplier
-- ----------------------------
INSERT INTO `scm_supplier` VALUES (1, '自营仓库', 'A0001', 0, 0, 0, 0, NULL, '', '', NULL, '15000000000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:02');
INSERT INTO `scm_supplier` VALUES (26, '韩牛服饰', 'HN', 0, 0, 0, 0, NULL, '', '', NULL, '13249570000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:03');
INSERT INTO `scm_supplier` VALUES (28, '广州衣菲妮服装厂', 'YIFEINI', 0, 0, 0, 0, NULL, '', '', NULL, '13600000000', NULL, NULL, NULL, NULL, '', 1, 1, NULL, '2023-12-29 11:01:03');
INSERT INTO `scm_supplier` VALUES (29, '中山欧熙妮服饰有限公司', 'ZSOXNFS', 0, 0, 0, 0, NULL, '', '', NULL, '13600000000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:03');
INSERT INTO `scm_supplier` VALUES (31, '中山市金客隆服饰有限公司', 'JKL', 0, 0, 0, 0, NULL, '', '', NULL, '13600000000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:04');
INSERT INTO `scm_supplier` VALUES (33, '中山裤豪', 'ZSKH', 0, 0, 0, 0, NULL, '', '', NULL, '', NULL, NULL, NULL, '中山市沙溪镇水牛城三区二楼35-38卡', '', 0, 0, NULL, '2023-12-29 11:01:04');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '启航技术', 0, '启航', '15888888888', '280645618@qq.com', '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-04-14 18:28:55');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '研发部', 1, '启航', '15888888888', '280645618@qq.com', '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-04-14 18:31:54');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '1', '1', '1', 'admin', '2023-08-07 19:31:38', 'admin', '2024-01-28 13:30:18', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-08-07 19:31:38', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-08-07 19:31:38', '', NULL, '');
INSERT INTO `sys_job` VALUES (100, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '0/30 * * * * ?', '1', '1', '1', 'admin', '2024-01-28 13:44:43', '', '2024-01-28 13:47:13', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：2毫秒', '0', '', '2024-01-28 13:30:00');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2024-01-28 13:30:10');
INSERT INTO `sys_job_log` VALUES (3, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '库存存货日报生成 总共耗时：2毫秒', '0', '', '2024-01-28 13:45:00');
INSERT INTO `sys_job_log` VALUES (4, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '库存存货日报生成 总共耗时：0毫秒', '0', '', '2024-01-28 13:45:30');
INSERT INTO `sys_job_log` VALUES (5, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '库存存货日报生成 总共耗时：2毫秒', '0', '', '2024-01-28 13:46:00');
INSERT INTO `sys_job_log` VALUES (6, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '库存存货日报生成 总共耗时：0毫秒', '0', '', '2024-01-28 13:46:30');
INSERT INTO `sys_job_log` VALUES (7, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '库存存货日报生成 总共耗时：0毫秒', '0', '', '2024-01-28 13:47:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 340 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-08 11:36:40');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-08 14:50:27');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-08 16:02:13');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-09 09:24:16');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-09 15:59:59');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', 'Unable to connect to Redis', '2024-05-11 09:15:16');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-11 09:15:43');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-11 15:35:31');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-15 11:14:47');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-15 11:22:50');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-15 11:23:07');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-25 09:34:34');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-25 11:09:17');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 09:01:31');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 10:20:40');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 17:24:44');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 18:18:18');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 19:47:40');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-29 08:47:41');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-30 14:39:39');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2024-05-30 14:39:39');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-30 14:39:45');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-30 15:50:24');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-31 11:09:07');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-31 19:28:45');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-31 20:14:36');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-01 18:18:26');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-01 18:20:46');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-01 18:23:11');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-03 16:18:56');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-04 10:20:02');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-04 11:10:27');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-04 11:58:01');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-04 13:53:33');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 11:15:43');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 13:33:03');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 16:29:17');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 17:55:49');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-11 18:39:37');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2024-06-11 18:39:37');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 18:39:49');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 20:17:42');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 10:02:45');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 11:33:33');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 11:50:17');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 13:35:39');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 14:36:04');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-13 09:31:56');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-13 10:37:45');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-17 08:47:37');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-19 17:45:25');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', 'Unable to connect to Redis', '2024-06-21 20:30:09');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-21 20:30:41');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-22 08:30:22');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', 'Unable to connect to Redis', '2024-07-14 14:06:32');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-14 14:06:48');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-20 11:18:11');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-27 20:43:50');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-27 20:48:28');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', 'Unable to connect to Redis', '2024-08-17 22:55:55');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-08-17 22:56:26');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', 'Unable to connect to Redis', '2024-08-23 21:58:50');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-23 22:00:13');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-24 08:59:07');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', 'Unable to connect to Redis', '2024-09-01 18:53:04');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-01 18:53:23');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-02 23:35:18');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', 'Unable to connect to Redis', '2024-10-01 15:41:43');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 15:42:07');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2024-10-01 16:05:08');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', 'Unable to connect to Redis', '2024-10-01 17:52:01');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', 'Unable to connect to Redis', '2024-10-01 17:53:00');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-10-11 20:53:51');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-10-11 21:29:40');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', 'No message found under code \'user.password.retry.limit.count\' for locale \'zh_CN\'.', '2024-10-11 21:29:44');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2024-10-11 21:30:30');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2024-10-11 21:30:30');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-10-11 21:30:35');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', 'Unable to connect to Redis', '2024-10-20 11:18:01');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-10-20 11:18:24');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-11-17 12:04:15');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-11-17 12:05:03');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2024-11-17 12:05:09');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-11-17 12:05:15');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-11-18 21:30:01');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-11-27 21:23:01');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `system_id` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统id（oms用在oms系统）',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2089 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统设置', 'oms', 0, 99, '/system', '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-27 15:00:27', 'admin', '2023-12-29 09:07:42.856856', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '商品管理', '', 0, 9, '/goods', '', '', 1, 0, 'M', '0', '0', '', 'theme', 'admin', '2023-12-29 13:29:44', '', '', '');
INSERT INTO `sys_menu` VALUES (4, '采购管理', NULL, 0, 1, 'purchase', '', '', 1, 0, 'M', '0', '0', '', 'server', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-24 17:06:13', '至简官网地址');
INSERT INTO `sys_menu` VALUES (5, '订单管理', 'oms', 0, 2, '/sale', '', '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2023-12-29 16:53:03', 'admin', '2024-06-03 16:20:20', '');
INSERT INTO `sys_menu` VALUES (6, '发货管理', 'oms', 0, 3, '/ship', '', '', 1, 0, 'M', '0', '0', '', 'excel', 'admin', '2024-01-01 14:08:04', 'admin', '2024-01-03 14:07:29', '');
INSERT INTO `sys_menu` VALUES (7, '售后管理', 'oms', 0, 4, '/saleafter', NULL, NULL, 1, 0, 'M', '0', '0', '', 'clipboard', 'admin', '2024-01-03 14:23:55', 'admin', '2024-01-12 19:47:33', '');
INSERT INTO `sys_menu` VALUES (8, '店铺管理', 'oms', 0, 7, '/shop', NULL, NULL, 1, 0, 'M', '0', '0', '', 'server', 'admin', '2024-04-12 16:46:19', 'admin', '2024-04-24 11:17:09', '');
INSERT INTO `sys_menu` VALUES (9, '库存管理', '', 0, 5, 'wms', '', '', 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2023-12-31 12:14:33', 'admin', '2024-04-23 15:43:32', '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 'oms', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', '', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-12-27 15:00:27', '', '', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', '', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-12-27 15:00:27', '', '', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', '', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-12-27 15:00:27', '', '', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', '', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-12 16:44:52', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', '', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-12-27 15:00:27', '', '', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', '', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-12-27 15:00:27', '', '', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', NULL, 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-12-27 15:00:27', '', '', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', NULL, 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-12-27 15:00:27', '', '', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', NULL, 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', NULL, 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', NULL, 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', NULL, 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', NULL, 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', NULL, 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', NULL, 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', NULL, 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', NULL, 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', NULL, 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', NULL, 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', NULL, 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', NULL, 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', NULL, 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', NULL, 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', NULL, 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', NULL, 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', NULL, 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', NULL, 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', NULL, 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', NULL, 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', NULL, 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', NULL, 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', NULL, 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', NULL, 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', NULL, 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', NULL, 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', NULL, 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', NULL, 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', NULL, 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', NULL, 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', NULL, 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', NULL, 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', NULL, 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', NULL, 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', NULL, 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', NULL, 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (2005, '供应商管理', NULL, 4, 9, 'supplier/list', 'scm/supplier/index', '', 1, 0, 'C', '0', '0', 'scm:supplier', 'qq', 'admin', '2023-12-29 09:14:02', 'admin', '2023-12-29 09:17:27.514466', '');
INSERT INTO `sys_menu` VALUES (2007, '商品管理', NULL, 2, 1, 'goods_list', 'goods/index', '', 1, 0, 'C', '0', '0', 'goods:list', 'theme', 'admin', '2023-12-29 13:31:01', 'admin', '2023-12-29 15:02:40.869685', '');
INSERT INTO `sys_menu` VALUES (2008, '商品分类', NULL, 2, 88, 'goods_category', 'goods/category/index', '', 1, 0, 'C', '0', '0', 'goods:category', 'tree-table', 'admin', '2023-12-29 13:32:41', 'admin', '2023-12-29 15:02:22.220534', '');
INSERT INTO `sys_menu` VALUES (2009, '品牌管理', NULL, 2, 99, 'goods/brand', 'goods/brand/index', '', 1, 0, 'C', '0', '1', 'goods:brand', 'clipboard', 'admin', '2023-12-29 13:34:49', 'admin', '2024-04-14 18:51:23', '');
INSERT INTO `sys_menu` VALUES (2010, '采购单管理', NULL, 4, 1, 'order', 'scm/purchase/order', '', 1, 0, 'C', '0', '0', 'scm:purchase:order', 'button', 'admin', '2023-12-29 16:35:55', 'admin', '2024-04-24 17:06:32', '');
INSERT INTO `sys_menu` VALUES (2012, '采购物流管理', NULL, 4, 2, 'ship', 'scm/purchase/ship', '', 1, 0, 'C', '0', '0', 'scm:purchase:ship', 'component', 'admin', '2023-12-29 16:45:42', 'admin', '2024-04-24 17:10:48', '');
INSERT INTO `sys_menu` VALUES (2015, '店铺管理', 'oms', 8, 10, 'shop_list', 'shop/shop_index', '', 1, 0, 'C', '0', '0', 'shop:list', 'example', 'admin', '2023-12-29 16:54:02', 'admin', '2024-04-25 11:15:07', '');
INSERT INTO `sys_menu` VALUES (2017, '店铺订单统计', 'oms', 5, 8, 'data', 'shop/data', '', 1, 0, 'C', '0', '0', 'shop:data', 'chart', 'admin', '2023-12-29 17:04:08', 'admin', '2024-08-23 22:05:00', '');
INSERT INTO `sys_menu` VALUES (2019, '采购账单管理1', NULL, 4, 2, 'purchase', 'scm/purchase/cost', '', 1, 0, 'C', '0', '1', '', 'money', 'admin', '2023-12-29 17:09:32', 'admin', '2024-04-24 17:05:06', '');
INSERT INTO `sys_menu` VALUES (2021, '创建采购单', NULL, 4, 0, 'order/create', 'scm/purchase/order/create', '', 1, 0, 'C', '1', '0', '', 'edit', 'admin', '2023-12-29 21:23:45', 'admin', '2024-04-24 17:11:38', '');
INSERT INTO `sys_menu` VALUES (2025, '采购单详情', NULL, 4, 1, 'order/detail', 'scm/purchase/order/detail', '', 1, 0, 'C', '1', '0', '', 'button', 'admin', '2023-12-30 17:08:01', 'admin', '2024-04-24 17:15:00', '');
INSERT INTO `sys_menu` VALUES (2027, '入库管理', NULL, 9, 0, 'stock_in_entry/list', 'wms/stockIn/index', '', 1, 0, 'C', '0', '0', 'wms:stock_in_entry:list', 'stockin', 'admin', '2023-12-31 12:27:37', 'admin', '2024-11-27 21:27:33', '');
INSERT INTO `sys_menu` VALUES (2028, '生成采购入库单', NULL, 4, 3, 'ship/create_stock_in_entry', 'scm/purchase/ship/create_stock_in_entry', '', 1, 0, 'C', '1', '0', '', 'button', 'admin', '2023-12-31 12:31:32', 'admin', '2024-04-24 17:12:38', '');
INSERT INTO `sys_menu` VALUES (2029, '店铺售后管理', 'oms', 7, 2, 'shop_refund', 'shop/refund/index', '', 1, 0, 'C', '0', '0', '', 'clipboard', 'admin', '2023-12-31 17:29:03', 'admin', '2024-05-04 18:57:32', '');
INSERT INTO `sys_menu` VALUES (2030, '手动创建订单', 'oms', 5, 1, 'order/create', 'sale/order/create', '', 1, 0, 'C', '1', '0', '', 'documentation', 'admin', '2023-12-31 20:01:22', 'admin', '2024-03-24 19:32:32', '');
INSERT INTO `sys_menu` VALUES (2032, '订单拉取日志', 'oms', 5, 9, 'order/pull_log', 'shop/order_pull_log', '', 1, 0, 'C', '0', '0', '', 'upload', 'admin', '2023-12-31 20:04:12', 'admin', '2024-08-23 22:05:08', '');
INSERT INTO `sys_menu` VALUES (2033, '所有订单', 'oms', 5, 1, 'order_list', 'sale/order/index', '', 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-12-31 20:05:05', 'admin', '2024-08-23 22:04:30', '');
INSERT INTO `sys_menu` VALUES (2036, '店铺订单管理', 'oms', 5, 2, 'shop_order', 'shop/order_index', '', 1, 0, 'C', '0', '0', '', 'excel', 'admin', '2024-01-01 14:14:42', 'admin', '2024-05-04 18:55:37', '');
INSERT INTO `sys_menu` VALUES (2046, '出库管理', NULL, 9, 5, 'stockOut', 'wms/stockOut', NULL, 1, 0, 'C', '0', '0', '', 'link', 'admin', '2024-01-03 11:00:53', 'admin', '2024-11-27 21:28:06', '');
INSERT INTO `sys_menu` VALUES (2047, '库存查询', NULL, 9, 6, 'goodsInventory', 'goods/goodsInventory', NULL, 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2024-01-03 11:01:14', 'admin', '2024-01-09 17:55:33', '');
INSERT INTO `sys_menu` VALUES (2048, '库存盘点', NULL, 9, 9, 'pan', NULL, NULL, 1, 0, 'C', '0', '1', '', 'bug', 'admin', '2024-01-03 11:01:43', 'admin', '2024-01-09 19:57:08', '');
INSERT INTO `sys_menu` VALUES (2049, '打包发货', '', 6, 3, 'ship_order', 'shipping/shipOrder/index', NULL, 1, 0, 'C', '0', '0', '', 'guide', 'admin', '2024-01-03 14:09:18', 'admin', '2024-05-02 10:47:38', '');
INSERT INTO `sys_menu` VALUES (2051, '物流跟踪', 'oms', 6, 5, 'ship_logistics', 'shipping/shipOrder/logistics', NULL, 1, 0, 'C', '0', '0', '', 'email', 'admin', '2024-01-03 14:13:12', 'admin', '2024-11-18 21:39:15', '');
INSERT INTO `sys_menu` VALUES (2052, '物流公司管理', '', 6, 9, 'logistics_company', 'shipping/logistics/company', NULL, 1, 0, 'C', '0', '1', '', 'checkbox', 'admin', '2024-01-03 14:14:09', 'admin', '2024-08-23 22:07:25', '');
INSERT INTO `sys_menu` VALUES (2054, '售后处理', 'oms', 7, 1, 'refund_list', 'sale/refund', NULL, 1, 0, 'C', '0', '0', '', 'size', 'admin', '2024-01-03 14:24:36', 'admin', '2024-05-05 20:14:23', '');
INSERT INTO `sys_menu` VALUES (2059, '备货清单', 'oms', 6, 2, 'stocking', 'shipping/stocking', '', 1, 0, 'C', '0', '0', '', 'component', 'admin', '2024-01-09 11:51:52', 'admin', '2024-08-23 22:06:56', '');
INSERT INTO `sys_menu` VALUES (2060, '拣货出库', '', 6, 4, 'stockout', 'shipping/stockOut', NULL, 1, 0, 'C', '0', '0', '', 'bug', 'admin', '2024-01-09 13:39:00', 'admin', '2024-11-18 21:39:05', '');
INSERT INTO `sys_menu` VALUES (2061, '库位管理', NULL, 9, 99, 'stock_location', 'wms/location', NULL, 1, 0, 'C', '0', '0', '', 'education', 'admin', '2024-01-09 13:54:30', 'admin', '2024-01-09 14:50:33', '');
INSERT INTO `sys_menu` VALUES (2063, '发货费用', '', 6, 5, 'ship_fee', 'shipping/shipFee', NULL, 1, 0, 'C', '0', '1', '', 'money', 'admin', '2024-01-12 18:35:31', 'admin', '2024-08-23 22:06:40', '');
INSERT INTO `sys_menu` VALUES (2066, '添加商品', NULL, 2, 2, 'create', 'goods/create', NULL, 1, 0, 'C', '1', '0', '', 'component', 'admin', '2024-01-14 19:42:11', 'admin', '2024-04-14 18:50:36', '');
INSERT INTO `sys_menu` VALUES (2067, '商品SKU管理', '', 2, 3, 'spec_list', 'goods/spec', NULL, 1, 0, 'C', '0', '0', '', 'theme', 'admin', '2024-01-16 14:17:39', 'admin', '2024-04-14 18:51:13', '');
INSERT INTO `sys_menu` VALUES (2079, '电商平台设置', 'oms', 1, 0, 'platform', 'shop/platform', NULL, 1, 0, 'C', '0', '0', '', 'date-range', 'admin', '2024-04-12 16:58:07', 'admin', '2024-06-04 10:20:36', '');
INSERT INTO `sys_menu` VALUES (2080, '售后处理查询', 'oms', 7, 3, 'result_list', 'afterSale/index', NULL, 1, 0, 'C', '0', '0', '', 'time', 'admin', '2024-04-15 14:23:40', 'admin', '2024-05-05 20:27:37', '');
INSERT INTO `sys_menu` VALUES (2084, '店铺商品管理', 'oms', 8, 1, 'goods_list', 'shop/goods/', NULL, 1, 0, 'C', '0', '0', '', 'shopping', 'admin', '2024-04-15 14:52:16', 'admin', '2024-04-15 14:52:27', '');
INSERT INTO `sys_menu` VALUES (2085, '采购账单管理', NULL, 4, 4, 'bill', 'scm/purchase/bill', NULL, 1, 0, 'C', '0', '0', '', 'money', 'admin', '2024-04-24 17:03:07', 'admin', '2024-05-02 10:59:08', '');
INSERT INTO `sys_menu` VALUES (2086, '分类规格属性', NULL, 2, 0, 'goods_category/attribute', 'goods/category/categoryAttribute', NULL, 1, 0, 'C', '1', '0', '', 'build', 'admin', '2024-06-21 20:34:48', 'admin', '2024-06-21 21:25:39', '');
INSERT INTO `sys_menu` VALUES (2087, '规格属性值', NULL, 2, 0, 'goods_category/attribute_value', 'goods/category/categoryAttributeValue', NULL, 1, 0, 'C', '1', '0', '', 'clipboard', 'admin', '2024-06-21 21:14:34', 'admin', '2024-06-21 21:25:33', '');
INSERT INTO `sys_menu` VALUES (2088, '电子面单打印', NULL, 6, 0, 'print', 'shipping/ewaybillPrint/index', NULL, 1, 0, 'C', '0', '0', '', 'bug', 'admin', '2024-08-23 22:09:43', 'admin', '2024-11-18 21:30:46', '');

-- ----------------------------
-- Table structure for sys_menu_oms
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_oms`;
CREATE TABLE `sys_menu_oms`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2094 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu_oms
-- ----------------------------
INSERT INTO `sys_menu_oms` VALUES (1, '订单管理', 0, 1, '/order', 'Layout', '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2023-12-27 15:00:27', 'admin', '2024-03-30 17:44:37', '系统管理目录');
INSERT INTO `sys_menu_oms` VALUES (2, '售后管理', 0, 2, '/refund', 'Layout', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 14:49:33', '至简官网地址');
INSERT INTO `sys_menu_oms` VALUES (3, '店铺管理', 0, 5, 'shop', 'Layout', '', 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2023-12-29 13:29:44', 'admin', '2024-03-30 17:43:35', '');
INSERT INTO `sys_menu_oms` VALUES (4, '商品管理', 0, 4, '/goods', 'Layout', '', 1, 0, 'M', '0', '0', '', 'build', 'admin', '2023-12-29 16:53:03', 'admin', '2024-03-30 17:43:57', '');
INSERT INTO `sys_menu_oms` VALUES (5, '系统设置', 0, 99, '/system', 'Layout', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-27 15:00:27', 'admin', '2023-12-29 09:07:42.856856', '系统管理目录');
INSERT INTO `sys_menu_oms` VALUES (100, '订单处理', 1, 1, 'order_list', 'order/index', '', 1, 0, 'C', '0', '0', '', 'shopping', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 17:25:10', '用户管理菜单');
INSERT INTO `sys_menu_oms` VALUES (101, '订单更新日志', 1, 4, 'pull_logs', 'order/shopOrder/pull_log', '', 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 11:19:26', '角色管理菜单');
INSERT INTO `sys_menu_oms` VALUES (102, '店铺订单管理', 1, 3, 'shop_order_list', 'order/shopOrder/index', '', 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 11:18:00', '菜单管理菜单');
INSERT INTO `sys_menu_oms` VALUES (104, '退款查询', 2, 1, 'refund_list', 'refund/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 17:27:38', '岗位管理菜单');
INSERT INTO `sys_menu_oms` VALUES (105, '退款更新日志', 2, 6, 'pull_logs', 'refund/shopRefund/pull_log', '', 1, 0, 'C', '0', '0', '', 'dict', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 15:48:34', '字典管理菜单');
INSERT INTO `sys_menu_oms` VALUES (106, '店铺退款管理', 2, 2, 'shop_refund_list', 'refund/shopRefund/index', '', 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 15:48:21', '参数设置菜单');
INSERT INTO `sys_menu_oms` VALUES (108, '店铺列表', 3, 9, 'shop_list', 'shop/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-29 09:14:02', 'admin', '2024-03-21 17:01:52', '');
INSERT INTO `sys_menu_oms` VALUES (109, '店铺商品管理', 3, 10, 'goods', '', '', 1, 0, 'M', '1', '0', '', 'peoples', 'admin', '2023-12-29 13:31:01', 'admin', '2024-03-22 10:45:01', '');
INSERT INTO `sys_menu_oms` VALUES (110, '开放平台设置', 3, 88, 'platform_setting', 'shop/platform/index', '', 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2023-12-29 13:32:41', 'admin', '2024-03-21 13:46:05', '');
INSERT INTO `sys_menu_oms` VALUES (112, 'ERP商品SKU', 4, 1, 'sku_list', 'goods/spec/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-29 16:35:55', 'admin', '2024-03-21 11:40:29', '');
INSERT INTO `sys_menu_oms` VALUES (116, '用户管理', 5, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');
INSERT INTO `sys_menu_oms` VALUES (117, '菜单管理', 5, 1, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');
INSERT INTO `sys_menu_oms` VALUES (2077, '店铺商品管理', 4, 2, 'shop_goods', 'goods/shopGoods/index', NULL, 1, 0, 'C', '0', '0', '', 'shopping', 'admin', '2024-03-28 10:29:59', 'admin', '2024-03-28 10:30:59', '');
INSERT INTO `sys_menu_oms` VALUES (2078, '添加ERP商品', 4, 9, 'goods_add', 'goods/create', NULL, 1, 0, 'C', '1', '0', '', 'checkbox', 'admin', '2024-03-18 07:59:57', 'admin', '2024-03-21 10:10:11', '');
INSERT INTO `sys_menu_oms` VALUES (2079, '字典管理', 5, 9, 'dict', 'system/dict/index', NULL, 1, 0, 'C', '0', '0', '', 'dict', 'admin', '2024-03-18 08:43:55', 'admin', '2024-03-18 08:44:08', '');
INSERT INTO `sys_menu_oms` VALUES (2080, '店铺商品管理-淘宝', 109, 1, 'tao_goods_list', 'tao/goods/index', NULL, 1, 0, 'C', '1', '0', '', 'code', 'admin', '2024-03-21 11:41:36', 'admin', '2024-03-22 10:42:41', '');
INSERT INTO `sys_menu_oms` VALUES (2081, '店铺商品管理-京东', 109, 2, 'jd_goods_list', 'jd/goods/index', NULL, 1, 0, 'C', '1', '0', '', 'code', 'admin', '2024-03-21 11:42:30', 'admin', '2024-03-23 10:14:24', '');
INSERT INTO `sys_menu_oms` VALUES (2082, '店铺商品管理-拼多多', 109, 4, 'pdd_goods_list', 'pdd/goods/index', NULL, 1, 0, 'C', '1', '0', '', 'tool', 'admin', '2024-03-21 13:35:26', 'admin', '2024-03-23 10:15:16', '');
INSERT INTO `sys_menu_oms` VALUES (2083, '店铺商品管理-抖店', 109, 3, 'dou_goods_list', 'dou/goods/index', NULL, 1, 0, 'C', '1', '0', '', 'code', 'admin', '2024-03-21 20:04:15', 'admin', '2024-03-23 10:14:57', '');
INSERT INTO `sys_menu_oms` VALUES (2084, '快递公司库', 3, 99, 'logistics_companies', 'shipping/logistics/company', NULL, 1, 0, 'C', '1', '0', '', 'code', 'admin', '2024-03-21 20:05:09', 'admin', '2024-03-31 10:09:38', '');
INSERT INTO `sys_menu_oms` VALUES (2085, '省市区地址库', 110, 6, 'addr', NULL, NULL, 1, 0, 'C', '1', '0', NULL, 'color', 'admin', '2024-03-21 20:05:39', '', NULL, '');
INSERT INTO `sys_menu_oms` VALUES (2086, '定时任务', 5, 5, 'sys_task', 'system/task/index', NULL, 1, 0, 'C', '0', '0', '', 'time-range', 'admin', '2024-03-22 19:29:20', 'admin', '2024-03-22 19:31:23', '');
INSERT INTO `sys_menu_oms` VALUES (2087, '发货管理', 0, 3, 'shipping', NULL, NULL, 1, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-03-30 17:36:10', 'admin', '2024-03-31 09:57:41', '');
INSERT INTO `sys_menu_oms` VALUES (2088, '快递公司管理', 2087, 9, 'logistics_company', 'shipping/logistics/company', NULL, 1, 0, 'C', '0', '0', '', 'checkbox', 'admin', '2024-03-30 17:37:01', 'admin', '2024-03-31 09:58:18', '');
INSERT INTO `sys_menu_oms` VALUES (2089, '发货管理', 2087, 2, 'ship', 'shipping/index', NULL, 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2024-03-30 17:37:42', 'admin', '2024-04-06 14:49:59', '');
INSERT INTO `sys_menu_oms` VALUES (2090, '角色管理', 5, 2, 'role', 'system/role/index', NULL, 1, 0, 'C', '0', '0', NULL, 'peoples', 'admin', '2024-03-31 12:40:50', '', NULL, '');
INSERT INTO `sys_menu_oms` VALUES (2091, '部门管理', 5, 3, 'dept', 'system/dept/index', NULL, 1, 0, 'C', '0', '0', NULL, 'tree', 'admin', '2024-03-31 12:42:57', '', NULL, '');
INSERT INTO `sys_menu_oms` VALUES (2092, '售后处理', 2, 0, 'processing', 'afterSale/index', NULL, 1, 0, 'C', '0', '0', '', 'documentation', 'admin', '2024-04-06 17:27:03', 'admin', '2024-04-06 17:31:12', '');
INSERT INTO `sys_menu_oms` VALUES (2093, '订单明细', 1, 2, 'order_item_list', 'order/item_list', NULL, 1, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2024-04-06 18:58:06', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 至简新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-08-07 19:31:38', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 至简系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-08-07 19:31:38', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 493 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (415, '店铺订单', 5, 'cn.qihangerp.api.controller.ErpOrderController.export()', 'POST', 1, 'admin', NULL, '/api/order/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-05-08 14:50:58', 2385);
INSERT INTO `sys_oper_log` VALUES (416, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":null,\"city\":\"深圳市\",\"createBy\":\"admin\",\"discountAmount\":0,\"goodsAmount\":null,\"itemList\":[{\"goodsImg\":\"\",\"goodsNum\":\"\",\"goodsPrice\":null,\"goodsSpec\":\"\",\"goodsTitle\":\"\",\"itemAmount\":null,\"remark\":\"\",\"specNum\":\"\"}],\"orderNum\":\"A451220036332\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"refundStatus\":1,\"shopId\":1,\"shopType\":99,\"town\":\"福田区\"}', NULL, 1, 'Cannot invoke \"java.lang.Double.doubleValue()\" because the return value of \"cn.qihangerp.domain.ErpOrder.getGoodsAmount()\" is null', '2024-05-09 09:25:50', 46);
INSERT INTO `sys_oper_log` VALUES (417, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":null,\"city\":\"深圳市\",\"createBy\":\"admin\",\"discountAmount\":0,\"goodsAmount\":null,\"itemList\":[{\"goodsImg\":\"\",\"goodsNum\":\"\",\"goodsPrice\":null,\"goodsSpec\":\"\",\"goodsTitle\":\"\",\"itemAmount\":null,\"remark\":\"\",\"specNum\":\"\"}],\"orderNum\":\"A451220036332\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"refundStatus\":1,\"shopId\":1,\"shopType\":99,\"town\":\"福田区\"}', NULL, 1, 'Cannot invoke \"java.lang.Double.doubleValue()\" because the return value of \"cn.qihangerp.domain.ErpOrder.getGoodsAmount()\" is null', '2024-05-09 09:34:10', 451017);
INSERT INTO `sys_oper_log` VALUES (418, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":null,\"city\":\"深圳市\",\"goodsAmount\":null,\"itemList\":[{\"goodsImg\":\"\",\"goodsNum\":\"\",\"goodsPrice\":null,\"goodsSpec\":\"\",\"goodsTitle\":\"\",\"itemAmount\":null,\"remark\":\"\",\"specNum\":\"\"}],\"orderNum\":\"A451220036332\",\"params\":{},\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"shopId\":1,\"town\":\"福田区\"}', '{\"msg\":\"请填写商品价格！\",\"code\":1503}', 0, NULL, '2024-05-09 09:34:40', 38);
INSERT INTO `sys_oper_log` VALUES (419, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:35:41\",\"discountAmount\":0,\"goodsAmount\":21.0,\"itemList\":[{\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"isGift\":0,\"itemAmount\":21.0,\"quantity\":1,\"remark\":\"\",\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"A451220036332\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"refundStatus\":1,\"shopId\":1,\"shopType\":99,\"town\":\"福田区\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'ship_status\' doesn\'t have a default value\r\n### The error may exist in file [D:\\dev\\projects\\qihang.ecom.erp\\api\\target\\classes\\mapper\\api\\ErpOrderMapper.xml]\r\n### The error may involve cn.qihangerp.api.mapper.ErpOrderMapper.insertErpOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_sale_order          ( order_num,             shop_type,             shop_id,                                                    refund_status,             order_status,             goods_amount,             discount_amount,             postage,             amount,             receiver_name,             receiver_phone,             address,                          province,             city,             town,                                                                                                                                  create_time,             create_by )           values ( ?,             ?,             ?,                                                    ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,                                                                                                                                  ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'ship_status\' doesn\'t have a default value\n; Field \'ship_status\' doesn\'t have a default value', '2024-05-09 09:35:49', 39515);
INSERT INTO `sys_oper_log` VALUES (420, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:37:14\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":43,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:37:15.161\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1788382692918120449\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":43,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"A451220036332\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"福田区\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'shop_id\' cannot be null\r\n### The error may exist in file [D:\\dev\\projects\\qihang.ecom.erp\\api\\target\\classes\\mapper\\api\\ErpOrderMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_sale_order_item(shop_id,order_id,supplier_id,ship_type,ship_status,order_num,order_item_num, goods_id, spec_id, goods_title, goods_img, goods_num, goods_spec, spec_num, goods_price, item_amount, quantity, remark, is_gift, refund_count, order_status,refund_status, create_time, create_by, update_time, update_by) values                  ( ?,?,?,?,?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'shop_id\' cannot be null\n; Column \'shop_id\' cannot be null', '2024-05-09 09:37:21', 21750);
INSERT INTO `sys_oper_log` VALUES (421, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:41:47\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":44,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:41:47.788\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1788383836272807937\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":44,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"A451220036332\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"福田区\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'shop_id\' cannot be null\r\n### The error may exist in file [D:\\dev\\projects\\qihang.ecom.erp\\api\\target\\classes\\mapper\\api\\ErpOrderMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_sale_order_item(shop_id,order_id,supplier_id,ship_type,ship_status,order_num,order_item_num, goods_id, spec_id, goods_title, goods_img, goods_num, goods_spec, spec_num, goods_price, item_amount, quantity, remark, is_gift, refund_count, order_status,refund_status, create_time, create_by, update_time, update_by) values                  ( ?,?,?,?,?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'shop_id\' cannot be null\n; Column \'shop_id\' cannot be null', '2024-05-09 09:41:47', 102728);
INSERT INTO `sys_oper_log` VALUES (422, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"实际广场23309\",\"amount\":null,\"city\":\"深圳市\",\"goodsAmount\":null,\"itemList\":[{\"goodsImg\":\"\",\"goodsNum\":\"\",\"goodsPrice\":null,\"goodsSpec\":\"\",\"goodsTitle\":\"\",\"itemAmount\":null,\"remark\":\"\",\"specNum\":\"\"}],\"orderNum\":\"AD580023566000\",\"params\":{},\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382023320\",\"shopId\":1,\"town\":\"南山区\"}', '{\"msg\":\"请填写商品价格！\",\"code\":1503}', 0, NULL, '2024-05-09 09:43:00', 34);
INSERT INTO `sys_oper_log` VALUES (423, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"实际广场23309\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:43:18\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":45,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:43:18.06\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1788384214921965569\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":45,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shopId\":1,\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"AD580023566000\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382023320\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"南山区\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'ship_status\' cannot be null\r\n### The error may exist in file [D:\\dev\\projects\\qihang.ecom.erp\\api\\target\\classes\\mapper\\api\\ErpOrderMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_sale_order_item(shop_id,order_id,supplier_id,ship_type,ship_status,order_num,order_item_num, goods_id, spec_id, goods_title, goods_img, goods_num, goods_spec, spec_num, goods_price, item_amount, quantity, remark, is_gift, refund_count, order_status,refund_status, create_time, create_by, update_time, update_by) values                  ( ?,?,?,?,?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'ship_status\' cannot be null\n; Column \'ship_status\' cannot be null', '2024-05-09 09:43:18', 9190);
INSERT INTO `sys_oper_log` VALUES (424, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"实际广场23309\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:44:15\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":46,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:44:16.002\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1788384457944158210\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":46,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shipStatus\":0,\"shopId\":1,\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"AD580023566000\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382023320\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"南山区\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'order_num\' cannot be null\r\n### The error may exist in file [D:\\dev\\projects\\qihang.ecom.erp\\api\\target\\classes\\mapper\\api\\ErpOrderMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_sale_order_item(shop_id,order_id,supplier_id,ship_type,ship_status,order_num,order_item_num, goods_id, spec_id, goods_title, goods_img, goods_num, goods_spec, spec_num, goods_price, item_amount, quantity, remark, is_gift, refund_count, order_status,refund_status, create_time, create_by, update_time, update_by) values                  ( ?,?,?,?,?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'order_num\' cannot be null\n; Column \'order_num\' cannot be null', '2024-05-09 09:44:16', 4471);
INSERT INTO `sys_oper_log` VALUES (425, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"实际广场23309\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:47:54\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":47,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:47:54.252\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1785584827112509448\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":47,\"orderItemNum\":\"AD580023566000\",\"orderNum\":\"AD580023566000\",\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shipStatus\":0,\"shopId\":1,\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"AD580023566000\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382023320\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"南山区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-09 09:47:54', 4051);
INSERT INTO `sys_oper_log` VALUES (426, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"阿迪达斯打发打发\",\"amount\":21.0,\"city\":\"市辖区\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:04:50\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":48,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:04:50.233\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1785584827112509449\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":48,\"orderItemNum\":\"A135822662000012\",\"orderNum\":\"A135822662000012\",\"orderStatus\":1,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shipStatus\":0,\"shopId\":1,\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"A135822662000012\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"上海市\",\"receiverName\":\"启航\",\"receiverPhone\":\"136982222\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"黄浦区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-09 10:04:50', 178217);
INSERT INTO `sys_oper_log` VALUES (427, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"aaddfd\",\"amount\":21.0,\"city\":\"大同市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:12:21\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":50,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:12:21.375\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1785584827112509451\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":50,\"orderItemNum\":\"SF137003620200\",\"orderNum\":\"SF137003620200\",\"orderStatus\":1,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shipStatus\":0,\"shopId\":1,\"specId\":439,\"specNum\":\"HNP1825005\",\"supplierId\":26}],\"orderNum\":\"SF137003620200\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"山西省\",\"receiverName\":\"A\",\"receiverPhone\":\"136000000\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"平城区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-09 10:12:21', 34870);
INSERT INTO `sys_oper_log` VALUES (428, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"AAAA\",\"amount\":66.0,\"city\":\"邯郸市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:19:28\",\"discountAmount\":0,\"goodsAmount\":66.0,\"id\":51,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:19:28.933\",\"goodsId\":1228,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01kneLsV1p3HVu8u1xi_!!2214743335304-0-cib.jpg\",\"goodsNum\":\"GZYYZ7277\",\"goodsPrice\":54.0,\"goodsSpec\":\"咖啡色 均码 \",\"goodsTitle\":\"GZYYZ7277复古显瘦灯芯绒a字半身裙\",\"id\":\"1785584827112509452\",\"isGift\":0,\"itemAmount\":54.0,\"orderId\":51,\"orderItemNum\":\"A13885020023320\",\"orderNum\":\"A13885020023320\",\"orderStatus\":1,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shipStatus\":0,\"shopId\":1,\"specId\":1228,\"specNum\":\"GZYYZ72773100\",\"supplierId\":32}],\"orderNum\":\"A13885020023320\",\"orderStatus\":1,\"orderTime\":\"2024-05-09 10:19:20\",\"params\":{},\"postage\":0,\"province\":\"河北省\",\"receiverName\":\"Q\",\"receiverPhone\":\"13582202330\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"复兴区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-09 10:19:29', 22863);
INSERT INTO `sys_oper_log` VALUES (429, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-12-29 16:53:03\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":5,\"menuName\":\"销售管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"sale\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:16:33', 26);
INSERT INTO `sys_oper_log` VALUES (430, '采购订单', 1, 'cn.qihangerp.api.controller.ScmPurchaseOrderController.add()', 'POST', 1, 'admin', NULL, '/purchase/purchaseOrder', '127.0.0.1', '内网IP', '{\"contactId\":33,\"createBy\":\"admin\",\"goodsList\":[{\"amount\":210,\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"colorValue\":\"浅蓝色\",\"goodsId\":29,\"id\":439,\"name\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"number\":\"HNP182\",\"purPrice\":21,\"qty\":10,\"sizeValue\":\"2XL\",\"specNum\":\"HNP1825005\",\"styleValue\":\"\"}],\"orderAmount\":210,\"orderDate\":\"2024-05-25 00:00:00\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:06', 58);
INSERT INTO `sys_oper_log` VALUES (431, '采购订单', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderController.edit()', 'PUT', 1, 'admin', NULL, '/purchase/purchaseOrder', '127.0.0.1', '内网IP', '{\"auditUser\":\"q\",\"id\":469,\"optionType\":\"audit\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:16', 15);
INSERT INTO `sys_oper_log` VALUES (432, '采购订单', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderController.edit()', 'PUT', 1, 'admin', NULL, '/purchase/purchaseOrder', '127.0.0.1', '内网IP', '{\"auditUser\":\"q\",\"confirmUser\":\"q\",\"id\":469,\"optionType\":\"confirm\",\"totalAmount\":210,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:21', 31);
INSERT INTO `sys_oper_log` VALUES (433, '采购订单', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderController.edit()', 'PUT', 1, 'admin', NULL, '/purchase/purchaseOrder', '127.0.0.1', '内网IP', '{\"auditUser\":\"q\",\"confirmUser\":\"q\",\"id\":469,\"optionType\":\"SupplierShip\",\"shipCompany\":\"菜鸟速递\",\"shipCost\":0,\"shipNo\":\"qdd\",\"supplierDeliveryTime\":\"2024-05-25 00:00:00\",\"totalAmount\":210,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:36', 43);
INSERT INTO `sys_oper_log` VALUES (434, '采购订单物流', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderShipController.confirmReceipt()', 'PUT', 1, 'admin', NULL, '/purchase/PurchaseOrderShip', '127.0.0.1', '内网IP', '{\"backCount\":0,\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:35:36\",\"freight\":0,\"id\":469,\"orderDate\":\"2024-05-25\",\"orderGoodsUnit\":1,\"orderNo\":\"PUR20240525093505\",\"orderSpecUnit\":1,\"orderSpecUnitTotal\":10,\"params\":{},\"receiptTime\":\"2024-05-25 00:00:00\",\"remark\":\"2\",\"shipCompany\":\"菜鸟速递\",\"shipNo\":\"qdd\",\"shipTime\":\"2024-05-25\",\"status\":0,\"stockInCount\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:53', 14);
INSERT INTO `sys_oper_log` VALUES (435, '采购订单物流', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderShipController.createStockInEntry()', 'POST', 1, 'admin', NULL, '/purchase/PurchaseOrderShip/createStockInEntry', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:35:06\",\"goodsList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"colorValue\":\"浅蓝色\",\"goodsId\":29,\"goodsName\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"goodsNum\":\"HNP182\",\"id\":1965,\"inQty\":10,\"orderId\":469,\"params\":{},\"quantity\":10,\"remark\":\"\",\"sizeValue\":\"2XL\",\"specId\":439,\"specNum\":\"HNP1825005\",\"styleValue\":\"\"}],\"id\":469,\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 09:35:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:56', 44);
INSERT INTO `sys_oper_log` VALUES (436, '采购订单物流', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderShipController.confirmReceipt()', 'PUT', 1, 'admin', NULL, '/purchase/PurchaseOrderShip', '127.0.0.1', '内网IP', '{\"backCount\":0,\"createBy\":\"admin\",\"createTime\":\"2024-04-24 16:22:40\",\"freight\":12,\"id\":468,\"orderDate\":\"2024-04-24\",\"orderGoodsUnit\":1,\"orderNo\":\"PUR20240424162152\",\"orderSpecUnit\":1,\"orderSpecUnitTotal\":10,\"params\":{},\"receiptTime\":\"2024-05-25 00:00:00\",\"remark\":\"11111\",\"shipCompany\":\"菜鸟速递\",\"shipNo\":\"SF232323\",\"shipTime\":\"2024-04-24\",\"status\":0,\"stockInCount\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:36:46', 10);
INSERT INTO `sys_oper_log` VALUES (437, '采购订单物流', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderShipController.createStockInEntry()', 'POST', 1, 'admin', NULL, '/purchase/PurchaseOrderShip/createStockInEntry', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-24 16:21:52\",\"goodsList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1964,\"inQty\":10,\"orderId\":468,\"params\":{},\"quantity\":10,\"remark\":\"\",\"sizeValue\":\"2XL\",\"specId\":1327,\"specNum\":\"JKL31120705\",\"styleValue\":\"\"}],\"id\":468,\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 09:36:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:40:03', 30);
INSERT INTO `sys_oper_log` VALUES (438, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":0,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"11\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1794181606552338400,\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":1,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 10:21:12', 27645);
INSERT INTO `sys_oper_log` VALUES (439, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:20:56\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1794181606552338400,\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":1,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:22:35', 68);
INSERT INTO `sys_oper_log` VALUES (440, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:22:35\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1794181606552338400,\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":2,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:26:14', 104435);
INSERT INTO `sys_oper_log` VALUES (441, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:22:35\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1794181606552338400,\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":2,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:29:16', 69563);
INSERT INTO `sys_oper_log` VALUES (442, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:22:35\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1794181606552338400,\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":2,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:33:47', 58368);
INSERT INTO `sys_oper_log` VALUES (443, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:22:35\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":\"1794181606552338400\",\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":2,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:35:52', 61);
INSERT INTO `sys_oper_log` VALUES (444, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:35:52\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":\"1794181606552338433\",\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":1,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:36:15', 34);
INSERT INTO `sys_oper_log` VALUES (445, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-12-29 16:53:03\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":5,\"menuName\":\"订单管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/sale\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-03 16:20:20', 43);
INSERT INTO `sys_oper_log` VALUES (446, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/ewaybillPrint/index\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"面单打印\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":6,\"path\":\"ewaybill_print\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-03 16:21:14', 10);
INSERT INTO `sys_oper_log` VALUES (447, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"sale/order/index\",\"createTime\":\"2023-12-31 20:05:05\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"订单处理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":5,\"path\":\"order_list\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-03 16:21:56', 10);
INSERT INTO `sys_oper_log` VALUES (448, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shop/platform\",\"createTime\":\"2024-04-12 16:58:07\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2079,\"menuName\":\"电商平台设置\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"path\":\"platform\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 10:20:36', 28);
INSERT INTO `sys_oper_log` VALUES (449, '店铺', 2, 'cn.qihangerp.api.controller.ShopController.edit()', 'PUT', 1, 'admin', NULL, '/shop/shop', '127.0.0.1', '内网IP', '{\"company\":\"华衣云商\",\"createTime\":\"2024-06-04 11:20:13\",\"ename\":\"kuaishou\",\"id\":8,\"isDelete\":0,\"name\":\"梦小妮牛仔裤-快手\",\"nickName\":\"快手小店\",\"orderNum\":0,\"platform\":8,\"remark\":\"1\",\"sellerShopId\":12,\"updateTime\":\"2024-06-04 12:07:55.484\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 12:07:55', 211);
INSERT INTO `sys_oper_log` VALUES (450, '店铺', 2, 'cn.qihangerp.api.controller.ShopController.edit()', 'PUT', 1, 'admin', NULL, '/shop/shop', '127.0.0.1', '内网IP', '{\"accessToken\":\"81_YbU9QodS3Li-hdOwls3ytkVGG2f0OpSOLzSzgiEV66YVWMKU6xkzFJAOGlqOQYSEJcldFTQDW0R4JdOSt2-34obCuCsiddbpswOmlIrvFNhy5iPp3SaKpBbWfXASUYjAFAOQU\",\"appKey\":\"wx720ff3dc8618810700\",\"appSercet\":\"b2fd7647ebcd88860de8087eb3ac425400\",\"company\":\"煜梦服饰\",\"createTime\":\"2024-06-04 11:19:54\",\"ename\":\"wei\",\"id\":2,\"isDelete\":0,\"name\":\"视频号店铺-测试\",\"nickName\":\"视频号-梦小妮\",\"orderNum\":0,\"platform\":2,\"remark\":\"\",\"sellerShopId\":100061591,\"updateTime\":\"2024-06-04 12:32:52.048\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 12:32:52', 114);
INSERT INTO `sys_oper_log` VALUES (451, '店铺', 2, 'cn.qihangerp.api.controller.ShopController.edit()', 'PUT', 1, 'admin', NULL, '/shop/shop', '127.0.0.1', '内网IP', '{\"accessToken\":\"81_YbU9QodS3Li-hdOwls3ytkVGG2f0OpSOLzSzgiEV66YVWMKU6xkzFJAOGlqOQYSEJcldFTQDW0R4JdOSt2-34obCuCsiddbpswOmlIrvFNhy5iPp3SaKpBbWfXASUYjAFAOQU\",\"appKey\":\"wx720ff3dc86188107\",\"appSercet\":\"b2fd7647ebcd88860de8087eb3ac4254\",\"company\":\"煜梦服饰\",\"createTime\":\"2024-06-04 11:19:54\",\"ename\":\"wei\",\"id\":2,\"isDelete\":0,\"name\":\"视频号店铺-测试\",\"nickName\":\"视频号-梦小妮\",\"orderNum\":0,\"platform\":2,\"remark\":\"\",\"sellerShopId\":100061591,\"updateTime\":\"2024-06-04 12:32:59.81\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 12:32:59', 9);
INSERT INTO `sys_oper_log` VALUES (452, '店铺', 2, 'cn.qihangerp.api.controller.ShopController.edit()', 'PUT', 1, 'admin', NULL, '/shop/shop', '127.0.0.1', '内网IP', '{\"accessExpiresIn\":0,\"accessToken\":\"86f2571c06714f0eaf02ce3924e0698b064f03c0\",\"accessTokenBegin\":0,\"company\":\"煜梦服饰\",\"createTime\":\"2024-06-04 11:20:04\",\"ename\":\"pdd\",\"id\":5,\"isDelete\":0,\"name\":\"梦小妮-拼多多\",\"nickName\":\"拼多多-梦小妮\",\"orderNum\":0,\"platform\":5,\"refreshTokenTimeout\":0,\"remark\":\"\",\"sellerShopId\":100061591,\"updateTime\":\"2024-06-11 13:37:51.285\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 13:37:51', 81);
INSERT INTO `sys_oper_log` VALUES (453, '菜单管理', 1, 'cn.qihangerp.api.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"goods/category/categoryAttribute\",\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"添加规格属性\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2008,\"path\":\"goods/category/attr_add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 20:34:48', 15);
INSERT INTO `sys_oper_log` VALUES (454, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"goods/category/categoryAttribute\",\"createTime\":\"2024-06-21 20:34:48\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2086,\"menuName\":\"添加规格属性\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2008,\"path\":\"goods/goods_category/attr_add\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 20:35:28', 10);
INSERT INTO `sys_oper_log` VALUES (455, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"goods/category/categoryAttribute\",\"createTime\":\"2024-06-21 20:34:48\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2086,\"menuName\":\"添加规格属性\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2008,\"path\":\"attr_add\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 20:36:39', 9);
INSERT INTO `sys_oper_log` VALUES (456, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"goods/category/categoryAttribute\",\"createTime\":\"2024-06-21 20:34:48\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2086,\"menuName\":\"添加规格属性\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"path\":\"attr_add\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 20:37:48', 8);
INSERT INTO `sys_oper_log` VALUES (457, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"goods/category/categoryAttribute\",\"createTime\":\"2024-06-21 20:34:48\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2086,\"menuName\":\"添加规格属性\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"path\":\"goods_category/attr_add\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 20:45:34', 8);
INSERT INTO `sys_oper_log` VALUES (458, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"goods/category/categoryAttribute\",\"createTime\":\"2024-06-21 20:34:48\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2086,\"menuName\":\"分类规格属性\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"path\":\"goods_category/attribute\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 20:48:00', 7);
INSERT INTO `sys_oper_log` VALUES (459, '商品分类属性', 1, 'cn.qihangerp.api.controller.ErpGoodsCategoryAttributeController.add()', 'POST', 1, 'admin', NULL, '/goods/categoryAttribute', '127.0.0.1', '内网IP', '{\"code\":\"color\",\"params\":{},\"title\":\"aaa\",\"type\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'category_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projects\\qihang-erp\\api\\target\\classes\\mapper\\api\\ErpGoodsCategoryAttributeMapper.xml]\r\n### The error may involve cn.qihangerp.api.mapper.ErpGoodsCategoryAttributeMapper.insertErpGoodsCategoryAttribute-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_goods_category_attribute          ( type,             title,             code )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'category_id\' doesn\'t have a default value\n; Field \'category_id\' doesn\'t have a default value', '2024-06-21 21:03:55', 66);
INSERT INTO `sys_oper_log` VALUES (460, '商品分类属性', 1, 'cn.qihangerp.api.controller.ErpGoodsCategoryAttributeController.add()', 'POST', 1, 'admin', NULL, '/goods/categoryAttribute', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"code\":\"color\",\"id\":117,\"params\":{},\"title\":\"222\",\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:05:31', 9);
INSERT INTO `sys_oper_log` VALUES (461, '商品分类属性', 2, 'cn.qihangerp.api.controller.ErpGoodsCategoryAttributeController.edit()', 'PUT', 1, 'admin', NULL, '/goods/categoryAttribute', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"code\":\"color\",\"id\":114,\"params\":{},\"title\":\"颜色\",\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:05:52', 5);
INSERT INTO `sys_oper_log` VALUES (462, '商品分类属性', 2, 'cn.qihangerp.api.controller.ErpGoodsCategoryAttributeController.edit()', 'PUT', 1, 'admin', NULL, '/goods/categoryAttribute', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"code\":\"color\",\"id\":114,\"params\":{},\"title\":\"颜色\",\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:06:14', 4);
INSERT INTO `sys_oper_log` VALUES (463, '商品分类属性', 2, 'cn.qihangerp.api.controller.ErpGoodsCategoryAttributeController.edit()', 'PUT', 1, 'admin', NULL, '/goods/categoryAttribute', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"code\":\"color\",\"id\":114,\"params\":{},\"title\":\"颜色\",\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:06:33', 8);
INSERT INTO `sys_oper_log` VALUES (464, '商品分类属性', 2, 'cn.qihangerp.api.controller.ErpGoodsCategoryAttributeController.edit()', 'PUT', 1, 'admin', NULL, '/goods/categoryAttribute', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"code\":\"color\",\"id\":117,\"params\":{},\"title\":\"222\",\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:07:08', 7);
INSERT INTO `sys_oper_log` VALUES (465, '商品分类属性', 2, 'cn.qihangerp.api.controller.ErpGoodsCategoryAttributeController.edit()', 'PUT', 1, 'admin', NULL, '/goods/categoryAttribute', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"code\":\"color\",\"id\":117,\"params\":{},\"title\":\"222\",\"type\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:07:13', 7);
INSERT INTO `sys_oper_log` VALUES (466, '商品分类属性', 3, 'cn.qihangerp.api.controller.ErpGoodsCategoryAttributeController.remove()', 'DELETE', 1, 'admin', NULL, '/goods/categoryAttribute/117', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:07:16', 7);
INSERT INTO `sys_oper_log` VALUES (467, '菜单管理', 1, 'cn.qihangerp.api.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"goods/category/categoryAttributeValue\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"规格属性值\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"path\":\"goods_category/attribute_value\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:14:34', 5);
INSERT INTO `sys_oper_log` VALUES (468, '商品分类属性值', 1, 'cn.qihangerp.api.controller.ErpGoodsCategoryAttributeValueController.add()', 'POST', 1, 'admin', NULL, '/goods/categoryAttributeValue', '127.0.0.1', '内网IP', '{\"id\":424,\"isDelete\":0,\"params\":{},\"skuCode\":\"AA\",\"value\":\"AAAA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:22:23', 7);
INSERT INTO `sys_oper_log` VALUES (469, '商品分类属性值', 1, 'cn.qihangerp.api.controller.ErpGoodsCategoryAttributeValueController.add()', 'POST', 1, 'admin', NULL, '/goods/categoryAttributeValue', '127.0.0.1', '内网IP', '{\"categoryAttributeId\":116,\"id\":425,\"isDelete\":0,\"params\":{},\"skuCode\":\"AA\",\"value\":\"AA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:23:51', 8);
INSERT INTO `sys_oper_log` VALUES (470, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"goods/category/categoryAttributeValue\",\"createTime\":\"2024-06-21 21:14:34\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2087,\"menuName\":\"规格属性值\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"path\":\"goods_category/attribute_value\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:25:33', 6);
INSERT INTO `sys_oper_log` VALUES (471, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"goods/category/categoryAttribute\",\"createTime\":\"2024-06-21 20:34:48\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2086,\"menuName\":\"分类规格属性\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2,\"path\":\"goods_category/attribute\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-21 21:25:39', 7);
INSERT INTO `sys_oper_log` VALUES (472, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"sale/order/index\",\"createTime\":\"2023-12-31 20:05:05\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"所有订单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":5,\"path\":\"order_list\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:04:30', 14);
INSERT INTO `sys_oper_log` VALUES (473, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shop/order_pull_log\",\"createTime\":\"2023-12-31 20:04:12\",\"icon\":\"upload\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"订单拉取日志\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":5,\"path\":\"order/pull_log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:04:43', 5);
INSERT INTO `sys_oper_log` VALUES (474, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shop/data\",\"createTime\":\"2023-12-29 17:04:08\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"店铺订单统计\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":5,\"path\":\"data\",\"perms\":\"shop:data\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:05:00', 10);
INSERT INTO `sys_oper_log` VALUES (475, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shop/order_pull_log\",\"createTime\":\"2023-12-31 20:04:12\",\"icon\":\"upload\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"订单拉取日志\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":5,\"path\":\"order/pull_log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:05:08', 8);
INSERT INTO `sys_oper_log` VALUES (476, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/ewaybillPrint/index\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"电子面单打印\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":6,\"path\":\"ewaybill_print\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:06:12', 8);
INSERT INTO `sys_oper_log` VALUES (477, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/shipFee\",\"createTime\":\"2024-01-12 18:35:31\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2063,\"menuName\":\"发货费用\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":6,\"path\":\"ship_fee\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:06:40', 7);
INSERT INTO `sys_oper_log` VALUES (478, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/stocking\",\"createTime\":\"2024-01-09 11:51:52\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2059,\"menuName\":\"备货清单\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":6,\"path\":\"stocking\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:06:57', 6);
INSERT INTO `sys_oper_log` VALUES (479, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/logistics/company\",\"createTime\":\"2024-01-03 14:14:09\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2052,\"menuName\":\"物流公司管理\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":6,\"path\":\"logistics_company\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:07:25', 9);
INSERT INTO `sys_oper_log` VALUES (480, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/stockOut\",\"createTime\":\"2024-01-09 13:39:00\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"拣货出库\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":6,\"path\":\"stockout\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:07:41', 8);
INSERT INTO `sys_oper_log` VALUES (481, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/ewaybillPrint/index\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"电子面单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":6,\"path\":\"ewaybill_print\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:08:18', 7);
INSERT INTO `sys_oper_log` VALUES (482, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/ewaybillPrint/index\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"电子面单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":6,\"path\":\"ewaybill_print\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:08:55', 9);
INSERT INTO `sys_oper_log` VALUES (483, '菜单管理', 1, 'cn.qihangerp.api.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"电子面单打印\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":6,\"path\":\"print\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-23 22:09:43', 9);
INSERT INTO `sys_oper_log` VALUES (484, '店铺', 2, 'cn.qihangerp.api.controller.ShopController.edit()', 'PUT', 1, 'admin', NULL, '/shop/shop', '127.0.0.1', '内网IP', '{\"accessExpiresIn\":0,\"accessToken\":\"\",\"accessTokenBegin\":0,\"company\":\"煜梦服饰\",\"createTime\":\"2024-06-04 11:20:04\",\"ename\":\"pdd\",\"id\":5,\"isDelete\":0,\"name\":\"启航牛ERP系统\",\"nickName\":\"启航牛ERP系统-拼多多\",\"orderNum\":0,\"platform\":5,\"refreshTokenTimeout\":0,\"remark\":\"\",\"sellerShopId\":100061591,\"updateTime\":\"2024-09-01 19:02:17.459\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-01 19:02:17', 24);
INSERT INTO `sys_oper_log` VALUES (485, '用户管理', 2, 'cn.qihangerp.api.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-08-07 19:31:37\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"研发部\",\"leader\":\"启航\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":101,\"email\":\"qihang@qq.com\",\"loginDate\":\"2023-08-07 19:31:37\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"qihang\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"qihang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 21:15:31', 320);
INSERT INTO `sys_oper_log` VALUES (486, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/ewaybillPrint/index\",\"createTime\":\"2024-08-23 22:09:43\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2088,\"menuName\":\"电子面单打印\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":6,\"path\":\"print\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-18 21:30:46', 17);
INSERT INTO `sys_oper_log` VALUES (487, '菜单管理', 3, 'cn.qihangerp.api.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-18 21:38:44', 9);
INSERT INTO `sys_oper_log` VALUES (488, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/stockOut\",\"createTime\":\"2024-01-09 13:39:00\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"拣货出库\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":6,\"path\":\"stockout\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-18 21:39:05', 10);
INSERT INTO `sys_oper_log` VALUES (489, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/shipOrder/logistics\",\"createTime\":\"2024-01-03 14:13:12\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2051,\"menuName\":\"物流跟踪\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":6,\"path\":\"ship_logistics\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-18 21:39:15', 10);
INSERT INTO `sys_oper_log` VALUES (490, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/stockInEntry/index\",\"createTime\":\"2023-12-31 12:27:37\",\"icon\":\"stockin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"入库管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":9,\"path\":\"stock_in_entry/list\",\"perms\":\"wms:stock_in_entry:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 21:26:57', 46);
INSERT INTO `sys_oper_log` VALUES (491, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/stockIn/index\",\"createTime\":\"2023-12-31 12:27:37\",\"icon\":\"stockin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"入库管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":9,\"path\":\"stock_in_entry/list\",\"perms\":\"wms:stock_in_entry:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 21:27:33', 11);
INSERT INTO `sys_oper_log` VALUES (492, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wms/stockOut\",\"createTime\":\"2024-01-03 11:00:53\",\"icon\":\"link\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2046,\"menuName\":\"出库管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":9,\"path\":\"stockOut\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 21:28:06', 11);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'URL地址',
  `object_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '对象名',
  `bucket` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '桶名',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-08-07 19:31:37', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-04-15 10:29:55', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` int NOT NULL,
  `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES (1, '更新淘宝订单', '-', NULL, '定时更新淘宝订单', '2024-03-07 09:52:40');
INSERT INTO `sys_task` VALUES (2, '更新京东订单', '-', NULL, '定时更新京东订单', '2024-03-07 09:23:36');

-- ----------------------------
-- Table structure for sys_task_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_logs`;
CREATE TABLE `sys_task_logs`  (
  `id` bigint NOT NULL COMMENT '主键ID',
  `task_id` int NULL DEFAULT NULL COMMENT '任务ID',
  `result` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结果',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始运行时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `status` int NULL DEFAULT NULL COMMENT '状态1运行中，2已结束',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_task_logs
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '启航', '00', '280645618@qq.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-11-27 21:23:01', 'admin', '2023-08-07 19:31:37', '', '2024-11-27 21:23:01', '管理员');
INSERT INTO `sys_user` VALUES (2, 101, 'qihang', 'qihang', '00', 'qihang@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-08-07 19:31:37', 'admin', '2023-08-07 19:31:37', 'admin', '2024-10-11 21:15:31', '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'admin11', 'aa', '00', '', '', '1', '', '$2a$10$VD49q2rn1ATpQDZJJrmJjuG52b4EkOTTZ0MPbRRmcqEYLmB5mAMsG', '0', '2', '', NULL, 'admin', '2024-04-24 11:06:27', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, NULL, '233232', '22233', '00', '', '', '0', '', '$2a$10$.SY9em0q2OGh8kFEHLnW8u1pAWJc1WaOneCEL8XapLkTCbgD94Q/.', '0', '0', '', NULL, 'admin', '2024-08-18 12:15:56', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for wms_goods_bad_stock
-- ----------------------------
DROP TABLE IF EXISTS `wms_goods_bad_stock`;
CREATE TABLE `wms_goods_bad_stock`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goodsId` int NOT NULL COMMENT '商品id',
  `specId` int NOT NULL COMMENT '商品规格id',
  `specNumber` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '规格编码（唯一）',
  `sourceId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '来源ID（type==1时 order_send_return主键id）',
  `type` int NOT NULL COMMENT '类型（1退货报损3待退还供应商）',
  `locationId` int NOT NULL DEFAULT 0 COMMENT '仓位',
  `quantity` int NOT NULL DEFAULT 0 COMMENT '数量',
  `lossAmount` double NOT NULL DEFAULT 0 COMMENT '损失金额（最大成本）',
  `isDelete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0正常  1删除',
  `result` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `resultTime` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `reason` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '理由',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '是否处理0未处理1已处理',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '不良品库存' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_goods_bad_stock
-- ----------------------------
INSERT INTO `wms_goods_bad_stock` VALUES (1, 13, 88, '28202206810101', '20', 1, 0, 1, 29, 0, '计入损失', '2022-10-03 17:39:32', '货物损坏，供应商拒收，消费者退款成功', 1, '2022-10-03 17:39:32', '2022-10-03 17:39:32');
INSERT INTO `wms_goods_bad_stock` VALUES (2, 33, 497, 'HN08017503', '76', 1, 0, 1, 28, 0, '计入损失', '2022-10-16 18:00:00', '货物损坏，供应商拒收，消费者退款成功', 1, '2022-10-16 18:00:00', '2022-10-16 18:00:00');
INSERT INTO `wms_goods_bad_stock` VALUES (3, 33, 502, 'HN08012903', '249', 1, 0, 1, 28, 0, '计入损失', '2022-11-07 09:42:33', '货物损坏，供应商拒收，消费者退款成功', 1, '2022-11-07 09:42:33', '2022-11-07 09:42:33');
INSERT INTO `wms_goods_bad_stock` VALUES (4, 15, 119, '28202106610102', '174', 1, 0, 1, 29, 0, '计入损失', '2022-11-07 09:43:20', '货物损坏，供应商拒收，消费者退款成功', 1, '2022-11-07 09:43:20', '2022-11-07 09:43:20');
INSERT INTO `wms_goods_bad_stock` VALUES (5, 37, 558, 'HN1062904', '327', 1, 0, 1, 31, 0, '计入损失', '2022-12-08 10:08:14', '货物损坏，供应商拒收，消费者退款成功', 1, '2022-12-08 10:08:14', '2022-12-08 10:08:14');

-- ----------------------------
-- Table structure for wms_goods_bad_stock_log
-- ----------------------------
DROP TABLE IF EXISTS `wms_goods_bad_stock_log`;
CREATE TABLE `wms_goods_bad_stock_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stockId` bigint NOT NULL COMMENT '商品id',
  `specId` int NOT NULL COMMENT '商品规格id',
  `locationId` int NOT NULL COMMENT '所在仓位',
  `type` int NOT NULL COMMENT '类型1入库2出库',
  `quantity` bigint NOT NULL DEFAULT 0 COMMENT '数量',
  `remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '不良品库存日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_goods_bad_stock_log
-- ----------------------------
INSERT INTO `wms_goods_bad_stock_log` VALUES (1, 1, 88, 0, 1, 1, '退货不良品入库SKU :28202206810101退货单号:BAD221003173932494', '2022-10-03 17:39:32');
INSERT INTO `wms_goods_bad_stock_log` VALUES (2, 2, 497, 0, 1, 1, '退货不良品入库SKU :HN08017503退货单号:BAD221016180000005', '2022-10-16 18:00:00');
INSERT INTO `wms_goods_bad_stock_log` VALUES (3, 3, 502, 0, 1, 1, '退货不良品入库SKU :HN08012903退货单号:BAD221107094233114', '2022-11-07 09:42:33');
INSERT INTO `wms_goods_bad_stock_log` VALUES (4, 4, 119, 0, 1, 1, '退货不良品入库SKU :28202106610102退货单号:BAD221107094320707', '2022-11-07 09:43:20');
INSERT INTO `wms_goods_bad_stock_log` VALUES (5, 5, 558, 0, 1, 1, '退货不良品入库SKU :HN1062904退货单号:BAD221208100814778', '2022-12-08 10:08:14');

-- ----------------------------
-- Table structure for wms_stock_in_entry
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_in_entry`;
CREATE TABLE `wms_stock_in_entry`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `stock_in_num` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '入库单据编号',
  `source_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源单号',
  `source_id` bigint NULL DEFAULT NULL COMMENT '来源单id',
  `source_type` int NOT NULL COMMENT '来源类型（1采购订单2退货订单）',
  `source_goods_unit` int NULL DEFAULT NULL COMMENT '采购订单商品数',
  `source_spec_unit_total` int NULL DEFAULT NULL COMMENT '采购订单总件数',
  `source_spec_unit` int NULL DEFAULT NULL COMMENT '采购订单商品规格数',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `stock_in_operator_id` int NULL DEFAULT NULL COMMENT '操作入库人id',
  `stock_in_operator` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作入库人',
  `stock_in_time` datetime NULL DEFAULT NULL COMMENT '入库时间',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态（0待入库1部分入库2全部入库）',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1794181606514589699 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '入库单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_stock_in_entry
-- ----------------------------
INSERT INTO `wms_stock_in_entry` VALUES (8, '20240116145057', 'PUR20240116144408', 466, 1, 1, 10, 1, NULL, 1, 'admin', '2024-01-16 00:00:00', 2, 'admin', '2024-01-16 14:50:58', 'admin', '2024-01-16 14:52:10');
INSERT INTO `wms_stock_in_entry` VALUES (1794180570081099778, '20240525093556', 'PUR20240525093505', 469, 1, 1, 10, 1, NULL, NULL, NULL, NULL, 0, 'admin', '2024-05-25 09:35:57', NULL, NULL);
INSERT INTO `wms_stock_in_entry` VALUES (1794181606514589698, '20240525094003', 'PUR20240424162152', 468, 1, 1, 10, 1, NULL, 1, 'admin', '2024-05-25 10:19:41', 1, 'admin', '2024-05-25 09:40:04', 'admin', '2024-05-25 10:36:15');

-- ----------------------------
-- Table structure for wms_stock_in_entry_item
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_in_entry_item`;
CREATE TABLE `wms_stock_in_entry_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entry_id` bigint NOT NULL COMMENT '入库单id',
  `source_type` int NULL DEFAULT NULL COMMENT '来源类型（1采购订单2退货订单）',
  `source_id` bigint NULL DEFAULT NULL COMMENT '来源单id',
  `source_item_id` bigint NOT NULL COMMENT '来源单itemId',
  `goods_id` bigint NOT NULL COMMENT '商品id',
  `goods_num` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `spec_id` bigint NOT NULL COMMENT '商品规格id',
  `spec_num` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品规格编码',
  `color_value` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `color_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `size_value` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '尺码',
  `style_value` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '款式',
  `original_quantity` bigint NULL DEFAULT NULL COMMENT '原始数量',
  `in_quantity` bigint NOT NULL COMMENT '入库数量',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  `location_id` int NULL DEFAULT NULL COMMENT '入库仓位',
  `location_num` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '入库仓位编码',
  `status` int NULL DEFAULT 0 COMMENT '状态（0待入库1部分入库2全部入库）',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `specIndex`(`spec_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1794181606552338434 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '入库单明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_stock_in_entry_item
-- ----------------------------
INSERT INTO `wms_stock_in_entry_item` VALUES (4, 8, 1, 466, 1962, 9, 'HN8026', 'HN8026牛仔短裤', 32, '2720210080260105', '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', '2XL', '', 10, 10, '', NULL, NULL, 2, 'admin', '2024-01-16 14:50:58', 'admin', '2024-01-16 14:52:10');
INSERT INTO `wms_stock_in_entry_item` VALUES (1794180570152402946, 1794180570081099778, 1, 469, 1965, 29, 'HNP182', 'HNP182弹力紧身贴标牛仔短裤女ins', 439, 'HNP1825005', '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', '2XL', '', 10, 0, '', NULL, NULL, 0, 'admin', '2024-05-25 09:35:57', NULL, NULL);
INSERT INTO `wms_stock_in_entry_item` VALUES (1794181606552338433, 1794181606514589698, 1, 468, 1964, 68, 'JKL3112', 'JKL3112松紧腰束脚哈伦裤', 1327, 'JKL31120705', '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', '2XL', '', 10, 1, '', NULL, NULL, 1, 'admin', '2024-05-25 09:40:04', 'admin', '2024-05-25 10:36:15');

-- ----------------------------
-- Table structure for wms_stock_location
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_location`;
CREATE TABLE `wms_stock_location`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货架编号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货架名称',
  `parent_id` int NOT NULL COMMENT '上级id',
  `depth` int NULL DEFAULT 1 COMMENT '层级深度1级2级3级',
  `parent_id1` int NOT NULL COMMENT '一级类目id',
  `parent_id2` int NOT NULL COMMENT '二级类目id',
  `address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `isDelete` int NOT NULL DEFAULT 0 COMMENT '0正常  1删除',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仓库货架表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_stock_location
-- ----------------------------
INSERT INTO `wms_stock_location` VALUES (1, '001', '深圳虚拟仓库', 0, 1, 0, 0, NULL, NULL, 0, 'admin', '2022-03-07 20:06:10', NULL, '2022-03-07 20:06:10');
INSERT INTO `wms_stock_location` VALUES (2, 'A', 'A区', 1, 2, 1, 0, NULL, NULL, 0, 'admin', '2022-03-07 20:06:24', NULL, '2022-03-07 20:06:24');
INSERT INTO `wms_stock_location` VALUES (3, 'B', 'B区', 1, 2, 1, 0, NULL, NULL, 0, 'admin', '2022-03-07 20:06:38', NULL, '2022-03-07 20:06:38');
INSERT INTO `wms_stock_location` VALUES (4, 'C', 'C区', 1, 2, 1, 0, NULL, NULL, 0, 'admin', '2022-03-07 20:06:47', NULL, '2022-03-07 20:06:47');
INSERT INTO `wms_stock_location` VALUES (5, 'A01-1-01', 'A01-1-01', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (6, 'A01-1-02', 'A01-1-02', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (7, 'A01-1-03', 'A01-1-03', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (8, 'A01-1-04', 'A01-1-04', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (9, 'A01-1-05', 'A01-1-05', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (10, 'A01-1-06', 'A01-1-06', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (11, 'A01-1-07', 'A01-1-07', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (12, 'A01-1-08', 'A01-1-08', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (13, 'A01-1-09', 'A01-1-09', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (14, 'A01-1-10', 'A01-1-10', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (15, 'A01-1-11', 'A01-1-11', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (16, 'A01-1-12', 'A01-1-12', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (17, 'A01-1-13', 'A01-1-13', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (18, 'A01-1-14', 'A01-1-14', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (19, 'A01-1-15', 'A01-1-15', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (20, 'A01-1-16', 'A01-1-16', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');

-- ----------------------------
-- Table structure for wms_stock_out_entry
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_out_entry`;
CREATE TABLE `wms_stock_out_entry`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stock_out_num` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '出库单编号',
  `source_num` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源单据号',
  `source_id` bigint NULL DEFAULT NULL COMMENT '来源单据Id',
  `stock_out_type` int NOT NULL DEFAULT 1 COMMENT '出库类型1订单拣货出库2采购退货出库3盘点出库4报损出库',
  `goods_unit` int NOT NULL COMMENT '商品数',
  `spec_unit` int NOT NULL COMMENT '商品规格数',
  `spec_unit_total` int NOT NULL COMMENT '总件数',
  `out_total` int NULL DEFAULT NULL COMMENT '已出库数量',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int NOT NULL COMMENT '状态：0待出库1部分出库2全部出库',
  `print_status` int NOT NULL COMMENT '打印状态：是否打印1已打印0未打印',
  `print_time` datetime NULL DEFAULT NULL COMMENT '打印时间',
  `out_time` datetime NULL DEFAULT NULL COMMENT '出库时间',
  `complete_time` datetime NULL DEFAULT NULL COMMENT '完成出库时间',
  `operator_id` int NULL DEFAULT 0 COMMENT '出库操作人userid',
  `operator_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '出库操作人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `create_by` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1794205460481933314 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_stock_out_entry
-- ----------------------------
INSERT INTO `wms_stock_out_entry` VALUES (1785676644348735490, '202405012220056', NULL, NULL, 1, 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, '2024-05-01 22:24:23', '生成拣货单', '2024-05-01 22:24:22', NULL);
INSERT INTO `wms_stock_out_entry` VALUES (1786204816504958978, '202405030923075', NULL, NULL, 1, 1, 1, 1, 1, NULL, 2, 0, NULL, '2024-05-03 10:56:33', '2024-05-03 10:56:33', 1, 'admin', '2024-05-03 09:23:09', '生成拣货单', '2024-05-03 10:56:34', '出库');
INSERT INTO `wms_stock_out_entry` VALUES (1788393466709282818, '202405091020024', NULL, NULL, 1, 1, 1, 1, 0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, '2024-05-09 10:20:04', '生成拣货单', '2024-05-09 10:20:03', NULL);
INSERT INTO `wms_stock_out_entry` VALUES (1794205460481933313, '202405251109432', NULL, NULL, 1, 1, 1, 1, 0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, '2024-05-25 11:14:51', '生成拣货单', '2024-05-25 11:14:51', NULL);

-- ----------------------------
-- Table structure for wms_stock_out_entry_item
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_out_entry_item`;
CREATE TABLE `wms_stock_out_entry_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `stock_out_type` int NOT NULL COMMENT '出库类型1订单拣货出库2采购退货出库3盘点出库4报损出库',
  `entry_id` bigint NOT NULL COMMENT '出库单id（外键）',
  `source_order_id` bigint NOT NULL COMMENT '来源订单id',
  `source_order_item_id` bigint NOT NULL COMMENT '来源订单itemId出库对应的itemId，如：order_item表id、invoice_info表id',
  `source_order_num` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '来源订单号',
  `goods_id` int NOT NULL COMMENT '商品id',
  `spec_id` int NOT NULL COMMENT '商品规格id',
  `spec_num` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '规格编码',
  `original_quantity` bigint NOT NULL COMMENT '总数量',
  `out_quantity` bigint NOT NULL DEFAULT 0 COMMENT '已出库数量',
  `complete_time` datetime NULL DEFAULT NULL COMMENT '完成出库时间',
  `picked_time` datetime NULL DEFAULT NULL COMMENT '完成拣货时间',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态：0待出库1部分出库2全部出库',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `specIndex`(`spec_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1794205460544847874 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_stock_out_entry_item
-- ----------------------------
INSERT INTO `wms_stock_out_entry_item` VALUES (1785676644373901314, 1, 1785676644348735490, 38, 442, '2055782964491095876', 9, 23, '2720210080260001', 1, 0, NULL, NULL, 0, '2024-05-01 22:24:23', NULL);
INSERT INTO `wms_stock_out_entry_item` VALUES (1786204816504958979, 1, 1786204816504958978, 41, 1785584827112509446, '2137984935735126281', 9, 32, '2720210080260105', 1, 1, '2024-05-03 10:56:27', '2024-05-03 10:56:26', 2, '2024-05-03 09:23:09', NULL);
INSERT INTO `wms_stock_out_entry_item` VALUES (1788393466763808769, 1, 1788393466709282818, 51, 1785584827112509452, 'A13885020023320', 1228, 1228, 'GZYYZ72773100', 1, 0, NULL, NULL, 0, '2024-05-09 10:20:04', NULL);
INSERT INTO `wms_stock_out_entry_item` VALUES (1794205460544847873, 1, 1794205460481933313, 49, 1785584827112509450, 'AD3702565220', 1229, 1229, 'GZYYZ72776200', 1, 0, NULL, NULL, 0, '2024-05-25 11:14:51', NULL);

-- ----------------------------
-- Table structure for wms_stock_out_entry_item_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_out_entry_item_detail`;
CREATE TABLE `wms_stock_out_entry_item_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `entry_id` bigint NOT NULL COMMENT '出库单ID',
  `entry_item_id` bigint NOT NULL DEFAULT 0 COMMENT '出库单ItemID',
  `goods_inventory_id` bigint NOT NULL DEFAULT 0 COMMENT '库存ID',
  `goods_inventory_detail_id` bigint NOT NULL DEFAULT 0 COMMENT '库存详情ID',
  `quantity` bigint NOT NULL DEFAULT 0 COMMENT '出库数量',
  `location_id` int NULL DEFAULT NULL COMMENT '出库仓位ID',
  `operator_id` int NULL DEFAULT 0 COMMENT '出库操作人userid',
  `operator_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '出库操作人',
  `out_time` datetime NULL DEFAULT NULL COMMENT '出库时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_stock_info_item_id_index`(`goods_inventory_detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1786228283631636482 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库明细详情' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_stock_out_entry_item_detail
-- ----------------------------
INSERT INTO `wms_stock_out_entry_item_detail` VALUES (1786220616376844290, 1786204816504958978, 1786204816504958979, 6, 7, 1, 20, 1, 'admin', '2024-05-03 10:25:55');
INSERT INTO `wms_stock_out_entry_item_detail` VALUES (1786228283631636481, 1786204816504958978, 1786204816504958979, 6, 7, 1, 20, 1, 'admin', '2024-05-03 10:56:24');

SET FOREIGN_KEY_CHECKS = 1;
