<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%=demoTitle%>-医生详情-${staffDetail.name}</title>
    <link rel="stylesheet" href="/BRHP/statics/css/docDetails.css"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
    <link rel="stylesheet" href="/BRHP/statics/css/schedul.css">
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
    <script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
</head>
<body>

<div class="topBox"><!----------顶部------------->
    <div class="top">
        <span>欢迎访问<%=demoTitle%>！</span>
        <ul>
            <li><a href="javascript:void(0)">APP下载</a></li>
            <li><a href="javascript:void(0)">微信公众号</a></li>
        </ul>
    </div>
</div>

<div class="logo"><!----------logo----------------->
    <img src="/BRHP/statics/image/首页/<%=demoAddressLogo%>/logo.png" alt="" class="logoMargin"/>
    <!--<iframe class="weather" name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=9" width="300" height="60" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>-->
    <ul>
   	<c:choose>
   		<c:when test="${sessionScope.userInSession!=null}">
   			<li>
	            <img src="/BRHP/statics/image/首页/login.png" alt=""/>${sessionScope.userInSession.nickname}
	        </li>
   		</c:when>
   		<c:otherwise>
   			<li style="cursor:pointer;" onclick="goLogin()">
	            <img src="/BRHP/statics/image/首页/login.png" alt=""/>登陆
	        </li>
	        <li>
	            <img src="/BRHP/statics/image/首页/register.png" alt=""/>注册
	        </li>
   		</c:otherwise>
   	</c:choose>
   </ul>
</div>

<div class="navBox"><!-----------菜单----------------------->
    <div class="nav" >
        <ul>
            <li><a href="/BRHP/index.jsp">首页</a></li>
            <li><a href="/BRHP/orgHospital/hospitalList">预约挂号</a></li>
            <li><a href="javascript:void(0)">健康教育</a></li>
            <li><a href="javascript:void(0)">健康管理</a></li>
            <li><a href="/BRHP/user/personalInfo">我的预约</a></li>
        </ul>
    </div>
</div>
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
                        <span class="size">${staffDetail.name}</span>&nbsp<span class="size1">${staffDetail.label}</span>&nbsp<img src="/BRHP/statics/image/医生列表/star.png" alt=""/><img src="/BRHP/statics/image/医生列表/star.png" alt=""/><img src="/BRHP/statics/image/医生列表/star.png" alt=""/><img src="/BRHP/statics/image/医生列表/star.png" alt=""/><img src="/BRHP/statics/image/医生列表/half-star.png" alt=""/>9.3分<br/>
                    </p>
                    <p class="blue size1">
                        <span>${staffDetail.orgName}</span>
                        <c:forEach items="${staffDetail.officeList}" var="officeItem">
                        	&nbsp<span>${officeItem.deptName}</span>
                        </c:forEach>
                    </p>
                </div>
                <div class="positionOrder">
                    <a href="javascript:void(0)">
                        <img src="/BRHP/statics/image/医生列表/subscribe2.png" alt=""/>
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
    <a href="/BRHP/staff/doctorDetail?staffId=${staffDetail.staffId}">简介</a><a href="/BRHP/staff/doctorDeptInfo?staffId=${staffDetail.staffId}" class="aBorder">科室信息</a><a href="javascript:void(0)" class="aBorder">患者评价</a><a href="javascript:void(0)"  class="aBorder first">排班信息</a>
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
<div class="footerBg"><!------------底部链接-------------------->
    <div class="footer">
        <div class="footLogo">
            <img src="/BRHP/statics/image/首页/logo-bottom.png" alt=""/>
        </div>
        <div class="friendLink">
            <p>友情链接</p>
            <ul class="lingUl">
                <li class="link">
                    <ul>
                        <li><a href="javascript:void(0)"><%=demoAddress%>地税局</a></li>
                        <li><a href="javascript:void(0)">共青团农场</a></li>
                    </ul>
                </li>
                <li class="link">
                    <ul>
                        <li><a href="javascript:void(0)"><%=demoAddress%>地税局</a></li>
                        <li><a href="javascript:void(0)">共青团农场</a></li>
                    </ul>
                </li>
                <li class="link">
                    <ul>
                        <li><a href="javascript:void(0)"><%=demoAddress%>地税局</a></li>
                        <li><a href="javascript:void(0)">共青团农场</a></li>
                    </ul>
                </li>
                <li class="link">
                    <ul>
                        <li><a href="javascript:void(0)"></a></li>
                        <li><a href="javascript:void(0)">共青团农场</a></li>
                    </ul>
                </li>
                <li class="link">
                    <ul>
                        <li><a href="javascript:void(0)"></a></li>
                        <li><a href="javascript:void(0)">共青团农场</a></li>
                    </ul>
                </li>
                <li class="link">
                    <ul>
                        <li><a href="javascript:void(0)"></a></li>
                        <li><a href="javascript:void(0)">共青团农场</a></li>
                    </ul>
                </li>
            </ul>
            <p class="yiYang">技术支持：亿阳信通股份有限公司</p>
        </div>
        <div class="suggest">
            <div>
                <img src="/BRHP/statics/image/首页/blog.png" alt=""/>
                <p>官方微博</p>
            </div>
            <div>
                <img src="/BRHP/statics/image/首页/suggestion.png" alt=""/>
                <p>意见反馈</p>
            </div>
        </div>
    </div>
</div>
<div class="bottomBg"><!----------底部声明----------------->
    <div class="bottom">
        <div>
            <span>|</span>
            <span><a href="javascript:void(0)">版权声明</a></span>
            <span>|</span>
            <span><a href="javascript:void(0)">法律责任</a></span>
            <span>|</span>
            <span><a href="javascript:void(0)">隐私声明</a></span>
            <span>|</span>
            <span><a href="javascript:void(0)">联系我们</a></span>
            <span>|</span>
        </div>
        <div class="middle">
            2009-2016&nbsp <a href="javascript:void(0)"><%=demoAddress%>卫生计生委</a>
        </div>
        <div class="right">
            备案号：心ICP备07057313号
        </div>
    </div>
</div>
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