package com.boco.modules.brhp.dao.user;

import java.util.List;

import com.boco.common.annotation.MyBatisDao;
import com.boco.common.persistence.CrudDao;
import com.boco.modules.brhp.model.user.UserPatientEntity;
import com.boco.modules.brhp.vo.UserPatientVo;

@MyBatisDao
public interface UserPatientDao extends CrudDao<UserPatientEntity>{
	/**
	 * 
	 * getPatientList:(获取某人的就诊人列表). <br/>
	 * @author q
	 * @param entity
	 * @return
	 */
	public List<UserPatientVo> getPatientList(UserPatientVo vo);
	/**
	 * 
	 * resetDefaultFlag:(把所有默认标识置为0). <br/>
	 * @author q
	 * @param uid
	 * @return
	 */
	public Integer resetDefaultFlag(String uid);
	/**
	 * 
	 * updateById:(根据id把默认标识置为1). <br/>
	 * @author j
	 * @param id
	 * @return
	 */
	 void updateById(Integer id);
}
