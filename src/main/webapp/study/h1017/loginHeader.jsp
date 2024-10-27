<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	'use strict'
	
	if('${sMid}' == '') {
		alert("로그인 후 사용 가능합니다.");
		location.href = "ex01Login.jsp"
	}
	function logoutCheck() {
		alert("로그아웃합니다.");
		location.href = "ex01Login.jsp";
	}
  </script>
  
  <div style="width: 100%; height: 100px; background-color: lightgreen;">
  	<div style="text-decoration:underline; ">
  		접속자 : <font color="white"><b>${sMid}</b></font> &nbsp;
  		소속부서 : <font color="white"><b>${sTeam}</b></font>
  	</div>
  	<br/>
  	<nav style="text-align: center; padding: 0px, 50%;">
  		| <a href="ex01Board.jsp">사원게시판</a> | <a href="ex01Guest.jsp">방명록</a> | <a href="ex01Pds.jsp">자료실</a> |
  		  <a href="javascript:logoutCheck()">로그아웃</a> |
  	</nav>
  </div>