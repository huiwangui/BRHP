package com.boco.modules.brhp.web.pay;

import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boco.common.pay.wxpay.WechatTrade;
import com.boco.common.pay.wxpay.entity.WechatPayNotify;
import com.boco.common.pay.wxpay.entity.WechatUnifiedOrder;


/**
 * 公众号支付
 * 
 **/

@Controller
@RequestMapping(value = "/wechat", produces = "application/json;charset=UTF-8")
public class WechatPayController {
    private Logger log = Logger.getLogger(WechatPayController.class);
    
    /**微信公众号JSAPI支付
     * 链接地址 由配置完成
     * 客户端请求生成支付订单，生成支付订单并返回客户端需要的参数
     * 调用统一下单API，微信后台生成预付单并返回prepay_id;用得到的prepay_id生成JSAPI页面需要的参数并签名。
     * 返回支付参数
     */
    @RequestMapping("/pay")  
    public String doWeinXinRequest(HttpServletRequest request,Model model) throws Exception {  
	// 商品描述	body参数必须  标价金额	total_fee 终端IP spbill_create_ip String(16)	123.12.12.123
   //商户订单号 要求必须32个字符以内out_trade_no = "";  //系统获取 或者前端传递订单号参数
    //下面为测试数据  正式数据由客户端请求获取
    Integer total_fee=1;
    String out_trade_no="FDOC1234567892012";
    String spbill_create_ip="127.12.15.41";
    String body="挂号费";
    //统一下单
    WechatUnifiedOrder unifiedOrder=new WechatUnifiedOrder();
    unifiedOrder.setBody(body);
    unifiedOrder.setTotal_fee(total_fee);
    unifiedOrder.setOut_trade_no(out_trade_no);
    unifiedOrder.setSpbill_create_ip(spbill_create_ip);
    
    WechatTrade wt=new WechatTrade();
    TreeMap<String, String>  treemap= wt.unifiedOrderRequest(unifiedOrder);
    if(treemap!=null){
    	model.addAllAttributes(treemap);
    	return  "/wappay/wxPay";
    }
	return  "/wappay/error";
    }
    
    /** 后台异步通知 */
	@RequestMapping(value = "/notify", method = RequestMethod.POST)
	public String notifyurl(HttpServletRequest request) {
		
	WechatPayNotify notice =new WechatPayNotify();
	WechatTrade wt=new WechatTrade(notice);
	Boolean vali=wt.verifyNotify(request);
	if(vali){
	   if (notice.getResult_code().equals("SUCCESS")){
		   //后台相关业务处理
		   return "SUCCESS";//通知微信支付成功
	   }else{
		   return "FAIL";//支付失败
	   }
	}
	 return "FAIL";//支付失败
	}
}
