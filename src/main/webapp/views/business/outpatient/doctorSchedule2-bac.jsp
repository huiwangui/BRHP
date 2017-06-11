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
    <link rel="stylesheet" href="/BRHP/statics/css/schedul.css">
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
    <script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
     <script type="text/javascript" src="/BRHP/statics/js/moment-with-zh-cn.js"></script>
<style type="text/css">
    .list-box{
	height:261px;
	width: 700px;
	overflow: hidden;
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
            <img src="${staffDetail.img}" alt=""/>
        </div>
        <div class="detailsOrder">
            <div class="position">
                <div>
                    <p>
                        <span class="size">${staffDetail.name}</span>&nbsp<span class="size1">${staffDetail.label}</span>&nbsp<img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/half-star.png" alt=""/>9.3分<br/>
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
                        <img src="/BRHP/statics/image/fff/subscribe2.png" alt=""/>
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


	<div style="width: 1000px;height: 600px;background-color: #FAFAFA;margin:0 auto;">
		<c:choose>
			<c:when test="${sessionScope.userInSession!=null}">
				
					<div class="schedul-box">
						<p>注：患者可预约两周以内的号<span></span></p>
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
							<div class="clr"></div>
						</div>
					</div>
					
					
				
			</c:when>
			<c:otherwise>
				<div class="schedul-box">
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
					$(this).on('click',function(){
						
					})
				}
			 }
		}
	    
	 })
	 
	//下午
	
		$('#tt tbody tr:eq(1) td').each(function(j){
			
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
						$(this).on('click',function(){
							
							order(Id);
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
					$(this).on('click',function(){
						
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
						$(this).on('click',function(){
							
							order(Id);
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



</script>
</body>
</html>