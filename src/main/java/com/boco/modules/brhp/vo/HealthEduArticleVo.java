package com.boco.modules.brhp.vo;

import java.util.Date;

import com.boco.common.persistence.Page;

public class HealthEduArticleVo {
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
	 * 模块名
	 */
	private String moduleName;
	
	/**
	 * 创建时间字符串
	 */
	private String createTimeStr;
	
	/**
	 * 分页对象
	 */
	private Page<HealthEduArticleVo> page;
    /**
     *文章的第一张图片 
     * imgSrc
     */
	private String imgSrc;
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

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
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

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public Page<HealthEduArticleVo> getPage() {
		return page;
	}

	public void setPage(Page<HealthEduArticleVo> page) {
		this.page = page;
	}

	public String getCreateTimeStr() {
		return createTimeStr;
	}

	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}
	
}
