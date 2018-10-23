$(function(){

    // 注册跳转
    var $register = $('[name = register]')
    $register.click(function(){
        location.href = '/Register';
    });

    // 表单提交
    $('form').submit(function(){
        if ($('.user').val() && $('.pwd').val()){
            return true;
        }
        else{
            var $other = $('.other');
            $('.error').remove();
            var $error = $('<li class="error">账号或密码不能为空</li>');
            $other.before($error);
            return false;
        }
    });
})