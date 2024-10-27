<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_SessionDelete.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use srtict';
  	
  	function sessionDelete() {
		let sessionFalg = $("#sessionFalg").val();
		
		if(sessionFalg == "") {
			alert("삭제할 세션을 선택하세요");
		}
		else {
			location.href="t2_SessionDeleteOk.jsp?sessionFalg="+sessionFalg;
		}
	}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>세션 부분 삭제</h2>
	<hr/>
	<select name="sessionFalg" id="sessionFalg" onchange="sessionDelete()">
		<option value="">선택</option>
		<option value="sMid">아이디</option>
		<option value="sNick">닉네임</option>
		<option value="sName">성 명</option>
	</select>
	<hr/>
	<p><a href="t2_Session.jsp" class="btn btn-info">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>