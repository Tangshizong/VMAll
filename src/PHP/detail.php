<?php
header("content-type:text/html;charset=utf8");
// 接收数据
$sku = $_POST["sku"];
//连接数据库
$con = mysqli_connect('localhost','root','root','project');
mysqli_query($con,"set names utf8");
// 获取当前sku数据
$data = mysqli_query($con,"select * from products where sku='$sku'");
//取出当前数据
$row = mysqli_fetch_assoc($data);

// echo "<pre>";
// print_r($data);
// $arr=[];
// while($row = mysqli_fetch_assoc($data)){
//     $arr[] = $row;
// }
echo json_encode($row);