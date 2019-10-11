<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
<fmt:requestEncoding value="utf-8"/>
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
#send{
text-align: center;
background: none;
display: block;
margin: 0 auto;
padding-top: 30px;
text-shadow: 0 0 24px #8c59b9;
}
#delete, #reply{
background-color: #403E8C;
  color: white;
  border: 2px solid #403E8C;
  margin-top: 5px;
}
#delete:hover, #reply:hover {
	background: white;
	color: black;
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
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/review/reviewHeader.jsp"></jsp:include>
<div class="submenu">
  	<a id="submenu-btn" href="${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}">받은 쪽지함</a>
  	<a id="submenu-btn" href="${pageContext.request.contextPath}/message/messageList2.do?memberId=${memberLoggedIn.memberId}">보낸 쪽지함</a>
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
<script>
//이전 버튼 이벤트

function fn_prev(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	var url = "${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}";
	url = url + "&page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}";
	url = url + "&page=" + page;
	url = url + "&range=" + range;

	location.href = url;	
}

//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}";
	url = url + "&page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>