<%@page import="com.boco.common.utils.PropertiesUtils"%>
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
   <link rel="stylesheet" href="/BRHP/statics/css/new_style.css"/>
        <link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/hospitalList.css"/>
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
    <% String webServerIp=PropertiesUtils.getValue("ftp_web_server_ip"); %>
</head>
<body>

<%@ include file="../include/header.jsp"%>
<div class="" style="margin: 0 auto; width: 1100px; ">
	<form action="/BRHP/orgHospital/hospitalList" method="get" id="searchHospitalForm">
		<div class="search">
		    <a href="" class="aBorder">医院</a><a href="/BRHP/outpatient/doctorList"  class="aRight">医生</a>
		    <ul>
		        <li><input type="text" placeholder="请输入医院名称" name="orgName" value="${searchName}" style="padding-left:10px"/></li>
		        <li><button id="searchButton" type="button"><img src="/BRHP/statics/image/fff/search-button.png" alt=""/></button></li>
		    </ul>
		</div>
	</form>
	
	<div class="list" style="min-height:500px"><!------------ddd------------------>
	    <div class="order">
	        排序方式
	        <select>
	            <option>医院等级</option>
	            <option>医院等级</option>
	            <option>医院等级</option>
	            <option>医院等级</option>
	        </select>
	    </div>
	    <ul>
	    	<c:forEach items="${hospitalList}" var="hospitalItem">
		        <li>
		            <div class="hospitalPic">
		                <img src="<%=webServerIp %>${hospitalItem.img}" alt="" onclick='showDetail("${hospitalItem.orgId}")' style="cursor:pointer;"/>
		            </div>
		            <div class="hospitalIntr">
		                <h4 onclick='showDetail("${hospitalItem.orgId}")' style="cursor:pointer;">${hospitalItem.orgName}</h4>
		                <p class="elip"><span class="yellow">${hospitalItem.levelChs}</span>&nbsp10km</p>
		                <p class="elip">
		                    <img src="/BRHP/statics/image/fff/telephone.png" alt=""/>&nbsp
		                    <span>${hospitalItem.mobile}</span>&nbsp
		                    <span>${hospitalItem.fixedTelephone}</span>
		                </p>
		                <p class="elip">
		                    <img src="/BRHP/statics/image/fff/address.png" alt="" style="position:relative; top:-2px;"/>&nbsp
		                    <span >${hospitalItem.detailAddress}</span>
		                </p>
		            </div>
		            <div class="pay">
		                <img src="/BRHP/statics/image/fff/card.png" alt="" style="position:relative; top:-2px;"/>
		                <span>在线支付</span>
		            </div>
		        </li>
	        </c:forEach>
	    </ul>
	</div>

</div>




<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">
	$("#searchButton").on('click',function(){
		$("#searchHospitalForm").submit();
	});
	
	function showDetail(orgId){
		//window.open("/BRHP/orgHospital/hospitalDetail?orgId="+orgId);
		//点击到科室列表
		//window.open("/BRHP/orgHospital/getHospitalFirstLevelDepts?orgId="+orgId);
		location.href ="/BRHP/orgHospital/getHospitalFirstLevelDepts?orgId="+orgId
	}
</script>
</body>
</html>