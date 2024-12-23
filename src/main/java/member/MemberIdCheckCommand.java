package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberIdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		//System.out.println("MemberIdCheck mid : "+mid);
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);

		if(vo.getMid() == null || vo.getMid().equals("")) {
			//System.out.println("2mid : ");
			vo.setMid(mid);
		}
		else {
			vo.setTempMid(mid);
		}
		request.setAttribute("vo", vo);
	}

}
