<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'usr strict';
  	
  	function nameSearch() {
			let name =  document.getElementById("name").value;
			if(name.trim() == "") {
				alert("입력하세요");
				document.getElementById("name").focus;
			}
			else location.href = "${ctp}/study2/database/DbList?name="+name;
		}
  </script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<div class="row">
		<div class="col"><a href="${ctp}/study2/database/DbInput" class="btn btn-outline-primary">회원가입</a></div>
		<div class="col text-right"><a a href="${ctp}/study2/database/DbList" class="btn btn-outline-warning">전체검색</a></div>
	</div>
	<br/>
	<h2 class="text-center">회 원 리 스 트</h2>
	<br/>
	<div class="col">
		<div class="input-group">
			<div class="input-group-prepend"><div class="input-group-text">성명검색</div></div>
			<input type="text" name="name" id="name" class="form-control" />
			<div class="input-group-append"><input type="button" value="검색" onclick="nameSearch()" class="btn btn-outline-dark"/></div>	
		</div>
	</div>
	<br/>
	<div>
		<table class="table table-hover text-center">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>거주국</th>
				<th>주소</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<%-- <td>${vo.idx}</td> --%>
					<td>${st.count}</td>
					<td>${vo.name}</td>
					<td>${vo.age}</td>
					<td>${vo.nation}</td>
					<td>${vo.address}</td>
				</tr>
			</c:forEach>
			<tr><td colspan="5" class="m-0 p-0"></td></tr>
		</table>
	</div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>