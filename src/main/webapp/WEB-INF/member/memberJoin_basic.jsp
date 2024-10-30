<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberJoin.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br /></p>
<div class="container">
  <form name="myform" id="myform" method="post" action="" xxonsubmit="return fCheck(1)">
  	<table class="table table-bordered">
      <tr id="subject">
        <td class="text-center" colspan="7"><b>회원가입</b></td>
      </tr>
	    <tr>
        <th class="text-center"><label for="mid" class="form-label">아이디</label></th>
        <td colspan="7"><input type="text" name="mid" id="mid" value="" class="form-control" autofocus required /></td>
	    </tr>
	    <tr>
        <th class="text-center"><label for="pwd" class="form-label">비밀번호</label></th>
        <td colspan="7"><input type="password" name="pwd" id="pwd" value="" class="form-control" required /></td>
	    </tr>
	    <tr class="mb-2">
        <th class="text-center"><label for="nickName" class="form-label">이름</label></th>
        <td colspan="7"><input type="text" name="nickName" id="nickName" value="" class="form-control" required /></td>
	    </tr>
	    <tr class="mb-2">
        <th class="text-center"><label for="name" class="form-label">닉네임</label></th>
        <td colspan="7"><input type="text" name="name" id="name" value="" class="form-control" required /></td>
	    </tr>
	    <tr class="mb-2">
	    	<th class="text-center">성별</th>
        <td colspan="7" class="text-center">
	        <input type="radio" name="gender" id="male" value="남자" checked /><label for="male" class="form-label mr-3">남자</label>
	        <input type="radio" name="gender" id="female" value="여자" />    <label for="female" class="form-label">여자</label>
	    	</td>
	    </tr>
	    <tr class="mb-4">
	        <th class="text-center"><label for="birthday" class="form-label">생일</label></th>
	        <td colspan="7"><input type="date" name="birthday" id="birthday" class="form-control"></td>
	    </tr>
	    <tr class="mb-2">
        <th class="text-center"><label for="tel1" class="form-label">전화번호</label></th>
        <td>
        <select class="form-control" id="tel1" name="tel1">
            <option selected>지역번호</option>
            <option value="043">043</option>
            <option value="02">02</option>
            <option value="045">045</option>
          </select>
          </td>
        <td><label for="tel2" class="form-label text-center"><b>-</b></label></td>
        <td>
        <select class="form-control" id="tel2" name="tel2" >
            <option selected>국번</option>
            <option value="123">123</option>
            <option value="456">456</option>
            <option value="789">789</option>
          </select>
         </td>
        <td><label for="tel3" class="form-label text-center"><b>-</b></label></td>
	        <td>
	        	<select class="form-control" id="tel3" name="tel3" >
	            <option selected>전화번호</option>
	            <option value="321">321</option>
	            <option value="654">654</option>
	            <option value="987">987</option>
	          </select>
	      </td>
	    </tr>
	    <tr class="mb-2">
        <th class="text-center"><label for="address" class="form-label">주소</label></th>
        <td colspan="7"><input type="text" name="address" id="address" class="form-control" /></td>
	    </tr>
	    <tr class="mb-2">
	      <th class="text-center">이메일</th>
	      <td colspan="3"><input type="text" name="email1" id="email1" class="form-control" required /></td>
	      <td class="text-center"><b>@</b></td>
	      <td colspan="3">
          <select class="form-control" id="email2" name="email2" required >
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
          </select>
	      </td>
      </tr>
      <tr class="mb-2">
        <th class="text-center"><label for="content" class="form-label">자기소개</label></th>
        <td colspan="7"><textarea cols="5" name="content" id="content" class="form-control"></textarea></td>
      </tr>
      <tr class="mb-2">
        <th class="text-center"><label for="photo" class="form-label">사진</label></th>
        <td colspan="7"><input type="file" name="photo" id="photo" class="form-control-file border" /></td>
      </tr>
      <tr class="mb-2">
        <th class="text-center"><label for="photo" class="form-label">정보공개</label></th>
        <td colspan="7" class="text-center">
          <input type="radio" name="userInfo" id="YES" value="공개" class="btn-check" /><label for="YES" class="form-label mr-3">공개</label>
          <input type="radio" name="userInfo" id="NO" value="비공개" class="btn-check" checked /><label for="NO" class="form-label">비공개</label>
        </td>
      </tr>
    </table>
    <table class="table table-borderless">
    	<tr>
    		<td class="row">
				  <input type="button" value="회원가입" onclick="joinCheck()" class="form-control btn btn-outline-success col mr-2">
				  <button type="reset" class="form-control btn btn-outline-warning col">다시입력</button>
    		</td>
    		<td class="row">
				  <button type="button" xxonclick="fCheck(2)" class="form-control btn btn-outline-info col">돌아가기</button>
    		</td>
    	</tr>
    </table>
	  <input type="hidden" name="tel" id="tel"  />
	  <input type="hidden" name="email" id="email" />
	  <input type="hidden" name="address2" />
  </form>
  <div name="demo" id="demo">
  </div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>