package com.boco.modules.brhp.model.department;
/**
 * 
 * ClassName: DepartmentEntity <br/>
 * Reason: 机构部门表，为各个详细机构部门的父表. <br/>
 * date: 2016年12月2日 下午4:40:09 <br/>
 *
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class DepartmentEntity {
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
    * 启用状态： 1.正常 0.停用
    */
    private String status;

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}