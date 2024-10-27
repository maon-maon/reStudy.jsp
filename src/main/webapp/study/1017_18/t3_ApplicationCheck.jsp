<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = (String)application.getAttribute("aMid");
	String nick = (String)application.getAttribute("aNick");
	String name = (String)application.getAttribute("aName");
	
	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("nick", nick);
	pageContext.setAttribute("name", name);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t3_ApplicationCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>저장된 어플리케이션 확인</h2>
	<p>아이디 : ${mid}</p>
	<p>닉네임 : ${nick}</p>
	<p>성 명 : ${name}</p>
	<hr/>
	<p>세션 아이디 : <%=session.getId() %></p>
	<hr/>
	<p><a href="t3_Application.jsp" class="btn btn-primary">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>