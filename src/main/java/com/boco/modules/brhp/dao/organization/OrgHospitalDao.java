package com.boco.modules.brhp.dao.organization;

import java.util.List;

import com.boco.common.annotation.MyBatisDao;
import com.boco.common.persistence.CrudDao;
import com.boco.modules.brhp.model.organization.OrgHospitalEntity;
import com.boco.modules.brhp.vo.OrgHospitalVo;
import com.boco.modules.brhp.vo.StopNoticeVo;

@MyBatisDao
public interface OrgHospitalDao extends CrudDao<OrgHospitalEntity>{
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
	 * getHospitalDetail:(getHospitalDetail). <br/>
	 * @author q
	 * @param orgId
	 * @return
	 */
	public OrgHospitalVo getHospitalDetail(Integer orgId);
	
	/**
	 * 
	 * getStopNotice:(getStopNotice). <br/>
	 * @author m
	 * @param StopNoticeVo
	 * @return
	 */
    List<StopNoticeVo> getStopNotice(StopNoticeVo vo);
}
