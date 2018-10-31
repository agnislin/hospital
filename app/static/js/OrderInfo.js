function get_weekday(date) {
    var date = new Date(date+' 0:0:0');
    var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
    return weeks[date.getDay()]; 
}
$(function(){
    var $date = $('.div_time span');
    for (let i=0; i<$date.length; i++){
        day = $($date[i]).text();
        $($date[i]).text(get_weekday(day));
    }
})