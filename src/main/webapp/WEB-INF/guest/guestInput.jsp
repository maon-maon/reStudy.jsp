<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>GuestInput.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use strict';
  	
  	/* 이메일 , 홈페이지 유효성 검사 */
  	
  	function logIn() {
  		myform.submit();
		}
  </script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>방 명 록 작 성</h2>
	<form name="myform" method="post" action="GuestInputOk.gu" class="was-validated">
  <h2 class="text-center">로그인</h2>
	
		<div class="input-group mb-3">
			<div class="form-group-prepend"> 
				<div class="input-group-text">작성자 성명</div>
			</div>
			<input type="text" id="name" name="name" value="${sNickName}" class="form-control mb-2" required autofocus placeholder="성명을 입력하세요" />
			<div class="valid-feedback">입력 완료</div>
     	<div class="invalid-feedback">성명을 입력하세요</div>
		</div>
		
		<div class="input-group mb-3">
			<div class="form-group-prepend"> 
				<div class="input-group-text">이메일 입력</div>
			</div>
			<input type="text" id="email" name="email" class="form-control mb-2"  placeholder="이메일을 입력하세요"/>
		</div>
		<div class="input-group mb-3">
			<div class="form-group-prepend"> 
				<div class="input-group-text">홈페이지 등록</div>
			</div>
			<input type="text" id="homePage" name="homePage" value="http://" class="form-control mb-2"  placeholder="블로그/홈페이지 주소를 입력하세요"/>
		</div>
		
		<div class="input-group mb-3">
			<div class="form-group-prepend"> 
				<div class="input-group-text" style="height: 60px">방문소감</div>
			</div>
			<textarea row="3" id="content" name="content" class="form-control mb-2" required  placeholder="내용을 입력하세요"></textarea>
			<div class="valid-feedback">완료</div>
     	<div class="invalid-feedback">내용을 입력하세요</div>
		</div>
		
		<div class="row">
			<div class="col"><input type="button" value="등록하기" onclick="logIn()" class="btn btn-success form-control mb-2" ></div>
			<div class="col"><input type="button" value="다시입력" onclick="location.href='GuestInput.gu'" class="btn btn-warning form-control" ></div>
			<div class="col"><input type="button" value="돌아가기" onclick="location.href='GuestList.gu'" class="btn btn-primary form-control" ></div>
		</div>
		
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}">
		
	</form>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>