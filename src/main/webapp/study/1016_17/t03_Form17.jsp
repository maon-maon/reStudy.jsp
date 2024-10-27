<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t03_Form.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script >
  	'use strict';
  	
  	function fCheck(flag) {
  		myform.flag.value = flag;
  		myform.submit();
		}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>폼태그를 이용한 값의 전달연습</h2>
	<hr/>
	<form name="myform" method="post" action="<%=request.getContextPath()%>/1016/T03Ok17">
		<div class="mb-3">성명
			<input type="text" name="name" value="홍길동" class="form-control mb-3" autofocus required placeholder="성명을 입력하세요" />
		</div>
		<div class="mb-3">나이
			<input type="number" name="age" value="23" class="form-control mb-3" />
		</div>
		<div class="mb-3">성별 &nbsp;&nbsp;
			<input type="radio" name="gender" value="남자" checked />남자&nbsp;&nbsp;
			<input type="radio" name="gender" value="여자" />여자
		</div>
		<div class="mb-3">취미 &nbsp;&nbsp;
			<input type="checkbox" name="hobby" value="등산" checked />등산 &nbsp;
			<input type="checkbox" name="hobby" value="낚시" checked />낚시 &nbsp;
			<input type="checkbox" name="hobby" value="수영" checked />수영 &nbsp;
			<input type="checkbox" name="hobby" value="배드민턴" checked />배드민턴 &nbsp;
			<input type="checkbox" name="hobby" value="바이크" checked />바이크 &nbsp;
			<input type="checkbox" name="hobby" value="바둑" checked />바둑 &nbsp;
		</div>
		<div class="mb-3">직업
			<select name="job" id="job">
				<option value="">선택</option>				
				<option>회사원</option>				
				<option>공무원</option>				
				<option>학생</option>				
				<option>군인</option>				
				<option>자영업</option>				
				<option>기타</option>				
			</select>
		</div>
		<div class="mb-3">가본 산
			<select name="mountain" id="mountain" size="5" multiple>
				<option>한라산</option>				
				<option>태백산</option>				
				<option>소백산</option>				
				<option>우암산</option>				
				<option>속리산</option>				
				<option>대둔산</option>				
				<option>북한산</option>				
			</select>
		</div>
		<div class="mb-3"> 자기소개
			<textarea row="6" name="content" id="content" class="form-control" ></textarea>			
		</div>
		<div class="mb-3">첨부파일
			<input type="file" name="fname" id="fname" class="form-control-file border">
		</div>
		<div>
			<input type="button" value="전송1" onclick="fCheck(1)" class="form-control btn btn-success mb-2" />
			<input type="button" value="전송2" onclick="fCheck(2)" class="form-control btn btn-success mb-2" />
			<input type="button" value="전송3" onclick="fCheck(3)" class="form-control btn btn-success" />
		</div>
		<input type="hidden" name="flag" >
	</form>
</div>
<p><br/></p>
</body>
</html>