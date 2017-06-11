<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>修改个人信息</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body>
          
              
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px; margin-right: 20px;">
  <legend>修改个人信息</legend>
</fieldset>
 
<form class="layui-form layui-form-pane" action="" style="margin-left: 20px; margin-right: 20px;">
  
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-inline">
      <input lay-verify="" id="name" autocomplete="off" class="layui-input" type="text" value="${sessionScope.userInSession.name}">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">昵称</label>
    <div class="layui-input-inline">
      <input lay-verify="" id="nickname" autocomplete="off" class="layui-input" type="text" value="${sessionScope.userInSession.nickname}">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">证件类型</label>
    <div class="layui-input-inline">
      <select id="credentialsType" lay-filter="">
        <option value="">--请选择--</option>
        <option value="10" <c:if test="${'10' eq sessionScope.userInSession.credentialsType}">selected</c:if> >居民身份证</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">证件号码</label>
    <div class="layui-input-inline">
      <input id="idCard" lay-verify="" placeholder="" autocomplete="off" class="layui-input" type="text" value="${sessionScope.userInSession.idCard}">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
    	<c:choose>
    		<c:when test="${'1' eq sessionScope.userInSession.sex}">
    			<input name="sex" value="1" title="男" type="radio" checked="checked">
    		</c:when>
    		<c:otherwise>
    			<input name="sex" value="1" title="男" type="radio">
    		</c:otherwise>
    	</c:choose>
    	<c:choose>
    		<c:when test="${'2' eq sessionScope.userInSession.sex}">
    			<input name="sex" value="2" title="女" type="radio" checked="checked">
    		</c:when>
    		<c:otherwise>
    			<input name="sex" value="2" title="女" type="radio">
    		</c:otherwise>
    	</c:choose>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">出生日期</label>
      <div class="layui-input-block">
        <input id="dateOfBirthStr" lay-verify="date" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})" type="text" value="${sessionScope.userInSession.dateOfBirthStr}">
      </div>
    </div>
    </div>
  <div class="layui-form-item">
    <label class="layui-form-label">手机号码</label>
    <div class="layui-input-inline">
      <input id="mobile" lay-verify="" autocomplete="off" class="layui-input" type="tel" value="${sessionScope.userInSession.mobile}">
    </div>
  </div>
   
  <div class="layui-form-item">
    <button class="layui-btn" type="button" id="saveButton">确认修改</button>
  </div>
</form>
          
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

</body>
</html>