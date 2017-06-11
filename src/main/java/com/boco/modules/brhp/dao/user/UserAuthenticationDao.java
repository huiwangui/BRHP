package com.boco.modules.brhp.dao.user;

import com.boco.common.annotation.MyBatisDao;
import com.boco.common.persistence.CrudDao;
import com.boco.modules.brhp.model.user.UserAuthenticationEntity;

@MyBatisDao
public interface UserAuthenticationDao  extends CrudDao<UserAuthenticationEntity>{

}
