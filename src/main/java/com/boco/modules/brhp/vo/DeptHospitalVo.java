package com.boco.modules.brhp.vo;

public class DeptHospitalVo {
	/**
	 * 机构部门ID
	 */
	private Integer deptId;

	/**
	 * 上级部门ID
	 */
	private Integer parentDeptId;

	/**
	 * 行政区划
	 */
	private String regionCode;

	/**
	 * 所属机构ID
	 */
	private Integer orgId;

	/**
	 * 部门名称
	 */
	private String name;

	/**
	 * 拼音码（自动生成）
	 */
	private String pingyinCode;

	/**
	 * 标准科室编码
	 */
	private String standardDeptCode;

	/**
	 * 介绍
	 */
	private String introduction;

	/**
	 * 排序码
	 */
	private String sortCode;
	/**
	 * 科室属性 1.临床 2.辅诊 3.护理单元 4.机关 5.其他
	 */
	private String deptProperty;

	/**
	 * 科室类型：1. 门急诊科室 2. 住院科室 3. 医技科室 4. 职能科室 5. 行政科室（职能科室包括药库、药房、材料库等）
	 */
	private String deptType;

	/**
	 * 主任姓名
	 */
	private String directorName;

	/**
	 * 主任人员ID（关联人员表）
	 */
	private Integer directorId;

	/**
	 * 护士长姓名
	 */
	private String headNurseName;

	/**
	 * 护士长人员ID（关联人员表）
	 */
	private Integer headNurseId;

	/**
	 * 床位数
	 */
	private Integer bedsNum;

	/**
	 * 位置
	 */
	private String position;

	/**
	 * 主任医师数
	 */
	private Integer chiefPhysicianNum;

	/**
	 * 副主任医师数
	 */
	private Integer viceChiefPhysicianNum;

	/**
	 * 住院医师数
	 */
	private Integer residentNum;

	/**
	 * 护士数
	 */
	private Integer nurseNum;

	/**
	 * 服务范围
	 */
	private String serviceScope;

	/**
	 * 服务对象：1. 门诊 2.住院 3.病区 4.医技（可多选）
	 */
	private String consumer;

	/**
	 * 照片url
	 */
	private String img;

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Integer getParentDeptId() {
		return parentDeptId;
	}

	public void setParentDeptId(Integer parentDeptId) {
		this.parentDeptId = parentDeptId;
	}

	public String getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPingyinCode() {
		return pingyinCode;
	}

	public void setPingyinCode(String pingyinCode) {
		this.pingyinCode = pingyinCode;
	}

	public String getStandardDeptCode() {
		return standardDeptCode;
	}

	public void setStandardDeptCode(String standardDeptCode) {
		this.standardDeptCode = standardDeptCode;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getSortCode() {
		return sortCode;
	}

	public void setSortCode(String sortCode) {
		this.sortCode = sortCode;
	}

	public String getDeptProperty() {
		return deptProperty;
	}

	public void setDeptProperty(String deptProperty) {
		this.deptProperty = deptProperty;
	}

	public String getDeptType() {
		return deptType;
	}

	public void setDeptType(String deptType) {
		this.deptType = deptType;
	}

	public String getDirectorName() {
		return directorName;
	}

	public void setDirectorName(String directorName) {
		this.directorName = directorName;
	}

	public Integer getDirectorId() {
		return directorId;
	}

	public void setDirectorId(Integer directorId) {
		this.directorId = directorId;
	}

	public String getHeadNurseName() {
		return headNurseName;
	}

	public void setHeadNurseName(String headNurseName) {
		this.headNurseName = headNurseName;
	}

	public Integer getHeadNurseId() {
		return headNurseId;
	}

	public void setHeadNurseId(Integer headNurseId) {
		this.headNurseId = headNurseId;
	}

	public Integer getBedsNum() {
		return bedsNum;
	}

	public void setBedsNum(Integer bedsNum) {
		this.bedsNum = bedsNum;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Integer getChiefPhysicianNum() {
		return chiefPhysicianNum;
	}

	public void setChiefPhysicianNum(Integer chiefPhysicianNum) {
		this.chiefPhysicianNum = chiefPhysicianNum;
	}

	public Integer getViceChiefPhysicianNum() {
		return viceChiefPhysicianNum;
	}

	public void setViceChiefPhysicianNum(Integer viceChiefPhysicianNum) {
		this.viceChiefPhysicianNum = viceChiefPhysicianNum;
	}

	public Integer getResidentNum() {
		return residentNum;
	}

	public void setResidentNum(Integer residentNum) {
		this.residentNum = residentNum;
	}

	public Integer getNurseNum() {
		return nurseNum;
	}

	public void setNurseNum(Integer nurseNum) {
		this.nurseNum = nurseNum;
	}

	public String getServiceScope() {
		return serviceScope;
	}

	public void setServiceScope(String serviceScope) {
		this.serviceScope = serviceScope;
	}

	public String getConsumer() {
		return consumer;
	}

	public void setConsumer(String consumer) {
		this.consumer = consumer;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
