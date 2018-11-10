# 对整个应用做初始化操作
# 主要工作：
# 1.构建Flask应用以及各种配置
# 2.构建SQLAlchemy的应用

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import pymysql
from sshtunnel import SSHTunnelForwarder
pymysql.install_as_MySQLdb()

db = SQLAlchemy()

ssh_host = "39.108.141.220"
ssh_port = 22
ssh_user = "root"
ssh_password = "Micouser2018"
mysql_host = "localhost"
mysql_port = 3306
def create_app():
    app = Flask(__name__)
    # 配置启动模式为调试模式
    app.config['DEBUG'] = False
    # 配置数据库的连接字符串
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://agnis:agnis@39.108.141.220:3306/hospital'
    # 配置数据库内容在更新时自动提交
    app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True
    # 配置session所需要的秘钥
    app.config['SECRET_KEY'] = 'dagg235ags.asgas'
    # 数据库的初始化

    with SSHTunnelForwarder(
        (ssh_host, ssh_port),
        ssh_username=ssh_user,
        ssh_password=ssh_password,
        remote_bind_address=(mysql_host, mysql_port)
    ) as server:
        # ssh通道服务启动
        server.start()
        local_port = str(server.local_bind_port)
    # 将flask_sqlalchemy.SQLAlchemy附加到Flask
        db.init_app(app)


    # 将main蓝图程序与app关联到一起
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)
    # 将user蓝图程序与app关联到一起
    from .user import user as user_blueprint
    app.register_blueprint(user_blueprint)
    return app
