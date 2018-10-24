from flask import request, render_template, redirect, session
from sqlalchemy import or_ , and_
from ..models import *
from .. import db

from . import user


# 登录处理
@user.route("/Login", methods=["GET", "POST"])
def Login():
    if request.method == "GET":
        # 判断cookie是否保持存上次的登录记录，是则返回用户密名和密码
        if 'userName' in request.cookies:
            userName = request.cookies.get('userName')
            password =  PatientUser.query.filter_by(user_name=userName).first().password
        return render_template("Login.html", params=locals())
    else:
        userName = request.form.get('uname')
        pswd = request.form.get('upsw')
        # 验证用户名和密码，正确则跳转到首页，否则返回错误标志
        patient_user =  PatientUser.query.filter_by(user_name=userName, password=pswd).first()
        if patient_user:
            resp = redirect('/')
            #　保存登录状态到session
            session['userName'] = userName
            # 判断是否为记住密码，是则存储账号信息到cookie
            if request.form.get('remember'):
                resp.set_cookie('userName', userName, max_age= 60*60*24*365)

            return resp
        else:
            return render_template("Login.html", params = 'Error')


# 注册处理
@user.route("/Register", methods=["GET", "POST"])
def Register():
    if request.method == "GET":
        # 判断请求是否有数据，用来判断用户名是否存在
        if 'userName' in request.args:
            userName = request.args.get('userName')
            if PatientUser.query.filter_by(user_name=userName).first():
                return 'Exist'
        return render_template("Register.html")
    else:
        user_name = request.form.get('user_name')
        password = request.form.get('password')
        email = request.form.get('email')
        full_name = request.form.get('full_name')
        phone_num = request.form.get('phone_num')
        sex = request.form.get('sex')
        patient_user = PatientUser(user_name, password, email, full_name, phone_num, sex)
        db.session.add(patient_user)
        return redirect('/')


# 注销处理
@user.route('/Sign_out')
def Sign_out():
    if request.method == "GET":
        del session['userName']
        resp = request.headers.get('referer','/')
        return redirect(resp)
