//登录状态
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


// ajax请求数据
function Page(className){
    //获取列表页盒子
    this.box = document.querySelector('.' + className);
    //获取按钮
    this.first =  this.box.querySelector('.first');
    this.last =  this.box.querySelector('.last');
    this.pre =  this.box.querySelector('.pre');
    this.next =  this.box.querySelector('.next');
    this.number = this.box.querySelector('.pager-number');
    // 下标
    this.index = 0;
    // 页码
    this.k = 1;
    //页数
    this.default = 0;
    this.type = null;
}
Page.prototype.init = function(){
    this.herf();
    this.getData();
    this.pageBtn();
}
//通过地址栏信息判断从何处链接点进来的
Page.prototype.herf = function(){
    var i = window.location.search;
    this.type = i.split('=')[1];
}
Page.prototype.getData = function(){
    // 创建页码
    // this.default = Math.ceil(res.length/20);
    //ajax
    var list = $('.pro-list ul');
    var str = '';
    $.post("http://localhost/VMALL/src/PHP/list.php",
        {type:this.type},
        (res)=>{
            str = '';
            var page1 = res.slice(this.k-1,this.k*20)
            for(var i = 0;i<page1.length;i++){
                str += `
                    <li>
                        <div class="pro-panels">
                            <a href="detail.html?sku=${page1[i].sku}">
                                <p class="p-img">
                                    <img src="${page1[i].imgpath}" />
                                </p>
                                <p class="p-name">
                                    ${page1[i].name}
                                </p>
                                <p class="p-price clear">
                                    <b>${page1[i].price}</b>
                                    <span>多款可选</span>
                                </p>
                                <p class="p-label">
                                    <span>${page1[i].promoLabels}</span>
                                </p>
                                <p class="p-comment">
                                    <em>
                                        <span>${page1[i].rateCount}</span>
                                        人评价
                                    </em>
                                    <em>
                                        <span>99</span>
                                        %好评
                                    </em>
                                </p>
                            </a>
                        </div>
                    </li>
                `;
            }    
            list.html(str);
        },'json'
    )
}
// 分页按钮
Page.prototype.pageBtn = function(){
    $('.pager ul').on('click','li',(e)=>{
        if(e.target == this.next){
            //下一页
            this.index++;
            if(this.index >= $('.pager-number span').length-1){
                this.index = $('.pager-number span').length-1
            }
            $('.pager-number span').eq(this.index).siblings().removeClass('active');
            $('.pager-number span').eq(this.index).addClass('active');
        }else if(e.target == this.pre){
            //上一页
            this.index--;
            if(this.index <= 0){
                this.index = 0
            }
            $('.pager-number span').eq(this.index).siblings().removeClass('active');
            $('.pager-number span').eq(this.index).addClass('active');
        }else if(e.target == this.first){
            //第一页
            this.index = 0;
            $('.pager-number span').eq(this.index).siblings().removeClass('active');
            $('.pager-number span').eq(this.index).addClass('active');
        }else if(e.target ==this.last){
            //最后页
            this.index = $('.pager-number span').length-1;
            $('.pager-number span').eq(this.index).siblings().removeClass('active');
            $('.pager-number span').eq(this.index).addClass('active');
        }
        this.k = $('.pager-number .active').text()-0;
        this.getData();
    })
}
var page = new Page('pagerlist')
page.init();



    
