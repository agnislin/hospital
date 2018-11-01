$(function(){
    var $painter_name = $('#painter_name');
    var $disease = $('#disease');
    var $id_card = $('#id_card');
    var $phone = $('#phone');

    // 验证姓名
    $painter_name.blur(function () {
        if($painter_name.val()){
            if(!$painter_name.val().match(/^[\u4e00-\u9fa5]+$/)){
                alert('姓名中包含除中文以外的字符');
                $painter_name.val('');
                console.log(this);
            }else if($painter_name.val().length>12){
                alert('姓名字符过多');
                $painter_name.val('');
            }
        }     
    });
    // 验证所输入的疾病
    $disease.blur(function(){
        if($disease.val()){
            if($disease.val().length>12){
                alert('所患疾病字符过多');
                $disease.val('');
            }
        }
    });
    // 验证身份证
    $id_card.blur(function(){
        if($id_card.val()){
            if(!$id_card.val().match(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/)){
                alert('无效的身份证号，请重新输入');
                $id_card.val('');
            }
        }
    });
    // 验证手机号
    $phone.blur(function(){
        if($phone.val()){
            if($phone.val().match(/^1[34578]\d{9}$/)!=$phone.val()){
                alert('无效的手机号，请重新输入');
                $phone.val('');
            }
        }
    });

});

function get_weekday(date) {
    var date = new Date(date+' 0:0:0');
    var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
    var day = weeks[date.getDay()];
    var date = day+$('#div_time').text();
    $('#div_time').text(date)
}