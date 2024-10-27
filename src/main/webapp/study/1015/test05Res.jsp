<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test05Ok.jsp -->
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	out.println("성명 : " + name);
	out.println("<br/>나이 : " + age);
	out.println("<br/><a href='test05.jsp'>돌아가기</a>");
%>