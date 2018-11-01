# 启动和管理项目
from app import create_app

app = create_app()
ctx = app.app_context()
ctx.push()

if __name__ == '__main__':
    app.run('0.0.0.0',5000)
