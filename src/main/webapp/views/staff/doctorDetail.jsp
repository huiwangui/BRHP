<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>黄岛区居民健康门户-医生详情-${staffDetail.name}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
    <link rel="stylesheet" href="/BRHP/statics/css/docDetails.css"/>
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
</head>
<body>

<%@ include file="../include/header.jsp"%>


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
                        <span class="size">${staffDetail.name}</span>&nbsp<span class="size1">${staffDetail.label}</span>&nbsp<img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/half-star.png" alt=""/>9.3分<br/>
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
                        <img src="/BRHP/statics/image/ddd/subscribe2.png" alt=""/>
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
    <a href="" class="aBorder first">简介</a><a href="/BRHP/staff/doctorDeptInfo?staffId=${staffDetail.staffId}" class="aBorder">科室信息</a><a href="" class="aBorder">患者评价</a><a href="/BRHP/outpatient/doctorSource?staffId=${staffDetail.staffId}">排班信息</a>
</div>
<div class="introduceBox">
    <div class="introduce">
        <p><span>&nbsp&nbsp</span>${staffDetail.introduction}</p>
    </div>
</div>

<%@ include file="../include/header.jsp"%>

</body>
</html>