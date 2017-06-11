package com.boco.modules.brhp.dao.user;

import java.util.List;

import com.boco.common.annotation.MyBatisDao;
import com.boco.common.persistence.CrudDao;
import com.boco.modules.brhp.model.user.UserEntity;
import com.boco.modules.brhp.vo.UserVo;

@MyBatisDao
public interface UserDao extends CrudDao<UserEntity>{
	/**
	 * 
	 * getUserList:(获取用户列表). <br/>
	 * @author q
	 * @return
	 */
	public List<UserEntity> getUserList();
	
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
	 * changePassword:(修改密码). <br/>
	 * @param uid
	 * @param newPassword
	 * @return
	 */
	public Integer changePassword(String uid,String newPassword);
}
