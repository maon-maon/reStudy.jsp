<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>guestList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-2021.css">
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center" >방 명 록 리 스 트</h2>
	<!-- 글쓰기 / 관리자 버튼 -->
	<table class="table table-boderless m-0 p-0" >
		<tr class="text-left">
			<td>
				<a href="GuestInput.gu" class="btn btn-outline-dark">방명록 작성</a>
			</td>
			<td>
				페이지 버튼1
			</td>
			<td class="text-right">
				<a href="GuestAdmin.gu" class="btn btn-outline-warning">관리자로그인</a>
			</td>
		</tr>
	</table>
	<!-- 방명록 내용 -->
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<table class="table table-borderless">
			<tr>
				<td class="text-left">번호 : ${vo.idx}</td>
				<td class="text-right">방문자IP : ${vo.hostIp}</td>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<th style="width: 100px">작성자</th>
				<td> ${vo.name}</td>
				<th style="width: 100px">방문일자</th>
				<td> ${vo.visitDate}</td>
			</tr>
			<tr>
				<th>Email</th>
				<td colspan="3">${vo.email}</td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td colspan="3">${vo.homePage}</td>
			</tr>
			<tr>
				<th>방문소감</th>
				<td colspan="3">${vo.content}</td>
			</tr>
		</table>
	</c:forEach>
	<!-- 하단 페이지 버튼 -->
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>