<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
#messageList{
width: 800px;
margin: auto;
text-align: center;
padding-top: 30px;
}
#messageList th{
border-bottom: 1px solid #1b5ac2;
}
#messageList tr:hover{
background-color: #f5f5f5;
}
.bottom{
border-bottom: 1px solid #dcd7d7;
height: 34px;
}
</style>
	<div id="">
	<h2 style="text-align: center;">회원목록</h2>
	<c:if test="${memberLoggedIn != null }">
		<table id="messageList">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>탈퇴여부</th>
			</tr>
			<c:forEach items="${mList}" var="m">
			<tr class="bottom">
				<td><a href="${pageContext.request.contextPath }/member/memberView.do?memberId=${m.memberId}">${m.memberId }</a></td>
				<td>${m.memberName }</td>
				<td>${m.memberPhone}</td>
				<td>${m.memberEmail }</td>
				<td><fmt:formatDate value="${m.memberEnrolldate}" pattern="yy-MM-dd HH:mm"/></td>
				<td>${m.memberDeltype }</td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
