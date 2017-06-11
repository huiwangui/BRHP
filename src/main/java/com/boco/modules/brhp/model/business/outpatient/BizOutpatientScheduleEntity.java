package com.boco.modules.brhp.model.business.outpatient;
/**
 * 
 * ClassName: BizOutpatientScheduleEntity <br/>
 * Reason: 业务模块-门诊排班表. <br/>
 * date: 2016年12月2日 下午4:50:39 <br/>
 *
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class BizOutpatientScheduleEntity {
    private Integer id;

    /**
    * 机构ID
    */
    private Integer orgId;

    /**
    * 行政区划
    */
    private String regionCode;

    /**
    * 部门（科室）ID
    */
    private Integer deptId;

    /**
    * 医生ID
    */
    private Integer staffId;

    /**
    * 门诊类别名称
    */
    private String outpatientType;

    /**
    * 星期一：0.上午  1.下午  2.全天  3.晚上  4.休息
    */
    private String monday;

    /**
    * 星期二：0.上午  1.下午  2.全天  3.晚上  4.休息
    */
    private String tuesday;

    /**
    * 星期三：0.上午  1.下午  2.全天  3.晚上  4.休息
    */
    private String wednesday;

    /**
    * 星期四：0.上午  1.下午  2.全天  3.晚上  4.休息
    */
    private String thursday;

    /**
    * 星期五：0.上午  1.下午  2.全天  3.晚上  4.休息
    */
    private String friday;

    /**
    * 星期六：0.上午  1.下午  2.全天  3.晚上  4.休息
    */
    private String saturday;

    /**
    * 星期天：0.上午  1.下午  2.全天  3.晚上  4.休息
    */
    private String sunday;

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

    public String getRegionCode() {
        return regionCode;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
    }

    public String getOutpatientType() {
        return outpatientType;
    }

    public void setOutpatientType(String outpatientType) {
        this.outpatientType = outpatientType;
    }

    public String getMonday() {
        return monday;
    }

    public void setMonday(String monday) {
        this.monday = monday;
    }

    public String getTuesday() {
        return tuesday;
    }

    public void setTuesday(String tuesday) {
        this.tuesday = tuesday;
    }

    public String getWednesday() {
        return wednesday;
    }

    public void setWednesday(String wednesday) {
        this.wednesday = wednesday;
    }

    public String getThursday() {
        return thursday;
    }

    public void setThursday(String thursday) {
        this.thursday = thursday;
    }

    public String getFriday() {
        return friday;
    }

    public void setFriday(String friday) {
        this.friday = friday;
    }

    public String getSaturday() {
        return saturday;
    }

    public void setSaturday(String saturday) {
        this.saturday = saturday;
    }

    public String getSunday() {
        return sunday;
    }

    public void setSunday(String sunday) {
        this.sunday = sunday;
    }
}