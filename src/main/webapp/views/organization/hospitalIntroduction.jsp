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
    <link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/hospitalIntr.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/new_style.css"/>
    <link rel="stylesheet" href="/BRHP/statics/js/layer/skin/default/layer.css"/>
    <script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
    <script type="text/javascript" src="/BRHP/statics/js/moment-with-zh-cn.js"></script>
     <% String webServerIp=PropertiesUtils.getValue("ftp_web_server_ip"); %>
</head>

<body>
<%@ include file="../include/header.jsp"%>

<!-------医院名称------>
<div class="hospName">
    ${hospitalDetail.orgName}
</div>
<!--医院介绍-->
<div class="hosBg" style="margin-bottom:20px">
    <div class="hosDetails">
        <!--医院图片-->
        <div class="hosPicture">
            <img src="<%=webServerIp %>${hospitalDetail.img}" alt=""/>
        </div>
        <!--医院介绍-->
        <div class="hosIntr">
            <p>
                <span class="hosName">${hospitalDetail.orgName}</span>&nbsp
                <span class="hosGrade">${hospitalDetail.levelChs}</span>&nbsp
                <img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/half-star.png" alt=""/>&nbsp
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


 




		<div class="Booking_office mt20">
			<c:forEach items="${ListDepts}" var="deptsItem">
			<div class="department_box clearfix">
				<div class="h">
					<a href="#" onclick="schedual(${deptsItem['firstDeptId']},${deptsItem['orgId']})">${deptsItem["firstName"]}</a>
				</div>
				<div class="c clearfix">
					<ul>
					<c:forEach items="${deptsItem['secondName']}" var="secondItem">
						<li>
							 <a href="#" onclick="schedual(${secondItem.deptId},${secondItem.orgId})">${secondItem.name}</a>
						</li>
					</c:forEach>		
					</ul>
				</div>
			</div>
			</c:forEach>	
			
		</div>
     
     	
            
           


<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">
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

var sss=${ListDeptsJson}

</script>
<script type="text/javascript">
		$(function(){
			$('.department_box').each(function(){
				if(!!$('.c li',this)[0]){
					$(this).find('.c').show()
				}
			})
		})
</script>

<script type="text/javascript">
 schedual=function(deptId ,orgId){
	
		//window.location.href="/BRHP/orgHospital/ScheDualInfo?deptId="+deptId+"&orgId="+orgId;
	 window.location.href="/BRHP/outpatient/doctorSourceBydeptId?deptId="+deptId+"&orgId="+orgId;
	   
   }
</script>
</body>
</html>