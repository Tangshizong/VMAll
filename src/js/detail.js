// 登录状态
if(getCookie('username')){
    $('.nav-right ol li').first().html(`
        <a href="javascript:;">欢迎您：${getCookie('username')}</a>
    `)
    $('.nav-right ol li').first().next().html(`
        <a href="javascript:;">退出</a>
    `)
}else{
    $('.nav-right ol li').first().html(`
        <a href="login.html">请登录</a>
    `)
    $('.nav-right ol li').first().next().html(`
        <a href="register.html">注册</a>
    `)
}
//点击退出
$('.nav-right ol li').first().next().click(function(){
    //询问框
    layer.confirm('您确定要退出吗？', {
        btn: ['确定','取消'] //按钮
      }, function(){
        removeCookie('username');
        layer.msg('退出成功', {
            time: 500, //0.5s后自动关闭
          });
        $('.nav-right ol li').first().html(`
            <a href="login.html">请登录</a>
        `)
        $('.nav-right ol li').first().next().html(`
            <a href="register.html">注册</a>
        `)
      }, function(){
        layer.msg('取消退出', {
          time: 500, //0.5s后自动关闭
        });
      });
})






//判断地址获取详情
function Detail(){
    this.sku = null;
}
Detail.prototype.init = function(){
    this.herf();
    this.Ajax();
    this.Join();
}
//通过地址栏信息判断从何处链接点进来的
Detail.prototype.herf = function (){
    var i = window.location.search;
    this.sku = i.split('=')[1]-0;
}
//发送ajax获取信息
Detail.prototype.Ajax = function(){
    $.post('http://localhost/VMALL/src/PHP/detail.php',
        {sku:this.sku},
        (res)=>{
            $('#bread-name').html(res.skuName);
            var midimg = $(`<img src="${res.imgpath}" alt=""></img>`)
            $('.product-gallery-img').append(midimg)
            var smallimg = `<li class="current">
                <img src="${res.imgpath}" alt="">
            </li>`
            $('.pro-gallerys').html(smallimg)
            $('.product-bigbox').css('backgroundImage',`url(${res.imgpath})`);
            $('#pro-name').html(res.skuName);
            $('#pro-price').html(`<i>¥</i>${res.price}`);
            $('#pro-sku-code2').html(res.sku);
            $('.product-choose dl dd a img').prop('src',`${res.imgpath}`);
            // var midimg = $(`<a href="cart.html?sku=${res.sku}">
            //          <span>加入购物车</span>
            //  </a>`)
            // $('.product-button').html(`  
            // `);
        },'json'
    )
}
//点击加入购物车写入数据
Detail.prototype.Join = function(){
    var user = getCookie('username')
    //点击立即购买
    $('.buy-now').click(()=>{
        //判断是否登录
        if(!getCookie('username')){
            layer.msg('请先登录');
            location.href="http://localhost/VMALL/login.html";
            return false;
        }
        $.post('http://localhost/VMALL/src/PHP/addcart.php',
        {sku:this.sku,username:user},
        (res)=>{
            let {meta:{status,msg},data} = res;
            if(status == 0){
                layer.msg(msg);
                setTimeout(function(){
                    location.href="http://localhost/VMALL/cart.html"
                },1000);
                return false;
            }else if(status == 1){
                layer.msg(msg);
                setTimeout(function(){
                    location.href="http://localhost/VMALL/cart.html"
                },1000);
                return false;
            }else if(status == 2){
                layer.msg(msg);
                return false;
            }
        },'json')
    })
    //点击加入购物车发送请求
    $('.join-cart').click(()=>{
        //判断是否登录
        if(!getCookie('username')){
            layer.msg('请先登录');
            location.href="http://localhost/VMALL/login.html";
            return false;
        }
        $.post('http://localhost/VMALL/src/PHP/addcart.php',
        {sku:this.sku,username:user},
        (res)=>{
            let {meta:{status,msg},data} = res;
            if(status == 0){
                layer.msg(msg);
                return false;
            }else if(status == 1){
                layer.msg(msg);
                return false;
            }else if(status == 2){
                layer.msg(msg);
                return false;
            }
        },'json')
    })
}




var detal = new Detail()
detal.init()







// 放大镜
// 定义一个空构造函数
function Enlarge(classname){
    this.box = document.querySelector("."+classname);
    // 把需要操作的所有的元素都获取到，并绑定到对象的属性上
    this.middleBox = this.box.querySelector('.product-gallery-img');
    this.middleImg = this.box.querySelector('.product-gallery-img img');
    this.shade = this.box.querySelector('.mask');
    this.bigBox = this.box.querySelector('.product-bigbox');
    this.smallImgs = this.box.querySelectorAll('.pro-gallerys li');
    // 给需要操作的元素绑定事件
    var _this = this;
    for(var i=0;i<this.smallImgs.length;i++){
        this.smallImgs[i].onclick=function(){
            _this.tab(this);
        }
    }
    // 中等盒子鼠标放上去的事件
    this.middleBox.onmouseover=function(){
        _this.over();
    }
    // 中等盒子鼠标离开的事件
    this.middleBox.onmouseout=function(){
        _this.out();
    }
}
// 鼠标离开中盒子的事件
Enlarge.prototype.out=function(){
    this.shade.style.display = 'none';
    this.bigBox.style.display = 'none';
    this.middleBox.onmousemove=null;
}
// 鼠标放到中盒子上的事件
Enlarge.prototype.over=function(){
    this.shade.style.display = 'block';
    var _this = this;
    this.middleBox.onmousemove=function(){
        _this.move();
    }
}
// 鼠标在中盒子上移动的事件
Enlarge.prototype.move=function(e){
    var e = e || window.event;
    var x = e.clientX;
    var y = e.clientY;
    // 遮罩的宽高的一半
    var shadeWidthBan = this.shade.clientWidth/2;
    var shadeHeightBan = this.shade.clientHeight/2;
    // 限定x和y在左上角的最小位置
    if(x<this.box.offsetLeft+shadeWidthBan){
        x = this.box.offsetLeft+shadeWidthBan
    }
    if(y<this.box.offsetTop+shadeHeightBan){
        y = this.box.offsetTop+shadeHeightBan
    }
    // 限定x和y在右下角的最大值
    if(x>this.box.offsetLeft+this.middleBox.offsetWidth-shadeWidthBan){
        x = this.box.offsetLeft+this.middleBox.offsetWidth-shadeWidthBan;
    }
    if(y>this.box.offsetTop+this.middleBox.offsetHeight-shadeHeightBan){
        y = this.box.offsetTop+this.middleBox.offsetHeight-shadeHeightBan;
    }
    // console.log(y);
    // 给遮罩设置left和top，让遮罩移动起来
    this.shade.style.left = x - this.box.offsetLeft - shadeWidthBan + 'px';    
    this.shade.style.top = y - this.box.offsetTop - shadeHeightBan + 'px'; 
    this.bigImgMove();   
}
// 移动遮罩让大图移动
Enlarge.prototype.bigImgMove=function(){
    this.bigBox.style.display = 'block';
    /*
    遮罩移动的距离              大图移动距离
    ------------     ===        ---------
    中盒子的大小                 大图的大小
    */
    // 计算遮罩和中盒子的比例
    var xPercent = this.shade.offsetLeft/this.middleBox.clientWidth;
    var yPercent = this.shade.offsetTop/this.middleBox.clientHeight;
    // console.log(this.middleBox.clientWidth);
    // 计算大图的大小 - 大图是大盒子的背景图 - 获取背景图的大小
    var bigImgBgSize = getStyle(this.bigBox,"background-size");
    // console.log(bigImgBgSize);
    // 获取 单独的宽高的数字
    var bigImgBgWidth = parseInt(bigImgBgSize.split(" ")[0]);
    var bigImgBgHeight = parseInt(bigImgBgSize.split(" ")[1]);
    // console.log(bigImgBgWidth,bigImgBgHeight);
    // 计算大图要移动的距离
    var xMove = bigImgBgWidth*xPercent;
    var yMove = bigImgBgHeight*yPercent;
    // 把大图要移动的距离赋值到大图的背景定位的left和top上
    this.bigBox.style.backgroundPosition = -xMove+'px '+-yMove+'px';
    // console.log(xMove,yMove);
    // console.log(this.shade.offsetLeft,this.shade.offsetTop);
}
// 点击小图换中图，并换大图
Enlarge.prototype.tab=function(smallImg){
    // 找到当前点击的小图的路径
    var smallImgSrc = smallImg.src;
    // 截取到 数字.jpg

    // 找到点的下标
    var dotIndex = smallImgSrc.lastIndexOf(".");
    // 截取到末尾
    var targetSuffix = smallImgSrc.substring(dotIndex-1);
    // 拼接成中等图片的路径
    var middleImgSrc = "./images/middle"+targetSuffix;
	// 拼接成大图的路径
	var bigImgSrc = "url(./images/middle"+targetSuffix+")";
    // 将中等图片的路径赋值到中等图的src属性上
    this.middleImg.src = middleImgSrc;
    // console.log(middleImgSrc);
	// 将大图的路径赋值到放大图的盒子的背景中
	this.bigBox.style.backgroundImage = bigImgSrc;
    // 将别人的active类名干掉，给自己添加active类名
    for(var i=0;i<this.smallImgs.length;i++){
        this.smallImgs[i].className = '';
    }
    smallImg.className = 'active';
	
}
// 实例化他
var enlarge = new Enlarge("product-left");

function getStyle(ele,attr){
    if(window.getComputedStyle){
        return window.getComputedStyle(ele)[attr];
    }else{
        return ele.currentStyle[attr];
    }
}
