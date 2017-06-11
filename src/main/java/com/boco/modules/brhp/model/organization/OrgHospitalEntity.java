package com.boco.modules.brhp.model.organization;

import java.util.Date;
/**
 * 
 * ClassName: OrgHospitalEntity <br/>
 * Reason: 机构—医院表（拓展自机构表，与机构表共用主键）. <br/>
 * date: 2016年12月2日 下午4:36:50 <br/>
 *
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class OrgHospitalEntity {
    /**
    * 医院ID，与机构表t_organization共用主键
    */
    private Integer orgId;

    /**
    * 医保代码
    */
    private String healthCareCode;

    /**
    * 级别代码：1. 一级  2. 二级  3. 三级  9. 未评
    */
    private String levelCode;

    /**
    * 等次代码：1. 特等  2. 甲等 3. 乙等 4. 合格 9. 未评
    */
    private String gradeCode;

    /**
    * 卫生机构类别代码
    */
    private String healthOrgTypeCode;

    /**
    * 机构分类管理代码
    */
    private String orgManagementCode;

    /**
    * 主办单位代码：1. 卫生行政部门 2. 其他行政部门 3. 企业 4. 事业单位 5. 社会团体 6. 其他社会组织 7. 个人
    */
    private String organizerCode;

    /**
    * 成立/开业时间
    */
    private Date setupDate;

    /**
    * 注册资金（万元）
    */
    private Long registeredCapital;

    /**
    * 法人代表（单位负责人）
    */
    private String legalRepresentative;

    /**
    * 挂靠单位类型：1. 医院 2. 社会卫生服务中心 3. 卫生院 4. 门诊部 5. 其他卫生机构 9. 其他
    */
    private String affiliatedUnitType;

    /**
    * 是否民族自治地区 0.否  1.是
    */
    private String isAutonomous;

    /**
    * 是否分支机构 0.否  1.是
    */
    private String isBranch;

    /**
    * 重点学科
    */
    private String keySubjects;

    /**
    * 专科特长
    */
    private String specialty;

    /**
    * 床位数
    */
    private Integer bedNum;

    /**
    * 下设分站（院、所）数
    */
    private Integer subOrgNum;

    /**
    * 下设分站_社区卫生服务中心个数
    */
    private Integer subOrgHealthCentersNum;

    /**
    * 下设分站_卫生院分院个数
    */
    private Integer subOrgHospitalNum;

    /**
    * 社区卫生服务中心位置标识：1. 街道  2.镇  3.乡  4. 居委会  5.村 （只有卫生院填写）
    */
    private String healthCenterPosition;

    /**
    * 介入互联网方式：1. 宽带 2. 专线 3. 拨号
    */
    private String internetType;

    /**
    * 银行名称
    */
    private String bankName;

    /**
    * 银行账号
    */
    private String bankAccout;

    /**
    * 第二名称是否为社会卫生服务中心（只有医院填写） H-否 1. 是
    */
    private String isHealthCenter;

    /**
    * 是否政府主管部门认定的区域医疗中心
    */
    private String isRegionalMedicalCenter;

    /**
    * 房屋建筑面积，单位：平方米
    */
    private Integer floorArea;

    /**
    * 配备国家基本药品种类数
    */
    private Integer basicMedicinesNum;

    /**
    * 诊所化学药品数（只有诊所填写）
    */
    private Integer clinicChemicalsNum;

    /**
    * 诊所中成药品数（只有诊所填写）
    */
    private Integer clinicChinesePatentMedicineNum;

    /**
    * 村站服务人口数
    */
    private Integer villageStationServicePopulation;

    /**
    * 村站主办单位代码 1. 村办  2. 乡卫生院设点 3. 联合办 4. 私人办 9.其他
    */
    private String villageStationOrganizerCode;

    /**
    * 村站行医方式代码：1. 西医为主 2. 中医为主 3.中西医结合
    */
    private String villageStationDocwayCode;

    /**
    * 村站所在居委会名称
    */
    private String villageStationNeighborhoodCommittee;

    /**
    * 村站法人代表类别：1. 乡村医生 2. 村委会主任 3. 乡镇卫生院院长 9. 其他
    */
    private String villageStationLegalRepresentativeType;

    /**
    * 村站负责人类别
    */
    private String villageStationHeaderType;

    /**
    * 村站是否实行乡村卫生服务一体化管理 ： H-否  1.是
    */
    private String villageStationIsUnity;

    /**
    * 村站是否达到村卫生室建设标准: H-否 1.是
    */
    private String villageStationIsStandard;

    /**
    * 村站配备非目录药物的品种数
    */
    private String villageStationNonDirectoryDrugs;

    /**
    * 村站是否实行零差率销售基本药物  H-否  1. 是
    */
    private String villageStationZeroSale;

    /**
    * 村站承担基本公共卫生服务项目情况: 1居民健康档案  2健康教育 3预防接种 4传染病防治 5儿童保健 6孕产妇保健 7老年人保健 8慢性病管理 9重性精神病 (只有村站填写，可多选)
    */
    private String villageStationObject;

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public String getHealthCareCode() {
        return healthCareCode;
    }

    public void setHealthCareCode(String healthCareCode) {
        this.healthCareCode = healthCareCode;
    }

    public String getLevelCode() {
        return levelCode;
    }

    public void setLevelCode(String levelCode) {
        this.levelCode = levelCode;
    }

    public String getGradeCode() {
        return gradeCode;
    }

    public void setGradeCode(String gradeCode) {
        this.gradeCode = gradeCode;
    }

    public String getHealthOrgTypeCode() {
        return healthOrgTypeCode;
    }

    public void setHealthOrgTypeCode(String healthOrgTypeCode) {
        this.healthOrgTypeCode = healthOrgTypeCode;
    }

    public String getOrgManagementCode() {
        return orgManagementCode;
    }

    public void setOrgManagementCode(String orgManagementCode) {
        this.orgManagementCode = orgManagementCode;
    }

    public String getOrganizerCode() {
        return organizerCode;
    }

    public void setOrganizerCode(String organizerCode) {
        this.organizerCode = organizerCode;
    }

    public Date getSetupDate() {
        return setupDate;
    }

    public void setSetupDate(Date setupDate) {
        this.setupDate = setupDate;
    }

    public Long getRegisteredCapital() {
        return registeredCapital;
    }

    public void setRegisteredCapital(Long registeredCapital) {
        this.registeredCapital = registeredCapital;
    }

    public String getLegalRepresentative() {
        return legalRepresentative;
    }

    public void setLegalRepresentative(String legalRepresentative) {
        this.legalRepresentative = legalRepresentative;
    }

    public String getAffiliatedUnitType() {
        return affiliatedUnitType;
    }

    public void setAffiliatedUnitType(String affiliatedUnitType) {
        this.affiliatedUnitType = affiliatedUnitType;
    }

    public String getIsAutonomous() {
        return isAutonomous;
    }

    public void setIsAutonomous(String isAutonomous) {
        this.isAutonomous = isAutonomous;
    }

    public String getIsBranch() {
        return isBranch;
    }

    public void setIsBranch(String isBranch) {
        this.isBranch = isBranch;
    }

    public String getKeySubjects() {
        return keySubjects;
    }

    public void setKeySubjects(String keySubjects) {
        this.keySubjects = keySubjects;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public Integer getBedNum() {
        return bedNum;
    }

    public void setBedNum(Integer bedNum) {
        this.bedNum = bedNum;
    }

    public Integer getSubOrgNum() {
        return subOrgNum;
    }

    public void setSubOrgNum(Integer subOrgNum) {
        this.subOrgNum = subOrgNum;
    }

    public Integer getSubOrgHealthCentersNum() {
        return subOrgHealthCentersNum;
    }

    public void setSubOrgHealthCentersNum(Integer subOrgHealthCentersNum) {
        this.subOrgHealthCentersNum = subOrgHealthCentersNum;
    }

    public Integer getSubOrgHospitalNum() {
        return subOrgHospitalNum;
    }

    public void setSubOrgHospitalNum(Integer subOrgHospitalNum) {
        this.subOrgHospitalNum = subOrgHospitalNum;
    }

    public String getHealthCenterPosition() {
        return healthCenterPosition;
    }

    public void setHealthCenterPosition(String healthCenterPosition) {
        this.healthCenterPosition = healthCenterPosition;
    }

    public String getInternetType() {
        return internetType;
    }

    public void setInternetType(String internetType) {
        this.internetType = internetType;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBankAccout() {
        return bankAccout;
    }

    public void setBankAccout(String bankAccout) {
        this.bankAccout = bankAccout;
    }

    public String getIsHealthCenter() {
        return isHealthCenter;
    }

    public void setIsHealthCenter(String isHealthCenter) {
        this.isHealthCenter = isHealthCenter;
    }

    public String getIsRegionalMedicalCenter() {
        return isRegionalMedicalCenter;
    }

    public void setIsRegionalMedicalCenter(String isRegionalMedicalCenter) {
        this.isRegionalMedicalCenter = isRegionalMedicalCenter;
    }

    public Integer getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(Integer floorArea) {
        this.floorArea = floorArea;
    }

    public Integer getBasicMedicinesNum() {
        return basicMedicinesNum;
    }

    public void setBasicMedicinesNum(Integer basicMedicinesNum) {
        this.basicMedicinesNum = basicMedicinesNum;
    }

    public Integer getClinicChemicalsNum() {
        return clinicChemicalsNum;
    }

    public void setClinicChemicalsNum(Integer clinicChemicalsNum) {
        this.clinicChemicalsNum = clinicChemicalsNum;
    }

    public Integer getClinicChinesePatentMedicineNum() {
        return clinicChinesePatentMedicineNum;
    }

    public void setClinicChinesePatentMedicineNum(Integer clinicChinesePatentMedicineNum) {
        this.clinicChinesePatentMedicineNum = clinicChinesePatentMedicineNum;
    }

    public Integer getVillageStationServicePopulation() {
        return villageStationServicePopulation;
    }

    public void setVillageStationServicePopulation(Integer villageStationServicePopulation) {
        this.villageStationServicePopulation = villageStationServicePopulation;
    }

    public String getVillageStationOrganizerCode() {
        return villageStationOrganizerCode;
    }

    public void setVillageStationOrganizerCode(String villageStationOrganizerCode) {
        this.villageStationOrganizerCode = villageStationOrganizerCode;
    }

    public String getVillageStationDocwayCode() {
        return villageStationDocwayCode;
    }

    public void setVillageStationDocwayCode(String villageStationDocwayCode) {
        this.villageStationDocwayCode = villageStationDocwayCode;
    }

    public String getVillageStationNeighborhoodCommittee() {
        return villageStationNeighborhoodCommittee;
    }

    public void setVillageStationNeighborhoodCommittee(String villageStationNeighborhoodCommittee) {
        this.villageStationNeighborhoodCommittee = villageStationNeighborhoodCommittee;
    }

    public String getVillageStationLegalRepresentativeType() {
        return villageStationLegalRepresentativeType;
    }

    public void setVillageStationLegalRepresentativeType(String villageStationLegalRepresentativeType) {
        this.villageStationLegalRepresentativeType = villageStationLegalRepresentativeType;
    }

    public String getVillageStationHeaderType() {
        return villageStationHeaderType;
    }

    public void setVillageStationHeaderType(String villageStationHeaderType) {
        this.villageStationHeaderType = villageStationHeaderType;
    }

    public String getVillageStationIsUnity() {
        return villageStationIsUnity;
    }

    public void setVillageStationIsUnity(String villageStationIsUnity) {
        this.villageStationIsUnity = villageStationIsUnity;
    }

    public String getVillageStationIsStandard() {
        return villageStationIsStandard;
    }

    public void setVillageStationIsStandard(String villageStationIsStandard) {
        this.villageStationIsStandard = villageStationIsStandard;
    }

    public String getVillageStationNonDirectoryDrugs() {
        return villageStationNonDirectoryDrugs;
    }

    public void setVillageStationNonDirectoryDrugs(String villageStationNonDirectoryDrugs) {
        this.villageStationNonDirectoryDrugs = villageStationNonDirectoryDrugs;
    }

    public String getVillageStationZeroSale() {
        return villageStationZeroSale;
    }

    public void setVillageStationZeroSale(String villageStationZeroSale) {
        this.villageStationZeroSale = villageStationZeroSale;
    }

    public String getVillageStationObject() {
        return villageStationObject;
    }

    public void setVillageStationObject(String villageStationObject) {
        this.villageStationObject = villageStationObject;
    }
}