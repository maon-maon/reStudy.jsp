<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionDeleteOk.jsp -->
<%
	String sessionFalg = request.getParameter("sessionFalg");
	session.removeAttribute(sessionFalg);
%>
<script>
	'use strict';
	alert("선택한 세션이 삭제되었습니다.");
	location.href="t2_Session.jsp";
</script>