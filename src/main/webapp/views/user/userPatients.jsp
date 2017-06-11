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
	<link rel="stylesheet" href="/BRHP/statics/css/person.css"/>
	<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/bootstrap-table.js"></script>
	<script type="text/javascript"src="/BRHP/statics/js/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/loginRedirect.js"></script>
	<script type="text/javascript" src="/BRHP/statics/js/layer/layer.js"></script>
	<script type="text/javascript"src="/BRHP/statics/js/My97DatePicker/WdatePicker.js"></script>
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
				 <button type="button"  id="addButton">新增</button>
				<button type="button" class="btn btn-default" id="deleteButton">删除</button>
				
			</div>
			<div class="table">
				<table id="dataTable"></table>
			</div>
			<div></div>
		</div>
	</div>

<%@ include file="../include/header.jsp"%>

	<!-- 添加联系人弹出层 -->
	<div class="layer" id="addNew">
		<div class="layer-head">
			新增就诊联系人<a class="clz" href="javascript:void(0)"></a>
		</div>
		<div class="layer-body">
			<form action="" id="patientForm">
				<div class="info-item">
					<label for="">姓名:</label>
					<div>
						<input type="text" id="patientName">
					</div>
				</div>
				<div class="info-item">
					<label for="">身份证:</label>
					<div>
						<input type="text" id="patientIdCard">
					</div>
				</div>
				<div class="info-item">
					<label for="">性别:</label>
					<div>
						<input type="radio" name="sex" value="1" checked="checked">男<input
							type="radio" name="sex" value="2">女
					</div>
				</div>
				<div class="info-item">
					<label for="">出生日期:</label>
					<div>
						<input type="text" id="dateOfBirthStr" class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})">
					</div>
				</div>
				<div class="info-item">
					<label for="">手机号:</label>
					<div>
						<input type="text" id="patientMobile">
					</div>
				</div>
				<div class="info-item defult-item">
					<input type="checkbox" id="defaultCheck"><span>设为默认就诊人</span>
				</div>
				<div class="info-item sub-item">
					<a href="javascript:savePatient()" class="btn-add">确定</a>
				</div>
			</form>
		</div>
	</div>

	
	<script type="text/javascript">
		function initTable() {
			$('#dataTable').bootstrapTable({
				url : "/BRHP/user/userPatientsData",
				method : 'get',
				pagination : 'true',
				pageSize : 20,
				pageList : [ 10, 20, 50 ],
				clickToSelect : true,
				singleSelect : true,
				selectItemName : 'state',
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
					field : 'patientName',
					align : 'center',
					title : '姓名'
				}, {
					field : 'patientSex',
					title : '性别',
					formatter : function(value) {
						if (value == '1') {
							return '男';
						} else if (value == '2') {
							return '女';
						}
					}
				}, {
					field : 'age',
					title : '年龄'
				}, {
					field : 'patientIdCard',
					title : '证件号'
				}, {
					field : 'patientMobile',
					title : '手机号'
				}, {
					title : '认证状态',
					formatter : function(value) {
						return '<span class="blue_color">已认证</span>'
					}
				},{
					field : 'defaultFlag',
					title : '是否默认',
					formatter : function(value) {
						if (value == '1') {
							return '是';
						} else {
							return '否';
						}
					}
				} ],
				onLoadSuccess : function(data) {
					//$("#dataTable").addClass('fixed-thead');

				}
			});
		}
		initTable();

		//点击新增就诊人显示弹出层
		$("#addButton").on("click", function() {
			$('#patientForm')[0].reset();
			$("#addNew").css("visibility", "visible");
		})
		//关闭弹出层
		$(".clz").on("click", function() {
			$("#addNew").css("visibility", "hidden")
		})

		function savePatient() {
			var submitFlag = 1;
			if ($("#patientName").val() == null
					|| $("#patientName").val() == '') {
				layer.tips('请输入姓名', '#patientName', {
					time : 3000,
					tipsMore : true
				});
				submitFlag = 0;
			}
			if ($("#dateOfBirthStr").val() == null
					|| $("#dateOfBirthStr").val() == '') {
				layer.tips('请选择出生日期', '#dateOfBirthStr', {
					time : 3000,
					tipsMore : true
				});
				submitFlag = 0;
			}
			if ($("#patientIdCard").val() == null
					|| $("#patientIdCard").val() == '') {
				layer.tips('请输入身份证号', '#patientIdCard', {
					time : 3000,
					tipsMore : true
				});
				submitFlag = 0;
			} else {
				var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
				if (!reg.test($("#patientIdCard").val())) {
					layer.tips('请输入正确的身份证号', '#patientIdCard', {
						time : 3000,
						tipsMore : true
					});
					submitFlag = 0;
				}
			}
			if ($("#patientMobile").val() == null
					|| $("#patientMobile").val() == '') {
				layer.tips('请输入手机号码', '#patientMobile', {
					time : 3000,
					tipsMore : true
				});
				submitFlag = 0;
			} else {
				var reg = /^1[3|4|5|7|8]\d{9}$/;
				if (!reg.test($("#patientMobile").val())) {
					layer.tips('请输入正确的手机号码', '#patientMobile', {
						time : 3000,
						tipsMore : true
					});
					submitFlag = 0;
				}
			}
			if (submitFlag == 1) {
				$.ajax({
					type : 'POST',
					url : '/BRHP/user/patientSave',
					data : {
						patientName : $("#patientName").val(),
						patientIdCard : $("#patientIdCard").val(),
						dateOfBirthStr : $("#dateOfBirthStr").val(),
						patientMobile : $("#patientMobile").val(),
						patientSex : $("input[name=sex]:checked").val(),
						defaultFlag : function() {
							if ($("input[type='checkbox']").is(':checked')) {
								return 1;
							} else {
								return 0;
							}
						}
					},
					success : function(data) {
						if (data.code == '200') {
							layer.msg('新增成功！');
							$("#addNew").css("visibility", "hidden");
							$("#dataTable").bootstrapTable('refresh');
						} else {
							layer.msg(data.msg);
						}
					}
				});
			}
		}

		$("#deleteButton").on("click", function() {
			var datas = $("#dataTable").bootstrapTable('getSelections');
			if (datas.length == 0) {
				layer.msg('请选择要删除的人员信息！');
				return;
			}
			layer.msg('确认删除？', {
				time : 0,
				btn : [ '是', '否' ],
				yes : function(index) {
					$.ajax({
						type : 'POST',
						url : '/BRHP/user/patientDelete',
						data : {
							id : datas[0].id
						},
						success : function(data) {
							if (data.code == '200') {
								layer.msg('删除成功！');
								$("#dataTable").bootstrapTable('refresh');
							} else {
								layer.msg(data.msg);
							}
						}
					});
				}
			});
		})
	</script>
</body>
</html>