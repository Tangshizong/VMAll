
//发送ajax
$('.sub').click(function(){
    var username = $('[name="username"]').val();
    var password = $('[name="password"]').val();
    //验证格式
    if(username == ''){
        layer.msg('请输入用户名');
        return false;
    }
    if(password == ''){
        layer.msg('请输入密码');
        return false;
    }
    $.post("http://localhost/VMALL/src/PHP/login.php",
    {username,password},
    function(res){
        let {meta:{status,message},data} = res;
        if(status == 0){
            layer.msg(message);
            return false;
        }else if(status == 2){
            layer.msg(message);
            setTimeout(function(){
                location.href="http://localhost/VMALL/index.html";
            },1000)
            return false;
        }else if(status == 1){
            layer.msg(message);
            return false;
        }
    },"json");
})
