
$('[name="register"]').click(function(){
    var username = $('[name="username"]').val();
    var password = $('[name="password"]').val();
    var repasswd = $('[name="repasswd"]').val();
    var phone = $('[name="phone"]').val();
    //验证格式
    if(phone == ''){
        layer.msg('请输入手机');
        return false;
    }
    if(username == ''){
        layer.msg('请输入用户名');
        return false;
    }
    if(password == ''){
        layer.msg('请输入密码');
        return false;
    }
    if(repasswd == ''){
        layer.msg('请确认密码');
        return false;
    }
    if(repasswd != password){
        layer.msg('两次密码输入不一致');
        return false;
    }

    
    //发送ajax
    $.post("http://localhost/VMALL/src/PHP/register.php",
        {username,password,phone},
        function(res){
            let {meta:{status,msg},data} = res;
            if(status == 0){
                layer.msg(msg);
                return false;
            }else if(status == 1){
                layer.msg(msg);
                setTimeout(function(){
                    location.href="http://localhost/VMALL/login.html";
                },1000)
                return false;
            }else if(status == 2){
                layer.msg(msg);
                return false;
            }
        },"json");
})