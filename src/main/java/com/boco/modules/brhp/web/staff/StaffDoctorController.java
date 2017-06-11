package com.boco.modules.brhp.web.staff;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boco.common.utils.JsonUtils;
import com.boco.modules.brhp.service.DeptHospitalService;
import com.boco.modules.brhp.service.StaffService;
import com.boco.modules.brhp.vo.DeptHospitalVo;
import com.boco.modules.brhp.vo.StaffVo;
import com.boco.sp.external.annotation.ControllerLog;

@Controller
@RequestMapping(value = "/staff", produces = "application/json;charset=UTF-8")
public class StaffDoctorController {
	
	@Resource
	StaffService staffService;
	@Resource
	DeptHospitalService deptService;
	
	@ControllerLog(description="健康门户-医生管理-查询医生详情")
	@RequestMapping(value = "/doctorDetail", method = RequestMethod.GET)
	public String doctorDetail(HttpServletRequest request, Model model, Integer staffId){
		StaffVo staffDetail = staffService.getStaffDetail(staffId);
		model.addAttribute("staffDetail", staffDetail);
		return "/staff/doctorDetail";
	}
	@ControllerLog(description="健康门户-医生管理-查询医生科室信息")
	@RequestMapping(value = "/doctorDeptInfo", method = RequestMethod.GET)
	public String doctorDeptInfo(HttpServletRequest request, Model model, Integer staffId){
		StaffVo staffDetail = staffService.getStaffDetail(staffId);
		model.addAttribute("staffDetail", staffDetail);
		if (staffDetail.getOfficeList() != null && staffDetail.getOfficeList().size() > 0) {
			DeptHospitalVo parentDeptDetail = deptService.getParentDeptDetail(staffDetail.getOfficeList().get(0).getDeptId());
			model.addAttribute("parentDeptDetail", parentDeptDetail);
		}
		return "/staff/doctorDeptInfo";
	}
	
}
