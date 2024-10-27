<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t07_sungjuk.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use strict';
  	
  	function calc() {
			/*if(name != /^[가-힣]$/) {
				alert("이름을 한글로 입력하세요");
				myform.name.focus();
			}
			 else if(hakbun != /^[a-zA-Z0-9]$/) {
				alert("학번을 다시 입력하세요");
				myform.hakbun.focus();
			}
			else if((kor != /^[=0-9]$/) ||(eng != /^[=0-9]$/) ||(mat != /^[=0-9]$/) 
							||(soc != /^[=0-9]$/) ||(sci != /^[=0-9]$/) || ) {
				alert("점수를 숫자로 입력하세요");
				myform.kor.focus();
			} */
  		myform.submit();
		}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>성적 자료</h2>
	<form name="myform" method="post" action="<%=request.getContextPath()%>/1016/T07_sungjukOk">
		<p>성명 : <input type="text" name="name" value="홍길동" class="form-control" autofocus required /> </p>
		<p>학번 : <input type="text" name="hakbun" value="G1234" class="form-control" required /> </p>
		<p>국어 : <input type="number" name="kor" value="100" class="form-control" required /> </p>
		<p>영어 : <input type="number" name="eng" value="90" class="form-control" required /> </p>
		<p>수학 : <input type="number" name="mat" value="80" class="form-control" required /> </p>
		<p>사회 : <input type="number" name="soc" value="70" class="form-control" required /> </p>
		<p>과학 : <input type="number" name="sci" value="60" class="form-control" required /> </p>
		<p>
			<div class="row">
				<div class="col"><input type="button" value="계산" onclick="calc()" class="btn btn-success" /></div>
				<div class="col"><input type="button" value="다시입력" onclick="location.reload()" class="btn btn-success" /></div>
			</div>
		</p>
	</form>
</div>
<p><br/></p>
</body>
</html>