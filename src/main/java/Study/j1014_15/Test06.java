package Study.j1014_15;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
//@WebServlet({"/Test06","/T06"})
public class Test06 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		System.out.println("이곳은 Test06 서블릿 Get");
		
		PrintWriter out = response.getWriter();
		out.println("<p><a href='/reStudy/study/1014_15/test06.jsp'>돌아기기</a></p>");
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test06 서블릿 Post");
		doGet(request, response);
	}
}
