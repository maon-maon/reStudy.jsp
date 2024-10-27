<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01Login.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
  	'use strict';
  	
  	function logIn() {
  		let reg = /^[a-zA-Z]*$/;
  		let mid = myform.mid.value;
			if (!reg.test(mid)) {
				alert("아이디를 다시 입력해주세요");
				myform.mid.focus();
				return false
			}		 
  		myform.submit();
		}
  	if("${message}" != null){
  	alert("${message}");
  	}
  </script>
</head>
<body>
<p><br/><p>
	<form name="myform" method="post" action="<%=request.getContextPath() %>/1017/loginOk">
  <h2 class="text-center">로그인</h2>
	<p class="text-center">(부서명 : 인사과(I), 자재과(J), 생산과(S), 총무과(C))</p>
		<div class="input-group mb-3">
			<div class="form-group-prepend"> 
				<div class="input-group-text">아이디</div>
			</div>
			<input type="text" id="mid" name="mid" value="adminI" class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />
		</div>
		<div class="input-group mb-3">
			<div class="form-group-prepend"> 
				<div class="input-group-text">비밀번호</div>
			</div>
			<input type="password" id="pwd" name="pwd" value="1234" class="form-control mb-2" required placeholder="비밀번호를 입력하세요"/>
		</div>
		<div class="row">
			<div class="col"><button type="button" onclick="logIn()" class="btn btn-success form-control mb-2" >로그인</button></div>
			<div class="col"><button type="reset" class="btn btn-warning form-control" >다시입력</button></div>
		</div>
	</form>
<p><br/><p>
</body>
</html>