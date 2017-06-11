package com.boco.common.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

 

public class ListUtils {
	/**
	 * 
	 * singleItemToDoubleItem:(该方法主要用于将对象list转化成两个对象为一组的list，方便前台ul显示). <br/>
	 * @author q
	 * @param objList
	 * @return
	 */
	public static List<Map<String, Object>> singleItemToDoubleItem(List<Object> objList){
		List<Map<String, Object>> doubleList = new ArrayList<Map<String, Object>>();
		try {
			for (int i = 0; i < objList.size(); i++) {
				if (i % 2 != 0) { // 如果索引值为奇数，则跳过本次循环
					continue;
				} else {
					Map<String, Object> mapItem = new HashMap<String, Object>();
					Object obj1 = objList.get(i);
					Map firstMap = ObjectUtils.beanToMap(obj1);	//将对象转化成map
					//	迭代map的每一个entry，key值加字符串“1”表示第一个对象，key值加字符串“2”表示第二个对象
					Iterator iter = firstMap.entrySet().iterator();
					while (iter.hasNext()){
						Entry e = (Entry) iter.next();
						String key = (String) e.getKey();
						Object value = e.getValue();
						mapItem.put(key + "1", value);
					}
					if (objList.size() > i + 1) {
						Object obj2 = objList.get(i + 1);
						Map secondMap = ObjectUtils.beanToMap(obj2);
						Iterator iter2 = secondMap.entrySet().iterator();
						while (iter2.hasNext()){
							Entry e = (Entry) iter2.next();
							String key = (String) e.getKey();
							Object value = e.getValue();
							mapItem.put(key + "2", value);
						}
					}
					doubleList.add(mapItem);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doubleList;
	}
}
