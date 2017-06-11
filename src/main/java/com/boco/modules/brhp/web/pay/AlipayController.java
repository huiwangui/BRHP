package com.boco.modules.brhp.web.pay;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.boco.common.pay.alipay.AlipayConfig;
import com.boco.common.pay.alipay.AlipayTrade;
import com.boco.common.pay.alipay.util.SignUtil;
import com.boco.common.utils.JsonUtils;


@Controller
@RequestMapping(value = "/alipay", produces = "application/json;charset=UTF-8")
public class AlipayController {
	 private Logger logger = LoggerFactory.getLogger(AlipayController.class);
	/**支付宝支付表单 */
	@RequestMapping(value = "/form", method = RequestMethod.POST)
	public String webPay(HttpServletRequest request, String out_trade_no, String subject, String total_amount) {
		Map<String, String> paramMap = new HashMap<String, String>();
		// 订单最晚付款时间 可以不设置 m 表示分钟
		paramMap.put("out_trade_no", "out_trade_no");
		paramMap.put("subject", "subject");
		paramMap.put("total_amount", "total_amount");
		paramMap.put("timeout_express", "30m");
		AlipayTrade alipayTrade = new AlipayTrade();
		return alipayTrade.TradeWapPayRequest(paramMap);
	}
    
	
	/**退款请求 */
	@ResponseBody
	@RequestMapping(value = "/refund", method = RequestMethod.POST)
	public String refund(HttpServletRequest request, String timestamp) {
		Map<String,String> paranMap = SignUtil.request2Map(request);
		paranMap.put("timestamp", timestamp);
		AlipayTradeRefundRequest alirequest = new AlipayTradeRefundRequest();
		alirequest.setReturnUrl(AlipayConfig.RETURN_URL);
		alirequest.setNotifyUrl(AlipayConfig.REFUND_NOTIFY);
        // 待请求参数数组
		alirequest.setBizContent(JsonUtils.getJsonFormat(paranMap));
        AlipayTradeRefundResponse aliresponse=null;
		try {
			aliresponse = AlipayConfig.getInstance().execute(alirequest);
		} catch (AlipayApiException e) {
			e.printStackTrace();
		}
        logger.debug("支付宝退货结果:"+aliresponse.isSuccess());
        return JsonUtils.getJsonFormat(aliresponse);
	}
	
	
	/** 同步通知页面 */
	@RequestMapping(value = "/return_notify", method = RequestMethod.GET)
	public String returnurl(HttpServletRequest request) {
         
		AlipayTrade alipayTrade = new AlipayTrade();
		boolean isVerify = false;
		try {
			isVerify = alipayTrade.verifyNotify(request);
		} catch (AlipayApiException e) {
			e.printStackTrace();
		}
		if (isVerify) {
			return "验证成功 到成功页面";//TODO
		} else {
			return "验证失败  到失败页面";//TODO
		}
	}

	/** 后台异步通知 */
	@RequestMapping(value = "/notify", method = RequestMethod.POST)
	public String notifyurl(HttpServletRequest request) {
		//交易状态
		String trade_status = "";
		//商户订单号
		String out_trade_no ="";
		//支付宝交易号
		String trade_no ="";

		AlipayTrade alipayTrade = new AlipayTrade();
		boolean isVerify = false;
		try {
			isVerify = alipayTrade.verifyNotify(request);
			// 交易状态
			trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");
			out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (isVerify) {
			if (trade_status.equals("TRADE_FINISHED")) {
				// 判断该笔订单是否在商户网站中已经做过处理
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的
				// 如果有做过处理，不执行商户的业务程序

				// 注意：
				// 如果签约的是可退款协议，退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
				// 如果没有签约可退款协议，那么付款完成后，支付宝系统发送该交易状态通知。
			} else if (trade_status.equals("TRADE_SUCCESS")) {
				// 判断该笔订单是否在商户网站中已经做过处理
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的
				// 如果有做过处理，不执行商户的业务程序

				// 注意：
				// 如果签约的是可退款协议，那么付款完成后，支付宝系统发送该交易状态通知。
			}
			return "success"; // 请不要修改或删除;
		} else {
			return "fail";// 请不要修改或删除;
		}
	}

}
