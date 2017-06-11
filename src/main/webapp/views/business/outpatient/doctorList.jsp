<%@page import="com.boco.common.utils.PropertiesUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>黄岛区居民健康门户</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
	<link rel="stylesheet" href="/BRHP/statics/css/doctor.css"/>
	<link rel="stylesheet" href="/BRHP/statics/layui/css/layui.css"  media="all">
	<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
	<script type="text/javascript" src="/BRHP/statics/layui/layui.js"></script>
	<script type="text/javascript" src="/BRHP/statics/layui/lay/modules/laypage.js"></script>
      <% String webServerIp=PropertiesUtils.getValue("ftp_web_server_ip"); %>
</head>

<body>
	<%@ include file="../../include/header.jsp"%>
	
	
	<form action="/BRHP/outpatient/doctorList" method="get" id="searchDoctorForm">
		<div class="search">
		    <a href="/BRHP/orgHospital/hospitalList" class="aBorder">医院</a><a href=""  class="aRight">医生</a>
		    <ul>
		        <li><input type="text" placeholder="请输入医生或科室名称" id="name" name="name" value="${searchName}"/></li>
		        <li><button id="searchDocButton" type="button"><img src="/BRHP/statics/image/fff/search-button.png"/></button></li>
		    </ul>
		</div>
	</form>
	<div class="list"><!------------医生列表------------------>
	    <div class="order">
	                       排序
	        <select>
	            <option>评分</option>
	            <option>评分</option>
	            <option>评分</option>
	            <option>评分</option>
	        </select> 

	    </div>
	    <div class="kind">
	        
	       
	    </div>
	    <div class="doctorList" >
	     <ul   id="doctorBoxList">
	   
	     </ul>
	  
	    <!--分页-->
	   
	  <div id="demo2" style="text-align:center;">
	  
	  </div>
	  
	</div>
	
<%@ include file="../../include/footer.jsp"%>

	
	<script type="text/javascript">
		$("#searchDocButton").on('click',function(){
			//
			 var nums=2
			 var str = ''
	     $.ajax({
		    		   type:'GET',
		    		   async: false,
		    		   url:'/BRHP/outpatient/doctorListJson',
		    		   data:{
		    			   pageNo:1,
		    			   pageSize:2,
		    			   name:$('#name').val()
		    		   },
		    	       success:function(data){
		    	    	   var data=data.data
		    	    	   layui.use(['laypage', 'layer'], function(){
		    	    		     var laypage = layui.laypage ,layer = layui.layer;
		    	    		     if(data==''){
		    	    		    	 layer.msg("没找到合适的数据")
		    	    		     }
		    	    	         
		    	    		     })
		    	    	  
		    	    	   var rows=data[0].page.count
		    	    	   var pages=rows%nums==0?(rows/nums):(rows/nums+1);
		    	    	 //此处是返回已经当前页已经分组好的数据
		    	    	   //last = last >= data.data.length ? (data.data.length-1) : last;
		    	    	   for(var i =0 ; i <data.length ; i++){
		    	    		 //  var docimg=data[i].img;
		    	    		      str += '<li class="doctorBox" >'+
		    	    		      '	         <div class="headPic">'+
		    	    		      '	              <div class="headBox">'+
		    	    		      '	              <img src="<%=webServerIp%>'+data[i].img+'" alt=""  style="cursor:pointer;"/>'+
		    	    		      '	              </div><br/>'+
		    	    		      '	               <div class="star">'+
		    	    		      '		              <img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/half-star.png" alt=""/>9.3分'+
		    	    		      '		           </div>'+
		    	    		      '		       </div> '+
		    	    		      '		              <div class="headName">'+
		    	    		      '		                    <p>'+
		    	    		      '		                        <span class="name"  style="cursor:pointer;">'+data[i].name+'</span>&nbsp<span class="position">'+data[i].label+'</span><br/>'+
		    	    		      '		                    </p>'+
		    	    		      '		                    <p>'+
		    	    		      '		                        <span class="department">'+data[i].deptName+'</span>&nbsp&nbsp<span class="hospital">'+data[i].orgName+'</span><br/>'+
		    	    		      '		                    </p>'+
		    	    		      '		                    <p>'+
		    	    		      '		                        <img src="/BRHP/statics/image/ddd/adapt.png" alt=""/>&nbsp<span class="introduce">'+data[i].specialty+'</span>'+
		    	    		      '		                    </p>'+
		    	    		      '		                </div>'+
		    	    		      '		                <div class="orderDoc">'+
		    	    		      '		                    <img src="/BRHP/statics/image/ddd/subscribe2.png" alt="" style="cursor:pointer;" onclick=showOrderLayer("'+data[i].staffId+'","'+data[i].deptId+'","'+data[i].orgId+'")/>'+
		    	    		      '		                </div>  '+
		    	    		      '	      </li>';
		    	    		    }
		    	    	   layui.use(['laypage', 'layer'], function(){
		    	    		     var laypage = layui.laypage ,layer = layui.layer;
		    	    		     
		    	    	           laypage({
		    	    			    cont: 'demo2'
		    	    			    ,pages:pages
		    	    			    ,skin: '#1E9FFF'
		    	    			    ,jump: function(obj, first){
		    	    			    	    //得到了当前页，用于向服务端请求对应数据
		    	    			    	 
		    	    			    	   document.getElementById('doctorBoxList').innerHTML = str
		    	    			     }
		    	    			  });
		    	    		     })
		    	       }
		    		  
		  })
	   
		//
		
		});
		
		function showDetail(staffId){
			window.open("/BRHP/staff/doctorDetail?staffId="+staffId);
		}
		
		function showOrderLayer(staffId,deptId,orgId){
			
		/* 	layer.open({
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
	
<script type="text/javascript">


var rows=${rows}

layui.use(['laypage', 'layer'], function(){
	  var laypage = layui.laypage
	  ,layer = layui.layer;
	  var nums =2;//每页出现的数据量
	
	  var pages=rows%nums==0?(rows/nums):(rows/nums+1);
	  //渲染页面
	  var render = function(curr){
		  var str = '', last = curr*nums - 1;
		  //得到数据
		  $.ajax({
		    		   type:'GET',
		    		   async: false,
		    		   url:'/BRHP/outpatient/doctorListJson',
		    		   data:{
		    			   pageNo:curr,
		    			   pageSize:nums
		    		   },
		    	       success:function(data){
		    	    	   var data=data.data
		    	    	  
		    	    	 //此处是返回已经当前页已经分组好的数据
		    	    	   //last = last >= data.data.length ? (data.data.length-1) : last;
		    	    	   for(var i =0 ; i <data.length ; i++){
		    	    		 //  var docimg=data[i].img;
		    	    		      str += '<li class="doctorBox" >'+
		    	    		      '	         <div class="headPic">'+
		    	    		      '	              <div class="headBox">'+
		    	    		      '	              <img src="<%=webServerIp%>'+data[i].img+'" alt=""  style="cursor:pointer;"/>'+
		    	    		      '	              </div><br/>'+
		    	    		      '	               <div class="star">'+
		    	    		      '		              <img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/star.png" alt=""/><img src="/BRHP/statics/image/ddd/half-star.png" alt=""/>9.3分'+
		    	    		      '		           </div>'+
		    	    		      '		       </div> '+
		    	    		      '		              <div class="headName">'+
		    	    		      '		                    <p>'+
		    	    		      '		                        <span class="name"  style="cursor:pointer;">'+data[i].name+'</span>&nbsp<span class="position">'+data[i].label+'</span><br/>'+
		    	    		      '		                    </p>'+
		    	    		      '		                    <p>'+
		    	    		      '		                        <span class="department">'+data[i].deptName+'</span>&nbsp&nbsp<span class="hospital">'+data[i].orgName+'</span><br/>'+
		    	    		      '		                    </p>'+
		    	    		      '		                    <p>'+
		    	    		      '		                        <img src="/BRHP/statics/image/ddd/adapt.png" alt=""/>&nbsp<span class="introduce">'+data[i].specialty+'</span>'+
		    	    		      '		                    </p>'+
		    	    		      '		                </div>'+
		    	    		      '		                <div class="orderDoc">'+
		    	    		      '		                    <img src="/BRHP/statics/image/ddd/subscribe2.png" alt="" style="cursor:pointer;"  onclick=showOrderLayer("'+data[i].staffId+'","'+data[i].deptId+'","'+data[i].orgId+'") />'+
		    	    		      '		                </div>  '+
		    	    		      '	      </li>';
		    	    		    }
		    	       }
		    		  
		  })
		  
		   return str;
	  };
	  
	  
	  
	  laypage({
		    cont: 'demo2'
		    ,pages:pages
		    ,skin: '#1E9FFF'
		    ,jump: function(obj, first){
		    	    //得到了当前页，用于向服务端请求对应数据
		    	   var  curr = obj.curr;
		    	   document.getElementById('doctorBoxList').innerHTML = render(curr);
		          }
		  });
	});
	

	
</script>
</body>
</html>