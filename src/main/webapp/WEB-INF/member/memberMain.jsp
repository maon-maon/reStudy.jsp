<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberMain.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>회 원 전 용 방</h2>
	<hr/>
	<div>현재 <font color="brown"><b>${sNickName}(<font color="green">${strLevel}</font>)</b></font>님 로그인 중입니다.</div>
	<hr/>
	<c:if test="${sLevel == 1}">
		<div><font color="brown">정회원 등업조건 : <u>총 방문횟수 <b>10회</b>이상</u>, <u>방명록에 글쓰기 <b>2회</b>이상</u></font></div>
	</c:if>
	<hr/>
	<div>총 방문횟수 : : <font color="brown"><b>${mVo.visitCnt}</b>회</font></div>
	<div>오늘 방문횟수  : <font color="brown"><b>${mVo.todayCnt}</b>회</b></font></div>
	<div>최종 방문일 : : <font color="brown"><b>${fn:substring(mVo.lastDate,0,10)}</b></font></div>
	<div>총 보유 포인트 : <font color="brown"><b>${mVo.point}</b>포인트</font></div>
	<hr/>
	<div>방명록에 작성한글 수 : <font color="brown">총<b> ${guestCnt}</b>개</b></font></div>
	<hr/>
	<div>회원 사진 : <img src="${ctp}/images/${mVo.photo}" width="300px"></div>
	<hr/>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>