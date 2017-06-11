package com.boco.modules.brhp.dao.business.outpatient;

import java.util.List;

import com.boco.common.annotation.MyBatisDao;
import com.boco.common.persistence.CrudDao;
import com.boco.modules.brhp.model.business.outpatient.BizOutpatientSourceEntity;
import com.boco.modules.brhp.vo.BizOutpatientSourceVo;

@MyBatisDao
public interface BizOutpatientSourceDao extends CrudDao<BizOutpatientSourceEntity>{
	/**
	 * 
	 * getOutpatientSourceList:查看医生号表信息（查看可预约的信息）. <br/>
	 * @author q
	 * @param vo
	 * @return
	 */
	public List<BizOutpatientSourceVo> getOutpatientSourceList(BizOutpatientSourceVo vo);
	
	/**
	 * 
	 * getSourceDetail:(获取号表详细). <br/>
	 * @author q
	 * @param id
	 * @return
	 */
	public BizOutpatientSourceVo getSourceDetail(Integer id);
}
