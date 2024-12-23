package Study.j1016;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1016/T01Ok1")
public class T01Ok1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		//넘어온 아이디와 비밀번호가 DB에 저장된 회원정보와 같은지를 비교...
		PrintWriter out = response.getWriter();
		if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("hkd1234") && pwd.equals("1234"))) {
			out.println("<script>");
			out.println("alert('"+mid+"님 환영합니다.')");
			out.println("location.href='"+request.getContextPath()+"/study/1016/t02_Mem.jsp'");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('회원정보를 확인하세요')");
			out.println("location.href='"+request.getContextPath()+"/study/1016/t01_forword.jsp'");
			out.println("</script>");
		}
	}
}
