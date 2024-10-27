<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test2.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>URL패턴(확장자 패턴) - .can(임의로 명명 가능)</h2>
	<hr/>
	<div>전송 메세지 : ${msg}</div> <!-- 컨트롤러 전송 -->	
	<div>전송 메세지2 : ${msg2}</div> <!-- 프론트컨트롤러 전송 -->	
	<hr/>
	<div>
		<a href="list.can?msg=list" class="btn btn-outline-success mr-3">list.can(전체)</a>
		<a href="search.can?msg=search" class="btn btn-outline-secondary mr-3">search.can(개별)</a>
		<a href="input.can?msg=input" class="btn btn-outline-primary mr-3">input.can(가입)</a>
		<a href="update.can?msg=update" class="btn btn-outline-dark mr-3">update.can(수정)</a>
		<a href="delete.can?msg=delete" class="btn btn-outline-danger mr-3">delete.can(삭제)</a>
	</div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>