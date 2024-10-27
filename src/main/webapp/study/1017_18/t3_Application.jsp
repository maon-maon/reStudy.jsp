<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t3_Application.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>어플리케이션 연습 메인 메뉴</h2>
	<form name="myform" method="post" action="t3_ApplicationSave.jsp">
		<div class="mb-2">아이디 :
			<input type="text" name="mid" id="mid" value="${aMid}" class="class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />		
		</div>
		<div class="mb-2">닉네임 :
			<input type="text" name="nick" id="nick" value="${aNick}" class="class="form-control mb-2" required placeholder="닉네임을 입력하세요" />		
		</div>
		<div class="mb-2">성 명 :&nbsp;&nbsp;
			<input type="text" name="name" id="name" value="${aName}" class="class="form-control mb-2" required placeholder="성명을 입력하세요" />		
		</div>
		<div class="row">
			<div class="col"><button type="submit" class="btn btn-success form-control mb-2">어플리케이션 저장</button></div>
			<div class="col"><a href="t3_ApplicationCheck.jsp" class="btn btn-primary">어플리케이션 확인</a></div>
			<div class="col"><a href="t3_ApplicationDelete.jsp" class="btn btn-warning">어플리케이션 부분삭제</a></div>
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>