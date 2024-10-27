package Study.j1016_17;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1016/T07_sungjukOk")
public class T07_sungjukOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String hakbun = request.getParameter("hakbun")==null ? "" : request.getParameter("hakbun");
		int kor = (request.getParameter("kor")==null || request.getParameter("kor").equals("")) ? 0 : Integer.parseInt(request.getParameter("kor")); 
		int eng = (request.getParameter("eng")==null || request.getParameter("eng").equals("")) ? 0 : Integer.parseInt(request.getParameter("eng")); 
		int mat = (request.getParameter("mat")==null || request.getParameter("mat").equals("")) ? 0 : Integer.parseInt(request.getParameter("mat")); 
		int soc = (request.getParameter("soc")==null || request.getParameter("soc").equals("")) ? 0 : Integer.parseInt(request.getParameter("soc")); 
		int sci = (request.getParameter("sci")==null || request.getParameter("sci").equals("")) ? 0 : Integer.parseInt(request.getParameter("sci")); 
		String hostIp = request.getParameter("hostIp");
		
		int tot = kor+eng+mat+soc+sci;
		double avg = tot / 5.0;
		String grade = "";
		
		switch ((int)(avg / 10)) {
			case 10:
			case 9:
				grade = "A"; break;
			case 8:
				grade = "B"; break;
			case 7:
				grade = "C"; break;
			case 6:
				grade = "D"; break;
			default:
				grade = "F";
				break;
		}
		
		
		
	}
}
