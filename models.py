from flask_sqlalchemy import SQLAlchemy
import pymysql
pymysql.install_as_MySQLdb()

from  app import *

app.config['SQLALCHEMY_DATABASE_URI'] = \
    'mysql://root:123456@localhost:3306/hospital'
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True
db = SQLAlchemy(app)

# 用户信息表
class PatientUser(db.Model):
    __tablename__ ='patient_user'
    id = db.Column(db.Integer,primary_key=True)
    user_name = db.Column(db.String(20),unique=True)
    password = db.Column(db.String(12),nullable=False)
    emial = db.Column(db.String(50),nullable=False)
    full_name = db.Column(db.String(20),nullable=False)
    phone = db.Column(db.String(11),nullable=False)
    sex = db.Column(db.String(6),nullable=False)

    def __init__(self,user_name,password,emial,full_name,phone,sex):
        self.user_name = user_name
        self.password = password
        self.emial = emial
        self.full_name = full_name
        self.phone = phone
        self.sex = sex

    def __repr__(self):
        return '<sName:%r>' % self.user_name

# db.drop_all()
db.create_all()