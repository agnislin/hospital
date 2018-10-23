$(function(){
    var $form = $('form');
    var $user = $('[name = user_name]');
    var $pwd = $('[name = password]');
    var $rpwd = $('[name = r_password]');
    var $email = $('[name = email]');
    var $fname = $('[name = full_name]');
    var $phone = $('[name = phone_num]'); 
    
    // 账号格式填写不合法
    $user.blur(function(){
        if( isUserAvailable($user.val()) ){
            $('.right>.ErrorUser').remove();
            // 判断用户名是否存在，调用AJAX模块的方法创建AJAX对象
            if ($user.val()){
                var xhr = Get_ajax();
                xhr.open("GET", "/Register?userName="+$user.val(), true);
                xhr.onreadystatechange = function(){
                    if(xhr.readyState == 4 && xhr.status == 200){
                        if(xhr.responseText == "Exist"){
                            alert("用户名已存在");
                            $user.val("");
                        }
                    }
                }
                xhr.send(null);
            }            
        }
        else{
            $('.right>.ErrorUser').remove();
            var $error_User = $('<span class="ErrorUser"> 请按正确格式填写用户名</span>');
            $user.after($error_User); 
        }
    });

    // 密码格式填写不合法
    $pwd.blur(function(){
        if(isPwdAvailable($pwd.val())){
            $('.right>.ErrorPwd').remove();            
        }
        else{
            $('.right>.ErrorPwd').remove();
            var $error_Pwd = $('<span class="ErrorPwd"> 请按正确格式填写密码</span>');
            $pwd.after($error_Pwd); 
        }
    });

    // 密码重新输入不匹配
    $rpwd.blur(function(){
        if( $rpwd.val() && $rpwd.val() != $pwd.val()){
            $('.right>.ErrorRpwd').remove();
            var $error_Rpwd = $('<span class="ErrorRpwd"> 密码与确认密码不匹配</span>');
            $rpwd.after($error_Rpwd); 
        }
        else{
            $('.right>.ErrorRpwd').remove();
        }
    });

    // 邮箱格式不合法
    $email.blur(function(){
        if( isEmailAvailable($email.val()) ){
            $('.right>.ErrorEmail').remove();
        }
        else{
            $('.right>.ErrorEmail').remove();
            var $error_Email = $('<span class="ErrorEmail"> 请按正确格式填写邮箱</span>');
            $email.after($error_Email); 
        }
    });    

    // 手机号格式不合法
    $phone.blur(function(){
        if( isPhoneAvailable($phone.val()) ){
            $('.right>.ErrorPhone').remove();
        }
        else{
            $('.right>.ErrorPhone').remove();
            var $error_Phone = $('<span class="ErrorPhone"> 请按正确格式填写手机号</span>');
            $phone.after($error_Phone); 
        }
    });


    // 表单提交判断
    $form.submit(function(){
        $('.right>span').remove()
        var flage = true;
        if (!$user.val()){
            var $null_user = $('<span class="ErrorUser"> 请填写用户名</span>');
            $user.after($null_user);            
            flage = false;
        }
        if(!$pwd.val()){
            var $null_pwd = $('<span class="ErrorPwd"> 请填写密码</span>');
            $pwd.after($null_pwd);            
            flage = false;
        }
        if(!$rpwd.val()){
            var $null_rpwd = $('<span class="ErrorRpwd"> 请填写确认密码</span>');
            $rpwd.after($null_rpwd);            
            flage = false;
        }
        if(!$email.val()){
            var $null_email = $('<span class="ErrorEmail"> 请填写电子邮箱</span>');
            $email.after($null_email);            
            flage = false;
        }
        if(!$fname.val()){
            var $null_fname = $('<span class="ErrorFname"> 请填写您的姓名</span>');
            $fname.after($null_fname);            
            flage = false;
        } 
        if(!$phone.val()){
            var $null_phone = $('<span class="ErrorPhone"> 请填写手机号</span>');
            $phone.after($null_phone);            
            flage = false;
        }
        return flage ? true :false         
    });

    // 验证用户名
    function isUserAvailable(userInput){
        var reg = /^[a-zA-Z]\w{3,20}$/g;
        return ( !userInput || !userInput.search(reg) ) ? true : false;
    }

    // 验证用户密码
    function isPwdAvailable(pwdInput){
        var reg = /^\w{6,12}$/g;
        return ( !pwdInput || !pwdInput.search(reg) ) ? true : false;
    }

    // 验证邮箱
    function isEmailAvailable(emailInput){
        var reg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/g;
        return ( !emailInput || !emailInput.search(reg) ) ? true : false;
    }

    // 验证11位有效手机号码
    function isPhoneAvailable(phoneInput){
        var reg = /^[1][3,4,5,7,8][0-9]{9}$/g;
        return ( !phoneInput || !phoneInput.search(reg) ) ? true : false;
    }
})