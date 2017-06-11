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
    <link rel="stylesheet" href="/BRHP/statics/css/hosRegister.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
	<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
</head>
<body>

<%@ include file="../include/header.jsp"%>


<!-------------注册-------------------->
<div class="register-box">
    <form action="" method="post">
        <div class="box">
            <div class="left">
                <!--信息填写-->
                <label>姓名：</label>
                <input type="text" class="size" id="name"/><br/>
                <label>昵称：</label>
                <input type="text" class="size" id="nickname"/><br/>
                <label>证件类型：</label>
                <select id="credentialsType">
                    <option value="">证件类型</option>
                    <option value="10">身份证</option>
                </select><br/>
                <label>证件号码：</label>
                <input type="text" class="size" id="idCard"/><br/>
                <label>性别：</label>
                <input type="radio" name="sex" value="1" checked="checked"/><label class="man">男</label><input type="radio" name="sex" value="2"/><label>女</label><br/>
                <label>设置密码：</label>
                <input type="password" class="size" placeholder="6-12位数字或字母" id="password"/><br/>
                <label>确认密码：</label>
                <input type="password" class="size" id="repassword"/><br/>
                <label>手机号：</label>
                <input type="text" class="size" id="mobile"/><br/>
                <label>验证码：</label>
                <input type="text" class="size2" id="smscode"/><input type="button" id="smsbtn" value="获取验证码" class="size2 tel"/><br/>
            </div>
            <div class="right">
                <!--注意事项-->
                <h4>注意事项</h4>
                <p>1、以下信息是您登陆网站的身份信息，请慎重填写；</p>
                <p>2、一个证件号码只能注册一个用户，居民身份证只能使用18位的二代身份证号码；</p>
                <p>3、带*号的选项为必填项；</p>
                <p>4、网站注册需要通过手机验证，若您点击获取短信验证码后未收到短信，请在120秒后重试；</p>
                <p>5、若有疑问，请咨询96166或参考用户注册指南；</p>
            </div>
        </div>
        <input type="checkbox" class="agreement"/><label class="agreement-size">用户协议：我已仔细阅读并接受<a href="">《黄岛区居民健康协议》</a></label><br/>
        <button type="button" class="submit" id="saveButton">注册</button><input type="reset" value="重置" class="reset"/>
    </form>

</div>

<%@ include file="../include/footer.jsp"%>
<script type="text/javascript">
$.ajaxSetup({
	  async: false
	  });

	$("#nickname").blur(function(){
		$.ajax({
		    type: 'GET',
		    url: '/BRHP/user/registerCheck' ,
		    data: {
		    	nickname : $("#nickname").val()
		    } ,
		    success: function(data){
		    	if(data.code != '200'){
		    		layer.tips(data.msg, '#nickname', {time: 3000,tipsMore: true});
		    		submitFlag = 0;
		    	}
		    }
		});
	});
	$("#idCard").blur(function(){
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		if(reg.test($("#idCard").val()) === true){
			$.ajax({
			    type: 'GET',
			    url: '/BRHP/user/registerCheck' ,
			    data: {
			    	idCard : $("#idCard").val()
			    } ,
			    success: function(data){
			    	if(data.code != '200'){
			    		layer.tips(data.msg, '#idCard', {time: 3000,tipsMore: true});
			    		submitFlag = 0;
			    	}
			    }
			});
		}else{
			layer.tips('请输入正确的证件号码', '#idCard', {time: 3000,tipsMore: true});
			submitFlag = 0;
		}
	});
	$("#mobile").blur(function(){
		var reg = /^1[3|4|5|7|8]\d{9}$/;
		if(reg.test($("#mobile").val()) === true){
			$.ajax({
			    type: 'GET',
			    url: '/BRHP/user/registerCheck' ,
			    data: {
			    	mobile : $("#mobile").val()
			    } ,
			    success: function(data){
			    	if(data.code != '200'){
			    		layer.tips(data.msg, '#mobile', {time: 3000,tipsMore: true});
			    		submitFlag = 0;
			    	}
			    }
			});
		}else{
			layer.tips('请输入正确的电话号码', '#mobile', {time: 3000,tipsMore: true});
			submitFlag = 0;
		}
	});
	//发送验证码
	$("#smsbtn").on('click',function(){
		//先验证手机号码
		var reg = /^1[3|4|5|7|8]\d{9}$/;
		if(reg.test($("#mobile").val()) === true){
			//服务器验证是否被注册
			var checkvar=0;
				$.ajax({
			    type: 'GET',
			    url: '/BRHP/user/registerCheck' ,
			    data: {
			    	mobile : $("#mobile").val()
			    } ,
			    success: function(data){
			    	if(data.code != '200'){
			    		layer.tips(data.msg, '#mobile', {time: 3000,tipsMore: true});
			    		submitFlag = 0;
			    	}else{
			    		checkvar=1;
			    	}
			    	
			    },
			    error:function(){
			    	submitFlag = 0;
			    	checkvar=0;
			    }
			  });
			if(checkvar==1){
				 $.ajax({
					   url:"/BRHP/user/smsCode",
					   type:"GET",
					   data:{
						   mobile:$('#mobile').val()
					   },
					   success:function(data){
				    	  if(data.code!='200'){
				    		  layer.tips(data.msg,'#smsbtn',{time:3000,tipsMore:true});
				              submitFlag=0;
				    	  }else{
				    		  layer.tips('验证码发送成功，请输入正确的验证码','#smsbtn',{time:3000,tipsMore:true});
				    	  }
				       }
				    })
			}
		 }else{
			layer.tips('请输入正确的电话号码', '#mobile', {time: 3000,tipsMore: true});
			submitFlag = 0;
		 }
	 })
	
	$("#saveButton").on('click',function(){
		var submitFlag = 1;
		if($("#name").val() == null || $("#name").val() == ''){
			layer.tips('请输入姓名', '#name', {time: 3000,tipsMore: true});
			submitFlag = 0;
		}
		if($("#nickname").val() == null || $("#nickname").val() == ''){
			layer.tips('请输入昵称', '#nickname', {time: 3000,tipsMore: true});
			submitFlag = 0;
		}else{
			$.ajax({
			    type: 'GET',
			    url: '/BRHP/user/registerCheck' ,
			    data: {
			    	nickname : $("#nickname").val()
			    } ,
			    success: function(data){
			    	if(data.code != '200'){
			    		layer.tips(data.msg, '#nickname', {time: 3000,tipsMore: true});
			    		submitFlag = 0;
			    	}
			    }
			});
		}
		if($("#idCard").val() == null || $("#idCard").val() == ''){
			layer.tips('请输入证件号码', '#idCard', {time: 3000,tipsMore: true});
			submitFlag = 0;
		}else{
			var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			if(reg.test($("#idCard").val()) === true){
				$.ajax({
				    type: 'GET',
				    url: '/BRHP/user/registerCheck' ,
				    data: {
				    	idCard : $("#idCard").val()
				    } ,
				    success: function(data){
				    	if(data.code != '200'){
				    		layer.tips(data.msg, '#idCard', {time: 3000,tipsMore: true});
				    		submitFlag = 0;
				    	}
				    }
				});
			}else{
				layer.tips('请输入正确的证件号码', '#idCard', {time: 3000,tipsMore: true});
				submitFlag = 0;
			}
		}
		if($("#password").val() == null || $("#password").val() == ''){
			layer.tips('请输入密码', '#password', {time: 3000,tipsMore: true});
			submitFlag = 0;
		}else{
			if($("#password").val().length <6 || $("#password").val().length > 12){
				layer.tips('请输入6-12位数字或字母', '#password', {time: 3000,tipsMore: true});
				submitFlag = 0;
			}
		}
		if($("#repassword").val() == null || $("#repassword").val() == ''){
			layer.tips('请再次输入密码', '#repassword', {time: 3000,tipsMore: true});
			submitFlag = 0;
		}
		if($("#mobile").val() == null || $("#mobile").val() == ''){
			layer.tips('请输入手机号', '#mobile', {time: 3000,tipsMore: true});
			submitFlag = 0;
		}else{
			var reg = /^1[3|4|5|7|8]\d{9}$/;
			if(reg.test($("#mobile").val()) === true){  
				$.ajax({
				    type: 'GET',
				    url: '/BRHP/user/registerCheck' ,
				    data: {
				    	mobile : $("#mobile").val()
				    } ,
				    success: function(data){
				    	if(data.code != '200'){
				    		layer.tips(data.msg, '#mobile', {time: 3000,tipsMore: true});
				    		submitFlag = 0;
				    	}
				    }
				});
			}else{
				layer.tips('请输入正确的手机号', '#mobile', {time: 3000,tipsMore: true});
			}
		}
		if($("#repassword").val() != $("#password").val()){
			layer.tips('两次输入的密码不统一，请重新输入', '#repassword', {time: 3000,tipsMore: true});
			submitFlag = 0;
		}
		//验证码 验证
		if($("#smscode").val() == null || $("#smscode").val() == ''){
			layer.tips('验证码不能为空', '#smscode', {time: 3000,tipsMore: true});
			submitFlag = 0;
		}else{
			$.ajax({
			    type: 'GET',
			    url: '/BRHP/user/valiCode' ,
			    data: {
			    	code : $("#smscode").val(),
			    	mobile : $("#mobile").val()
			    } ,
			    success: function(data){
			    	if(data.code != '200'){
			    		layer.tips(data.msg, '#smscode', {time: 3000,tipsMore: true});
			    		submitFlag = 0;
			    	}
			    },
			    error: function(){
			    	layer.tips("验证失败请重新获取验证码！", '#smscode', {time: 3000,tipsMore: true});
			    		submitFlag = 0;
			    	}
			    
			});
			
		}
		if(submitFlag == 1){
			$.ajax({
			    type: 'POST',
			    url: '/BRHP/user/registerSave' ,
			    data: {
			    	name : $("#name").val(),
			    	nickname : $("#nickname").val(),
			    	credentialsType : $("#credentialsType").val(),
			    	idCard : $("#idCard").val(),
			    	password : $("#password").val(),
			    	mobile : $("#mobile").val(),
			    	sex : $("input[name=sex]:checked").val()
			    } ,
			    success: function(data){
			    	if(data.code == '200'){
			    		layer.msg('注册成功！3秒后将跳转至登录页面');
			    		setTimeout(function(){
			    			window.location.href='/BRHP/user/goLogin';
			    		},3000);
			    	}else{
			    		layer.msg(data.msg);
			    	}
			    }
			});
		}
	});
	
	
</script>
</body>
</html>