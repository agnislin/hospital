function getcode() {
    $.get('/Code',function (res) {
        $('#yzm').html(res);
    },'text');
}

$(function(){

    // 注册跳转
    var $register = $('[name = register]')
    $register.click(function(){
        location.href = '/Register';
    });

    //加载页面,加载验证码
    getcode();

    // 点击验证码,刷新验证码
    $('#yzm').click(function () {
        getcode();
    });


    //验证验证码信息
    $('.yzm').blur(function () {
        $.post('/Code',{"code":$('.yzm').val()},function (res) {
            if (res == 'err'){
                alert('验证码错误,请重新填写!');
                $('.yzm').val('');
            }
        },'text');

    });

    // 表单提交验证
    $('form').submit(function(){
        if ($('.user').val() && $('.pwd').val() && $('.yzm').val()){
            return true;
        }
        else{
            var $other = $('.other');
            $('.error').remove();
            var $error = $('<li class="error">请填写用户名,密码以及验证码</li>');
            $other.before($error);
            return false;
        }
    });

})