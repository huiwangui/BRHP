package com.boco.modules.brhp.model.staff;

import java.util.Date;
/**
 * 
 * ClassName: StaffDetailEntity <br/>
 * Reason: 人员详细信息实体类，拓展自人员类. <br/>
 * date: 2016年12月2日 下午4:25:33 <br/>
 *
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class StaffDetailEntity {
    /**
    * 人员id
    */
    private Integer staffId;

    /**
    * 所属机构ID
    */
    private Integer orgId;

    /**
    * 所属区划
    */
    private String regionCode;

    /**
    * 曾用名
    */
    private String nameBefore;

    /**
    * 出生地
    */
    private String brithNative;

    /**
    * 国籍
    */
    private String nationality;

    /**
    * 籍贯
    */
    private String originPlace;

    /**
    * 婚姻状况：10.未婚  20.已婚  21.初婚  22.再婚  23.复婚  30.丧偶  40.离婚  90.未说明的婚姻状况
    */
    private String maritalStatus;

    /**
    * 政治面貌
    */
    private String politicalLandscape;

    /**
    * 所学专业
    */
    private String major;

    /**
    * 第一学历
    */
    private String firstDegree;

    /**
    * 最后学历
    */
    private String lastDegree;

    /**
    * 学位
    */
    private String degree;

    /**
    * 学位授予单位
    */
    private String degreeGrantOrg;

    /**
    * 毕业时间
    */
    private Date graduationDate;

    /**
    * 参加工作时间
    */
    private Date beginWorkDate;

    /**
    * 毕业院校或单位
    */
    private String graduationOrg;

    /**
    * 进入本单位时间
    */
    private Date enterNowOrgDate;

    /**
    * 简介
    */
    private String introduction;

    /**
    * 专业特长
    */
    private String specialty;

    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
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

    public String getNameBefore() {
        return nameBefore;
    }

    public void setNameBefore(String nameBefore) {
        this.nameBefore = nameBefore;
    }

    public String getBrithNative() {
        return brithNative;
    }

    public void setBrithNative(String brithNative) {
        this.brithNative = brithNative;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getOriginPlace() {
        return originPlace;
    }

    public void setOriginPlace(String originPlace) {
        this.originPlace = originPlace;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getPoliticalLandscape() {
        return politicalLandscape;
    }

    public void setPoliticalLandscape(String politicalLandscape) {
        this.politicalLandscape = politicalLandscape;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getFirstDegree() {
        return firstDegree;
    }

    public void setFirstDegree(String firstDegree) {
        this.firstDegree = firstDegree;
    }

    public String getLastDegree() {
        return lastDegree;
    }

    public void setLastDegree(String lastDegree) {
        this.lastDegree = lastDegree;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getDegreeGrantOrg() {
        return degreeGrantOrg;
    }

    public void setDegreeGrantOrg(String degreeGrantOrg) {
        this.degreeGrantOrg = degreeGrantOrg;
    }

    public Date getGraduationDate() {
        return graduationDate;
    }

    public void setGraduationDate(Date graduationDate) {
        this.graduationDate = graduationDate;
    }

    public Date getBeginWorkDate() {
        return beginWorkDate;
    }

    public void setBeginWorkDate(Date beginWorkDate) {
        this.beginWorkDate = beginWorkDate;
    }

    public String getGraduationOrg() {
        return graduationOrg;
    }

    public void setGraduationOrg(String graduationOrg) {
        this.graduationOrg = graduationOrg;
    }

    public Date getEnterNowOrgDate() {
        return enterNowOrgDate;
    }

    public void setEnterNowOrgDate(Date enterNowOrgDate) {
        this.enterNowOrgDate = enterNowOrgDate;
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
}