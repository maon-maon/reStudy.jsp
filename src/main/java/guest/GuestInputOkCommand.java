package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestInputOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		
		GuestDAO dao = new GuestDAO();
		GuestVO vo = new GuestVO();
		
		vo.setName(name);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIp(hostIp);

		int res = dao.setGuestInputOk(vo);

		if(res != 0) {
			request.setAttribute("message", "방명록이 등록되었습니다.");
			request.setAttribute("url", "GuestList.gu");
		}
		else {
			request.setAttribute("message", "방명록 등록에 실패하였습니다. 다시 작성해주세요.");
			request.setAttribute("url", "GuestInput.gu");
		}
	}
}
