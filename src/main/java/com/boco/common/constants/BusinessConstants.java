package com.boco.common.constants;

public class BusinessConstants {
	/**
	 * 通用
	 */
	public final static String SUCCESS = "success"; //操作成功
	public final static String FAIL = "fail"; //操作失败
	/**
	 * 逻辑删除标识
	 */
	public final static String DEL_FLAG_YES = "1"; //已删除
	public final static String DEL_FLAG_NO = "0"; //未删除
	
	/**
	 * 禁用标识
	 */
	public final static String BAN_FLAG_NORMAL = "1";	//正常
	public final static String BAN_FLAG_BAN = "2";	//禁用
	
	/**
	 * 实名认证标识
	 */
	public final static String VERIFICATION_FLAG_NO = "0";	//未实名认证
	public final static String VERIFICATION_FLAG_YES = "1";	//已实名认证
	
	/**
	 * 短信验证码
	 */
	public final static Integer SMS_CODE_BUSI = 1001;

	/**
	 * 优惠劵营销短信
	 */
	public final static Integer SMS_CODE_BUSI_YES = 1002;

	/**
	 * 常量NUM
	 */
	public final static String ROW_NUM = "rowNum";

	/**
	 * 短信验证 超时时间
	 */
	public final static String SMS_CODE_TIMEOUT = "sms_code_timeout";

	/**
	 * 云片 短信 公司
	 */
	public final static String YP_SMS_COMPANY = "yp_sms_company";

	/**
	 * 短信模板
	 */
	public final static String YP_SMS_TEMPLATE = "yp_sms_template";

	/**
	 * 手机号
	 */
	public final static String APPSTORE_MOBILE = "appstore_mobile";

	/**
	 * 验证码
	 */
	public final static String APPSTORE_CODE = "appstore_code";
	
	/**
	 * 医生登陆url（key值）
	 */
	public final static String RESTFUL_DOCTOR_LOGIN_URL = "doctor_login_url";
	
	/**
	 * 获取医生信息url（key值）
	 */
	public final static String RESTFUL_DOCINFO_URL = "doctor_info_url";
	
	/**
	 * 评论对象：1为对医院，2为对医生
	 */
	public final static String COMMONT_OBJTYPE_HOSP = "1";
	public final static String COMMONT_OBJTYPE_DOCTOR = "2";
	
	/**
	 * 评价定义：好评、中评、差评对应星数
	 */
	public final static String ALL_EVALUATE = "0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5";
	public final static String GOOD_EVALUATE = "4.5,5";
	public final static String GENERAL_EVALUATE = "2.5,3,3.5,4";
	public final static String BAD_EVALUATE = "0,0.5,1,1.5,2";
	
	public final static String ALL_EVALUATE_CODE = "0";
	public final static String GOOD_EVALUATE_CODE = "1";
	public final static String GENERAL_EVALUATE_CODE = "2";
	public final static String BAD_EVALUATE_CODE = "3";
	
	/**
	 * 订单状态
	 */
	public final static String PAY_STATUS_HASNOTPAY = "0"; //未付款
	public final static String PAY_STATUS_HASPAYED = "1"; //已付款
	public final static String PAY_STATUS_RETURNING = "2"; //正在退款
	public final static String PAY_STATUS_RETURNED = "3"; //已退款
	public final static String PAY_STATUS_CANCLED = "4"; //已取消
	public final static String PAY_STATUS_NOTCOMMENT = "5"; //未评论
	public final static String PAY_STATUS_HASCOMMENT = "6";//已评论
	
	public final static String SEE_DOC_STATUS_ALL = "0";//全部
	public final static String SEE_DOC_STATUS_HASNOTDOC = "1";//未就诊
	public final static String SEE_DOC_STATUS_HASDOC = "2";//已就诊
	public final static String SEE_DOC_STATUS_CANCLED = "3";//已取消
	
	
	/**
	 * 接种相关状态
	 */
	public final static String INO_STATUS_NOTINO = "0"; //未接种
	public final static String INO_STATUS_HASINO = "1"; //已接种
	public final static String INO_STATUS_CANCLED = "-1"; //已取消
	
	/**
	 * 医生放号（接种、体检）相关状态
	 */
	public final static String STATUS_PUNISHED = "1"; //已发布
	public final static String STATUS_TIMEOUT = "2"; //已过期
	
	/**
	 * 体检相关状态
	 */
	public final static String CHECK_STATUS_NOTCHECKED = "0"; //未体检
	public final static String CHECK_STATUS_HASCHECKED = "1"; //已体检
	public final static String CKECK_STATUS_CANCLED = "-1";	//已取消
	public final static String SOURCE_PAYTYPE_SELFPAY = "1";  //自费
	public final static String SOURCE_PAYTYPE_FREE = "2";  //免费
	
	/**
	 * 居民相关状态
	 */
	public final static String RESIDENG_STATUS_SYNADD = "0"; //同步增加
	public final static String RESIDENG_STATUS_SYNDEL = "1"; //同步删除
	public final static String RESIDENG_STATUS_SYNUPDATE = "2"; //同步更改
	public final static String RESIDENG_STATUS_SYNSAME = "3";//同步相同
	public final static String RESIDENG_STATUS_SELFUPDATE = "4";//手动修改
	
	/**
	 * 血压等级
	 */
	public final static String HYPERTENSION_RESULT_NORMAL = "1";//血压正常
	public final static String HYPERTENSION_RESULT_HIGH = "2";	//血压偏高
	public final static String HYPERTENSION_RESULT_LOW = "3";	//血压偏低
	
	/**
	 * 血糖相关
	 */
	public final static String BLOOD_SUGER_NORMAL = "1";//血糖正常
	public final static String BLOOD_SUGER_HIGH = "2";	//血糖偏高
	public final static String BLOOD_SUGER_LOW = "3";	//血糖偏低
	
	public final static String BLOOD_SUGER_MEASURE_STATE_FASTING = "0";	//空腹
	public final static String BLOOD_SUGER_MEASURE_STATE_ONEHOURE = "1";//饭后一小时
	public final static String BLOOD_SUGER_MEASURE_STATE_TWOHOURE = "2";//饭后两小时
	public final static String BLOOD_SUGER_MEASURE_STATE_THREEHOURE = "3";//饭后三小时   
	
	/**
	 * 职业代码相关
	 */
	public final static String PROFESSIONAL_CODE_DOCTOR = "231,232,233,234";	//医生所属的职业代码
	public final static String NORMAL_STATUS_BAN = "0"; //注销
	public final static String NORMAL_STATUS_NORMAL = "1"; //正常

}
