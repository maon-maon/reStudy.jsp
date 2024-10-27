<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String mid = (String) session.getAttribute("sMid");
	String nick = (String)session.getAttribute("sNick");
	String name = (String)session.getAttribute("sName");
	
	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("nick", nick);
	pageContext.setAttribute("name", name);
	
	Enumeration enumCk = session.getAttributeNames();
	String sessionName ="";
	String sessionName_ ="";
	String sessionValue ="";
	
	while(enumCk.hasMoreElements()) {
		sessionName_ = enumCk.nextElement().toString();
		sessionName += sessionName_ + "/";
		sessionValue += session.getAttribute(sessionName_) + "/";
	}
	System.out.println(sessionName +" \n"+sessionValue);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_SessionCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>세션값 출력</h2>
	<p>아이디 : ${mid}</p>
	<p>닉네임 : ${nick}</p>
	<p>성 명 : ${name}</p>
	<hr/>
	<p>세션 아이디 : <%=session.getId() %></p>	
	<hr/>
	<p><a href="t2_Session.jsp" class="btn btn-info">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>