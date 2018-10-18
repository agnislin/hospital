from flask import Flask
from flask import render_template, request, redirect
from flask import session

app = Flask(__name__)

# 配置session的SECRET_KEY
app.config["SECRET_KEY"] = 'linyi'

# 