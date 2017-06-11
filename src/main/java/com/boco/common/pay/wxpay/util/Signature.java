package com.boco.common.pay.wxpay.util;

import com.boco.common.pay.wxpay.WechatConfig;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
public class Signature {
	 /**
     * 签名算法
     * @param o 要参与签名的数据对象
     * @return 签名
     * @throws IllegalAccessException
     */
    public static String getSign(Object o) throws IllegalAccessException {
        ArrayList<String> list = new ArrayList<String>();
        Class cls = o.getClass();
        Field[] fields = cls.getDeclaredFields();
        for (Field f : fields) {
            f.setAccessible(true);
            if (f.get(o) != null && f.get(o) != "") {
                list.add(f.getName() + "=" + f.get(o) + "&");
            }
        }
        int size = list.size();
        String [] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < size; i ++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        result += "key=" + WechatConfig.getKey();
        WeChatUtil.log("Sign Before MD5:" + result);
        result = MD5.MD5Encode(result).toUpperCase();
        WeChatUtil.log("Sign Result:" + result);
        return result;
    }

 
}
