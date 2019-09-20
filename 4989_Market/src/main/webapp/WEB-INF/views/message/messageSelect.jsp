<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/review/reviewHeader.jsp"></jsp:include>
<style>
tr th{
	border: 1px solid black;
}
tr td{
	border: 1px solid black;
}
input{
	background:white;
	color:black;
}
textarea{
	background:white;
	color:black;
}
</style>
<div class="menu">
  	<a class="badge badge-light" href="${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}">받은 쪽찌함</a>
  	<a class="badge badge-light" href="${pageContext.request.contextPath}/message/messageList2.do?memberId=${memberLoggedIn.memberId}">보낸 쪽찌함</a>
</div>
	<div id="message-container">
		<table>
			<tr>
				<th>보낸 사람</th>
				<td><input type="text" name="messageWriter" value="${message.messageWriter}" disabled/></td>
			</tr>
			<tr>
				<th>받는 사람</th>
				<td><input type="text" name="messageReciver" value="${message.messageReciver}" disabled></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="messageTitle" value="${message.messageTitle}" disabled="disabled"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10"   name="messageContent" disabled="disabled">${message.messageContent}</textarea></td>
			</tr>
		</table>
		<br />
		<c:if test="${memberLoggedIn.memberId != message.messageWriter }">
		<input class="log" type="button" value="답장" onclick="location.href='${pageContext.request.contextPath}/message/messageListEnd.do?messageWriter=${message.messageReciver }&messageReciver=${message.messageWriter }'"/>
		<input class="log" type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/message/messageDelete.do?messageNo=${message.messageNo}&memberId=${message.messageReciver }'" />
		</c:if>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>