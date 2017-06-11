package com.boco.modules.brhp.model.healthedu;

import java.util.Date;
/**
 * 健康教育文章实体类
 * ClassName: HealthEduArticleEntity <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2017年3月28日 下午2:42:58 <br/>
 *
 * @author q
 * @version 
 * @since JDK 1.7+
 */
public class HealthEduArticleEntity {
    /**
    * 主键ID
    */
    private Integer id;

    /**
    * 模块ID
    */
    private Integer moduleId;

    /**
    * 文章标题
    */
    private String title;

    /**
    * 作者/创建人
    */
    private String author;

    /**
    * 创建时间
    */
    private Date createTime;

    /**
    * 文章内容
    */
    private String content;
    /**
     *今日点击量
     */
    private Integer todayhits;
    /**
     *总点击量
     */
    private Integer totalhits;
    /**
     *内容纯文本
     */
    private String context;
    public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Integer getTodayhits() {
		return todayhits;
	}

	public void setTodayhits(Integer todayhits) {
		this.todayhits = todayhits;
	}

	public Integer getTotalhits() {
		return totalhits;
	}

	public void setTotalhits(Integer totalhits) {
		this.totalhits = totalhits;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getModuleId() {
        return moduleId;
    }

    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
