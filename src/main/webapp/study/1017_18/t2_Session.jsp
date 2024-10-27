<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_Session.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>세션 연습 메인 메뉴</h2>
	<form name="myform" method="post" action="t2_SessionSave.jsp">
		<div class="mb-2">아이디 :
			<input type="text" name="mid" id="mid" value="${sMid}" class="class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />		
		</div>
		<div class="mb-2">닉네임 :
			<input type="text" name="nick" id="nick" value="${sNick}" class="class="form-control mb-2" required placeholder="닉네임을 입력하세요" />		
		</div>
		<div class="mb-2">성 명 :&nbsp;&nbsp;
			<input type="text" name="name" id="name" value="${sName}" class="class="form-control mb-2" required placeholder="성명을 입력하세요" />		
		</div>
		<div class="row">
			<div class="col"><button type="submit" class="btn btn-success form-control mb-2">세션 저장</button></div>
			<div class="col"><a href="t2_SessionCheck.jsp" class="btn btn-primary">세션 확인</a></div>
			<div class="col"><a href="t2_SessionAllClear.jsp" class="btn btn-danger">세션 전체삭제</a></div>
			<div class="col"><a href="t2_SessionDelete.jsp" class="btn btn-warning">세션 부분삭제</a></div>
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>