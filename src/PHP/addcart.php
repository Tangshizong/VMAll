<?php
header("content-type:text/html;charset=utf8");
// 接收数据
$sku = $_POST["sku"];
$username = $_POST["username"];
//连接数据库
$con = mysqli_connect('localhost','root','root','project');
mysqli_query($con,"set names utf8");
// 查找数据库中有无此商品
$data = mysqli_query($con,"select * from cart where sku='$sku' and username='$username'");
//取出当前数据
$row = mysqli_fetch_assoc($data);
//加入购物车操作

if($row){
    // $res = mysqli_query($con,"update cart set number=number+1 while sku=$sku");
    $arr = [
        "meta"=>[
            "status"=>0,
            "msg"=>"此商品已经在购物车中了"
        ],
        "data"=>null
    ];
}else{
    $res = mysqli_query($con,"insert cart(username,sku,number) values('$username',$sku,1)");
    if($res){
        $arr = [
            "meta"=>[
                "status"=>1,
                "msg"=>"添加购物车成功"
            ],
            "data"=>null
        ];
    }else{
        $arr = [
            "meta"=>[
                "status"=>2,
                "msg"=>"加入购物车失败"
            ],
            "data"=>null
        ];
    }
}
echo json_encode($arr);