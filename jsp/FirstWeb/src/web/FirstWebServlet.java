package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstWebSevlet
 */
@WebServlet(name = "servlet", urlPatterns = "/first")  //FirstWebServlet class의 부가적인 속성을 지정해줌 
public class FirstWebServlet extends HttpServlet {
       
    public FirstWebServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//    request - 사용자의 요청 정보를 담고있다
//    response - 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html1; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>first web</title></head>");
		out.println("<body><h1>시간 : "+ new Date());
		out.println("</h1></body></html>");
	}

}
