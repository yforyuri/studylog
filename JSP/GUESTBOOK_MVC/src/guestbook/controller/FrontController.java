package guestbook.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.service.GuestBookService;


@WebServlet(
		urlPatterns = { "/" }, 
		initParams = { 
				@WebInitParam(name = "config", value = "/WEB-INF/commandServices.properties")
		})
public class FrontController extends HttpServlet {
	
	private Map<String, GuestBookService> commands = new HashMap<String, GuestBookService>();
       

	public void init(ServletConfig config) throws ServletException {
		String configfile = config.getInitParameter("config");
		Properties prop = new Properties();
		FileInputStream fis = null;
		String configFilePath = config.getServletContext().getRealPath(configfile);
		
		try {
			fis = new FileInputStream(configFilePath);
			prop.load(fis);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Iterator itr = prop.keySet().iterator();
		
		while(itr.hasNext()) {
			String command = (String)itr.next(); // 사용자 요청 uri
			
			String serviceClassName = prop.getProperty(command); // 서비스 클래스 이름 
			
			//prop에 있는 클래스 이름으로 인스턴스 생성 
			
			System.out.println(command);
			try {
				Class serviceClass = Class.forName(serviceClassName);
				//객체생성 
				GuestBookService service = (GuestBookService) serviceClass.newInstance();
				//commands Map에 저장 <String, GuestBookService>
				commands.put(command, service);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			
		}
	
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 사용자 요청 분석
		String commandUri = request.getRequestURI(); // /guest/guestbookList
		if(commandUri.indexOf(request.getContextPath()) == 0) {
			commandUri = commandUri.substring(request.getContextPath().length());
		}
		System.out.println(commandUri);
		
		// 2. 사용자 요청에 맞는 모델 실행 (service.method 실행) -> view page반환 
		String viewPage ="/WEB-INF/view/null.jsp";
		GuestBookService service = commands.get(commandUri); // null값을 반환하기도 한다. 
		
		if(service != null) {
			viewPage = service.getViewName(request, response);
		}
		
		
		// 3.view로  forwarding 
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
