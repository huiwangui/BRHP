package com.boco.modules.brhp.log;

import java.lang.reflect.Method;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.boco.common.constants.BusinessConstants;
import com.boco.common.model.CommonResult;
import com.boco.modules.brhp.vo.UserVo;
import com.boco.sp.external.annotation.ControllerLog;
import com.boco.sp.external.model.LogManagement;
import com.boco.sp.external.service.LogManagementService;

/**
 * Tilte: SystemLogAspect 
 * Description:
 * @author h
 * @date  2017年4月24日下午3:44:39
 * @version 1.0
 *  
 */
@Aspect
@Component
public class SystemLogAspect {
	/**
     * 日志
     */
    private static final Logger logger = LoggerFactory.getLogger(SystemLogAspect.class);
    /**
     * 日志管理暴露接口
     */
    @Resource
    private LogManagementService logManagmentService;
	 

    //service 注入
    @Pointcut("@annotation(com.boco.sp.external.annotation.ServiceLog)")
    public void serviceAspect() {
    }

    //controller 层注入
    @Pointcut("@annotation(com.boco.sp.external.annotation.ControllerLog)")
    public void controllerAspect() {
    }
     /**
     * 环绕通知
     * @param joinPoint
     * @return
     */
    @After(value = "controllerAspect()")
    public Object doAfter(JoinPoint joinPoint) {
    	System.out.println("log begin.........");
        //获取操作时间
        Date optionTime = new Date();
        //得到request
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //获取session，由于获取用户的的相关信息
        HttpSession session = request.getSession();
        //实例化日志管理实体类
        LogManagement log = new LogManagement();
       // Map orgInfo = null;
        
        //获取方法内容
        String operatedContent = "";
        //获取操作方法或菜单
        String opOperatedFuntionRoMenu = "";
      
        //获取用户名及用户名所在机构信息
        UserVo entity = (UserVo) session.getAttribute("userInSession");
        if(entity==null){
        	return null;
        }
        //异常描述，当异常代码等于小写字母n时（exceptionCode=='n'），默认为空字符
        String exceptionDescribe = "";
        //异常代码，没有异常时请将此变量赋值为小写字母n,有异常时赋值为小写字母y
        String exceptionCode = "n";
        //得到用户名    
        String  userName = entity.getNickname();      
        //用户id
        if (userName == null) {
        	exceptionCode = "y";
            exceptionDescribe += " can not get user name ！<br>";//每个可能的异常描述后加的<br>标签，为了在页面显示时换行
        }
       /* if (orgInfo == null) {
            exceptionCode = "y";
            exceptionDescribe += " can not get org code ! <br>";
        } else {
            //获取机构代码
        	log.setUserOwnedOrgCode(entity.getOrgCode());
            //获取机构名称
           // log.setUserOwnedOrgName(orgInfo.get("org.name") + "");
        	 log.setUserOwnedOrgName(entity.getOrgName());
        }*/
        try {
            //获取方法内容
            operatedContent=(joinPoint.getTarget().getClass().getName() + "/" + joinPoint.getSignature().getName() + "()");
            //获取操作方法或菜单
            opOperatedFuntionRoMenu=getControllerMethodDescription(joinPoint);
        } catch (Exception e) {
            exceptionCode= "y";
            exceptionCode += "can not get operatedContent!<br>";
            logger.error("异常信息:{}", e);
        }
        String ip = request.getRemoteAddr();//获取Ip
        System.out.println(ip+"++++++++++++");
        String uri = request.getRequestURI();//获取uri
        String method = request.getMethod();//获取请求类型（post、get、put...）
        //方法执行开始时间
        long startTime = System.currentTimeMillis();
        //执行方法
        Object object = null;
        try {
            object = joinPoint.getTarget();
        } catch (Throwable throwable) {//操作方法异常
            exceptionCode = "y";
            exceptionDescribe += throwable+"<br>";
        }
        //方法执行结束时间
        long endTime = System.currentTimeMillis();
        //方法执行时间
        String runTime = String .valueOf(endTime-startTime);
        //日志实体类赋值
        log.setOperatedFuntionRoMenu(opOperatedFuntionRoMenu);
        log.setOperatedContent(operatedContent);
        log.setRunTime(runTime);
        log.setOperationTime(optionTime);
        log.setUri(uri);
        log.setSubmitType(method);
        log.setUserIp(ip);
        log.setOperationUser(userName);
        log.setOperationExceptionCode(exceptionCode);
        log.setOperationExceptionDescribe(exceptionDescribe);
        //删除标记（0表示正常数据，1表示逻辑删除数据 ；默认为0:）
        log.setDeleteFlag(0);
        //获取系统的名字和ID
        log.setSystemName("健康门户");
        log.setPkSysSystemId(3340);
       // log.setPkSysSystemId(Integer.parseInt(entity.getSystemId()));
        try {
            //调用insertLogInfo（）方法，保存日志信息
        	 CommonResult commonResult = logManagmentService.insertLogInfo(log);
            //测试用
          
        } catch (Exception e) {
            logger.error("异常信息:{}", e);
        }
        return object;
    }
    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     *
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception
     */
    public static String getControllerMethodDescription(JoinPoint joinPoint) throws Exception {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        String description = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    description = method.getAnnotation(ControllerLog.class).description();
                    break;
                }
            }
        }
        return description;
    }
}
