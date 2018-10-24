$(function(){
    function getdate(num){
        var currenTime = new Date();
        // console.log(currenTime)
        currenTime.setTime = (currenTime.getTime()+1000*60*60*8);    
        currenTime.setDate(currenTime.getDate() + num);
        var year = currenTime.getFullYear()
        var month = (currenTime.getMonth() + 1);
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        var weekday = currenTime.getDay();
        var day = currenTime.getDate();
        if (day >= 0 && day <= 9) {
            day = "0" + day;
        }
        var f_date = year+'-'+month+'-'+day
        var s_date = month + "月" + day + "日";
        return {"year": year, "month": month, "day": day, "weekday": weekday, "s_date": s_date, "f_date": f_date}
    }

    var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
    // 添加选择
    for(let i=1; i<8; i++){
        var select = getdate(i);
        var $option = $("<option></option>");
        $option.val(select.f_date);
        $option.html(select.s_date + weeks[select.weekday]);
        $('#hosdate').append($option);
    }  

    // 循环输出排班信息
    var $appointment = $('.appointment');
    for (let j=0; j<$appointment.length; j++){
        $work_dates = $($appointment[j]).find('.work_dates');
        for (let i=0; i<$work_dates.length; i++){
            var select = getdate(i+1);
            $($work_dates[i]).children('.date').html(select.s_date)
            $($work_dates[i]).children('.week').html(weeks[select.weekday])
        } 
    } 
})