package com.bitcamp.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.mvc.domain.Login;

@RestController
@RequestMapping("restapi/{id}")
public class RestAPIController {
	
//	@GetMapping(value = "/restapi/hello", method = RequestMethod.GET)
	@RequestMapping(value = "/restapi/hello", method = RequestMethod.GET)
	public String hello() {
		return "hello";
	}
	
	@RequestMapping("restapi/login")
	public Login login() {
		
		Login login = new Login();
		login.setId("AA");
		login.setPw("321321");
		
		return login;	
	}
	
	@RequestMapping("restapi/loginList")
	public List<Login> loginList() {
		
		List<Login> list = new ArrayList<Login>();
		
		Login login = new Login();
		login.setId("Y");
		login.setPw("11");
		
		list.add(login);
		
		login = new Login();
		login.setId("A");
		login.setPw("222");
		
		list.add(login);
		
		return list;
	}

	@RequestMapping("restapi/loginMap")
	public Map<String, Login> loginMap() {
		
		Map<String, Login> maps = new HashMap<String, Login>();
		
		Login login = new Login();
		login.setId("Y");
		login.setPw("11");
		
		maps.put("1", login);
		
		login = new Login();
		login.setId("A");
		login.setPw("222");
		
		maps.put("2", login);
		
		return maps;
	}
}
