package com.boco.modules.brhp.service;

import java.util.List;

import com.boco.modules.brhp.vo.DeptHospitalVo;

public interface DeptHospitalService {
	/**
	 * 
	 * getHospitalDeptList:(获取医院下的一级科室列表). <br/>
	 * @author q
	 * @param vo
	 * @return
	 */
	public List<DeptHospitalVo> getHospitalFirstLevelDepts(DeptHospitalVo vo);
	/**
	 * 
	 * getHospitalChildrenDepts:(获取子科室列表). <br/>
	 * @author q
	 * @param vo
	 * @return
	 */
	public List<DeptHospitalVo> getHospitalChildrenDepts(Integer parentDeptId);
	/**
	 * 
	 * getParentDeptDetail:(获取父级科室详情). <br/>
	 * @author q
	 * @param parentDeptId
	 * @return
	 */
	public DeptHospitalVo getParentDeptDetail(Integer deptId);
}
