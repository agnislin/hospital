$(function(){
    $("#sub").click(function(){
        if(!$("#ta").val()){
            alert("回复内容没填呢!")
        }
        else if(window.confirm("确认提交?")){
            $.ajax({
                type: "POST",
                url: "/Hisreply",
                data: {reply:$("#ta").val(), id:$("#input").val()},
                dataType: "text",
                success: function(data){
                    alert(data);
                    location.href = "/Hisconsult"
                },
            });
        }else{
            return 
        }
    });
});