<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test05.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		'use strict';
		
		function fCheck() {
			let name = myform.name.value;
			let age = myform.age.value;
			
			if(name.trim() == "" || !/^[a-zA-Z가-힣]+$/.test(name)) {
				alert("이름을 한글이나 영문으로 입력하세요");
				myform.name.focus();
			}
			else if(age.trim() == "" || isNaN(age)) {
				alert("나이을 숫자로 입력하세요");
				myform.age.focus();
			}
			else {
				myform.submit();
			}
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" action="test05Ok.jsp" method="get">
	<!-- <form name="myform" action="test05Ok.jsp" method="post"> -->
	<fieldset>
		<legend>성명과 나이를 입력하세요</legend>
		<div>
			<label for="name">이름</label> 
			<input type="text" name="name" id="name" value="홍길동" class="form-control mb-2" required autofocus placeholder="이름을 입력하세요" />
		</div>
		<div>
		<label for="age">나이</label>  
			<input type="number" name="age" id="age" value="25" class="form-control mb-2" required placeholder="나이을 입력하세요" />
		</div>
		<div>
			<input type="button" value="전송" onclick="fCheck()" class="btn btn-dark form-control" />
		</div>
	</fieldset>	
	</form>
</div>
<p><br/></p>
</body>
</html>