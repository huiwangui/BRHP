package com.boco.modules.brhp.vo;

import java.util.Date;
import java.util.List;

import com.boco.common.persistence.Page;

public class StopNoticeVo {
	private Integer id;
	

	/**
	 * 人员ID
	 */
	private Integer staffId;
	/**
	 * 停诊日期
	 */
	private Date stopDate;
	/**
	 * 停诊次数
	 */
	private Integer stopTime;
	/**
	 * 机构id
	 */
	private Integer orgId;
	/**
	 * 部门ID
	 */
	private Integer deptId;
	/**
	 * 所属部门名称
	 */
	private String deptName;
	/**
	 * 所属机构名称
	 */
	private String orgName;
	
	/**
	 * 医生名字
	 */
	private String staffName;
	/**
	 * 医生等级
	 */
	private String levelCode;
	/**
	 * 医生评级
	 */
	private String gradeCode;

	/**
	 * 创建时间
	 */
	private Date createTime;	

	/**
	 * 停诊原因
	 */
	private String stopReason;
	
	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getLevelCode() {
		return levelCode;
	}

	public void setLevelCode(String levelCode) {
		this.levelCode = levelCode;
	}

	public String getGradeCode() {
		return gradeCode;
	}

	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}


	public Integer getStaffId() {
		return staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public Date getStopDate() {
		return stopDate;
	}

	public void setStopDate(Date stopDate) {
		this.stopDate = stopDate;
	}

	public Integer getStopTime() {
		return stopTime;
	}

	public void setStopTime(Integer stopTime) {
		this.stopTime = stopTime;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getStopReason() {
		return stopReason;
	}

	public void setStopReason(String stopReason) {
		this.stopReason = stopReason;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}