package com.boco.modules.brhp.web.user;

import java.io.File;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.boco.common.constants.BusinessConstants;
import com.boco.common.enums.ApiStatusEnum;
import com.boco.common.json.BaseJsonVo;
import com.boco.common.sms.SmsVo;
import com.boco.common.utils.FTPUtils;
import com.boco.common.utils.JsonUtils;
import com.boco.common.utils.MatcherUtiles;
import com.boco.common.utils.StringUtils;
import com.boco.modules.brhp.model.user.UserAuthenticationEntity;
import com.boco.modules.brhp.model.user.UserEntity;
import com.boco.modules.brhp.model.user.UserPatientEntity;
import com.boco.modules.brhp.service.UserService;
import com.boco.modules.brhp.vo.UserPatientVo;
import com.boco.modules.brhp.vo.UserVo;
import com.boco.sp.external.annotation.ControllerLog;

@Controller
@RequestMapping(value = "/user", produces = "application/json;charset=UTF-8")
public class UserController {
	public static Map<String,Object> mapZ=new HashMap<String,Object>();
	@Resource
	UserService userService;

	@RequestMapping(value = "/goLogin", method = RequestMethod.GET)
	public String goLogin(HttpServletRequest request, Model model,
			String beforeLoginUrl) {
	 String url="";
	 Map<String ,String> map=request.getParameterMap();
	 for (Map.Entry<String,String> entry:map.entrySet()) {
		if(!entry.getKey().equals("beforeLoginUrl")){
	     url='&'+entry.getKey()+'='+request.getParameter(entry.getKey());
	       url=url+url;
		}
	 }
	 beforeLoginUrl=beforeLoginUrl+url;
		/**使用cookie实现记住密码**/
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				if ("userName".equals(cookies[i].getName())) {
					String userName = cookies[i].getValue();
					model.addAttribute("userName", userName);
				} else if ("password".equals(cookies[i].getName())) {
					String password = cookies[i].getValue();
					model.addAttribute("password", password);
				}
			}
		}
		/**把登录之前的url写入作用域**/
		model.addAttribute("beforeLoginUrl", beforeLoginUrl);
		System.out.println("beforeLoginUrl---------------------"+beforeLoginUrl);
		return "/user/login";
	}
	@ControllerLog(description="健康门户-系统管理-登录")
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	@ResponseBody
	public String userLogin(HttpServletRequest request, Model model,
			String userName, String password, String ifRememberPsw,HttpServletResponse response) {
		UserVo vo = new UserVo();
		if (MatcherUtiles.mobileMach(userName)) {
			vo.setMobile(userName);
		}else {
			vo.setNickCode(StringUtils.toMd5(userName));
		}
		vo.setPassword(StringUtils.toMd5(password));
		UserVo user = userService.getUser(vo);
		if (user != null) {
			/**把登录user写入session**/
			request.getSession().setAttribute("userInSession", user);
			/**如果勾选了记住密码，则把用户名和密码写入cookie**/
			if ("1".equals(ifRememberPsw)) {
				Cookie namecookie = new Cookie("userName", userName);
				Cookie pswcookie = new Cookie("password", password);
				response.addCookie(namecookie);
				response.addCookie(pswcookie);
			}
			return JsonUtils.getJson(BaseJsonVo.success(null));
		}else {
			return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.LOGIN_ERROR.getKey(), ApiStatusEnum.LOGIN_ERROR.getValue()));
		}
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(HttpServletRequest request, Model model,
			String beforeLoginUrl) {
		return "/user/register";
	}
	
	@RequestMapping(value = "/registerCheck", method = RequestMethod.GET)
	@ResponseBody
	public String registerCheck(HttpServletRequest request, Model model,
			UserVo userVo) {
		if (userVo.getIdCard() != null && !"".equals(userVo.getIdCard())) {
			UserVo user = userService.getUser(userVo);
			if (user != null) {
				return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.IDCARD_EXISTS.getKey(), ApiStatusEnum.IDCARD_EXISTS.getValue()));
			}
		}else if (userVo.getMobile() != null && !"".equals(userVo.getMobile())) {
			UserVo user = userService.getUser(userVo);
			if (user != null) {
				return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.PHONE_EXISTS.getKey(), ApiStatusEnum.PHONE_EXISTS.getValue()));
			}
		}else if(userVo.getNickname() != null && !"".equals(userVo.getNickname())){
			userVo.setNickCode(StringUtils.toMd5(userVo.getNickname()));
			UserVo user = userService.getUser(userVo);
			if (user != null) {
				return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.NICKNAME_EXISTS.getKey(), ApiStatusEnum.NICKNAME_EXISTS.getValue()));
			}
		}
		return JsonUtils.getJson(BaseJsonVo.success(null));
	}
	@ControllerLog(description="健康门户-系统管理-注册")
	@RequestMapping(value = "/registerSave", method = RequestMethod.POST)
	@ResponseBody
	public String registerSave(HttpServletRequest request, Model model,
			UserEntity user,UserAuthenticationEntity userAuthen) {
		try {
			userService.addUser(user, userAuthen);
			return JsonUtils.getJson(BaseJsonVo.success(null));
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.ERROR_CODE.getKey(), ApiStatusEnum.ERROR_CODE.getValue()));
		}
		
	}
	
	@RequestMapping(value = "/personalInfo", method = RequestMethod.GET)
	public String personalInfo(HttpServletRequest request, Model model) {
		return "/user/personalInfo";
	}
	
	@RequestMapping(value = "/uploadImg", method = RequestMethod.POST)
	@ResponseBody
	public String uploadImg(HttpServletRequest request, Model model,
			@RequestParam("file")MultipartFile file) throws Exception{
		/*if (file != null && !"".equals(file.getName())) {
			String path = request.getSession().getServletContext()
					.getRealPath("upload"+System.getProperty("file.separator")+"img")
					+ System.getProperty("file.separator");
			
			// 生成jpeg图片
			String headSuffix = StringUtils.getSuffix(file.getOriginalFilename()); // 获取后缀名
			String signImgHeadName = UUID.randomUUID().toString()
					.substring(0, 8)
					+ "." + headSuffix; // 重命名为8位随机数
			String localPathHead = path + signImgHeadName;
			File headPathHead = new File(path);// 获取文件夹路径
			if (!headPathHead.exists()) {// 判断文件夹是否创建，没有创建则创建新文件夹
				headPathHead.mkdirs();
			}
			// 压缩成100*100  并写入硬盘
			Thumbnails.of(file.getInputStream())   
		        .size(100, 100)   
		        .keepAspectRatio(false)   
	   
		
		/**
		 * 上传图片开始
		 */
		// 从session获取用户详细对象
		UserVo vo = (UserVo)request.getSession().getAttribute("userInSession");
		// 准备用于修改的userEntity
		UserEntity entity = new UserEntity();
		try {
			if (file != null && file.getOriginalFilename() != null && StringUtils.isNotEmpty(file.getOriginalFilename())) {
				
				InputStream is = file.getInputStream();
				
				byte[] bs = new byte[1024];  
		        int len;
				// 生成jpeg图片
				String headSuffix = StringUtils.getSuffix(file.getOriginalFilename()); // 获取后缀名
				String signfileHeadName = UUID.randomUUID().toString()
						.substring(0, 8)
						+ "." + headSuffix; // 重命名为8位随机数
				
				//复制文件到指定路径 
				File saveFile = new File((request.getContextPath() + "/upload/img/" + signfileHeadName).substring(9)); 
				FileUtils.copyInputStreamToFile(is, saveFile); 
		        //上传文件到服务器 
				FTPUtils.upload(saveFile, "/upload/img/"); 
		        
		        entity.setImg((request.getContextPath() + "/upload/img/"
						+ signfileHeadName).substring(5));
		        vo.setImg((request.getContextPath() + "/upload/img/"
						+ signfileHeadName).substring(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

			
			entity.setUid(vo.getUid());
			entity.setNickname(vo.getNickname());
			entity.setNickCode(vo.getNickCode());
			entity.setPassword(vo.getPassword());
			entity.setMobile(vo.getMobile());
			entity.setEmail(vo.getEmail());
			entity.setUpdateId(vo.getUid());
			userService.updateUserBasicInfo(entity);
			//把修改之后的对象重新写入session
			request.getSession().setAttribute("userInSession", vo);
		return JsonUtils.getJson(BaseJsonVo.success(null)); 
	}
	
	@RequestMapping(value = "/userPatients", method = RequestMethod.GET)
	public String userPatients(HttpServletRequest request, Model model) {
		//return "/user/userPatients";
		return "/user/personManage";
	}
	
	@RequestMapping(value = "/userPatientsData", method = RequestMethod.GET)
	@ResponseBody
	public String userPatientsData(HttpServletRequest request, Model model) {
		UserVo vo = (UserVo)request.getSession().getAttribute("userInSession");
		UserPatientVo patientVo = new UserPatientVo();
		patientVo.setUid(vo.getUid());
		List<UserPatientVo> patientList = userService.getPatientList(patientVo);
		return JsonUtils.getJsonFormat(patientList);
	}
	@ControllerLog(description="健康门户-个人中心-保存就诊人")
	@RequestMapping(value = "/patientSave", method = RequestMethod.POST)
	@ResponseBody
	public String patientSave(HttpServletRequest request, Model model,UserPatientVo vo) {
		UserVo userVo = (UserVo)request.getSession().getAttribute("userInSession");
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-DD");
		UserPatientEntity entity = new UserPatientEntity();
		entity.setUid(userVo.getUid());
		entity.setPatientName(vo.getPatientName());
		entity.setPatientIdCard(vo.getPatientIdCard());
		entity.setPatientMobile(vo.getPatientMobile());
		entity.setPatientSex(vo.getPatientSex());
		entity.setDefaultFlag(vo.getDefaultFlag());
		try {
			entity.setPatientDateOfBirth(fmt.parse(vo.getDateOfBirthStr()));
		} catch (ParseException e) {
			e.printStackTrace();
			return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.DATE_FORMART_ERROR.getKey(), ApiStatusEnum.DATE_FORMART_ERROR.getValue()));
		}
		userService.addPatient(entity);
		return JsonUtils.getJson(BaseJsonVo.success(null));
	}
	@ControllerLog(description="健康门户-个人中心-删除就诊人")
	@RequestMapping(value = "/patientDelete", method = RequestMethod.POST)
	@ResponseBody
	public String patientDelete(HttpServletRequest request, Model model,Integer id) {
		userService.delete(id);
		return JsonUtils.getJson(BaseJsonVo.success(null));
	}
	@RequestMapping(value = "/patientDef", method = RequestMethod.POST)
	@ResponseBody
	public String patientDef(HttpServletRequest request, Model model,Integer id) {
		UserVo userVo = (UserVo)request.getSession().getAttribute("userInSession");
		String uid=userVo.getUid();
		userService.updateById(id,uid);
		return JsonUtils.getJson(BaseJsonVo.success(null));
	}
	
	@RequestMapping(value = "/userOrders", method = RequestMethod.GET)
	public String userOrders(HttpServletRequest request, Model model) {
		//return "/user/userOrders";
		return "/user/personOrder";
	}
	
	@RequestMapping(value = "/userSafe", method = RequestMethod.GET)
	public String userSafe(HttpServletRequest request, Model model) {
		return "/user/personSafe";
	}
	
	@ControllerLog(description="健康门户-个人中心-修改密码")
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	@ResponseBody
	public String changePassword(HttpServletRequest request, Model model,String newPassword) {
		UserVo userVo = (UserVo)request.getSession().getAttribute("userInSession");
		userService.changePassword(userVo.getUid(), newPassword);
		request.getSession().removeAttribute("userInSession");
		return JsonUtils.getJson(BaseJsonVo.success(null));
	}
	
	@RequestMapping(value = "/changePersonInfo", method = RequestMethod.GET)
	public String changePersonInfo(HttpServletRequest request, Model model) {
		//return "/user/changePersonInfo";
		return "/user/personMsgChange";
	}
	
	@RequestMapping(value = "/updateCheck", method = RequestMethod.GET)
	@ResponseBody
	public String updateCheck(HttpServletRequest request, Model model,
			UserVo userVo) {
		UserVo voInSession = (UserVo)request.getSession().getAttribute("userInSession");
		userVo.setUid(voInSession.getUid());
		userVo.setGetByUidFlag("0");
		
		
		
		if (userVo.getIdCard() != null && !"".equals(userVo.getIdCard())) {
			UserVo user = userService.getUser(userVo);
			if (user != null) {
				return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.IDCARD_EXISTS.getKey(), ApiStatusEnum.IDCARD_EXISTS.getValue()));
			}
		}else if (userVo.getMobile() != null && !"".equals(userVo.getMobile())) {
			UserVo user = userService.getUser(userVo);
			if (user != null) {
				return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.PHONE_EXISTS.getKey(), ApiStatusEnum.PHONE_EXISTS.getValue()));
			}
		}else if(userVo.getNickname() != null && !"".equals(userVo.getNickname())){
			userVo.setNickCode(StringUtils.toMd5(userVo.getNickname()));
			UserVo user = userService.getUser(userVo);
			if (user != null) {
				return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.NICKNAME_EXISTS.getKey(), ApiStatusEnum.NICKNAME_EXISTS.getValue()));
			}
		}else if(userVo.getIdCard() != null && !"".equals(userVo.getIdCard())) {
			UserVo user = userService.getUser(userVo);
			if (user != null) {
				return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.EMAIL_EXISTS.getKey(), ApiStatusEnum.EMAIL_EXISTS.getValue()));
			}
		}
		return JsonUtils.getJson(BaseJsonVo.success(null));
	}
	@ControllerLog(description="健康门户-个人中心-修改个人信息")
	@RequestMapping(value = "/updateSave", method = RequestMethod.POST)
	@ResponseBody
	public String updateSave(HttpServletRequest request, Model model,
			UserEntity user,UserAuthenticationEntity userAuthen,String dateOfBirthStr) {
		UserVo voInSession = (UserVo)request.getSession().getAttribute("userInSession");
		user.setUid(voInSession.getUid());
		user.setImg(voInSession.getImg());
		user.setEmail(voInSession.getEmail());
		user.setUpdateId(voInSession.getUid());
		userAuthen.setUid(voInSession.getUid());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-DD");
		try {
			userAuthen.setDateOfBirth(format.parse(dateOfBirthStr));
			userService.updateUser(user, userAuthen);			
			UserVo newUserInfo = new UserVo();
			newUserInfo.setUid(voInSession.getUid());
			newUserInfo.setGetByUidFlag("1");
			newUserInfo = userService.getUser(newUserInfo);
			request.getSession().setAttribute("userInSession", newUserInfo);
			
			return JsonUtils.getJson(BaseJsonVo.success(null));
		} catch (Exception e) {
			e.printStackTrace();
			return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.ERROR_CODE.getKey(), ApiStatusEnum.ERROR_CODE.getValue()));
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		request.getSession().removeAttribute("userInSession");
		return "/user/login";
	}
	
	
	@RequestMapping(value="/smsCode",method=RequestMethod.GET)
	@ResponseBody
	public String smscode(String mobile){
	   SmsVo smsvo=new SmsVo(mobile);
	   String smsMsg=smsvo.sendSmsMsg();
	   //号码放入一个全局变量
	   Map<String,Object> map=new HashMap<String,Object>();
	   map.put("code", smsvo.getSmsCode());
	   map.put("time", System.currentTimeMillis());
	   mapZ.put(mobile, map);
	   if( BusinessConstants.FAIL.equals(smsMsg)){
		  return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.FAIL.getKey(), ApiStatusEnum.FAIL.getValue()));
	   }
	      return JsonUtils.getJson(BaseJsonVo.success(smsvo.sendSmsMsg()));
	}
	/**验证验证码*/
	@RequestMapping(value="/valiCode",method=RequestMethod.GET)
	@ResponseBody
	public String smsvali(String code,String mobile){
		//时间验证 过时时间从参数中获取 暂时定为5分钟
		Map map=(Map) mapZ.get(mobile);
		String oldCode=(String) map.get("code");
		Long oldTime=(Long) map.get("time");
		Long nowTime=System.currentTimeMillis();
		Long s=(nowTime-oldTime)/(1000 * 60);
		if(code.equals(oldCode)&&s<=5){
			System.out.println("验证成功");
		      return JsonUtils.getJson(BaseJsonVo.success(null));
		}else{
			  return JsonUtils.getJson(BaseJsonVo.empty(ApiStatusEnum.CODE_ERROR.getKey(), ApiStatusEnum.CODE_ERROR.getValue()));
		}
		
	}
}
