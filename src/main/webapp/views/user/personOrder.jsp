<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的预约</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
			<link rel="stylesheet" href="/BRHP/statics/css/pstyle.css"/>
			<link rel="stylesheet" href="/BRHP/statics/css/person.css"/>
			<link rel="stylesheet" href="/BRHP/statics/css/bootstrap.min.css" />
			<link rel="stylesheet" href="/BRHP/statics/css/bootstrap-table.css" />
			<link rel="stylesheet" href="/BRHP/statics/css/headCommon.css" />
			<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
			<script type="text/javascript" src="/BRHP/statics/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="/BRHP/statics/js/bootstrap-table.js"></script>
			<script type="text/javascript"src="/BRHP/statics/js/bootstrap-table-zh-CN.js"></script>
			<script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
			<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
			<script type="text/javascript"src="/BRHP/statics/js/My97DatePicker/WdatePicker.js"></script>
	<style>
	a:hover{
				text-decoration:none;
			}
	</style>
	
	</head>
	
	<body>
	
		<%@ include file="../include/header.jsp"%>
	
		<div class="message-box">
		   <div class="left-msg">
		        <ul>
		            <li>
		                <a  href="/BRHP/user/personalInfo" >
		                   <img src="/BRHP/statics/image/bbb/Personal_information.png" alt=""/>
		                    <span>用户首页</span>
		                </a>
		            </li>
		            <li>
		                <a href="/BRHP/user/changePersonInfo">
		                    <img src="/BRHP/statics/image/bbb/files.png" alt=""/>
		                    <span>修改/完善资料</span>
		                </a>
		            </li>
		            <li>
		                <a href="/BRHP/user/userOrders" class="current">
		                    <img src="/BRHP/statics/image/bbb/order1.png" alt=""/>
		                    <span>我的预约</span>
		                </a>
		            </li>
		            <li>
		                <a href="/BRHP/user/userPatients">
		                    <img src="/BRHP/statics/image/bbb/Patient.png" alt=""/>
		                    <span>就诊人管理</span>
		                </a>
		            </li>
		            <li>
		                <a href="/BRHP/user/userSafe">
		                    <img src="/BRHP/statics/image/bbb/safe_black.png" alt=""/>
		                    <span>安全设置</span>
		                </a>
		            </li>
		            <li>
		                <a href="">
		                    <img src="/BRHP/statics/image/bbb/message.png" alt=""/>
		                    <span>我的消息</span>
		                </a>
		            </li>
		            <li>
		                <a href="">
		                    <img src="/BRHP/statics/image/bbb/feedback.png" alt=""/>
		                    <span>投诉反馈</span>
		                </a>
		            </li>
		        </ul>
		    </div>
		    <div class="right_msg">
			    	<div class="h">
			        		你好，欢迎来到会员中心
			        </div>
		        <div class="msg_p4 clearfix">
		        	<div class="h">
		        		<span class="sel">
		        				<label>按状态筛选</label>
					    			<select class="form-control" id="orderStatus">
									  <option value="">--请选择--</option>
									  <option value="0">未付款</option>
									  <option value="1">已付款</option>
									  <option value="2">正在退款</option>
									  <option value="3">已退款</option>
									  <option value="4">已取消</option>
									  <option value="5">未评论</option>
									  <option value="6">已评论</option>
									</select>
	        			<span>
	        				<img src="/BRHP/statics/image/eee/search_2.png"/>
	        			</span>
		        		</span>
						
						
		        		<span class="data_time">
		        			按时间筛选
		        		<input type="text" class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})" id="queryStartTimeStr">
		        			<span class="pic1">
		        				<img src="/BRHP/statics/image/eee/search_data.png" alt="" style="margin-top:1px"/>
		        			</span>
		        			至
		        			<input type="text" class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})" id="queryEndTimeStr">
		        			<span class="pic2">
		        				<img src="/BRHP/statics/image/eee/search_data.png" alt="" style="margin-top:1px"/>
		        			</span>
		        		</span>
		        		
		        		<a href="javascript:;" >
		        			<img id="searchButton" src="/BRHP/statics/image/bbb/search_1.png"/ style="margin-top: -4px">
		        		</a>
		        	</div>
		        	
		        	<div class="c mt10">
		        	   <table id="dataTable"></table>
		        	</div>
		   	    </div>    	
			</div>
		</div>
		
		
		
		<div class="order_detail" hidden="">
			<div class="c clearfix">
				<table >
					<tr>
						<td class="tr">订&nbsp;单&nbsp;号：</td>
						<td class="tl">123366456</td>
						<td class="tr">就诊日期：</td>
						<td class="tl">2000年3月3日上午</td>
					</tr>
					<tr>
						<td class="tr">医 &nbsp;  &nbsp;生：</td>
						<td class="tl">data</td>
						<td class="tr">就 &nbsp;诊 &nbsp;人：</td>
						<td class="tl">2000年3月3日上午</td>
					</tr>
				</table>
			</div>
			<div class="clear"></div>
			<div class="f tc mt20">
				<a href="/" class="btn_middle">立即支付</a>
			</div>
		</div>
		<script type="text/javascript">
		function initTable() {
			$('#dataTable').bootstrapTable({
				url : "/BRHP/outpatient/getOrderList",
				method : 'get',
				pagination : 'true',
				pageSize :10,
				pageList : [ 10, 20, 50 ],
				clickToSelect : false,
				singleSelect : false,
				selectItemName : 'state',
				paginationLoop:true,
				//onlyInfoPagination:false,
				queryParams : function(params){
					var queryParams = {
						limit : params.limit,
						offset : params.offset,
						search : params.search,
						sort : params.sort,
						order : params.order,
						orderStatus : $("#orderStatus").val(),
						queryStartTimeStr : $("#queryStartTimeStr").val(),
						queryEndTimeStr :  $("#queryEndTimeStr").val()
					}
					return queryParams;
				},
				columns : [{
					field : 'id',
					align : 'center',
					title : 'ID',
					visible : false
				},  {
					field : 'clinicDateStr',
					align : 'center',
					title : '就诊日期'
				}, {
					field : 'staffId',
					align : 'center',
					title : '医生编号',
					visible : false
				},{
					field : 'staffName',
					align : 'center',
					title : '医生'
				}, {
					field : 'patientName',
					align : 'center',
					title : '就诊人'
				}, {
					field : 'registrationFee',
					align : 'center',
					title : '挂号费'
				}, {
					// 0.未付款 1.已付款 2.正在退款 3.已退款 4.已取消 5.未评论 6.已评论
					field : 'orderStatus',
					align : 'center',
					title : '订单状态',
					formatter : function(value,row,index) {
						if (value == '0') {
							return '<span class="label label-warning">未付款</span>&nbsp;&nbsp;&nbsp; <a href="javascript:;" onclick="goPay(\''+ row.id + '\')" class="btn_small"> 去支付</a>';
						} else if(value == '1'){
							return '已付款';
						}else if(value == '2'){
							return '退款中';
						}else if(value == '3'){
							return '已退款';
						}else if(value == '4'){
							return '<span class="label label-default">已取消</span>';
						}else if(value == '5'){
							return '未评论';
						}else if(value == '6'){
							return '已评论';
						}
					}
				},{
					align : 'center',
					title : '操作',
				    formatter : function(value,row,index) {
				    	if(row.orderStatus=='0'){
				    		var item = '<a href="javascript:void(0)" onclick="getOderDetail('+ row.staffId +','+row.id+')" class="blue_color">详情</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="cancleOrder('+ row.id +','+row.outpatientSourceId+',\''+row.clinicDateStr+'\')" class="blue_color">取消</a>';
				    		return item;
				    	}else if(row.orderStatus=='1'){
				    		return '<a href="javascript:void(0)" onclick="getOderDetail('+ row.staffId +','+row.id+')" class="blue_color">详情</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="cancleOrder('+ row.id +','+row.outpatientSourceId+',\''+row.clinicDateStr+'\')" class="blue_color">取消</a>'
				    	}else{
				    		return '<a href="javascript:void(0)" onclick="getOderDetail('+ row.staffId +','+row.id+')" class="blue_color">详情</a>&nbsp;&nbsp;&nbsp;<a   class="gray_color">取消</a>'
				    	}
				    }
				}],
				onLoadSuccess : function(data) {

				}
			});
		}
		initTable();
		$("#searchButton").on("click", function() {
			$("#dataTable").bootstrapTable('refresh');
		});
		
	    //订单详情
		function getOderDetail(staffId,id,deptName){
		
			parent.layer.open({
				  type: 2,
				  skin: 'layui-layer-rim', //加上边框
				  area: ['560px', '350px'], //宽高
				  fix: false, //不固定
				  maxmin: false,
				  scrollbar:false,
				  title: false,
				  content: '/BRHP/outpatient/getOrderDetail?staffId='+staffId+'&id='+id
			});
		}
		//取消
		function cancleOrder(id,outpatientSourceId,clinicDateStr){
			layer.msg('确认取消订单吗？', {
				time : 0,
				btn : [ '是', '否' ],
				yes : function(index) {
					$.ajax({
						type : 'POST',
						url : '/BRHP/outpatient/cancelOrder',
						data : {
							id : id,
							outpatientSourceId : outpatientSourceId,
							clinicDateStr :clinicDateStr
						},
						success : function(data) {
							if (data.code == '200') {
								layer.msg('取消成功！');
								$("#dataTable").bootstrapTable('refresh');
							} else {
								layer.msg(data.msg);
							}
						}
					});
				}
			});
		}
	
	</script>
		<%@ include file="../include/footer.jsp"%>
	</body>
	<script type="text/javascript">
	 	 /* layer.open({
		  title:'订单详情',
		  type: 1,
		  skin: 'layui-layer-rim', //加上边框
		  area: ['560px', '350px'], //宽高
		  content: $('.order_detail')
		});  */
		
	</script>
</html>
