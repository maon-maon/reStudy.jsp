package Study.j1021;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/1021/T3_initOut")
public class T3_initOut extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("sLogoName");
		session.removeAttribute("sHomeAddess");
		
		response.sendRedirect(request.getContextPath()+"/study/1021/t3_init.jsp");
	}

}
