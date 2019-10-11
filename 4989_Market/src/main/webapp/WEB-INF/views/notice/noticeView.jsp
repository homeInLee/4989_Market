<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
#noticeViewTable {
/* 	margin-left: 205px; */
	text-align: center;
}

#noticeViewTable tr {
	border: 1px solid lightgray;
	width: 800px;
}

#noticeViewTable th {
	border: 1px solid lightgray;
	width: 100px;
}

#noticeViewTable td {
	border: 1px solid lightgray;
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

table#noticeViewTable{
 width: 90%;
 border-top: 1px solid #444444;
 border-collapse: collapse;
 margin-left: 60px;
}

.btn-list{
width: 75px;
height: 40px;
position: absolute; 
right: 50;
font-size: 16px;
margin: 20px 0 0 0;
background: #fff;
border: 1px solid #1b5ac2;
border-radius: 7px;
color: #1b5ac2;
cursor: pointer;
}
.btn-update{
width: 75px;
height: 40px;
position: absolute; 
right: 130;
font-size: 16px;
margin: 20px 0 0 0;
background: #fff;
border: 1px solid #1b5ac2;
border-radius: 7px;
color: #1b5ac2;
cursor: pointer;
}
.btn-noticeDel{
width: 75px;
height: 40px;
position: absolute; 
right: 50;
font-size: 16px;
margin: 20px 0 0 0;
background: #fff;
border: 1px solid #1b5ac2;
border-radius: 7px;
color: #1b5ac2;
cursor: pointer;
}
.btn-decProcess{
width: 75px;
height: 40px;
position: absolute; 
right: 130;
font-size: 16px;
margin: 20px 0 0 0;
background: #fff;
border: 1px solid #1b5ac2;
border-radius: 7px;
color: #1b5ac2;
cursor: pointer;
}
.btn-noticeDec{
width: 75px;
height: 40px;
position: absolute; 
right: 210;
font-size: 16px;
margin: 20px 0 0 0;
background: #fff;
border: 1px solid #1b5ac2;
border-radius: 7px;
color: #1b5ac2;
cursor: pointer;
}
</style>

<%-- <h2 style="text-align: center; background: #1b5ac2;">${notice.noticeTitle }</h2> --%>
<c:if test="${memberLoggedIn.memberId eq 'admin' }">
<input type="button" class="btn-decProcess" id="declarationProcess" value="신고처리" />
<!-- <input type="button" class="btn-noticeDec" id="noticeDeclaration" onclick="goDeclaration();" value="신고" /> -->
</c:if>
<input type="button" class="btn-list" id="noticeList" value="목록" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'"/>

<br />
<br />
<br />
<table id="noticeViewTable">
<!-- 	<tr> -->
<!-- 		<th>글번호</th> -->
<%-- 		<td>${notice.noticeNo} --%>
<!-- 		</td> -->
<!-- 		<th>조회수</th> -->
<%-- 		<td>${notice.noticeReadCount}</td> --%>
<!-- 		<th>글쓴이</th> -->
<!-- 		<td> -->
<!-- 		<div class='zeta-menu-bar'> -->
<!--   		<ul class="zeta-menu">	 -->
<%-- 		<li><a href="#">${notice.noticeWriter }</a> --%>
<!-- 	   		<ul> -->
<!-- 		      <li><a id="memberNotice">회원정보</a></li> -->
<%-- 		      <li><a href="${pageContext.request.contextPath}/declaration/connectDeclaration?noticeNo?${notice.noticeNo}" id="id-declaration" --%>
<!-- 		      		>신고</a> -->
<!-- 		      		</li> -->
<%-- 	          <li><input type="hidden" name="declarationReceiver" value="${notice.noticeWriter}"/></li> --%>
<!-- 	        </ul> -->
<!-- 		</li> -->
<!-- 		</ul> -->
<!-- 	     </div>    -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th >제목</th> -->
<%-- 		<td  >${notice.noticeTitle }</td> --%>
<!-- 	</tr> -->
	<tr style="background: #1b5ac2; color: white; text-align: left; height: 50px;" >
	<th colspan="2">
	&nbsp;&nbsp;&nbsp;&nbsp;FAQ
	</th>
	</tr>
	<tr>
	<td style="color: #1b5ac2; text-align: left; border-right-width: 0; width: 500px;">
	<c:if test="${not empty notice.noticeType}">
				<c:choose>
					<c:when test="${notice.noticeType == 'm'}">
					[회원관련]
					</c:when>
					<c:when test="${notice.noticeType == 'p'}">
					[결제관련]
					</c:when>
					<c:when test="${notice.noticeType == 's'}">
					[중고거래관련]
					</c:when>
					<c:when test="${notice.noticeType == 'a'}">
					[경매관련]
					</c:when>
					<c:when test="${notice.noticeType == 'o'}">
					[기타]
					</c:when>
				</c:choose>
				</c:if>
	${notice.noticeTitle }
	</td>
	<td style="color: #1b5ac2; text-align: right;  border-collapse: collapse; border-left-width: 0; width: 100px;" >${notice.noticeDate }</td>
	</tr>
	<tr style="height: 300px;">
		<td colspan="6" >
	<c:forEach items="${attachMap}" var="a">
		<img style="width: 200px; height: 200px;" alt="" src="${pageContext.request.contextPath}/resources/upload/notice/${a['renamedfileName']}">
	</c:forEach>
		<br />
		<br />
		<input type="hidden" id="decNo" name="decNo" value="${decNo}"/>
		${notice.noticeContent }
		</td>
	</tr>
	<tr>
		<td style="color: #1b5ac2; background: white; width: 40px;">첨부파일</td>
		<td style="color: gray; text-align: left; width: 1000px;">
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

</table>
<form name="frmPop" id="frmPop" method=post action="${pageContext.request.contextPath}/declaration/connectDeclaration">
<input type="hidden" id="declarationWriter" name="declarationWriter" value="${memberLoggedIn.memberId }" />
<input type="hidden" id="declarationDivision" name="declarationDivision" value="w" />
<input type="hidden" id="declarationReceiver" name="declarationReceiver" value="${notice.noticeWriter }" />
<input type="hidden" id="boardName" name="boardName" value="n" />
<input type="hidden" id="boardNo" name="boardNo" value="${notice.noticeNo}" />
</form>

<c:if test="${memberLoggedIn.memberId eq 'admin' }">
<input type="button" class="btn-update" id="noticeUpdate" value="수정" onclick="location.href='${pageContext.request.contextPath}/notice/noticeUpdate?noticeNo=${noticeNo}'"/>
<input type="button" class="btn-noticeDel" id="noticeDelete" value="삭제" />
</c:if>

<script>
$("#noticeDelete").click(function(){
    if(!confirm("정말 삭제하시겠습니까?")){
    	console.log("삭제취소");
    	return false;
    }else {
    	location.href="${pageContext.request.contextPath}/notice/noticeDelete?noticeNo=${noticeNo}"
		return true;    	
    }
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

console.log($("[name=decNo]").val());
console.log($("[name=declarationReceiver]").val());

$("#noticeDeclaration").click(()=>{
		$("#frmPop").submit();
	});


$("#declarationProcess").click(()=>{
	location.href="${pageContext.request.contextPath}/declaration/declarationProcess?memberId=${notice.noticeWriter}&decNo=${decNo}";
});


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

