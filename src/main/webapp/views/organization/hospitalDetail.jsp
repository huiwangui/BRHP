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
    <link rel="stylesheet" href="/BRHP/statics/css/hospitalDetails.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
    <link rel="stylesheet" href="/BRHP/statics/js/layer/skin/default/layer.css"/>
    <script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
</head>
<body>

<%@ include file="../include/header.jsp"%>

<div class="hospName">
    ${hospitalDetail.orgName}
</div>
<!--医院介绍-->
<div class="hosBg">
    <div class="hosDetails">
        <!--医院图片-->
        <div class="hosPicture">
            <img src="${hospitalDetail.img}" alt=""/>
        </div>
        <!--医院介绍-->
        <div class="hosIntr">
            <p>
                <span class="hosName">${hospitalDetail.orgName}</span>&nbsp
                <span class="hosGrade">${hospitalDetail.levelChs}</span>&nbsp
                <img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/half-star.png" alt=""/>&nbsp
                <img src="/BRHP/statics/image/ggg/card.png" alt=""/>
                <span>在线支付</span>
            </p>
            <p>
                <span class="blue">联系电话：</span>${hospitalDetail.fixedTelephone}
            </p>
            <p>
                <span class="blue">地&nbsp&nbsp址：</span>
                <img src="/BRHP/statics/image/fff/address.png" alt="" style="position:relative; top:-2px;"/ >
                ${hospitalDetail.detailAddress}
            </p>
            <p>
                <span class="blue">网&nbsp&nbsp站：</span>${hospitalDetail.webSite}
            </p>
            <p>
                <span class="blue">医院简介：</span><span id="introductionSpan">${hospitalDetail.introduction}</span>  
            </p>

        </div>
    </div>
</div>
<!--板块选择按钮-->
<div class="choose">
    <a href="" class="aBorder first">科室医生</a><a href="" class="aBorder">医院评价</a><a href="/BRHP/orgHospital/hospitalIntroduction?orgId=${hospitalDetail.orgId}" class="aBorder">医院简介</a><a href="">停诊信息</a>
</div>
<!--板块详情-->
<div class="hospital-box">
    <div></div>
    <div class="department">
        <ul>
        	<c:forEach items="${staffList}" var="staffItem">
	            <li class="doctorBox">
	                <div class="headPic">
	                    <!--头像-->
	                    <div class="headBox">
	                        <img src="${staffItem.img}" alt="" onclick='showDetail("${staffItem.staffId}")' style="cursor:pointer;"/>
	                    </div><br/>
	                    <!--评分-->
	                    <div class="star">
	                        <img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/half-star.png" alt=""/>9.3分
	                    </div>
	                </div>
	                <!--医生介绍-->
	                <div class="headName">
	                    <p>
	                        <span class="name" onclick='showDetail("${staffItem.staffId}")' style="cursor:pointer;">${staffItem.name}</span>&nbsp<span class="position">${staffItem.label}</span><br/>
	                    </p>
	                    <p>
	                        <span class="color">${staffItem.deptName}</span>&nbsp&nbsp<span class="hospital">${staffItem.orgName}</span><br/>
	                    </p>
	                    <p>
	                        <img src="/BRHP/statics/image/fff/adapt.png" alt=""/>&nbsp<span class="introduce">${staffItem.specialty}</span>
	                    </p>
	                </div>
	                <!--预约-->
	                <div class="orderDoc">
	                        <img src="/BRHP/statics/image/fff/subscribe2.png" alt="" style="cursor:pointer;" onclick='showOrderLayer("${staffItem.staffId}","${staffItem.deptId}","${staffItem.deptName}")'/>
	                </div>
	            </li>
            </c:forEach>
        </ul>
    </div>
</div>

<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">
	function showDetail(staffId){
		window.open("/BRHP/staff/doctorDetail?staffId="+staffId);
	}
	
	function showOrderLayer(staffId,deptId,deptName){
		layer.open({
			  title: false,
			  type: 2,
			  area: ['720px', '400px'],
			  fix: false, //不固定
			  maxmin: false,
			  content: '/BRHP/outpatient/orderList?staffId='+staffId+'&deptId='+deptId+'&deptName='+deptName
		});
	}
	
	if($("#introductionSpan").text().length > 100){
		var text = $("#introductionSpan").text().substring(0, 100) + ".....<span style='cursor:pointer;' onclick='showIntroduction()'>查看更多</span>";
		$("#introductionSpan").html(text);
	}
	
	function showIntroduction(){
		layer.open({
			  title: false,
			  type: 1,
			  area: ['700px', '300px'],
			  fix: false, //不固定
			  maxmin: false,
			  content: '${hospitalDetail.introduction}'
		});
	}
	
</script>
</body>
</html>