package com.boco.modules.brhp.vo;

import java.util.Date;

public class StaffOfficeVo {
	/**
	 * 主键
	 */
	private Integer id;

	/**
	 * 所属机构ID
	 */
	private Integer orgId;

	/**
	 * 所属行政区划
	 */
	private String regionCode;

	/**
	 * 人员ID
	 */
	private Integer staffId;

	/**
	 * 所属部门（科室）ID
	 */
	private Integer deptId;
	
	/**
	 * 部门（科室）名称
	 */
	private String deptName;

	/**
	 * 专业技术职务代码（医生相关为：231.主任医师 232.副主任医师 233.主治医师 234.医师 ）
	 */
	private String professionalCode;

	/**
	 * 编制类别：1.公务员 2.事业编制 3.合同 4.临时工
	 */
	private String preparationCategory;

	/**
	 * 称谓
	 */
	private String label;

	/**
	 * 到岗日期
	 */
	private Date beginWorkDate;

	/**
	 * 入岗途径：1. 公开招考 2.社会招聘 3.调入（跨单位） 4.转入（单位内） 9.其他
	 */
	private String begionWorkWay;

	/**
	 * 离岗日期
	 */
	private Date leaveWorkDate;

	/**
	 * 离岗原因：1. 主动离职 2. 开除 3.调出（跨单位） 4.转出（单位内） 9.其他
	 */
	private String leaveWorkReason;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public String getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}

	public Integer getStaffId() {
		return staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
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

	public String getProfessionalCode() {
		return professionalCode;
	}

	public void setProfessionalCode(String professionalCode) {
		this.professionalCode = professionalCode;
	}

	public String getPreparationCategory() {
		return preparationCategory;
	}

	public void setPreparationCategory(String preparationCategory) {
		this.preparationCategory = preparationCategory;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public Date getBeginWorkDate() {
		return beginWorkDate;
	}

	public void setBeginWorkDate(Date beginWorkDate) {
		this.beginWorkDate = beginWorkDate;
	}

	public String getBegionWorkWay() {
		return begionWorkWay;
	}

	public void setBegionWorkWay(String begionWorkWay) {
		this.begionWorkWay = begionWorkWay;
	}

	public Date getLeaveWorkDate() {
		return leaveWorkDate;
	}

	public void setLeaveWorkDate(Date leaveWorkDate) {
		this.leaveWorkDate = leaveWorkDate;
	}

	public String getLeaveWorkReason() {
		return leaveWorkReason;
	}

	public void setLeaveWorkReason(String leaveWorkReason) {
		this.leaveWorkReason = leaveWorkReason;
	}
	
	
}
