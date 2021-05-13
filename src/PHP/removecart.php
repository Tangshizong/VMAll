<?php
header("content-type:text/html;charset=utf8");
// 接收数据
$sku = $_POST["sku"];
//连接数据库
$con = mysqli_connect('localhost','root','root','project');
mysqli_query($con,"set names utf8");
// 删除此字段
$data = mysqli_query($con,"delete from cart where sku=$sku");
//取出返回值
$row = mysqli_fetch_assoc($data);
//判断
if($row){
    // $res = mysqli_query($con,"update cart set number=number+1 while sku=$sku");
    $arr = [
        "meta"=>[
            "status"=>1,
            "msg"=>"删除成功"
        ],
        "data"=>null
    ];
}else{
    $arr = [
        "meta"=>[
            "status"=>0,
            "msg"=>"删除失败"
        ],
        "data"=>null
    ];
}
echo json_encode($arr);