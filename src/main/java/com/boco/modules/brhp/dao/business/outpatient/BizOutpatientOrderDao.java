package com.boco.modules.brhp.dao.business.outpatient;

import java.util.List;

import com.boco.common.annotation.MyBatisDao;
import com.boco.common.persistence.CrudDao;
import com.boco.modules.brhp.model.business.outpatient.BizOutpatientOrderEntity;
import com.boco.modules.brhp.vo.BizOutpatientOrderVo;

@MyBatisDao
public interface BizOutpatientOrderDao extends CrudDao<BizOutpatientOrderEntity>{
	/**
	 * 
	 * getOrderList:(查询预约列表). <br/>
	 * @author q
	 * @param vo
	 * @return
	 */
	public List<BizOutpatientOrderVo> getOrderList(BizOutpatientOrderVo vo);
	/**
	 * 
	 * getOrderDetail:(查询预约详情). <br/>
	 * @author q
	 * @param id
	 * @return
	 */
	public BizOutpatientOrderVo getOrderDetail(Integer id);
	/**
	 * getOrderDetail:(修改订单状态). <br/>
	 * @author q
	 * @param id
	 * @return
	 */
	public Integer updateOrderStatus(Integer id,String status);
}
