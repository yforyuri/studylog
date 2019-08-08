package com.yforyuri.ts;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/main")
	public String getMainPage(HttpSession session) {
		if(session != null) {
			System.out.println(session.getAttribute("loginInfo"));
		}
		return "main";
	}

}