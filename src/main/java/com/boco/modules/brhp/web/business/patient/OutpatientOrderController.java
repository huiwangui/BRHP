package com.boco.modules.brhp.web.business.patient;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boco.common.enums.ApiStatusEnum;
import com.boco.common.json.BaseJsonVo;
import com.boco.common.persistence.Page;
import com.boco.common.utils.DateUtils;
import com.boco.common.utils.JsonUtils;
import com.boco.common.utils.ListUtils;
import com.boco.modules.brhp.model.business.outpatient.BizOutpatientOrderEntity;
import com.boco.modules.brhp.service.BizOutpatientService;
import com.boco.modules.brhp.service.DeptHospitalService;
import com.boco.modules.brhp.service.OrgHospitalService;
import com.boco.modules.brhp.service.StaffService;
import com.boco.modules.brhp.service.UserService;
import com.boco.modules.brhp.vo.BizOutpatientOrderVo;
import com.boco.modules.brhp.vo.BizOutpatientSourceVo;
import com.boco.modules.brhp.vo.DeptHospitalVo;
import com.boco.modules.brhp.vo.OrgHospitalVo;
import com.boco.modules.brhp.vo.StaffVo;
import com.boco.modules.brhp.vo.UserPatientVo;
import com.boco.modules.brhp.vo.UserVo;
import com.boco.sp.external.annotation.ControllerLog;


@Controller
@RequestMapping(value = "/outpatient", produces = "application/json;charset=UTF-8")
public class OutpatientOrderController {

	@Resource
	StaffService staffService;
	@Resource
	DeptHospitalService deptService;
	@Resource
	BizOutpatientService outpatientService;
	@Resource
	UserService userService;
	@Resource
    DeptHospitalService deptHospitalService;
	@Resource
	OrgHospitalService hospitalService;
	
	@ControllerLog(description="健康门户-医生管理-查询医生列表")
	@RequestMapping(value = "/doctorList", method = RequestMethod.GET)
	public String doctorList(HttpServletRequest request, Model model, StaffVo vo){

		model.addAttribute("searchName", vo.getName()); // 获取查询条件存入作用域，用于条件回显
		/** 获取查询结果列表 **/
		List<StaffVo> staffList = staffService.getStaffList(vo);
		/** 将相邻的两个对象存入同一个map中，用于前台迭代ul(一个ul中显示两个对象) **/
		List<Object> objList = new ArrayList<Object>();
		for (StaffVo staffVo : staffList) {
			objList.add(staffVo);
		}
		List<Map<String, Object>> doubleList = ListUtils.singleItemToDoubleItem(objList);
		Integer rows=staffService.getCount(vo);
		model.addAttribute("rows", rows);
		/**将准备好的list集合放入作用域**/
		model.addAttribute("doubleList", doubleList);
		return "/business/outpatient/doctorList";
	}
	
	@ControllerLog(description="健康门户-医生管理-查询预约列表")
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderList(HttpServletRequest request, Model model, Integer staffId, Integer deptId, String deptName){
		BizOutpatientSourceVo vo = new BizOutpatientSourceVo();
		//封装查询参数
		vo.setStaffId(staffId);
		vo.setDeptId(deptId);
		vo.setQueryStartTime(new Date());
		vo.setQueryEndDate(DateUtils.getWeekLaterDate(new Date(),1));
		StaffVo staffDetail = staffService.getStaffDetail(staffId);
		List<BizOutpatientSourceVo> outpatientSourceList = outpatientService.getOutpatientSourceList(vo);
		
		staffDetail.setDeptName(deptName);
		model.addAttribute("sourceList",outpatientSourceList);
		model.addAttribute("staffDetail",staffDetail);
		return "/business/outpatient/orderLayer";
	}
	
	@ControllerLog(description="健康门户-医生管理-查询医生号源信息")
	@RequestMapping(value = "/doctorSource", method = RequestMethod.GET)
	public String doctorSource(HttpServletRequest request, Model model, Integer staffId){
		/**获取两个星期内完整排班信息**/
		List<List<BizOutpatientSourceVo>> outpatientSourceListAll = outpatientService.getOutpatientSourceListAll(staffId);
		System.out.println(JsonUtils.getJsonFormat(outpatientSourceListAll));
		/**获取这两个星期分别的科室信息**/
		List<BizOutpatientSourceVo> deptMsgVo = new ArrayList<BizOutpatientSourceVo>();
		
		for (int i = 0; i < outpatientSourceListAll.size(); i++) {
			if (outpatientSourceListAll.get(i).size() == 0) {
				outpatientSourceListAll.remove(i);
				continue;
			}
			for (int j = 0; j < outpatientSourceListAll.get(i).size(); j++) {
				if (outpatientSourceListAll.get(i).get(j).getDeptId() != null) {
					BizOutpatientSourceVo vo = new BizOutpatientSourceVo();
					vo.setDeptId(outpatientSourceListAll.get(i).get(j).getDeptId());
					vo.setDeptName(outpatientSourceListAll.get(i).get(j).getDeptName());
					deptMsgVo.add(vo);
					break;
				}
			}
		}
		/**写入作用域**/
		model.addAttribute("deptMsgVo", deptMsgVo);
		model.addAttribute("outpatientSourceListAll", outpatientSourceListAll);
		StaffVo staffDetail = staffService.getStaffDetail(staffId);
		model.addAttribute("staffDetail", staffDetail);
		return "/business/outpatient/doctorSchedule";
	}
	
	@RequestMapping(value = "/appointInfo", method = RequestMethod.GET)
	public String appointInfo(HttpServletRequest request, Model model, Integer orderId){
		/**获取号源详情**/
		BizOutpatientSourceVo sourceDetail = outpatientService.getSourceDetail(orderId);
		model.addAttribute("sourceDetail", sourceDetail);
		/**获取医生详情**/
		StaffVo staffDetail = staffService.getStaffDetail(sourceDetail.getStaffId());
		model.addAttribute("staffDetail", staffDetail);
		/**获取就诊人列表**/
		UserVo vo = (UserVo)request.getSession().getAttribute("userInSession");
		UserPatientVo patientVo = new UserPatientVo();
		patientVo.setUid(vo.getUid());
		List<UserPatientVo> patientList = userService.getPatientList(patientVo);
		model.addAttribute("patientList", patientList);
		return "/business/outpatient/appointInfo";
	}
	@ControllerLog(description="健康门户-医生管理-预约挂号")
	@RequestMapping(value = "/outpatientOrder", method = RequestMethod.POST)
	@ResponseBody
	public String outpatientOrder(HttpServletRequest request, Model model, Integer sourceId,Integer patientId){
		BizOutpatientOrderVo orderVo = new BizOutpatientOrderVo();
		/**判断是否重复预约**/
		orderVo.setOutpatientSourceId(sourceId);
		orderVo.setPatientId(patientId);
		List<BizOutpatientOrderVo> orderList = outpatientService.getOrderList(orderVo);
		if (orderList != null && orderList.size() > 0) {
			return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.RE_BOOKING.getKey(), ApiStatusEnum.RE_BOOKING.getValue()));
		}
		/**调用预约方法进行预约**/
		BizOutpatientOrderEntity entity = new BizOutpatientOrderEntity();
		entity.setOutpatientSourceId(sourceId);
		entity.setPatientId(patientId);
		UserVo vo = (UserVo)request.getSession().getAttribute("userInSession");
		entity.setCreatorUid(vo.getUid());
		String outpatientOrder = outpatientService.outpatientOrder(entity);
		/**号源剩余号数为0**/
		if ("no number".equals(outpatientOrder)) {
			return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.NO_HEALTHCHECK_NUM.getKey(), ApiStatusEnum.NO_HEALTHCHECK_NUM.getValue()));
		}
		return JsonUtils.getJson(BaseJsonVo.success(null));
	}
	
	@ControllerLog(description="健康门户-医生管理-查询预约列表")
	@RequestMapping(value = "/getOrderList", method = RequestMethod.GET)
	@ResponseBody
	public String getOrderList(HttpServletRequest request, Model model,BizOutpatientOrderVo vo,String queryStartTimeStr,String queryEndTimeStr){
		UserVo userVo = (UserVo)request.getSession().getAttribute("userInSession");
		vo.setCreatorUid(userVo.getUid());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (queryStartTimeStr != null && !"".equals(queryStartTimeStr)) {
				vo.setQueryStartTime(sdf.parse(queryStartTimeStr));
			}
			if (queryEndTimeStr != null && !"".equals(queryEndTimeStr)) {
				vo.setQueryEndDate(sdf.parse(queryEndTimeStr));
			}
		} catch (ParseException e) {
			e.printStackTrace();
			return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.DATE_FORMART_ERROR.getKey(), ApiStatusEnum.DATE_FORMART_ERROR.getValue()));
		}
		List<BizOutpatientOrderVo> orderList = outpatientService.getOrderList(vo);
		System.out.println("++++++++"+JsonUtils.getJson(orderList));
		return JsonUtils.getJson(orderList);
	}
	
	@ControllerLog(description="健康门户-医生管理-查询预约详情")
	@RequestMapping(value = "/getOrderDetail", method = RequestMethod.GET)
	public String getOrderDetail(HttpServletRequest request, Model model,BizOutpatientOrderVo vo){
		BizOutpatientOrderVo orderDetail = outpatientService.getOrderDetail(vo.getId());
		model.addAttribute("orderDetail", orderDetail);
		/**获取医生详情**/
		StaffVo staffDetail = staffService.getStaffDetail(vo.getStaffId());
		model.addAttribute("staffDetail", staffDetail);
		return "/business/outpatient/orderDetail";
	}
	@ResponseBody
	@RequestMapping(value = "/getOrderDetailJ", method = RequestMethod.GET)
	public String getOrderDetailJ(HttpServletRequest request, Model model,BizOutpatientOrderVo vo){
		BizOutpatientOrderVo orderDetail = outpatientService.getOrderDetail(vo.getId());
		model.addAttribute("orderDetail", orderDetail);
		/**获取医生详情**/
		StaffVo staffDetail = staffService.getStaffDetail(vo.getStaffId());
		Map map=new HashMap<>();
		map.put("orderDetail", orderDetail);
		map.put("staffDetail", staffDetail);
		return JsonUtils.getJson(BaseJsonVo.success(map));
	}
	
	@ControllerLog(description="健康门户-医生管理-取消预约")
	@RequestMapping(value = "/cancelOrder", method = RequestMethod.POST)
	@ResponseBody
	public String cancelOrder(HttpServletRequest request, Model model,BizOutpatientOrderVo vo) throws ParseException{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		vo.setClinicDate(format.parse(vo.getClinicDateStr()));
		String cancelOrder = outpatientService.cancelOrder(vo);
		if ("overdue".equals(cancelOrder)) {
			return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.OVERDUE.getKey(), ApiStatusEnum.OVERDUE.getValue()));
		}
		return JsonUtils.getJson(BaseJsonVo.success(null));
	}
	@ResponseBody
	@RequestMapping(value = "/doctorListJson", method = RequestMethod.GET)
	public String doctorListJson(HttpServletRequest request, Model model, StaffVo vo, Integer pageNo,Integer pageSize){

		model.addAttribute("searchName", vo.getName()); // 获取查询条件存入作用域，用于条件回显
		Integer rows=staffService.getCount(vo);
		 Page<StaffVo> page=null;
		/**分页查询*/
		if (pageNo!=null) {
			if(pageNo!=0){
		     page = new Page<StaffVo>(pageNo,pageSize);
			vo.setPage(page);
			}
		 }
		page.setCount(rows);
		/** 获取查询结果列表 **/
		List<StaffVo> staffList = staffService.getStaffList(vo);
		if(staffList!=null&&staffList.size()>0){
			staffList.get(0).setPage(page);
		}
		/** 将相邻的两个对象存入同一个map中，用于前台迭代ul(一个ul中显示两个对象) **/
		List<Object> objList = new ArrayList<Object>();
		for (StaffVo staffVo : staffList) {
			objList.add(staffVo);
		}
		List<Map<String, Object>> doubleList = ListUtils.singleItemToDoubleItem(objList);
		
		return JsonUtils.getJson(BaseJsonVo.success(staffList));
	}
	/**通过医院，科室，查看医生列表*/
	@RequestMapping(value = "/doctorSourceBydeptId", method = RequestMethod.GET)
	public String doctorSourceBydeptId(HttpServletRequest request, Model model, Integer deptId,Integer orgId){
		StaffVo vo=new StaffVo();
		vo.setDeptId(deptId);
		vo.setOrgId(orgId);
		List<StaffVo> staffList = staffService.getStaffList(vo);
		/**查询科室信息*/
	    DeptHospitalVo deptHospitalVo=deptHospitalService.getParentDeptDetail(deptId);
	    OrgHospitalVo hospitalDetail = hospitalService.getHospitalDetail(orgId);
	    
		/**写入作用域**/
	    model.addAttribute("hospitalDetail", hospitalDetail);
		model.addAttribute("staffList", staffList);
		model.addAttribute("deptHospitalVo", deptHospitalVo);
		return "/business/outpatient/doctorBydeptId";
	}
	
	
}
