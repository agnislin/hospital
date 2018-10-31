$(function(){
        $(".sub").click(function(){
            var text = $(this).parent().prev().children().val()
            var id = $(this).parent().parent().find('input[type=hidden]').val()
            if(!text){
                alert("请填写回复内容!")
            }
            else if(window.confirm("确认提交?")){
                $.ajax({
                    type: "POST",
                    url: "/Hisreply",
                    data: {reply:text, id:id},
                    dataType: "text",
                    success: function(data){
                        alert(data);
                        location.href = "/Hisconsult"
                    },
                });
            }
        });
});