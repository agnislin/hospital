# 主业务逻辑中的视图和路由的定义
from flask import render_template, request, session,redirect
# 导入蓝图程序，用于构建路由
from . import main
# 导入db，用于操作数据库
from .. import db
# 导入实体类，用于操作数据库
from ..models import *


# 首页
@main.route("/", methods=["GET", "POST"])
def Home():
    if request.method == "GET":
        if 'userName' in session:
            userName = session['userName']
        departments = Department.query.all()
        return render_template('Home.html', params=locals())
    else:
        pass


# 科室介绍
@main.route('/Section')
def Section():
    if 'userName' in session:
        userName = session['userName']
    departments = Department.query.all()
    return render_template('Section.html',params=locals())

# 科室详细信息
@main.route('/details')
def details():
    if request.args.get('id'):
        if 'userName' in session:
            userName = session['userName']
        departments = Department.query.all()
        department = Department.query.filter_by(id=request.args.get('id')).first()
        return render_template('Details.html',params=locals())
    else:
        return redirect('/')

@main.route('/introduce')
def introduce():
    if request.args['id']:
        department = Department.query.filter_by(id=request.args.get('id')).first()
        text = department.introduce
        return text
    else:
        redirect(request.headers['referer'])
