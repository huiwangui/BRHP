<%@page import="com.boco.common.utils.PropertiesUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>黄岛区居民健康门户-预约挂号-${staffDetail.name}</title>
    <link rel="stylesheet" href="/BRHP/statics/css/docDetails.css"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
   <!--   <link rel="stylesheet" href="/BRHP/statics/css/schedul.css">-->
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
    <script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
     <script type="text/javascript" src="/BRHP/statics/js/moment-with-zh-cn.js"></script>
         <% String webServerIp=PropertiesUtils.getValue("ftp_web_server_ip"); %>
<style type="text/css">
    .list-box{
	height:261px;
	width: 700px;
	overflow: hidden;
}
</style>
<style type="text/css">
		.schedul-box{
			width: 700px !important;float: left;
			
		}
		.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}
		.schedul-tab{
		  background: white; width: 100%; height: 250px; overflow: hidden
		}
		.bottom_msg{
			width: 100%;height: 150px;border: 1px solid #ddd; margin-top: 10px; background: white; text-align: center; line-height: 120px;
		}
		.bottom_msg span{
			 margin-right: 20px;
		}
		.bottom_msg i{
			font-style: normal;color: #ce3131;
		}
		.bottom_msg .btn{
			padding: 4px 16px;background: #fec009; border-radius: 3px; color: white;
		}
		.bottom_msg .btn:hover{
			background: #ca9909;
		}
		
		.order_rule{
			width: 340px;height: 411px; float: right; border: 1px solid #ddd; background: white;box-sizing: border-box; padding: 10px 20px;
		}
		
		.order_rule span{
		
		}
		.order_rule p{
			line-height: 22px; font-size: 14px; margin: 10px auto;
		}
		.blue_color{
			color: #1990ff;
		}
		
		*{
	margin:0;
	padding:0;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
.clr{
	clear:both;
}
.pull-left{
	float: left;
}

.schedul-box>p{
	color:#8D8D8D;
	margin-bottom: 15px;
}
.side-table{
	width: 20%;
}
.side-table table,.list-box table{
	width: 100%;
	border-spacing: 0;
	font-size: 14px;
	border:1px solid #EFEFEF;
	border-bottom: 0;
	border-right:0;
	background-color: #FFFFFF;
}
.side-table table tr th a{
 display:inline-block;
	width: 21px;
	height:20px;
	
	vertical-align: middle;
	
}
.side-table table tr th span{
 display:inline-block;width: 80px;
}
.side-table table tr th a.next{
	background-image: url(/BRHP/statics/image/eee/next.png);
	margin-left:-10px;
}
.side-table table tr th a.prev{
	background-image: url(/BRHP/statics/image/eee/prev.png);
	margin-right:-10px;
}
.list-box table{
	border-left: 0;
	table-layout:fixed;
	-webkit-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	transition: all 0.3s ease;
}

.list-box{
	width: 80%; overflow: hidden;
}
.schedul-tab div table tr th,.schedul-tab div table tr td{
	height:70px;
	color:#7C7C7C;
	border-right: 1px solid #EFEFEF;
	border-bottom: 1px solid #EFEFEF;
	text-align: center;
}
.schedul-tab div table tr td{
	height:70px;
}

.schedul-tab div.list-box table tr td p{
	font-size: 10px;
	color: #FFFFFF;
	margin-top: 10px;
    margin-bottom: -10px;
}
.schedul-tab div.list-box table tr td.date-full{
	background-color: #E0DEDB;
	color:#FF6C0A;
}
.schedul-tab div.list-box table tr td.date-free{
	background-color: #FEC009;
	color: #FFFFFF;
	cursor: pointer;
}
.mt20{
	margin-top:20px;
}

	</style>

     
</head>
<body>

<%@ include file="../../include/header.jsp"%>


<div class="hospName">
    ${staffDetail.name}&nbsp;&nbsp;${staffDetail.label}&nbsp;&nbsp;${staffDetail.orgName}
</div>
<div class="docBg">
    <div class="docDetails">
        <div class="docPicture">
            <img src="<%=webServerIp %>${staffDetail.img}" alt=""/>
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
                    <a href="javascript:;">
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


	
		<c:choose>
			<c:when test="${sessionScope.userInSession!=null}">
	<div style="width: 1100px;height: 450px;background-color: #FAFAFA;margin:0 auto;box-sizing: border-box; padding: 20px; border: 1px solid #ddd;">	
			<div class="schedul-box">
						<div class="schedul-tab clearfix">
							<div class="side-table pull-left">
								<table>
									<tr>
										<th>
											<a href="javascript:void(0)" class="prev" ></a>
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
									<tr>
										<td><span>晚上</span></td>
									</tr>
								</table>
							</div>
							<div class="list-box pull-left">
								<table class="list-table" id="tt">
								  <thead>
									  <tr>
											<th><span></span></th>
											<th><span></span></th>
											<th><span></span></th>
											<th><span></span></th>
											<th><span></span></th>
											<th><span></span></th>
											<th><span></span></th>
									   </tr>
								    </thead>
								  <tbody>
									 <tr>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									
									</tr>
									<tr>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									 <td><input type="hidden" name="input"/><span></span></td>
									
									</tr>
									<tr>
									 <td><span></span></td>
									 <td><span></span></td>
									 <td><span></span></td>
									 <td><span></span></td>
									 <td><span></span></td>
									 <td><span></span></td>
									 <td><span></span></td>
									
									</tr>
									</tbody>
								</table>
							<table class="list-table" id="tt2">
								  <thead>
									  <tr>
											<th><span></span></th>
											<th><span></span></th>
											<th><span></span></th>
											<th><span></span></th>
											<th><span></span></th>
											<th><span></span></th>
											<th><span></span></th>
									   </tr>
								    </thead>
								  <tbody>
									 <tr>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
									</tr>
									<tr>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
										 <td><input type="hidden" name="input"/><span></span></td>
									
									</tr>
									<tr>
										 <td><span></span></td>
										 <td><span></span></td>
										 <td><span></span></td>
										 <td><span></span></td>
										 <td><span></span></td>
										 <td><span></span></td>
										 <td><span></span></td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!--上面是table 下面是药费-->
						<div class="bottom_msg mt20" id="mt">
							<p>
								<span>挂号费 : <i></i></span>
								<span>剩余号 : <i></i></span>
								<span><input id="yuyue" name="yuyue" type="hidden"/> <a  href="javascript:;" class="btn" id="mtbt">确认预约</a></span>
							</p>
						</div>
					</div>
					<!--左边结束，右边开始-->
					<div class="order_rule">
						<div class="h">
							预约规则
						</div>
						<div class="c">
							<p><span class="blue_color">预约时间：</span>医院平台预约规则(班次每日14：00更新)</p>
							<p><span class="blue_color">放号时间：</span> 8:30</p>
							<p><span class="blue_color">停挂时间：</span> 所有网上的支付订单都需要去自助预约机上区号；否则如果重新挂号算爽约不予退款。</p>
							<p><span class="blue_color">退号时间：</span> 7天</p>
							<p><span class="blue_color">特殊规则：</span> </p>
							<p style="margin-top: 10px; text-indent: 2em;">
								1.可愈远班次更新时间：每日14：00左右更新
							2.特殊情况盛情预约退费者可在预约时间段之前到医院取号处进行退好神速，逾期不再受理；已支付挂号费的用户请提前30分钟到医院进行取号就诊，过时未取号将作废，爽约或迟到费用不退还，请就诊者悉知，谢谢
							</p>
						</div>
					</div>
				</div>
					
					
				
			</c:when>
			<c:otherwise>
				<div class="schedul-box" style="float:none; margin:20px auto;">
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
										<th><span></span></th>
										<th><span></span></th>
										<th><span></span></th>
										<th><span></span></th>
										<th><span></span></th>
										<th><span></span></th>
										<th><span></span></th>
								</tr>
								<tr>
										<td><span></span></td>
										<td><span></span></td>
										<td><span></span></td>
										<td><span></span></td>
										<td><span></span></td>
										<td><span></span></td>
										<td><span></span></td>
								</tr>
								<tr>
										<td><span></span></td>
										<td><span></span></td>
										<td><span></span></td>
										<td><span></span></td>
										<td><span></span></td>
										<td><span></span></td>
										<td><span></span></td>
								</tr>
							</table>
						</div>
						<div class="clr"></div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
				
<%@ include file="../../include/footer.jsp"%>


<script type="text/javascript">
	$(".side-table tr th a").on("click",function(){//给翻页按钮绑定点击事件 
		if($(this).hasClass("next")){//判断点击的按钮是向前还是向后
			$('#tt').hide()
			$('#tt2').show()
		}else{
			$('#tt2').hide()
			$('#tt').show()
		}
	
		
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

<script type="text/javascript">

console.log($('#tt').length)
var test='${nowday}'
console.log(test)
// 下一天星期几
function getWeek(i){
	 var weekDay=moment(test).add(i, 'days').format("dddd");
	return weekDay
}
function getDay(i){
	var day=moment(test).add(i, 'days').format("YYYY-MM-DD");
	return day
}

function getDayandWeek(i){
	var weekDay=moment(test).add(i, 'days').format("dddd");
	var day=moment(test).add(i, 'days').format("YYYY-MM-DD");
	return weekDay+day
}

 $('.list-table tr:eq(0) th').each(function(j){
	    
         $(this).text(getDayandWeek(j));
  
 })
 //隐藏的table
  $('#tt2 th').each(function(j){
	    
         $(this).text(getDayandWeek(j+7));
  
 })
 
 //赋值 上午 td下的input
 $('.list-table tbody tr:eq(0) td').each(function(i){
	 $(this).find('input').val(getDay(i))
    
 })
  $('.list-table tbody tr:eq(1) td').each(function(i){
	 $(this).find('input').val(getDay(i))
    
 })
 //隐藏的table2
  $('#tt2 tbody tr:eq(0) td').each(function(i){
	 $(this).find('input').val(getDay(i+7))
    
 })
   $('#tt2 tbody tr:eq(1) td').each(function(i){
	 $(this).find('input').val(getDay(i+7))
    
 })
</script>
<script type="text/javascript">
//显示号源
var sss=${ScheDualJson}
console.log(sss)
for(i=0;i<sss.length;i++){
	$('#tt tbody tr:eq(0) td').each(function(j){
		if( $(this).find('input').val()==sss[i].clinicDateStr){
			 if(sss[i].clinicTime==0||sss[i].clinicTime==2){
				//上午显示  预约已满
				if(sss[i].remainderNumber==0){
					var inerHtml="已约满"
					$(this).addClass('date-full')
					$(this).html(inerHtml)
				}
				//上午显示 预约数
				if(sss[i].remainderNumber>0){
					var inerHtml='<span>预约</span>'+
					'<p>'+
					'<label>放号: <span class="">'+sss[i].orderLimit+'</span></label>'+
					'<label>剩余: <span class="">'+sss[i].remainderNumber+'</span></label>'+
					'</p>';
					$(this).addClass('date-free')
					$(this).html(inerHtml)
					//绑定点击事件
					console.log(sss[i].id)
						var Id=sss[i].id
						var labsss=sss[i]
					$(this).on('click',function(){
						//下面便签修改
					        $('#yuyue').val(Id)
							$('#mt i:eq(0)').text(labsss.registrationFee)
							$('#mt i:eq(1)').text(labsss.remainderNumber)
					})
				}
			 }
		}
	    
	 })
	 
	//下午
	
		$('#tt tbody tr:eq(1) td').each(function(j){
			
			if( $(this).find('input').val()==sss[i].clinicDateStr){
				 if(sss[i].clinicTime==1||sss[i].clinicTime==2){
					//下午显示  预约已满
					if(sss[i].remainderNumber==0){
						var inerHtml="已约满"
						$(this).addClass('date-full')
						$(this).html(inerHtml)
					}
					//下午显示 预约数
					if(sss[i].remainderNumber>0){
						var inerHtml='<span>预约</span>'+
						'<p>'+
						'<label>放号: <span class="">'+sss[i].orderLimit+'</span></label>'+
						'<label>剩余: <span class="">'+sss[i].remainderNumber+'</span></label>'+
						'</p>';
						$(this).addClass('date-free')
						$(this).html(inerHtml)
						//绑定点击事件
						console.log(sss[i].id)
						var Id=sss[i].id
						var labsss=sss[i]
						$(this).on('click',function(){
							
							//下面便签修改
							$('#yuyue').val(Id)
							$('#mt i:eq(0)').text(labsss.registrationFee)
							$('#mt i:eq(1)').text(labsss.remainderNumber)
							//order(Id);
							
						})
					}
				 }
			}
		    
		 })
		//table2
		$('#tt2 tbody tr:eq(0) td').each(function(j){
		if( $(this).find('input').val()==sss[i].clinicDateStr){
			 if(sss[i].clinicTime==0||sss[i].clinicTime==2){
				//上午显示  预约已满
				if(sss[i].remainderNumber==0){
					var inerHtml="已约满"
					$(this).addClass('date-full')
					$(this).html(inerHtml)
				}
				//上午显示 预约数
				if(sss[i].remainderNumber>0){
					var inerHtml='<span>预约</span>'+
					'<p>'+
					'<label>放号: <span class="">'+sss[i].orderLimit+'</span></label>'+
					'<label>剩余: <span class="">'+sss[i].remainderNumber+'</span></label>'+
					'</p>';
					$(this).addClass('date-free')
					$(this).html(inerHtml)
					//绑定点击事件
					console.log(sss[i].id)
						var Id=sss[i].id
						var labsss=sss[i]
					$(this).on('click',function(){
						//下面便签修改
							$('#mt i:eq(0)').text(labsss.registrationFee)
							$('#mt i:eq(1)').text(labsss.remainderNumber)
							$('#yuyue').val(Id)
							
					})
				}
			 }
		}
	    
	 })
	//table2下午
		$('#tt2 tbody tr:eq(1) td').each(function(j){
			
			if( $(this).find('input').val()==sss[i].clinicDateStr){
				 if(sss[i].clinicTime==1||sss[i].clinicTime==2){
					//上午显示  预约已满
					if(sss[i].remainderNumber==0){
						var inerHtml="已约满"
						$(this).addClass('date-full')
						$(this).html(inerHtml)
					}
					//上午显示 预约数
					if(sss[i].remainderNumber>0){
						var inerHtml='<span>预约</span>'+
						'<p>'+
						'<label>放号: <span class="">'+sss[i].orderLimit+'</span></label>'+
						'<label>剩余: <span class="">'+sss[i].remainderNumber+'</span></label>'+
						'</p>';
						$(this).addClass('date-free')
						$(this).html(inerHtml)
						//绑定点击事件
						console.log(sss[i].id)
						var Id=sss[i].id
						var labsss=sss[i]
						$(this).on('click',function(){
							//下面便签修改
							$('#yuyue').val(Id)
						    $('#mt i:eq(0)').text(labsss.registrationFee)
							$('#mt i:eq(1)').text(labsss.remainderNumber)
							//order(Id);
						})
					}
				 }
			}
		    
		 })
	
}
//预约
function order(orderId){
	layer.msg('确认要预约吗？', {
		time : 0,
		btn : [ '是', '否' ],
		yes : function() {
			window.location.href="/BRHP/outpatient/appointInfo?orderId="+orderId;
		}
	});
}
$('#mtbt').on('click',function(){
	if($('#yuyue').val()==''||$('#yuyue').val()==null){
		return
	}
	layer.msg('确认要预约吗？', {
		time :0,
		btn : [ '是', '否' ],
		yes : function() {
			window.location.href="/BRHP/outpatient/appointInfo?orderId="+$('#yuyue').val();
		}
	});
	
	
})


</script>
</body>
</html>