from . import db


# 用户表
class PatientUser(db.Model):
    __tablename__ = 'patient_user'
    id = db.Column(db.Integer, primary_key=True)
    user_name = db.Column(db.String(20), unique=True)
    password = db.Column(db.String(12), nullable=False)
    emial = db.Column(db.String(50), nullable=False)
    full_name = db.Column(db.String(20), nullable=False)
    phone = db.Column(db.String(11), nullable=False)
    sex = db.Column(db.String(6), nullable=False)

    def __init__(self, user_name, password, emial, full_name, phone, sex):
        self.user_name = user_name
        self.password = password
        self.emial = emial
        self.full_name = full_name
        self.phone = phone
        self.sex = sex

    def __repr__(self):
        return '<sName:%r>' % self.user_name


# 部门表
class Department(db.Model):
    __tablename__ = 'department'
    id = db.Column(db.Integer, primary_key=True)
    department = db.Column(db.String(20), nullable=False)
    introduce = db.Column(db.String(2000), nullable=False)
    special = db.Column(db.Integer)

    doctors = db.relationship('Doctor', backref='department', lazy='dynamic')

    def __init__(self, department, introduce):
        self.department = department
        self.introduce = introduce

    def __repr__(self):
        return "<Department:%r>" % self.department


# 医生表
class Doctor(db.Model):
    __tablename__ = 'doctor'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30), nullable=False)
    title = db.Column(db.String(20), nullable=False)
    skill = db.Column(db.Text, nullable=False)
    price = db.Column(db.Float(7), nullable=False)
    department_id = db.Column(db.Integer, db.ForeignKey('department.id'))
