package com.boco.common.pay.wxpay;

/**
 * 微信支付配置
 */
public final class WechatConfig {
	
	/**
	 * 这个就是自己要保管好的私有Key了（切记只能放在自己的后台代码里，不能放在任何可能被看到源代码的客户端程序中）
                   每次自己Post数据给API的时候都要用这个key来对所有字段进行签名，生成的签名会放在Sign这个字段，API收到Post数据的时候也会用同样的签名算法对Post过来的数据进行签名和验证
                   收到API的返回的时候也要用这个key来对返回的数据算下签名，跟API的Sign数据进行比较，如果值不一致，有可能数据被第三方给篡改
	 **/
	private static String key = "";//key和APP_SECRET一样 二取一  
    /**
     * 用户的id
     */
    public static final String APP_ID = "xxxxx";
   

	/**
     * 身份密钥
     */
    public static final String APP_SECRET = "xxxxx";
    /**
     * 商户id
     */
    public static final String MCH_ID = "xxxxx";
    /**
     * 统一下单地址
     */
    public static final String UNIFIEDORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
    /**
     * 交易退款地址
     */
    public static final String REFUND_URL = "https://api.mch.weixin.qq.com/secapi/pay/refund";
    /**
     * 交易退款查询地址
     */
    public static final String REFUND_QUERY = "https://api.mch.weixin.qq.com/pay/refundquery";
    /**
     * 支付成功回调
     */
    public static final String NOTIFY_PAY = "http://www.boco.xxxxx.com/wechat/notify";
    /**
     * 支付类型
     */
    public static final String TRADE_TYPE = "APP";
    /**
     * 证书地址
     */
    public static final String CERT_PATH = "C:\\Users\\NL\\cert\\apiclient_cert.p12";
    /**
     * 成功标识
     */
    public static final String SUCCESS_REQUEST = "SUCCUSS";
    
    public static String getKey() {
		return key;
	}

	public static void setKey(String key) {
		WechatConfig.key = key;
	}

    /**
     * 不可实例化
     */
    private WechatConfig(){}

    private volatile static WechatClient wechatClient = null;

    /**
     * 双重锁单例
     * @return WechatClient实例
     */
    public static WechatClient getInstance(){
        if (wechatClient == null){
            synchronized (WechatConfig.class){
                if (wechatClient == null){
                    return new WechatClient(APP_ID,MCH_ID,APP_SECRET,TRADE_TYPE);
                }
            }
        }
        return wechatClient;
    }

}
