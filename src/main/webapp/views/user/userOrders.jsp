<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>黄岛区居民健康门户</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <script type="text/javascript" src="/BRHP/statics/js/jqold.js"></script>
<link rel="stylesheet" href="/BRHP/statics/css/bootstrap.min.css" />
<link rel="stylesheet" href="/BRHP/statics/css/bootstrap-table.css" />
<link rel="stylesheet" href="/BRHP/statics/css/apointed.css">
<link rel="stylesheet" href="/BRHP/statics/css/headCommon.css" />
<link rel="stylesheet" href="/BRHP/statics/css/personalOrder.css" />
<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
<script type="text/javascript" src="/BRHP/statics/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/BRHP/statics/js/bootstrap-table.js"></script>
<script type="text/javascript" src="/BRHP/statics/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
<script type="text/javascript" src="/BRHP/statics/js/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
<%@ include file="../include/header.jsp"%>

	<div class="message-box">
		<div class="left-msg">
		        <ul>
		            <li>
		                <a  href="/BRHP/user/personalInfo">
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
		                <a href="/BRHP/user/userOrders">
		                    <img src="/BRHP/statics/image/bbb/order.png" alt=""/>
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
		<div class="right-msg">
			<div class="right-top">
				<button type="button" class="btn btn-primary" id="detailButton">详情</button>
				<button type="button" class="btn btn-primary" id="cancelButton">取消</button>
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
				<label>按时间筛选</label>
				<input type="text" class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})" id="queryStartTimeStr">
				至<input type="text" class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})" id="queryEndTimeStr">
				<button type="button" class="btn btn-primary" id="searchButton">查询</button>
			</div>
			<div class="table">
				<table id="dataTable"></table>
			</div>
			<div></div>
		</div>
	</div>

<%@ include file="../include/footer.jsp"%>

	<script type="text/javascript">
		function initTable() {
			$('#dataTable').bootstrapTable({
				url : "/BRHP/outpatient/getOrderList",
				method : 'get',
				pagination : 'true',
				pageSize : 2,
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
				columns : [ {
					checkbox : true,
					title : '',
					class : 'td-blank'
				}, {
					field : 'id',
					align : 'center',
					title : 'ID',
					visible : false
				}, {
					field : 'staffId',
					align : 'center',
					title : '医生编号',
					visible : false
				}, {
					field : 'clinicDateStr',
					align : 'center',
					title : '就诊日期'
				}, {
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
					formatter : function(value) {
						if (value == '0') {
							return '<span class="label label-warning">未付款</span>';
						} else if(value == '1'){
							return '已付款';
						}else if(value == '2'){
							return '正在退款';
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
				    formatter : function(value) {return '<button type="button" class="btn btn-primary" >详情</button>'}
				}],
				onLoadSuccess : function(data) {

				}
			});
		}
		initTable();
		$("#searchButton").on("click", function() {
			$("#dataTable").bootstrapTable('refresh');
		});
		
		$(".btn btn-primary").on("click", function() {
			var datas = $("#dataTable").bootstrapTable('getSelections');
			if (datas.length == 0) {
				layer.msg('请选择要查看的订单信息！');
				return;
			}
			parent.layer.open({
				  type: 2,
				  area: ['60%', '50%'],
				  fix: false, //不固定
				  maxmin: false,
				  scrollbar:false,
				  title: false,
				  content: '/BRHP/outpatient/getOrderDetail?staffId='+datas[0].staffId+'&id='+datas[0].id+'&deptName='+datas[0].deptName
			});
		});
		
		$("#cancelButton").on("click", function() {
			var datas = $("#dataTable").bootstrapTable('getSelections');
			if (datas.length == 0) {
				layer.msg('请选择要取消的订单！');
				return;
			}
			layer.msg('确认取消订单吗？', {
				time : 0,
				btn : [ '是', '否' ],
				yes : function(index) {
					$.ajax({
						type : 'POST',
						url : '/BRHP/outpatient/cancelOrder',
						data : {
							id : datas[0].id,
							outpatientSourceId : datas[0].outpatientSourceId,
							clinicDateStr : datas[0].clinicDateStr
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
		});
	</script>
</body>
</html>