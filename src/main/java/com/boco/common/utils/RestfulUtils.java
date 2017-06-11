package com.boco.common.utils;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

public class RestfulUtils {
	public static String sendPostRequest(String url,Form form){
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target(url);
        Response response = target.request().post(Entity.entity(form,MediaType.APPLICATION_FORM_URLENCODED));
		return response.readEntity(String.class);
	}
	
	public static String sentGetRequest(String url){
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target(url);
        String response = target.request(MediaType.APPLICATION_JSON_TYPE).get(String.class);
		return response;
	}
}
