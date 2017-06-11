<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>预约</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
	<link rel="stylesheet" href="/BRHP/statics/css/pstyle.css"/>
	<link rel="stylesheet" href="/BRHP/statics/css/person.css"/>
	<link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
</head>
<body>

<div class="order_detail" >
			<div class="c clearfix">
				<table >
					<tr>
						<td class="tr">订&nbsp;单&nbsp;号：</td>
						<td class="tl">${orderDetail.deptName}</td>
						<td class="tr">就诊日期：</td>
						<td class="tl">${orderDetail.clinicDateStr}&nbsp;${orderDetail.clinicTimeChs}</td>
					</tr>
					<tr>
						<td class="tr">医 &nbsp;  &nbsp;生：</td>
						<td class="tl">${staffDetail.name}</td>
						<td class="tr">就 &nbsp;诊 &nbsp;人：</td>
						<td class="tl">${orderDetail.patientName}</td>
					</tr>
					<tr>
						<td class="tr">挂&nbsp;号&nbsp;费：</td>
						<td class="tl">${orderDetail.registrationFee}</td>
						<td class="tr">订单状态：</td>
						<td class="tl"><c:choose>
						                  <c:when test="${orderDetail.orderStatus=='0'}">
						                   <span>未付款</span> 
						                  </c:when>
						                  <c:when test="${orderDetail.orderStatus=='1'}">
						                   <span>已付款</span> 
						                  </c:when>
						                  <c:when test="${orderDetail.orderStatus=='2'}">
						                   <span>退款中</span> 
						                  </c:when>
						                  <c:when test="${orderDetail.orderStatus=='3'}">
						                   <span>已退款</span> 
						                  </c:when>
						                  <c:when test="${orderDetail.orderStatus=='4'}">
						                   <span>已取消</span> 
						                  </c:when>
						                  <c:when test="${orderDetail.orderStatus=='5'}">
						                   <span>未评论</span> 
						                  </c:when>
						                  <c:otherwise>
						                   <span>已评论</span> 
						                  </c:otherwise>
						              </c:choose>
						
						</td>
					</tr>
				</table>
			</div>
			<div class="clear"></div>
			<div class="f tc mt20">
				<!-- <a href="/" class="btn_middle">立即支付</a> -->
				<a href="javascript:closeWindow()" class="btn-confirm" id="btn-1">确定</a>
			</div>
		</div>
<script>
function closeWindow(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}

</script>
</body>
</html>