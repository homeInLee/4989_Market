<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
#declarationView {
	margin-left: 150px;
	text-align: center;
}

#declarationView tr {
	border: 1px solid;
	width: 800px;
}

#declarationView th {
	border: 1px solid;
	width: 100px;
}

#declarationView td {
	border: 1px solid;
	width: 100px;
	padding: 10px;
}

/* table#declarationView td#drop { */
/* 	cursor: pointer; */
/* } */

</style>
<h2>신고 상세보기</h2>
<table id="declarationView">
	<tr>
		<th>신고 번호</th>
		<td>${declaration.declarationNo}</td>
		<th>분류</th>
		<td>
		<c:if test="${declaration.declarationDivision eq 'w'}">작성글</c:if>
		<c:if test="${declaration.declarationDivision eq 'm'}">회원</c:if>
		<c:if test="${declaration.declarationDivision eq 's'}">쪽지</c:if> 
		<c:if test="${declaration.declarationDivision eq 'c'}">댓글</c:if>
		</td>
		<th>신고자</th>
		<td>${declaration.declarationWriter }</td>
		</tr>
		<tr>
		<th>제목</th>
		<td colspan="5">${declaration.declarationTitle }</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="5">없음</td>
	</tr>
	<tr style="height: 300px;">
		<th>내용</th>
		<td colspan="5">
		<br />
		${declaration.declarationContent }
		</td>
	</tr>

</table>
<%-- <c:if test="${memberLoggedIn.memberId eq 'admin' }"> --%>
<c:if test="${declaration.declarationDivision eq 'w'}">
<c:if test="${declaration.boardName eq 'n'}">
<input type="button" id="declarationCheckN" value="신고글 확인" />
</c:if>
<c:if test="${declaration.boardName eq 'a'}">
<input type="button" id="declarationCheck" onclick="${pageContext.request.contextPath}/auction/" value="신고글 확인" />
</c:if>
<c:if test="${declaration.boardName eq 's'}">
<input type="button" id="declarationCheck" onclick="${pageContext.request.contextPath}/sell/" value="신고글 확인" />
</c:if>
</c:if>
<input type="button" id="declarationState" value="처리" />
<input type="button" id="declarationList" value="목록" onclick="location.href='${pageContext.request.contextPath}/declaration/declarationList.do'"/>

<script>
$("#declarationCheckN").click(()=>{
location.href="${pageContext.request.contextPath}/notice/noticeView.do?noticeNo=${declaration.boardNo}&decNo=${decNo}";
	
});
</script>














<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

