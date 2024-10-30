package Study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Study2.StudyDAO;
import Study2.StudyInterface;

public class AjaxIdCheck1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		StudyDAO dao = new StudyDAO();
		
		String name = dao.getIdSearch(mid);
		
		// 헤더에 담는 방법
		// response사용 (req-res로 전달) 보낸함수에서 받는부분까지 있음. 호출=새로고침개념=동기식. 헤더=파라메타에 담아서 넘어감
		if(name.equals("")) {
			name = "찾는 아이디가 없습니다.";
		}
		response.getWriter().write(name);
		
	}

}
