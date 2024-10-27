package Study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.can")
public class CanController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String msg = request.getParameter("msg")==null ? "" : request.getParameter("msg");
		
		
		//request.setAttribute("msg", "list.do");
		//request.setAttribute("msg", msg);
		
		//String viewPage = "/WEB-INF/study2/mapping/test2.jsp";
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);

		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		System.out.println("com : " + com);
		request.setAttribute("msg", com);
		
		CanInterface command = null;
		
		if(com.equals("list")) {
			command = new CanListCommand();
			command.excute(request, response);
			viewPage += "canList.jsp";
		}
		if(com.equals("input")) {
			command = new CanInputCommand();
			command.excute(request, response);
			viewPage += "canInput.jsp";
		}
		else if(com.equals("inputOk")) {
			command = new CanInputOkCommand();
			command.excute(request, response);
			viewPage += "test2.jsp";
		}
		

		
		
		
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
