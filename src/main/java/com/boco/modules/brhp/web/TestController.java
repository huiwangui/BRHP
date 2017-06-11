package com.boco.modules.brhp.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/test", produces = "application/json;charset=UTF-8")
public class TestController{
	
	@RequestMapping(value = "/test",method = RequestMethod.GET)
	public String test(String param){
		return "/test";
	}
}
