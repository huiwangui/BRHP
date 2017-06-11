<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>停诊公告</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
    <link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/docIndex.css"/>
    <link rel="stylesheet" href="/BRHP/statics/js/layer/skin/default/layer.css"/>
    <script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
</head>
<body>
<div class="stop">
       
        <div class="stop-msg msg">
        <c:forEach items="${listStopVo}" var="stop" >
            <div class="stop-border">
                <div class="grade"><span>三甲</span></div>
                <h4>${stop.orgName}</h4>
                <div class="round">
                </div>
                <div class="margin">
                    <span class="blue">${stop.deptName}</span>&nbsp<span>${stop.staffName}</span><br/>
                    <span>${stop.stopReason}</span>
                </div>
            </div>
       </c:forEach>    
            
        </div>
    </div>
</div>

</body>
</html>