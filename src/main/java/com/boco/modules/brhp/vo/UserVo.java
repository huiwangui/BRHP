package com.boco.modules.brhp.vo;

import java.util.Date;

public class UserVo {
	/**
	 * 用户唯一标识
	 */
	private String uid;

	/**
	 * 昵称
	 */
	private String nickname;

	/**
	 * 昵称编码，用于登录
	 */
	private String nickCode;

	/**
	 * 密码
	 */
	private String password;

	/**
	 * 手机号
	 */
	private String mobile;

	/**
	 * 头像URL
	 */
	private String img;

	/**
	 * 状态：1正常(默认)，2禁用
	 */
	private String status;

	/**
	 * 邮箱
	 */
	private String email;

	/**
	 * 添加时间
	 */
	private Date createTime;

	/**
	 * 更新时间
	 */
	private Date updateTime;

	/**
	 * 更新人
	 */
	private String updateId;

	/**
	 * 最后登陆时间
	 */
	private Date loginTime;

	/**
	 * 个性签名
	 */
	private String signature;

	/**
	 * 健康档案编号
	 */
	private String healthFileCode;

	/**
	 * 姓名
	 */
	private String name;

	/**
	 * 性别：1.男 2.女
	 */
	private String sex;

	/**
	 * 证件类型：10.居民身份证 30.军官证 43.台湾居民大陆通行证 44.港澳同胞回乡卡 50.护照
	 */
	private String credentialsType;

	/**
	 * 证件号码
	 */
	private String idCard;

	/**
	 * 出生年月
	 */
	private Date dateOfBirth;
	
	/**
	 * 年龄
	 */
	private Integer age;
	
	/**
	 * 身份证中间用*代替
	 */
	private String idCardCode;
	
	/**
	 * 手机号中间用*代替
	 */
	private String mobileCode;
	
	/**
	 * 获取用户时的参数，用来判断是否是通过uid来获取
	 */
	private String getByUidFlag;
	
	/**
	 * 出生日期字符串
	 */
	private String dateOfBirthStr;

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNickCode() {
		return nickCode;
	}

	public void setNickCode(String nickCode) {
		this.nickCode = nickCode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getUpdateId() {
		return updateId;
	}

	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getHealthFileCode() {
		return healthFileCode;
	}

	public void setHealthFileCode(String healthFileCode) {
		this.healthFileCode = healthFileCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCredentialsType() {
		return credentialsType;
	}

	public void setCredentialsType(String credentialsType) {
		this.credentialsType = credentialsType;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getIdCardCode() {
		return idCardCode;
	}

	public void setIdCardCode(String idCardCode) {
		this.idCardCode = idCardCode;
	}

	public String getMobileCode() {
		return mobileCode;
	}

	public void setMobileCode(String mobileCode) {
		this.mobileCode = mobileCode;
	}

	public String getGetByUidFlag() {
		return getByUidFlag;
	}

	public void setGetByUidFlag(String getByUidFlag) {
		this.getByUidFlag = getByUidFlag;
	}

	public String getDateOfBirthStr() {
		return dateOfBirthStr;
	}

	public void setDateOfBirthStr(String dateOfBirthStr) {
		this.dateOfBirthStr = dateOfBirthStr;
	}
	
}
