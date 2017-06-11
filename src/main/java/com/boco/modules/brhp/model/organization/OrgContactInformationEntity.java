package com.boco.modules.brhp.model.organization;
/**
 * 
 * ClassName: OrgContactInformationEntity <br/>
 * Reason: 机构联系信息. <br/>
 * date: 2016年12月2日 下午4:38:32 <br/>
 *
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class OrgContactInformationEntity {
    private Integer id;

    /**
    * 机构id
    */
    private Integer orgId;

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
    * 状态 ：1. 启用 2.停用
    */
    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}