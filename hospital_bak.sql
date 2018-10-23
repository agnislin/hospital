/*
Navicat MySQL Data Transfer

Source Server         : python
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : hospital

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2018-10-19 09:09:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
-- DROP TABLE IF EXISTS `department`;
-- CREATE TABLE `department` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `department` varchar(20) NOT NULL,
--   `introduce` varchar(2000) NOT NULL,
--   `special` int(11) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
-- INSERT INTO `department` VALUES (1, '牙体牙髓科', 1, 'department_01');
-- INSERT INTO `department` VALUES (2, '牙周病科', 1, 'department_02');
-- INSERT INTO `department` VALUES (3, '粘膜病科', 0, 'department_03');
-- INSERT INTO `department` VALUES (4, '颌面外科', 0, 'department_04');
-- INSERT INTO `department` VALUES (5, '口腔修复科', 0, 'department_05');
-- INSERT INTO `department` VALUES (6, '口腔种植中心', 1, 'department_06');
-- INSERT INTO `department` VALUES (7, '特诊室', 0, 'department_07');
-- INSERT INTO `department` VALUES (8, '洁牙中心', 1, 'department_08');
-- INSERT INTO `department` VALUES (9, '正畸科', 1, 'department_09');
-- INSERT INTO `department` VALUES (10, '儿童牙科门诊', 1, 'department_10');
-- INSERT INTO `department` VALUES (11, '口腔科门诊', 0, 'department_11');
-- INSERT INTO `department` VALUES (12, '口腔颌面外科', 1, 'department_12');
-- INSERT INTO `department` VALUES (13, '修复科', 0, 'department_13');
-- INSERT INTO `department` VALUES (14, '儿童牙科', 0, 'department_14');
-- INSERT INTO `department` VALUES (15, '粘膜牙周科', 0, 'department_15');
-- INSERT INTO `department` VALUES (16, '特诊中心', 0, 'department_16');
-- INSERT INTO `department` VALUES (17, '口腔科', 0, 'department_17');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
-- DROP TABLE IF EXISTS `doctor`;
-- CREATE TABLE `doctor` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `name` varchar(30) NOT NULL,
--   `title` varchar(20) NOT NULL,
--   `skill` text NOT NULL,
--   `price` float NOT NULL,
--   `department_id` int(11) DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `department_id` (`department_id`),
--   CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------
-- INSERT INTO `doctor` VALUES (1, '耿华欧', '男', '主任医师', '牙周病的系统治疗以及牙体牙髓病的诊治。', 0.0, 1, 1, '耿华欧，男，副主任医师，口腔内科牙周病专家。武汉大学口腔医学院口腔内科学牙周专业博士，广东省牙周病学专业委员会委员。主要从事口腔内科的诊断治疗和研究工作，对牙周疾患的诊治有较为丰富的经验。');
-- INSERT INTO `doctor` VALUES (2, '曾仕进', '男', '主治医师', '口腔内科疾病的诊治。', 0.0, 1, 1, '曾仕进，男，主治医师，牙体牙髓二室，从事口腔临床门诊三十几年，熟练掌握口腔科常见病的诊治工作，擅长于口腔内科疾病的诊治。');
-- INSERT INTO `doctor` VALUES (3, '孙书昱', '女', '主任医师', '擅长于牙体牙髓病的诊断、龋齿、牙髓炎、根尖周病的治疗以及前牙美容修复。', 0.0, 1, 1, '孙书昱，女，主任医师，牙体牙髓一室，2003年硕士研究生毕业，研究方向为牙体牙髓病学，擅长于牙体牙髓病的诊断、龋齿、牙髓炎、根尖周病的治疗以及前牙美容修复。');
-- INSERT INTO `doctor` VALUES (4, '张梅', '女', '住院医师', '牙体牙髓病的诊治。', 0.0, 1, 1, '张梅，女，副主任医师。 1990年毕业于江西医学院口腔医学系本科，1996年毕业于武汉大学口腔医学院，获硕士学位，2000年6月～2001年3月公派赴日本冈山大学齿学部研修。专业特长：牙体牙髓病的诊治。');
-- INSERT INTO `doctor` VALUES (5, '文军', '男', '主治医师', '龋病，牙髓炎，根尖周炎。', 0.0, 1, 1, '文军，男，医学博士，主治医师。');
-- INSERT INTO `doctor` VALUES (6, '张雄', '男', '主任医师', '牙周病的系统治疗以及牙体牙髓病的诊治。', 0.0, 2, 1, '张雄，男，牙周病专家，对牙周病的系统治疗以及牙体牙髓病的诊治有丰富的临床经验。');
-- INSERT INTO `doctor` VALUES (7, '章锦才', '男', '主任医师', '牙周病学专家，对牙周病的系统治疗以及牙体牙髓病的诊治有丰富的临床经验。', 0.0, 2, 1, '章锦才，男，牙周病专家，博士，对牙周病的系统治疗以及牙体牙髓病的诊治有丰富的临床经验。');
-- INSERT INTO `doctor` VALUES (8, '江丽', '女', '副主任医师', '对牙周病的诊断、牙周病的系统治疗和牙体牙髓病的诊治具有丰富的经验。', 0.0, 2, 1, '江丽，女，副主任医师，毕业于中山医科大学口腔医学院，获口腔医学学士学位。从事口腔临床工作十余年，对牙周病的诊断、牙周病的系统治疗和牙体牙髓病的诊治具有丰富的临床经验咱。现在正在攻读南方医科大学在职硕士研究生。');
-- INSERT INTO `doctor` VALUES (9, '谢玉江', '男', '副主任医师', '各种牙周病及常见牙体牙髓病的治疗。', 0.0, 2, 1, '谢玉江，男，副主任医师，口腔内科牙周病专家。于1975年12月份毕业于广东省口腔医士班。三十年在本院口腔内科、口腔外科、高干诊室工作。曾经在北大口腔和华西口腔医院进修学习，在口腔内科各类疾病以及牙周病的诊断、治疗（包括手术治疗）等方面具有丰富的经验。');
-- INSERT INTO `doctor` VALUES (10, '张宇婕', '女', '主治医师', '牙周病及各种常见牙体牙髓病的诊治。', 0.0, 2, 1, '张宇婕，女，主治医师，2004年毕业于暨南大学医学院口腔医学系，获学士学位，擅长于牙周病及各种常见牙体牙髓病的诊治。现于南方医科大学攻读在职研究生。');
-- INSERT INTO `doctor` VALUES (11, '殷操', '男', '主任医师', '口腔黏膜病的临床研究，口腔粘膜病、牙周病、牙体牙髓病的专科诊断及系统治疗。', 0.0, 3, 1, '殷操，男，口腔内科专家，专长口腔粘膜病的临床研究，对牙体牙髓病，牙周病的诊治有较丰富的经验。');
-- INSERT INTO `doctor` VALUES (12, '李丰舟', '男', '副主任医师', '牙周病的系统治疗，深得患者信任。', 0.0, 3, 1, '李丰舟，男，副主任医师，1997年毕业于华西医科大学口腔系，长期从事口腔内科临床工作，临床经验丰富、操作技术娴熟，尤其擅长牙周病的系统治疗，深得患者信任。');
-- INSERT INTO `doctor` VALUES (13, '王炫', '女', '主治医师', '诊治临床上粘、牙周的常见病和多发病。', 0.0, 3, 1, '王炫，女，主治医师，毕业后于广东省口腔医院牙周粘膜科工作至今，能熟练诊治临床上粘、牙周的常见病和多发病。');
-- INSERT INTO `doctor` VALUES (14, '乔鸣芳', '女', '副主任医师', '口腔内科膜病。', 0.0, 3, 1, '乔鸣芳，女，副主任医师，博士，2000年毕业于华西医科大学口腔医学院口腔医学博士，口腔微生物学博士，IADR ASM AACR会员。多年从事牙周病诊断治疗工作，对牙周病的诊治有较为丰富的临床经验。');
-- INSERT INTO `doctor` VALUES (15, '蒋李懿', '女', '副主任医师', '口腔粘膜病和牙周病的系统治疗。', 0.0, 3, 1, '蒋李懿，女，副主任医师，口腔内科粘膜病专家。毕业于武汉大学口腔医学院，获口腔医学临床硕士学位，研究方向：口腔粘膜病。多年从事口腔粘膜病和牙周病的系统治疗，有效为丰富的临床经验。');
-- INSERT INTO `doctor` VALUES (16, '薛国初', '男', '副主任医师', '颌面部肿瘤综合治疗、腮腺肿瘤治疗、唇腭裂序列治疗，牙槽外科、颌面部各类骨折治疗。', 0.0, 4, 1, '薛国初，男，口腔外科专家，对颌面畸形，口腔肿瘤，颌面创伤，牙槽外科及美容外科有较丰富的临床经验。');
-- INSERT INTO `doctor` VALUES (17, '艾伟健', '男', '副主任医师', '颌面部肿瘤综合治疗、腮腺肿瘤治疗、唇腭裂序列治疗，牙槽外科、颌面部各类骨折治疗。', 0.0, 4, 1, '艾伟健，男，口腔颌面外科专家，对颌面畸形，口腔创伤，牙槽外科及口腔肿瘤的诊治有较丰富的经验。');
-- INSERT INTO `doctor` VALUES (18, '周磊', '男', '主任医师', '对颌面畸形，口腔创伤，牙槽外科及口腔肿瘤的诊治。', 0.0, 4, 1, '周磊，主任医师。对颌面畸形，口腔创伤，牙槽外科及口腔肿瘤的诊治。');
-- INSERT INTO `doctor` VALUES (19, '徐平平', '男', '主任医师', '颌面部肿瘤综合治疗、腮腺肿瘤治疗、唇腭裂序列治疗，牙槽外科、颌面部各类骨折治疗。', 0.0, 4, 1, '徐平平，男，主任医师，颌面部肿瘤综合治疗、腮腺肿瘤治疗、唇腭裂序列治疗，牙槽外科、颌面部各类骨折治疗。');
-- INSERT INTO `doctor` VALUES (20, '赵建江', '男', '主任医师', '颌面部肿瘤综合治疗、腮腺肿瘤治疗、唇腭裂序列治疗，牙槽外科、颌面部各类骨折治疗。', 0.0, 4, 1, '赵建江，男，主任医师，博士，口腔颌面外科专家，对口腔颌面部肿瘤、感染、齿槽外科、涎腺疾病、颞下颌关节疾患、口腔颌面外伤及骨折等的诊治，唇腭裂修复术等有丰富的经验。');
-- INSERT INTO `doctor` VALUES (21, '沈春英', '女', '主治医师', '牙科修复治疗。', 0.0, 5, 1, '沈春英，主治医师，牙科修复治疗。');
-- INSERT INTO `doctor` VALUES (22, '徐广荣', '男', '主治医师', '口腔修复。', 0.0, 5, 1, '徐广荣，主治医师，口腔修复科。');
-- INSERT INTO `doctor` VALUES (23, '陈志明', '男', '主治医师', '口腔内科疾病的治疗。', 0.0, 5, 1, '陈志明，男，主治医师，口腔内科疾病的治疗。');
-- INSERT INTO `doctor` VALUES (24, '王险峰', '女', '副主任医师', '嵌体，全冠，（烧瓷、全瓷）固定桥，全口义牙，活动义牙修复。', 0.0, 5, 1, '王险峰，女，副主任医师，从事临床工作十五年，擅长嵌体，全冠，（烤瓷、全瓷）固定桥，全口义齿，活动义齿修复。');
-- INSERT INTO `doctor` VALUES (25, '龙红月', '女', '主任医师', '口腔人工牙种植修复、美容修复和颞下颌关节病非外科治疗。', 0.0, 5, 1, '龙红月，女，主任医师，口腔修复专家。1989年毕业于白求恩医科大学口腔专业，具有20多年口腔专科临床经验，对口腔修复的临床和理论有一定研究。临床方面：擅长全瓷美容修复；金属烤瓷牙，嵌体等修复；各种精密附着体和套筒冠修复；局部可摘义齿修复。中华口腔医学会会员。在全国及省级专业杂志发表多篇专业论文，承担广东省卫生厅广东省科技厅课题各一项。');
-- INSERT INTO `doctor` VALUES (26, '余燕玲', '女', '主任医师', '口腔美容科，口腔内科和口腔修复科诊治。', 0.0, 6, 1, '余燕玲，女，主任医师，毕业于广东省卫生学校，临床工作35年，主要从事口腔美容科，口腔内科和口腔修复科诊治工作。');
-- INSERT INTO `doctor` VALUES (27, '杨晓喻', '女', '主任医师', '种植、精密附着体、固定可摘联合修复等复杂修复设计与操作。', 0.0, 6, 1, '杨晓喻，女，主任医师，博士，硕士生导师，长期从事牙体、牙列缺损缺失修复工作。擅长于种植、精密附着体、固定可摘联合修复等复杂修复设计与操作。');
-- INSERT INTO `doctor` VALUES (28, '张雪洋', '女', '主任医师', '缺失牙的人工种植牙修复（种牙）；活动托牙，固定矫牙，全口义齿，烤瓷牙修复（镶牙）。', 0.0, 6, 1, '张雪洋，女，主任医师，博士，口腔种植修复专家。先后就读于华西医科大学及首都医科大学，曾赴德国参加口腔种植培训，长期从事临床工作，有丰富的临床经验。专长：缺失牙的人工种植牙修复（种牙）；活动托牙，固定矫牙，全口义齿，烤瓷牙修复（镶牙）。');
-- INSERT INTO `doctor` VALUES (29, '王春先', '女', '副主任医师', '口腔种植修复及重度牙周病缺失牙的种植、修复治疗。', 0.0, 6, 1, '王春先，女，副主任医师，口腔种植修复专家。长期从事口腔种植、修复等临床工作有丰富的临床工作经验。业务专长为口腔种植修复及重度牙周病缺失牙的种植、修复治疗');
-- INSERT INTO `doctor` VALUES (30, '吴王喜', '男', '主任医师', '统义齿修复及种植义齿修复。', 0.0, 6, 1, '吴王喜，男，住院医师，硕士，从事传统义齿修复及种植义齿修复，致力于种植修复领域新技术新材料的研究应用。');
-- INSERT INTO `doctor` VALUES (31, '庄最新', '男', '副主任医师', '活动托牙，固定桥牙，全口义齿，金属烤瓷牙等。', 0.0, 7, 1, '庄最新，男，主任医师，硕士研究生导师，口腔修复专家。对口腔各类修复，如活动托牙，固定桥牙，全口义齿，金属烤瓷牙等有较丰富的临床经验。《广东牙病防治》杂志主编，卫生部全国牙病防治指导组成员、广东省牙病防治指导组副组长，中华口腔医学会预防专业委员会常委，中华医院管理学会委员，广东口腔医学会副会长，广东省“五个一科技兴医工程”学术与技术带头人，国务院特殊津贴专家。 美国科学促进协会(AAAS)和世界牙科联盟(FDI)会员。');
-- INSERT INTO `doctor` VALUES (32, '杨勤', '女', '副主任医师', '运用根管显微技术诊治牙髓科的临床疑难病症。', 0.0, 7, 1, '杨勤，女，副主任医师。华西医科大学硕士研究生毕业后从事牙体牙髓专业临床工作至今，具有丰富的牙体牙髓病临床经验，熟练运用根管显微技术诊治牙髓科的临床疑难病症。');
-- INSERT INTO `doctor` VALUES (33, '黄元瑾', '女', '主任医师', '运用根管显微技术诊治牙髓科的临床疑难病症。', 0.0, 7, 1, '黄元瑾，女，主任医师，运用根管显微技术诊治牙髓科的临床疑难病症。');
-- INSERT INTO `doctor` VALUES (34, '张颂农', '男', '主任医师', '活动托牙，固定桥牙，全口义齿，金属烤瓷牙等。', 0.0, 7, 1, '张颂农，男，主任医师。');
-- INSERT INTO `doctor` VALUES (35, '辛少群', '男', '主任医师', '牙体牙髓的诊治有丰富的经验。', 0.0, 7, 1, '辛少群，男，主任医师。有牙体牙髓的诊治有丰富的经验。');
-- INSERT INTO `doctor` VALUES (36, '刘明', '男', '主任医师', '擅长诊治慢性牙龈炎，由菌斑、牙石、创伤性咬合、食物嵌塞等引发的牙周炎，预防性洁治，口腔其他治疗前准备等。', 0.0, 8, 1, '刘明，男，主任医师。');
-- INSERT INTO `doctor` VALUES (37, '刘楚峰', '女', '主任医师', '对青少年错合畸形的矫治。', 0.0, 9, 1, '刘楚峰，女，主治医师，硕士，正畸二室，毕业于华西医科大学口腔正畸专业，长期从事口腔正畸专业的临床及科研工作，尤其擅长对青少年错合畸形的矫治。');
-- INSERT INTO `doctor` VALUES (38, '肖辉', '女', '副主任医师', '擅长青少年错合畸形的矫治', 0.0, 9, 1, '肖珲，女，副主任医师，正畸二室，近十年临床工作经验，擅长青少年错合畸形的矫治，对国内外先进矫治技术在临床中的应用深有体会。');
-- INSERT INTO `doctor` VALUES (39, '胡飞', '男', '主任医师', '儿童、青少年及成年人各类牙颌畸形的临床矫治。', 0.0, 9, 1, '胡飞，男，副主任医师，口腔正畸专家。中华口腔医学会正畸专科会员，世界正畸联盟会员。从事正畸临床工作10余年，有丰富的临床经验。专长：儿童、青少年及成年人各类牙颌畸形的临床矫治。');
-- INSERT INTO `doctor` VALUES (40, '区运运', '女', '副主任医师', '儿童、青少年及成年人各类牙颌畸形的临床矫治。', 0.0, 9, 1, '区运运，女，主任医师。');
-- INSERT INTO `doctor` VALUES (41, '段培佳', '女', '主任医师', '儿童、青少年及成年人各类牙颌畸形的临床矫治。', 0.0, 9, 1, '段培佳，女，医学博士，主任医师。');
-- INSERT INTO `doctor` VALUES (42, '钱虹', '女', '主任医师', '牙体牙髓病和儿童牙病的诊治。', 0.0, 10, 1, '钱虹，女，主任医师。');
-- INSERT INTO `doctor` VALUES (44, '李家健', '男', '主治医师', '牙体牙髓病和儿童牙病的诊治。', 0.0, 10, 1, '李家健，男，主治医师。');
-- INSERT INTO `doctor` VALUES (45, '叶小雅', '女', '主任医师', '牙体牙髓病和儿童牙病的诊治。', 0.0, 10, 1, '叶小雅，女，主任医师。');
-- INSERT INTO `doctor` VALUES (46, '许竞', '男', '主治医师', '口腔美容修复及各修复体的设计与制作。', 0.0, 11, 1, '许竞，男，医师，口腔美容修复及各修复体的设计与制作。');
-- INSERT INTO `doctor` VALUES (47, '黄友俊', '男', '副主任医师', '口腔科常见病、多发病诊治以及口腔内科、外科和牙齿美容、正畸等治疗。', 0.0, 11, 1, '黄友俊，男，副主任医师，口腔科常见病、多发病诊治以及口腔内科、外科和牙齿美容、正畸等治疗。');
-- INSERT INTO `doctor` VALUES (48, '冯志金', '男', '副主任医师', '口腔内科疾病的治疗。', 0.0, 11, 1, '冯志金，男，副主任医师，口腔内科疾病的治疗。');
-- INSERT INTO `doctor` VALUES (49, '郑骏发', '男', '主任医师', '口腔、颌面及颈部肿瘤的诊断、治疗，颌面创伤的治疗。', 0.0, 11, 1, '郑骏发，男，主任医师，口腔、颌面及颈部肿瘤的诊断、治疗，颌面创伤的治疗。');
-- INSERT INTO `doctor` VALUES (50, '栾修文', '男', '主任医师', '擅长于口腔颌面部肿瘤综合治疗、唇腭裂序列治疗、颌面创伤、炎症的诊治及微创拔牙等。', 0.0, 12, 1, '栾修文，男，主任医师，口腔颌面外科专家。');
-- INSERT INTO `doctor` VALUES (51, '王晶', '男', '主任医师', '擅长于口腔颌面部肿瘤综合治疗、唇腭裂序列治疗、颌面创伤、炎症的诊治及微创拔牙等。', 0.0, 12, 1, '王晶，男，主任医师，口腔颌面外科专家。');
-- INSERT INTO `doctor` VALUES (52, '王勤', '男', '主任医师', '擅长于口腔颌面部肿瘤综合治疗、唇腭裂序列治疗、颌面创伤、炎症的诊治及微创拔牙等。', 0.0, 12, 1, '王勤，男，主任医师，口腔颌面外科专家。');
-- INSERT INTO `doctor` VALUES (53, '任松', '男', '主任医师', '擅长于口腔颌面部肿瘤综合治疗、唇腭裂序列治疗、颌面创伤、炎症的诊治及微创拔牙等。', 0.0, 12, 1, '任松，男，主任医师，口腔颌面外科专家。');
-- INSERT INTO `doctor` VALUES (54, '林祥长', '男', '副主任医师', '烤瓷牙、全瓷牙、活动义齿、全口义齿等各种义齿修复', 0.0, 13, 1, '林祥长，男，副主任医师，口腔修复专家。');
-- INSERT INTO `doctor` VALUES (55, '石勇', '男', '主任医师', '擅长前牙美容修复，颌面缺损赝复修复，残根残冠的保存治疗及固定--活动义齿联合修复。', 0.0, 13, 1, '石勇，男，副主任医师，2009年毕业于第四军医大学口腔医学院，获博士学位。');
-- INSERT INTO `doctor` VALUES (56, '石军', '男', '主任医师', '烤瓷牙、全瓷牙、活动义齿、全口义齿等各种义齿修复', 0.0, 13, 1, '石军，男，主任医师，口腔修复专家。');
-- INSERT INTO `doctor` VALUES (57, '文在否', '男', '主任医师', '烤瓷牙、全瓷牙、活动义齿、全口义齿等各种义齿修复', 0.0, 13, 1, '文在否，男，主任医师，口腔修复专家。');
-- INSERT INTO `doctor` VALUES (58, '陆雪琪', '女', '主任医师', '擅长牙体牙髓病，儿童牙病的诊断和治疗。', 0.0, 14, 1, '陆雪琪，女，主任医师，擅长牙体牙髓病，儿童牙病的诊断和治疗。');
-- INSERT INTO `doctor` VALUES (59, '王洁', '女', '副主任医师', '擅长牙体牙髓病，儿童牙病的诊断和治疗。', 0.0, 14, 1, '黄洁，女，副主任医师，毕业于中山大学口腔医学院大专班，擅长牙体牙髓病，儿童牙病的诊断和治疗。');
-- INSERT INTO `doctor` VALUES (60, '许曼波', '男', '副主任医师', '擅长牙体牙髓病，儿童牙病的诊断和治疗。', 0.0, 14, 1, '许曼波，男，副主任医师，毕业于中山大学，从事口腔医学工作二十余年，任广东省医师协会义诊团专家，熟悉口腔疾病的诊治，擅长补牙、前牙美容、根管治疗、根尖周手术、儿童牙病防治、无痛微创拔牙等。');
-- INSERT INTO `doctor` VALUES (61, '赖明星', '男', '主任医师', '擅长牙体牙髓病，儿童牙病的诊断和治疗。', 0.0, 14, 1, '赖明星，男，医学博士，主任医师。');
-- INSERT INTO `doctor` VALUES (62, '陈华', '女', '主治医师', '擅长牙周病的综合治疗、补牙、热牙胶根管治疗术、显微根管治疗、深得患者信任。', 0.0, 15, 1, '陈华，女，主治医师，1989年毕业于暨南大学医学院口腔医学专业，本科，长期从事口腔内科专业临床工作。');
-- INSERT INTO `doctor` VALUES (63, '资云玲', '女', '主任医师', '擅长牙周病的综合治疗。', 0.0, 15, 1, '资云玲，女，主任医师。');
-- INSERT INTO `doctor` VALUES (64, '雪莱', '男', '主任医师', '擅长牙周病的综合治疗。', 0.0, 15, 1, '雪莱，男，医学博士，主任医师。');
-- INSERT INTO `doctor` VALUES (65, '张杨', '女', '主任医师', '牙周病、牙体牙髓病的诊断及系统治疗。', 0.0, 16, 1, '张杨，女，主任医师。');
-- INSERT INTO `doctor` VALUES (66, '丁玲', '女', '副主任医师', '擅长美学修复，牙体缺损的微创修复，残根/残冠的保存修复，各类牙列缺损、牙列缺失的活动、固定义齿修复及精密附着体、套筒冠义齿修复。', 0.0, 16, 1, '丁玲，女，医学博士，副主任医师。');
-- INSERT INTO `doctor` VALUES (67, '关银屏', '女', '副主任医师', '擅长美学修复，牙体缺损的微创修复，残根/残冠的保存修复，各类牙列缺损、牙列缺失的活动、固定义齿修复及精密附着体、套筒冠义齿修复。', 0.0, 16, 1, '关银屏，女，医学博士，副主任医师。');
-- INSERT INTO `doctor` VALUES (68, '朱军', '男', '主任医师', '牙周病、牙体牙髓病的诊断及系统治疗。', 0.0, 16, 1, '朱军，男，医学博士，主任医师。');
-- INSERT INTO `doctor` VALUES (69, '李明', '男', '副主任医师', '对口腔各类义齿修复。', 0.0, 17, 1, '李明，男，医学博士，副主任医师。');
-- INSERT INTO `doctor` VALUES (70, '冯唐', '男', '主任医师', '对口腔各类义齿修复。', 0.0, 17, 1, '冯唐，男，医学博士，主任医师，擅长对口腔各类义齿修复。');
-- INSERT INTO `doctor` VALUES (71, '李广', '男', '副主任医师', '对口腔各类义齿修复。', 0.0, 17, 1, '李广，男，，副主任医师。');
-- INSERT INTO `doctor` VALUES (72, '张三林', '男', '主任医师', '对口腔各类义齿修复。', 0.0, 17, 1, '张三林，男，擅长对口腔各类义齿修复，主任医师。');
-- INSERT INTO `doctor` VALUES (73, '钱枫', '男', '副主任医师', '对口腔各类义齿修复。', 0.0, 17, 1, '钱枫，男，副主任医师。');
-- INSERT INTO `doctor` VALUES (74, '井澜', '女', '主任医师', '对口腔各类义齿修复。', 0.0, 17, 1, '井澜，女，医学博士，擅长对口腔各类义齿修复，主任医师。');


-- id          
-- doctor_id       医生id    
-- date            日期  
-- am_status       上午是否允许预约    
-- am_quota        上午允许预约人数    
-- pm_status       下午是否允许预约    
-- pm_quota        下午允许预约人数    

INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (1, '2018-10-23', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (1, '2018-10-24', 0, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (1, '2018-10-25', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (1, '2018-10-26', 0, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (1, '2018-10-27', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (1, '2018-10-28', 1, 10, 0, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (1, '2018-10-29', 1, 10, 1, 10);

INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (2, '2018-10-23', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (2, '2018-10-24', 1, 10, 0, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (2, '2018-10-25', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (2, '2018-10-26', 0, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (2, '2018-10-27', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (2, '2018-10-28', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (2, '2018-10-29', 1, 10, 1, 10);

INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (3, '2018-10-23', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (3, '2018-10-24', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (3, '2018-10-25', 0, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (3, '2018-10-26', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (3, '2018-10-27', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (3, '2018-10-28', 1, 10, 0, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (3, '2018-10-29', 1, 10, 1, 10);

INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (4, '2018-10-23', 0, 10, 0, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (4, '2018-10-24', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (4, '2018-10-25', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (4, '2018-10-26', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (4, '2018-10-27', 0, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (4, '2018-10-28', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (4, '2018-10-29', 1, 10, 1, 10);

INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (5, '2018-10-23', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (5, '2018-10-24', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (5, '2018-10-25', 0, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (5, '2018-10-26', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (5, '2018-10-27', 1, 10, 0, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (5, '2018-10-28', 1, 10, 1, 10);
INSERT INTO `timeline`(doctor_id, date, am_status, am_quota, pm_status, pm_quota) VALUES (5, '2018-10-29', 1, 10, 1, 10);



-- ----------------------------
-- Table structure for patient_user
-- ----------------------------
-- DROP TABLE IF EXISTS `patient_user`;
-- CREATE TABLE `patient_user` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `user_name` varchar(20) DEFAULT NULL,
--   `password` varchar(12) NOT NULL,
--   `emial` varchar(50) NOT NULL,
--   `full_name` varchar(20) NOT NULL,
--   `phone` varchar(11) NOT NULL,
--   `sex` varchar(6) NOT NULL,
--   PRIMARY KEY (`id`),
--   UNIQUE KEY `user_name` (`user_name`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient_user
-- ----------------------------
-- INSERT INTO `patient_user` VALUES ('1', 'zhouxin', '123456', 'vahssdfsa@qq.com', '周新', '13457352899', 'male');
-- INSERT INTO `patient_user` VALUES ('4', 'xiaoming', '111111', '2455@qq.com', '小明', '13657875423', 'male');
-- INSERT INTO `patient_user` VALUES ('5', 'xiaohong', '222222', '256565@163.com', '小红', '13657875424', 'male');


