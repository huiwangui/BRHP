package com.boco.modules.brhp.web.organization;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boco.common.json.BaseJsonVo;
import com.boco.common.utils.JsonUtils;
import com.boco.modules.brhp.service.BizOutpatientService;
import com.boco.modules.brhp.service.DeptHospitalService;
import com.boco.modules.brhp.service.OrgHospitalService;
import com.boco.modules.brhp.service.StaffService;
import com.boco.modules.brhp.vo.BizOutpatientSourceVo;
import com.boco.modules.brhp.vo.DeptHospitalVo;
import com.boco.modules.brhp.vo.OrgHospitalVo;
import com.boco.modules.brhp.vo.StaffVo;
import com.boco.modules.brhp.vo.StopNoticeVo;
import com.boco.sp.external.annotation.ControllerLog;

@Controller
@RequestMapping(value = "/orgHospital", produces = "application/json;charset=UTF-8")
public class OrgHospitalController {
	
	@Resource
	OrgHospitalService hospitalService;
	@Resource
	StaffService staffService;
	@Resource
	DeptHospitalService deptHospitalService;
	@Resource
	BizOutpatientService bizOutpatientService;
	
	@ControllerLog(description="健康门户-医院管理-查询医院列表")
	@RequestMapping(value = "/hospitalList", method = RequestMethod.GET)
	public String hospitalList(HttpServletRequest request, Model model, OrgHospitalVo vo){

		model.addAttribute("searchName", vo.getOrgName()); // 获取查询条件存入作用域，用于条件回显
		/** 获取查询结果列表 **/
		List<OrgHospitalVo> hospitalList = hospitalService.getHospitalList(vo);
		/**将准备好的list集合放入作用域**/
		model.addAttribute("hospitalList", hospitalList);
		return "/organization/hospitalList";
	}
	@ControllerLog(description="健康门户-医院管理-查询医院详情")
	@RequestMapping(value = "/hospitalDetail", method = RequestMethod.GET)
	public String hospitalDetail(HttpServletRequest request, Model model, Integer orgId, Integer deptId){
		/**获取医院详情**/
		OrgHospitalVo hospitalDetail = hospitalService.getHospitalDetail(orgId);
		/**获取医院下的医生列表**/
		StaffVo staffVo = new StaffVo();
		staffVo.setOrgId(orgId);
		staffVo.setDeptId(deptId);
		List<StaffVo> staffList = staffService.getStaffList(staffVo);
		/**写入作用域**/
		model.addAttribute("hospitalDetail", hospitalDetail);
		model.addAttribute("staffList", staffList);
		
		return "/organization/hospitalDetail";
	}
	@ControllerLog(description="健康门户-医院管理-查询医院简介")
	@RequestMapping(value = "/hospitalIntroduction", method = RequestMethod.GET)
	public String hospitalIntroduction(HttpServletRequest request, Model model, Integer orgId){
		/**获取医院详情**/
		OrgHospitalVo hospitalDetail = hospitalService.getHospitalDetail(orgId);
		model.addAttribute("hospitalDetail", hospitalDetail);
		
		return "/organization/hospitalIntroduction";
	}
	/**获取医院下的科室列表 包括子级科室*/
	@RequestMapping(value = "/getHospitalFirstLevelDepts", method = RequestMethod.GET)
	public String getHospitalFirstLevelDepts(HttpServletRequest request, Model model, Integer orgId){
		/**医院信息*/
		OrgHospitalVo hospitalDetail = hospitalService.getHospitalDetail(orgId);
		model.addAttribute("hospitalDetail", hospitalDetail);
		/**一级科室**/
		DeptHospitalVo deptHospitalVo=new DeptHospitalVo();
		deptHospitalVo.setOrgId(orgId);
		List<DeptHospitalVo> listHospitalFirstLevelDepts=deptHospitalService.getHospitalFirstLevelDepts(deptHospitalVo);
		model.addAttribute("hospitalFirstDepts", listHospitalFirstLevelDepts);
		/**二级科室*/
	    List list=new ArrayList<>();
		for (DeptHospitalVo deptVo : listHospitalFirstLevelDepts) {
			  Integer deptId=deptVo.getDeptId();
			  String firstName=deptVo.getName();
			  List<DeptHospitalVo> listHospitalChildrenDepts=deptHospitalService.getHospitalChildrenDepts(deptId);
			  Map map=new HashMap();
			  map.put("firstName", firstName);
			  map.put("orgId", orgId);
			  map.put("firstDeptID", deptId);
			  map.put("secondName", listHospitalChildrenDepts);
			  list.add(map);
			}
		model.addAttribute("ListDepts", list);
		model.addAttribute("ListDeptsJson", JsonUtils.getJsonFormat(list));
		return "/organization/hospitalIntroduction";
	}
	
	/**根据 机构和科室(二级)deptId查询 医生的排班信息*/
	@RequestMapping(value = "/ScheDualInfo", method = RequestMethod.GET)
	public String ScheDualInfoByDeptId(HttpServletRequest request, Model model, Integer deptId,Integer orgId){
		
		/**用机构和科室获取医生列表**/
		//model.addAttribute("hospitalDetail", hospitalDetail);
		StaffVo vo=new StaffVo();
		vo.setDeptId(deptId);
		vo.setOrgId(orgId);
		List<StaffVo>  listStaffVo= staffService.getStaffList(vo);
		Set<StaffVo> setlist=new HashSet();
		setlist.addAll(listStaffVo);
		/**根据医生和科室查询排班信息*/
		List list=new ArrayList();
		
		for(StaffVo staffVo:setlist){
		Map map=new HashMap();	
		Integer staffId=staffVo.getStaffId();
		List<BizOutpatientSourceVo> listSource=bizOutpatientService.getScheDualInfoByDeptId(staffId, deptId, orgId);
		map.put("doctor", staffVo);
		map.put("listSource",listSource);
		list.add(map);
		}
		//添加服务器时间
		Date date =new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    String nowday=format.format(date);
	    model.addAttribute("nowday", nowday);
		model.addAttribute("ScheDualing", list);
		model.addAttribute("ScheDualingJson", JsonUtils.getJsonFormat(list));
		
		return "/business/outpatient/doctorSchedule";
	}
	/**根据 医生的排班信息，转到号源预约页面*/
	@RequestMapping(value = "/ScheDualDetail", method = RequestMethod.GET)
	public String ScheDualDetail(HttpServletRequest request, Model model, Integer deptId,Integer orgId,Integer staffId){
		//医生详情
		StaffVo staffVoDetail=staffService.getStaffDetail(staffId);
		model.addAttribute("staffDetail", staffVoDetail);
		//服务器时间
		Date date =new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    String nowday=format.format(date);
	    model.addAttribute("nowday", nowday);
	    //号源信息
	    List<BizOutpatientSourceVo> listSource=bizOutpatientService.getScheDualInfoByDeptId(staffId, deptId, orgId);
	    model.addAttribute("ScheDualJson", JsonUtils.getJsonFormat(listSource));
	    model.addAttribute("listSource", listSource);
		return "/business/outpatient/doctorSchedule2";
	}
	/**查询停诊公告*/
	@ResponseBody
	@RequestMapping(value = "/getHospitalDetail", method = RequestMethod.GET)
	public String  getHospitalDetail(HttpServletRequest request, Model model,Integer orgId){
		StopNoticeVo vo=new StopNoticeVo();
		vo.setCreateTime(new Date());
		vo.setOrgId(orgId);
		List<StopNoticeVo> listStopVo=hospitalService.getStopNotice(vo);
		System.out.println("------------------"+JsonUtils.getJsonFormat(listStopVo));
		
		return JsonUtils.getJsonFormat(listStopVo);
		
	}
	
	/**查询更多停诊公告*/
	@RequestMapping(value = "/getstopDetail", method = RequestMethod.GET)
	public String  getstopDetail(HttpServletRequest request, Model model,Integer orgId){
		StopNoticeVo vo=new StopNoticeVo();
		vo.setCreateTime(new Date());
		vo.setOrgId(orgId);
		List<StopNoticeVo> listStopVo=hospitalService.getStopNotice(vo);
		model.addAttribute("listStopVo", listStopVo);
		return "/business/outpatient/stopMore";
		
    }
}