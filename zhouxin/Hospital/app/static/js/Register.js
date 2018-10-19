$(function () {
    var $form = $('form');
    var $user = $('[name = user_name]');
    var $pwd = $('[name = password]');
    var $rpwd = $('[name = r_password]');
    var $email = $('[name = email]');
    var $fname = $('[name = full_name]');
    var $phone = $('[name = phone_num]');

    // 账号格式填写不合法
    $user.blur(function () {
        $('.right>.ErrorUser').remove();
        if (isUserAvailable($user.val())) {
            if ($user.val()) {
                // location.href = '/Register?userName='+$user.val();
                $.get('/Register', {"userName": $user.val()}, function (resText) {
                    if (resText=='exist') {
                        alert('用户名称已存在');
                        $user.val("");
                    }
                }, 'text');

            }
        }
        else {
            var $error_User = $('<span class="ErrorUser"> 请按正确格式填写用户名</span>');
            $user.after($error_User);
        }
        if($user.val()){
            $('.ErrorUser1').remove();
        }
    });

    // 密码格式填写不合法
    $pwd.blur(function () {
        if (isPwdAvailable($pwd.val())) {
            $('.right>.ErrorPwd').remove();
        }
        else {
            $('.right>.ErrorPwd').remove();
            var $error_Pwd = $('<span class="ErrorPwd"> 请按正确格式填写密码</span>');
            $pwd.after($error_Pwd);
        }
        if($pwd.val()){
            $('.ErrorPwd1').remove();
        }
    });

    // 密码重新输入不匹配
    $rpwd.blur(function () {
        if ($rpwd.val() && $rpwd.val() != $pwd.val()) {
            $('.right>.ErrorRpwd').remove();
            var $error_Rpwd = $('<span class="ErrorRpwd"> 密码与确认密码不匹配</span>');
            $rpwd.after($error_Rpwd);
        }
        else {
            $('.right>.ErrorRpwd').remove();
        }
        if($rpwd.val()){
            $('.ErrorRpwd1').remove();
        }
    });

    // 邮箱格式不合法
    $email.blur(function () {
        if (isEmailAvailable($email.val())) {
            $('.right>.ErrorEmail').remove();
        }
        else {
            $('.right>.ErrorEmail').remove();
            var $error_Email = $('<span class="ErrorEmail"> 请按正确格式填写邮箱</span>');
            $email.after($error_Email);
        }
        if($email.val()){
            $('.ErrorEmail1').remove();
        }

    });

    // 手机号格式不合法
    $phone.blur(function () {
        if (isPhoneAvailable($phone.val())) {
            $('.right>.ErrorPhone').remove();
        }
        else {
            $('.right>.ErrorPhone').remove();
            var $error_Phone = $('<span class="ErrorPhone"> 请按正确格式填写手机号</span>');
            $phone.after($error_Phone);
        }
        if($phone.val()){
            $('.ErrorPhone1').remove();
        }
    });
    // 填写真实姓名后，如果后面有span标签就删除
    $fname.blur(function () {
        if($fname.val()){
            $('.ErrorFname').remove();
        }
    });


    // 表单提交判断
    $form.submit(function () {
        // $('.right>span').remove();
        var flage = true;
        if ($('.ErrorPwd').val()) {
            flage = false;
        }
        if ($('.ErrorRpwd').val()) {
            flage = false;
        }
        if ($('.ErrorEmail').val()) {
            flage = false;
        }
        if ($('.ErrorPhone').val()) {
            flage = false;
        }
        if (!$user.val()) {
            if ($('.ErrorUser1')) {
                    $('.ErrorUser1').remove();
            }
            var $null_user = $('<span class="ErrorUser1"> 请填写用户名</span>');
            $user.after($null_user);
            flage = false;
        }
        if (!$pwd.val()) {
            if ($('.ErrorPwd1')) {
                    $('.ErrorPwd1').remove();
            }
            var $null_pwd = $('<span class="ErrorPwd1"> 请填写密码</span>');
            $pwd.after($null_pwd);
            flage = false;
        }
        if (!$rpwd.val()) {
            if ($('.ErrorRpwd1')) {
                    $('.ErrorRpwd1').remove();
            }
            var $null_rpwd = $('<span class="ErrorRpwd1"> 请填写确认密码</span>');
            $rpwd.after($null_rpwd);
            flage = false;
        }
        if (!$email.val()) {
            if ($('.ErrorEmail1')) {
                    $('.ErrorEmail1').remove();
            }
            var $null_email = $('<span class="ErrorEmail1"> 请填写电子邮箱</span>');
            $email.after($null_email);
            flage = false;
        }
        if (!$fname.val()) {
            if ($('.ErrorFname')) {
                    $('.ErrorFname').remove();
            }
            var $null_fname = $('<span class="ErrorFname"> 请填写您的姓名</span>');
            $fname.after($null_fname);
            flage = false;
        }
        if (!$phone.val()) {
            if ($('.ErrorPhone1')) {
                    $('.ErrorPhone1').remove();
            }
            var $null_phone = $('<span class="ErrorPhone1"> 请填写手机号</span>');
            $phone.after($null_phone);
            flage = false;
        }
        return flage ? true : false
    });

    // 验证用户名
    function isUserAvailable(userInput) {
        var reg = /^[a-zA-Z]\w{3,20}$/g;
        return (!userInput || !userInput.search(reg)) ? true : false;
    }

    // 验证用户密码
    function isPwdAvailable(pwdInput) {
        var reg = /^\w{6,12}$/g;
        return (!pwdInput || !pwdInput.search(reg)) ? true : false;
    }

    // 验证邮箱
    function isEmailAvailable(emailInput) {
        var reg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/g;
        return (!emailInput || !emailInput.search(reg)) ? true : false;
    }

    // 验证11位有效手机号码
    function isPhoneAvailable(phoneInput) {
        var reg = /^[1][3,4,5,7,8][0-9]{9}$/g;
        return (!phoneInput || !phoneInput.search(reg)) ? true : false;
    }
})