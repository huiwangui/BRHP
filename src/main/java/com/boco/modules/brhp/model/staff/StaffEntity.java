package com.boco.modules.brhp.model.staff;

import java.util.Date;
/**
 * 
 * ClassName: StaffEntity <br/>
 * Reason: 机构人员信息表（人员基础表，人员信息的父表）. <br/>
 * date: 2016年12月2日 下午4:21:35 <br/>
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class StaffEntity {
    /**
    * 人员ID
    */
    private Integer staffId;

    /**
     * 人员姓名
     */
    private String name;

    /**
    * 性别：1.男  2.女
    */
    private String sex;

    /**
    * 出生日期
    */
    private Date dateOfBirth;

    /**
    * 证件类型：10.居民身份证  30.军官证  43.台湾居民大陆通行证  44.港澳同胞回乡卡  50.护照
    */
    private String credentialsType;

    /**
    * 证件号码
    */
    private String idCard;

    /**
    * 证件上的地址
    */
    private String credentialsAddress;

    /**
    * 移动电话号码
    */
    private String mobile;

    /**
    * 民族
    */
    private String nation;

    /**
    * 死亡日期
    */
    private Date dateOfDeath;

    /**
    * 照片url
    */
    private String img;

    /**
    * 来源类型：101.门诊  102.住院  103.健康档案  211.医保  212.社保  221.计生全员入口
    */
    private String sourceType;

    /**
    * 来源机构ID
    */
    private Integer sourceOrgId;

    /**
    * 来源区划代码
    */
    private String sourceRegionCode;

    /**
    * 状态  1.正常  0.停用
    */
    private String status;

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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
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

    public String getCredentialsAddress() {
        return credentialsAddress;
    }

    public void setCredentialsAddress(String credentialsAddress) {
        this.credentialsAddress = credentialsAddress;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public Date getDateOfDeath() {
        return dateOfDeath;
    }

    public void setDateOfDeath(Date dateOfDeath) {
        this.dateOfDeath = dateOfDeath;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getSourceType() {
        return sourceType;
    }

    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }

    public Integer getSourceOrgId() {
        return sourceOrgId;
    }

    public void setSourceOrgId(Integer sourceOrgId) {
        this.sourceOrgId = sourceOrgId;
    }

    public String getSourceRegionCode() {
        return sourceRegionCode;
    }

    public void setSourceRegionCode(String sourceRegionCode) {
        this.sourceRegionCode = sourceRegionCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}