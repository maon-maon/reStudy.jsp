<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test03.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSP 파일 호출</h2>
	<form action="/reStudy/study/1015/test03Ok.jsp" method="post">
		<input type="submit" value="전송" class="btn btn-secondary"/>
		<hr/>
		<div><a href="http://localhost:9090/reStudy/study/1015/test03Ok.jsp" class="btn btn-info">T3Ok호출(get)</a></div>
	</form>
</div>
<p><br/></p>
</body>
</html>