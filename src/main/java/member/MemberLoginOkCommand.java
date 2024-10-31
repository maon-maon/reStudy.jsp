package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;
import guest.GuestDAO;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");

		//System.out.println(mid);
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
	//241029 저장괸 비밀번호에서 salt키를 분리시켜서 다시 암호화 후 비교처리한다.
		String salt = vo.getPwd().substring(0,3);
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt+pwd);
		
		
		//if(vo.getPwd() == null) {
		if(!vo.getPwd().substring(3).equals(pwd)) {
			request.setAttribute("message", "회원 정보가 없습니다. \\n확인하고 다시 로그인하세요");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
		/*241029 필요 없어짐
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("message", "비밀번호가 틀립니다. \\n확인하고 다시 로그인하세요");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		} */
		
		/* 숙제 */
		// 정상 인증이 완료되었을 때 처리할 내용들을 기술 //=로그인 됨
		// 쿠키:아이디를 쿠키로 저장처리 
		// DB:방문포인트를 5회 미만일 경우에 10point씩 증가처리한다. 방문횟수(총/오늘) 누적, 마지막 방문일자 처리(로그인시), 준회원을 자동으로 등업처리할경우 수행내용 등등...==>> DB에 저장...
		// 세션:처리완료된 자료들은  작업수행이 지속되는 동안 꼭 필요한 정보만을 세션에 저장처리 
		/* 원래는 상기의 내용을 처리해야 함*/
		
	// 쿠키:아이디를 쿠키로 저장처리
		String idSave = request.getParameter("idSave")==null ? "off" : "on";
		//System.out.println("idSave :"+idSave);
		Cookie cookieMid = new Cookie("cMid", mid);
		cookieMid.setPath("/");
		if(idSave.equals("on")) {
			cookieMid.setMaxAge(60*60*24*7);
		}
		else {
			cookieMid.setMaxAge(0);
		}
		response.addCookie(cookieMid);
		
	//세션에 저장할 항목 : mid, nickName //DB에서 꺼내기 번거로운것 세션에 저장해서 사용
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("sLastDate", vo.getLastDate());
		
		String strLevel = strLevelProcess(vo.getLevel());
		session.setAttribute("strLevel", strLevel);
		
		
		// 방문 포인트 10증가, 방문 카운트(총/오늘) 1증가, 마지막날짜(최종방문일자) 수정 
		//dao.setPointPlus(mid);
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		
		if(!strToday.equals(vo.getLastDate().substring(0,10))) {
			vo.setTodayCnt(1);
			vo.setPoint(vo.getPoint()+10);
		}
		else {
			vo.setTodayCnt(vo.getTodayCnt()+1);
			if(vo.getTodayCnt() <= 5) vo.setPoint(vo.getPoint()+10);
		}
		
		dao.setMemberInfoUpdate(vo);
		
		// 준회원인경우 정회원으로 자동등업처리(조건:총방문회수 10회이상, 방명록글수 2개이상)
		int levelsw = 0;
		if(vo.getLevel() == 1) { //준회원일때만 하애릐 내용을 처리
			GuestDAO gDao = new GuestDAO();
			vo = dao.getMemberIdCheck(mid);
			if(vo.getVisitCnt() >= 10 && gDao.getGuestCnt(mid, vo.getName(), vo.getNickName()) >= 2) {
				dao.setMemberLevelUpdate(vo.getIdx(), 2); //고유번호와 등업시킬레벨을 전송 =>강제로 정회원으로 등업
				session.setAttribute("sLevel", 2);
				session.setAttribute("strLevel", strLevelProcess(2));
				levelsw = 1;
			}
		}
		if (levelsw != 0) request.setAttribute("message", mid+"님 축하합니다. \\n정회원이 되셨습니다.");
		else request.setAttribute("message", mid+"님 로그인되었습니다.");
		
		
		request.setAttribute("url", "MemberMain.mem");
	}

	//회원 등급별 등급명칭을 strLevel변수에 저장한다.
	private String strLevelProcess(int level) {
		String strLevel = "";
		if(level == 0) strLevel = "관리자";
		else if(level == 1) strLevel = "준회원";
		else if(level == 2) strLevel = "정회원";
		else if(level == 3) strLevel = "우수회원";
		return strLevel;
	}
}
