package com.boco.modules.brhp.vo;

import java.util.List;

import com.boco.common.persistence.Page;

public class StaffVo {
	/**
	 * 人员ID
	 */
	private Integer staffId;
	/**
	 * 人员姓名
	 */
	private String name;
	/**
	 * 称谓
	 */
	private String label;
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
	 * 图片URL
	 */
	private String img;
	/**
	 * 简介
	 */
	private String introduction;
	
	/**
	 * 电话号码
	 */
	private String mobile;	

	/**
	 * 专业特长
	 */
	private String specialty;
	
	/**
	 * 分页对象
	 */
	private Page<StaffVo> page;
	
	/**
	 * 职务列表
	 */
	private List<StaffOfficeVo> officeList;

	public Integer getStaffId() {
		return staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public Page<StaffVo> getPage() {
		return page;
	}

	public void setPage(Page<StaffVo> page) {
		this.page = page;
	}

	public List<StaffOfficeVo> getOfficeList() {
		return officeList;
	}

	public void setOfficeList(List<StaffOfficeVo> officeList) {
		this.officeList = officeList;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
}
