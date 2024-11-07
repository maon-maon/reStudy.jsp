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

public class javaFileDownloadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest/");
		
		String fileName = request.getParameter("file")==null ? "" : request.getParameter("file");
		
		File file = new File(realPath + fileName);
		
		String mimeType = request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) response.setContentType("application/octet-stream");
		
		String downloadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downloadName = new String(fileName.getBytes("utf-8"), "8859_1");
		}
		else {
			downloadName = new String(fileName.getBytes("euc-kr"), "8859_1");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename="+downloadName);
		
		FileInputStream fis = new FileInputStream(file);
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] buffer = new byte[2048];
		int size = 0;
		while((size = fis.read(buffer)) != -1) {
			sos.write(buffer, 0, size);
		}
		sos.flush();
		sos.close();
		fis.close();
	
	}

}
