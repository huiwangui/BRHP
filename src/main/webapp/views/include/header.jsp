<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<style type="text/css">
		body{
			font-family: 'Microsoft YaHei';
		}
		.nav{
			font-size: 16px !important;
		}
		.nav a:hover{
			color: white;
		}
		
	</style>

<div class="topBox"><!----------顶部------------->
    <div class="top">
        <span>欢迎访问黄岛区居民健康信息门户！</span>
        <ul>
            <li><a href="">APP下载</a></li>
            <li><a href="">微信公众号</a></li>
        </ul>
    </div>
</div>

<div class="logo"><!----------logo----------------->
    <img src="/BRHP/statics/image/ccc/logo2.png" alt="" class="logoMargin"/>
    <!--<iframe class="weather" name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=9" width="300" height="60" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>-->
    <ul>
        <c:choose>
	   		<c:when test="${sessionScope.userInSession!=null}">
	   			<li>
		            <img src="/BRHP/statics/image/ccc/login.png" alt="" style="position:relative;top:-2px"/>${sessionScope.userInSession.nickname}
		        </li>
		        <li style="cursor:pointer;" onclick="logout()">
		            <img src="/BRHP/statics/image/ccc/login.png" alt="" style="position:relative;top:-2px"/>注销
		        </li>
	   		</c:when>
	   		<c:otherwise>
	   			<li style="cursor:pointer;" onclick="goLogin()">
		            <img src="/BRHP/statics/image/ccc/login.png" alt="" style="position:relative;top:-2px"/>登陆
		        </li>
		        <li style="cursor:pointer;" onclick="goRegister()">
		            <img src="/BRHP/statics/image/ccc/register.png" alt="" style="position:relative;top:-2px"/>注册
		        </li>
	   		</c:otherwise>
	   	</c:choose>
    </ul>
</div>


<div class="navBox"><!-----------菜单----------------------->
    <div class="nav" >
          <ul>
            <li class=""><a href="/BRHP/index.jsp">首页</a></li>
            <li><a href="/BRHP/orgHospital/hospitalList">预约挂号</a></li>
            <li><a href="/BRHP/healthEdu/home">健康教育</a></li>
            <li><a href="">健康管理</a></li> 
            <li><a href="/BRHP/user/personalInfo">个人中心</a></li>
        </ul>
    </div>
</div>
<script type="text/javascript">
	/* $('.nav li').on('click',function(){
		$(this).addClass('nav_active').siblings().removeClass('nav_active');
	}).eq(0).click(); */

</script>


