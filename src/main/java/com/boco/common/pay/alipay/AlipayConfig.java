package com.boco.common.pay.alipay;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;

public class AlipayConfig {
		// 商户appid
		public static String APPID = "";
		// 私钥 pkcs8格式的
		public static String RSA_PRIVATE_KEY = "";
		// 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
		public static String PAY_NOTIFY = "http://商户网关地址/alipay.trade.wap.pay-JAVA-UTF-8/notify_url.jsp";
		// 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
		public static String RETURN_URL = "http://商户网关地址/alipay.trade.wap.pay-JAVA-UTF-8/return_url.jsp";
		// 请求网关地址
		public static String URL = "https://openapi.alipay.com/gateway.do";
		// 编码
		public static String CHARSET = "UTF-8";
		// 返回格式
		public static String FORMAT = "json";
		// 支付宝公钥
		public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjrEVFMOSiNJXaRNKicQuQdsREraftDA9Tua3WNZwcpeXeh8Wrt+V9JilLqSa7N7sVqwpvv8zWChgXhX/A96hEg97Oxe6GKUmzaZRNh0cZZ88vpkn5tlgL4mH/dhSr3Ip00kvM4rHq9PwuT4k7z1DpZAf1eghK8Q5BgxL88d0X07m9X96Ijd0yMkXArzD7jg+noqfbztEKoH3kPMRJC2w4ByVdweWUT2PwrlATpZZtYLmtDvUKG/sOkNAIKEMg3Rut1oKWpjyYanzDgS7Cg3awr1KPTl9rHCazk15aNYowmYtVabKwbGVToCAGK+qQ1gT3ELhkGnf3+h53fukNqRH+wIDAQAB";
		// 日志记录目录
		public static String log_path = "/log";
		// RSA2
		public static String SIGNTYPE = "RSA2";
		/**
	     *退款给成功回调
	     */
	    public static String REFUND_NOTIFY = "http://localhost:8080/BRHP/notify/alipay_refund";
		/**
	     * 成功标识
	     */
	    public static final String SUCCESS_REQUEST = "TRADE_SUCCESS";
	    /**
	     * 交易关闭回调(当该笔订单全部退款完毕,则交易关闭) 未付款交易超时关闭，或支付完成后全额退款
	     */
	    public static final String TRADE_CLOSED = "TRADE_CLOSED";
	    /**
	     * 交易完成
	     */
	    public static final String TRADE_FINISHED = "TRADE_FINISHED";
		
		/**
	     * 实际收款账号，一般填写商户PID即可  "2088123456789012" 
	     */
	    public static final String SELLER_ID = "";
	    /**
	     * 支付宝请求客户端入口
	     */
	    private volatile static AlipayClient  alipayClient = null;

	    /**
	     * 不可实例化
	     */
	    private AlipayConfig(){};

	    /**
	     * 双重锁单例
	     * @return 支付宝请求客户端实例
	     */
	    public static AlipayClient getInstance(){
	        if (alipayClient == null){
	            synchronized (AlipayConfig.class){
	                if (alipayClient == null){
	                    alipayClient = new DefaultAlipayClient(URL, APPID, RSA_PRIVATE_KEY, FORMAT, CHARSET, ALIPAY_PUBLIC_KEY, SIGNTYPE); 
	                }
	            }
	        }
	        return alipayClient;
	    }
	
	
}
