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
    <link rel="stylesheet" href="/BRHP/statics/css/hospitalList.css"/>
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
    <% String webServerIp=PropertiesUtils.getValue("ftp_web_server_ip"); %>
</head>
<body>

<%@ include file="../include/header.jsp"%>

<div class="list"><!------------医生列表------------------>
  

        <div class="order" >              排序方式
  
        <form action="/BRHP/orgHospital/hospitalList" method="get" id="searchHospitalForm">
	        <select>
            <option>医院等级</option>
            <option>医院名称</option>
            </select>
	         <input type="text" placeholder="请输入医生或医院名称" name="orgName" value="${searchName}"/>
	         <button id="searchButton" type="button" ><img src="/BRHP/statics/image/fff/search-button.png" alt=""/></button>
        </form>    	
    </div>
    <ul>
    	<c:forEach items="${hospitalList}" var="hospitalItem">
	        <li>
	            <div class="hospitalPic">
	                <img src="<%=webServerIp%>${hospitalItem.img}" alt="" onclick='showDetail("${hospitalItem.orgId}")' style="cursor:pointer;"/>
	            </div>
	            <div class="hospitalIntr">
	                <h4 onclick='showDetail("${hospitalItem.orgId}")' style="cursor:pointer;">${hospitalItem.orgName}</h4>
	                <p><span class="yellow">${hospitalItem.levelChs}</span></p>
	                <p>
	                    <img src="/BRHP/statics/image/fff/telephone.png" alt=""/>&nbsp
	                    <span>${hospitalItem.mobile}</span>&nbsp
	                    <span>${hospitalItem.fixedTelephone}</span>
	                </p>
	                <p>
	                    <img src="/BRHP/statics/image/fff/address.png" alt=""/>&nbsp
	                    <span>${hospitalItem.detailAddress}</span>
	                </p>
	            </div>
	            <div class="pay">
	                <img src="/BRHP/statics/image/fff/card.png" alt=""/>
	                <span>在线支付</span>
	            </div>
	        </li>
        </c:forEach>
    </ul>
</div>

<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">
	$("#searchButton").on('click',function(){
		$("#searchHospitalForm").submit();
	});
	
	function showDetail(orgId){
		//window.open("/BRHP/orgHospital/hospitalDetail?orgId="+orgId);
		//点击到科室列表
		window.open("/BRHP/orgHospital/getHospitalFirstLevelDepts?orgId="+orgId);
	}
</script>
</body>
</html>