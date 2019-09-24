<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/review/reviewHeader.jsp"></jsp:include>
<style>
.submenu{
	text-align: center;
	padding-bottom: 30px;
}
#submenu-btn{
	text-decoration: none;
	text-shadow: 0 0 24px #8c59b9;;
	margin: 30px;
	
}
#containertable{
width: 800px;
border: none;
text-align: center;
margin-left: 80px;
}
#containertable td{
border-bottom: 2px solid #403E8C;
text-align: left;
padding: 15px;
}

#containertable textarea:disabled,
#containertable input:disabled {background:#fff}
</style>
<div class="submenu">
  	<a id="submenu-btn" href="${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}">받은 쪽지함</a>
  	<a id="submenu-btn" href="${pageContext.request.contextPath}/message/messageList2.do?memberId=${memberLoggedIn.memberId}">보낸 쪽지함</a>
</div>
	<div id="message-container">
		<table id="containertable">
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
		<c:if test="${message.messageReview eq 'Y'}">
			<!-- 여기서부터 하자 -->
			<input class="log" type="button" value="설문조사" onclick="#"/>
		</c:if>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>