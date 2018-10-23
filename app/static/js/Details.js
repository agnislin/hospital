$(function(){

    var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
    for(let i=1; i<8; i++){
        var currenTime = new Date();
        currenTime.setTime = (currenTime.getTime()+1000*60*60*8);    
        currenTime.setDate(currenTime.getDate() + i);
        var month = currenTime.getMonth() + 1;
        var weekday = currenTime.getDay();
        var today = currenTime.getDate();
        var html = month + "月" + today + "日" + weeks[weekday]

        var $option = $("<option></option>")
        $option.val(weekday)
        $option.html(html)
        $('#hosdate').append($option)  
    }
    // console.log(currenTime.getDate())
})