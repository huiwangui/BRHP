<%@page import="com.boco.common.utils.PropertiesUtils"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
 <meta charset="utf-8">
  <title>修改个人信息</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
   <link rel="stylesheet" href="/BRHP/statics/webuploader/webuploader.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/person.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/pstyle.css"/>
  <script type="text/javascript" src="/BRHP/statics/layui/layui.js"></script>
  <script type="text/javascript" src="/BRHP/statics/webuploader/webuploader.js"></script>
  <% String webServerIp=PropertiesUtils.getValue("ftp_web_server_ip"); %>
  
	</head>
<style>	
.webuploader-pick{
background:#fec009 !important;
}
input{
	line-height:30px;
}
.webuploader-pick:hover{
background:red !important;
}
</style>


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
		                <a href="/BRHP/user/changePersonInfo" class="current">
		                    <img src="/BRHP/statics/image/bbb/files1.png" alt=""/>
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
		                <a href="/BRHP/user/userSafe">
		                    <img src="/BRHP/statics/image/bbb/safe_black.png" alt=""/>
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
		        <div class="msg_p3 clearfix">
		        	<div class="c">
		        		<div class="l">
		        			<img src="<%=webServerIp%>${sessionScope.userInSession.img}" alt="" />
		        			<div class="clear mt10"></div>
		        			<!-- <p>
		        				<a href="/" class="file_btn">选择文件</a>
		        				<input type="file" name="" id="" value="" hidden=""/>
		        				<a href="/" class="upload">upload</a>
		        			</p> -->
		        			    <div id="uploader-demo">
							    <!--用来存放item-->
								    <div id="fileList" class="uploader-list"></div>
								    <div id="filePicker">选择图片</div>
							    </div>
		        		</div>
		        		<div class="r">
		        			<form action="">
		        				<div class="form_group1">
		        					<label for=""> 昵称：</label>
		        					<input type="text" name="" id="nickname" value="${sessionScope.userInSession.nickname}" />
		        				</div>
		        				<div class="form_group1">
		        					<label for=""> 姓名：</label>
		        					<input type="text" name="" id="name" value="${sessionScope.userInSession.name}" />
		        				</div>
		        				<div class="form_group1">
		        					<label for=""> 邮箱：</label>
		        					<input type="text" name="" id="email" value="${sessionScope.userInSession.email}" />
		        				</div>
		        				<div class="form_group1">
		        					<label > 性别：</label>
									<c:choose>
										  <c:when test="${'1' eq sessionScope.userInSession.sex}">
										      <label>
										           <input type="radio" name="sex"  value="1" style="position: relative;top: 2px;" checked="checked"/> 男
										    </label>	
										  </c:when>
										  <c:otherwise>
										      <label>
										            <input type="radio" name="sex"  value="1"  style="position: relative;top: 2px;"/> 男
										      </label>	
										  </c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${'2' eq sessionScope.userInSession.sex}">
										  <label>
										   <input type="radio" name="sex"  value="2" style="position: relative;top: 2px;" checked="checked"/> 女
											</label>	
										</c:when>
										<c:otherwise>
										   <label>
										   <input type="radio" name="sex"  value="2" style="position: relative;top: 2px;"/> 女
										   </label>	
										</c:otherwise>
									</c:choose>
                       
		        				</div>
		        				<div class="form_group1">
		        					<label for=""> 出生日期：</label>
		        					<%-- <input type="text" name="" id="dateOfBirthStr" value="${sessionScope.userInSession.age}" /> --%>
		        					 <input id="dateOfBirthStr" lay-verify="date" autocomplete="off"  onclick="layui.laydate({elem: this})" type="text" value="${sessionScope.userInSession.dateOfBirthStr}">
		        				</div>
		        				<div class="form_group1">
		        					<label for=""> 身份证：</label>
		        					<input type="text" name="" id="idCard" value="${sessionScope.userInSession.idCard}" />
		        				</div>
		        				<div class="form_group1">
		        					<label for=""> 手机：</label>
		        					<input type="text" name="" id="mobile" value="${sessionScope.userInSession.mobile}" />
		        				</div>
								<div class="form_group1 mt20">
		        					<a  id="saveButton"  class="save_btn" href="javascript:;">保存修改</a>
		        				</div>
		        			</form>
		        		</div>
		        	</div>
		        </div>
		        
		    </div>
		</div>
		<%@ include file="../include/footer.jsp"%>
		
	</body>
	<script type="text/javascript">
	var uploader = WebUploader.create({
	    // 选完文件后，是否自动上传。
	    auto: true,
	    // swf文件路径
	    swf: '/BRHP/statics/webuploader/Uploader.swf',
	    // 文件接收服务端。
	    server: '/BRHP/user/uploadImg',
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: '#filePicker',
	    // 只允许选择图片文件。
	    accept: {
	        title: 'Images',
	        extensions: 'gif,jpg,jpeg,bmp,png',
	        mimeTypes: 'image/*'
	    }
	});
	uploader.on( 'fileQueued', function( file ) {
	    // 创建缩略图
	    // 如果为非图片文件，可以不用调用此方法。
	    // thumbnailWidth x thumbnailHeight 为 100 x 100
	    uploader.makeThumb( file, function( error, src ) {
	        if ( error ) {
	            $img.replaceWith('<span>不能预览</span>');
	            return;
	        }
			$("#headImg").attr( 'src', src );
	        //$img.attr( 'src', src );
	    }, 100, 100 );
	});
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
		layer.msg('头像上传成功！');
	});

	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		layer.msg('头像上传失败！');
	});
	</script>
	


<script src="//res.layui.com/layui/build/layui.js" charset="utf-8"></script>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form()
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
});

//表单验证开始
$.ajaxSetup({
  async: false
  });
$("#nickname").blur(function(){
		$.ajax({
		    type: 'GET',
		    url: '/BRHP/user/updateCheck' ,
		    data: {
		    	nickname : $("#nickname").val()
		    } ,
		    success: function(data){
		    	if(data.code != '200'){
		    		layer.tips(data.msg, '#nickname', {time: 3000,tipsMore: true});
		    	}
		    }
		});
	});
	$("#idCard").blur(function(){
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		if(reg.test($("#idCard").val()) === true){
			$.ajax({
			    type: 'GET',
			    url: '/BRHP/user/updateCheck' ,
			    data: {
			    	idCard : $("#idCard").val()
			    } ,
			    success: function(data){
			    	if(data.code != '200'){
			    		layer.tips(data.msg, '#idCard', {time: 3000,tipsMore: true});
			    	}
			    }
			});
		}else{
			layer.tips('请输入正确的证件号码', '#idCard', {time: 3000,tipsMore: true});
		}
	});
	$("#mobile").blur(function(){
		var reg = /^1[3|4|5|7|8]\d{9}$/;
		if(reg.test($("#mobile").val()) === true){
			$.ajax({
			    type: 'GET',
			    url: '/BRHP/user/updateCheck' ,
			    data: {
			    	mobile : $("#mobile").val()
			    } ,
			    success: function(data){
			    	if(data.code != '200'){
			    		layer.tips(data.msg, '#mobile', {time: 3000,tipsMore: true});
			    	}
			    }
			});
		}else{
			layer.tips('请输入正确的电话号码', '#mobile', {time: 3000,tipsMore: true});
		}
	});
	
	$("#saveButton").on('click',function(){
		var submitFlag = 1;
		if($("#name").val() == null || $("#name").val() == ''){
			submitFlag = 0;
			layer.tips('请输入姓名', '#name', {time: 3000,tipsMore: true});
		}
		if($("#nickname").val() == null || $("#nickname").val() == ''){
			submitFlag = 0;
			layer.tips('请输入昵称', '#nickname', {time: 3000,tipsMore: true});
		}else{
			$.ajax({
			    type: 'GET',
			    url: '/BRHP/user/updateCheck' ,
			    data: {
			    	nickname : $("#nickname").val()
			    } ,
			    success: function(data){
			    	if(data.code != '200'){
			    		submitFlag = 0;
			    		layer.tips(data.msg, '#nickname', {time: 3000,tipsMore: true});
			    	}
			    }
			});
		}
		if($("#idCard").val() == null || $("#idCard").val() == ''){
			submitFlag = 0;
			layer.tips('请输入证件号码', '#idCard', {time: 3000,tipsMore: true});
		}else{
			var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			if(reg.test($("#idCard").val()) === true){
				$.ajax({
				    type: 'GET',
				    url: '/BRHP/user/updateCheck' ,
				    data: {
				    	idCard : $("#idCard").val()
				    } ,
				    success: function(data){
				    	if(data.code != '200'){
				    		submitFlag = 0;
				    		layer.tips(data.msg, '#idCard', {time: 3000,tipsMore: true});
				    	}
				    }
				});
			}else{
				submitFlag = 0;
				layer.tips('请输入正确的证件号码', '#idCard', {time: 3000,tipsMore: true});
			}
		}
		console.debug(submitFlag);
		if($("#mobile").val() == null || $("#mobile").val() == ''){
			submitFlag = 0;
			layer.tips('请输入手机号', '#mobile', {time: 3000,tipsMore: true});
		}else{
			var reg = /^1[3|4|5|7|8]\d{9}$/;
			if(reg.test($("#mobile").val()) === true){  
				$.ajax({
				    type: 'GET',
				    url: '/BRHP/user/updateCheck' ,
				    data: {
				    	mobile : $("#mobile").val()
				    } ,
				    success: function(data){
				    	if(data.code != '200'){
				    		submitFlag = 0;
				    		layer.tips(data.msg, '#mobile', {time: 3000,tipsMore: true});
				    	}
				    }
				});
			}else{
				submitFlag = 0;
				layer.tips('请输入正确的手机号', '#mobile', {time: 3000,tipsMore: true});
			}
		}
	
		if(submitFlag === 1){
			$.ajax({
			    type: 'POST',
			    url: '/BRHP/user/updateSave' ,
			    data: {
			    	name : $("#name").val(),
			    	nickname : $("#nickname").val(),
			    	credentialsType : $("#credentialsType").val(),
			    	idCard : $("#idCard").val(),
			    	password : $("#password").val(),
			    	mobile : $("#mobile").val(),
			    	sex : $("input[name=sex]:checked").val(),
			    	dateOfBirthStr : $("#dateOfBirthStr").val()
			    } ,
			    success: function(data){
			    	if(data.code == '200'){
			    		var index = parent.layer.getFrameIndex(window.name);
			    		parent.layer.msg('修改成功！');
			    		setTimeout(function(){
			    			parent.window.location.href='/BRHP/user/personalInfo';
			    		},1000);
			    	}else{
			    		layer.msg(data.msg);
			    	}
			    }
			});
		}
	});
</script>


	
</html>
