package com.boco.modules.brhp.service;

import java.util.List;

import com.boco.modules.brhp.model.user.UserAuthenticationEntity;
import com.boco.modules.brhp.model.user.UserEntity;
import com.boco.modules.brhp.model.user.UserPatientEntity;
import com.boco.modules.brhp.vo.UserPatientVo;
import com.boco.modules.brhp.vo.UserVo;

public interface UserService {
	/**
	 * 
	 * addUser:(新增用户). <br/>
	 * @author q
	 * @param user
	 * @return
	 */
	public Integer addUser(UserEntity user, UserAuthenticationEntity userAuthentication);
	
	/**
	 * 
	 * getSingleList:(获取用户单表列表). <br/>
	 * @author q
	 * @return
	 */
	public List<UserEntity> getSingleList();
	
	/**
	 * 
	 * getUser:(获取用户，用于登录验证、字段判断重复等). <br/>
	 * @author q
	 * @param vo
	 * @return
	 */
	public UserVo getUser(UserVo vo);
	/**
	 * 
	 * updateUserBasicInfo:(修改用户基本信息). <br/>
	 * @author q
	 * @param entity
	 */
	public Integer updateUserBasicInfo(UserEntity entity);
	/**
	 * 
	 * getPatientList:(获取某人的就诊人列表). <br/>
	 * @author q
	 * @param entity
	 * @return
	 */
	public List<UserPatientVo> getPatientList(UserPatientVo vo);
	/**
	 * 
	 * addPatient:(新增就诊人). <br/>
	 * @author q
	 * @param entity
	 * @return
	 */
	public Integer addPatient(UserPatientEntity entity);
	/**
	 * 
	 * delete:(删除就诊人). <br/>
	 * @author q
	 * @return
	 */
	public Integer delete(Integer patientId);
	/**
	 * 
	 * changePassword:(修改密码). <br/>
	 * @author q
	 * @param uid
	 * @param newPassword
	 * @return
	 */
	public Integer changePassword(String uid,String newPassword);
	/**
	 * 
	 * addUser:(修改用户). <br/>
	 * @author q
	 * @param user
	 * @return
	 */
	public Integer updateUser(UserEntity user, UserAuthenticationEntity userAuthentication);
	/**
	 * 
	 * updateById:(修改就诊人为默认). <br/>
	 * @author j
	 * @param id
	 * @return
	 */
	void updateById(Integer id,String Uid);
}
