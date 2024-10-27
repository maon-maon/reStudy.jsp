<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test06Ok.jsp -->
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	
	System.out.println("아이디 : " +mid);
	System.out.println("비밀번호 : " +pwd);
%>