<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
		<link rel="stylesheet" href="/BRHP/statics/css/new_style.css"/>
        <link rel="stylesheet" href="/BRHP/statics/css/headCommon.css"/>
        	<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
	</head>
	<body>
	<%@ include file="../include/header.jsp"%>
		<div class="main clearfix">
			<div class="teach_left">
				<!--下面的是banner-->
				<div class="banner" id="banner" >
					<a id="b1"  class="d1" style="background:url(/BRHP/statics/image/health/banner1.jpg) center no-repeat;"></a>
					<a id="b2"  class="d1" style="background:url(/BRHP/statics/image/health/banner2.jpg) center no-repeat;"></a>
					<a id="b3"  class="d1" style="background:url(/BRHP/statics/image/health/banner3.jpg) center no-repeat;"></a>
					<a id="b4" class="d1" style="background:url(/BRHP/statics/image/health/banner4.jpg) center no-repeat;"></a>
					<a id="b5" class="d1" style="background:url(/BRHP/statics/image/health/banner5.jpg) center no-repeat;"></a>
					<div class="d2" id="banner_id">
						<ul>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
				</div>
				
				<div class="t_navbar clearfix">
					<ul>
						<li class="nava_active">
							<a href="javascript:void(0)" >百病防治</a>
						</li>
						<li>
							<a href="javascript:void(0)" id="tab2">健康生活</a>
						</li>
						<li>
							<a href="javascript:void(0)" id="tab3">人群保健</a>
						</li>
						<li>
							<a href="javascript:void(0)" id="tab4">中医疗养</a>
						</li>
					</ul>
				</div>
				
				<!--下面是新闻盒子-->
				 	<!--这是第一个盒子-->
				<div class="wrap_content">
					<div class="news_block mt10 clearfix" id="box1">
					
				    </div>
					
					<!--下面是加载更多-->
					<div class="news_more mt10">
						<a href="javascript:void(0)" id="addmore1">点击加载更多</a>
					</div>
				</div>
					<!--这是第2个盒子-->
				<div class="wrap_content" hidden="">
					<div class="news_block mt10 clearfix" id="box2" >
					</div>
					<!--下面是加载更多-->
					<div class="news_more mt10">
						<a href="javascript:void(0)" id="addmore2">点击加载更多</a>
					</div>
				</div>
					<!--这是第3个盒子-->
				<div class="wrap_content" hidden="">
					<div class="news_block mt10 clearfix" id="box3">
					</div>
					<!--下面是加载更多-->
					<div class="news_more mt10">
						<a href="javascript:void(0)" id="addmore3">点击加载更多</a>
					</div>
				</div>
					<!--这是第4个盒子-->
				<div class="wrap_content" hidden="">
					<div class="news_block mt10 clearfix" id="box4">
					</div>
					<!--下面是加载更多-->
					<div class="news_more mt10">
						<a href="javascript:void(0)" id="addmore4">点击加载更多</a>
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
						  <c:forEach items="${top10}" var="fvo" varStatus="status">
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
</script>
	

<script type="text/javascript">
	
var  hvoListJson=${hvoListJson}
var str=""
for(i=0;i<hvoListJson.length;i++){
	str=str+'				<div class="box">'+
	'							<div class="l">'+
	'								<img src="'+hvoListJson[i].imgSrc+'" alt=""  onclick="getdetail('+hvoListJson[i].id+')" style="cursor:pointer;" />'+
	'							</div>'+
	'							<div class="r">'+
	'								<div class="h" style="cursor:pointer;"  onclick="getdetail('+hvoListJson[i].id+')">'+hvoListJson[i].title+
	'								</div>'+
	'								<div class="c">'+hvoListJson[i].context+
	'</div>'+
	'								<div class="f">'+
	'									<span>'+hvoListJson[i].createTimeStr+'</span>'+
	
	'									<span></span><span></span><span></span>'+
	'									'+
	'								</div>'+
	'							</div>'+
	'						</div>';
	
} 
document.getElementById('box1').innerHTML=str;

</script>
<script type="text/javascript">
$('#tab2').on('click',function(){
	document.getElementById('box2').innerHTML=tabs(2);

})
$('#tab3').on('click',function(moduleId){
	document.getElementById('box3').innerHTML=tabs(3);

})
$('#tab4').on('click',function(moduleId){
	document.getElementById('box4').innerHTML=tabs(4);

})
function  tabs(moduleId){
	var str=""
$.ajax({
	   type:'GET',
	   async: false,
	   url:'/BRHP/healthEdu/byMod',
	   data:{
		   
			 moduleId:moduleId
	   },
success:function(data){
 	  console.log(data)
 	  for(i=0;i<data.length;i++){
 	  str=str+'<div class="box" >'+
 	  '							<div class="l">'+
 	  '								<img src="'+data[i].imgSrc+'" alt="" style="cursor:pointer;"  onclick="getdetail('+data[i].id+')" />'+
 	  '							</div>'+
 	  '							<div class="r">'+
 	  '								<div class="h" style="cursor:pointer;"  onclick="getdetail('+data[i].id+')" >'+
 	  data[i].title+		                 
 	  '								</div>'+
 	  '								<div class="c">'+
 	  data[i].context+
 	  '								</div>'+
 	  '								<div class="f">'+
 	  '									<span>'+data[i].createTimeStr+'</span>'+

 	  '									<span></span><span></span><span></span>'+
 	  '									'+
 	  '								</div>'+
 	  '							</div>'+
 	  '						</div>'+
 	  '					</div>';
    }
   }
}) 
return str

}
</script>
<script type="text/javascript">
var  hvoListJson=${hvoListJson}
     console.log(hvoListJson[0].imgSrc)
/* $("#b1").css("background",'url("'+hvoListJson[0].imgSrc+'")')
$("#b2").css("background",'url("'+hvoListJson[1].imgSrc+'")')
$("#b3").css("background",'url("'+hvoListJson[0].imgSrc+'")')
$("#b4").css("background",'url("'+hvoListJson[1].imgSrc+'")')
$("#b5").css("background",'url("'+hvoListJson[0].imgSrc+'")') */
	//下面的轮播
function banner(){	
	var bn_id = 0;
	var bn_id2= 1;
	var speed33=8000;
	var qhjg = 1;
    var MyMar33;
	$("#banner .d1").hide();
	$("#banner .d1").eq(0).fadeIn("slow");
	if($("#banner .d1").length>1)
	{
		$("#banner_id li").eq(0).addClass("nuw");
		function Marquee33(){
			bn_id2 = bn_id+1;
			if(bn_id2>$("#banner .d1").length-1)
			{
				bn_id2 = 0;
			}
			$("#banner .d1").eq(bn_id).css("z-index","2");
			$("#banner .d1").eq(bn_id2).css("z-index","1");
			$("#banner .d1").eq(bn_id2).show();
			$("#banner .d1").eq(bn_id).fadeOut("slow");
			$("#banner_id li").removeClass("nuw");
			$("#banner_id li").eq(bn_id2).addClass("nuw");
			bn_id=bn_id2;
		};
	
		MyMar33=setInterval(Marquee33,speed33);
		
		$("#banner_id li").click(function(){
			var bn_id3 = $("#banner_id li").index(this);
			if(bn_id3!=bn_id&&qhjg==1)
			{
				qhjg = 0;
				$("#banner .d1").eq(bn_id).css("z-index","2");
				$("#banner .d1").eq(bn_id3).css("z-index","1");
				$("#banner .d1").eq(bn_id3).show();
				$("#banner .d1").eq(bn_id).fadeOut("slow",function(){qhjg = 1;});
				$("#banner_id li").removeClass("nuw");
				$("#banner_id li").eq(bn_id3).addClass("nuw");
				bn_id=bn_id3;
			}
		})
		$("#banner_id").hover(
			function(){
				clearInterval(MyMar33);
			}
			,
			function(){
				MyMar33=setInterval(Marquee33,speed33);
			}
		)	
	}
	else
	{
		$("#banner_id").hide();
	}
}
banner();


// 这个是nav的选项卡

$('.t_navbar li a').on('click',function(){
	var index= $(this).parent().index();
	$(this).parent().addClass('nava_active').siblings().removeClass('nava_active')
	$('.wrap_content').eq(index).show().siblings('.wrap_content').hide();
})


getdetail=function(id){
	window.location.href="/BRHP/healthEdu/detail?id="+id;
	
}

</script>
<script type="text/javascript">
 //点击加载更多 请求后台数据
   var pageSizeM1=2;
 $('#addmore1').on('click',function(){
	var pageSize=pageSizeM1
	var str='';
	 $.ajax({
		   type:'GET',
		   async: false,
		   url:'/BRHP/healthEdu/byModMore',
		   data:{
			     pageNo:1,
				 pageSize:pageSize,
				 moduleId:1
		   },
	       success:function(data){
	    	   if(data==''){
	 	    	 layer.msg("没有数据！")
	 	       }
	 	    	  
	    	  if(data.length<pageSize){
	    		  layer.msg("没有更多数据了！")
	    	  }
	    	  for(i=0;i<data.length;i++){
	    	  str=str+'<div class="box" >'+
	    	  '							<div class="l">'+
	    	  '								<img src="'+data[i].imgSrc+'" alt="" style="cursor:pointer;"  onclick="getdetail('+data[i].id+')" />'+
	    	  '							</div>'+
	    	  '							<div class="r">'+
	    	  '								<div class="h" style="cursor:pointer;"  onclick="getdetail('+data[i].id+')" >'+
	    	  data[i].title+		                 
	    	  '								</div>'+
	    	  '								<div class="c">'+
	    	  data[i].context+
	    	  '								</div>'+
	    	  '								<div class="f">'+
	    	  '									<span>'+data[i].createTimeStr+'</span>'+
	    	  
	    	  '									<span></span><span></span><span></span>'+
	    	  '									'+
	    	  '								</div>'+
	    	  '							</div>'+
	    	  '						</div>'+
	    	  '					</div>';
	       }
	      }
	  }) 
	 document.getElementById('box1').innerHTML=str;
	  return  pageSizeM1=pageSizeM1+2;
 })
var pageSizeM2=2;
 $('#addmore2').on('click',function(){
	 document.getElementById('box2').innerHTML=getMore(2,pageSizeM2); 
	 return pageSizeM2+3;
 })
 var pageSizeM3=2;
 $('#addmore3').on('click',function(){
	 document.getElementById('box3').innerHTML=getMore(3,pageSizeM3); 
	 return pageSizeM3+3;
 })
 var pageSizeM4=2;
 $('#addmore4').on('click',function(){
	 document.getElementById('box4').innerHTML=getMore(4,pageSizeM4); 
	 return pageSizeM4+3;
 })
 
 
getMore= function(moduleId,size){
	 	var pageSize=size
	 	var str='';
	 	 $.ajax({
	 		   type:'GET',
	 		   async: false,
	 		   url:'/BRHP/healthEdu/byModMore',
	 		   data:{
	 			     pageNo:1,
	 				 pageSize:pageSize,
	 				 moduleId:moduleId
	 		   },
	 	       success:function(data){
	 	    	  console.log(data)
	 	    	  if(data==''){
	 	    		 layer.msg("没有数据！")
	 	    	  }
	 	    	  if(data.length<size){
	 	    		 layer.msg("没有更多了")
	 	    	  }
	 	    	  for(i=0;i<data.length;i++){
	 	    	  str=str+'<div class="box" >'+
	 	    	  '							<div class="l">'+
	 	    	  '								<img src="'+data[i].imgSrc+'" alt="" style="cursor:pointer;"  onclick="getdetail('+data[i].id+')" />'+
	 	    	  '							</div>'+
	 	    	  '							<div class="r">'+
	 	    	  '								<div class="h" style="cursor:pointer;"  onclick="getdetail('+data[i].id+')" >'+
	 	    	  data[i].title+		                 
	 	    	  '								</div>'+
	 	    	  '								<div class="c">'+
	 	    	  data[i].context+
	 	    	  '								</div>'+
	 	    	  '								<div class="f">'+
	 	    	  '									<span>'+data[i].createTimeStr+'</span>'+
	 	    	 
	 	    	  '									<span></span><span></span><span></span>'+
	 	    	  '									'+
	 	    	  '								</div>'+
	 	    	  '							</div>'+
	 	    	  '						</div>'+
	 	    	  '					</div>';
	 	       }
	 	      }
	 	  }) 
	 	 
	 	 return str;
 }
</script>
</html>