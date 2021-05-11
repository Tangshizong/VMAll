// =============== 轮播图代码 ====================
var index = 0;
var timerId = null;
//右键
$('.banner-right-btn').click(function(){
    index++;
    if(index > 7){
        index=1
    }
    //console.log(index)
    $('.banner-img li').eq(index-1).stop().fadeIn(800);
    $('.banner-img li').eq(index-1).siblings().stop().fadeOut(800);
    $('.banner-dots span').eq(index-1).siblings().removeClass('banner-active');
    $('.banner-dots span').eq(index-1).addClass('banner-active');
})
//左键
$('.banner-left-btn').click(function(){
    index--;
    if(index < 0){
        index=6
    }
    //console.log(index)
    $('.banner-img li').eq(index-1).stop().fadeIn(800);
    $('.banner-img li').eq(index-1).siblings().stop().fadeOut(800);
    $('.banner-dots span').eq(index-1).siblings().removeClass('banner-active');
    $('.banner-dots span').eq(index-1).addClass('banner-active');
})
//小圆点
$('.banner-dots span').mouseover(function(){
    index = $(this).index();
    $('.banner-img li').eq(index).stop().fadeIn(800);
    $('.banner-img li').eq(index).siblings().stop().fadeOut(800);
    $(this).siblings().removeClass('banner-active');
    $(this).addClass('banner-active');
})
//自动
timerId = setInterval(function(){
    index++;
    if(index > 7){
        index=1
    }
    $('.banner-img li').eq(index-1).stop().fadeIn(800);
    $('.banner-img li').eq(index-1).siblings().stop().fadeOut(800);
    $('.banner-dots span').eq(index-1).siblings().removeClass('banner-active');
    $('.banner-dots span').eq(index-1).addClass('banner-active');
},3000)
//鼠标移入移出
$('.hot-banner').hover(function(){
    clearInterval(timerId)
},function(){
    timerId = setInterval(function(){
        index++;
        if(index > 7){
            index=1
        }
        //console.log(index)
        $('.banner-img li').eq(index-1).stop().fadeIn(800);
        $('.banner-img li').eq(index-1).siblings().stop().fadeOut(800);
        $('.banner-dots span').eq(index-1).siblings().removeClass('banner-active');
        $('.banner-dots span').eq(index-1).addClass('banner-active');
    },3000)
})
// 小轮播图代码
var sub = 0;
var timer = null;
//鼠标滑过圆点
$('.home-banner ol li').mouseover(function(){
    sub = $(this).index();
    $('.home-banner ul li').eq(sub).stop().fadeIn(300);
    $('.home-banner ul li').eq(sub).siblings().stop().fadeOut(300);
    $(this).siblings().removeClass('focus');
    $(this).addClass('focus');
})
//自动
timer = setInterval(function(){
    sub++;
    if(sub > 2){
        sub = 0;
    }
    $('.home-banner ul li').eq(sub).stop().fadeIn(800);
    $('.home-banner ul li').eq(sub).siblings().stop().fadeOut(800);
    $('.home-banner ol li').eq(sub).siblings().removeClass('focus');
    $('.home-banner ol li').eq(sub).addClass('focus');
},3000)
//鼠标移入
$('.home-banner').hover(function(){
    clearInterval(timer)
},function(){
    timer = setInterval(function(){
        sub++;
        if(sub > 2){
            sub = 0;
        }
        $('.home-banner ul li').eq(sub).stop().fadeIn(800);
        $('.home-banner ul li').eq(sub).siblings().stop().fadeOut(800);
        $('.home-banner ol li').eq(sub).siblings().removeClass('focus');
        $('.home-banner ol li').eq(sub).addClass('focus');
    },3000)
})

