package com.boco.common.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class NumberUtils {
	/**
	 * double四舍五入
	 * 
	 * @param num
	 *            目标double
	 * @param length
	 *            保留小数点后位数
	 * @return
	 */
	public static double roundHalfUp(double num, int length) {
		double f = num;
		BigDecimal b = new BigDecimal(f);
		double f1 = b.setScale(length, BigDecimal.ROUND_HALF_UP).doubleValue();
		return f1;
	}

	/**
	 * 
	 * addZero:(数字格式化，前面不足的补0). <br/>
	 * @author q
	 * @param size：返回的位数
	 * @param item：目标数字
	 * @return
	 */
	public static String addZero(int size, int item) {
		String str1 = String.valueOf(item);
		StringBuffer bf = new StringBuffer();
		for (int i = 0; i < size; i++) {
			bf.append("0");
		}
		DecimalFormat df = new DecimalFormat(bf.toString());
		String str2 = df.format(Integer.parseInt(str1));
		return str2;
	}
}
