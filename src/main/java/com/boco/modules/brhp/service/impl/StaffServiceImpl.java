package com.boco.modules.brhp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.boco.modules.brhp.dao.staff.StaffDao;
import com.boco.modules.brhp.service.StaffService;
import com.boco.modules.brhp.vo.StaffOfficeVo;
import com.boco.modules.brhp.vo.StaffVo;

@Service
public class StaffServiceImpl implements StaffService{
	
	@Resource
	StaffDao staffDao;

	@Override
	public List<StaffVo> getStaffList(StaffVo vo) {
		return staffDao.getStaffList(vo);
	}

	@Override
	public StaffVo getStaffDetail(Integer staffId) {
		/**获取医生详情，包含医生基础信息和详细表信息**/
		StaffVo staffDetail = staffDao.getStaffDetail(staffId);
		List<StaffOfficeVo> officeList = staffDao.getOfficeList(staffId);
		
		/**封装医生职务信息**/
		if (officeList != null && officeList.size() > 0) {
			staffDetail.setLabel(officeList.get(0).getLabel());
			staffDetail.setOfficeList(officeList);
		}
		return staffDetail;
	}

	@Override
	public Integer getCount(StaffVo vo) {
		// TODO Auto-generated method stub
		return staffDao.getCount(vo);
	}

}
