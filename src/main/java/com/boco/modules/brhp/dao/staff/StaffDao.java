package com.boco.modules.brhp.dao.staff;

import java.util.List;

import com.boco.common.annotation.MyBatisDao;
import com.boco.common.persistence.CrudDao;
import com.boco.modules.brhp.model.staff.StaffEntity;
import com.boco.modules.brhp.model.staff.StaffOfficeEntity;
import com.boco.modules.brhp.vo.StaffOfficeVo;
import com.boco.modules.brhp.vo.StaffVo;

@MyBatisDao
public interface StaffDao extends CrudDao<StaffEntity>{
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
	 * getStaffDetail:(获取医生详情). <br/>
	 * @author q
	 * @param staffId
	 * @return
	 */
	public StaffVo getStaffDetail(Integer staffId);
	/**
	 * 
	 * getOfficeList:(获取医生职位列表). <br/>
	 * @author q
	 * @param staffId
	 * @return
	 */
	public List<StaffOfficeVo> getOfficeList(Integer staffId);
	/**
	 * 
	 * getCount查询医生总条数
	 * @author J
	 */
	Integer getCount(StaffVo vo);
}
