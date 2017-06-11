package com.boco.modules.brhp.model.organization;

import java.util.Date;
import java.util.List;

import com.boco.common.persistence.Page;

public class StopNotice {
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
	 * 所属机构名称
	 */
	private String orgName;
	
	
	/**
	 * 创建时间
	 */
	private Date createTime;	

	/**
	 * 停诊原因
	 */
	private String stopReason;

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