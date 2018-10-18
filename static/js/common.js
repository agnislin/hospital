function Get_ajax(){
    var xhr = null;
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
        return xhr;
    }
    else{
        xhr = new ActiveXObject("Microsoft.XMLHTTP");
        return xhr;
    }
}