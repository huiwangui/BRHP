/*package com.boco.modules.boco;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.builder.CompareToBuilder;
import org.junit.Test;

import com.boco.common.JunitTestCase;
import com.boco.common.persistence.Page;
import com.boco.common.utils.ComparatorBizOutpatientSourceVo;
import com.boco.common.utils.DateUtils;
import com.boco.common.utils.JsonUtils;
import com.boco.common.utils.ListUtils;
import com.boco.common.utils.NumberUtils;
import com.boco.modules.brhp.dao.user.UserDao;
import com.boco.modules.brhp.model.business.outpatient.BizOutpatientOrderEntity;
import com.boco.modules.brhp.model.user.UserAuthenticationEntity;
import com.boco.modules.brhp.model.user.UserEntity;
import com.boco.modules.brhp.service.BizOutpatientService;
import com.boco.modules.brhp.service.DeptHospitalService;
import com.boco.modules.brhp.service.OrgHospitalService;
import com.boco.modules.brhp.service.StaffService;
import com.boco.modules.brhp.service.UserService;
import com.boco.modules.brhp.vo.BizOutpatientSourceVo;
import com.boco.modules.brhp.vo.DeptHospitalVo;
import com.boco.modules.brhp.vo.OrgHospitalVo;
import com.boco.modules.brhp.vo.StaffVo;
import com.boco.modules.brhp.vo.UserVo;
import com.boco.sp.utils.BeanToMapUtil;

public class UserTest extends JunitTestCase{
	@Resource
	UserService service;
	@Resource
	OrgHospitalService hospService;
	@Resource
	DeptHospitalService deptHospService;
	@Resource
	StaffService staffService;
	@Resource
	BizOutpatientService outpatientService;
	
	
	@Test
	public void daoTest() throws IllegalAccessException, InvocationTargetException, IntrospectionException{
		UserVo vo = new UserVo();
		vo.setUid("87cd6c64-103b-46b8-8ad5-1477cd390db8");
		vo.setGetByUidFlag("1");
		System.out.println(JsonUtils.getJsonFormat(service.getUser(vo )));
	}
	@Test
	public void dao2Test() throws IllegalAccessException, InvocationTargetException, IntrospectionException{
		BizOutpatientOrderEntity entity = new BizOutpatientOrderEntity();
		entity.setOutpatientSourceId(3);
		outpatientService.outpatientOrder(entity );
	}
	
	@Test
	public void sortTest(){
		SimpleDateFormat smf = new SimpleDateFormat("MM/dd");
		BizOutpatientSourceVo vo0 = new BizOutpatientSourceVo();
		vo0.setClinicDate(new Date(1481212800000L));
		vo0.setClinicDateStr(smf.format(vo0.getClinicDate()));
		
		BizOutpatientSourceVo vo1 = new BizOutpatientSourceVo();
		vo1.setClinicDate(new Date(1481299200000L));
		vo1.setClinicDateStr(smf.format(vo1.getClinicDate()));
		
		BizOutpatientSourceVo vo2 = new BizOutpatientSourceVo();
		vo2.setClinicDate(new Date(1481385600000L));
		vo2.setClinicDateStr(smf.format(vo2.getClinicDate()));
		
		BizOutpatientSourceVo vo3 = new BizOutpatientSourceVo();
		vo3.setClinicDate(new Date(1481472000000L));
		vo3.setClinicDateStr(smf.format(vo3.getClinicDate()));
		
		BizOutpatientSourceVo vo4 = new BizOutpatientSourceVo();
		vo4.setClinicDate(new Date(1481558400000L));
		vo4.setClinicDateStr(smf.format(vo4.getClinicDate()));
		
		List<BizOutpatientSourceVo> list = new ArrayList<BizOutpatientSourceVo>();
		list.add(vo4);
		list.add(vo3);
		list.add(vo0);
		list.add(vo2);
		list.add(vo1);
		
		ComparatorBizOutpatientSourceVo com = new ComparatorBizOutpatientSourceVo();
		 Collections.sort(list, com);
		 System.out.println(JsonUtils.getJsonFormat(list));
		
	}
	
	@Test
	public void insertTest(){
		UserEntity user = new UserEntity();
		user.setNickname("JackSlowFuck");
		user.setPassword("1234");
		user.setMobile("13811011202");
		user.setEmail("fuck@sina.com");
		
		UserAuthenticationEntity userAuthenticationEntity = new UserAuthenticationEntity();
		userAuthenticationEntity.setName("李日天");
		userAuthenticationEntity.setSex("1");
		userAuthenticationEntity.setCredentialsType("10");
		userAuthenticationEntity.setIdCard("510710198305189632");
		userAuthenticationEntity.setDateOfBirth(new Date(422035200000L));
		
		service.addUser(user, userAuthenticationEntity);
	}
}
*/