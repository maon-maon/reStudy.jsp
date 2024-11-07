package Study2.pdstest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Study2.StudyInterface;

public class FileUpload3OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		int maxSize = 1024 * 1024 * 20;
		String encoding = "utf-8";
		
		MultipartRequest multipartRequest  = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());

		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String)fileNames.nextElement();
			originalFileName += multipartRequest.getOriginalFileName(file);
			filesystemName += multipartRequest.getFilesystemName(file);
		}
		
	//System.out.println("원본 파일명 집합 : "+ofName);
	//System.out.println("서버 파일명 집합 : "+fsName);
	//System.out.println("fName : " + multipartRequest.getParameter("fNames"));
		
		if(!originalFileName.equals("")) {
			request.setAttribute("message", "파일 업로드 완료");
		}
		else {
			request.setAttribute("message", "파일 업로드 실패");
		}
		request.setAttribute("url", "FileUpload3.st");
		
	}

}
