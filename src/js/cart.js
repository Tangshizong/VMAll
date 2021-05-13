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
        $('.login-prompt').css('display','block');
        $('.sc-list').css('display','none');
        $('.sc-empty').css('display','block');
      }, function(){
        layer.msg('取消退出', {
          time: 500, //0.5s后自动关闭
        });
      });
})
//判断是否登录
if(getCookie('username')){
    $('.login-prompt').css('display','none');
    $('.sc-list').css('display','block');
    $('.sc-empty').css('display','none');
}else{
    $('.login-prompt').css('display','block');
    $('.sc-list').css('display','none');
    $('.sc-empty').css('display','block');
}

//加载购物车中商品
$.post("http://localhost/VMALL/src/PHP/cart.php",
    {username:getCookie('username')},
    (res)=>{
        // console.log(res)
        var str = '';
        var total = 0;
        var data = res.data;
        var dataCart = res.dataCart;
        for(var i = 0;i<data.length;i++){
            str +=`
                <tr>
                    <td><input type="checkbox" class="ckd"></th></td>
                    <td class="stock-info">
                        <img src="${data[i].imgpath}" alt="">
                        <p>${data[i].skuName}</p>
                    </td>
                    <td class="stock-price">
                        ￥ <i>${data[i].price}</i>
                    </td>
                    <td>
                        <div class="stock-area">
                            <input type="number" name="${data[i].sku}" class="stock-text" value="${dataCart[i].number}" >
                            <div class="stock-btn">
                                <a href="javascript:;" class="add" name="${data[i].sku}"  index="${data[i].price}">-</a>
                                <a href="javascript:;" class="less" name="${data[i].sku}" index="${data[i].price}">+</a>
                            </div>
                        </div>
                    </td>
                    <td class="stock-subtotal">
                        ￥<i> ${data[i].price*dataCart[i].number}</i>
                    </td>
                    <td class="stock-del" name="${data[i].sku}">
                        删除
                    </td>
                </tr>
                `
            total += data[i].price*dataCart[i].number;
        }
        $('.sc-pro-title table tbody').html(str);
        $('.total div span').text(total);
        //点击加减号修改数量并更新数据库
        $('.stock-btn').click(function(e){
            var subtotal = null;
            var numb = $(this).prev().val()-0;
            var names = $(this).prev().attr('name');
            var pri = $(this).children().attr('index')-0;
            subtotal = pri*numb
            if(e.target.innerText == '+'){
                numb++
                $(this).prev().val(numb);
                $(this).parent().parent().next().children().text(subtotal);
                //总价未写
                // $('.total div span').text(subtotal);
            }else if(e.target.innerText == '-'){
                numb--
                if(numb <= 1){
                    numb = 1
                }
                console.log(numb);
                $(this).prev().val(numb);
                $(this).parent().parent().next().children().text(subtotal);
            }
            $.post("http://localhost/VMALL/src/PHP/number.php",
                {number:numb,sku:names}
            )
        })
        //点击全选
        $('.allchecked').click(function(){
            $('.ckd').prop('checked',true);
            $('.allchecked').prop('checked',true);
            
        })
        //点击单选
        $('.ckd').click(function(){
            var arr = Array.prototype.slice.call($('.ckd'));
            var bool = arr.every(checkbox=>checkbox.checked)
            console.log(bool);
            $('.allchecked').prop('checked',bool);
        })
        //点击删除
        $('.stock-del').click(function(){
            //询问框
            var sku = $(this).attr('name');
            console.log(sku)
            layer.confirm('确认要删除此商品吗？', {
                btn: ['确定','取消'] //按钮
            }, ()=>{
                $(this).parent().remove();
                $.post("http://localhost/VMALL/src/PHP/removecart.php",
                {sku:sku},
                (arr)=>{
                    console.log(arr);
                },'json')
                // console.log($(this))
                layer.msg('删除成功', {icon: 1});
            }, function(){
                layer.msg('取消删除', {
                time: 500, //0.5s后自动关闭
                });
            });
        })
    },'json'
)


