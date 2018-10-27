# 主业务逻辑中的视图和路由的定义
from flask import render_template, request, session,redirect
from sqlalchemy import or_ , and_
# 导入蓝图程序，用于构建路由
from . import main
# 导入db，用于操作数据库
from .. import db
# 导入实体类，用于操作数据库
from ..models import *

import os
from datetime import datetime

@main.before_app_first_request
def first():
    db.create_all()


# 首页
@main.route("/", methods=["GET", "POST"])
def Home():
    if request.method == "GET":
        if 'userName' in session:
            userName = session['userName']
        departments = Department.query.all()   
        return render_template('Home.html', params=locals())

# 科室介绍
@main.route('/Section', methods=["GET", "POST"])
def Section():
    if request.method == "GET":
        if 'userName' in session:
            userName = session['userName']
        departments = Department.query.all()
        # 获取医院简介字的符串
        dep_introduce = {}
        path = os.getcwd()
        for d in departments:
            with open(path + '/app/templates/department/' + d.introduce +'.html' ,'r')as f:
                dep_introduce[d.id] = f.read()
        return render_template('Section.html',params=locals())

# 科室详细信息
@main.route('/details', methods=["GET", "POST"])
def details():
    if request.method == "GET":
        if 'userName' in session:
            userName = session['userName']

        department = Department.query.filter_by(id=request.args.get('id')).first()
        # 优先根据医生的姓名来进行查询
        doctor_name = request.args.get('name')
        if (not doctor_name) or doctor_name=="##":
            doctor_name = "##"
            doctors = department.doctors.all()
        else:
            doctors = department.doctors.filter(Doctor.name.like('%'+doctor_name+'%')).all()

        # 根据请求日期查找
        date =  request.args.get('hosdate')
        if (not date) or (date == "weeks"):
            date = "weeks"
            # 根据匹配的医生总数计算总页数
            count = len(doctors)
            pages = count//3 if count%3==0 else count//3+1
            # 获取请求页，返回符合当前页数的医生
            page = request.args.get('page')
            page = 1 if not page else (pages if int(page)>pages else int(page))
            doctors = doctors[(page-1)*3 : page*3]
            return render_template('Details.html',params=locals())
        else:
            # 根据请求查询条件进行查询
            count = 0 
            select_doctor = []
            for doctor in doctors:
                if doctor.timelines.filter(Timeline.date==date, or_(Timeline.am_status==1, \
                                            Timeline.pm_status==1)).first():
                    select_doctor.append(doctor)
                    count += 1
            # 根据查询结果的医生总数计算总页数
            pages = count//3 if count%3==0 else count//3+1
            # 获取请求页，返回符合当前页数的医生
            page = request.args.get('page')
            page = 1 if not page else (pages if int(page)>pages else int(page))
            doctors = select_doctor[(page-1)*3 : page*3]
            # 将日期转datetime.date类型，返回给模板进行日期匹配
            sel_date = datetime.strptime(date,'%Y-%m-%d').date()
            return render_template('Details.html',params=locals())

# his系统首页及登录
@main.route('/His', methods=["GET", "POST"])
def His_Home():
    if request.method == "GET":
        departments = Department.query.all()
        return render_template("His_home.html", params = locals())
    else:
        username = request.form.get("user")
        pswd = request.form.get('pwd')
        if HisUser.query.filter(user_name=username, password=pswd).first:
            id = request.form.get('department_id')
            remember = request.form.get('checkbox')
            print(username,password, id,'aaa',remember)
        else:
            
        return render_template("Login.html", params = 'Error')