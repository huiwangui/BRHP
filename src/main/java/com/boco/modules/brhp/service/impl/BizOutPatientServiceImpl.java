package com.boco.modules.brhp.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boco.common.annotation.MyBatisDao;
import com.boco.common.constants.BusinessConstants;
import com.boco.common.utils.ComparatorBizOutpatientSourceVo;
import com.boco.common.utils.DateUtils;
import com.boco.common.utils.JsonUtils;
import com.boco.common.utils.NumberUtils;
import com.boco.modules.brhp.dao.business.outpatient.BizOutpatientOrderDao;
import com.boco.modules.brhp.dao.business.outpatient.BizOutpatientPaybillDao;
import com.boco.modules.brhp.dao.business.outpatient.BizOutpatientSourceDao;
import com.boco.modules.brhp.dao.staff.StaffDao;
import com.boco.modules.brhp.model.business.outpatient.BizOutpatientOrderEntity;
import com.boco.modules.brhp.model.business.outpatient.BizOutpatientPaybillEntity;
import com.boco.modules.brhp.model.business.outpatient.BizOutpatientSourceEntity;
import com.boco.modules.brhp.service.BizOutpatientService;
import com.boco.modules.brhp.vo.BizOutpatientOrderVo;
import com.boco.modules.brhp.vo.BizOutpatientSourceVo;
import com.boco.modules.brhp.vo.StaffOfficeVo;

@Service
public class BizOutPatientServiceImpl implements BizOutpatientService{
	
	@Resource
	BizOutpatientSourceDao sourceDao;
	@Resource
	StaffDao staffDao;
	@Resource
	BizOutpatientOrderDao orderDao;
	@Resource
	BizOutpatientPaybillDao billDao;

	@Override
	public List<BizOutpatientSourceVo> getOutpatientSourceList(
			BizOutpatientSourceVo vo) {
		return sourceDao.getOutpatientSourceList(vo);
	}

	@Override
	public List<List<BizOutpatientSourceVo>> getOutpatientSourceListAll(
			Integer staffId) {
		List<List<BizOutpatientSourceVo>> returnList = new ArrayList<List<BizOutpatientSourceVo>>();
		
		List<StaffOfficeVo> officeList = staffDao.getOfficeList(staffId);	//获取医生职位列表
		SimpleDateFormat format = new SimpleDateFormat("MM/dd");
		String[] weekOfDays = {"周日", "周一", "周二", "周三", "周四", "周五", "周六"}; 
		for (StaffOfficeVo staffOfficeVo : officeList) {	//迭代每个职位，获取科室信息，并获取相应的号表信息
			BizOutpatientSourceVo vo = new BizOutpatientSourceVo();
			vo.setStaffId(staffId);
			vo.setQueryStartTime(new Date());
			vo.setQueryEndDate(DateUtils.getWeekLaterDate(new Date(), 2));
			vo.setDeptId(staffOfficeVo.getDeptId());
			List<BizOutpatientSourceVo> outpatientSourceList = sourceDao.getOutpatientSourceList(vo);
			List<BizOutpatientSourceVo> returnSourecList = new ArrayList<BizOutpatientSourceVo>();
			
	        for (int i = 1; i <= 14; i++) {		//迭代从当前日期开始的未来14天的日期
	        	Calendar todayStart = Calendar.getInstance();  
	            todayStart.set(Calendar.HOUR_OF_DAY, 0);  
	            todayStart.set(Calendar.MINUTE, 0);  
	            todayStart.set(Calendar.SECOND, 0);  
	            todayStart.set(Calendar.MILLISECOND, 0);
	        	todayStart.add(Calendar.DAY_OF_YEAR, i);
	        	
	        	if (outpatientSourceList == null || outpatientSourceList.size() == 0) {
	        		BizOutpatientSourceVo bizOutpatientSourceVo = new BizOutpatientSourceVo();
	        		Date clinicDate = new Date(todayStart.getTime().getTime());
	        		bizOutpatientSourceVo.setClinicDate(clinicDate);
	        		Calendar calendar = Calendar.getInstance(); 
					calendar.setTime(clinicDate);
					int w = calendar.get(Calendar.DAY_OF_WEEK) - 1;      
				    if (w < 0){        
				        w = 0;      
				    }
				    bizOutpatientSourceVo.setClinicSimpleDateStr(format.format(clinicDate));
				    bizOutpatientSourceVo.setWeekDayChs(weekOfDays[w]);
				    returnSourecList.add(bizOutpatientSourceVo);
				}
	        	
	        	for (BizOutpatientSourceVo bizOutpatientSourceVo : outpatientSourceList) {	
	        		int flag = -1;
	        		BizOutpatientSourceVo amBizOutpatientSourceVo = null;
	        		BizOutpatientSourceVo pmBizOutpatientSourceVo = null;
	        		/**
	        		 * 如果号表的坐诊时间不等于当次循环的日期，说明没有，就只设置时间和星期
	        		 */
					if (bizOutpatientSourceVo.getClinicDate().getTime() != todayStart.getTime().getTime()) {
						
						
						BizOutpatientSourceVo itemVo = new BizOutpatientSourceVo();
						Date clinicDate = new Date(todayStart.getTime().getTime());
						itemVo.setClinicDate(clinicDate);
						itemVo.setClinicSimpleDateStr(format.format(clinicDate));
						
						for (int j = 0; j < returnSourecList.size(); j++) {
							if (returnSourecList.get(j).getClinicSimpleDateStr().equals(itemVo.getClinicSimpleDateStr())) {
								flag = 1;
							}
						}
						if (flag == 1) {
							continue;
						}
						Calendar calendar = Calendar.getInstance(); 
						calendar.setTime(clinicDate);
						int w = calendar.get(Calendar.DAY_OF_WEEK) - 1;      
					    if (w < 0){        
					        w = 0;      
					    }
					    itemVo.setWeekDayChs(weekOfDays[w]);
					    returnSourecList.add(itemVo);
					}else {
						/**
						 * 内层迭代根据当前循环科室获取到的号表，如果号表的坐诊日期时间戳等于当次循环的日期时间戳，说明这一天是有数据的，就直接设置值
						 */
						int index = 0;
						for (int j = 0; j < returnSourecList.size(); j++) {
							if (returnSourecList.get(j).getClinicSimpleDateStr().equals(bizOutpatientSourceVo.getClinicSimpleDateStr())) {
								flag = 1;
								if (returnSourecList.get(j).getRemainderNumber() == null && bizOutpatientSourceVo.getRemainderNumber() >= 0) {
									index = j;
								}else if (returnSourecList.get(j).getRemainderNumber() != null && bizOutpatientSourceVo.getRemainderNumber() >= 0) {
									index = j;
									if ("0".equals(returnSourecList.get(j).getClinicTime())) {
										amBizOutpatientSourceVo = returnSourecList.get(j);
										pmBizOutpatientSourceVo = bizOutpatientSourceVo;
									}else if ("1".equals(returnSourecList.get(j).getClinicTime())) {
										amBizOutpatientSourceVo = bizOutpatientSourceVo;
										pmBizOutpatientSourceVo = returnSourecList.get(j);
									}
								}
							}
						}
						if (flag == 1) {
							if (index != -1) {
								if (amBizOutpatientSourceVo != null && pmBizOutpatientSourceVo != null) {
									BizOutpatientSourceVo doubleVo = new BizOutpatientSourceVo();
									doubleVo.setClinicTime("2");
									doubleVo.setClinicDate(amBizOutpatientSourceVo.getClinicDate());
									doubleVo.setClinicSimpleDateStr(amBizOutpatientSourceVo.getClinicSimpleDateStr());
									doubleVo.setAmBizOutpatientSourceVo(amBizOutpatientSourceVo);
									doubleVo.setPmBizOutpatientSourceVo(pmBizOutpatientSourceVo);
									doubleVo.setDeptId(amBizOutpatientSourceVo.getDeptId());
									doubleVo.setDeptName(amBizOutpatientSourceVo.getDeptName());
									doubleVo.setWeekDayChs(amBizOutpatientSourceVo.getWeekDayChs());
									returnSourecList.set(index, doubleVo);
								}else {
									returnSourecList.set(index, bizOutpatientSourceVo);
								}
							}
							continue;
						}
						returnSourecList.add(bizOutpatientSourceVo);
					}
				}
			}
	        
	        ComparatorBizOutpatientSourceVo com = new ComparatorBizOutpatientSourceVo();
			Collections.sort(returnSourecList, com);
			returnList.add(returnSourecList);
		}
		return returnList;
	}

	@Override
	@Transactional
	public String outpatientOrder(BizOutpatientOrderEntity entity) {
		Date createTime = new Date();
		entity.setCreateTime(createTime);
		entity.setDoctorVisitStatus(BusinessConstants.SEE_DOC_STATUS_HASNOTDOC);
		entity.setOrderStatus(BusinessConstants.PAY_STATUS_HASNOTPAY);
		
		BizOutpatientSourceEntity bizOutpatientSourceEntity = sourceDao.get(String.valueOf(entity.getOutpatientSourceId()));
		/**
		 * 查询是否有号，预约号量-1，并发控制
		 */
		int flag = 0;
		while(flag == 0){
			if (bizOutpatientSourceEntity.getRemainderNumber() == 0) {
				return "no number"; // 没号了，返回
			}else {
				bizOutpatientSourceEntity.setRemainderNumber(bizOutpatientSourceEntity.getRemainderNumber() - 1);
				bizOutpatientSourceEntity.setCurrentNumber(bizOutpatientSourceEntity.getCurrentNumber() + 1);
				int updateNum = sourceDao.update(bizOutpatientSourceEntity);
				if (updateNum == 1) {   //修改行数为1，说明版本号对应，中间无其他人修改
					flag=1;
				}
			}
		}
		/**在预约记录表中新增记录**/
		StringBuffer orderNumberBuffer = new StringBuffer("1");
		StringBuffer billNumberBuffer = new StringBuffer("2");
		
		orderNumberBuffer.append(NumberUtils.addZero(6, bizOutpatientSourceEntity.getStaffId()));
		SimpleDateFormat myFmt = new SimpleDateFormat("yyMMdd");
		String dateString = myFmt.format(createTime);
		orderNumberBuffer.append(dateString);
		orderNumberBuffer.append(NumberUtils.addZero(3, bizOutpatientSourceEntity.getCurrentNumber()));
		entity.setOrderNumber(orderNumberBuffer.toString());
		
		billNumberBuffer.append(NumberUtils.addZero(6, bizOutpatientSourceEntity.getStaffId()));
		billNumberBuffer.append(dateString);
		billNumberBuffer.append(NumberUtils.addZero(3, bizOutpatientSourceEntity.getCurrentNumber()));
		entity.setPaymentNumber(billNumberBuffer.toString());
		
		orderDao.insert(entity);
		/**在交易流水表中新增记录**/
		BizOutpatientPaybillEntity billEntity = new BizOutpatientPaybillEntity();
		billEntity.setOrderNumber(orderNumberBuffer.toString());
		billEntity.setPaymentNumber(billNumberBuffer.toString());
		billEntity.setCreateTime(createTime);
		billEntity.setDealTime(createTime);
		billEntity.setTranState("10");
		billEntity.setTranAmount(bizOutpatientSourceEntity.getRegistrationFee());
		billDao.insert(billEntity);
		
		return orderNumberBuffer.toString();
	}

	@Override
	public BizOutpatientSourceVo getSourceDetail(Integer id) {
		BizOutpatientSourceVo sourceDetail = sourceDao.getSourceDetail(id);
		return sourceDetail;
	}

	@Override
	public List<BizOutpatientOrderVo> getOrderList(BizOutpatientOrderVo vo) {
		return orderDao.getOrderList(vo);
	}

	@Override
	public BizOutpatientOrderVo getOrderDetail(Integer id) {
		return orderDao.getOrderDetail(id);
	}

	@Override
	@Transactional
	public String cancelOrder(BizOutpatientOrderVo vo) {
		if (new Date().getTime() > vo.getClinicDate().getTime()) {
			return "overdue";
		}
		BizOutpatientSourceEntity bizOutpatientSourceEntity = sourceDao.get(String.valueOf(vo.getOutpatientSourceId()));
		/**
		 * 退号，并发控制
		 */
		int flag = 0;
		while(flag == 0){
			bizOutpatientSourceEntity.setRemainderNumber(bizOutpatientSourceEntity.getRemainderNumber() + 1);
			bizOutpatientSourceEntity.setCurrentNumber(bizOutpatientSourceEntity.getCurrentNumber() - 1);
			int updateNum = sourceDao.update(bizOutpatientSourceEntity);
			if (updateNum == 1) {   //修改行数为1，说明版本号对应，中间无其他人修改
				flag=1;
			}
		}
		/**修改预约表中状态**/
		orderDao.updateOrderStatus(vo.getId(), BusinessConstants.PAY_STATUS_CANCLED);
		return "success";
	}
     /**根据科室和医生，查询未来2周的排班信息*/
	public List<BizOutpatientSourceVo> getScheDualInfoByDeptId(Integer staffId,Integer deptId,Integer orgId){
		BizOutpatientSourceVo vo = new BizOutpatientSourceVo();
		vo.setStaffId(staffId);
		Calendar dateStart = Calendar.getInstance();  
		dateStart.setTime(new Date());
		dateStart.set(Calendar.HOUR_OF_DAY, 0);  
		dateStart.set(Calendar.MINUTE, 0);  
		dateStart.set(Calendar.SECOND, 0);  
		dateStart.set(Calendar.MILLISECOND, 0);
		Long sdate=dateStart.getTime().getTime();
		Date date = new Date(sdate);
		vo.setQueryStartTime(date);
		vo.setQueryEndDate(DateUtils.getWeekLaterDate(date, 2));
		vo.setDeptId(deptId);
		vo.setOrgId(orgId);
		List<BizOutpatientSourceVo> outpatientSourceList = sourceDao.getOutpatientSourceList(vo);
		return outpatientSourceList;
		
	}
}
