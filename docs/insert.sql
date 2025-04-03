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
-- Records of erp_goods_attribute_config
-- ----------------------------
-- 药品相关属性配置
INSERT INTO `erp_goods_attribute_config` VALUES (1, 1, '生产年份', '2023,2024');
INSERT INTO `erp_goods_attribute_config` VALUES (2, 1, '剂型', '片剂,胶囊,口服液,注射剂,软膏');
INSERT INTO `erp_goods_attribute_config` VALUES (3, 1, '适应症', '感冒,高血压,糖尿病,消化不良,过敏');
INSERT INTO `erp_goods_attribute_config` VALUES (4, 1, 'OTC/处方药', 'OTC,处方药');
INSERT INTO `erp_goods_attribute_config` VALUES (5, 1, '包装规格', '10片/盒,20片/盒,50ml/瓶,100ml/瓶');
INSERT INTO `erp_goods_attribute_config` VALUES (6, 1, '储存条件', '常温,避光,低温冷藏');

-- ----------------------------
-- Records of erp_goods_category_attribute
-- ----------------------------
-- 药品类别属性配置
INSERT INTO `erp_goods_category_attribute` VALUES (114, 1, 1, '剂型', 'dosage_form');
INSERT INTO `erp_goods_category_attribute` VALUES (115, 1, 1, '规格', 'specification');
INSERT INTO `erp_goods_category_attribute` VALUES (116, 1, 1, '适应症', 'indication');
INSERT INTO `erp_goods_category_attribute` VALUES (117, 1, 1, '用法用量', 'dosage');
INSERT INTO `erp_goods_category_attribute` VALUES (118, 1, 1, '批准文号', 'approval_number');
INSERT INTO `erp_goods_category_attribute` VALUES (119, 1, 1, '生产企业', 'manufacturer');

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');

-- ----------------------------
-- Records of sys_role
-- CHANGE UPON
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-08-07 19:31:37', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-04-15 10:29:55', '普通角色');


-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

INSERT INTO `scm_purchase_order_payable` VALUES (1,33,'阿斯利康',52.00,'2024-01-28',NULL,'PUR20240128113656','{采购商品总数量:2,不同款式:1,不同SKU:1,商品总价:42.00,运费:10}',NULL,0,'2024-01-28 12:07:32','admin','2025-03-14 14:56:41',NULL);
INSERT INTO `scm_purchase_order_payable` VALUES (2,31,'ABC药品有限公司',432.00,'2024-04-24',NULL,'PUR20240424162152','{采购商品总数量:10,不同款式:1,不同SKU:1,商品总价:420.00,运费:12}','1',0,'2024-04-24 16:22:40','admin','2025-03-14 14:56:35',NULL);
INSERT INTO `scm_purchase_order_payable` VALUES (3,33,'阿斯利康',210.00,'2024-05-25',NULL,'PUR20240525093505','{采购商品总数量:10,不同款式:1,不同SKU:1,商品总价:210.00,运费:0}',NULL,0,'2024-05-25 09:35:36','admin','2025-03-14 14:56:26',NULL);
INSERT INTO `scm_purchase_order_payable` VALUES (4,36,'辉瑞制药有限公司',120.00,'2024-06-10',NULL,'PUR20240610104530','{采购商品总数量:5,不同款式:2,不同SKU:2,商品总价:110.00,运费:10}',NULL,0,'2024-06-10 10:45:30','admin','2025-03-14 15:20:50',NULL);
INSERT INTO `scm_purchase_order_payable` VALUES (5,37,'拜耳医药',540.00,'2024-07-05',NULL,'PUR20240705153012','{采购商品总数量:12,不同款式:3,不同SKU:3,商品总价:520.00,运费:20}',NULL,0,'2024-07-05 15:30:12','admin','2025-03-14 15:22:14',NULL);
INSERT INTO `scm_purchase_order_payable` VALUES (6,38,'罗氏制药',315.00,'2024-08-18',NULL,'PUR20240818120045','{采购商品总数量:8,不同款式:2,不同SKU:2,商品总价:300.00,运费:15}',NULL,0,'2024-08-18 12:00:45','admin','2025-03-14 15:23:59',NULL);
INSERT INTO `scm_purchase_order_payable` VALUES (7,39,'诺华制药',480.00,'2024-09-20',NULL,'PUR20240920173025','{采购商品总数量:15,不同款式:4,不同SKU:4,商品总价:460.00,运费:20}',NULL,0,'2024-09-20 17:30:25','admin','2025-03-14 15:25:33',NULL);
INSERT INTO `scm_purchase_order_payable` VALUES (8,40,'葛兰素史克',265.00,'2024-10-12',NULL,'PUR20241012111050','{采购商品总数量:7,不同款式:2,不同SKU:2,商品总价:250.00,运费:15}',NULL,0,'2024-10-12 11:10:50','admin','2025-03-14 15:27:15',NULL);


INSERT INTO `scm_supplier` VALUES (34,'ABC药品有限公司','550001003221',12,1000000,20000,3000,'2024-04-20','','客户经理','郑永康','13912345678','四川','成都','双流','四川成都双流ABC','ABCyaopingyouxiangongsi',0,0,NULL,'2025-03-14 14:48:33');
INSERT INTO `scm_supplier` VALUES (35,'阿斯利康','21087912847',1,213124,21323,134321,'2025-03-03','2131aa','客户经理','王红','18019699527','上海','上海','闵行','上海阿斯利康中华区','AzureAAAAA',0,0,NULL,'2025-03-14 14:55:31');
INSERT INTO `scm_supplier` VALUES (36,'辉瑞制药有限公司','330045678901',5,500000,15000,5000,'2024-05-10','','客户经理','李明','13856789012','北京','北京','朝阳','北京辉瑞制药总部','PfizerChina',0,0,NULL,'2025-03-14 15:05:21');
INSERT INTO `scm_supplier` VALUES (37,'拜耳医药','110023456789',8,800000,25000,7000,'2024-06-15','','客户经理','赵强','13987654321','广东','广州','天河','广州拜耳医药科技园','BayerPharma',0,0,NULL,'2025-03-14 15:07:45');
INSERT INTO `scm_supplier` VALUES (38,'罗氏制药','440012345678',3,650000,18000,5500,'2024-07-22','','客户经理','孙华','13799887766','江苏','苏州','工业园区','苏州罗氏制药有限公司','RocheChina',0,0,NULL,'2025-03-14 15:10:30');
INSERT INTO `scm_supplier` VALUES (39,'诺华制药','520098765432',2,720000,23000,6000,'2024-08-05','','客户经理','陈伟','18612345678','浙江','杭州','滨江','杭州诺华制药分公司','NovartisHZ',0,0,NULL,'2025-03-14 15:12:10');
INSERT INTO `scm_supplier` VALUES (40,'葛兰素史克','310076543210',7,900000,27000,8000,'2024-09-12','','客户经理','王芳','18598765432','山东','青岛','市北','青岛葛兰素史克贸易有限公司','GSKChina',0,0,NULL,'2025-03-14 15:15:55');

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
-- Records of scm_purchase_order
-- ----------------------------
INSERT INTO `scm_purchase_order` VALUES (466, 33, 'PUR20240116144408', '2024-01-16', 1705387448, 190.00, 0.00, NULL, 3, '启航', 1705387461, '2024-01-16 14:44:30', '2024-01-16 14:49:49', '2024-01-16 00:00:00', '2024-01-16 14:50:58', 'admin', '2024-01-16 14:44:09', 'admin', '2024-01-16 14:50:58');
INSERT INTO `scm_purchase_order` VALUES (467, 33, 'PUR20240128113656', '2024-01-28', 1706413016, 42.00, 10.00, NULL, 102, '启航', 1706413030, '2024-01-28 11:42:19', '2024-01-28 12:07:32', NULL, NULL, 'admin', '2024-01-28 11:36:56', 'admin', '2024-01-28 12:07:32');
INSERT INTO `scm_purchase_order` VALUES (468, 31, 'PUR20240424162152', '2024-04-24', 1713946912, 420.00, 12.00, NULL, 3, 'qh', 1713946921, '2024-04-24 16:22:14', '2024-04-24 16:22:40', '2024-05-25 00:00:00', '2024-05-25 09:40:04', 'admin', '2024-04-24 16:21:52', 'admin', '2024-05-25 09:40:04');
INSERT INTO `scm_purchase_order` VALUES (469, 33, 'PUR20240525093505', '2024-05-25', 1716600905, 210.00, 0.00, NULL, 3, 'q', 1716600916, '2024-05-25 09:35:21', '2024-05-25 09:35:36', '2024-05-25 00:00:00', '2024-05-25 09:35:57', 'admin', '2024-05-25 09:35:06', 'admin', '2024-05-25 09:35:57');

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
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '1', '1', '1', 'admin', '2023-08-07 19:31:38', 'admin', '2024-01-28 13:30:18', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-08-07 19:31:38', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-08-07 19:31:38', '', NULL, '');
INSERT INTO `sys_job` VALUES (100, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '0/30 * * * * ?', '1', '1', '1', 'admin', '2024-01-28 13:44:43', '', '2024-01-28 13:47:13', '');
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


INSERT INTO `sys_menu` VALUES (1,'系统设置','oms',0,99,'/system','','',1,0,'M','0','0','','system','admin','2023-12-27 15:00:27','admin','2023-12-29 09:07:42.856856','系统管理目录'),(4,'采购管理',NULL,0,1,'purchase','','',1,0,'M','0','0','','server','admin','2023-12-27 15:00:27','admin','2024-04-24 17:06:13','至简官网地址'),(9,'库存管理','',0,5,'wms','','',1,0,'M','0','0','','dict','admin','2023-12-31 12:14:33','admin','2024-04-23 15:43:32',''),(100,'用户管理','oms',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2023-12-27 15:00:27','','','用户管理菜单'),(101,'角色管理','',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2023-12-27 15:00:27','','','角色管理菜单'),(102,'菜单管理','',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2023-12-27 15:00:27','','','菜单管理菜单'),(104,'岗位管理','',1,5,'post','system/post/index','',1,0,'C','1','0','system:post:list','post','admin','2023-12-27 15:00:27','admin','2024-04-12 16:44:52','岗位管理菜单'),(105,'字典管理','',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2023-12-27 15:00:27','','','字典管理菜单'),(108,'日志管理','',1,9,'log','','',1,0,'M','0','0','','log','admin','2023-12-27 15:00:27','','','日志管理菜单'),(500,'操作日志',NULL,108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2023-12-27 15:00:27','','','操作日志菜单'),(501,'登录日志',NULL,108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2023-12-27 15:00:27','','','登录日志菜单'),(1000,'用户查询',NULL,100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2023-12-27 15:00:27','','',''),(1001,'用户新增',NULL,100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2023-12-27 15:00:27','','',''),(1002,'用户修改',NULL,100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2023-12-27 15:00:27','','',''),(1003,'用户删除',NULL,100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2023-12-27 15:00:27','','',''),(1004,'用户导出',NULL,100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2023-12-27 15:00:27','','',''),(1005,'用户导入',NULL,100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2023-12-27 15:00:27','','',''),(1006,'重置密码',NULL,100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2023-12-27 15:00:27','','',''),(1007,'角色查询',NULL,101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2023-12-27 15:00:27','','',''),(1008,'角色新增',NULL,101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2023-12-27 15:00:27','','',''),(1009,'角色修改',NULL,101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2023-12-27 15:00:27','','',''),(1010,'角色删除',NULL,101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2023-12-27 15:00:27','','',''),(1011,'角色导出',NULL,101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2023-12-27 15:00:27','','',''),(1012,'菜单查询',NULL,102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2023-12-27 15:00:27','','',''),(1013,'菜单新增',NULL,102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2023-12-27 15:00:27','','',''),(1014,'菜单修改',NULL,102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2023-12-27 15:00:27','','',''),(1015,'菜单删除',NULL,102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2023-12-27 15:00:27','','',''),(1020,'岗位查询',NULL,104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2023-12-27 15:00:27','','',''),(1021,'岗位新增',NULL,104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2023-12-27 15:00:27','','',''),(1022,'岗位修改',NULL,104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2023-12-27 15:00:27','','',''),(1023,'岗位删除',NULL,104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2023-12-27 15:00:27','','',''),(1024,'岗位导出',NULL,104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2023-12-27 15:00:27','','',''),(1025,'字典查询',NULL,105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2023-12-27 15:00:27','','',''),(1026,'字典新增',NULL,105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2023-12-27 15:00:27','','',''),(1027,'字典修改',NULL,105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2023-12-27 15:00:27','','',''),(1028,'字典删除',NULL,105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2023-12-27 15:00:27','','',''),(1029,'字典导出',NULL,105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2023-12-27 15:00:27','','',''),(1039,'操作查询',NULL,500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2023-12-27 15:00:27','','',''),(1040,'操作删除',NULL,500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2023-12-27 15:00:27','','',''),(1041,'日志导出',NULL,500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2023-12-27 15:00:27','','',''),(1042,'登录查询',NULL,501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2023-12-27 15:00:27','','',''),(1043,'登录删除',NULL,501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2023-12-27 15:00:27','','',''),(1044,'日志导出',NULL,501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2023-12-27 15:00:27','','',''),(1045,'账户解锁',NULL,501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2023-12-27 15:00:27','','',''),(2005,'供应商管理',NULL,4,9,'supplier/list','scm/supplier/index','',1,0,'C','0','0','scm:supplier','qq','admin','2023-12-29 09:14:02','admin','2023-12-29 09:17:27.514466',''),(2010,'采购申请管理',NULL,4,1,'order','scm/purchase/order','',1,0,'C','0','0','scm:purchase:order','button','admin','2023-12-29 16:35:55','admin','2025-04-03 09:27:07',''),(2012,'采购订单管理',NULL,4,2,'ship','scm/purchase/ship','',1,0,'C','0','0','scm:purchase:ship','component','admin','2023-12-29 16:45:42','admin','2025-04-03 09:26:22',''),(2019,'采购付款管理',NULL,4,2,'purchase','scm/purchase/cost','',1,0,'C','0','0','','money','admin','2023-12-29 17:09:32','admin','2025-04-03 09:31:34',''),(2021,'创建采购单',NULL,4,0,'order/create','scm/purchase/order/create','',1,0,'C','1','0','','edit','admin','2023-12-29 21:23:45','admin','2024-04-24 17:11:38',''),(2025,'采购单详情',NULL,4,1,'order/detail','scm/purchase/order/detail','',1,0,'C','1','0','','button','admin','2023-12-30 17:08:01','admin','2024-04-24 17:15:00',''),(2027,'入库管理',NULL,9,0,'stock_in_entry/list','wms/stockIn/index','',1,0,'C','0','0','wms:stock_in_entry:list','stockin','admin','2023-12-31 12:27:37','admin','2024-11-27 21:27:33',''),(2028,'生成采购入库单',NULL,4,3,'ship/create_stock_in_entry','scm/purchase/ship/create_stock_in_entry','',1,0,'C','1','0','','button','admin','2023-12-31 12:31:32','admin','2024-04-24 17:12:38',''),(2046,'出库管理',NULL,9,5,'stockOut','wms/stockOut',NULL,1,0,'C','0','0','','link','admin','2024-01-03 11:00:53','admin','2024-11-27 21:28:06',''),(2047,'库存查询',NULL,9,6,'goodsInventory','goods/goodsInventory',NULL,1,0,'C','0','0','','monitor','admin','2024-01-03 11:01:14','admin','2024-01-09 17:55:33',''),(2048,'库存盘点',NULL,9,9,'pan',NULL,NULL,1,0,'C','0','1','','bug','admin','2024-01-03 11:01:43','admin','2024-01-09 19:57:08',''),(2061,'库位管理',NULL,9,99,'stock_location','wms/location',NULL,1,0,'C','0','0','','education','admin','2024-01-09 13:54:30','admin','2024-01-09 14:50:33',''),(2085,'采购合同管理',NULL,4,4,'bill','scm/purchase/bill',NULL,1,0,'C','0','0','','documentation','admin','2024-04-24 17:03:07','admin','2025-04-03 09:32:15','');

INSERT INTO `sys_menu_oms` VALUES (1,'订单管理',0,1,'/order','Layout','',1,0,'M','0','0','','shopping','admin','2023-12-27 15:00:27','admin','2024-03-30 17:44:37','系统管理目录'),(2,'售后管理',0,2,'/refund','Layout','',1,0,'M','0','0','','monitor','admin','2023-12-27 15:00:27','admin','2024-04-06 14:49:33','至简官网地址'),(3,'店铺管理',0,5,'shop','Layout','',1,0,'M','0','0','','dict','admin','2023-12-29 13:29:44','admin','2024-03-30 17:43:35',''),(4,'商品管理',0,4,'/goods','Layout','',1,0,'M','0','0','','build','admin','2023-12-29 16:53:03','admin','2024-03-30 17:43:57',''),(5,'系统设置',0,99,'/system','Layout','',1,0,'M','0','0','','system','admin','2023-12-27 15:00:27','admin','2023-12-29 09:07:42.856856','系统管理目录'),(100,'订单处理',1,1,'order_list','order/index','',1,0,'C','0','0','','shopping','admin','2023-12-27 15:00:27','admin','2024-04-06 17:25:10','用户管理菜单'),(101,'订单更新日志',1,4,'pull_logs','order/shopOrder/pull_log','',1,0,'C','0','0','','peoples','admin','2023-12-27 15:00:27','admin','2024-04-06 11:19:26','角色管理菜单'),(102,'店铺订单管理',1,3,'shop_order_list','order/shopOrder/index','',1,0,'C','0','0','','monitor','admin','2023-12-27 15:00:27','admin','2024-04-06 11:18:00','菜单管理菜单'),(104,'退款查询',2,1,'refund_list','refund/index','',1,0,'C','0','0','','tree','admin','2023-12-27 15:00:27','admin','2024-04-06 17:27:38','岗位管理菜单'),(105,'退款更新日志',2,6,'pull_logs','refund/shopRefund/pull_log','',1,0,'C','0','0','','dict','admin','2023-12-27 15:00:27','admin','2024-04-06 15:48:34','字典管理菜单'),(106,'店铺退款管理',2,2,'shop_refund_list','refund/shopRefund/index','',1,0,'C','0','0','','edit','admin','2023-12-27 15:00:27','admin','2024-04-06 15:48:21','参数设置菜单'),(108,'店铺列表',3,9,'shop_list','shop/index','',1,0,'C','0','0','','tree','admin','2023-12-29 09:14:02','admin','2024-03-21 17:01:52',''),(109,'店铺商品管理',3,10,'goods','','',1,0,'M','1','0','','peoples','admin','2023-12-29 13:31:01','admin','2024-03-22 10:45:01',''),(110,'开放平台设置',3,88,'platform_setting','shop/platform/index','',1,0,'C','0','0','','peoples','admin','2023-12-29 13:32:41','admin','2024-03-21 13:46:05',''),(112,'ERP商品SKU',4,1,'sku_list','goods/spec/index','',1,0,'C','0','0','','tree','admin','2023-12-29 16:35:55','admin','2024-03-21 11:40:29',''),(116,'用户管理',5,1,'user','system/user/index','',1,0,'C','0','0','','user','admin','2023-12-27 15:00:27','','','用户管理菜单'),(117,'菜单管理',5,1,'menu','system/menu/index','',1,0,'C','0','0','','user','admin','2023-12-27 15:00:27','','','用户管理菜单'),(2077,'店铺商品管理',4,2,'shop_goods','goods/shopGoods/index',NULL,1,0,'C','0','0','','shopping','admin','2024-03-28 10:29:59','admin','2024-03-28 10:30:59',''),(2078,'添加ERP商品',4,9,'goods_add','goods/create',NULL,1,0,'C','1','0','','checkbox','admin','2024-03-18 07:59:57','admin','2024-03-21 10:10:11',''),(2079,'字典管理',5,9,'dict','system/dict/index',NULL,1,0,'C','0','0','','dict','admin','2024-03-18 08:43:55','admin','2024-03-18 08:44:08',''),(2080,'店铺商品管理-淘宝',109,1,'tao_goods_list','tao/goods/index',NULL,1,0,'C','1','0','','code','admin','2024-03-21 11:41:36','admin','2024-03-22 10:42:41',''),(2081,'店铺商品管理-京东',109,2,'jd_goods_list','jd/goods/index',NULL,1,0,'C','1','0','','code','admin','2024-03-21 11:42:30','admin','2024-03-23 10:14:24',''),(2082,'店铺商品管理-拼多多',109,4,'pdd_goods_list','pdd/goods/index',NULL,1,0,'C','1','0','','tool','admin','2024-03-21 13:35:26','admin','2024-03-23 10:15:16',''),(2083,'店铺商品管理-抖店',109,3,'dou_goods_list','dou/goods/index',NULL,1,0,'C','1','0','','code','admin','2024-03-21 20:04:15','admin','2024-03-23 10:14:57',''),(2084,'快递公司库',3,99,'logistics_companies','shipping/logistics/company',NULL,1,0,'C','1','0','','code','admin','2024-03-21 20:05:09','admin','2024-03-31 10:09:38',''),(2085,'省市区地址库',110,6,'addr',NULL,NULL,1,0,'C','1','0',NULL,'color','admin','2024-03-21 20:05:39','',NULL,''),(2086,'定时任务',5,5,'sys_task','system/task/index',NULL,1,0,'C','0','0','','time-range','admin','2024-03-22 19:29:20','admin','2024-03-22 19:31:23',''),(2087,'发货管理',0,3,'shipping',NULL,NULL,1,0,'M','0','0','','guide','admin','2024-03-30 17:36:10','admin','2024-03-31 09:57:41',''),(2088,'快递公司管理',2087,9,'logistics_company','shipping/logistics/company',NULL,1,0,'C','0','0','','checkbox','admin','2024-03-30 17:37:01','admin','2024-03-31 09:58:18',''),(2089,'发货管理',2087,2,'ship','shipping/index',NULL,1,0,'C','0','0','','edit','admin','2024-03-30 17:37:42','admin','2024-04-06 14:49:59',''),(2090,'角色管理',5,2,'role','system/role/index',NULL,1,0,'C','0','0',NULL,'peoples','admin','2024-03-31 12:40:50','',NULL,''),(2091,'部门管理',5,3,'dept','system/dept/index',NULL,1,0,'C','0','0',NULL,'tree','admin','2024-03-31 12:42:57','',NULL,''),(2092,'售后处理',2,0,'processing','afterSale/index',NULL,1,0,'C','0','0','','documentation','admin','2024-04-06 17:27:03','admin','2024-04-06 17:31:12',''),(2093,'订单明细',1,2,'order_item_list','order/item_list',NULL,1,0,'C','0','0',NULL,'chart','admin','2024-04-06 18:58:06','',NULL,'');

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '启航', '00', '280645618@qq.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-11-27 21:23:01', 'admin', '2023-08-07 19:31:37', '', '2024-11-27 21:23:01', '管理员');
INSERT INTO `sys_user` VALUES (2, 101, 'qihang', 'qihang', '00', 'qihang@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-08-07 19:31:37', 'admin', '2023-08-07 19:31:37', 'admin', '2024-10-11 21:15:31', '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'admin11', 'aa', '00', '', '', '1', '', '$2a$10$VD49q2rn1ATpQDZJJrmJjuG52b4EkOTTZ0MPbRRmcqEYLmB5mAMsG', '0', '2', '', NULL, 'admin', '2024-04-24 11:06:27', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, NULL, '233232', '22233', '00', '', '', '0', '', '$2a$10$.SY9em0q2OGh8kFEHLnW8u1pAWJc1WaOneCEL8XapLkTCbgD94Q/.', '0', '0', '', NULL, 'admin', '2024-08-18 12:15:56', '', NULL, NULL);

-- addition data
INSERT INTO `erp_goods_spec` VALUES (394, 27, '', 'HN0230127', 308, '片剂', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 403, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (395, 27, '', 'HN0230128', 309, '胶囊', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 404, '28', 0, '', NULL, 55.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (396, 27, '', 'HN0230129', 310, '口服液', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 405, '29', 0, '', NULL, 75.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (397, 27, '', 'HN0230130', 311, '注射剂', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 406, '30', 0, '', NULL, 150.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (398, 27, '', 'HN0230131', 312, '软膏', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 407, '31', 0, '', NULL, 85.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);