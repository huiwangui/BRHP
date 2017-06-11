package com.boco.modules.brhp.dao.healthedu;

import java.util.List;

import com.boco.common.annotation.MyBatisDao;
import com.boco.common.persistence.CrudDao;
import com.boco.modules.brhp.model.healthedu.HealthEduArticleEntity;
import com.boco.modules.brhp.vo.HealthEduArticleVo;

@MyBatisDao
public interface HealthEduArticleDao extends CrudDao<HealthEduArticleEntity>{
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
	 * getArticle:(获取文章). <br/>
	 * @author q
	 * @param id
	 * @return
	 */
	public HealthEduArticleVo getArticle(Integer id);
}
