package com.boco.modules.brhp.dao.healthedu;

import java.util.List;

import com.boco.common.annotation.MyBatisDao;
import com.boco.common.persistence.CrudDao;
import com.boco.modules.brhp.model.healthedu.HealthEduModuleEntity;

@MyBatisDao
public interface HealthEduModuleDao extends CrudDao<HealthEduModuleEntity>{
	/**
	 * 
	 * getModuleList:(获取模块列表). <br/>
	 * @author q
	 * @return
	 */
	public List<HealthEduModuleEntity> getModuleList();
}
