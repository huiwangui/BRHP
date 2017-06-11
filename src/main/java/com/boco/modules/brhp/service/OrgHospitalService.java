package com.boco.modules.brhp.service;

import java.util.List;

import com.boco.modules.brhp.vo.OrgHospitalVo;
import com.boco.modules.brhp.vo.StopNoticeVo;

public interface OrgHospitalService {
	/**
	 * 
	 * getHospitalList:(查询医院列表). <br/>
	 * @author q
	 * @param vo
	 * @return
	 */
	public List<OrgHospitalVo> getHospitalList(OrgHospitalVo vo);
	
	/**
	 * 
	 * getHospitalDetail:(查看医院详情). <br/>
	 * @author q
	 * @param orgId
	 * @return
	 */
	public OrgHospitalVo getHospitalDetail(Integer orgId);
	/**
	 * 
	 * getStopNotice:(查看停诊公告). <br/>
	 * @author m
	 * @param StopNoticeVo
	 * @return
	 */
    List<StopNoticeVo> getStopNotice(StopNoticeVo vo);
}
