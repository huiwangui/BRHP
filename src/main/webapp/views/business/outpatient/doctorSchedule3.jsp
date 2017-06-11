<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>黄岛区居民健康门户-医生详情-${staffDetail.name}</title>
    <link rel="stylesheet" href="/BRHP/statics/css/docDetails.css"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
    <link rel="stylesheet" href="/BRHP/statics/css/schedul.css">
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
    <script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
</head>
<body>

<%@ include file="../../include/header.jsp"%>

<div class="hospName">
    ${staffDetail.name}&nbsp;&nbsp;${staffDetail.label}&nbsp;&nbsp;${staffDetail.orgName}
</div>
<div class="docBg">
    <div class="docDetails">
        <div class="docPicture">
            <img src="${staffDetail.img}" alt=""/>
        </div>
        <div class="detailsOrder">
            <div class="position">
                <div>
                    <p>
                        <span class="size">${staffDetail.name}</span>&nbsp<span class="size1">${staffDetail.label}</span>&nbsp<img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/half-star.png" alt=""/>9.3分<br/>
                    </p>
                    <p class="blue size1">
                        <span>${staffDetail.orgName}</span>
                        <c:forEach items="${staffDetail.officeList}" var="officeItem">
                        	&nbsp<span>${officeItem.deptName}</span>
                        </c:forEach>
                    </p>
                </div>
                <div class="positionOrder">
                    <a href="">
                        <img src="/BRHP/statics/image/fff/subscribe2.png" alt=""/>
                    </a>
                </div>
            </div>
            <div class="width">
                <p class="size2"><span class="blue">联系电话：</span>${staffDetail.mobile}</p>
                <p class="size2"><span class="blue">擅长：</span>${staffDetail.specialty}</p>
                <p class="size2"><span class="blue">简介：</span>${staffDetail.introduction}</p>
            </div>

        </div>
    </div>
</div>
<div class="choose">
    <a href="/BRHP/staff/doctorDetail?staffId=${staffDetail.staffId}">简介</a><a href="/BRHP/staff/doctorDeptInfo?staffId=${staffDetail.staffId}" class="aBorder">科室信息</a><a href="" class="aBorder">患者评价</a><a href=""  class="aBorder first">排班信息</a>
</div>

	<div style="width: 1000px;height: 600px;background-color: #FAFAFA;margin:0 auto;">
		<c:choose>
			<c:when test="${sessionScope.userInSession!=null}">
				<c:forEach items="${outpatientSourceListAll}" var="sourceList" varStatus="status">
					<div class="schedul-box">
						<p>注：患者可预约两周以内的号<span>（${deptMsgVo[status.index].deptName}）</span></p>
						<div class="schedul-tab">
							<div class="side-table pull-left">
								<table>
									<tr>
										<th>
											<a href="javascript:void(0)" class="prev"></a>
											<span>排班信息</span>
											<a href="javascript:void(0)" class="next"></a>
										</th>
									</tr>
									<tr>
										<td><span>上午</span></td>
									</tr>
									<tr>
										<td><span>下午</span></td>
									</tr>
								</table>
							</div>
							<div class="list-box pull-left">
								<table class="list-table">
									<tr>
										<c:forEach begin="0" end="${fn:length(sourceList)-1}" var="sourceItem">
											<th><span>${sourceList[sourceItem].clinicSimpleDateStr}<br/>${sourceList[sourceItem].weekDayChs}</span></th>
										</c:forEach>
									</tr>
									<tr>
									<c:forEach begin="0" end="${fn:length(sourceList)-1}" var="sourceItem">
										<c:choose>
											<c:when test="${sourceList[sourceItem].clinicTime == 0}">
												<c:choose>
													<c:when test="${sourceList[sourceItem].remainderNumber > 0}">
														<td  class="date-free" onclick="order(${sourceList[sourceItem].id})">
															<span>预约</span>
															<p>
																<label>放号: <span class="">${sourceList[sourceItem].currentNumber}</span></label>
																<label>剩余: <span class="">${sourceList[sourceItem].remainderNumber}</span></label>
															</p>
														</td>
													</c:when>
													<c:when test="${sourceList[sourceItem].remainderNumber == 0}">
														<td class="date-full"><span>已约满</span></td>
													</c:when>
													<c:otherwise>
														<td><span></span></td>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:when test="${sourceList[sourceItem].clinicTime == 2}">
												<c:choose>
													<c:when test="${sourceList[sourceItem].amBizOutpatientSourceVo.remainderNumber > 0}">
														<td  class="date-free" onclick="order(${sourceList[sourceItem].amBizOutpatientSourceVo.id})">
															<span>预约</span>
															<p>
																<label>放号: <span class="">${sourceList[sourceItem].amBizOutpatientSourceVo.currentNumber}</span></label>
																<label>剩余: <span class="">${sourceList[sourceItem].amBizOutpatientSourceVo.remainderNumber}</span></label>
															</p>
														</td>
													</c:when>
													<c:when test="${sourceList[sourceItem].amBizOutpatientSourceVo.remainderNumber == 0}">
														<td class="date-full"><span>已约满</span></td>
													</c:when>
													<c:otherwise>
														<td><span></span></td>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<td><span></span></td>
											</c:otherwise>
										</c:choose>
										
									</c:forEach>
									</tr>
									<tr>
									<c:forEach begin="0" end="${fn:length(sourceList)-1}" var="sourceItem">
										<c:choose>
											<c:when test="${sourceList[sourceItem].clinicTime == 1}">
												<c:choose>
													<c:when test="${sourceList[sourceItem].remainderNumber > 0}">
														<td  class="date-free" onclick="order(${sourceList[sourceItem].id})">
															<span>预约</span>
															<p>
																<label>放号: <span class="">${sourceList[sourceItem].currentNumber}</span></label>
																<label>剩余: <span class="">${sourceList[sourceItem].remainderNumber}</span></label>
															</p>
														</td>
													</c:when>
													<c:when test="${sourceList[sourceItem].remainderNumber == 0}">
														<td class="date-full"><span>已约满</span></td>
													</c:when>
													<c:otherwise>
														<td><span></span></td>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:when test="${sourceList[sourceItem].clinicTime == 2}">
												<c:choose>
													<c:when test="${sourceList[sourceItem].pmBizOutpatientSourceVo.remainderNumber > 0}">
														<td  class="date-free" onclick="order(${sourceList[sourceItem].pmBizOutpatientSourceVo.id})">
															<span>预约</span>
															<p>
																<label>放号: <span class="">${sourceList[sourceItem].pmBizOutpatientSourceVo.currentNumber}</span></label>
																<label>剩余: <span class="">${sourceList[sourceItem].pmBizOutpatientSourceVo.remainderNumber}</span></label>
															</p>
														</td>
													</c:when>
													<c:when test="${sourceList[sourceItem].pmBizOutpatientSourceVo.remainderNumber == 0}">
														<td class="date-full"><span>已约满</span></td>
													</c:when>
													<c:otherwise>
														<td><span></span></td>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<td><span></span></td>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									</tr>
								</table>
							</div>
							<div class="clr"></div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="schedul-box">
					<p><font color="#FF0000">排班：登陆可查看实时号源</font></p>
					<div class="schedul-tab">
						<div class="side-table pull-left">
							<table>
								<tr>
									<th>
										<a href="javascript:void(0)" class="prev"></a>
										<span>排班信息</span>
										<a href="javascript:void(0)" class="next"></a>
									</th>
								</tr>
								<tr>
									<td><span>上午</span></td>
								</tr>
								<tr>
									<td><span>下午</span></td>
								</tr>
							</table>
						</div>
						<div class="list-box pull-left">
							<table class="list-table">
								<tr>
									<c:forEach begin="0" end="${fn:length(outpatientSourceListAll[0])-1}" var="sourceItem">
										<th><span>${outpatientSourceListAll[0][sourceItem].clinicSimpleDateStr}<br/>${outpatientSourceListAll[0][sourceItem].weekDayChs}</span></th>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach begin="0" end="${fn:length(outpatientSourceListAll[0])-1}" var="sourceItem">
										<td><span></span></td>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach begin="0" end="${fn:length(outpatientSourceListAll[0])-1}" var="sourceItem">
										<td><span></span></td>
									</c:forEach>
								</tr>
							</table>
						</div>
						<div class="clr"></div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	
<%@ include file="../../include/footer.jsp"%>

<script type="text/javascript">
	$(".side-table tr th a").on("click",function(){//给翻页按钮绑定点击事件 
		if($(this).hasClass("next")){//判断点击的按钮是向前还是向后
			var mgl=clickNext();
		}else{
			var mgl=0; 
		}
	
		$(this).parent().parent().parent().parent().parent().next().find("table").css({"margin-left":-mgl+"px"}); 
	});
	
	
	function clickNext(){//点击向后按钮事件 
		return  mgl=getEleWidth(".list-table")-getEleWidth(".list-box");
	};
	
	function getEleWidth(obj){
		return $(obj).outerWidth();
	}
	
	function order(orderId){
		layer.msg('确认要预约吗？', {
			time : 0,
			btn : [ '是', '否' ],
			yes : function(index) {
				window.location.href="/BRHP/outpatient/appointInfo?orderId="+orderId;
			}
		});
	}
</script>
</body>
</html>