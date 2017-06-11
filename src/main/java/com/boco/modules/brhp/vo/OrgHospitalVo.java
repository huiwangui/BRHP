package com.boco.modules.brhp.vo;

import java.util.Date;

import com.boco.common.persistence.Page;

public class OrgHospitalVo {
	/**
	 * 主键ID
	 */
	private Integer orgId;

	/**
	 * 上级机构ID
	 */
	private Integer parentOrgId;

	/**
	 * 行政区划代码
	 */
	private String regionCode;

	/**
	 * 组织机构代码
	 */
	private String orgCode;

	/**
	 * 机构名称
	 */
	private String orgName;

	/**
	 * 机构简称
	 */
	private String orgSimpleName;

	/**
	 * 拼音码（自动生成）
	 */
	private String pingyinCode;
	/**
	 * 机构类型代码： 10：行政机构 20：医疗机构 21：医院 22：乡镇卫生院 23：诊所 24：村卫生室 25：急救中心 26：药店
	 */
	private String orgTypeCode;

	/**
	 * 网址
	 */
	private String webSite;

	/**
	 * 图片地址
	 */
	private String img;

	/**
	 * 介绍
	 */
	private String introduction;

	/**
	 * 成立日期
	 */
	private Date dateOfEstablishment;

	/**
	 * 医院等级中文
	 */
	private String levelChs;
	/**
	 * 地址代码（乡镇街道级）
	 */
	private String addressCode;

	/**
	 * 详细地址
	 */
	private String detailAddress;

	/**
	 * 邮政编码
	 */
	private String postCode;

	/**
	 * 固定电话
	 */
	private String fixedTelephone;

	/**
	 * 移动电话
	 */
	private String mobile;

	/**
	 * 联系人姓名
	 */
	private String contactName;

	/**
	 * 邮箱
	 */
	private String email;

	/**
	 * 分页对象
	 */
	private Page<OrgHospitalVo> page;

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public Integer getParentOrgId() {
		return parentOrgId;
	}

	public void setParentOrgId(Integer parentOrgId) {
		this.parentOrgId = parentOrgId;
	}

	public String getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getOrgSimpleName() {
		return orgSimpleName;
	}

	public void setOrgSimpleName(String orgSimpleName) {
		this.orgSimpleName = orgSimpleName;
	}

	public String getPingyinCode() {
		return pingyinCode;
	}

	public void setPingyinCode(String pingyinCode) {
		this.pingyinCode = pingyinCode;
	}

	public String getOrgTypeCode() {
		return orgTypeCode;
	}

	public void setOrgTypeCode(String orgTypeCode) {
		this.orgTypeCode = orgTypeCode;
	}

	public String getWebSite() {
		return webSite;
	}

	public void setWebSite(String webSite) {
		this.webSite = webSite;
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

	public Date getDateOfEstablishment() {
		return dateOfEstablishment;
	}

	public void setDateOfEstablishment(Date dateOfEstablishment) {
		this.dateOfEstablishment = dateOfEstablishment;
	}

	public String getLevelChs() {
		return levelChs;
	}

	public void setLevelChs(String levelChs) {
		this.levelChs = levelChs;
	}

	public String getAddressCode() {
		return addressCode;
	}

	public void setAddressCode(String addressCode) {
		this.addressCode = addressCode;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getFixedTelephone() {
		return fixedTelephone;
	}

	public void setFixedTelephone(String fixedTelephone) {
		this.fixedTelephone = fixedTelephone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Page<OrgHospitalVo> getPage() {
		return page;
	}

	public void setPage(Page<OrgHospitalVo> page) {
		this.page = page;
	}
}
