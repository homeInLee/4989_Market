<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
#noticeViewTable{
margin-left: 150px;
text-align: center;}

#noticeViewTable tr{
border: 1px solid;
width: 800px;
}
#noticeViewTable th{
border: 1px solid;
width: 100px;
}
#noticeViewTable td{
border: 1px solid;
width: 100px;
padding: 10px;
}
</style>

<h2>공지사항 view</h2>
<table id="noticeViewTable">
	<tr>
		<th>글번호</th>
		<td>${notice.noticeNo}</td>
		<th>조회수</th>
		<td>${notice.noticeReadCount}</td>
		<th>글쓴이</th>
		<td>${notice.noticeWriter }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="5">${notice.noticeTitle }</td>
	</tr>
	<c:forEach items="${attachMap}" var="a">
	<tr>
		<th>첨부파일</th>
		<td colspan="5">
		${a['originalfileName']}
		</td>
	</tr>
	</c:forEach>
	<tr style="height: 300px;">
		<th>내용</th>
		<td colspan="5">
	<c:forEach items="${attachMap}" var="a">
		<img alt="" src="${pageContext.request.contextPath}/resources/upload/notice/${a['renamedfileName']}">
	</c:forEach>
		<br />
		${notice.noticeContent }
		</td>
	</tr>

</table>

<input type="hidden" name="noticeNo" value="${noticeNo}" />
<%-- <c:if test="${memberLoggedIn.memberId eq 'admin' }"> --%>
<input type="button" id="noticeUpdate" value="수정" onclick="location.href='${pageContext.request.contextPath}/notice/noticeUpdate?noticeNo=${noticeNo}'"/>
<input type="button" id="noticeDelete" value="삭제" />
<input type="button" id="noticeList" value="목록" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'"/>
<%-- </c:if> --%>
<script>
$("#noticeDelete").click(function(){
    if(!confirm("정말 삭제하시겠습니까?")){
    	console.log("삭제취소");
    	return false;
    }else {
//     	console.log("삭제");
    	location.href="${pageContext.request.contextPath}/notice/noticeDelete?noticeNo=${noticeNo}"
		return true;    	
    }
});
	
</script>













<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

