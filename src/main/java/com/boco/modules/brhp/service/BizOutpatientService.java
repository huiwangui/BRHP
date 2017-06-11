package com.boco.modules.brhp.service;

import java.util.List;

import com.boco.modules.brhp.model.business.outpatient.BizOutpatientOrderEntity;
import com.boco.modules.brhp.vo.BizOutpatientOrderVo;
import com.boco.modules.brhp.vo.BizOutpatientSourceVo;

public interface BizOutpatientService {
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
	 * getOutpatientSourceListAll:(查询医生未来两周内的号表信息). <br/>
	 * @author q
	 * @param staffId
	 * @return
	 */
	public List<List<BizOutpatientSourceVo>> getOutpatientSourceListAll(Integer staffId);
	/**
	 * 
	 * outpatientOrder:(这里用一句话描述这个方法的作用). <br/>
	 * @author q
	 * @param entity
	 * @return
	 */
	public String outpatientOrder(BizOutpatientOrderEntity entity);
	/**
	 * 
	 * getSourceDetail:(获取号表详情). <br/>
	 * @author q
	 * @return
	 */
	public BizOutpatientSourceVo getSourceDetail(Integer id);
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
	 * 
	 * cancelOrder:(取消订单). <br/>
	 * @author q
	 * @return
	 */
	public String cancelOrder(BizOutpatientOrderVo vo);
	/**
	 * 
	 * getScheDualInfoByDeptId:(查询2周内排班信息). <br/>
	 * @author m
	 * @param staffId deptId orgId
	 * @return
	 */
	List<BizOutpatientSourceVo> getScheDualInfoByDeptId(Integer staffId,Integer deptId,Integer orgId);
}
