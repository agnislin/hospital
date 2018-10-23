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
    introduce = db.Column(db.String(13), nullable=False)          #科室简介

    doctors = db.relationship('Doctor', backref='department', lazy='dynamic')

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

    timelines = db.relationship('Timeline', backref='doctor', lazy='dynamic')    

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
    am_status = db.Column(db.Boolean)       #上午是否允许预约
    am_quota = db.Column(db.Integer)        #上午允许预约人数
    pm_status = db.Column(db.Boolean)       #下午是否允许预约
    pm_quota = db.Column(db.Integer)        #下午允许预约人数    

    def __init__(self, doctor_id, date, am_status, am_quota, pm_status, pm_quota):
        self.doctor_id = doctor_id
        self.date = date
        self.am_status = am_status
        self.am_quota = am_quota
        self.pm_status = pm_status
        self.pm_quota = pm_quota

    def __repr__(self):
        return "<date:%r doctor:%r>" % (self.date, self.doctor_id)