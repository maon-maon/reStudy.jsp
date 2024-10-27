<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String name = request.getParameter("name");
  String age = request.getParameter("age");
  String gender = request.getParameter("gender");
  String hobby = request.getParameter("hobby");
  String job = request.getParameter("job");
  String mountain = request.getParameter("mountain");
  String content = request.getParameter("content");
  String fName = request.getParameter("fname");
  String title = request.getParameter("title");
  if(title == null) title = (String) request.getAttribute("title");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t03_res.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2 class="text-center">전송된 자료</h2>
	<hr/>
	<table class="table table-bordered">
    <tr>
      <th>성명</th>
      <td><%=name%> : ${name}</td><!-- sendRi에선 표현식은 출력. diaptch로 넘어건 EL표기법사용  -->
    </tr>
    <tr>
      <th>나이</th>
      <td><%=age%> : ${age}</td>
    </tr>
    <tr>
      <th>성별</th>
      <td><%=gender%></td>
    </tr>
    <tr>
      <th>취미</th>
      <td><%=hobby%></td>
    </tr>
    <tr>
      <th>현재직업</th>
      <td><%=job%></td>
    </tr>
    <tr>
      <th>다녀온산</th>
      <td><%=mountain%></td>
    </tr>
    <tr>
      <th>자기소개</th>
      <td><%=content%></td>
    </tr>
    <tr>
      <th>첨부파일</th>
      <td><%=fName%></td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
        <input type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/study/1016_17/t03_Form17.jsp';" class="form-control btn-success"/>
      </td>
    </tr>
  </table>
</div>
<p><br/></p>
</body>
</html>