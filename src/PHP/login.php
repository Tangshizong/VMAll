<?php
header("content-type:text/html;charset=utf8");
// 接收数据
$username = $_POST["username"];
$password = $_POST["password"];

//连接数据库
$con = mysqli_connect('localhost','root','root','project');
mysqli_query($con,"set names utf8");
// 先检查用户名是否注册过 - 拿用户名做条件到数据库中提取一条数据
$user = mysqli_query($con,"select * from user where username='$username'");
// echo "<pre>";
// print_r($pho);
$row = mysqli_fetch_assoc($user);
// 提取到数据 $row是一个数组,提取不到数据，$row是null
if($row){
    if($row["password"] === $password){
        $arr = [
            'meta'=>[
                "status"=>2,
                "message"=>"登录成功"
            ],
            "data"=>null
        ];
    }else{
        $arr = [
            'meta'=>[
                "status"=>1,
                "message"=>"用户名或密码错误，请重新登录"
            ],
            "data"=>null
        ];
    }
}else{
    $arr = [
        'meta'=>[
            "status"=>0,
            "message"=>"用户不存在"
        ],
        "data"=>null
    ];
}
echo json_encode($arr);