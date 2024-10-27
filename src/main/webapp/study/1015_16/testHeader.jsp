<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid"); %>

<script>
	'use strict'
	
	if('<%=mid%>' == '') {
		alert("로그인 후 사용 가능합니다.");
		location.href = "test10.jsp"
	}
	function logoutCheck() {
		alert("로그아웃합니다.");
		location.href = "test10.jsp";
	}
  </script>
  
  <div style="width: 100%; height: 80px; background-color: beige;">
  	<div style="text-decoration:underline; ">접속자 : <font color="blue"><b><%=mid %></b></font></div>
  	<nav style="text-align: center; padding: 0px, 50%;">
  		| <a href="test10Mem.jsp?mid=<%=mid%>">홈으로</a> | <a href="test10Board.jsp?mid=<%=mid%>">게시판</a> | <a href="test10Guest.jsp?mid=<%=mid%>">방명록</a> | <a href="test10Pds.jsp?mid=<%=mid%>">자료실</a> | <a href="javascript:logoutCheck()">로그아웃</a> |
  	</nav>
  </div>