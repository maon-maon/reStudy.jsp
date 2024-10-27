package Study.j1021;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/1021/T3_initOk")
public class T3_initOk extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 /1021/T3_initOk 입니다.");
	
		String logoName = getServletContext().getInitParameter("logoName");
		String homeAddess = getServletContext().getInitParameter("homeAddess");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("sLogoName",logoName);
		session.setAttribute("sHomeAddess", homeAddess);
		
		response.sendRedirect(request.getContextPath()+"/study/1021/t3_init.jsp");
	}
}
