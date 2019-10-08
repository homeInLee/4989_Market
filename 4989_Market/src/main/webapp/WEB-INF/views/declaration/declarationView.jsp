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
<input type="button" id="declarationCheckA" value="신고글 확인" />
</c:if>
<c:if test="${declaration.boardName eq 'p'}">
<input type="button" id="declarationCheckP" value="신고글 확인" />
</c:if>
</c:if>
<c:if test="${declaration.declarationDivision eq 'c'}">
<c:if test="${declaration.boardName eq 'a'}">
<input type="button" id="declarationCheckA" value="신고글 확인" />
</c:if>
<c:if test="${declaration.boardName eq 'p'}">
<input type="button" id="declarationCheckP" value="신고글 확인" />
</c:if>



</c:if>
<c:if test="${declaration.declarationDivision eq 's'}">
<input type="button" id="declarationCheckS" value="신고글 확인" />
</c:if>
<c:if test="${declaration.declarationDivision eq 'm'}">
<input type="button" id="declarationCheck" onclick="location.href='${pageContext.request.contextPath}/member/memberView.do?memberId=${declaration.declarationReceiver}'" value="회원 확인" />
</c:if>
<input type="button" id="declarationList" value="목록" onclick="location.href='${pageContext.request.contextPath}/declaration/declarationList.do'"/>

<script>
// $("#declarationCheckN").click(()=>{
// location.href="${pageContext.request.contextPath}/notice/noticeView.do?noticeNo=${declaration.boardNo}&decNo=${decNo}";
	
// });
// $("#declarationCheckA").click(()=>{
// location.href="${pageContext.request.contextPath}/auction/auctionSelectOne.do?auctionNo=${declaration.boardNo}&memberId=${memberLoggedIn.memberId}&decNo=${decNo}";
	
// });
// $("#declarationCheckS").click(()=>{
// location.href="${pageContext.request.contextPath}/message/messageSelect.do?messageNo=${declaration.boardNo}&memberId=${memberLoggedIn.memberId}&decNo=${decNo}";
	
// });
// $("#declarationCheckP").click(()=>{
// location.href="${pageContext.request.contextPath}/product/productView.do?productNo=${declaration.boardNo}&memberId=${memberLoggedIn.memberId}&decNo=${decNo}";
	
// });
</script>
<script>
// 신고기능관련 script
$("#declarationProcess").click(()=>{
	location.href="${pageContext.request.contextPath}/declaration/declarationProcess?memberId=${auctionSelectOne.get(0).auctionWriter}&decNo=${decNo}";
});
$("#acutionDeclaration").click(()=>{
	$("#frmPop").submit();
});

$(function(){
	$(document).mouseup(function(e) {
		if ($(e.target).parents('.zeta-menu').length == 0) {
			$('.zeta-menu li').removeClass('expand');
			$('.zeta-menu ul').hide();
		}
	});
	$(".zeta-menu>li:has(ul)>a").each( function() {
		$(this).html( $(this).html());
	});
	$(".zeta-menu ul li:has(ul)")
		.find("a:first")
		.append("<p style='float:right;margin:-3px'>&#9656;</p>");

	$(".zeta-menu li>a").click(function(){
		var li = $(this).parent();
		var ul = li.parent()
		ul.find('li').removeClass('expand');
		ul.find('ul').not(li.find('ul')).hide();
		li.children('ul').toggle();
		if( li.children('ul').is(':visible') || li.has('ul')) {
			li.addClass('expand');
		}
	});
});
</script> 













<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

