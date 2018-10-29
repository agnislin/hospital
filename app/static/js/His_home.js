// 点击科室登录
function Login(id){
    $('.mypop').show();
    console.log(id);
    $('#department_id').val(id) ;
}
$(function () {
    // 点击取消
    $('#cancel').click(function () {
        $('.mypop').hide();
    })

    // 表单提交
    $('form').submit(function(){
        if ($('#user').val()!='请输入帐号' && $('#pwd').val()!="请输入密码"){
            return true;
        }
        else{
            var $password = $('#password');
            $('.error').remove();
            var $error = $('<p class="error">账号或密码不能为空</p>');
            $password.after($error);
            return false;
        }
    });



})