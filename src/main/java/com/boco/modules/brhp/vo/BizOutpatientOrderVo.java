package com.boco.modules.brhp.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.boco.common.utils.PropertiesUtils;

public class BizOutpatientOrderVo {
	/**
	 * 预约单主键ID
	 */
	private Integer id;

	/**
	 * 订单号：16位
	 * 生成规则为：区别号（1位|四种状态（订单/流水）&（到院/线上））+人员（6位）+交易日期（6位|161201）+人数(三位位|1)
	 */
	private String orderNumber;

	/**
	 * 支付流水号 ：16位
	 * 生成规则为：区别号（1位|四种状态（订单/流水）&（到院/线上））+人员（6位）+交易日期（6位|161201）+人数(三位位|1)
	 */
	private String paymentNumber;

	/**
	 * 就诊人ID
	 */
	private Integer patientId;

	/**
	 * 号表ID
	 */
	private Integer outpatientSourceId;

	/**
	 * 付款方式代码：10. 到院支付 20.网上支付
	 */
	private String payMethod;

	/**
	 * 订单状态 0.未付款 1.已付款 2.正在退款 3.已退款 4.已取消 5.未评论 6.已评论
	 */
	private String orderStatus;

	/**
	 * 就诊状态 0.全部,1.未就诊 2.已就诊,3.已取消
	 */
	private String doctorVisitStatus;

	/**
	 * 订单创建时间
	 */
	private Date createTime;

	/**
	 * 订单创建人uid
	 */
	private String creatorUid;

	/**
	 * 订单取消时间
	 */
	private Date cancleTime;

	/**
	 * 就诊人姓名
	 */
	private String patientName;
	/**
	 * 证件号码
	 */
	private String patientIdCard;
	/**
	 * 就诊人手机号
	 */
	private String patientMobile;
	/**
	 * 坐诊日期
	 */
	private Date clinicDate;
	/**
	 * 机构名
	 */
	private String orgName;
	/**
	 * 科室名
	 */
	private String deptName;
	/**
	 * 医生姓名
	 */
	private String staffName;
	/**
	 * 医生ID
	 */
	private Integer staffId;
	/**
	 * 门诊类别名称
	 */
	private String outpatientType;
	/**
	 * 0.上午 1.下午 2.全天 3.晚上 4.休息
	 */
	private String clinicTime;
	/**
	 * 查询开始时间
	 */
	private Date queryStartTime;

	/**
	 * 查询结束时间
	 */
	private Date queryEndDate;
	/**
	 * 坐诊日期字符串（yyyy-mm-dd）
	 */
	private String clinicDateStr;
	/**
	 * 上下午中文显示
	 */
	private String clinicTimeChs;
	/**
	 * 挂号费
	 */
	private BigDecimal registrationFee;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getPaymentNumber() {
		return paymentNumber;
	}
	public void setPaymentNumber(String paymentNumber) {
		this.paymentNumber = paymentNumber;
	}
	public Integer getPatientId() {
		return patientId;
	}
	public void setPatientId(Integer patientId) {
		this.patientId = patientId;
	}
	public Integer getOutpatientSourceId() {
		return outpatientSourceId;
	}
	public void setOutpatientSourceId(Integer outpatientSourceId) {
		this.outpatientSourceId = outpatientSourceId;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getDoctorVisitStatus() {
		return doctorVisitStatus;
	}
	public void setDoctorVisitStatus(String doctorVisitStatus) {
		this.doctorVisitStatus = doctorVisitStatus;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getCreatorUid() {
		return creatorUid;
	}
	public void setCreatorUid(String creatorUid) {
		this.creatorUid = creatorUid;
	}
	public Date getCancleTime() {
		return cancleTime;
	}
	public void setCancleTime(Date cancleTime) {
		this.cancleTime = cancleTime;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getPatientIdCard() {
		return patientIdCard;
	}
	public void setPatientIdCard(String patientIdCard) {
		this.patientIdCard = patientIdCard;
	}
	public String getPatientMobile() {
		return patientMobile;
	}
	public void setPatientMobile(String patientMobile) {
		this.patientMobile = patientMobile;
	}
	public Date getClinicDate() {
		return clinicDate;
	}
	public void setClinicDate(Date clinicDate) {
		this.clinicDate = clinicDate;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getOutpatientType() {
		return outpatientType;
	}
	public void setOutpatientType(String outpatientType) {
		this.outpatientType = outpatientType;
	}
	public String getClinicTime() {
		return clinicTime;
	}
	public void setClinicTime(String clinicTime) {
		this.clinicTime = clinicTime;
	}
	public Date getQueryStartTime() {
		return queryStartTime;
	}
	public void setQueryStartTime(Date queryStartTime) {
		this.queryStartTime = queryStartTime;
	}
	public Date getQueryEndDate() {
		return queryEndDate;
	}
	public void setQueryEndDate(Date queryEndDate) {
		this.queryEndDate = queryEndDate;
	}
	public String getClinicDateStr() {
		return clinicDateStr;
	}
	public void setClinicDateStr(String clinicDateStr) {
		this.clinicDateStr = clinicDateStr;
	}
	public String getClinicTimeChs() {
		return clinicTimeChs;
	}
	public void setClinicTimeChs(String clinicTimeChs) {
		this.clinicTimeChs = clinicTimeChs;
	}
	public BigDecimal getRegistrationFee() {
		return registrationFee;
	}
	public void setRegistrationFee(BigDecimal registrationFee) {
		this.registrationFee = registrationFee;
	}
	public Integer getStaffId() {
		return staffId;
	}
	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}
	
}
