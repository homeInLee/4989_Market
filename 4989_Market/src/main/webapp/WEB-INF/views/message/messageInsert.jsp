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
</style>
<div class="menu">
  	<a class="badge badge-light" href="${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}">받은 쪽찌함</a>
  	<a class="badge badge-light" href="${pageContext.request.contextPath}/message/messageList2.do?memberId=${memberLoggedIn.memberId}">보낸 쪽찌함</a>
</div>
	<div id="message-container">
		<form action="${pageContext.request.contextPath}/message/messageInsert.do" method="post">
		<table>
			<tr>
				<th>보내는 사람</th>
				<td><input type="text" name="messageWriter" value="${messageWriter}"/></td>
			</tr>
			<tr>
				<th>받는 사람</th>
				<td><input type="text" name="messageReciver" value="${messageReciver}"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="messageTitle" required="required"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10"   name="messageContent" required="required"></textarea></td>
			</tr>
		</table>
		<input type="submit" id="send" value="보내기">
		</form>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>