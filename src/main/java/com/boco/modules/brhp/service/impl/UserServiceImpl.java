package com.boco.modules.brhp.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.eclipse.jetty.util.security.Credential.MD5;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boco.common.constants.BusinessConstants;
import com.boco.common.utils.StringUtils;
import com.boco.modules.brhp.dao.user.UserAuthenticationDao;
import com.boco.modules.brhp.dao.user.UserDao;
import com.boco.modules.brhp.dao.user.UserPatientDao;
import com.boco.modules.brhp.model.user.UserAuthenticationEntity;
import com.boco.modules.brhp.model.user.UserEntity;
import com.boco.modules.brhp.model.user.UserPatientEntity;
import com.boco.modules.brhp.service.UserService;
import com.boco.modules.brhp.vo.UserPatientVo;
import com.boco.modules.brhp.vo.UserVo;

@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	UserDao userDao;
	@Resource
	UserAuthenticationDao userAuthenticationDao;
	@Resource
	UserPatientDao patientDao;

	@Override
	@Transactional
	public Integer addUser(UserEntity user,UserAuthenticationEntity userAuthentication) {
		/**查询用户信息有无重复**/
		
		/**设置用户初始属性**/
		String uid = UUID.randomUUID().toString();
		Date now = new Date();
		
		user.setUid(uid);	//设置uid为16位uuid
		user.setNickCode(StringUtils.toMd5(user.getNickname()));	//设置昵称编码
		user.setPassword(StringUtils.toMd5(user.getPassword()));	//设置密码MD5加密存储
		user.setStatus(BusinessConstants.BAN_FLAG_NORMAL);	//设置禁用状态为未禁用
		user.setVerificationFlag(BusinessConstants.VERIFICATION_FLAG_YES);	//设置实名认证状态为默认已实名
		user.setDelFlag(BusinessConstants.DEL_FLAG_NO);	//设置逻辑删除标识为未删除
		user.setCreateTime(now);
		user.setUpdateTime(now);
		
		userAuthentication.setUid(uid);
		
		/**调用dao存储用户**/
		int returnInt = userDao.insert(user);	//存储用户对象
		userAuthenticationDao.insert(userAuthentication);	//存储用户实名对象
		return returnInt;
	}

	@Override
	public List<UserEntity> getSingleList() {
		return userDao.getUserList();
	}

	@Override
	public UserVo getUser(UserVo vo) {
		UserVo user = userDao.getUser(vo);
		if (user != null && user.getMobile() != null
				&& user.getIdCard() != null && user.getMobile().length() == 11
				&& user.getIdCard().length() == 18) {
			user.setMobileCode(user.getMobile().substring(0, 3) + "****"
					+ user.getMobile().substring(7, 11));
			user.setIdCardCode(user.getIdCard().substring(0, 4) + "**********"
					+ user.getIdCard().substring(14, 18));
		}
		return user;
	}

	@Override
	public Integer updateUserBasicInfo(UserEntity entity) {
		entity.setUpdateTime(new Date());
		return userDao.update(entity);
	}

	@Override
	public List<UserPatientVo> getPatientList(UserPatientVo vo) {
		return patientDao.getPatientList(vo);
	}

	@Override
	@Transactional
	public Integer addPatient(UserPatientEntity entity) {
		Date now = new Date();
		entity.setCreateTime(now);
		entity.setUpdateTime(now);
		entity.setAuthenticationState("1");
		if ("1".equals(entity.getDefaultFlag())) {
			patientDao.resetDefaultFlag(entity.getUid());
		}
		return patientDao.insert(entity);
	}

	@Override
	public Integer delete(Integer patientId) {
		return patientDao.delete(String.valueOf(patientId));
	}

	@Override
	public Integer changePassword(String uid, String newPassword) {
		String md5 = StringUtils.toMd5(newPassword);
		return userDao.changePassword(uid, md5);
	}

	@Override
	@Transactional
	public Integer updateUser(UserEntity user,
			UserAuthenticationEntity userAuthentication) {
		user.setUpdateTime(new Date());
		user.setNickCode(StringUtils.toMd5(user.getNickname()));
		userDao.update(user);
		userAuthenticationDao.update(userAuthentication);
		return null;
	}

	@Override
	public void updateById(Integer id,String uid) {
		
		patientDao.resetDefaultFlag(uid);
		patientDao.updateById(id);
		
	}


	

	

}
