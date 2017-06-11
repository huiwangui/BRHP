<%@page import="com.boco.common.utils.PropertiesUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>黄岛区居民健康门户-医生排班</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
    <link rel="stylesheet" href="/BRHP/statics/css/docDetails.css"/>
    <link rel="stylesheet" href="/BRHP/statics/css/schedul.css">
    <script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
    <script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
     <script type="text/javascript" src="/BRHP/statics/js/moment-with-zh-cn.js"></script>
     
      <% String webServerIp=PropertiesUtils.getValue("ftp_web_server_ip"); %>
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
  background-color: #ddd; }

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

.mt10 {
  margin-top: 10px; }

li {
  list-style: none; }

ul {
  margin: 0;
  padding: 0; }

.tr {
  text-align: right; }

.tl {
  text-align: left; }

.clearfix:after {
  content: ".";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden; }

.section1 {
  width: 1100px;
  margin-bottom: 20px;
  height: 250px; }

.section2 {
  width: 1100px;
  margin: 20px auto;
  height: 250px; }

.mb20 {
  margin-bottom: 20px; }

.Teachers_lists {
  width: 1100px;
  margin: 20px auto;
  height: 250px; }

.blue_color {
  color: #1990ff; }

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

.Teacher_detail {
  width: 648px;
  float: right;
  height: 250px; }
  .Teacher_detail .c {
    margin: 20px auto;
    border: 1px solid #333;
    width: 90%;
    height: 80%;
    font-size: 16px; }

.Booking_office {
  width: 1100px;
  padding: 0 20px 20px 20px;
  margin: 0 auto;
  background: #f5f5f5;
  box-sizing: border-box;
  border: 1px solid #ddd; }

.department_box {
  width: 1060px;
  margin: 0 auto; }
  .department_box .h {
    width: 100%;
    height: 50px;
    line-height: 50px;
    font-size: 18px;
    font-weight: 500;
    color: #0184ff; }
  .department_box .c {
    width: 100%;
    background: white; }
    .department_box .c ul {
      width: 100%; }
      .department_box .c ul li {
        float: left;
        display: inline-block;
        width: 250px;
        height: 40px;
        text-align: left;
        line-height: 40px;
        text-indent: 20px; }
        .department_box .c ul li a {
          color: #666; }
          .department_box .c ul li a:hover {
            color: #0184ff; }

.right_order {
  float: left;
  width: 450px;
  height: 250px;
  border: 1px solid #ddd;
  border-left: 0; }
  .right_order .order_rule {
    width: 100%;
    height: 130px;
    border-bottom: 1px solid #ddd; }

.section1 {
  width: 100%;
  height: 245px;
  background: #fafafa; }
  .section1 .technical_offices {
    width: 1100px;
    margin: 0px auto; }
  .section1 .thumbnail {
    width: 300px;
    height: 220px;
    border: 1px solid #ddd;
    box-sizing: border-box;
    padding: 5px;
    float: left;
    margin-top: 15px; }
    .section1 .thumbnail img {
      width: 100%;
      height: 100%;
      border: 0; }
  .section1 .offices_detail {
    float: right;
    width: 780px;
    height: 100%;
    box-sizing: border-box;
    padding: 20px 20px 0 0; }
    .section1 .offices_detail .h {
      font-size: 18px; }

.section2 {
  width: 1100px;
  margin: 0 auto; }
  .section2 .h {
    font-size: 20px; }
  .section2 > .c {
    width: 100%;
    background: #fafafa;
    padding-bottom: 20px;
    margin-top: 10px;
    border: 1px solid #eee; }
    .section2 > .c ul > li {
      float: left;
      border: 1px solid #eee;
      margin: 20px 0 0 20px; }
      .section2 > .c ul > li:hover {
        background: #e6faff; }
    .section2 > .c .img_box {
      float: left;
      width: 130px;
      height: 140px;
      box-sizing: border-box;
      padding: 15px 0 0 15px; }
      .section2 > .c .img_box .thumbnail_circle {
        width: 87px;
        height: 87px;
        border: 1px solid #ddd;
        border-radius: 87px;
        box-sizing: border-box;
        padding: 2px; }
        .section2 > .c .img_box .thumbnail_circle .g {
          width: 100%;
          height: 100%;
          overflow: hidden;
          border-radius: 50%;
          position: relative; }
          .section2 > .c .img_box .thumbnail_circle .g img {
            width: 90px;
            position: absolute;
            top: -2px;
            left: -2px; }
      .section2 > .c .img_box span {
        font-size: 12px; }
    .section2 > .c .msg_box {
      width: 265px;
      float: left;
      height: 140px;
      box-sizing: border-box;
      padding: 20px 0; }
      .section2 > .c .msg_box .name {
        font-size: 18px;
        font-weight: 500;
        margin-right: 20px; }
      .section2 > .c .msg_box .job {
        font-size: 16px; }
      .section2 > .c .msg_box > p.c {
        color: #666; }
    .section2 > .c .btn_box {
      float: right;
      width: 120px;
      height: 120px;
      text-align: center;
      line-height: 140px; }
      .section2 > .c .btn_box a {
        padding: 4px 16px;
        background: #fec009;
        border-radius: 3px;
        color: white;
        font-size: 16px; }
        .section2 > .c .btn_box a:hover {
          background: #ebb20b; }
        .section2 > .c .btn_box a img {
          margin-top: -2px; }

  

     
     </style>
 </head>    
 <body>
<%@ include file="../../include/header.jsp"%>


<div class="hospName">
   预约挂号&nbsp;&gt;${hospitalDetail.orgName}&nbsp;&gt;${deptHospitalVo.name}
</div>
<!-- --------------------------------------------------------------------- -->
	<div class="section1">
		<div class="technical_offices">
			<div class="thumbnail">
				<img src="<%=webServerIp%>${deptHospitalVo.img}" alt="" />
			</div>
			<div class="offices_detail">
				<div class="h">
					${deptHospitalVo.name }
				</div>
				<div class="c mt10">
					<p><span class="blue_color"></span> ${deptHospitalVo.introduction }</p>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="section2">
		<div class="h">
			排班医生
		</div>
		<div class="c clearfix">
			<ul>
			<c:forEach items="${staffList}" var="staff">
				<li>
					<div class="img_box">
						<div class="thumbnail_circle">
							<div class="g">
								<img src="<%=webServerIp%>${staff.img}" alt="" style=""/>
							</div>
						</div>
						<p>
							 <img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/half-star.png" alt=""/>
							<span>97分</span>
						</p>
					</div>
					
					<div class="msg_box">
						<p>
							<span class="name">${staff.name}</span> <span class="job">${staff.label}</span>
						</p>
						<p class="c mt10">
							<img src="/BRHP/statics/image/ddd/adapt.png" alt=""/>
							${staff.specialty}
						</p>
					</div>
					
					<div class="btn_box">
						<a  href="javascript:;" onclick="showOrderLayer('${staff.staffId}','${staff.deptId}','${staff.orgId}')" class="btn">
							<img src="/BRHP/statics/image/ddd/sub-button.png" alt="" />
							挂号
						</a>
					</div>
				</li>
				</c:forEach>
				
			</ul>
		</div>
		
	</div>

<div class="clear"></div>
<%@ include file="../../include/footer.jsp"%>

<script type="text/javascript">


function showOrderLayer(staffId,deptId,orgId){
	/* layer.open({
		  title: false,
		  type: 2,
		  area: ['720px', '400px'],
		  fix: false, //不固定
		  maxmin: false,
		  content: '/BRHP/outpatient/orderList?staffId='+staffId+'&deptId='+deptId+'&deptName='+deptName
	}); */
	window.location.href="/BRHP/orgHospital/ScheDualDetail?deptId="+deptId+"&orgId="+orgId+"&staffId="+staffId;  
}

</script>
</body>



</html>