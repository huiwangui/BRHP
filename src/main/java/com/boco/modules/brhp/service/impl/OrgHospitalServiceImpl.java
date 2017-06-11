package com.boco.modules.brhp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.boco.modules.brhp.dao.organization.OrgHospitalDao;
import com.boco.modules.brhp.service.OrgHospitalService;
import com.boco.modules.brhp.vo.OrgHospitalVo;
import com.boco.modules.brhp.vo.StopNoticeVo;

@Service
public class OrgHospitalServiceImpl implements OrgHospitalService{
	
	@Resource
	OrgHospitalDao hospitalDao;

	@Override
	public List<OrgHospitalVo> getHospitalList(OrgHospitalVo vo) {
		return hospitalDao.getHospitalList(vo);
	}

	@Override
	public OrgHospitalVo getHospitalDetail(Integer orgId) {
		return hospitalDao.getHospitalDetail(orgId);
	}

	@Override
	public List<StopNoticeVo> getStopNotice(StopNoticeVo vo) {
		
		return hospitalDao.getStopNotice(vo);
	}

}
