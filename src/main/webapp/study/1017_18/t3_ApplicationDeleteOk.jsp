<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationDeleteOk.jsp -->
<%
	String applicationFalg = request.getParameter("applicationFalg");
	application.removeAttribute(applicationFalg);
%>
<script>
	alert("선택한 세션을 삭제하였습니다.");
	location.href="t3_Application.jsp"
</script>