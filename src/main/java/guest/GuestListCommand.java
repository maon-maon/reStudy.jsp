package guest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestListCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		//데이터베이스 바로 연동해서 가져오기
//		GuestDAO dao = new GuestDAO();
//		
//		List<GuestVO> vos = dao.getGuestList();
//		//System.out.println(vos+"여기까지");
//		request.setAttribute("vos", vos);
//		request.setAttribute("guestCnt", vos.size());
		
		GuestDAO dao = new GuestDAO();
		
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		int totRecCnt = dao.getTotRecCnt();
		//System.out.println("totRecCnt : "+totRecCnt);
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) +1;
		
		int startIndexNo = (pag - 1) * pageSize;
		
		int curScrStartNo = (totRecCnt - startIndexNo);
		
		List<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize);
				
		
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("startIndexNo", startIndexNo);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("vos", vos);
		
		
	}
}
