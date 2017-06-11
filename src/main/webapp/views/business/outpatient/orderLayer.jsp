<%@page import="com.boco.common.utils.PropertiesUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>弹层</title>
	<link rel="stylesheet" href="/BRHP/statics/css/layer.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
   <% String webServerIp=PropertiesUtils.getValue("ftp_web_server_ip"); %>	
</head>
<body>
		<!-- 预约弹出层 -->
		<div class="layer-wrap" id="appointment">
			<div class="layer-body">
				<!-- <div class="layer-title"> </div> -->
				<div class="layer-content"> 
					<!-- 左边医生及预约详情 -->
					<div class="pull-left doctorInfo">
						<div class="doctorInfo-box">
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
									<span class="doctor-position">${staffDetail.name}</span>
								</div>
								<div>
			                        <img src="/BRHP/statics/image/医生列表/star.png" alt=""><img src="/BRHP/statics/image/医生列表/star.png" alt=""><img src="/BRHP/statics/image/医生列表/star.png" alt=""><img src="/BRHP/statics/image/医生列表/star.png" alt=""><img src="/BRHP/statics/image/医生列表/half-star.png" alt="">9.3分
			                        <a class="pull-right" href="javascript:void(0)">${staffDetail.orgName}</a>
			                    </div>
			                    <div>
			                    	<div class="pull-left">
			                    		<img src="/BRHP/statics/image/医生列表/adapt.png" alt="">
			                    	</div> 
			                    	<div class="pull-left" style="width: 150px;">
			                    		<span class="introduce">${staffDetail.specialty}</span>
			                    	</div>
			                    	
			                    	<a class="pull-right" href="javascript:void(0)">${staffDetail.deptName}</a>
			                    </div>
							</div> 
							<div class="clr"></div>
						</div>
						<!-- 医生排班情况 -->
						<div class="doctor-schedul">
								<c:choose>
									<c:when test="${sessionScope.userInSession!=null}">
										<div class="schedul-lists">
											<ul>
												<c:forEach items="${sourceList}" var="sourceItem">
													<c:if test="${sourceItem.remainderNumber > 0}">
														<li>
															<div class="li-wrap" onclick="sourceItemClick(${sourceItem.id})">
															<span class="li-text">${sourceItem.clinicSimpleDateStr}<br>${sourceItem.weekDayChs}</span>
															<span class="time">${sourceItem.clinicTimeChs}</span>
															<div class="list-detail">
																<div class="tip"></div>
																<label class="pull-left">医院：</label><span class="pull-left"><span>${sourceItem.orgName}</span></span>
																<label class="pull-left">科室：</label><span class="pull-left"><span>${sourceItem.deptName}</span></span>
																<label class="pull-left">门诊类型：</label><span class="pull-left"><span>${sourceItem.outpatientType}</span></span>
																<label class="pull-left">出诊时间：</label><span class="pull-left"><span>${sourceItem.clinicDateStr}</span></span>
																<label class="pull-left">参考挂号费：</label><span class="pull-left"><span class="gh-fee">${sourceItem.registrationFee}</span></span>
															</div>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</ul>
											<div>
												<a href="javascript:order()">确定</a>
											</div>
										</div>
									</c:when>
									<c:otherwise>
									<h5>
										<span class="schedul-title">排班：登陆可查看实时号源</span>
									</h5>
								</c:otherwise>
								</c:choose>
							</div> 
						</div>

					<!-- 规则及注意事项 -->
					<div class="pull-right hospital-info">
						<div>
							<p>医院平台预约规则(班次每日14：00更新)</p>
						</div>
						<div>
							<p><a class="rule-head">医院规则：</a></p>
							<div class="rule-text">

								所有网上的支付订单都需要去自助预约机上区号；否则如果重新挂号算爽约不予退款。
							</div>
							<p><a class="rule-head">注意事项：</a></p>
							<div class="rule-text">
								所有网上的支付订单都需要去自助预约机上区号；否则如果重新挂号算爽约不予退款。
							</div>
						</div>
						<div>
							<p>1.可愈远班次更新时间：每日14：00左右更新</p>
							<p>2.特殊情况盛情预约退费者可在预约时间段之前到医院取号处进行退好神速，逾期不再受理；已支付挂号费的用户请提前30分钟到医院进行取号就诊，过时未取号将作废，爽约或迟到费用不退还，请就诊者悉知，谢谢</p>
						</div>
						<div class="pull-right"><a >更多</a></div>
					</div>
				</div>
			</div>
		</div>
	<script>
		var sourceItemId = 0;
		function addEvent(obj,type,handle){
		    try{  // Chrome、FireFox、Opera、Safari、IE9.0及其以上版本
		    	obj.addEventListener(type,handle,false);
		    }catch(e){
		        try{  // IE8.0及其以下版本
		        	obj.attachEvent('on' + type,handle);
		        }catch(e){  // 早期浏览器
		        	obj['on' + type] = handle;
		        }
		    }
		}
		document.getElementById("appointment").style.display='block';
		
		$("div.li-wrap").on("click",function(){
			$("div.li-wrap").css({
				"background-color": "#F5F5F5",
				"color":"#808080"
			}).find('span.time').css({
				"background-color":"#E0E0E0",
				"color":"#808080"
			})
			
			$(this).css({
				"background-color":"#48D3A2",
				"color":"#FFFFFF"
			}).find('span.time').css({
				"background-color":"#278EFF",
				"color":"#FFFFFF"
			})
			
		})
		
		function sourceItemClick(sourceId){
			sourceItemId = sourceId;
		}
		
		function order(){
			if(sourceItemId == 0){
				layer.msg('请选择要预约的号！');
			}else{
				var index = parent.layer.getFrameIndex(window.name);
	    		parent.layer.close(index);
				window.open("/BRHP/outpatient/appointInfo?orderId="+sourceItemId);
			}
		}
	</script>
</body>
</html>