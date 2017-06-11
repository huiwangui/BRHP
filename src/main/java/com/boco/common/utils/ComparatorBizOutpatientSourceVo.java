package com.boco.common.utils;

import java.util.Comparator;

import com.boco.modules.brhp.vo.BizOutpatientSourceVo;

public class ComparatorBizOutpatientSourceVo implements Comparator{

	@Override
	public int compare(Object arg0, Object arg1) {
		BizOutpatientSourceVo vo0 = (BizOutpatientSourceVo) arg0;
		BizOutpatientSourceVo vo1 = (BizOutpatientSourceVo) arg1;
		return String.valueOf(vo0.getClinicDate().getTime()).compareTo(String.valueOf(vo1.getClinicDate().getTime()));
	}
}
