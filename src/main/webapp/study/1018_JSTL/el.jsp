<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>el.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>EL(Expression Language)</h2>
	<p>저장소(서버 저장소 : ServletContext컨테이너)에 기록되어 있는 자료에 대한 처리를 담당</p>
	<hr/>
	<pre>
		용도 : 사용자가 '변수/값/수식/객체'등을 서버에 전송받은 후에 저장(request/session/application) 또는 처리한 후 Client로 전송된 자료를 화면에 표시
		표기법 : $ { 변수/값/수식/객체 }
	</pre>
	<hr/>
	<p>사용할 변수 선언</p>
<%
	String atom = "Seoul";
	String name = "홍길동";
	int su1=100, su2=200;
	int res = su1 * su2;
	String su3="300", su4="400";
%>
	<h2>스크릿틀릿을 이용한 출력</h2>
	<div>
		<%="안녕!!" %><br/>
		atom = <%=atom %><br/>
		name = <%=name %><br/>
		su1 = <%=su1 %><br/>
		su2 = <%=su2 %><br/>
		res = <%=res %><br/>
		su1 *  su2 = <%=su1 *  su2 %><br/>
		su1 +  su2 = <%=su1 +  su2 %><br/>
		su3 +  su4 = <%=su3 +  su4 %><br/>
	</div>


<p>스크릿틀릿의 값을 EL표기법으로 사용하기 위해</p>
<%
	pageContext.setAttribute("atom", atom);
%>
	<h2>EL을 이용한 출력</h2>
	<div>
		${"안녕"}<br/>
		atom = ${atom}<br/>
	</div>
	<hr/>
	<h4>파라메터(parameter)를 통해서 넘어온 값의 처리(?변수1=값1&변수2=값2 ==QueryString형식)</h4>
	<div>주소창에 현재주소 뒤에 '?mbc=200&kbs=50'을 입력수 확인하시오</div>
<%
	String mbc = request.getParameter("mbc");
	String kbs = request.getParameter("kbs");
	
	pageContext.setAttribute("mbc", mbc);
%>
	mbc = <%=mbc%><br/>
	kbs = <%=kbs%><br/>
	
	mbc = ${param.mbc}<br/>
	<hr/>
</div>
<p><br/></p>
</body>
</html>