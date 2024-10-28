package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");

		System.out.println(mid);
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.MemberIdCheck(mid);
		
		if(vo.getPwd() == null) {
			request.setAttribute("message", "회원아이디가 없습니다. \\n확인하고 다시 로그인하세요");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
		
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("message", "비밀번호가 틀립니다. \\n확인하고 다시 로그인하세요");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
		
		/* 숙제 */
		// 정상 인증이 완료되었을 때 처리할 내용들을 기술 //=로그인 됨
		// 쿠키:아이디를 쿠키로 저장처리 
		// DB:방문포인트를 5회 미만일 경우에 10point씩 증가처리한다. 방문횟수(총/오늘) 누적, 마지막 방문일자 처리(로그인시), 준회원을 자동으로 등업처리할경우 수행내용 등등...==>> DB에 저장...
		// 세션:처리완료된 자료들은  작업수행이 지속되는 동안 꼭 필요한 정보만을 세션에 저장처리 
		/* 원래는 상기의 내용을 처리해야 함*/
		
		
		// 방문 포인트 10증가, 방문 카운트(총/오늘) 1증가, 마지막날짜(최종방문일자) 수정 
		dao.setPointPlus(mid);
		
		HttpSession session = request.getSession();
		session.setAttribute("sMid", "mid");
		session.setAttribute("sNickName", vo.getNickName());
		
		request.setAttribute("message", mid+"님 로그인되었습니다.");
		request.setAttribute("url", "MemberMain.mem");
	}
}
