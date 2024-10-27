package guest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestListCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터베이스 바로 연동해서 가져오기
		GuestDAO dao = new GuestDAO();
		
		List<GuestVO> vos = dao.getGuestList();
		//System.out.println(vos+"여기까지");
		request.setAttribute("vos", vos);
		request.setAttribute("guestCnt", vos.size());
	}
}
