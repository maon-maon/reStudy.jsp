package Study2.pdstest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Study2.StudyInterface;

public class FileDownloadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		
		String[] files = new File(realPath).list();

//		for(String file: files) {
//			System.out.println("file : "+file);
//		}
		
		request.setAttribute("files", files);
		
	}

}