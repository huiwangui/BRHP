package com.boco.modules.brhp.vo;

import java.util.Date;

public class UserPatientVo {
	private Integer id;

    /**
    * 对应的用户uid
    */
    private String uid;

    /**
    * 就诊人姓名
    */
    private String patientName;

    /**
    * 性别：1.男  2.女
    */
    private String patientSex;

    /**
    * 出生年月
    */
    private Date patientDateOfBirth;

    /**
    * 证件号码
    */
    private String patientIdCard;

    /**
    * 就诊人手机号
    */
    private String patientMobile;

    /**
    * 是否为默认就诊人   1. 是
    */
    private String defaultFlag;

    /**
    * 认证状态：1.已认证 0.未认证
    */
    private String authenticationState;

    /**
    * 创建时间
    */
    private Date createTime;

    /**
    * 最后一次修改时间
    */
    private Date updateTime;
    
    /**
     * 年龄
     */
    private Integer age;
    
    /**
     * 年龄字符串
     */
    private String dateOfBirthStr;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientSex() {
		return patientSex;
	}

	public void setPatientSex(String patientSex) {
		this.patientSex = patientSex;
	}

	public Date getPatientDateOfBirth() {
		return patientDateOfBirth;
	}

	public void setPatientDateOfBirth(Date patientDateOfBirth) {
		this.patientDateOfBirth = patientDateOfBirth;
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

	public String getDefaultFlag() {
		return defaultFlag;
	}

	public void setDefaultFlag(String defaultFlag) {
		this.defaultFlag = defaultFlag;
	}

	public String getAuthenticationState() {
		return authenticationState;
	}

	public void setAuthenticationState(String authenticationState) {
		this.authenticationState = authenticationState;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getDateOfBirthStr() {
		return dateOfBirthStr;
	}

	public void setDateOfBirthStr(String dateOfBirthStr) {
		this.dateOfBirthStr = dateOfBirthStr;
	}
    
}
