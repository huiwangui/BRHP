package com.boco.modules.brhp.model.user;

import java.util.Date;

/**
 * 
 * ClassName: UserEntity <br/>
 * Reason: 用户实体类. <br/>
 * date: 2016年12月2日 下午2:16:36 <br/>
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class UserEntity {
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
    * 实名认证标识，0为未认证，1为已认证
    */
    private String verificationFlag;

    /**
    * 删除标记0：正常（默认）1：逻辑删除 2：物理删除 3：审核 
    */
    private String delFlag;

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

    public String getVerificationFlag() {
        return verificationFlag;
    }

    public void setVerificationFlag(String verificationFlag) {
        this.verificationFlag = verificationFlag;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

	public String getNickCode() {
		return nickCode;
	}

	public void setNickCode(String nickCode) {
		this.nickCode = nickCode;
	}
    
}