package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class EncordingFilter implements Filter {

//	@Override
//	public void init(FilterConfig filterConfig) throws ServletException {
//		System.out.println("a.여기는 init 메소드 입니다");
//	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//System.out.println("11.여기는 필터 수행 전 입니다");
		
		chain.doFilter(request, response);
		
		//System.out.println("22.여기는 필터 수행 후 입니다");
	}
	
//	@Override
//	public void destroy() {
//		System.out.println("b.여기는 destroy 메소드 입니다");
//	}
}
