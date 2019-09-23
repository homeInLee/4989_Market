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
	text-shadow: 0 0 24px #8c59b9;
	margin: 30px;
	
}
#messageInsert{
width: 800px;
margin: auto;
text-align: center;
padding-top: 30px;
}
#messageInsert td{
border-bottom: 2px solid #403E8C;
text-align: left;
padding: 15px;
}
#send{
text-align: center;
background: none;
display: block;
margin: 0 auto;
padding-top: 30px;
text-shadow: 0 0 24px #8c59b9;
}
</style>
<div class="submenu">
  	<a id="submenu-btn" href="${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}">받은 쪽지함</a>
  	<a id="submenu-btn" href="${pageContext.request.contextPath}/message/messageList2.do?memberId=${memberLoggedIn.memberId}">보낸 쪽지함</a>
</div>
	<div id="message-container">
		<form action="${pageContext.request.contextPath}/message/messageInsert.do" method="post">
		<table id="messageInsert">
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
				<td><textarea rows="10" name="messageContent" required="required"></textarea></td>
			</tr>
		</table>
		<input type="submit" id="send" value="보내기">
		</form>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>