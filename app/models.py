from . import db


# 用户表
class PatientUser(db.Model):
    __tablename__ = 'patient_user'
    id = db.Column(db.Integer, primary_key=True)        
    user_name = db.Column(db.String(20), unique=True)       #用户名
    password = db.Column(db.String(12), nullable=False)     #密码
    emial = db.Column(db.String(50), nullable=False)        #邮箱
    full_name = db.Column(db.String(20), nullable=False)    #真实姓名
    phone = db.Column(db.String(11), nullable=False)        #手机号
    sex = db.Column(db.String(6), nullable=False)           #姓名

    def __init__(self, user_name, password, emial, full_name, phone, sex):
        self.user_name = user_name
        self.password = password
        self.emial = emial
        self.full_name = full_name
        self.phone = phone
        self.sex = sex

    def __repr__(self):
        return '<sName:%r>' % self.user_name


# 科室表
class Department(db.Model):
    __tablename__ = 'department'
    id = db.Column(db.Integer, primary_key=True)
    department = db.Column(db.String(50), nullable=False)   #科室名称
    special = db.Column(db.Boolean)                         #是否为特色科室
    introduce = db.Column(db.String(13), nullable=False)    #科室简介

    doctors = db.relationship('Doctor', backref='department', lazy='dynamic')   #关联医生表
    his_user = db.relationship('HisUser', backref='department', lazy='dynamic')  #关联医户人员用户表

    def __init__(self, department, introduce, special):
        self.department = department
        self.introduce = introduce
        self.special = special

    def __repr__(self):
        return "<Department:%r>" % self.department


# 医生表
class Doctor(db.Model):
    __tablename__ = 'doctor'
    id = db.Column(db.Integer, primary_key=True)        
    name = db.Column(db.String(30), nullable=False)         #姓名
    sex = db.Column(db.String(6), nullable=False)           #性别
    title = db.Column(db.String(20), nullable=False)        #职称
    skill = db.Column(db.Text, nullable=False)              #擅长治疗
    price = db.Column(db.Float(7), nullable=False)          #挂号费用
    department_id = db.Column(db.Integer, db.ForeignKey('department.id'))   #所在科室
    isRegister = db.Column(db.Boolean)            #是否为网上挂号
    brief = db.Column(db.Text, nullable=False)              #个人简介

    timelines = db.relationship('Timeline', backref='doctor', lazy='dynamic')  #关联医生排班  
    his_user = db.relationship('HisUser', backref='doctor', uselist=False)  #关联医户人员用户表

    def __init__(self, name, sex, title, skill, price, department_id, isRegister, brief):
        self.name = name
        self.sex = sex
        self.title = title
        self.skill = skill
        self.price = price
        self.department_id = department_id        
        self.isRegister = isRegister
        self.brief = brief

    def __repr__(self):
        return "<Doctor:%r>" % self.name    

# 医生排班表
class Timeline(db.Model):
    __tablename__ = 'timeline'
    id = db.Column(db.Integer, primary_key=True)
    doctor_id = db.Column(db.Integer, db.ForeignKey('doctor.id'))   #关联医生id
    date = db.Column(db.Date, nullable=False)   #日期
    am_status = db.Column(db.Boolean, default=0)       #上午是否允许预约
    am_quota = db.Column(db.Integer, default=10)        #上午允许预约人数
    am_sources = db.Column(db.Integer, default=10)       #上午剩余号源
    pm_status = db.Column(db.Boolean, default=0)       #下午是否允许预约
    pm_quota = db.Column(db.Integer, default=10)        #下午允许预约人数
    pm_sources = db.Column(db.Integer, default=10)       #上午剩余号源    

    def __init__(self, doctor_id, date, am_status=0, am_quota=10, am_sources=10, \
                pm_status=0, pm_quota=10, pm_sources=10):
        self.doctor_id = doctor_id
        self.date = date
        self.am_status = am_status
        self.am_quota = am_quota
        self.am_sources = am_sources
        self.pm_status = pm_status
        self.pm_quota = pm_quota
        self.pm_sources = pm_sources

    def __repr__(self):
        return "<date:%r doctor:%r>" % (self.date, self.doctor_id)

# 医护人员账号表
class HisUser(db.Model):
    __tablename__ = 'his_user'
    id = db.Column(db.Integer, primary_key=True)
    user_name = db.Column(db.String(20), unique=True)       #用户名
    password = db.Column(db.String(12), nullable=False)     #密码 
    full_name = db.Column(db.String(20), nullable=False)    #真实姓名
    doctor_id = db.Column(db.Integer, db.ForeignKey('doctor.id'))   #关联医生id
    department_id = db.Column(db.Integer, db.ForeignKey('department.id')) #关联科室id

    def __init__(self, user_name, password, full_name, doctor_id, department_id):
        self.user_name = user_name
        self.password = password
        self.full_name = full_name
        self.doctor_id = doctor_id
        self.department_id = department_id

    def __repr__(self):
        return '<sName:%r>' % self.user_name


#用户咨询表
class Consult(db.Model):
    __tablename__ = 'consult'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('patient_user.id'))   #关联用户id
    theme = db.Column(db.String(50), nullable=False)                #咨询主题
    consult_time = db.Column(db.DateTime, nullable=False)           #咨询时间
    content = db.Column(db.Text, nullable=False)                    #咨询内容
    reply = db.Column(db.Text)                      #回复内容
    doctor_id = db.Column(db.Integer, db.ForeignKey('doctor.id'))   #关联医生id
    status = db.Column(db.Boolean)                                  #回复状态

    def __init__(self, user_id, theme, consult_time, content, reply, doctor_id, status):
        self.user_id = user_id
        self.consult_time = consult_time
        self.theme = theme
        self.content = content
        self.reply = reply
        self.doctor_id = doctor_id
        self.status = status

    def __repr__(self):
        return "<user:%r theme:%r>" % (self.user_id, self.theme)

    