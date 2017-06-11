package com.boco.modules.brhp.model.healthedu;

import java.util.Date;

/**
 * 健康教育模块实体类
 * ClassName: HealthEduModuleEntity <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017年3月28日 下午2:41:03 <br/>
 *
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class HealthEduModuleEntity {
    private Integer id;

    /**
    * 模块名
    */
    private String moduleName;

    /**
    * 图片地址
    */
    private String img;

    /**
    * 状态： 1.启用  0.禁用
    */
    private String status;

    /**
    * 创建时间
    */
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}