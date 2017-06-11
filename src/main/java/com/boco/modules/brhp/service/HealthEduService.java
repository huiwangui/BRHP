package com.boco.modules.brhp.service;

import java.util.List;

import com.boco.modules.brhp.model.healthedu.HealthEduArticleEntity;
import com.boco.modules.brhp.model.healthedu.HealthEduModuleEntity;
import com.boco.modules.brhp.vo.HealthEduArticleVo;

public interface HealthEduService {
	/**
	 * 
	 * getModuleList:(获取模块列表). <br/>
	 * @author q
	 * @return
	 */
	public List<HealthEduModuleEntity> getModuleList();
	/**
	 * 
	 * getArticleList:(获取文章列表). <br/>
	 * @author q
	 * @param entity
	 * @return
	 */
	public List<HealthEduArticleVo> getArticleList(HealthEduArticleVo vo);
	/**
	 * 
	 * getArticleCount:(获取文章总数). <br/>
	 * @author q
	 * @param entity
	 * @return
	 */
	public Integer getArticleCount(HealthEduArticleVo vo);
	/**
	 * 
	 * addModule:(新增模板). <br/>
	 * @author q
	 * @param module
	 * @return
	 */
	public Integer addModule(HealthEduModuleEntity module);
	/**
	 * 
	 * addArticle:(新增文章). <br/>
	 * @author q
	 * @param entity
	 * @return
	 */
	public Integer addArticle(HealthEduArticleEntity entity);
	/**
	 * 
	 * getArticle:(获取文章). <br/>
	 * @author q
	 * @param id
	 * @return
	 */
	public HealthEduArticleVo getArticle(Integer id);
	/**
	 * 
	 * updateArticle:(修改文章). <br/>
	 * @author q
	 * @param entity
	 * @return
	 */
	public Integer updateArticle(HealthEduArticleEntity entity);
	/**
	 * 
	 * deleteArticle:(删除文章). <br/>
	 * @author q
	 * @param id
	 * @return
	 */
	public Integer deleteArticle(Integer id);
}
