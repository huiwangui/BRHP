<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>黄岛区居民健康门户</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
    <link rel="stylesheet" href="/BRHP/statics/css/hospitalLogin.css"/>
    <script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
</head>
<body>
<!--------logo-------->
<div class="logo">
    <img src="/BRHP/statics/image/ccc/logo2.png" alt="" class="logoMargin"/>
    <!--<iframe class="weather" name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=9" width="300" height="60" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>-->
    <ul>
        <li>
            <a href="/BRHP/index.jsp">返回首页</a>
        </li>
        <li>
            <a href="/BRHP/user/register" class="register">我要注册</a>
        </li>
    </ul>
</div>
<div class="background">
    <div class="box">
        <div class="left">
            <h1>黄岛区居民健康服务门户</h1>
            <h3>预约挂号 / 健康教育 / 健康管理</h3>
            <div class="white">
                <div><img src="/BRHP/statics/image/aaa/p7.png" alt=""/></div>
                <div><img src="/BRHP/statics/image/aaa/p6.png" alt=""/></div>
                <p>下载APP获取更多服务&nbsp微信扫一扫关注我们</p>
            </div>
        </div>
        <div class="right">
            <div class="right-width">
                <h2>用户登录</h2>
                <form action="">
                    <input type="text" class="text phone" placeholder="使用昵称/手机号码登录" value="${userName}" id="userName"/>
                    <input type="password" class="text password" placeholder="密码" value="${password}" id="password"/>
                    <label for=""><input type="checkbox" id="ifRememberPsw" value="1"/ style="position:relative; top:2px">记住密码</label><br/>
                    <input type="hidden" value="${beforeLoginUrl}" id="beforeLoginUrl">
                    <button type="button" class="submit" id="loginButton">登录</button>
                </form>
                <a href="">忘记密码？</a>
            </div>
        </div>
    </div>
</div>
<!-------底部--------->
<div class="bottom-box">
    <span>|</span>
    <span><a href="">版权声明</a></span>
    <span>|</span>
    <span><a href="">法律责任</a></span>
    <span>|</span>
    <span><a href="">隐私声明</a></span>
    <span>|</span>
    <span><a href="">联系我们</a></span>
    <span>|</span>
    <p>2009-2016&nbsp <a href="">山东省黄岛区卫生计生委</a>&nbsp备案号：心ICP备07057313号</p>
    <p>技术支持：亿阳信通股份有限公司</p>
</div>
<script type="text/javascript">
console.log($("#beforeLoginUrl").val())
	$("#loginButton").on('click',function(){
		$.ajax({
		    type: 'POST',
		    url: '/BRHP/user/userLogin' ,
		    data: {
		    	userName : $("#userName").val(),
		    	password : $("#password").val(),
		    	ifRememberPsw : $("#ifRememberPsw").val()
		    } ,
		    success: function(data){
		    	if(data.code == '200'){
		    		console.log($("#beforeLoginUrl").val())
		    		if($("#beforeLoginUrl").val() != null && $("#beforeLoginUrl").val() != '' && $("#beforeLoginUrl").val() != 'null'){
		    			window.location.href=$("#beforeLoginUrl").val();
		    		}else{
		    			window.location.href='/BRHP/index.jsp';
		    		}
		    	}else{
		    		layer.msg(data.msg);
		    	}
		    }
		});
	});
</script>
</body>
</html>