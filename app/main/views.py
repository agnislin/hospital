# 主业务逻辑中的视图和路由的定义
from flask import render_template, request, session,redirect
# 导入蓝图程序，用于构建路由
from . import main
# 导入db，用于操作数据库
from .. import db
# 导入实体类，用于操作数据库
from ..models import *

import os
from datetime import *

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
        # 根据医生总数计算页数
        numbers = department.doctors.count()
        pages = numbers//3 if numbers%3==0 else numbers//3+1
        # 获分分页的页数，返回当前页数，和符合当前页数的医生
        page = request.args.get('page')
        page = 1 if not page else (pages if int(page)>pages else int(page))
        doctors = department.doctors.limit(3*page).offset(3*(page-1)).all()
        return render_template('Details.html',params=locals())
    else:
        if 'userName' in session:
            userName = session['userName']
        # 根据请求条件查询医生
        department = Department.query.filter_by(id=request.form.get('id')).first()
        date =  request.form.get('hosdate')
        doctors = department.doctors.all()
        count = 0
        select_doctor = []
        for doctor in doctors:
            if doctor.timelines.filter(Timeline.date == date,or_(Timeline.am_status==1, \
                                        Timeline.pm_status)==0).first():
                select_doctor.append(doctor)
                count += 1
        pages = count//3 if count%3==0 else count//3+1
        page = request.form.get('page')
        page = pages if int(page)>pages else int(page)
        doctors = select_doctor[(page-1)*3 : page*3]

        return render_template('Details.html',params=locals())

