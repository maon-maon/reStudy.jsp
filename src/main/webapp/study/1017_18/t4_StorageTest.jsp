<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int aCount = application.getAttribute("aCount")==null ? 0 : (int)application.getAttribute("aCount");
	int sCount = session.getAttribute("sCount")==null ? 0 : (int)session.getAttribute("sCount");
	
	aCount++;
	sCount++;
	
	application.setAttribute("aCount", aCount);
	session.setAttribute("sCount", sCount);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t4_StorageTest.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>방문자카운트 비교하기</h2>
	<hr/>
	<p>어플리케이션 카운트 : ${aCount}</p>
	<hr/>
	<p>세션 카운트 : ${sCount}</p>
	<hr/>
	<p>
		<a href="t4_ApplicationClear.jsp" class="btn btn-success">어플리케이션 카운트 초기화</a>
		<a href="t4_SessionClear.jsp" class="btn btn-primary">세션 카운트 초기화</a>
		<br/><br/>
		<a href="javascript:location.reload()" class="btn btn-info">방문수 증가1(새로고침)</a>
		<a href="t4_StorageTest.jsp" class="btn btn-warning">방문수 증가2(셀프 호출)</a>
	</p>
</div>
<p><br/></p>
</body>
</html>