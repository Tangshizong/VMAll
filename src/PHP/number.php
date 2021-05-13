<?php
header("content-type:text/html;charset=utf8");
// 接收数据
$number = $_POST["number"];
$sku = $_POST['sku'];
//连接数据库
$con = mysqli_connect('localhost','root','root','project');
mysqli_query($con,"set names utf8");
// 查找数据库中有无此商品
//连接查询
// select * from products as a1 inner join cart as a2 on a1.sku = a2.sku where a2.username='chui';

$res = mysqli_query($con,"update cart set number=$number where sku=$sku");
