package com.boco.modules.brhp.dao.department;

import java.util.List;

import com.boco.common.annotation.MyBatisDao;
import com.boco.common.persistence.CrudDao;
import com.boco.modules.brhp.model.department.DeptHospitalDeptEntity;
import com.boco.modules.brhp.vo.DeptHospitalVo;

@MyBatisDao
public interface DeptHospitalDao extends CrudDao<DeptHospitalDeptEntity>{
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
