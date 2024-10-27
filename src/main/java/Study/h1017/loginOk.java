package Study.h1017;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/1017/loginOk")
public class loginOk extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid");
		String team = "";
		String viewPage = "";
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher;
		dispatcher = request.getRequestDispatcher(viewPage);
		
		if(mid.substring(mid.length()-1).equals("I")) team = "I";
		else if(mid.substring(mid.length()-1).equals("J")) team = "J";
		else if(mid.substring(mid.length()-1).equals("S")) team = "S";
		else if(mid.substring(mid.length()-1).equals("C")) team = "C";
		else { 
			//session = request.getSession();
			String message = "사원 아이디를 입력해주세요.";
			session.setAttribute("message", message);
			viewPage = "/study/h1017/ex01Login.jsp";
			dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response); 
		}
		
		switch (team) {
			case "I":
				System.out.println(mid);
				session.setAttribute("sMid", mid);
				session.setAttribute("sTeam", "인사과");
				viewPage = "/study/h1017/ex01MainI.jsp";
				dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response); 
				break;

			default:
				break;
		}
		
		
		
		
		
	}
}
