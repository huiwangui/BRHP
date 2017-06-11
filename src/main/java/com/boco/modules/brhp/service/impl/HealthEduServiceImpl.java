package com.boco.modules.brhp.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.boco.common.constants.BusinessConstants;
import com.boco.modules.brhp.dao.healthedu.HealthEduArticleDao;
import com.boco.modules.brhp.dao.healthedu.HealthEduModuleDao;
import com.boco.modules.brhp.model.healthedu.HealthEduArticleEntity;
import com.boco.modules.brhp.model.healthedu.HealthEduModuleEntity;
import com.boco.modules.brhp.service.HealthEduService;
import com.boco.modules.brhp.vo.HealthEduArticleVo;

@Service
public class HealthEduServiceImpl implements HealthEduService{
	
	@Resource
	HealthEduArticleDao articleDao;
	@Resource
	HealthEduModuleDao moduleDao;

	@Override
	public List<HealthEduModuleEntity> getModuleList() {
		return moduleDao.getModuleList();
	}

	@Override
	public List<HealthEduArticleVo> getArticleList(HealthEduArticleVo vo) {
		return articleDao.getArticleList(vo);
	}

	@Override
	public Integer getArticleCount(HealthEduArticleVo vo) {
		return articleDao.getArticleCount(vo);
	}

	@Override
	public Integer addModule(HealthEduModuleEntity module) {
		module.setCreateTime(new Date());
		module.setStatus(BusinessConstants.NORMAL_STATUS_NORMAL);
		return moduleDao.insert(module);
	}

	@Override
	public Integer addArticle(HealthEduArticleEntity entity) {
		entity.setCreateTime(new Date());
		return articleDao.insert(entity);
	}

	@Override
	public HealthEduArticleVo getArticle(Integer id) {
		return articleDao.getArticle(id);
	}

	@Override
	public Integer updateArticle(HealthEduArticleEntity entity) {
		return articleDao.update(entity);
	}

	@Override
	public Integer deleteArticle(Integer id) {
		return articleDao.delete(String.valueOf(id));
	}

}
