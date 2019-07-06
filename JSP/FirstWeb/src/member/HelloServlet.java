package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	response.setContentType("text/html; charser=utf-8");
	
	PrintWriter out = response.getWriter();
	out.println("<html>");
	out.println("<head>");
	out.println("<title>HELLO Servlet");
	out.println("</title>");
	out.println("</head>");
	out.println("<body>");
	out.println(new Date());
	out.println("</h1>");
	out.println("</body>");
	out.println("</html>");
	}
	
}
