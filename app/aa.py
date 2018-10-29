import sys
from . import db
from .models import *
sys.path.append("..")
from manage import ctx
with ctx:
    # today = date.today()
    # print(type(today))
    departments = db.session.query(Department).all()
    print(departments)
