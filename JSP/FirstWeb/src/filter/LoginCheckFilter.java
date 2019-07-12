package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/mypage/*")
public class LoginCheckFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// place your code here

		HttpServletRequest req = (HttpServletRequest) request;

		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession session = req.getSession(false);

		boolean loginChk = false;

		if (session != null && session.getAttribute("LoginInfo") != null) {
			loginChk = true;
		}

		if (loginChk) {
			// pass the request along the filter chain
			chain.doFilter(request, response);
		} else {
			res.sendRedirect(req.getContextPath() + "/session/member/loginForm.jsp");

//			RequestDispatcher dispatcher = request.getRequestDispatcher("/session/member/loginForm.jsp");
//			chain.dispatcher.forward(request, response);
		}

	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}