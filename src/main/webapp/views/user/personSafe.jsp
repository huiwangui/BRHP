<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人安全</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
<link rel="stylesheet" href="/BRHP/statics/css/pstyle.css"/>
<link rel="stylesheet" href="/BRHP/statics/css/person.css"/>
<link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
<script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
<script type="text/javascript" src="/BRHP/statics/js/md5.js"></script>
<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
<script type="text/javascript" src="/BRHP/statics/layui/layui.js"></script>
</head>
<body>

<%@ include file="../include/header.jsp"%>
<div class="message-box">
		   <div class="left-msg">
		        <ul>
		            <li>
		                <a  href="/BRHP/user/personalInfo">
		                    <img src="/BRHP/statics/image/bbb/Personal_information.png" alt=""/>
		                    <span>用户首页</span>
		                </a>
		            </li>
		            <li>
		                <a href="/BRHP/user/changePersonInfo">
		                    <img src="/BRHP/statics/image/bbb/files.png" alt=""/>
		                    <span>修改/完善资料</span>
		                </a>
		            </li>
		            <li>
		                <a href="/BRHP/user/userOrders">
		                    <img src="/BRHP/statics/image/bbb/order.png" alt=""/>
		                    <span>我的预约</span>
		                </a>
		            </li>
		            <li>
		                <a href="/BRHP/user/userPatients">
		                    <img src="/BRHP/statics/image/bbb/Patient.png" alt=""/>
		                    <span>就诊人管理</span>
		                </a>
		            </li>
		            <li>
		                <a href="/BRHP/user/userSafe" class="current">
		                    <img src="/BRHP/statics/image/bbb/safe_blue.png" alt=""/>
		                    <span>安全设置</span>
		                </a>
		            </li>
		            <li>
		                <a href="">
		                    <img src="/BRHP/statics/image/bbb/message.png" alt=""/>
		                    <span>我的消息</span>
		                </a>
		            </li>
		            <li>
		                <a href="">
		                    <img src="/BRHP/statics/image/bbb/feedback.png" alt=""/>
		                    <span>投诉反馈</span>
		                </a>
		            </li>
		        </ul>
		    </div>
		    <div class="right_msg">
			    	<div class="h">
			        		你好，欢迎来到会员中心
			        </div>
		        <div class="msg_p clearfix">
		        	<div class="pws_change">
		        		<form action="">
		        			<div class="form_group1">
		        				<label for="">姓名：</label><span style="margin-left: 4px;">${sessionScope.userInSession.nickname}</span>
		        			</div>
		        			<div class="form_group1">
		        				<label for="">原密码：</label> 
		        				<input type="password" name="" id="oldPsw" value="" />
		        			</div>
		        			<div class="form_group1">
		        				<label for="">新密码：</label> 
		        				<input type="password" name="" id="newPsw" value="" />
		        				<div class="prompt">
		        					请输入6-16位新密码(字母、数字、横线)区分大小写
		        				</div>
		        			</div>
		        			<div class="form_group1">
		        				<label for="">新密码：</label> 
		        				<input type="password" name="" id="reNewPsw" value="" />
		        			</div>
		        			<div class="form_group1">
		        				<a href="javascript:;"  onclick="changePsw()" class="save_htn">保存修改</a>
		        			</div>
		        		</form>
		        	</div>
		   	    </div>    	
			</div>
		</div>
		
<script type="text/javascript">
function changePsw(){
	 var oldPsw = $.trim($("#oldPsw").val());
     var newPsw = $.trim($("#newPsw").val());
     var reNewPsw  = $.trim($("#reNewPsw").val());

     if(oldPsw=="" || oldPsw=="undefined"){
         $("#oldPsw").css('display', 'inline-block');
         layer.tips('请输入密码', '#oldPsw');
         return false;
     }else if(newPsw=="" || newPsw=="undefined"){
         $("#newPsw").css('display', 'inline-block');
         
         layer.tips('新密码不能为空', '#newPsw');
         
         
         return false;
     }else if(reNewPsw=="" || reNewPsw=="undefined"){
         $("#reNewPsw").css('display', 'inline-block');
         layer.tips('请再次输入新密码', '#reNewPsw');
         return false;
     }else{
    	 if(hex_md5(oldPsw) != "${sessionScope.userInSession.password}"){
   		  layer.msg('原密码错误！');
   		  return;
   	      }
    	 if($("#newPsw").val() != $("#reNewPsw").val()){
				layer.msg('两次输入的密码不一致，请重新输入！');
				return
		  }
    	 $.ajax({
				type : 'POST',
				url : '/BRHP/user/changePassword',
				data : {
					newPassword : $("#newPsw").val()
				},
				success : function(data) {
					if (data.code == '200') {
						layer.msg('修改成功，3秒钟后将跳转至登录页面，请重新登录！');
						setTimeout(function(){
			    			window.location.href='/BRHP/user/goLogin';
			    		},3000);
					} else {
						layer.msg(data.msg);
					}
				}
			});
     }	
	
	
	
}


</script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>