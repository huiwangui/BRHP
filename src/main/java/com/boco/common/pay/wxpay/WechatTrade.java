package com.boco.common.pay.wxpay;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.boco.common.pay.wxpay.entity.WechatPayNotify;
import com.boco.common.pay.wxpay.entity.WechatUnifiedOrder;
import com.boco.common.pay.wxpay.util.SignUtil;
import com.boco.common.pay.wxpay.util.XmlUtil;
import com.boco.common.utils.JsonUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;




/**
 * 微信交易
 */
public class WechatTrade {
	public WechatTrade() {
		super();
	}
	private WechatPayNotify notice;
	public WechatTrade(WechatPayNotify notice){
		this.notice=notice;
		
	}
    private static Logger logger = LoggerFactory.getLogger(WechatTrade.class);
    /**
     * 微信统一下单
     * @param unifiedOrder 要下单的内容
     * @return 返回H5下单请求需要内容
     */
    public TreeMap<String,String> unifiedOrderRequest(WechatUnifiedOrder unifiedOrder){
        WechatUnifiedOrder.Response response =  WechatConfig.getInstance().unifiedOrder(unifiedOrder);
        if (response.getResult_code().equals(WechatConfig.SUCCESS_REQUEST)){
            TreeMap<String,String> prepareH5Pay = new TreeMap<String, String>();
            prepareH5Pay.put("appid", WechatConfig.APP_ID);
            prepareH5Pay.put("partnerid", WechatConfig.MCH_ID);
            prepareH5Pay.put("noncestr", WechatConfig.getInstance().nonce_str(16));
            prepareH5Pay.put("package", "Sign=WXPay");
            prepareH5Pay.put("timestamp", String.valueOf(System.currentTimeMillis() / 1000));
            prepareH5Pay.put("prepayid",response.getPrepay_id());
            prepareH5Pay.put("sign", WechatConfig.getInstance().sign(prepareH5Pay));
            return prepareH5Pay;
        }
        return null;
    }

   

    /**
     * 微信回调验签
     * @param request  回调请求
     * @return true成功
     */
    public boolean verifyNotify(HttpServletRequest request){
        try {
            InputStream inputStream = request.getInputStream();
            notice = XmlUtil.xmlToBean(inputStream, WechatPayNotify.class);
            if (notice == null) return false;
            logger.debug("微信回调参数:"+ JsonUtils.getJsonFormat(notice));
            String sign = WechatConfig.getInstance().sign(SignUtil.bean2TreeMap(notice));
            boolean ischeck = sign.equals(notice.getSign());
            logger.debug("微信验签结果:"+ischeck);
            return ischeck;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

}
