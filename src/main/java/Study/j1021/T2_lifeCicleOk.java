package Study.j1021;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1021/T2_lifeCicleOk")
public class T2_lifeCicleOk extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 System.out.println("이곳은 service 메소드입니다.");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doGet 메소드입니다.");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doPost 메소드입니다.");
		doGet(request, response);
	}

	public void init(ServletConfig config) throws ServletException {
		System.out.println("이곳은 init 메소드입니다.");
	}
	
	public void destroy() {
		System.out.println("이곳은 destroy 메소드입니다.");
	}

	@PostConstruct
	public void initProcess() {
		System.out.println("이곳은 사용자지정 메소드 initProcess 입니다.");
	}
	
	@PreDestroy
	public void detroyProcess() {
		System.out.println("이곳은 사용자지정 메소드 detroyProcess 입니다.");
	}
}
