<?php
header("content-type:text/html;charset=utf8");
// 接收数据
// $sku = $_POST["sku"];
$username = $_POST["username"];
//连接数据库
$con = mysqli_connect('localhost','root','root','project');
mysqli_query($con,"set names utf8");
// 查找数据库中有无此商品
//连接查询
// select * from products as a1 inner join cart as a2 on a1.sku = a2.sku where a2.username='chui';

$data = mysqli_query($con,"select * from products as a1 inner join cart as a2 on a1.sku = a2.sku where a2.username='$username';");
$num = mysqli_query($con,"select * from cart where username='$username';");

//取出当前数据

//加入购物车操作
$arr=[];
$numbers=[];
// $row = mysqli_fetch_assoc($data);
while($row = mysqli_fetch_assoc($data)){
    $arr[] = $row;
}
while($number = mysqli_fetch_assoc($num)){
    $numbers[] = $number;
}
if($arr){
    $datarr = [
        "meta"=>[
            "status"=>1,
            "msg"=>"数据获取成功"
        ],
        "data"=>$arr,
        "dataCart"=>$numbers
    ];
}else{
    $datarr = [
        "meta"=>[
            "status"=>0,
            "msg"=>"数据获取失败"
        ],
        "data"=>null
    ];
}
echo json_encode($datarr);