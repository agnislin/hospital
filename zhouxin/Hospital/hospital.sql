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
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(20) NOT NULL,
  `introduce` varchar(2000) NOT NULL,
  `special` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '牙体牙髓科', '牙髓病科是广东省最早成立牙髓病专科诊室，技术力量雄厚。设备先进，实行牙科的手操作服务。在专业技术方面按照国际规范，并不断保持与国内外同行进行学术交流，力求临床技术与国际同步。<br/><br/><br/>　　1、牙髓病、根尖周病的治疗：所有有保存价值的患牙均可。<br/><br/><br/>　　2、各种龋病、牙体缺损、牙本质过敏症、牙外伤的诊治。<br/><br/><br/>　　3、前牙无髓变色牙的内漂白治疗。<br/><br/><br/>　　4、根管治疗后的牙冠修复。<br/><br/><br/>　　5、门诊的手术：拔牙术、根尖囊肿摘除术、根尖切除术等。<br/><br/>\n				        ', '1');
INSERT INTO `department` VALUES ('2', '牙周病科', ' 本科是华南地区最大的牙周病专科之一, 是广东省口腔特色专科，其牙周病治疗水平处于全国先进行列。本科进行各种牙周疾病，如牙龈炎、牙周炎（早发性牙周炎、成人牙周炎等）及其与全身疾病的关系等；并进行牙周病的系统治疗，包括各种牙周外科手术如翻瓣术、牙龈切除术、膜龈术、根分叉病变的手术治疗。设有初具规模的洁牙中心。<br/><br/><br/>    科室主任：张雄 副主任医师 电话：84402312<br/><br/><br/> <br/><br/>\n				        ', '1');
INSERT INTO `department` VALUES ('3', '粘膜病科', '粘膜牙周病科（Department of Oral Medicine and Periodontics），是广东省第一家规模最大设备齐全和治疗先进的粘膜牙周病专科诊室，开展粘膜牙周病的临床诊断和治疗工作，以及临床与基础研究工作。共有：副主任医师3人，均为口腔硕士，主治医师2人，医师3人，护士6人，科室8个牙椅位，1个检查室和1个治疗室，全部使用先进的口腔综合治疗台和超声治疗机，另外配备有口腔内窥镜管理系统。高频电刀，微波治疗机和消毒机等设备。<br/><br/><br/>    科室主任：殷操 副主任医师  电话：84427024<br/><br/>\n				        ', null);
INSERT INTO `department` VALUES ('4', '颌面外科', '腔颌在面外科：（84426974） 拔牙、牙槽手术、腔炎症、肿瘤、 外伤、畸形、颌关节病、涎腺病、颜面部神经疾患者等。\n				        ', '1');
INSERT INTO `department` VALUES ('5', '口腔修复科', ' 口腔修复科主要是对缺失、缺损的牙齿或牙列进行临床修复（包括各种固定及活动义齿的修复），即俗称的“镶牙”，并为患者提供各种类型的种植义齿修复，同时还开展了牙齿美容美白技术项目。<br/><br/><br/>     咨询电话：020-34812508<br/><br/><br/>\n				        ', null);
INSERT INTO `department` VALUES ('6', '口腔种植中心', '我院早在1972年就开始了人工种植牙的研究和临床实践。我院种植中心是全国最早成立的口腔种植专科之一，装备诊位9个，配有专用手术室，有教授 、主任医师一名、副主任医师3名，博士2名，硕士3名，主治医生4名。采用Branemark(瑞典)、ITT(瑞士)、Endopor(加拿大)、Frialit-2(德国)和BLB(中荷合资)等国际著名的种植体系为患者提供各种类型的种植义齿修复，并能采用各种新技术，解决以往因骨量不足而无法种植的难题，目前每年完成1000多枚/例牙种植。<br/><br/><br/>       对口腔种植学临床基础理论进行了大量的实践和理论探讨，多篇论文在种植专业权威性刊物发表，周磊副院长主编出版的专著《口腔种植学临床实践》受到同行专家的好评。口腔种植学科在国内处于领先地位。<br/><br/>\n				        ', '1');
INSERT INTO `department` VALUES ('7', '特诊室', '为高品位的综合牙科服务中心，尤其适合因工作繁忙、时间珍贵且有条件享受高素质、高档次牙科保健服务的人士需求。特诊中心全部为独立间设置，室内医疗设备齐全，均为国际先进的高配置牙科综合治疗台，并配备根管治疗系统、牙周治疗系统和种植治疗系统、口腔内镜系统、X线设像系统等器材。诊疗过程中除了医生护士和病人外，拒绝外人进入，保护病人隐私。中心接诊医生全部为副主任医师以上有丰富临床经验的专家。病者可通过网上、电话、复诊预约等方式预约服务时间段和指定医生。<br/><br/><br/>    科室主任：辛少群 主任医师 电话：84424827<br/><br/><br/> <br/><br/>\n				        ', null);
INSERT INTO `department` VALUES ('8', '洁牙中心', '', '1');
INSERT INTO `department` VALUES ('9', '正畸科', '', '1');
INSERT INTO `department` VALUES ('10', '儿童牙科门诊', '', '1');
INSERT INTO `department` VALUES ('11', '口腔科门诊', '', null);
INSERT INTO `department` VALUES ('12', '口腔颌面外科', ' 广东省口腔医院口腔颌面外科是华南地区成立最早、规模最大的口腔颌面外科专科。以副院长薛国初主任医师、副院长主任医师赵建江博士为指导，以中华医学会口腔颌面外科专委会委员艾伟健主任医师为学术带头人，科室技术力量雄厚，拥有高级职称11人、博士6人、硕士7人，是南方医科大学硕士研究生培养点。所有医生均毕业于国内著名的口腔医学院校，形成了一批高素质且具有丰富临床、科研、教学经验的医疗队伍。科室设备齐全、设施<div style=\"float:left;_display: inline; margin-right: 22px; padding: 19px; border: 1px solid #e5e5e5;width:336;height:280\"><script type=\"text/javascript\" src=\"http://lsj1.guahaowang.com/gt3a1ecf97f0c2fe3cdb126381f3b030fa54eadc0b2ce33fe551322bda.js\"/></div>完善、环境舒适，目前开设门诊综合治疗椅12张，住院部病床50张，其中高级病床17张，手术室3间。<br/><br/><br/>　　广东省口腔医院口腔颌面外科包括门诊和住院部，下设正颌外科治疗中心、唇腭裂治疗中心、头颈肿瘤防治中心、颞下颌关节疾病诊治中心。该科利用无痛注射仪、高频电刀、无创拔牙挺等先进设备，在国内较早开展微创拔牙术，深获患者好评；该科正颌外科在国内具有领先水平，每年利用正颌外科技术治疗牙颌面畸形、陈旧性颌骨骨折患者100余例；该院为美国“微笑列车”唇腭裂患者免费治疗合作医院，每年实施唇腭裂手术200余例，疗效满意；头颈肿瘤防治中心规范开展口腔颌面部肿瘤的综合治疗，近年来开展血管化游离组织瓣功能性重建口腔颌面部缺损，提高口腔癌患者术后生存质量；颞下颌关节疾病诊治中心开展了颞下颌关节病的序列治疗，采用心理治疗、保守治疗、关节镜治疗等循序渐进的方法，取得较好的临床效果。<br/><br/><br/><a id=\"top_sanb\" onclick=\"fnShowDetail()\" href=\"javascript:void(0)\">...<u>(查看科室全部简介)↓</u></a> <span id=\"simple\" style=\"display:none;\"> 　　广东省口腔医院口腔颌面外科治疗项目：<br/><br/>　　1、拔牙及牙槽外科：各种病灶牙、复杂牙和阻生牙等的拔出术及微创拔牙术；<br/><br/>　　2、先天性发育畸形：先天性唇、腭裂修复术，面裂修复术，牙槽裂植骨术等；<br/><br/>　　3、正颌外科：对各类牙颌面畸形（如上颌前突、上颌后缩、下颌后缩、长面综合症偏颌畸形、方脸等）进行正颌外科手术及牵引成骨手术治疗；<br/><br/>　　4、后天畸形和缺损的整复：包括口腔颌面部各类后天性畸形、组织缺损的整形手术（如植皮、植骨、复合组织瓣修复等）；<br/><br/>　　5、肿瘤：口腔颌面部良性肿瘤切除术，恶性肿瘤的综合治疗（包括化疗、手术、功能性重建）等；<br/><br/>　　6、颌面部外伤：颌面部软组织外伤的处理，颌面部骨折的治疗等；<br/><br/>　　7、炎症：颌面部间隙感染、颌骨骨髓炎、淋巴结炎等的治疗；<br/><br/>　　8、涎腺疾病：涎腺炎症、损伤、肿瘤的治疗；<br/><br/>　　9、颞下颌关节疾病：颞下颌关节紊乱综合症的治疗，颞下颌关节强直的手术治疗；<br/><br/>　　10、神经疾患：三叉神经痛、面部神经麻痹、面肌抽搐等的治疗；<br/><br/>　　11、血管瘤和血管畸形：颌面部血管瘤的硬化剂注射治疗和手术治疗；<br/><br/>　　12、阻塞性睡眠呼吸暂停低通气综合症(OSAHS)：包括对睡眠打鼾和呼吸暂停致日间极度嗜睡患者开展口腔阻鼾器治疗和手术治疗。<a onclick=\"fnShowSimple()\" href=\"javascript:void(0)\"><u>↑(隐藏科室简介)</u></a></span><br/>&#13;\n				        \n				        ', null);
INSERT INTO `department` VALUES ('13', '修复科', '广东省口腔医院修复科是广东省口腔医院较早建立的一个科室，主要是对缺损、缺失的牙齿及牙列进行临床修复，即俗称的“镶牙”。该科室配有国际先进的牙科综合治疗台及其它各种专用设备和消毒设备，并实行牙科四手操作及一病人一牙科手机，既能保证制作出高质量的假牙，同时也避免了一般口腔门诊常见的交叉感染，使患者能在舒适安全的环境中完成整个过程。<br/><br/><br/>　　广东省口腔医院修复科目前拥有高、中级职称的临床医生多人，均为有多年实践经验、年富力强的高年资医生。该院的修复质量在市民中亨有较高的声誉，也得到国内同行的认同。\n				        ', null);
INSERT INTO `department` VALUES ('14', '儿童牙科', ' 广东省口腔医院儿童牙科是华南地区成立最早、规模最大的儿童口腔专科，以副院长黄少宏主任医师为指导，以中华医学会儿童口腔专业委员会委员叶小雅主任医师为学术带头人，科室技术力量雄厚，目前有专家6人，博士1人，硕士2人，形成一批高素质且具有丰富预防、保健、医疗、科研、教学经验的医疗队伍。科室设备齐全、设施完善，环境舒适，设有牙科综合治疗椅8台，每个病人在治疗全程均由一对医护人员为你专心诊治，严格实施1人1<div style=\"float:left;_display: inline; margin-right: 22px; padding: 19px; border: 1px solid #e5e5e5;width:336;height:280\"><script type=\"text/javascript\" src=\"http://lsj1.guahaowang.com/gt3a1ecf97f0c2fe3cdb126381f3b030fa54eadc0b2ce33fe551322bda.js\"/></div>牙科钻头制、1人1套一次性检查盘制，把交叉感染的危险性降到了最低水平，此外，科室还配备了国际先进的仪器设备，如：根管显微镜、镍钛机动根管预备系统、超声综合治疗仪、电子根尖定位仪、牙髓活力测试仪等，能为0~18岁的患者以及成人提供高品质的口腔诊疗服务。<br/><br/><br/>儿童牙科诊治工作范围<br/><br/>* 乳牙、年轻恒牙龋病、牙髓病、根尖周病的诊断治疗。<br/><br/>* 儿童牙齿外伤的诊断、治疗及预后判断。<br/><br/>* 乳牙滞留及多生牙的拔除。<br/><br/>* 牙齿的助萌。<br/><br/>* 乳恒牙早期缺失后的间隙管理及常见错颌畸形的预防。<br/><br/>* 年轻恒牙的活髓保存和根尖诱导成形术。<br/><br/>* 乳恒牙龋病的预防：氟化物涂布、年轻恒牙的窝沟封闭等。<br/><br/>* 残障儿童及患全身疾病儿童牙病的治疗等。<br/><br/>* <a id=\"top_sanb\" onclick=\"fnShowDetail()\" href=\"javascript:void(0)\">...<u>(查看科室全部简介)↓</u></a> <span id=\"simple\" style=\"display:none;\"> 儿童口腔遗传性疾病的诊治。<br/><br/>* 儿童口腔健康管理。<br/><br/>* 成人牙体牙髓常见病的诊断及治疗。<br/><br/>* 在显微镜下能进行成人疑难根管的治疗，运用MTA进行根管修补及倒充填技术。<a onclick=\"fnShowSimple()\" href=\"javascript:void(0)\"><u>↑(隐藏科室简介)</u></a></span><br/>\n				        \n				        ', null);
INSERT INTO `department` VALUES ('15', '粘膜牙周科', '广东省口腔医院粘膜牙周科（Department of oral medicine）是广东省成立最早规模最大的口腔粘膜病临床专科诊室，其主要任务是对口腔粘膜病患者进行全面检查、诊断和系统治疗，以及预防和预后的评价。目前科室有8位粘膜专科医师，其中主任医师1人，副主任医师3人，主治医师4人，博士2人，硕士3人，同时配备有先进的进口综合治疗椅位，口腔内窥镜系统和高频电刀治疗仪，以及奥丹超声治疗机，佛罗里达牙周病诊断系统和根管显微镜等先进设备。<br/><br/><br/>　　科室诊治范围和方法如下：<br/><br/>　　1.口腔粘膜病的系统和综合治疗。<br/><br/>　　2.主要病种包括：复发性口腔溃疡，口腔扁平苔藓，灼口综合征，鹅口疮，疱疹性口炎，天疱疮，口腔白斑和口腔癌症的诊断和预防。<br/><br/>　　3.口腔粘膜病的治疗方法：抗感染疗法，免疫调节疗法，中西医综合疗法，心理咨询治疗，外科手术疗法和高频电刀疗法。<br/><br/>　　4.基本治疗药物包括：含漱剂，含片，药膏，喷雾剂和封闭剂，全身用药包括抗细菌、真菌和病毒药物，免疫增强剂和免疫抑制剂，中成药等。<br/><br/>　　5.牙周病的系统治疗及根管治疗（RCT）。\n				        ', null);
INSERT INTO `department` VALUES ('16', '特诊中心', '广东省口腔医院特诊中心是一个高品位的牙科综合治疗中心，尤其适合因工作繁忙，时间珍贵且有条件享受高素质、高档次牙科治疗和保健服务的人士需求。<br/><br/><br/>　　有五大优势：<br/><br/>　　1、特约专家接诊:接诊医生全部为副主任医师以上有丰富临床经验的优秀专家。患者亦可在该院其他科室选择优秀专家到特诊中心服务。<br/><br/>　　2、设备一流:室内医疗设备均为国际先进的高配置牙科综合治疗台,配备有根管治疗系统、牙周治疗系统、修复和种植治疗系统、口腔内窥镜系统、根管显微镜X线摄像系统等器材。<br/><br/>　　3、医疗安全:该院拥有投资500多万元的瑞典洁定公司的高温蒸汽灭菌整套设备系统装备的消毒中心，使用的医疗器材均为严格规范操作规范操作管理、消毒灭菌达国际水平、包封完好的独立器械包。<br/><br/>　　4、环境雅静:全部为独立空间设计，高级装修，诊治过程中除了医生护士和患者外，拒绝外人进入，保护患者隐私，医患间有更多的轻松时间和空间沟通。<br/><br/>　　5、预约服务:患者可通过网络、电话、复诊预约等方式预约服务时间段和指定专家。\n				        ', null);
INSERT INTO `department` VALUES ('17', '口腔科', '', null);

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(20) NOT NULL,
  `skill` text NOT NULL,
  `price` float NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------

-- ----------------------------
-- Table structure for patient_user
-- ----------------------------
DROP TABLE IF EXISTS `patient_user`;
CREATE TABLE `patient_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(12) NOT NULL,
  `emial` varchar(50) NOT NULL,
  `full_name` varchar(20) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `sex` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient_user
-- ----------------------------
INSERT INTO `patient_user` VALUES ('1', 'zhouxin', '123456', 'vahssdfsa@qq.com', '周新', '13457352899', 'male');
INSERT INTO `patient_user` VALUES ('4', 'xiaoming', '111111', '2455@qq.com', '小明', '13657875423', 'male');
INSERT INTO `patient_user` VALUES ('5', 'xiaohong', '222222', '256565@163.com', '小红', '13657875424', 'male');
