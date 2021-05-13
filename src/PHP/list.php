<?php
header("content-type:text/html;charset=utf8");
// 接收数据
$type = $_POST["type"];

//连接数据库
$con = mysqli_connect('localhost','root','root','project');
mysqli_query($con,"set names utf8");
// 先检查用户名是否注册过 - 拿用户名做条件到数据库中提取一条数据
$data = mysqli_query($con,"select * from products where type='$type'");
// echo "<pre>";
// print_r($data);
$arr=[];
// $row = mysqli_fetch_assoc($data);
while($row = mysqli_fetch_assoc($data)){
    $arr[] = $row;
}
echo json_encode($arr);
