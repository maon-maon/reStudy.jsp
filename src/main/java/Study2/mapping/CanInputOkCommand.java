package Study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CanInputOkCommand implements CanInterface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 CanInputOkCommand 입니다");
		
		request.setAttribute("message", "회원가입이 완료되었습니다.");
		request.setAttribute("msg2", "CanInputOkCommand");
	}
}
