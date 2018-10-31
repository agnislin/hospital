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
import time
import datetime

@main.before_app_first_request
def first():
    db.create_all()

    # 自检查timeline表，构建完整的数据
    today = datetime.date.today()
    timelines = Timeline.query.filter(Timeline.date <= today).all()
    for timeline in timelines:
        db.session.delete(timeline)
    for i in range(1,10):
        next_day = today + datetime.timedelta(days = i)
        if not Timeline.query.filter_by(date = next_day).first():
            doctors = Doctor.query.all()
            for doctor in doctors:
                timeline = Timeline(doctor.id, next_day)
                timeline.doctor = doctor
                db.session.add(timeline)

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
            sel_date = datetime.datetime.strptime(date,'%Y-%m-%d').date()
            print(type(sel_date))
            return render_template('Details.html',params=locals())

# 添加预约信息
@main.route('/Order', methods=['GET', 'POST'])
def order_views():
    if request.method == "GET":
        # 判断是否已登录，只有登录状态才能进行预约
        if 'userName' in session:
            userName = session['userName']  
        else:
             userName = ''       

        doctor_id = request.args.get('doctor_id')
        date = request.args.get('date')
        status = request.args.get('status')
        # 查询预约医生，及当天预约剩余号源
        doctor = Doctor.query.filter_by(id=doctor_id).first()
        timeline = doctor.timelines.filter_by(date=date).first()
        if status == 'am':
            count = timeline.am_quota
            curcount = timeline.am_sources
        elif status == 'pm':
            count = timeline.pm_quota
            curcount = timeline.pm_sources 
        return render_template('Order.html', params=locals())
        
    else:
        userName = session.get('userName')
        painter_name = request.form.get('painter_name')  # 就诊人姓名
        doctor_id = request.form.get('doctor_id')  # 医生id
        date = request.form.get('date')  # 预约的日期
        status = request.form.get('status')  # 上下午
        disease = request.form.get('disease')  # 所患疾病
        id_card = request.form.get('id_card')  # 身份证号
        sex = request.form.get('sex')  # 性别
        phone = request.form.get('phone')  # 手机号码
        addtime = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S') # 添加时间

        # 这样写是为了能返回一个医生给前端
        doctor = Doctor.query.filter_by(id=doctor_id).first()
        # 根据用户名设置为1天之内不能重复预约
        today = datetime.datetime.now().strftime('%Y-%m-%d') + " 00:00:00"
        user = PatientUser.query.filter_by(user_name = userName).first()
        if Order.query.filter(Order.patient_user_id == user.id, Order.addtime >= today).first():            
            orderMessage = '1天内不能重复预约'
            timeline = doctor.timelines.filter_by(date=date).first()
            if status == 'am':
                count = timeline.am_quota
                curcount = timeline.am_sources
            elif status == 'pm':
                count = timeline.pm_quota
                curcount = timeline.pm_sources
            return render_template('Order.html', params=locals())

        # 预约信息入库
        order = Order(status, date, painter_name, disease, id_card, sex, phone, addtime)
        order.patient_user = PatientUser.query.filter_by(user_name = userName).first()
        order.doctor = doctor
        try:
            db.session.add(order)
            # 当天次的号源数减１
            timeline = Timeline.query.filter_by(doctor_id=doctor_id, date=date).first()
            if status == "am":
                timeline.am_sources -= 1
            elif status == "pm":   
                timeline.pm_sources -= 1
            db.session.add(timeline)
            orderMessage = '预约成功'
            return render_template('OrderSuccess.html', params=locals())
        except Exception as e: 
            print(e)
            orderMessage = '预约失败,请重新预约'
            return render_template('Order.html', params=locals())

@main.route('/OrderInfo')
def SelectOrder():
    if 'userName' in session:
        userName = session['userName']
    else:
        return redirect('/')
    # 查询当前用户的有效预约单和历史预约单
    curdate = time.strftime('%Y-%m-%d')
    curtime = time.strftime('%H:%M:%S')
    user = PatientUser.query.filter_by(user_name = userName).first() 
    if curtime >= "12:00:00" and curtime < "17:00:00":
        print(1)
        valid_order = user.orders.filter(or_(Order.ordertime > curdate, \
            and_(Order.ordertime == curdate ,Order.status=="pm"))).all()
        old_order = user.orders.filter(Order.ordertime < curdate).all()
    elif curtime<"12:00:00":  
        print(2)   
        valid_order = user.orders.filter(Order.ordertime >= curdate).all()
        old_order = user.orders.filter(Order.ordertime < curdate).all() 
    else:
        print(3)
        valid_order = user.orders.filter(Order.ordertime > curdate).all()
        old_order = user.orders.filter(Order.ordertime <= curdate).all()
    return render_template('OrderInfo.html', params=locals())


# his系统排班室
@main.route('/Sort', methods=["GET", "POST"])
def Sort():
    if request.method == "GET":
        if "username" in session:
            username = session["username"]
        departments = Department.query.all()
        # 通过科室id获取该科室的医生
        depart_id =  request.args.get("depart_id")
        if not depart_id:
            depart_id = 1
        # print(depart_id,77)
        department = Department.query.filter_by(id = depart_id).first()
        doctors = department.doctors.all()
        count = len(doctors)
        return render_template("Sort.html", params = locals())
    else:
        depart_id = request.form.get("department_id")
        doctors = Doctor.query.filter_by(department_id = int(depart_id)).all()
        for doctor in doctors:
            for timeline in doctor.timelines.order_by("date asc").limit(2).offset(7).all():
                doctor_id = str(doctor.id)
                timeline_date = str(timeline.date)
                am_status = request.form.get('am_' + doctor_id + '_' + timeline_date)
                pm_status = request.form.get('pm_' + doctor_id + '_' + timeline_date)
                am_quota = request.form.get('amn_' + doctor_id + '_' + timeline_date)
                pm_quota = request.form.get('pmn_' + doctor_id + '_' + timeline_date)
                print("*",am_status,pm_status,am_quota,pm_quota, "*")
                timeline.am_status = int(am_status)
                timeline.pm_status = int(pm_status)
                timeline.am_quota = int(am_quota)
                timeline.pm_quota = int(pm_quota)
                db.session.add(timeline)
        resp = request.headers.get('referer','/His')
        return redirect(resp)


#专家预约咨询页面
@main.route("/expert", methods=["GET", "POST"])
def expert():
    if request.method == "GET":
        if "userName" in session:
            userName = session["userName"]
        # 返回最新咨询的数据和存储咨询用户名
        consults = Consult.query.filter_by(status=1).order_by('consult_time desc').limit(5).all()
        d = {}
        for c in consults:
            d[c.user_id] = c.patient_user.user_name
        # 返回医生信息
        doctor_id = request.args.get('id')
        doctor = Doctor.query.filter_by(id=doctor_id).first()
        if not doctor:
            return render_template("404.html")
        else:
            department = doctor.department
            return render_template("Expert.html", params=locals())

#咨询页面
@main.route("/expertconsult", methods=["GET", "POST"])
def expertconsult():
    if request.method == "GET":
        if "userName" in session:
            userName = session["userName"]
        doctor_id = request.args.get("id")
        doctor = Doctor.query.filter_by(id=doctor_id).first()
        department = doctor.department
        return render_template("ExpertConsult.html", params=locals())
    elif request.method == "POST":
        uname = request.form.get("username")
        patient_user = PatientUser.query.filter_by(user_name=uname).first()
        uid = patient_user.id
        theme = request.form.get("theme")
        content = request.form.get("content")
        consult_time = request.form.get("consult_time")
        reply = 0
        doctor_id = request.form.get("doctor_id")
        status = False
        c = Consult(theme, consult_time, content, reply, status)
        c.user_id = uid
        c.doctor_id = doctor_id
        print(theme, consult_time, content, reply, status, uid, doctor_id)
        db.session.add(c)
        return "提交成功!"


#医生系统页面
@main.route("/Hisindex", methods=["GET", "POST"])
def hisindex():
    if request.method == "GET":
        if "username" in session:
            username = session["username"]
            doctor_id = HisUser.query.filter_by(user_name=username).first().doctor_id
            consults = Consult.query.filter_by(doctor_id=doctor_id, status=False).all()
            num = len(consults)
            return render_template("Hisindex.html",params=locals())

#查看咨询信息
@main.route("/Hisconsult", methods=["GET", "POST"])
def hisconsult():
    if request.method == "GET":
        if "username" in session:
            username = session["username"]
            doctor_id = HisUser.query.filter_by(user_name=username).first().doctor_id
            consults = Consult.query.filter_by(doctor_id=doctor_id, status=False).all()
            d = {}
            i = 1
            for c in consults:
                d[c] = i
                i += 1
            return render_template("Hisconsult.html",params=locals())

#处理医生回复
@main.route("/Hisreply", methods=["GET", "POST"])
def hisreply():
    reply = request.form.get("reply")
    id = request.form.get("id")
    consult = Consult.query.filter_by(id=id).first()
    consult.reply = reply
    consult.status = True
    db.session.add(consult)
    return redirect('/Hisconsult')

@main.errorhandler(404)
def page_not_found(e):
    return render_template('404.html')


