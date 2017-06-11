<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>黄岛区居民健康门户-医生排班</title>
    
    <link rel="stylesheet" href="/BRHP/statics/css/docDetails.css"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
    <link rel="stylesheet" href="/BRHP/statics/css/schedul.css">
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
    <script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
     <script type="text/javascript" src="/BRHP/statics/js/moment-with-zh-cn.js"></script>
     <style type="text/css">
   article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
nav,
section,
summary {
  display: block; }

audio,
canvas,
video {
  display: inline-block;
  *display: inline;
  *zoom: 1; }

audio:not([controls]) {
  display: none;
  height: 0; }

[hidden], template {
  display: none; }

html {
  font-size: 100%;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%; }

html,
button,
input,
select,
textarea {
  font-family: sans-serif; }

body {
  margin: 0; }

a {
  background: transparent; }
  a:hover, a:active {
    outline: 0; }

abbr[title] {
  border-bottom: 1px dotted; }

b,
strong {
  font-weight: bold; }

blockquote {
  margin: 1em 40px; }

dfn {
  font-style: italic; }

mark {
  background: #ff0;
  color: #000; }

code,
kbd,
pre,
samp {
  font-family: monospace, serif;
  _font-family: 'courier new', monospace;
  font-size: 1em; }

pre {
  white-space: pre;
  white-space: pre-wrap;
  word-wrap: break-word; }

q {
  quotes: "\201C" "\201D" "\2018" "\2019"; }

q {
  quotes: none; }

q:before,
q:after {
  content: '';
  content: none; }

small {
  font-size: 80%; }

sub,
sup {
  font-size: 75%;
  line-height: 0;
  position: relative;
  vertical-align: baseline; }

sup {
  top: -0.5em; }

sub {
  bottom: -0.25em; }

dl,
ol,
ul {
  margin: 1em 0; }

dd {
  margin: 0 0 0 40px; }

ol,
ul {
  padding: 0 0 0 40px; }

nav ul,
nav ol {
  list-style-image: none; }

img {
  border: 0;
  -ms-interpolation-mode: bicubic; }

svg:not(:root) {
  overflow: hidden; }

fieldset {
  border: 1px solid #c0c0c0;
  margin: 0 2px;
  padding: 0.35em 0.625em 0.75em; }

legend {
  border: 0;
  padding: 0;
  white-space: normal;
  *margin-left: -7px; }

button,
input,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
  margin: 0;
  vertical-align: baseline;
  *vertical-align: middle; }

button,
input {
  line-height: normal; }

button,
select {
  text-transform: none; }

button,
html input[type="button"],
input[type="reset"],
input[type="submit"] {
  -webkit-appearance: button;
  cursor: pointer;
  *overflow: visible; }

button[disabled],
input[disabled] {
  cursor: default; }

input[type="checkbox"],
input[type="radio"] {
  box-sizing: border-box;
  padding: 0;
  *height: 13px;
  *width: 13px; }

input[type="search"] {
  -webkit-appearance: textfield;
  -moz-box-sizing: content-box;
  -webkit-box-sizing: content-box;
  box-sizing: content-box; }

input[type="search"]::-webkit-search-cancel-button,
input[type="search"]::-webkit-search-decoration {
  -webkit-appearance: none; }

input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
  height: auto; }

button::-moz-focus-inner, input::-moz-focus-inner {
  border: 0;
  padding: 0; }

textarea {
  overflow: auto;
  vertical-align: top; }

optgroup {
  font-weight: bold; }

table {
  border-collapse: collapse;
  border-spacing: 0; }

html {
  overflow-y: scroll;
  -webkit-overflow-scrolling: touch;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%; }

body {
  font-size: 14px;
  line-height: 1.5;
  color: #333;
  background-color: #fff; }

body,
button,
input,
select,
textarea {
  font-family: "Microsoft Yahei", Helvetica, Tahoma, sans-serif; }

img {
  vertical-align: middle; }

textarea {
  resize: vertical; }

h1, h2, h3, h4, h5, h6, p, figure, form {
  margin: 0; }

ul, ol, li, dl, dd {
  margin: 0;
  padding: 0; }

ul, ol {
  list-style: none outside none; }

h1, h2, h3 {
  line-height: 2;
  font-weight: normal; }

h1 {
  font-size: 21px; }

h2 {
  font-size: 18.2px; }

h3 {
  font-size: 16.38px; }

h4 {
  font-size: 14px; }

h5, h6 {
  font-size: 11.9px;
  text-transform: uppercase; }

a {
  text-decoration: none;
  color: #08c; }
  a:hover {
    color: #006699; }

input:-moz-placeholder,
textarea:-moz-placeholder {
  color: #ccc; }

input::-moz-placeholder,
textarea::-moz-placeholder {
  color: #ccc; }

input:-ms-input-placeholder,
textarea:-ms-input-placeholder {
  color: #ccc; }

input::-webkit-input-placeholder,
textarea::-webkit-input-placeholder {
  color: #ccc; }

.mt20 {
  margin-top: 20px; }

li {
  list-style: none; }

ul {
  margin: 0;
  padding: 0; }

.clearfix:after {
  content: ".";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden; }

.mb20 {
  margin-bottom: 20px; }

.Teachers_lists {
  width: 1100px;
  margin: 20px auto;
  height: 250px; }

.week_table {
  width: 640px;
  height: 252px;
  float: left;
  overflow: hidden;
  position: relative; }
  .week_table .go {
    position: absolute;
    z-index: 1000;
    width: 30px;
    height: 80px;
    right: 0; }
  .week_table .back {
    position: absolute;
    z-index: 1000;
    width: 30px;
    height: 80px;
    left: 0; }
  .week_table .wrap {
    position: relative;
    width: 1284px;
    height: 250px; }
    .week_table .wrap table {
      border: 1px solid #ddd;
      text-align: center;
      border-collapse: collapse;
      float: left;
      width: 640px;
      float: left; }
      .week_table .wrap table th {
        background: #f5f5f5; }

.Teachers_msg {
  float: left;
  width: 450px;
  height: 100%;
  border: 1px solid #ddd;
  border-right: 0; }
  .Teachers_msg .img_box {
    width: 40%;
    float: left;
    height: 100%; }
    .Teachers_msg .img_box img {
      width: 80%;
      height: 90%;
      border: 1px solid #ddd;
      margin: 10px; }
  .Teachers_msg .msg_box {
    width: 60%;
    float: right; }
    .Teachers_msg .msg_box .h {
      margin-top: 10px;
      width: 100%;
      line-height: 40px;
      border-bottom: 1px dashed #ddd; }
      .Teachers_msg .msg_box .h .name {
        font-size: 20px;
        font-weight: 500;
        color: #2f3cee; }
    .Teachers_msg .msg_box .c {
      line-height: 40px; }

.department_box {
  width: 1100px;
  margin: 0 auto; }
  .department_box .h {
    width: 100%;
    height: 50px;
    line-height: 50px;
    text-indent: 20px;
    font-size: 20px;
    font-weight: 600;
    color: white;
    background-image: -webkit-repeating-linear-gradient(top, #b2d9fe, #8cc6fd 50%, #b2d9fe);
    background-image: -o-repeating-linear-gradient(top, #b2d9fe, #8cc6fd 50%, #b2d9fe);
    background-image: repeating-linear-gradient(to bottom, #b2d9fe, #8cc6fd 50%, #b2d9fe); }
  .department_box .c {
    width: 100%;
    height: 150px;
    display: none; }
    .department_box .c ul {
      width: 100%; }
      .department_box .c ul li {
        float: left;
        display: inline-block;
        width: 250px;
        height: 40px;
        text-align: left;
        line-height: 40px; }
   
     </style>
</head>
<body>

<%@ include file="../../include/header.jsp"%>

<div class="hospName">
    ${staffDetail.name}&nbsp;&nbsp;${staffDetail.label}&nbsp;&nbsp;${staffDetail.orgName}
</div>
<!-- 科室信息 -->
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
<!--fff  -->
	    <div class="doctorList">
	    	<c:forEach items="${doubleList}" var="doctorItem">
	    		<ul>
		            <li class="doctorBox">
		                <div class="headPic">
		                	<div class="headBox">
		                   	 	<img src="${doctorItem.img1}" alt="" onclick='showDetail("${doctorItem.staffId1}")' style="cursor:pointer;"/>
		                   	 </div><br/>
		                    <div class="star">
		                        <img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/half-star.png" alt=""/>9.3分
		                    </div>
		                </div>
		                <div class="headName">
		                    <p>
		                        <span class="name" onclick='showDetail("${doctorItem.staffId1}")' style="cursor:pointer;">${doctorItem.name1}</span>&nbsp<span class="position">${doctorItem.lable1}</span><br/>
		                    </p>
		                    <p>
		                        <span class="department">${doctorItem.deptName1}</span>&nbsp&nbsp<span class="hospital">${doctorItem.orgName1}</span><br/>
		                    </p>
		                    <p>
		                        <img src="/BRHP/statics/image/fff/adapt.png" alt=""/>&nbsp<span class="introduce">${doctorItem.specialty1}</span>
		                    </p>
		                </div>
		                <div class="orderDoc">
		                    <img src="/BRHP/statics/image/fff/subscribe2.png" alt="" style="cursor:pointer;" onclick='showOrderLayer("${doctorItem.staffId1}","${doctorItem.deptId1}","${doctorItem.deptName1}")'/>
		                </div>
		            </li>
		            <c:if test="${not empty doctorItem.name2}">
		            	<li>
		                <div class="headPic">
		                	<div class="headBox">
		                    	<img src="${doctorItem.img2}" alt="" onclick='showDetail("${doctorItem.staffId2}")' style="cursor:pointer;"/>
		                    </div><br/>
		                    <div class="star">
		                        <img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/star.png" alt=""/><img src="/BRHP/statics/image/fff/half-star.png" alt=""/>9.3分
		                    </div>
		                </div>
		                <div class="headName">
		                    <p>
		                        <span class="name" onclick='showDetail("${doctorItem.staffId2}")' style="cursor:pointer;">${doctorItem.name2}</span>&nbsp<span class="position">${doctorItem.lable2}</span><br/>
		                    </p>
		                    <p>
		                        <span class="department">${doctorItem.deptName2}</span>&nbsp&nbsp<span class="hospital">${doctorItem.orgName2}</span><br/>
		                    </p>
		                    <p>
		                        <img src="/BRHP/statics/image/fff/adapt.png" alt=""/>&nbsp<span class="introduce">${doctorItem.specialty2}</span>
		                    </p>
		                </div>
		                <div class="orderDoc">
		                    <img src="/BRHP/statics/image/fff/subscribe2.png" alt="" style="cursor:pointer;" onclick='showOrderLayer("${doctorItem.staffId2}","${doctorItem.deptId2}","${doctorItem.deptName2}")'/>
		                </div>
		           	 </li>
		            </c:if>
		        </ul>
	    	</c:forEach>
	    </div>


<%@ include file="../../include/footer.jsp"%>


<script type="text/javascript">
	$(".side-table tr th a").on("click",function(){//给翻页按钮绑定点击事件 
		if($(this).hasClass("next")){//判断点击的按钮是向前还是向后
			var mgl=clickNext();
		}else{
			var mgl=0; 
		}
	
		$(this).parent().parent().parent().parent().parent().next().find("table").css({"margin-left":-mgl+"px"}); 
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
	
	$('.week_table>a').on('click',function(){
		var width=$('.week_table').width();
			if($(this).is(".go") ){
				$(this).siblings('.wrap').stop(true,true).animate({
					marginLeft: '-640px'
				},'slow');
			}else if($(this).is(".back") ){
				$(this).siblings('.wrap').stop(true,true).animate({
					marginLeft:"0"
				},'slow');
			}
		})

</script>


<script  type="text/javascript"> 

var test='${nowday}'

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
var arrT1=$('.t1')
for(i=0;i<arrT1.length;i++){
 $('.t1:eq('+i+') th').each(function(j){
	  var text = $(this).text();
	  
	  if(j==0||j==8){
         
      }else {
         $(this).text(getDayandWeek(j-1));
      }
	
 })
}     
var arrT2=$('.t2')
for(i=0;i<arrT2.length;i++){
 $('.t2:eq('+i+') th').each(function(j){
	  var text = $(this).text();
	  
	  if(j==0||j==8){
         
      }else {
         $(this).text(getDayandWeek(j+6));
      }
	
 })
} 

for(i=0;i<arrT1.length;i++){
$('.t1:eq('+i+') tbody tr:eq(0) td').each(function(j){
	  var text = $(this).text();
	  
	  if(j==0||j==8){
         
      }else {
    	  $(this).find('input').val(getDay(j-1))
      }
	
})
}
for(i=0;i<arrT1.length;i++){
	$('.t1:eq('+i+') tbody tr:eq(1) td').each(function(j){
		  var text = $(this).text();
		  
		  if(j==0||j==8){
	         
	      }else {
	    	  $(this).find('input').val(getDay(j-1))
	      }
		
	})
	}

for(i=0;i<arrT2.length;i++){
$('.t2:eq('+i+') tbody tr:eq(0) td').each(function(j){
	  var text = $(this).text();
	  
	  if(j==0||j==8){
         
      }else {
          $(this).find('input').val(getDay(j+6))
      }
	
})
}

for(i=0;i<arrT2.length;i++){
	$('.t2:eq('+i+') tbody tr:eq(1) td').each(function(j){
		  var text = $(this).text();
		  
		  if(j==0||j==8){
	         
	      }else {
	          $(this).find('input').val(getDay(j+6))
	      }
		
	})
	}

var sss=${ScheDualingJson}
console.log(sss)
for(i=0;i<sss.length;i++){
//遍历listSource
  var listSource= sss[i].listSource
  for(j=0;j<listSource.length;j++){
	  //t1
	    
	    console.log(listSource[j].staffId)
	  $('.t1:eq('+i+') tbody tr:eq(0) td').each(function(h){
		 
	    	 if( $(this).find('input').val()==listSource[j].clinicDateStr){
	    		 if(listSource[j].clinicTime==0||listSource[j].clinicTime==2){
	    			  $(this).find('a').text('挂号')
	    			  var soucre=listSource[j]
	    			  $(this).find('a').on('click',function(){
	    				 var staffId=soucre.staffId
	    				 var orgId=soucre.orgId
	    				 var deptId=soucre.deptId
	    				 window.location.href="/BRHP/orgHospital/ScheDualDetail?deptId="+deptId+"&orgId="+orgId+"&staffId="+staffId;  
	    			  })
		    		   
	    		 }
	    	 }
	  })
	   $('.t1:eq('+i+') tbody tr:eq(1) td').each(function(h){
		 
	    	 if( $(this).find('input').val()==listSource[j].clinicDateStr){
	    		 
	    		 if(listSource[j].clinicTime==1||listSource[j].clinicTime==2){
	    			  $(this).find('a').text('挂号')
	    			  var soucre=listSource[j]
	    			 $(this).find('a').on('click',function(){
	    				 var staffId=soucre.staffId
	    				 var orgId=soucre.orgId
	    				 var deptId=soucre.deptId
	    				 window.location.href="/BRHP/orgHospital/ScheDualDetail?deptId="+deptId+"&orgId="+orgId+"&staffId="+staffId;  
	    			  })
		    	 }
	    	 }
	  })
	  //t2
	  $('.t2:eq('+i+') tbody tr:eq(0) td').each(function(h){
		 
	    	 if( $(this).find('input').val()==listSource[j].clinicDateStr){
	    		 if(listSource[j].clinicTime==0||listSource[j].clinicTime==2){
	    			  $(this).find('a').text('挂号')
	    			  var soucre=listSource[j]
	    			  $(this).find('a').on('click',function(){
	    				 var staffId=soucre.staffId
	    				 var orgId=soucre.orgId
	    				 var deptId=soucre.deptId
	    				 window.location.href="/BRHP/orgHospital/ScheDualDetail?deptId="+deptId+"&orgId="+orgId+"&staffId="+staffId;  
	    			  })
	    		 }
	    	 }
	  })
	   $('.t2:eq('+i+') tbody tr:eq(1) td').each(function(h){
		 
	    	 if( $(this).find('input').val()==listSource[j].clinicDateStr){
	    		 
	    		 if(listSource[j].clinicTime==1||listSource[j].clinicTime==2){
		    		  $(this).find('a').text('挂号')
		    		  var soucre=listSource[j]
		    		  $(this).find('a').on('click',function(){
	    				 var staffId=soucre.staffId
	    				 var orgId=soucre.orgId
	    				 var deptId=soucre.deptId
	    				 window.location.href="/BRHP/orgHospital/ScheDualDetail?deptId="+deptId+"&orgId="+orgId+"&staffId="+staffId;  
	    			  })
		    	 }
	    	 }
	  })
	  
  }
}
//点击挂号 转到号表预约详细页面	

 
</script>
</body>
</html>