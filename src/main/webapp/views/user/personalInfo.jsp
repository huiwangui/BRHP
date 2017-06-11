<%@page import="com.boco.common.utils.PropertiesUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>黄岛区居民健康门户</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
    <link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/person.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/pstyle.css"/>
    <link rel="stylesheet" href="/BRHP/statics/webuploader/webuploader.css"/>
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
    <script type="text/javascript" src="/BRHP/statics/webuploader/webuploader.js"></script>
    <script type="text/javascript" src="/BRHP/statics/js/md5.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
	<script type="text/javascript" src="/BRHP/statics/layui/layui.js"></script>
	<% String webServerIp=PropertiesUtils.getValue("ftp_web_server_ip"); %>
</head>
<body>
<style type="text/css">
	body{
		font-family: 'Microsoft YaHei ';
	}
	
</style>

<%@ include file="../include/header.jsp"%>


<div class="message-box">
		    <div class="left-msg">
		        <ul>
		            <li>
		                <a  href="/BRHP/user/personalInfo" class="current">
		                    <img src="/BRHP/statics/image/bbb/Personal_information1.png" alt=""/>
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
		        <div class="msg_p clearfix">
		        	<div class="c">
		        		<form>
			        		<div class="l">
			        			<img src="<%=webServerIp%>${sessionScope.userInSession.img}" alt="" />
			        		</div>
			        		<div class="r clearfix">
			        			<p>昵&nbsp;&nbsp;&nbsp;称： &nbsp;&nbsp;&nbsp;<span class="blue_color">${sessionScope.userInSession.nickname}</span></p>
			        			<p>邮&nbsp;&nbsp;&nbsp;箱：&nbsp;&nbsp;&nbsp; <span class="blue_color">${sessionScope.userInSession.email}</span></p>
			        			<p>生&nbsp;&nbsp;&nbsp;日： &nbsp;&nbsp;&nbsp;<span class="blue_color">${sessionScope.userInSession.dateOfBirthStr}</span></p>
			        			<p>性&nbsp;&nbsp;&nbsp;别： &nbsp;&nbsp;&nbsp;<span class="blue_color"> <c:if test="${sessionScope.userInSession.sex==1}">男</c:if> <c:if test="${sessionScope.userInSession.sex==2}">女</c:if></span></p>
			        			<p>身份证：&nbsp;&nbsp;&nbsp; <span class="blue_color">${sessionScope.userInSession.idCardCode}</span> <img src="/BRHP/statics/image/bbb/identification.png" alt=""/> <span class="blue_color">已认证</span></p>
			        			<p>手&nbsp;&nbsp;&nbsp;机：&nbsp;&nbsp;&nbsp; <span class="blue_color">${sessionScope.userInSession.mobileCode}</span></p>
			        		</div>
			        	</form>
		        	</div>
		        </div>
		        <div class="news">
		        	<div class="h">
		        		推荐资讯
		        	</div>
		        	<div class="c">
		        		<ul id="txun">
		        			
		        		</ul>
		        	</div>
		        </div>
		    </div>
		</div>

<%@ include file="../include/footer.jsp"%>

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

function changePsw(){
	layer.prompt({
		  formType: 1,
		  title: '请输入原密码进行验证'
		}, function(value, index, elem){
		  if(hex_md5(value) != "${sessionScope.userInSession.password}"){
			  layer.close(index);
			  layer.msg('原密码错误！');
			  return;
		  }
		  layer.close(index);
		  layer.open({
			  type: 1, 
			  title : false,
			  area: ['390px', '270px'],
			  btn: ['确认', '取消'],
			  btn1: function(index1, layero){
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
								layer.close(index1);
								layer.msg('修改成功，3秒钟后将跳转至登录页面，请重新登录！');
								setTimeout(function(){
					    			window.location.href='/BRHP/user/goLogin';
					    		},3000);
							} else {
								layer.msg(data.msg);
							}
						}
					});
			  },
			  btn2: function(index1, layero){
				  layer.close(index1);
			  },
			  content: '<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px; margin-right: 20px;"><legend>修改密码</legend></fieldset>'
			  			+ '<form class="layui-form layui-form-pane" action="" style="margin-left: 20px; margin-right: 20px;">'
			  			+ '<div class="layui-form-item"><label class="layui-form-label">新密码</label><div class="layui-input-inline">'
			  			+ '<input lay-verify="" id="newPsw" autocomplete="off" class="layui-input" type="password"></div></div>'
			  			+ '<div class="layui-form-item"><label class="layui-form-label">确认密码</label><div class="layui-input-inline">'
			  			+ '<input lay-verify="" id="reNewPsw" autocomplete="off" class="layui-input" type="password""></div></div></form>'
			});
	});
}

function changePersonInfo(){
	layer.open({
		  type: 2, 
		  title : false,
		  area: ['450px', '520px'],
		  content: '/BRHP/user/changePersonInfo'
	});
}

</script>
<script type="text/javascript">
getdetail=function(id){
	window.location.href="/BRHP/healthEdu/detail?id="+id;
	
}
//查询咨询信息
$.ajax({
	   type:'GET',
	   async: false,
	   url:'/BRHP/healthEdu/byModMore',
	   data:{
		     pageNo:1,
			 pageSize:5,
			 moduleId:1
			 },
	 success: function(data){
	    
	    if(data==''){}
	    var str ='';
	    for(i=0;i<data.length;i++){
	    str=str+'<li>'+
	    '                <a href="javascript:;" onclick="getdetail('+data[i].id+')">'+
	    '                    <p >'+data[i].title+'</p>'+
	    '                </a>'+
	    ' </li>';
	    }
	    //
	    document.getElementById('txun').innerHTML=str;
	 }   
})


</script>
</body>
</html> 