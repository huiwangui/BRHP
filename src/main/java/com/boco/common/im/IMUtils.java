package com.boco.common.im;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.boco.common.constants.BusinessConstants;
import com.boco.common.enums.ApiStatusEnum;
import com.boco.common.utils.PropertiesUtils;
import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.Userinfos;
import com.taobao.api.request.OpenimUsersAddRequest;
import com.taobao.api.request.OpenimUsersGetRequest;
import com.taobao.api.response.OpenimUsersAddResponse;
import com.taobao.api.response.OpenimUsersGetResponse;
 

public class IMUtils {
	private static String url = PropertiesUtils.getValue("im_url");
	private static String appKey = PropertiesUtils.getValue("im_appkey");
	private static String appSecret = PropertiesUtils.getValue("im_appSecret");
	
	public static Integer register(Map<String, String> userMap){
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(Feature.ALLOW_SINGLE_QUOTES, true);
			mapper.configure(Feature.ALLOW_UNQUOTED_CONTROL_CHARS, true);
			String userName = userMap.get("userName");
			
			TaobaoClient client = new DefaultTaobaoClient(url, appKey, appSecret);
			OpenimUsersGetRequest req = new OpenimUsersGetRequest();
			req.setUserids(userName);
			OpenimUsersGetResponse rsp = client.execute(req);
			Map<String, Object> imMap = (Map<String, Object>) mapper.readValue(rsp.getBody(),HashMap.class).get("openim_users_get_response");
			if (imMap == null) {
				return ApiStatusEnum.FAIL.getKey();
			}
			Map<String, Object> userinfosMap = (Map<String, Object>) imMap.get("userinfos");
			List<Map<String, Object>> userinfoList = (List<Map<String, Object>>) userinfosMap.get("userinfos");
			if (userinfoList == null || userinfoList.size() == 0) {
				OpenimUsersAddRequest addreq = new OpenimUsersAddRequest();
				List<Userinfos> list = new ArrayList<Userinfos>();
				Userinfos obj3 = new Userinfos();
				obj3.setUserid(userName);
				obj3.setNick("u_"+userName);
				obj3.setPassword(userMap.get("password"));
				if (userMap.get("photo") != null && !"".equals(userMap.get("photo"))) {
					obj3.setIconUrl(userMap.get("photo"));
				}
				list.add(obj3);
				addreq.setUserinfos(list);
				OpenimUsersAddResponse addrsp = client.execute(addreq);
			}
			return ApiStatusEnum.SUCCESS.getKey();
		} catch (Exception e) {
			e.printStackTrace();
			return ApiStatusEnum.FAIL.getKey();
		}
	}
}
