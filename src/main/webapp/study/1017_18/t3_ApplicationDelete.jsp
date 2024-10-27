<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t3_ApplicationDelete.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script type="text/javascript">
  	'use strict';
  	
  	function applicationDelete()  {
			let applicationFalg = document.getElementById("applicationFalg").value;
			
			if(applicationFalg == "") {
				alert("삭제할 어플리케이션을 선택하세요");
				return false;
			}
			location.href="t3_ApplicationDeleteOk.jsp?applicationFalg="+applicationFalg;
		}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>어플리케이션 부분 삭제</h2>
	<hr/>
	<select name="applicationFalg" id="applicationFalg" onchange="applicationDelete()">
		<option value="">선택</option>
		<option value="aMid">아이디</option>
		<option value="aNick">닉네임</option>
		<option value="aName">성 명</option>
	</select>
	<hr/>
	<p><a href="t3_Application.jsp" class="btn btn-info">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>