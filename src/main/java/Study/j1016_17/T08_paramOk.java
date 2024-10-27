package Study.j1016_17;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

@WebServlet("/1016_17/T08_paramOk")
public class T08_paramOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	
		request.setAttribute("mid", mid);
		request.setAttribute("pwd", pwd);
		
		System.out.println("회원정보");
		System.out.println("아이디 : " +mid);
		System.out.println("비밀번호 : " +pwd);
		
//		if(mid.substring(mid.length()-1).equals("I")) {
//				<jsp:forward page="t08_resI.jsp">
//					<jsp:param name="mid" value="${mid}" />
//					<jsp:param name="pwd" value="${pwd}" />
//				</jsp:forward>
//		 else if(mid.substring(mid.length()-1).equals("J")) { 
//				<jsp:forward page="t08_resJ.jsp">
//					<jsp:param name="mid" value="${mid}" />
//					<jsp:param name="pwd" value="${pwd}" />
//				</jsp:forward>
//		 else if(mid.substring(mid.length()-1).equals("S")) { 
//				<jsp:forward page="t08_resS.jsp">
//					<jsp:param name="mid" value="${mid}" />
//					<jsp:param name="pwd" value="${pwd}" />
//				</jsp:forward>
//		 else if(mid.substring(mid.length()-1).equals("C")) { 
//				<jsp:forward page="t08_resC.jsp">
//					<jsp:param name="mid" value="${mid}" />
//					<jsp:param name="pwd" value="${pwd}" />
//				</jsp:forward>
//		}		
		
	}
}
