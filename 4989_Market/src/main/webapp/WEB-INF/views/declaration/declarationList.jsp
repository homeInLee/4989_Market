<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<input type="button" value="회원목록" />
<input type="button" value="신고관리"
	onclick="${pageContext.request.contextPath}/declaration/declarationList" />
<style>
#declarationList {
	width: 800px;
	margin: auto;
	text-align: center;
	padding-top: 30px;
}

#declarationList th {
	border-bottom: 1px solid #1b5ac2;
}

#declarationList tr:hover {
	background-color: #f5f5f5;
}

.bottom {
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
				<th>분류</th>
				<th>제목</th>
				<th>신고내용</th>
				<th>신고자</th>
				<th>신고사유</th>
				<th>신고일</th>
				<th>처리여부</th>
				<th>처리</th>
			</tr>
			<c:forEach items="${list}" var="d" varStatus="status">
				<tr class="bottom" declarationNo=${d.declarationNo } onclick="event.cancelBubble=true">
					<td>${d.declarationNo}</td>
					<td id="division${status.index }">
					<c:if test="${d.declarationDivision eq 'w'}">작성글</c:if>
					<c:if test="${d.declarationDivision eq 'm'}">회원</c:if>
					<c:if test="${d.declarationDivision eq 's'}">쪽지</c:if> 
					<c:if test="${d.declarationDivision eq 'c'}">댓글</c:if>
					</td>
					<td>${d.declarationTitle}</td>
					<td>${d.declarationContent}</td>
					<td id="writer">${d.declarationWriter}</td>

					<td>
					<c:if test="${d.declarationReason eq 'a'}">욕설 및 비방</c:if>
					<c:if test="${d.declarationReason eq 's'}">부적절한 내용</c:if> 
					<c:if test="${d.declarationReason eq 'd'}">광고글</c:if> 
					<c:if test="${d.declarationReason eq 'f'}">불법 거래 유도</c:if>
					</td>

					<td>${d.declarationDate.substring(2,10)}</td>
					<c:if test="${d.declarationState eq 'N'}">
					<td style="color: red;">처리중</td>
					</c:if>
					<c:if test="${d.declarationState eq 'Y'}">
					<td style="color: blue;">처리완료</td>
					</c:if>
					<td>
					<input type="button" declarationWriter=${d.declarationWriter } onclick="event.cancelBubble=true" id="dec${status.index}" value="알림" /> 
					<input type="hidden" name="declarationNo" value="${d.declarationNo}"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>

<script>
$("tr.bottom").click(function(){
	var declarationNo = $(this).attr("declarationNo");
	location.href='${pageContext.request.contextPath}/declaration/selectOneDeclaration?declarationNo='+declarationNo;
});
$("[id^=dec]").click(function() {
	var writer = $(this).attr("declarationWriter");
// 	console.log(writer);
	location.href="${pageContext.request.contextPath}/declaration/declarationCheck?declarationWriter="+writer;
});


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

