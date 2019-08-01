package com.bitcamp.mvc;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {


	@RequestMapping("/hello")
	public ModelAndView hello(HttpServletRequest request) {
		
		// FrontController로 전송할 view경로와 결과데이터 저장하고 전달할 객체 
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hello"); //WEB-INF/views/hello.jsp
		modelAndView.addObject("userName", "Y");
		modelAndView.addObject("greeting", "hi");
		modelAndView.addObject("now", new Date());
		
		return modelAndView;
	}
	
	
}
