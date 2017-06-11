package com.boco.modules.brhp.model.user;

import java.util.Date;
/**
 * 
 * ClassName: UserAuthenticationEntity <br/>
 * Reason: 用户实名认证实体类. <br/>
 * date: 2016年12月2日 下午4:18:23 <br/>
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class UserAuthenticationEntity {
    /**
    * 用户实名主键ID
    */
    private Integer id;

    /**
    * 用户登录uid
    */
    private String uid;

    /**
    * 健康档案编号
    */
    private String healthFileCode;

    /**
    * 姓名
    */
    private String name;

    /**
    * 性别：1.男  2.女
    */
    private String sex;

    /**
    * 证件类型：10.居民身份证  30.军官证  43.台湾居民大陆通行证  44.港澳同胞回乡卡  50.护照
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
}