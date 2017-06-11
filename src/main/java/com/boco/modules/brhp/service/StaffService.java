package com.boco.modules.brhp.service;

import java.util.List;

import com.boco.modules.brhp.vo.StaffVo;

public interface StaffService {
	/**
	 * 
	 * getStaffList:(查询医生列表). <br/>
	 * @author q
	 * @param vo
	 * @return
	 */
	public List<StaffVo> getStaffList(StaffVo vo);
	/**
	 * 
	 * getStaffDetail:(根据医生ID获取医生详情). <br/>
	 * @author q
	 * @param staffId
	 * @return
	 */
	public StaffVo getStaffDetail(Integer staffId);
	/**
	 * 
	 * getCount查询医生总条数
	 * @author J
	 */
	Integer getCount(StaffVo vo);
}
