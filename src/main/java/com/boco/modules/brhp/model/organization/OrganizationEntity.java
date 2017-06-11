package com.boco.modules.brhp.model.organization;

import java.util.Date;
/**
 * 
 * ClassName: OrganizationEntity <br/>
 * Reason: 机构实体类. <br/>
 * date: 2016年12月2日 下午4:35:43 <br/>
 *
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class OrganizationEntity {
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
    * 隶属关系代码
    */
    private String membershipRelationCode;

    /**
    * 经济类型代码
    */
    private String economicTypeCode;

    /**
    * 机构类型代码： 10：行政机构 20：医疗机构 21：医院  22：乡镇卫生院  23：诊所  24：村卫生室  25：急救中心  26：药店
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
    * 启用状态： 1.正常  0.注销
    */
    private String status;

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

    public String getMembershipRelationCode() {
        return membershipRelationCode;
    }

    public void setMembershipRelationCode(String membershipRelationCode) {
        this.membershipRelationCode = membershipRelationCode;
    }

    public String getEconomicTypeCode() {
        return economicTypeCode;
    }

    public void setEconomicTypeCode(String economicTypeCode) {
        this.economicTypeCode = economicTypeCode;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}