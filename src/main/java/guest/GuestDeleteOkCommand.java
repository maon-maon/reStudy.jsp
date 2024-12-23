package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestDeleteOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 :  Integer.parseInt(request.getParameter("idx"));
		
		GuestDAO dao = new GuestDAO();
		
		int res = dao.GuestDeleteOk(idx);
		
		if(res != 0) {
			request.setAttribute("message", "선택한 방명록이 삭제되었습니다.");
		}
		else if(res == 0) {
			request.setAttribute("message", "방명록 삭제 실패하였습니다.");
		}
		request.setAttribute("url", "GuestList.gu");
		
	}
}
