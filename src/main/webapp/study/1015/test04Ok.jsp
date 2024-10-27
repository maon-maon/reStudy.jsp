<%-- <%@page import="java.util.Date"%> --%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/* new Date(); */
	java.util.Date today = new java.util.Date();
	out.println("<div><a href='test04.jsp' class='btn btn-success' />test04.jsp</a></div>");
	out.println("<hr/>");
	out.println("오늘 날짜 : " + today);
	
	LocalDate currentDate = LocalDate.now();
	out.println("<br/>오늘 날짜는? " + currentDate);
	
	LocalDateTime dateTime = LocalDateTime.now();
	out.println("<br/>1.현재 시간은? " + dateTime);
	out.println("<br/>2.현재 시간은? " + dateTime.toString().substring(11,19));
	out.println("<div><input type='button' value='새로고침' onclick='location.reload()' class='btn btn-warning' /></div>");
%>