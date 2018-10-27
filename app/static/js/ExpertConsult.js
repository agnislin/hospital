$(function(){
    function getCurrentTime(){
        var date = new Date();
        var year = date.getFullYear();//得到年份
        var month = date.getMonth();//得到月份
        var day = date.getDate();//得到日期
        var week = date.getDay();//得到周几
        var hour = date.getHours();//得到小时
        var min = date.getMinutes();//得到分钟
        var sec = date.getSeconds();//得到秒数
        if(month<10) month = "0" + month;
        if(day<10) day = "0" + day;
        if(hour<10) hour = "0" + hour;
        if(min<10) min = "0" + min;
        if(sec<10) sec = "0" + sec;
        var time = year + "-" + month + "-" + day + "  " + hour +":" + min + ":" + sec
        return time
    }
    $("#sub").click(function(){
        time = getCurrentTime();
        if(!$("#uid").val()){
            alert("请先登录!");
        }
        else if(!$("#theme").val() || !$("#text").val()){
            alert("请填写你想要咨询的内容!");
        }
        else{
            $.ajax({
                type: "POST",
                url: "/expertconsult",
                data: {
                    username:$("#uid").val(),
                    theme:$("#theme").val(),
                    content:$("#text").val(),
                    consult_time: time,
                    doctor_id: $("#doc_id").val()
                },
                dataType: "text",
                success: function(data){
                    alert(data)
                },
            });
        }
    });
});