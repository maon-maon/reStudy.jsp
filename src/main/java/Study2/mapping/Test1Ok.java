package Study2.mapping;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapping/Test1Ok")
public class Test1Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int su1 = (request.getParameter("su1")==null || request.getParameter("su1").equals("")) ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = (request.getParameter("su2")==null || request.getParameter("su2").equals("")) ? 0 : Integer.parseInt(request.getParameter("su2"));
		int flag = Integer.parseInt(request.getParameter("flag"));
		System.out.println(flag);
		
		int hap	= su1 + su2;
		int cha	= su1 - su2;
		int gop	= su1 * su2;
		int mok = 0;
		if(su1 != 0 || su2 != 0) mok = su1 % su2;
		
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		request.setAttribute("flag", flag);

		if(flag == 1) {
			request.setAttribute("hap", hap);
			request.setAttribute("cha", cha);
		}
		else if(flag == 3) {
			request.setAttribute("gop", gop);
			request.setAttribute("mok", mok);
		}
		else if(flag == 4) {
			//Date date = new Date();
			LocalDateTime today = LocalDateTime.now();
			String str = today.toString().substring(0, 10) + " / ";
			str += today.toString().substring(11, 19);
			//request.setAttribute("msg", today);
			request.setAttribute("msg", str);
			request.setAttribute("today", today);
		}
		
		String viewPage = "/WEB-INF/study2/mapping/test1.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);	
	}
}
