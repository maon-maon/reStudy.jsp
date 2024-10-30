package Study.j1017_18;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/1017_18/ServletTestOK")
public class ServletTestOK extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid");
		//System.out.println("mid : "+mid);
		
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		
		//ServletContext application = session.getServletContext();
		//ServletContext application = request.getSession().getServletContext();
		ServletContext application = request.getServletContext();
		application.setAttribute("aMid", mid);
		
		response.sendRedirect(request.getContextPath()+"/study/1017_18/t5_ServletTest.jsp");
	}
}
