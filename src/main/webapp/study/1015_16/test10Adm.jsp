<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test10Adm.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/logoutCheck.js"></script>
  <%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/center.css"> --%>
  <script>
  	'use strict'
  	
  	if('<%=mid%>' == '') {
			alert("로그인 후 사용 가능합니다.");
			location.href = "test10.jsp"
  	}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>이곳은 관리자 화면입니다.<font color="blue"><b><%=mid %></b></font></h2>
	<hr>
	<div><img src="<%=request.getContextPath()%>/images/243.jpg" width="500px" alt="노란꽃한송이사진" ></div>
	<hr/>
	<div><a href="javascript:logoutCheck('test10.jsp')" class="btn btn-success">로그아웃</a></div>
</div>
<p><br/></p>
</body>
</html>