<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>guestAdmin.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/><p>
  	<h2>관 리 자 로 그 인</h2>
	<form name="myform" method="post" action="GuestAdminOk.gu">
		<div>아이디 : 
			<input type="text" id="mid" name="mid" value="admin" class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />
		</div>
		<div>비밀번호: 
			<input type="password" id="pwd" name="pwd" value="1234" class="form-control mb-2" required placeholder="비밀번호를 입력하세요"/>
		</div>
		<div class="row">
			<button type="submit" class="btn btn-outline-success form-control col" >로그인</button>
			<button type="reset" class="btn btn-outline-warning form-control col" >다시입력</button>
			<button type="button" onclick="location.href='GuestList.gu'" class="btn btn-outline-primary form-control col" >돌아가기</button>
		</div>
	</form>
<p><br/><p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>