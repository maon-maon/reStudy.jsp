<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-sm" style="background-color:#1E7825 ; color:white;">
  <%-- <a class="navbar-brand" href="${ctp}/">Home</a> --%>
  <a class="navbar-brand" href="http://192.168.50.52:9090/reStudy">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="GuestList.gu">Guest</a>
      </li>
			<%-- <c:if test="${!empty sNickName}"> --%>     
	      <li class="nav-item">
	        <a class="nav-link" href="BoardList.bo">Board</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Pds</a>
	      </li>    
	      <li class="nav-item mr-2">
					<div class="dropdown">
				    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
				      Study1
				    </button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="${ctp}/study2/mapping/Test1">mapping 연습(Directory 패턴)</a>
				      <a class="dropdown-item" href="${ctp}/study2/mapping/Test2">mapping 연습(확장자 패턴)</a>
				      <a class="dropdown-item" href="${ctp}/study2/test/StorageMenu">Storage 연습</a> <!-- 스토리지 호출 컨트롤러 줒 주소로 넣음 -->
				      <a class="dropdown-item" href="${ctp}/study/1018_JSTL/el.jsp">EL연습</a>
				      <a class="dropdown-item" href="${ctp}/study2/test/JstlMenu">JSTL연습</a> <!-- 컨트롤러(JstlMenu)가 각jstl페이지를 연결 -->
				      <%-- <a class="dropdown-item" href="${ctp}/study/1018_JSTL/jstlMenu.jsp">JSTL연습</a> --%>
				      <a class="dropdown-item" href="${ctp}/study2/database/DbList">Database 연습</a>
				      <a class="dropdown-item" href="PassCheckForm.st">암호화 연습</a>
				      <a class="dropdown-item" href="AjaxTest.st">AJAX 연습</a>
				      <a class="dropdown-item" href="FileUpload.st">파일 업로드 연습</a>
				    </div>
				  </div>
	      </li>  
	      
	      <li class="nav-item">
					<div class="dropdown">
				    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
				      MyPage
				    </button>
				    <div class="dropdown-menu">
				     	<a class="dropdown-item" href="MemberMain.mem">회원메인방</a>
				      <a class="dropdown-item" href="MemberUpdate.mem">회원정보수정</a>
				      <a class="dropdown-item" href="javascript:memberDelete()">회원탈퇴</a> 
				      <c:if test="${sLevel > 1}">
					      <a class="dropdown-item" href="MemberList.mem">회원리스트</a>
					      <a class="dropdown-item" href="">쪽지보내기</a>
					      <a class="dropdown-item" href="">일정관리</a>
				      </c:if>
				      <a class="dropdown-item" href="">포인트 사용 내역</a>
				      <c:if test="${sLevel == 0}">
					      <a class="dropdown-item" href="#">관리자메뉴</a> 
				      </c:if>
				    </div>
				  </div>
	      </li>  
      <%-- </c:if> --%>
       
      <li class="nav-item">
	      <c:if test="${empty sNickName}"><a class="nav-link" href="MemberLogin.mem">로그인</a></c:if>
	      <c:if test="${!empty sNickName}"><a class="nav-link" href="MemberLogout.mem">${sMid}님 로그아웃</a></c:if>
      </li>  
      
      <li class="nav-item">
	    	<c:if test="${empty sNickName}"><a class="nav-link" href="MemberJoin.mem">가입하기</a></c:if>
	    </li> 
    </ul>
  </div>  
</nav>