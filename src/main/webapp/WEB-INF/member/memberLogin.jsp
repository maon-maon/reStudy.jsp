<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberLogin.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  /* 아이디 유효성 검사 */
  	'use strict';
  	let reg = /^[a-zA-Z0-9].$/ 
  	if ()
  </script>
<style>
	th {
		text-align: center;
		background-color: #DAE5DB;
	}
	#subject {
		background-color: #eee;    
	}
</style>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center mb-4">회 원 로 그 인</h2>
	<form name="myform" method="post" action="MemberLoginOk.mem">
		<table class="table table-bordered">
			<tr>
				<th>아이디</th> 
				<td>
					<input type="text" id="mid" name="mid" value="${mid}" class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="pwd" name="pwd" value="1234" class="form-control mb-2" required placeholder="비밀번호를 입력하세요"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
		      <button type="submit" class="btn btn-outline-success  mb-2" >로그인</button>
		      <button type="reset" class="btn btn-outline-warning  mb-2" >다시입력</button>
		      <button type="button" onclick="location.href='${ctp}/'" class="btn btn-outline-primary ">돌아가기</button>
		      <button type="button" onclick="location.href='MemberJoin.mem'" class="btn btn-outline-secondary " >회원가입</button>
		    	<input type="checkbox" name="idSave" checked /> 아이디 저장
		    </td>
		  </tr> 
		</table>
		<div class="text-center">
		  <a href="#" class="badge badge-secondary">아이디찾기</a> |
		  <a href="#" class="badge badge-secondary">비밀번호찾기</a>
		</div>
	</form>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>