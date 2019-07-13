package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

//@WebFilter(
//		urlPatterns = { "/*" }, 
//		initParams = { 
//				@WebInitParam(name = "encoding", value = "UTF-8")
//		})
public class CharacterEncodingFilter implements Filter {
	
	private String encoding;

    public CharacterEncodingFilter() {
    }


	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// place your code here
		request.setCharacterEncoding(encoding);
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		encoding = fConfig.getInitParameter("encoding");
		if(encoding == null) {
			encoding = "UTF-8";
		}
	}

}
