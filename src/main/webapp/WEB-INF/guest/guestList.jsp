<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>guestList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-2021.css">
	<script>
		'use strict'
		function deleteCheck(idx) {
			let ans = confirm("현 방명록 삭제")
			if(ans) location.href = "GuestDeleteOk.gu?idx="+idx;
		}
	</script>
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
			<td class="text-center">
				<c:if test="${pag > 1}">
					<a href="GuestList.gu?pag=1" title="첫페이지">◁◁</a>
					<a href="GuestList.gu?pag=${pag-1}" title="이전페이지">◀</a>
				</c:if>
				${pag} / ${totPage}
 				<c:if test="${pag < totPage}">
					<a href="GuestList.gu?pag=${pag+1}" title="다음페이지">▶</a>
					<a href="GuestList.gu?pag=${totPage}" title="마지막페이지">▷▷</a>
				</c:if>
				
			</td>
			<td class="text-right">
				<c:if test="${sAdmin != 'admOk' }"><a href="GuestAdmin.gu" class="btn btn-outline-warning">관리자로그인</a></c:if>
				<c:if test="${sAdmin == 'admOk' }"><a href="GuestAdminOut.gu" class="btn btn-outline-primary">관리자로그아웃</a></c:if>
			</td>
		</tr>
	</table>
	<!-- 방명록 내용 -->
	
	<%-- <c:set var="guestNo" value="${guestCnt}" /> --%>
	<c:set var="curScrStartNo" value="${curScrStartNo}" />
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<table class="table table-borderless">
			<tr>
				<td class="text-left">번호 : ${curScrStartNo}
					<c:if test="${sAdmin == 'admOk'}"><a href="javascript:deleteCheck(${vo.idx})" class="btn btn-outline-danger">삭제</a></c:if>
				</td>
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
				<td colspan="3">${fn:replace(vo.content, newLine, "<br/>")}</td>
			</tr>
		</table>
		<c:set var="curScrStartNo" value="${curScrStartNo -1}" />
	</c:forEach>
	
	<!-- 하단 페이지 버튼 -->
	
	<div class="text-center">
		<c:if test="${pag > 1}">[<a href="GuestList.gu?pag=1">첫페이지</a>]</c:if>
		
		<c:if test="${pag < totPage}">[<a href="GuestList.gu?pag=${totPage}">마지막페이지</a>]</c:if>
	</div>	
	
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>