from flask import request, render_template, redirect, session
from ..models import *
from .. import db

from . import user


# 登录处理
@user.route("/Login", methods=["GET", "POST"])
def Login():
    if request.method == "GET":
        # 判断cookie是否保持存上次的登录记录，是则返回用户密名和密码
        userName = request.cookies.get('userName', 0)
        if userName:
            password = PatientUser.query.filter_by(user_name=userName).first().password
            return render_template("Login.html", params=locals())
        return render_template("Login.html", params=0)
    else:
        userName = request.form.get('uname')
        pswd = request.form.get('upsw')
        # 验证用户名和密码，正确则跳转到首页，否则返回错误标志
        patient_user = PatientUser.query.filter_by(user_name=userName, password=pswd).first()
        if patient_user:
            # 判断是否为记住密码，是则存储账号信息到cookie
            resp = redirect('/')
            if request.form.get('remember'):
                resp.set_cookie('userName', userName, max_age=60 * 60 * 24 * 365)
            session['userName'] = userName
            return resp
        else:
            return render_template("Login.html", params='Error')


# 注册处理
@user.route("/Register", methods=["GET", "POST"])
def Register():
    if request.method == "GET":
        # 判断请求是否有数据，用来判断用户名是否存在
        if request.args:
            userName = request.args.get('userName')
            user_flage = ""
            if PatientUser.query.filter_by(user_name=userName).first():
                user_flage = 'exist'
            return user_flage
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
@user.route('/Exit')
def Exit():
    if 'userName' in session:
        del session['userName']
    return redirect('/')
