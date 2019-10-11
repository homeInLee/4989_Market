<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
div{
	margin-left: -15px;
}
#messageList{
width: 800px;
margin: auto;
text-align: center;
padding-top: 30px;
}
#messageList th{
border-bottom: 1px solid #1b5ac2;
}
#messageList tr:hover{
background-color: #f5f5f5;
}
.bottom{
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
cursor: pointer;
margin-top: -20px; 
border-radius: 5px;
background: #1b5ac2;
color: white;
}
#goDecList{
width: 150px;
height: 50px;
margin-left: -5px;
cursor: pointer;
border-radius: 5px;
background: white;
border: 1px solid #1b5ac2;
color: #1b5ac2;
}
</style>
<script>

//이전 버튼 이벤트

function fn_prev(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = "${pageContext.request.contextPath}/member/memberList.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/member/memberList.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;

	location.href = url;	
}

//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "${pageContext.request.contextPath}/member/memberList.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}
</script>
<input type="button" id="goMemList" value="회원목록" onclick="location.href='${pageContext.request.contextPath}/member/memberList.do'" />
<input type="button" id="goDecList" value="신고관리" onclick="location.href='${pageContext.request.contextPath}/declaration/declarationList'" />
<br />
<br />
<br />
	<div id="">
	<h2 style="text-align: center;">회원목록</h2>
	<br />
	<br />
	<c:if test="${memberLoggedIn != null}">
		<table id="messageList">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>탈퇴여부</th>
			</tr>
			<c:forEach items="${mList}" var="m">
			<tr class="bottom">
				<td><a href="${pageContext.request.contextPath }/member/memberView.do?memberId=${m.memberId}">${m.memberId }</a></td>
				<td>${m.memberName }</td>
				<td>${m.memberPhone}</td>
				<td>${m.memberEmail }</td>
				<td><fmt:formatDate value="${m.memberEnrolldate}" pattern="yy-MM-dd HH:mm"/></td>
				<td>${m.memberDeltype }</td>
			</tr>
			</c:forEach>
		</table>
		<!-- pagination{s} -->
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
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
