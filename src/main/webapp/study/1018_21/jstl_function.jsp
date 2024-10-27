<%@page import="Study.j1018_21.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	String str = "Welcome to My Homepage!!!";
	pageContext.setAttribute("str", str);	
	
	String[] cards = {"국민","BC","LG","현대","삼성","농협","신한"};
	pageContext.setAttribute("cards", cards);
	
	MemberVO vo = null;
	ArrayList<MemberVO> vos = new ArrayList<>();
	
	vo = new MemberVO();
	vo.setName("홍길동");
	vo.setAge(25);
	vo.setGender("남자");
	vo.setJob("학생");
	vo.setAddress("서울");
	vos.add(vo);
	
	vo = new MemberVO();
	vo.setName("김말숙");
	vo.setAge(33);
	vo.setGender("여자");
	vo.setJob("의사");
	vo.setAddress("청주");
	vos.add(vo);
	
	pageContext.setAttribute("vos", vos);
	
	String tel = "010-1234-5678";
	pageContext.setAttribute("tel", tel);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstl_function.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/><p>
  <h2>JSTL Function 라이브러리</h2>
  <div>
  	str변수의 값? ${str}<br/>
  	1-1 str변수의 길이 : ${fn:length(str)}<br/>
  	1-2.cards배열의 길이(length) : ${fn:length(cards)}<br>
  	1-3.vos객체배열의 길이(length) : ${fn:length(vos)}<br>
  	
  	5-2.특정위치의 문자열 모두 검색 :<br/>
    <c:set var="cnt" value="0" />
    <c:forEach var="i" begin="0" end="${fn:length(str)-1}">
    	<c:if test="${fn:substring(str, i, i+1) == 'o'}">
    	  <c:set var="cnt" value="${cnt + 1}"/>
    	  <c:if test="${cnt % 2 == 0 }">
    	  	'o'문자의 위치값은? ${i}<br/>
    	  </c:if>
    	</c:if>
    </c:forEach>
    <br/>str변수의 'o'문자의 개수는 ${cnt} 개 있습니다.
    <hr/>
  	 6-2.str변수의 2번째 'o'문자의 위치만 구하시오.
    <c:set var="cnt" value="0" />
    <c:forEach var="i" begin="0" end="${fn:length(str)-1}">
    	<c:if test="${fn:substring(str, i, i+1) == 'o'}">
    		<c:set var="cnt" value="${cnt+1}"/>
   			<c:if test="${cnt % 2 == 0}">
   				두 번째 'o'의 위치는 : ${i}
   			</c:if>
    	</c:if>
    </c:forEach>
    
		<hr/>
  </div>
<p><br/><p>
</body>
</html>