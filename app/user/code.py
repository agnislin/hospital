import random

def get_code():
    code_list = []
    for i in range(4):
        status = random.randint(1,3)

        if status == 1:
            random_num = random.randint(0,9)
            code_list.append(str(random_num))

        elif status == 2:
            random_lower = chr(random.randint(97,122))
            code_list.append(random_lower)

        elif status == 3:
            random_upper = chr(random.randint(65,90))
            code_list.append(random_upper)

    return ' '.join(code_list)