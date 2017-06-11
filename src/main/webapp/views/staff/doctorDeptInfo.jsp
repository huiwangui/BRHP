<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>黄岛区居民健康门户-医生详情-${parentDeptDetail.name}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
    <link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/docDepartment.css"/>
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
</head>
<body>

<%@ include file="../include/header.jsp"%>

<!-------医院名称--------->
<div class="hospName">
    ${staffDetail.name}&nbsp;&nbsp;${staffDetail.label}&nbsp;&nbsp;${staffDetail.orgName}
</div>
<!-------医生介绍-------->
<div class="docBg">
    <div class="docDetails">
        <!--医生头像-->
        <div class="docPicture">
            <img src="${staffDetail.img}" alt=""/>
        </div>
        <!--右侧介绍-->
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
<!-------板块选择---------->
<div class="choose">
    <a href="/BRHP/staff/doctorDetail?staffId=${staffDetail.staffId}" class="aBorder first">医生简介</a><a href="" class="aBorder second">科室信息</a><a href="" class="aBorder">患者评价</a><a href="/BRHP/outpatient/doctorSource?staffId=${staffDetail.staffId}">排班信息</a>
</div>
<!--------板块内容------------>
<div class="introduceBox">
    <div class="introduce">
        <div class="department-top">
            <!--科室照片-->
            <div class="department-pic">
                <img src="${parentDeptDetail.img}" alt=""/>
            </div>
            <!--科室信息-->
            <div class="department-intr">
                <div>
                    <p><span class="text-color">${parentDeptDetail.name}</span>&nbsp&nbsp&nbsp<span>省级重点学科</span></p>
                </div>
                <div class="tel">
                    <div class="tel-width">
                        <span class="text-color">咨询电话:</span>
                    </div>
                    <div>
                        <span>医生办公室：028-83965675</span><br/>
                        <span>护士办公室：028-39761251</span><br/>
                    </div>
                </div>
                <div class="intr-width">
                    <p class="text-color">科室简介</p>
                    <span>${parentDeptDetail.introduction}</span>
                </div>
            </div>
        </div>
        <!--诊疗范围-->
        <div class="department-bot">
            <p class="text-color">诊疗范围</p>
            <span>${parentDeptDetail.serviceScope}</span>
            <p class="text-color">诊疗优势及特色</p>
            <span>始终以老年疾病研究为中心，将老年心脑血管病作为研究重点，对老年人最常见的冠心病、心力衰竭、脑血管病等领域进行了系统、深入的基础与临床综合研究</span>
            <p class="text-color">科研情况</p>
            <span>2000年，首次在医学院校中开展重症医学专业方向班教学，此为国内最早开展重症医学本科教学的学科之一，每年招收本科学生40余人。至目前为止，已经开展自本科到博士
           	 的多层次重症医学教育，开设《危重症监护医学》、《呼吸治疗学》和《人工通气临床应用》课程。每年开设国家级教育项目《呼吸和危重症监护医学学习班》，招收全国各地进修医生20-30人/年。</span>
        </div>
    </div>
</div>

<%@ include file="../include/header.jsp"%>

</body>
</html>