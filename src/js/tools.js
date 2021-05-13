//获取cookie的函数
function getCookie(key){
    var arr = document.cookie.split('; ')
    for(var i=0;i<arr.length;i++){
        var brr = arr[i].split('=')
        if(brr[0] === key){
            return brr[1]
        }
    }
}
// 设置cookie的函数
function setCookie(key,value,seconds,path='/'){
    var date = new Date()
    var time = date.getTime()-8*3600*1000+seconds*1000
    date.setTime(time)
    document.cookie = key+'='+value+';expires='+date+";path="+path;
}
// 删除cookie的函数
function removeCookie(key,path="/"){
    setCookie(key,null,-1,path)
}

//跨域函数封装
function jsonp(url,data,cb){
    // 将数据中的回调函数设置
    data.cb = 'cb'
    // 将回调函数传进来，放到window中，起了新名字叫cb
    window.cb = cb
    // 自定义创建script标签
    var script = document.createElement('script')
    // 处理数据和url
    var str = '?';
    var f = '';
    for(var attr in data){
        str += f + attr + '=' + data[attr]
        f = '&'
    }
    url += str
    // 设置src地址
    script.setAttribute('src',url)
    // 将script标签放到head中
    document.head.appendChild(script)
    // 将script标签删除
    document.head.removeChild(script)
}
//ajax函数封装
function sendAjax(obj){
    // 判断dataType是否传入
    if(!obj.dataType){
        obj.dataType = 'json'
    }
    // 判断类型
    if(obj.dataType.toLowerCase() !== 'xml' && obj.dataType!=='json' && obj.dataType!=='string'){
        throw new Error('dataType必须是xml或string或json')
    }
    // 判断请求方式是否传入
    if(!obj.method){
        obj.method = 'get'
    }
    // 判断是否非get和post
    if(obj.method.toLowerCase()!=='get' && obj.method.toLowerCase()!=='post'){
        throw new Error('请求方式必须是get或post')
    }
    // 判断是否传入url
    if(!obj.url){
        throw new Error('地址必填')
    }
    // 地址是否在字符串
    if(typeof obj.url !== 'string'){
        throw new Error('请传入正确的地址')
    }
    // 判断是否传入async
    if(obj.async === undefined){
        obj.async = true
    }
    // 判断是否异步的参数必须是布尔值
    if(typeof obj.async !== 'boolean'){
        // 抛出自定义错误
        throw new Error("async参数必须是布尔值")
    }
    // 定义最终数据变量
    var str = '';
    if(obj.data){
        // 判断传入的数据是字符串还是object
        if(typeof obj.data === 'object'){
            // 判断是否传入data
            if(obj.data){
                // 将data这个对象转为字符串
                var f = '';
                for(var attr in obj.data){
                    str += f + attr + '=' + obj.data[attr]
                    f = '&'
                }
            }
        }else if(typeof obj.data === 'string'){
            str = obj.data
        }else{
            throw new Error('数据必须是对象或字符串')
        }
        // 判断请求方式是否是get
        if(obj.method.toLowerCase() === 'get'){
            obj.url += '?'+str
        }
    }
    // 判断函数是否传入
    if(!obj.success){
        obj.success = function(){}
    }
    if(!obj.error){
        obj.error = function(){}
    }
    // 判断传入的fn类型是否是函数
    if(typeof obj.success !== 'function'){
        throw new Error("success必须是函数")
    }
    if(typeof obj.error !== 'function'){
        throw new Error("error必须是函数")
    }
    var xhr = new XMLHttpRequest()
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4){
            if(/^2\d{2}$/.test(xhr.status)){
                var res = '';
                switch(obj.dataType.toLowerCase()){
                    case 'string':
                        res = xhr.responseText;
                    break;
                    case 'json':
                        res = xhr.responseText;
                        res = JSON.parse(res)
                    break;
                    case "xml":
                        res = xhr.responseXML;
                    break;
                }
                obj.success(res)
            }else{
                // 处理失败
                obj.error()
            }
        }
    }
    xhr.open(obj.method,obj.url,obj.async)
    // 判断数据是否存在，再判断是否是post请求才能设置请求头
    if(obj.data){
        if(obj.method.toLowerCase() === 'post'){
            // 设置请求头
            xhr.setRequestHeader('content-type','application/x-www-form-urlencoded')
            xhr.send(str)
            return false;
        }
    }
    xhr.send()
}
// 简单运动封装的函数
    function animate(ele,obj,fn){
        //为保证作用域，使用let关键字创建计数器，k计算循环的次数，n计算定时器运行次数
        let k = 0;
        let n = 0;
        //遍历对象，将对象的键赋值给attr   也就是要变化的属性名
        for(let attr in obj){

            //计数器自增,k==对象的长度
            k++;

            //设置定时器
            let timerid = setInterval(function(){

                //将对象的值赋值给 target  也就是要变化的属性值
                let target = obj[attr];

                //使用下面的获取样式函数将属性值赋给 currentStyle  也就是初始值
                let currentStyle = getStyle(ele,attr);

                //如果属性名为opacity  则将它的值放大100倍以便计算
                if(attr === 'opacity'){
                    target *= 100;
                    currentStyle *=100;
                }

                //获取到的属性值为字符串，将其转换为数字以便参与计算
                currentStyle = parseInt(currentStyle);

                //定义变化的速度======（变化后的值-初始值）= 变化了多少/30  赋值给speed
                let speed = (target-currentStyle)/20;

                /*但是这个速度永远达不到目标，只能无限贴近于目标，因为最后是小数
                解决方法：将其取整变为整数*/

                //正小数向上取整，负小数向下取整
                if(speed>0){
                    //向上取整
                    speed = Math.ceil(speed);
                }else{
                    //向下取整
                    speed = Math.floor(speed);
                }
                //初始值增加====将每次变化的值叠加给初始值
                currentStyle += speed;
                //限制变化的终点，判断当元素初始值等于最终值时进行操作
                if(currentStyle === target){
                    //判断变化的属性是谁
                    if(attr === 'opacity'){
                        //如果变化的属性时opacity,则将结果/100再赋值给它
                        ele.style[attr] = currentStyle/100;
                    }else{
                        //如果是其他属性，则直接将每次变化后的值传递给它
                        ele.style[attr] = currentStyle + 'px';
                    }
                    //当元素初始值等于最终值时====将最终的值赋给初始值
                    currentStyle = target;

                    //当元素初始值等于最终值时=====停止定时器
                    clearInterval(timerid);

                    //每次到达终点后n自加1，用于保存定时器运行次数
                    n++;
                    //当对象的长度===定时器运行次数时，调用fn函数
                    //fn()就是本函数的第三个参数
                    if(k===n){
                        fn()
                    }
                }else{
                    if(attr === 'opcity'){
                        ele.style[attr] = currentStyle/100;
                    }else{
                        ele.style[attr] = currentStyle + "px";
                    }
                }
             },20)
         }
    }

// 获取样式的函数
function getStyle(ele,attr){
    if(window.getComputedStyle){
        return window.getComputedStyle(ele)[attr]
    }else{
        return ele.currentStyle[attr]
    }
}

