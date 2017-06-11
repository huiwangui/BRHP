<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
<link rel="stylesheet" href="/BRHP/statics/css/new_style.css"/>
<link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
<title>健康教育详情</title>
</head>
<body>
<%@ include file="../include/header.jsp"%>
		<div class="main clearfix">
			<div class="teach_left">
				<!--下面是文章-->
				<div class="article">
					${hvo.content}
				</div>
				
				<div class="Related_news">
					<div class="h">
						相关新闻
					</div>
					<div class="c">
						<ul>
							<li>
								<a href="javascript:void(0)">相关新闻采集中</a>
							</li>
						
						</ul>
						</ul>
					</div>
				</div>
				
			</div>
			
			<!--左边结束右边开始-->
			<div class="teach_right">
				<!--下面是二维码-->
				<div class=" QR_Code">
					<div class="l">
						<img src="/BRHP/statics/image/health/0105045.png" alt="" />
					</div>
					<div class="r">
						<div class="h">
							惠康APP上线
						</div>
						<div class="c">
						家庭医生签约，定制健康管理服务内容为基层首诊提供准确分诊。
						</div>
						<div class="f">
							<a >
								<img src="/BRHP/statics/image/health/170330105129.png"/>
							</a>
						</div>
					</div>
				</div>
				
				<!--下面是法规政策-->
							<div class="policy mt20">
					<div class="h">
						政策法规
					</div>
					<div class="c">
						<div class="case clearfix">
							<div class="h1" id="zch1" style="cursor:pointer;">
								卫计委：医疗服务调价不增加患者负担
							</div>
							<div class="c1">
								<div class="l">
									<img src="" alt="" / id="zcimg">
								</div>
								<div class="r" id="zcr1">
									胜多负少的广泛地换个房间 胜多负少的广泛地换个房间 胜多负少的广泛地换个房间 胜多负少的广泛地换个房间 胜多负少的广泛地换个房间 胜多负少的广泛地换个房间 
								</div>
							</div>
						</div>
						
						<div class="news_list mt10">
							<ul id="zcfor">
								
							</ul>
						</div>
					</div>
				</div>
				
				<!--下面是当日TOP榜-->
				<div class="billboard mt20">
					<div class="h">
						当日TOP榜
					</div>
					<div class="c">
						<ul id="top10">
						  <c:forEach items="${hvoListTop10}" var="fvo" varStatus="status">
							<li>
								<a href="javascript:void(0)" onclick="getdetail(${fvo.id})">
									<span>${status.index+1}</span> ${fvo.title}
								</a>
							</li>
					      </c:forEach>
						</ul>
					</div>
				</div>
				
			</div>
			
			
		</div>
<%@ include file="../include/footer.jsp"%>		
	</body>
<script type="text/javascript">
 var mod5=${mod5Json}
console.log(mod5[0].imgSrc)
document.getElementById('zch1').innerHTML=mod5[0].title;
document.getElementById('zcr1').innerHTML=mod5[0].context;
$('#zch1').on('click',function(){
	getdetail(mod5[0].id)
 })
$('#zcimg').prop("src",mod5[0].imgSrc); 
var zcstr="";
for(i=1;i<mod5.length;i++){
	zcstr=zcstr+'<li>'+
	'	<a href="javascript:void(0)" onclick="getdetail('+mod5[i].id+')">'+mod5[i].title+'</a>'+
	'</li>';
}
document.getElementById('zcfor').innerHTML=zcstr;

getdetail=function(id){
	window.location.href="/BRHP/healthEdu/detail?id="+id;
	
} 
</script>
</html>