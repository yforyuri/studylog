package service;

import javax.servlet.http.HttpServletRequest;

public class GreetingService implements Service {
	
	public String getViewPage(HttpServletRequest request) {

		request.setAttribute("request", "안녕하세요");
		
		return "/simplePage.jsp";
	}

}
