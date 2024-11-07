package Study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Study2.ajax.AjaxIdCheck0Command;
import Study2.ajax.AjaxIdCheck1Command;
import Study2.ajax.AjaxPointCheckCommand;
import Study2.password.PassCheckOkCommand;
import Study2.pdstest.FileDeleteCommand;
import Study2.pdstest.FileDownloadCommand;
import Study2.pdstest.FileUpload1OkCommand;
import Study2.pdstest.FileUpload3OkCommand;
import Study2.pdstest.javaFileDownloadCommand;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study2";
	
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		if(com.equals("/PassCheckForm")) {
			viewPage += "/password/passCheck.jsp";
		}
		else if(com.equals("/PassCheckOk")) {
			command = new PassCheckOkCommand();
			command.execute(request, response);
			viewPage += "/password/passCheck.jsp";
		}
		else if(com.equals("/AjaxTest")) {
			viewPage += "/ajax/ajaxTest.jsp";
		}
		else if(com.equals("/AjaxIdCheck0")) {
			command = new AjaxIdCheck0Command();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AjaxIdCheck1")) {
			command = new AjaxIdCheck1Command();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AjaxPointCheck")) {
			command = new AjaxPointCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FileUpload")) {
			viewPage += "/pdstest/fileUpload.jsp";
		}
		else if(com.equals("/FileUpload1")) {
			viewPage += "/pdstest/fileUpload1.jsp";
		}
		else if(com.equals("/FileUpload1Ok")) {
			command = new FileUpload1OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpload3")) {
			viewPage += "/pdstest/fileUpload3.jsp";
		}
		else if(com.equals("/FileUpload3Ok")) {
			command = new FileUpload3OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileDownload")) {
			command = new FileDownloadCommand();
			command.execute(request, response);
			viewPage += "/pdstest/fileDownload.jsp";
		}
		else if(com.equals("/javaFileDownload")) {
			command = new javaFileDownloadCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FileDelete")) {
			command = new FileDeleteCommand();
			command.execute(request, response);
			return;
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
