package Study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Study2.StudyDAO;
import Study2.StudyInterface;

public class AjaxIdCheck0Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		StudyDAO dao = new StudyDAO();
		
		String name = dao.getIdSearch(mid);
		
		if(!name.equals("")) {
			request.setAttribute("name", name);
			request.setAttribute("message", "전송된 아이디: "+mid+" , 성명: "+name);
			request.setAttribute("url", "AjaxTest.st?name="+name);
		}
		else {
			request.setAttribute("message", "검색된 아이디가 없습니다.");
			request.setAttribute("url", "AjaxTest.st");
		}
		
	}

}
