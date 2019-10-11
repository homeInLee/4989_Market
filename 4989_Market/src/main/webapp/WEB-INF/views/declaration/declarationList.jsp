<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>
div{
	margin-left: -15px;
}
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
ul.pageUl {
	text-align:center;
	top: 2px;
}
ul li.pageLi {
	display:inline;
	vertical-align:middle;
}
ul li a.pageA {
	display:-moz-inline-stack;
	display:inline-block;
	vertical-align:top;
	padding:4px;
	margin-left: 3px;
	width:30px !important;
	color:#000;
	font:bold 14px tahoma;
	border:1px solid #eee;
	text-decoration:none;
	margin-top: 17px;
}
ul li a.pageB{
	display:-moz-inline-stack;
	display:inline-block;
	vertical-align:top;
	padding:4px;
	margin-left: 3px;
	width:50px !important;
	color:#000;
	font:bold 14px tahoma;
	border:1px solid #eee;
	text-decoration:none;
	margin-top: 17px;
}
ul li a.now {
	color:#fff;
	background-color:#1b5ac2;
	border:1px solid #1b5ac2;
}
ul li a:hover, ul li a:focus {
	color:#fff;
	border:1px solid #1b5ac2;
	background-color:#1b5ac2;
}

#goMemList{
width: 150px;
height: 50px;
margin-left: 10px;
background: white;
border: 1px solid #1b5ac2;
color: #1b5ac2;
cursor: pointer;
margin-top: -20px; 
border-radius: 5px;
}
#goDecList{
width: 150px;
height: 50px;
margin-left: -5px;
background: #1b5ac2;
color: white;
cursor: pointer;
border-radius: 5px;
}
.btn-alarm{
background: white;
color: deepgray;
border: 1px solid gray;
border-radius: 5px;
padding: 1px;
}

</style>
<input type="button" id="goMemList" value="회원목록" onclick="location.href='${pageContext.request.contextPath}/member/memberList.do'" />
<input type="button" id="goDecList" value="신고관리" onclick="location.href='${pageContext.request.contextPath}/declaration/declarationList'" />

<br />
<br />
<br />
<div id="">
	<h2 style="text-align: center;">신고목록</h2>
	<br />
	<br />
	<c:if test="${memberLoggedIn != null }">
		<table id="declarationList">
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>신고자</th>
				<th>신고사유</th>
				<th>신고일</th>
				<th>처리여부</th>
				<th>&nbsp;</th>
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
					<c:if test="${d.declarationState eq 'Y'}">
					<input type="button" class="btn-alarm" declarationWriter=${d.declarationWriter } onclick="event.cancelBubble=true;" id="dec${status.index}" value="알림" /> 
					</c:if>
					<input type="hidden" name="declarationNo" value="${d.declarationNo}"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	<div>
		<ul class="pageUl">
			<c:if test="${paging.prev}">
				<li class="pageLi"><a class="pageB" href="#" onClick="fn_prev('${paging.page}', '${paging.range}', '${paging.rangeSize}')">&lt;이전</a></li>
			</c:if>
				
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
				<li class="pageLi" "<c:out value="${paging.page == idx ? 'active' : ''}"/>"><a class="pageA" href="#" onClick="fn_pagination('${idx}', '${paging.range}', '${paging.rangeSize}')"> ${idx} </a></li>
			</c:forEach>
				
			<c:if test="${paging.next}">
				<li class="pageLi" ><a class="pageB" href="#" onClick="fn_next('${paging.range}', '${paging.range}', '${paging.rangeSize}')" >다음&gt;</a></li>
			</c:if>
		</ul>
	</div>
	</c:if>
</div>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<script>
$("tr.bottom").click(function(){
	var declarationNo = $(this).attr("declarationNo");
	location.href='${pageContext.request.contextPath}/declaration/selectOneDeclaration?declarationNo='+declarationNo;
});

$(".btn-alarm").click(function() {
	var writer = $(this).attr("declarationWriter");
	location.href="${pageContext.request.contextPath}/declaration/declarationCheck?declarationWriter="+writer;
	$(this).attr('style','display:none');
});
// 
//이전 버튼 이벤트

function fn_prev(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = "${pageContext.request.contextPath}/declaration/declarationList";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/declaration/declarationList";
	url = url + "?page=" + page;
	url = url + "&range=" + range;

	location.href = url;	
}

//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "${pageContext.request.contextPath}/declaration/declarationList";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

