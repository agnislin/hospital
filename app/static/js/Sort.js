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
        var s_date = month + "月" + day;
        return {"year": year, "month": month, "day": day, "weekday": weekday, "s_date": s_date, "f_date": f_date}
    }

    var weeks = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];

    // 循环输出排班信息
    var $doctor_tbl = $('.doctor_tbl');
    for (let j=0; j<$doctor_tbl.length; j++){
        $work_dates = $($doctor_tbl[j]).find('.work_dates');
        for (let i=0; i<$work_dates.length; i++){
            var select = getdate(i+1);
            $($work_dates[i]).children('.date').html(select.s_date);
            $($work_dates[i]).children('.week').html(weeks[select.weekday]);
        } 

        $sort_set = $($doctor_tbl[j]).find('.sort_set');
        for (let i=0; i<$sort_set.length; i++){
            var select = getdate(i+8);
            $($sort_set[i]).children('.date').html(select.s_date);
            $($sort_set[i]).children('.week').html(weeks[select.weekday]);
        } 
    }

    // 确认提示
    var $btn = $(".btn");
    var flags = new Array();
    for (let i=0; i<$btn.length; i++){
        flags.push(false);
        $($btn[i]).click(function(){
            flags[i] = ~flags[i]
            if (flags[i]){
                $($btn[i]).next().html('✓'); 
            }
            else{
                $($btn[i]).next().html(' ');
            }
        })
    }

})