<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/review/reviewHeader.jsp"></jsp:include>
<div class="menu">
  	<a class="badge badge-light" href="${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}">받은 쪽찌함</a>
  	<a class="badge badge-light" href="${pageContext.request.contextPath}/message/messageList2.do?memberId=${memberLoggedIn.memberId}">보낸 쪽찌함</a>
</div>
	<div id="">
	<c:if test="${memberLoggedIn != null }">
		<table id="messageList">
			<tr>
				<th>제목</th>
				<th>보낸사람</th>
				<th>받은사람</th>
				<th>날짜</th>
				<th>읽음</th>
				<th></th>
			</tr>
			<c:forEach items="${messageList}" var="m">
			<tr>
				<td><a href="${pageContext.request.contextPath}/message/messageSelect.do?messageNo=${m.messageNo}&memberId=${memberLoggedIn.memberId}">${m.messageTitle}</a></td>
				<td>${m.messageWriter }</td>
				<td>${m.messageReciver }</td>
				<td><fmt:formatDate value="${m.messageDate}" pattern="yyy-MM-dd HH:mm:ss"/></td>
				<td>
				<c:if test="${m.messageReadState == 'N' }">
				<img src="${pageContext.request.contextPath }/resources/images/not_read.PNG"/>
				</c:if>
				<c:if test="${m.messageReadState == 'Y' }">
				<img src="${pageContext.request.contextPath }/resources/images/read.PNG/"/>
				</c:if>
				</td>
				<c:if test="${memberLoggedIn.memberId != m.messageWriter }">
				<td>
					<button id="reply" onclick="location.href='${pageContext.request.contextPath}/message/messageListEnd.do?messageWriter=${m.messageReciver }&messageReciver=${m.messageWriter }'">답장</button>
					<button id="delete" onclick="location.href='${pageContext.request.contextPath}/message/messageDelete.do?messageNo=${m.messageNo}&memberId=${m.messageReciver }'">삭제</button>
				</td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
			<input type="button" id="send" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/message/messageListEnd.do?messageWriter=${memberLoggedIn.memberId}'"/>
	</c:if>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>