<%@page import="com.boco.common.utils.PropertiesUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>预约</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
	<link rel="stylesheet" href="/BRHP/statics/css/apointed.css">
	<link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
	<link rel="stylesheet" href="/BRHP/statics/css/bootstrap.min.css" />
	<script src="/BRHP/statics/js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/My97DatePicker/WdatePicker.js"></script>
	    <% String webServerIp=PropertiesUtils.getValue("ftp_web_server_ip"); %>
</head>
<body>

<%@ include file="../../include/header.jsp"%>



<div class="crumb-bar">
	<div style="border-bottom: 1px solid #ddd">
		成都军区医院
	</div> 
</div>

<div class="appoint-info"> 
	<!-- steps -->
	<div class="appoint-line"> 
			<div class="steps">
				<div class="">
					<a class="step step1">
						<div>
							<span>填写预约信息</span>
						</div>
					</a>
					<div class="linethrough"></div>
					<a class="step2-gray step2">
						<div>
							<span>确认预约订单</span>
						</div>
					</a>
					<div class="linethrough"></div>
					<a class="step3-gray">
						<div>
							<span>选择付款方式</span>
						</div>
					</a>
					<div class="linethrough"></div>
					<a class="step4-gray">
						<div>
							<span>支付成功</span>
						</div>
					</a>
				</div> 
			</div> 
	</div>
	<!-- 预约 -->
	<div class="apoint-tab step-tab"> 
		<!-- 预约医生信息 -->
		<div class="appoint-back">
			<div class="docInfo-detail">
				<div class="pull-left detail-part">
					<div class="" style="border-right:1px solid #D2D2D2">
						<!-- 医生头像 -->
								<div class="doctor-pic">
									<div class="img">
										<img src="<%=webServerIp%>${staffDetail.img}" alt="">
									</div> 
								</div>
								<!-- 医生描述 -->
								<div class="doctorInfo-detail">
									<div> 
										<span class="doctor-name">${staffDetail.name}</span>&nbsp;&nbsp;
										<span class="doctor-position">${staffDetail.label}</span>
										<a class="pull-right" href="javascript:void(0)">${sourceDetail.deptName}</a>
										<a class="pull-right" href="javascript:void(0)">${staffDetail.orgName}</a> 
									</div>
									<div>
				                        <img src="/BRHP/statics/image/ddd/star.png" alt=""><img src="/BRHP/statics/image/ddd/star.png" alt=""><img src="/BRHP/statics/image/ddd/star.png" alt=""><img src="/BRHP/statics/image/ddd/star.png" alt=""><img src="/BRHP/statics/image/ddd/half-star.png" alt="">9.3分
				                        
				                    </div>
				                    <div>
				                    	<div class="pull-left" style="margin-right:10px;">
				                    		<img src="/BRHP/statics/image/ddd/adapt.png" alt="">
				                    	</div> 
				                    	<div class="pull-left">
				                    		<span class="introduce">${staffDetail.specialty}</span>
				                    	</div>
				                    	
				                    	
				                    </div>
								</div> 
								<div class="clr"></div>
					</div>
				</div>
				<div class="pull-left detail-part">
					<div>
						<p>门诊类型：<span>${sourceDetail.outpatientType}</span></p>
						<p>就诊时间：<span>${sourceDetail.clinicDateStr}&nbsp;${sourceDetail.clinicTimeChs}</span></p>
					</div>
					
				</div>
				<div class="clr"></div>
			</div>
		</div>
		<!-- 就诊人信息 -->
		<div class="person-manage">
			<h3>选择就诊人</h3>
			<div class="person-list">
				<ul id="patientUl">
					<c:forEach items="${patientList}" var="patientItem">
						<c:choose>
							<c:when test="${patientItem.defaultFlag == 1}">
								<li class="active">
									<input type="hidden" value="${patientItem.id}" name="idHidden"/>
									<div class="person-name"><span>${patientItem.patientName}</span>（默认就诊人）</div>
									<div>
										<p>身份证:<span class="idNum">${patientItem.patientIdCard}</span></p>
										<p>电话:<span class="telNum">${patientItem.patientMobile}</span></p>
									</div>
									<a></a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<input type="hidden" value="${patientItem.id}" name="idHidden"/>
									<div class="person-name"><span>${patientItem.patientName}</span></div>
									<div>
										<p>身份证:<span class="idNum">${patientItem.patientIdCard}</span></p>
										<p>电话:<span class="telNum">${patientItem.patientMobile}</span></p>
									</div>
									<a></a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<div class="clr"></div>
				</ul>
			</div>
			<div><a href="javascript:void(0)" class="add-person"><span></span>添加其他就诊人</a></div>
			<div class="sum">
				<p>实付款：￥<span>${sourceDetail.registrationFee}</span></p>
			</div>
			<div class="confirm">
				<a href="javascript:void(0)" class="btn-info" id="cancel">取消</a>
				<a href="javascript:void(0)" class="btn-confirm" id="btn-1">确认预约</a>
			</div>
		</div>
	</div>
	<!-- 选择支付方式 -->
	<div class="apoint-tab pay-tab">
		<div class="appoint-back">
			<div class="pay-ways">
				<h3>网上支付</h3>
				<div class="payway-list">
					<ul>
						<li><div><span class="bank"></span><span>添加快捷/网银支付</span></div><a></a></li>
						<li><div><span class="weixin"></span><span>微信支付</span></div><a></a></li>
						<li><div><span class="epay"></span><span>支付宝</span></div><a></a></li>
						<div class="clr"></div>
					</ul>
				</div>
				<h3>线下支付：<a class="tohospital" href="javascript:void(0)">到院支付</a></h3>
			</div>
		</div>
		<div>
			<div class="confirm">
				<a href="javascript:void(0)" class="btn-info" id="prev">上一步</a>
				<a href="javascript:void(0)" class="btn-confirm" id="btn-2">完成</a>
			</div>
		</div>
	</div>
	<!-- 支付成功 -->
	<div class="apoint-tab pay-success">
		<div class="appoint-back">
			<div class="pay-end">
				<span class="succes-end"></span>
				<div>
					<p>预约成功的短信将发送到手机，请注意查收！</p>
					<p>预约记录请在<a href="/BRHP/user/userOrders">个人中心-我的预约</a>进行查看</p>
				</div>
				
			</div>
			
		</div>
		<div>
			<div class="confirm">
				<a href="javascript:void(0)" class="btn-confirm">完成</a>
			</div>
		</div>
	</div>

</div>
<!-- 添加联系人弹出层 -->

<div class="layer" id="addNew">
		<div class="layer-head">
			新增就诊联系人<a class="clz" href="javascript:void(0)"></a>
		</div>
		<div class="layer-body">
			<form action="" id="patientForm">
				<div class="info-item">
					<label for="">姓名:</label>
					<div>
						<input type="text" id="patientName">
					</div>
				</div>
				<div class="info-item">
					<label for="">身份证:</label>
					<div>
						<input type="text" id="patientIdCard">
					</div>
				</div>
				<div class="info-item">
					<label for="">性别:</label>
					<div>
						<input type="radio" name="sex" value="1" checked="checked">男<input
							type="radio" name="sex" value="2">女
					</div>
				</div>
				<div class="info-item">
					<label for="">出生日期:</label>
					<div>
						<input type="text" id="dateOfBirthStr" class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})">
					</div>
				</div>
				<div class="info-item">
					<label for="">手机号:</label>
					<div>
						<input type="text" id="patientMobile">
					</div>
				</div>
				<div class="info-item defult-item">
					<input type="checkbox" id="defaultCheck"><span>设为默认就诊人</span>
				</div>
				<div class="info-item sub-item">
					<a href="javascript:savePatient()" class="btn-add">确定</a>
				</div>
			</form>
		</div>
	</div>
<%@ include file="../../include/footer.jsp"%>
<!---->

<script>

window.onload=function(){ 
		$(".pay-tab").hide();
		$(".pay-success").hide();
	numMidHide(getEle('idNum'));
	numMidHide(getEle('telNum'));

	$(".person-list ul li").on("click",function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
		}else{
			$(".person-list ul li").removeClass("active");
			$(this).addClass("active");
		
		}
	})
	$(".payway-list ul li").on("click",function(){
		
			$(this).addClass("active").siblings().removeClass("active");
		  
	})
	//点击新增就诊人显示弹出层
	$(".person-manage .add-person").on("click",function(){
		$('#patientForm')[0].reset();
		$("#addNew").css("visibility","visible");
	})
	//关闭弹出层
	$(".clz").on("click",function(){
		$("#addNew").css("visibility","hidden")
	})
	
	$("#cancel").on("click",function(){//点击取消按钮
		
	})

	$("#prev").on("click",function(){//点击上一步
		$(".steps a.step3").removeClass("step3"); 
		$(".pay-tab").hide();
		$(".step-tab").show();
	})

	$("#btn-1").on("click",function(){
		
		if($(".person-list ul li.active input[name=idHidden]").val() == null){
			layer.msg('请选择就诊人！');
			return;
		}
		$(".steps a.step3-gray").addClass("step3");
		$(".step-tab").hide();
		$(".pay-tab").show();
	})

	$("#btn-2").on("click",function(){
		$.ajax({
			type : 'POST',
			url : '/BRHP/outpatient/outpatientOrder',
			data : {
				patientId : $(".person-list ul li.active input[name=idHidden]").val(),
				sourceId : "${sourceDetail.id}"
			},
			success : function(data) {
				if(data.code == 200){
					$(".steps a.step4-gray").addClass("step4");
					$(".pay-tab").hide();
					$(".pay-success").show();
				}else{
					layer.msg(data.msg);
				}
			}
		});
		
	})
}

function getEle(ele){
	return document.getElementsByClassName(ele);
}
// 隐藏身份证号码中间10位或电话号码中间4位
function numMidHide(ele){ 
	for(var i=0;i<ele.length; i++){
		var tel = ele[i].innerHTML;
		if(tel.length==18){
			var reg = /^(\d{4})\d{10}(\d{4})$/;
		tel = tel.replace(reg, "$1*********$2");
		}else{
			var reg = /^(\d{3})\d{4}(\d{4})$/;
			tel = tel.replace(reg, "$1****$2");
		} 
		ele[i].innerHTML=tel;
	} 	
}


//新增就诊人保存
function savePatient() {
	var submitFlag = 1;
	if ($("#patientName").val() == null
			|| $("#patientName").val() == '') {
		layer.tips('请输入姓名', '#patientName', {
			time : 3000,
			tipsMore : true
		});
		submitFlag = 0;
	}
	if ($("#dateOfBirthStr").val() == null
			|| $("#dateOfBirthStr").val() == '') {
		layer.tips('请选择出生日期', '#dateOfBirthStr', {
			time : 3000,
			tipsMore : true
		});
		submitFlag = 0;
	}
	if ($("#patientIdCard").val() == null
			|| $("#patientIdCard").val() == '') {
		layer.tips('请输入身份证号', '#patientIdCard', {
			time : 3000,
			tipsMore : true
		});
		submitFlag = 0;
	} else {
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		if (!reg.test($("#patientIdCard").val())) {
			layer.tips('请输入正确的身份证号', '#patientIdCard', {
				time : 3000,
				tipsMore : true
			});
			submitFlag = 0;
		}
	}
	if ($("#patientMobile").val() == null
			|| $("#patientMobile").val() == '') {
		layer.tips('请输入手机号码', '#patientMobile', {
			time : 3000,
			tipsMore : true
		});
		submitFlag = 0;
	} else {
		var reg = /^1[3|4|5|7|8]\d{9}$/;
		if (!reg.test($("#patientMobile").val())) {
			layer.tips('请输入正确的手机号码', '#patientMobile', {
				time : 3000,
				tipsMore : true
			});
			submitFlag = 0;
		}
	}
	if (submitFlag == 1) {
		$.ajax({
			type : 'POST',
			url : '/BRHP/user/patientSave',
			data : {
				patientName : $("#patientName").val(),
				patientIdCard : $("#patientIdCard").val(),
				dateOfBirthStr : $("#dateOfBirthStr").val(),
				patientMobile : $("#patientMobile").val(),
				patientSex : $("input[name=sex]:checked").val(),
				defaultFlag : function() {
					if ($("input[type='checkbox']").is(':checked')) {
						return 1;
					} else {
						return 0;
					}
				}
			},
			success : function(data) {
				//alert(data)
				//保存成功，重新刷新就诊人列表
				if (data.code == '200') {
					layer.msg('新增成功！');
					$("#addNew").css("visibility", "hidden");
					$.ajax({
						type : 'GET',
						url : '/BRHP/user/userPatientsData',
						success : function(data) {
							var itemsHtml = '';
							for(var i=0;i<data.length;i++){
								if(data[i].defaultFlag == 1){
									itemsHtml = itemsHtml + '<li class="active"><input type="hidden" value="'+data[i].id+'"/>'
										+ '<div class="person-name"><span>'+data[i].patientName+'</span>（默认就诊人）</div>'
										+ '<div><p>身份证:<span class="idNum">'+data[i].patientIdCard+'</span></p>'
										+ '<p>电话:<span class="telNum">'+data[i].patientMobile+'</span></p></div><a></a>'
										+ '</li>';
								}else{
									
									itemsHtml = itemsHtml + '<li><input type="hidden" value="'+data[i].id+'"/>'
										+ '<div class="person-name"><span>'+data[i].patientName+'</span></div>'
										+ '<div><p>身份证:<span class="idNum">'+data[i].patientIdCard+'</span></p>'
										+ '<p>电话:<span class="telNum">'+data[i].patientMobile+'</span></p></div><a></a>'
										+ '</li>';
								}
								
							}
							itemsHtml = itemsHtml + '<div class="clr"></div>';
							$("#patientUl").html(itemsHtml);
							$(".person-list ul li.active input[name=idHidden]").val()
							window.location.reload()
							
							//重新设置手机、身份证中间隐藏
							numMidHide(getEle('idNum'));
							numMidHide(getEle('telNum'));
							//重新添加点击事件
							$(".person-list ul li").on("click",function(){
								if($(this).hasClass("active")){
									$(this).removeClass("active");
								}else{
									$(".person-list ul li").removeClass("active");
									$(this).addClass("active");
								}
							});
							$(".payway-list ul li").on("click",function(){
								
								$(this).addClass("active").siblings().removeClass("active");
								
								
							});
						}
					});
				} else {
					layer.msg(data.msg);
				}
				
			}
		});
	}
}
//

//未写提交代码~

</script>
</body>
</html>