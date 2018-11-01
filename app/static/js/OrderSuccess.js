function get_weekday(date) {
    var date = new Date(date+' 0:0:0');
    var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
    var day = weeks[date.getDay()];
    var date = day+$('#div_time').text();
    $('#div_time').text(date)   
}