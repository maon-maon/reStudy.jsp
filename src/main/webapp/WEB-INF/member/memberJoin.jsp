<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String today = LocalDate.now().toString();
	pageContext.setAttribute("today", today);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberJoin.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
<script>
	'use strict'
	/* let sw = 0; */
	let idCheckSw = 0;
	let nickCheckSw = 0;
	
	// 정규식 이용 유효성 검사
	let regMid = /^[a-zA-Z0-9_]{4,20}$/;
	let regNick = /^[가-힣0-9_]{2,20}$/;
	let regName = /^[가-힣a-zA-Z0-9_]{2,20}$/;
	let regPwd = /^[a-zA-Z0-9]{4,20}$/;
	// 이메일 주소형식체크
	// 전화번호 형식 체크
	
	function fCheck() {
		let mid = myform.mid.value;
  	let pwd = myform.pwd.value;
  	let nickName = myform.nickName.value;
  	let name = myform.name.value;
		
		let tel2 = myform.tel2.value.trim(); 
		let tel3 = myform.tel3.value.trim();
		if(tel2 == "") tel2 = " ";
		if(tel3 == "") tel3 = " ";
		
		let tel = myform.tel1.value+" -"+myform.tel2.value+" -"+myform.tel3.value;
		let email = myform.email1.value+"@"+myform.email2.value;
		let address = myform.postcode.value+" /"+myform.address.value+" /"+myform.detailAddress.value+" /"+myform.extraAddress.value+" ";
		
		if(!regMid.test(mid)) {
  		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
  		myform.mid.focus();
  		return false;
  	}
  	else if(pwd.length < 4 || pwd.length > 20) {
      alert("비밀번호는 4~20 자리로 작성해주세요.");
      myform.pwd.focus();
      return false;
    }
    else if(!regNick.test(nickName)) {
      alert("닉네임은 2자리 이상 한글만 사용가능합니다.");
      myform.nickName.focus();
      return false;
    }
    else if(!regName.test(name)) {
      alert("성명은 2자리 이상 한글과 영문대소문자만 사용가능합니다.");
      myform.name.focus();
      return false;
    }
		
		
		myform.tel.value = tel;
		myform.email.value = email;
		myform.address2.value = address;
		
		//myform.submit();
	}
	
	//아이디 중복체크
	function idCheck() {
		let mid = myform.mid.value;
		
		if(!regMid.test(mid)) {
			alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
			myform.mid.focus();
		}
		else {
			let url = "MemberIdCheck.mem?mid="+mid;
			window.open(url, "idCheckWindow", "width=450px, height=250px");
			//sw++;
			idCheckSw = 1;
		}
	}
	
	//닉네임 중복체크
	function nickCheck() {
		let nickName = myform.nickName.value;
		
		if(!regNick.test(nickName)) {
			alert("닉네임은 2자리 이상 한글만 사용가능합니다.");
			myform.nickName.focus();
		}
		else {
			let url = "MemberNickNameCheck.mem?nickName="+nickName;
			window.open(url, 'nickCheckWindow',"width=450px, height=250px")
			//sw++;
			nickCheckSw = 1;
		}
	}
	
	 //회원가입 버튼 : 중복확인 체크
	 function joinCheck() {
		if(sw == 0) {
			alert("아이디를 중복체크하세요");
			myform.midBtn.focus();
		}
		else if(sw == 1) {
			alert("닉네임을 중복체크하세요");
			myform.midBtn.focus();
		}
		else myform.submit();
	}  
	
	//Ajax로 닉네임 중복체크
	function nickNameAjaxCheck() {
		let nickName = myform.nickName.value;
		if(!regNick.test(nickName)) {
			alert("닉네임은 2자리 이상 한글만 사용가능합니다.");
			myform.nickName.focus();
			return false;
		}
		
		nickCheckSw = 1;
		/* 
		$.ajax({
			type : "get",
			url  : "NickNameAjaxCheck.mem",
			data : {nickName : nickName},
			
			success: function(res) {
				alert("gogogo : " + res);
				if(res != '0') alert("111닉네임이 중복되었습니다.\n다른 닉네임을 사용하세요.");
				else alert("1111사용할 수 있는 닉네임입니다. \n계속 진행합니다.");
			},
			error: function() {
				alert("전송오류");
			}
		});
		*/
		$.ajax({
			type : "get",
			url  : "MemberNickAjaxCheck.mem",
			data : {nickName : nickName},
			success:function(res) {
				if(res != '0') alert("성공");
				else  alert("실패");
			},
			error : function() {
				alert("전송오류!!");
			}
		});
		
	}
	
	
</script>
<style>
	th {
		text-align: center;
		background-color: #DAE5DB;
	}
	#subject {
		background-color: #eee;    
	}
</style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br /></p>
<div class="container">
  <form name="myform" id="myform" method="post" action="MemberJoinOk.mem" onsubmit="return fCheck()">
    <h3 class="text-center">회 원 가 입</h3>
    <table class="table table-bordered">
      
      <!-- 중복체크 -->
    	<tr>
        <th ><label for="mid" class="form-label">아이디</label></th>
        <td  >
        	<div class=" input-group mb-1">
	        	<input type="text" name="mid" id="mid" placeholder="입력하세요" class="form-control" autofocus required />
	        	<div class="input-group-append">
		        	<input type="button" name="midBtn" value="아이디 중복체크" onclick="idCheck()" class="btn btn-secondary">
	        	</div>
        	</div>
        </td>
      </tr>
      
      <tr>
        <th ><label for="pwd" class="form-label">비밀번호</label></th>
        <td  ><input type="password" name="pwd" id="pwd" placeholder="입력하세요" class="form-control" required /></td>
      </tr>
      <tr class="mb-2">
        <th ><label for="name" class="form-label">이름</label></th>
        <td  ><input type="text" name="name" id="name" placeholder="입력하세요" class="form-control" required /></td>
      </tr>
      
      <!-- 중복체크 -->
      <tr class="mb-2">
        <th ><label for="nickName" class="form-label">닉네임</label></th>
        <td   >
        	<div class="input-group mb-1">
	        	<input type="text" name="nickName" id="nickName" placeholder="입력하세요" class="form-control" required />
	        	<div class="input-group-append">
		        	<!-- <input type="button" value="닉네임 중복체크" onclick="nickCheck()" class="btn btn-secondary" /> -->
		        	<input type="button" value="닉네임 중복체크" onclick="nickNameAjaxCheck()" class="btn btn-secondary" />
	        	</div>
        	</div>
        </td>
      </tr>
      
      <tr class="mb-2">
        <th >성별</th>
        <td   class="text-center">
          <input type="radio" name="gender" id="male" value="남자" checked /><label for="male" class="form-label mr-3">남자</label>
          <input type="radio" name="gender" id="female" value="여자" />    <label for="female" class="form-label">여자</label>
        </td>
      </tr>
      <tr class="mb-4">
        <th ><label for="birthday" class="form-label">생일</label></th>
        <td  ><input type="date" name="birthday" id="birthday" value="${today}" class="form-control"></td>
      </tr>
      <tr class="mb-2">
        <th ><label for="tel1" class="form-label">전화번호</label></th>
        <td  >
        <select class="" id="tel1" name="tel1" >
	        <option >010</option>
	        <option value="02">서울</option>
	        <option value="041">천안</option>
	        <option value="042">대전</option>
	        <option value="043">청주</option>
	      	<option value="031">인천</option>
        </select>
        	-<input type="text" class="" id="tel2" name="tel2" size="4" maxlength="4" />
        	-<input type="text" class="" id="tel3" name="tel3" size="4" maxlength="4" />
        </td>
      </tr>
      
      <!-- 다음 주소api 삽입 : DNC방식으로 상단 스트립트+내누 예제코드 -->
      <tr class="mb-2">
        <th class="text-center"><label for="address" class="form-label">주소</label></th>
        <td >
		    	<div class="input-group mb-1">
			      <input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호를 검색하세요" class="form-control" />
						<div class="input-group-append">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"  class="form-control btn btn-secondary" />
						</div>
		      </div>
					<input type="text" id="sample6_address" name="address" placeholder="주소" class="form-control" readonly />
					
					<div class="input-group mt-1">
						<input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소" class="form-control"  />
						<div class="input-group-append">
							<input type="text" id="sample6_extraAddress" name="extraAddress" placeholder="추가사항" class="form-control"  />
						</div>
		      </div>
        </td>
      </tr>
      
      <tr class="mb-2">
        <th >이메일</th>
        <td >
        	<input type="text" name="email1" id="email1" class="" required />@
          <select class="" id="email2" name="email2" required style="height:30px ">
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
          </select>
        </td>
    	</tr>
      <tr class="mb-2">
        <th ><label for="content" class="form-label">자기소개</label></th>
        <td  ><textarea cols="5" name="content" id="content" class="form-control"></textarea></td>
      </tr>
      <tr class="mb-2">
        <th ><label for="photo" class="form-label">사진</label></th>
        <td  ><input type="file" name="photo" id="photo" class="form-control-file border" /></td>
      </tr>
      <tr class="mb-2">
        <th ><label for="userInfo" class="form-label">정보공개</label></th>
        <td   class="text-center">
          <input type="radio" name="userInfo" id="YES" value="공개" class="btn-check" checked /><label for="YES" class="form-label mr-3">공개</label>
          <input type="radio" name="userInfo" id="NO" value="비공개" class="btn-check"  /><label for="NO" class="form-label">비공개</label>
        </td>
      </tr>
    </table>
    <table class="table table-borderless">
      <tr>
        <td>
			    <button type="submit" class="btn btn-success mb-2">회원가입</button>
			    <!-- <input type="button" value="회원가입" onclick="joinCheck()" class="btn btn-success mb-2" /> -->
			    <button type="reset" class="btn btn-warning mb-2">다시입력</button>
			  </td>
			  <td class="text-right">
		    	<%-- <button type="button" onclick="location.href='${ctp}/'" class="btn btn-info mb-2">돌아가기</button> --%>
		    	<button type="button" onclick="history.back()" class="btn btn-info mb-2">돌아가기</button>
      	</td>
      </tr>
    </table>
    <input type="hidden" name="tel" id="tel" />
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