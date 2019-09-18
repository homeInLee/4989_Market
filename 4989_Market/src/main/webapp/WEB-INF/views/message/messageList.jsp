<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="message" name="pageTitle"/>
</jsp:include>
<script >
</script>
	<div id="">
	<c:if test="${memberLoggedIn != null }">
		<table id="messageList">
			<tr>
				<th></th>
				<th>제목</th>
				<th>보낸사람</th>
				<th>날짜</th>
				<th></th>
			</tr>
			<c:forEach items="${messageList}" var="m">
			<tr>
				<td>${m.messageNo }</td>
				<td><a href="${pageContext.request.contextPath}/message/messageSelect.do?messageNo=${m.messageNo}">${m.messageTitle}</a></td>
				<td>${m.messageWriter }</td>
				<td>${m.messageDate}</td>
				<td>
					<button id="reply" >답장</button>
					<button id="delete" >삭제</button>
				</td>
			</tr>
			</c:forEach>
		</table>
			<input type="button" id="send" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/message/messageListEnd.do?messageWriter=${memberLoggedIn.memberId}'"/>
	</c:if>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>