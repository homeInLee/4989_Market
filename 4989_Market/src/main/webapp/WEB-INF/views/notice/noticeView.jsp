<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
#noticeViewTable {
	margin-left: 150px;
	text-align: center;
}

#noticeViewTable tr {
	border: 1px solid;
	width: 800px;
}

#noticeViewTable th {
	border: 1px solid;
	width: 100px;
}

#noticeViewTable td {
	border: 1px solid;
	width: 100px;
	padding: 10px;
}

table#noticeViewTable td#drop {
	cursor: pointer;
}

.zeta-menu-bar {
	display: inline-block;
	width: 100%;
}

.zeta-menu {
	margin: 0;
	padding: 0;
}

.zeta-menu li {
	float: left;
	list-style: none;
	position: relative;
}

/* .zeta-menu li:hover { */
/* 	background: black; */
/* } */

/* .zeta-menu li.expand { */
/* 	background: white; */
/* } */

.zeta-menu li.expand>a {
	color: black;
}

.zeta-menu a {
	display: block;
	padding: 10px 20px;
	text-decoration: none;
}

/* .zeta-menu li.expand #declaration:hover{ */
/* background: lightgray;}  */

/* .zeta-menu li.expand>a:hover{ */
/* background: white;}  */

.zeta-menu ul {
	background: #fff;
	border: 1px solid silver;
	display: none;
	padding: 0;
	position: absolute;
/* 	여기부터 위치 조정 */
	left: -11;
	top: -99;
	width: 115px;
}

.zeta-menu ul li {
	float: none;
}

.zeta-menu ul li.expand {
	background: #ddd;
}

.zeta-menu ul li.expand a {
	color: black;
}

.zeta-menu ul a {
	color: black;
}

.zeta-menu ul ul {
	left: 100%;
	top: 0;
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
		<td>
		<div class='zeta-menu-bar'>
  		<ul class="zeta-menu">	
		<li><a href="#">${notice.noticeWriter }</a>
	   		<ul>
		      <li><a id="memberNotice">회원정보</a></li>
		      <li><a href="${pageContext.request.contextPath}/declaration/memberDeclaration?declarationReceiver=${notice.noticeWriter}" 
		      		onclick="window.open(this.href,'팝업','width=500,height=500,location=no,status=no,scrollbars=yes'); return false;">신고</a></li>
	          <li><input type="hidden" name="declarationReceiver" value="${notice.noticeWriter}"/></li>
	        </ul>
		</li>
		</ul>
	     </div>   
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="5">${notice.noticeTitle }</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="5">
	<c:choose>
	<c:when test="${not empty attachMap}">
	<c:forEach items="${attachMap}" var="a" varStatus="status">
		${a['originalfileName']}<c:if test="${status.last eq false}">,</c:if>
	</c:forEach>
	</c:when>
	<c:when test="${empty attachMap}">
		<span>첨부파일이 없습니다.</span>
	</c:when>
	</c:choose>
		</td>
	</tr>
	<tr style="height: 300px;">
		<th>내용</th>
		<td colspan="5">
	<c:forEach items="${attachMap}" var="a">
		<img style="width: 200px; height: 200px;" alt="" src="${pageContext.request.contextPath}/resources/upload/notice/${a['renamedfileName']}">
		<br />
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
	
$("#drop").click(()=>{
	alert("아이디클릭");
	$(".manubar").css('display','block');
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

console.log($("[name=declarationReceiver]").val());
	


</script>













<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

