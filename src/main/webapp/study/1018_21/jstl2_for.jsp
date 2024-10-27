<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl2_for.jsp</title>
<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/><p>
  <p>사용법1</p>
  <c:forEach var="i" begin="0" end="10">
  	${i } /
  </c:forEach>
  <hr><br>
  
 <%
 	String[] cards = {"국민","BC","LG","현대","삼성","농협","신한"};
 	pageContext.setAttribute("cards", cards);
 %> 
  <p>사용법2</p>
  <c:forEach var="card" items="${cards}">
  	${card} /<br>  
  </c:forEach>
  <hr><br>

  <p>사용법3</p>
  	<c:set var="hobbys" value="등산/수영/낚시/바둑/독서/승마/바이크"/>
  	${hobbys} <br/>
  	<c:forTokens var="hobby" items="${hobbys}" delims="/">
  		${hobby} ,
  	</c:forTokens>
  <hr><br>

  <p>사용법4(상태변수 사용예)</p>
  <c:forEach var="card" items="${cards}" varStatus="st">
		${st.count}(${st.index}) : ${card} 	a.${st.current}, b.${st.first} , c.${st.last}<br/>
  </c:forEach>
  <hr><br>

  <h5>1.구구단 5단을 출력하세요</h5>
	* 5 단 *<br/>
	<c:forEach var="i" begin="1" end="9">
		5 * ${i} = ${5*i}<br>
	</c:forEach>
  <hr><br>

  <h5>2.구구단 2~5단을 출력하세요</h5>
	<c:forEach var="i" begin="2" end="5">
		<c:forEach var="j" begin="1" end="9">
			${i} * ${j} = ${i * j} /
		</c:forEach>
		<br/>
	</c:forEach>
  <hr><br>

  <p>3.저장된 사진 출력</p>
  <c:forEach var="i" begin="250" end="255" varStatus="st">
  	<img src="${ctp}/images/${i}.jpg" width="100px"> &nbsp;
  	<c:if test="${st.count % 3 == 0}"><br/><br/></c:if>
  </c:forEach>
  <hr><br>

  <p>4. 2차원형식의 배열에 저장된 자료를 한행에 3개씩 출력해보자</p>
 <%
 String[][] members = {
			{"홍길동","서울","23"},
			{"김말숙","청주","31"},
			{"이기자","제주","40"},
			{"오하늘","서울","20"},
			{"강감찬","인천","50"}
	};
 
 	pageContext.setAttribute("members", members);
 %>
 <c:forEach var="member" items="${members}" varStatus="st">
 	<c:forEach var="m" items="${member}">
 		${m} /
 	</c:forEach>
 	<br/> 
 </c:forEach>
 <hr><br>

  <p>5. 2차원형식의 배열에 저장된 자료를 한행에 3개씩 출력해보자('서울'에 사는 자료만 빨강색으로 출력하시오.)</p>
  <c:forEach var="member" items="${members}" varStatus="st">
	 	<c:forEach var="m" items="${member}">
	 		<c:if test="${m == '서울'}"><font color="blur">${m}</font></c:if>
	 		<c:if test="${m != '서울' }">${m}</c:if>
	 	</c:forEach>
 	<br/> 
 </c:forEach>
  <hr><br>

  <p>8. cards의 내용중, '국민'카드는 파랑색, '삼성'카드'는 빨강색, 첫번째카드의 배경은 '노랑', 마지막카드배경은 '하늘'색 출력하시오.</p>
  <!-- 셀프완성 -->
  <c:forEach var="card" items="${cards}" varStatus="st">
  		<c:if test="${card =='국민'}"><font color="blue"><b>${card}</b></font></c:if>
  		<c:if test="${card =='삼성'}"><font color="red"><b>${card}</b></font></c:if>
  		<c:if test="${st.first}"><span style="background-color: yellow">${card}</span></c:if>
  		<c:if test="${st.last}"><span style="background-color: skyblue">${card}</span></c:if>
  		<c:if test="${c !='국민' && c !='삼성' && !st.first && !st.last}">${card}</c:if>
  </c:forEach>
  <hr><br>



  <p>사용법</p>
  <hr><br>
<p><br/><p>
</body>
</html>