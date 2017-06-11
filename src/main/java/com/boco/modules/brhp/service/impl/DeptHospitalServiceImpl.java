package com.boco.modules.brhp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.boco.modules.brhp.dao.department.DeptHospitalDao;
import com.boco.modules.brhp.service.DeptHospitalService;
import com.boco.modules.brhp.vo.DeptHospitalVo;

@Service
public class DeptHospitalServiceImpl implements DeptHospitalService{
	
	@Resource
	DeptHospitalDao deptHospitalDao;

	@Override
	public List<DeptHospitalVo> getHospitalFirstLevelDepts(DeptHospitalVo vo) {
		return deptHospitalDao.getHospitalFirstLevelDepts(vo);
	}

	@Override
	public List<DeptHospitalVo> getHospitalChildrenDepts(Integer parentDeptId) {
		return deptHospitalDao.getHospitalChildrenDepts(parentDeptId);
	}

	@Override
	public DeptHospitalVo getParentDeptDetail(Integer deptId) {
		return deptHospitalDao.getParentDeptDetail(deptId);
	}

}
