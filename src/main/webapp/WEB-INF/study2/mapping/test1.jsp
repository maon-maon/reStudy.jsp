<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script type="text/javascript">
  	'use strict';
	  $(function() {
	 		$("#demo1, #demo2, #demo3").hide();
	  	let flag = '${flag}';
				
			  if(flag == 1) {
					$("#demo1").show();
				}
				else if(flag == 3) {
					$("#demo2").show();
				}
				else if(flag == 4) {
					$("#demo3").show();
				}
	  });
  	
  	function fCheck(flag) {
			let su1 = myform.su1.value;
			let su2 = myform.su2.value;
  		switch (flag) {
				case 1:
					if(su1 == "" || su2 == "") {
						alert("수를 입력하세요");
						myform.su1.focus();
					}
					else {
						myform.flag.value = flag;
						myform.submit();
					}
					break;
				case 2:
					myform.action = "${ctp}/mapping/Test1"
					myform.submit();
					break;
				case 3:
					if(su1 == "" || su2 == "") {
						alert("수를 입력하세요");
						myform.su1.focus();
					}
					else {
						myform.flag.value = flag;
						myform.submit();
					}
					break;
				case 4:
					myform.flag.value = flag;
					myform.submit();
					break;				
			}
		}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<h2>이곳은 test1.jsp 입니다.(/WEB-INF/study2/mapping/test1.jsp)</h2>
	<hr/>
	<div>전송된 메세지 : ${msg}</div>	
	<hr/>
	<div class="row">
		<div class="col"><input type="button" value="두 수의 합/차" onclick="fCheck(1)" class="btn btn-outline-success mr-2"/></div>
		<div class="col"><input type="button" value="돌아가기" onclick="fCheck(2)" class="btn btn-outline-primary mr-2"/></div>
		<div class="col"><input type="button" value="두 수의 곱/몫" onclick="fCheck(3)" class="btn btn-outline-warning mr-2"/></div>
		<div class="col"><input type="button" value="현재시간" onclick="fCheck(4)" class="btn btn-outline-secondary mr-2"/></div>
	</div>
	<hr/>
	<div>
		<form name="myform" method="post" action="${ctp}/mapping/Test1Ok" >
			<input type="number" name="su1" value="${su1}" required placeholder="숫자를 입력하세요" class="form-control mb-2" />
			<input type="number" name="su2" value="${su2}" required placeholder="숫자를 입력하세요" class="form-control" />
			<input type="hidden" name="flag">			
		</form>
	</div>
	<hr/>
	<div id="demo1" name="demo2">
		<div>두 수의 합 : ${hap}</div>
		<div>두 수의 차 : ${cha}</div>
	</div>
	<div id="demo2" name="demo2">
		<div>두 수의 곱 : ${gop}</div>
		<div>두 수의 몫 : ${mok}</div>
	</div>
	<div id="demo3" name="demo3">
		<div>전송된 today : ${today}</div>
		<c:set var="strDate" value="${fn:substring(today, 0, 10)}" />
    <c:set var="strTime" value="${fn:substring(today, 11, 19)}" />
		<div>오늘 날짜 : ${strDate}</div>
    <div>현재시간 : ${strTime}</div>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>