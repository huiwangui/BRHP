<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>黄岛区居民健康门户</title>
	<link rel="stylesheet" href="/BRHP/statics/css/doctor.css"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
</head>
<body>
	<%@ include file="../../include/header.jsp"%>
	
	<form action="/BRHP/outpatient/doctorList" method="get" id="searchDoctorForm">
		<div class="search">
		    <a href="/BRHP/orgHospital/hospitalList" class="aBorder">医院</a><a href=""  class="aRight">医生</a>
		    <ul>
		        <li><input type="text" placeholder="请输入医生或医院名称" name="name" value="${searchName}"/></li>
		        <li><button id="searchDocButton" type="button"><img src="/BRHP/statics/image/医院列表/search-button.png"/></button></li>
		    </ul>
		</div>
	</form>
	<div class="list"><!------------fff------------------>
	    <div class="order">
	        排序
	        <select>
	            <option>评分</option>
	            <option>评分</option>
	            <option>评分</option>
	            <option>评分</option>
	        </select>
	    </div>
	    <div class="kind">
	        <ul>
	            <li>内科</li>
	            <li>外科</li>
	            <li>儿科</li>
	            <li>妇科</li>
	            <li>眼科</li>
	            <li>耳鼻喉科</li>
	            <li>口腔科</li>
	            <li>皮肤科</li>
	            <li>中医科</li>
	            <li>针灸推拿科</li>
	            <li>心理咨询科</li>
	        </ul>
	        <p>查看更多科室</p>
	    </div>
	    <div class="doctorList">
	    	<c:forEach items="${doubleList}" var="doctorItem">
	    		<ul>
		            <li class="doctorBox">
		                <div class="headPic">
		                	<div class="headBox">
		                   	 	<img src="${doctorItem.img1}" alt="" onclick='showDetail("${doctorItem.staffId1}")' style="cursor:pointer;"/>
		                   	 </div><br/>
		                    <div class="star">
		                        <img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/half-star.png" alt=""/>9.3分
		                    </div>
		                </div>
		                <div class="headName">
		                    <p>
		                        <span class="name" onclick='showDetail("${doctorItem.staffId1}")' style="cursor:pointer;">${doctorItem.name1}</span>&nbsp<span class="position">${doctorItem.lable1}</span><br/>
		                    </p>
		                    <p>
		                        <span class="department">${doctorItem.deptName1}</span>&nbsp&nbsp<span class="hospital">${doctorItem.orgName1}</span><br/>
		                    </p>
		                    <p>
		                        <img src="/BRHP/statics/image/fff/adapt.png" alt=""/>&nbsp<span class="introduce">${doctorItem.specialty1}</span>
		                    </p>
		                </div>
		                <div class="orderDoc">
		                    <img src="/BRHP/statics/image/fff/subscribe2.png" alt="" style="cursor:pointer;" onclick='showOrderLayer("${doctorItem.staffId1}","${doctorItem.deptId1}","${doctorItem.deptName1}")'/>
		                </div>
		            </li>
		            <c:if test="${not empty doctorItem.name2}">
		            	<li>
		                <div class="headPic">
		                	<div class="headBox">
		                    	<img src="${doctorItem.img2}" alt="" onclick='showDetail("${doctorItem.staffId2}")' style="cursor:pointer;"/>
		                    </div><br/>
		                    <div class="star">
		                        <img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/half-star.png" alt=""/>9.3分
		                    </div>
		                </div>
		                <div class="headName">
		                    <p>
		                        <span class="name" onclick='showDetail("${doctorItem.staffId2}")' style="cursor:pointer;">${doctorItem.name2}</span>&nbsp<span class="position">${doctorItem.lable2}</span><br/>
		                    </p>
		                    <p>
		                        <span class="department">${doctorItem.deptName2}</span>&nbsp&nbsp<span class="hospital">${doctorItem.orgName2}</span><br/>
		                    </p>
		                    <p>
		                        <img src="/BRHP/statics/image/fff/adapt.png" alt=""/>&nbsp<span class="introduce">${doctorItem.specialty2}</span>
		                    </p>
		                </div>
		                <div class="orderDoc">
		                    <img src="/BRHP/statics/image/fff/subscribe2.png" alt="" style="cursor:pointer;" onclick='showOrderLayer("${doctorItem.staffId2}","${doctorItem.deptId2}","${doctorItem.deptName2}")'/>
		                </div>
		           	 </li>
		            </c:if>
		        </ul>
	    	</c:forEach>
	    </div>
	</div>
	
	<%@ include file="../../include/header.jsp"%>
	
	
	<script type="text/javascript">
		$("#searchDocButton").on('click',function(){
			$("#searchDoctorForm").submit();
		});
		
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
		
	</script>
</body>
</html>