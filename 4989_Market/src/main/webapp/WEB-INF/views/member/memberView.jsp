<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	//System.out.println("memberEnroll.jsp");
%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
<style>
div#enroll-container{width:500px; margin:0 auto; text-align:center;}
div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
div#enroll-container table{margin: 0 auto;}
div#enroll-container table th{text-align: right; padding-right:10px;}
div#enroll-container table td{text-align: left;}
</style>
<!-- 
	bootstrap form 태그 작성요령
	* input[type=text, password, tel, number], select -> .form-control
	* input[type=checkbox, radio] -> .form-check-input
	* label -> .form-check-label
	* radio, checkbox는 div.form-check.form-check-inline으로 감싸줄것.
 -->
<jsp:include page="/WEB-INF/views/review/reviewHeader.jsp"></jsp:include>
<div id="enroll-container">
	<form id="Delete">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<div id="memberId-container">
						<input type="text" class="form-control" value="${member.memberId }" name="memberId" id="memberId_" disabled="disabled">
					</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" class="form-control" name="memberPassword" id="password_" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>	
				<input type="text" class="form-control" value="${member.memberName }" name="memberName" id="memberName" required disabled="disabled">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" class="form-control" value="${member.memberEmail }" placeholder="abc@xyz.com" name="memberEmail" id="memberEmail" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>	
					<input type="tel" class="form-control" value="${member.memberPhone }" name="memberPhone" id="memberPhone" maxlength="11" required disabled="disabled">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>	
					<input type="text" class="form-control" value="${member.memberAddress }" name="memberAddress" id="memberAddress" disabled="disabled">
				</td>
			</tr>
		</table>
		<input type="hidden" name="memberId" value="${member.memberId }"/>
		<input type="hidden" name="loginId" value="${memberLoggedIn.memberId }"/>
	</form>
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberUpdate.do?memberId=${member.memberId }'" class="log" id="btnUpdate">정보수정</button>
		<c:if test="${member.memberDeltype.trim()=='N' }">
		<button type="button" onclick="memberDelete();" class="log" id="btnDelete">회원삭제</button>
		</c:if>
		<c:if test="${member.memberDeltype.trim()=='Y' }">
		<button type="button" onclick="memberDelete();" class="log" id="btnDelete">회원복구</button>
		</c:if>
		<c:if test="${memberLoggedIn.memberId eq 'admin' }">
		<button type="button" class="log"  onclick="location.href='${pageContext.request.contextPath}/declaration/declarationProcess?memberId=${member.memberId}&decNo=${decNo}'">신고처리</button>
		</c:if>
</div>
<script>
function memberDelete(){
	$("#Delete").attr("action", "${pageContext.request.contextPath}/member/memberDelete.do").attr("method","post").submit();
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>