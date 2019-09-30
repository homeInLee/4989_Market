<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<input type="button" value="회원목록" />
<input type="button" value="신고관리" onclick="${pageContext.request.contextPath}/declaration/declarationList"/>
<style>
#declarationList{
width: 800px;
margin: auto;
text-align: center;
padding-top: 30px;
}
#declarationList th{
border-bottom: 1px solid #1b5ac2;
}
#declarationList tr:hover{
background-color: #f5f5f5;
}
.bottom{
border-bottom: 1px solid #dcd7d7;
height: 34px;
}
</style>
	<div id="">
	<h2 style="text-align: center;">신고목록</h2>
	<c:if test="${memberLoggedIn != null }">
		<table id="declarationList">
			<tr>
				<th>번호</th>
				<th>신고자</th>
				<th>제목</th>
				<th>신고내용</th>
				<th>신고사유</th>
				<th>신고일</th>
				<th>처리여부</th>
				<th>처리</th>
			</tr>
			<c:forEach items="${list}" var="d" varStatus="status">
			<tr class="bottom">
				<td>${d.declarationNo}</td>
				<td>${d.declarationWriter}</td>
				<td>${d.declarationTitle}</td>
				<td>${d.declarationContent}</td>
				<td>${d.declarationReason}</td>
				<td>${d.declarationDate}</td>
				<td style="color: red;"><c:if test="${d.declarationState eq 'N'}">처리중</c:if></td>
				<td><input type="button" id="dec${status}" value="처리" /></td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

