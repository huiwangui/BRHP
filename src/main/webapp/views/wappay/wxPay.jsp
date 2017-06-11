<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/> 
  <title>微信支付样例-支付</title>
</head>
<body>
 <font color="#9ACD32"><b>该笔订单支付金额为<span style="color:#f00;font-size:50px">1分</span>钱</b></font><br/><br/>
<div align="center">
	<button style="width:210px; height:50px; border-radius: 15px;background-color:#FE6714; border:0px #FE6714 solid; cursor: pointer;  color:white;  font-size:16px;" type="button" onclick="callpay()">立即支付</button>
</div>



<script type="text/javascript">

	//调用微信JS api 支付
	function jsApiCall(){
		 WeixinJSBridge.invoke(
		           'getBrandWCPayRequest', {
		           "appId" : "${appId}",    //公众号名称，由商户传入     
		           "timeStamp" : "${timeStamp}",         //时间戳，自1970年以来的秒数     
		           "nonceStr":"${nonceStr}", //随机串     
		           "package":"prepay_id=${prepay_id}",     
		           "signType":"MD5",         //微信签名方式：     
		           "paySign" : "${paySign}"    //微信签名 
		       },
		       function(res){     
		           if(res.err_msg == "get_brand_wcpay_request:ok" ) {}     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
		       }
		   ); 
	}
	function callpay(){
		if (typeof WeixinJSBridge == "undefined"){
		    if( document.addEventListener ){
		        document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
		    }else if (document.attachEvent){
		        document.attachEvent('WeixinJSBridgeReady', jsApiCall); 
		        document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
		    }
		}else{
		    jsApiCall();
		}
	}

</script>
</body>
</html>