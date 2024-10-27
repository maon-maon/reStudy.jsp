<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<%-- jsp 주석 --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test02.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	//1.자바스크립트 한 줄 주석
	/*2.자바스크립트 여러줄 주석 */
	</script>
	<!-- 3.html주석 -->
	<style>
	/* 4.css 주석 */
	</style>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>각 언어별 주석 예제</h2>
	<%
		int i=0, tot = 0;
		while(i<100) {
			i++;
			tot += i;
		}
	%>
	<div>1~100까지의 합은 <font color='red'><b><%=tot %>입니다.</b></font></div>
	<hr/>
	<%!
		public int hap(int su) {
			int hap = 0;
			for(int i=0; i<su; i++) {
				hap += i;
			}
			return hap;
		}
	%>
	<h3>1~?까지의 합은?</h3>
	<div>1~50까지의 합은?
		<%=hap(50) %>
	</div>
	<div>작업을 마칩니다.</div>
</div>
<p><br/></p>
</body>
</html>