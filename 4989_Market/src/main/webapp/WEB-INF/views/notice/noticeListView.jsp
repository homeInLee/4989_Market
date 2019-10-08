<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
input.btn.btn{
width:180px;
background-color: white; 
border: 1px solid #1b5ac2;
color: navy;
padding: 15px 0;
text-align: center;
text-decoration: none;
display: inline;
font-size: 15px;
margin: 30px 0 0 0;
cursor: pointer;
}

input.btn:hover{
background: #1b5ac2;
color: #fff;
}
div#result.result{
border-collapse: none;
height: 230px;
}

div#result.result tr:nth-child(n):not(:nth-child(1)):hover {
color: black;
cursor: pointer;
border: 1px solid #1b5ac2;
}
div#result.result th{
/* border: none; */
width: 800px;
height: 50px;
margin: auto;
padding: 0;
text-align: center;
}
div#result.result table{
width: 800px;
margin: auto;
}
div#result tr{
/* border-spacing: 0 50px; */
border: none;
height: 40px;
margin: auto;
padding: 0px;
text-align: center;
}
div#result td{
border: none;
padding: 0 0;
text-align: center;
}
/* div#result td:nth-child(1){ */
/* width: 200px; */
/* } */



.btn-write{
width: 75px;
height: 40px;
position: absolute; 
right: 0;
font-size: 16px;
margin: 20px 0 0 0;
background: #fff;
border: 1px solid #1b5ac2;
border-radius: 7px;
color: #1b5ac2;
cursor: pointer;
}

.hide, .accordion_banner{display:none;}
div#noticeListView-container{margin:0 auto;}
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


<br />
<br />
<h2 style="text-align: center;">공지사항</h2>
<br />
<div id="noticeListView-container">
<section id="header-bottom">
	<div id="header-catagory">
			<input type="button" 
					class="btn btn-block btn-outline-success member" 
					value="회원관련">
			<input type="button" 
					class="btn btn-block btn-outline-success payment" 
					value="결제관련">
			<input type="button" 
					class="btn btn-block btn-outline-success sell" 
					value="중고거래관련">
			<input type="button" 
					class="btn btn-block btn-outline-success auction" 
					value="경매관련">
			<input type="button" 
					class="btn btn-block btn-outline-success other" 
					value="기타">
	</div>
	<br />
	<div class="result" id="result">
		<table class=table>
		<colgroup><col width='5%'><col width='15%'><col width='45%'><col width='10%'><col width='15%'><col width='10%'></colgroup>
		<tr><th>번호</th><th>구분</th><th>제목</th><th>글쓴이</th><th>날짜</th><th>조회수</th></tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="5">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
		<c:forEach items="${list }" var="n">
			<tr noticeNo="${n.noticeNo}">
				<td>${n.noticeNo }</td>
				<c:if test="${not empty n.noticeType}">
				<c:choose>
					<c:when test="${n.noticeType == 'm'}">
					<td>[회원관련]</td>
					</c:when>
					<c:when test="${n.noticeType == 'p'}">
					<td>[결제관련]</td>
					</c:when>
					<c:when test="${n.noticeType == 's'}">
					<td>[중고거래관련]</td>
					</c:when>
					<c:when test="${n.noticeType == 'a'}">
					<td>[경매관련]</td>
					</c:when>
					<c:when test="${n.noticeType == 'o'}">
					<td>[기타]</td>
					</c:when>
				</c:choose>
				</c:if>
				<td>${n.noticeTitle }</td>
				<td>${n.noticeWriter }</td>
				<td>${n.noticeDate.substring(0,10)}</td>
				<td>${n.noticeReadCount}</td>
			</tr>
		</c:forEach>
		</c:if>
			<tr id="hide">
			<td>${n.noticeContent}</td>
			</tr>
		</table>
		</div>
<%-- 	<c:if test="${memberLoggedIn.memberId eq 'admin' }"> --%>
	<div id="everyDiv">
	<ul class="pageUl">
		<c:if test="${paging.prev}">
			<li class="pageLi"><a class="pageB" href="#" onClick="fn_prev_e('${paging.page}', '${paging.range}', '${paging.rangeSize}')">&lt;이전</a></li>
		</c:if>
			
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
			<li class="pageLi" "<c:out value="${paging.page == idx ? 'active' : ''}"/>"><a class="pageA" href="#" onClick="fn_pagination_e('${idx}', '${paging.range}', '${paging.rangeSize}')"> ${idx} </a></li>
		</c:forEach>
			
		<c:if test="${paging.next}">
			<li class="pageLi" ><a class="pageB" href="#" onClick="fn_next_e('${paging.range}', '${paging.range}', '${paging.rangeSize}')" >다음&gt;</a></li>
		</c:if>
	</ul>
	</div>
	<div id="memberDiv" style="display: none;">
	<ul class="pageUl">
		<c:if test="${paging.prev}">
			<li class="pageLi"><a class="pageB" href="#" onClick="fn_prev_m('${paging.page}', '${paging.range}', '${paging.rangeSize}')">&lt;이전</a></li>
		</c:if>
			
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
			<li class="pageLi" "<c:out value="${paging.page == idx ? 'active' : ''}"/>"><a class="pageA" href="#" onClick="fn_pagination_m('${idx}', '${paging.range}', '${paging.rangeSize}')"> ${idx} </a></li>
		</c:forEach>
			
		<c:if test="${paging.next}">
			<li class="pageLi" ><a class="pageB" href="#" onClick="fn_next_m('${paging.range}', '${paging.range}', '${paging.rangeSize}')" >다음&gt;</a></li>
		</c:if>
	</ul>
	</div>
	<div id="paymentDiv" style="display: none;">
	<ul class="pageUl">
		<c:if test="${paging.prev}">
			<li class="pageLi"><a class="pageB" href="#" onClick="fn_prev_p('${paging.page}', '${paging.range}', '${paging.rangeSize}')">&lt;이전</a></li>
		</c:if>
			
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
			<li class="pageLi" "<c:out value="${paging.page == idx ? 'active' : ''}"/>"><a class="pageA" href="#" onClick="fn_pagination_p('${idx}', '${paging.range}', '${paging.rangeSize}')"> ${idx} </a></li>
		</c:forEach>
			
		<c:if test="${paging.next}">
			<li class="pageLi" ><a class="pageB" href="#" onClick="fn_next_p('${paging.range}', '${paging.range}', '${paging.rangeSize}')" >다음&gt;</a></li>
		</c:if>
	</ul>
	</div>
	<div id="sellDiv" style="display: none;">
	<ul class="pageUl">
		<c:if test="${paging.prev}">
			<li class="pageLi"><a class="pageB" href="#" onClick="fn_prev_s('${paging.page}', '${paging.range}', '${paging.rangeSize}')">&lt;이전</a></li>
		</c:if>
			
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
			<li class="pageLi" "<c:out value="${paging.page == idx ? 'active' : ''}"/>"><a class="pageA" href="#" onClick="fn_pagination_s('${idx}', '${paging.range}', '${paging.rangeSize}')"> ${idx} </a></li>
		</c:forEach>
			
		<c:if test="${paging.next}">
			<li class="pageLi" ><a class="pageB" href="#" onClick="fn_next_s('${paging.range}', '${paging.range}', '${paging.rangeSize}')" >다음&gt;</a></li>
		</c:if>
	</ul>
	</div>
	<div id="auctionDiv" style="display: none;">
	<ul class="pageUl">
		<c:if test="${paging.prev}">
			<li class="pageLi"><a class="pageB" href="#" onClick="fn_prev_a('${paging.page}', '${paging.range}', '${paging.rangeSize}')">&lt;이전</a></li>
		</c:if>
			
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
			<li class="pageLi" "<c:out value="${paging.page == idx ? 'active' : ''}"/>"><a class="pageA" href="#" onClick="fn_pagination_a('${idx}', '${paging.range}', '${paging.rangeSize}')"> ${idx} </a></li>
		</c:forEach>
			
		<c:if test="${paging.next}">
			<li class="pageLi" ><a class="pageB" href="#" onClick="fn_next_a('${paging.range}', '${paging.range}', '${paging.rangeSize}')" >다음&gt;</a></li>
		</c:if>
	</ul>
	</div>
	<div id="otherDiv" style="display: none;">
	<ul class="pageUl">
		<c:if test="${paging.prev}">
			<li class="pageLi"><a class="pageB" href="#" onClick="fn_prev_o('${paging.page}', '${paging.range}', '${paging.rangeSize}')">&lt;이전</a></li>
		</c:if>
			
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
			<li class="pageLi" "<c:out value="${paging.page == idx ? 'active' : ''}"/>"><a class="pageA" href="#" onClick="fn_pagination_o('${idx}', '${paging.range}', '${paging.rangeSize}')"> ${idx} </a></li>
		</c:forEach>
			
		<c:if test="${paging.next}">
			<li class="pageLi" ><a class="pageB" href="#" onClick="fn_next_o('${paging.range}', '${paging.range}', '${paging.rangeSize}')" >다음&gt;</a></li>
		</c:if>
	</ul>
	</div>
	<input type="button" class="btn-write" onclick="location.href='${pageContext.request.contextPath}/notice/noticeWrite'" value="글쓰기"/>
<%-- 	</c:if> --%>
</section>
</div>
<script>
$(()=>{
	$("tr[noticeNo]").click(function(){
		var noticeNo = $(this).attr("noticeNo")
// 		$("#accordian ul ul").slideUp();
// 			if (!$(this).next().is(":visible")) {
// 				$(this).next().slideDown();
// 			}
		location.href = "${pageContext.request.contextPath}/notice/noticeView.do?noticeNo="+noticeNo;
// 		$.ajax({
// 		url: "${pageContext.request.contextPath}/notice/noticeMember",
// 		dataType: "json",
// 		type: "GET",
// 		success: (data)=>{
// 			console.log(data);
// 			var html = "<table class=table>";
// 			html += "<colgroup><col width='5%'><col width='60%'><col width='10%'><col width='15%'><col width='10%'></colgroup>";
// 			html += "<tr><th>번호</th><th>제목</th><th>글쓴이</th><th>날짜</th><th>조회수</th></tr>";
// 			html += "<hr/>"
// 			if(data.length == 0){
// 				  html += '<tr><td colspan = "5">데이터가 없습니다.</td></tr>';
// 		            html += '</table>'
// 		            $("#result").html(html);
// 		            return;
// 			}else{
// 				for(var i in data){
// 				html += "<tr><td>"+data[i].noticeNo+"</td>";
// 				html += "<td>"+data[i].noticeTitle+"</td>";
// 				html += "<td>"+data[i].noticeWriter+"</td>";
// 				html += "<td>"+data[i].noticeDate.substring(0,10)+"</td>";
// 				html += "<td>"+data[i].noticeReadCount+"</td>";
// 			}
// 			html+="</table>";
// 			$("#result").html(html);
// 			}
// 		},
// 		error: (xhr,textStatus,err)=>{
// 			console.log("ajax 처리 실패!", xhr, textStatus, err);
// 		}
		
// 		});
	});
});
// $("#header-bottom .member").on("click",()=>{
// 	$.ajax({
// 		url: "${pageContext.request.contextPath}/notice/noticeMember",
// 		dataType: "json",
// 		type: "GET",
// 		success: (data)=>{
// 			console.log(data);
// 			var html = "<table class=table>";
// 			html += "<colgroup><col width='5%'><col width='60%'><col width='10%'><col width='15%'><col width='10%'></colgroup>";
// 			html += "<tr><th>번호</th><th>제목</th><th>글쓴이</th><th>날짜</th><th>조회수</th></tr>";
// 			html += "<hr/>"
// 			if(data.length == 0){
// 				  html += '<tr><td colspan = "5">데이터가 없습니다.</td></tr>';
// 		            html += '</table>'
// 		            $("#result").html(html);
// 		            return;
// 			}else{
// 				for(var i in data){
// 				html += "<tr><td>"+data[i].noticeNo+"</td>";
// 				html += "<td>"+data[i].noticeTitle+"</td>";
// 				html += "<td>"+data[i].noticeWriter+"</td>";
// 				html += "<td>"+data[i].noticeDate.substring(0,10)+"</td>";
// 				html += "<td>"+data[i].noticeReadCount+"</td>";
// 			}
// 			html+="</table>";
// 			$("#result").html(html);
// 			}
// 		},
// 		error: (xhr,textStatus,err)=>{
// 			console.log("ajax 처리 실패!", xhr, textStatus, err);
// 		}
		
// 	});
// });
	
// $("#header-bottom .payment").on("click",()=>{
// 		$.ajax({
// 			url: "${pageContext.request.contextPath}/notice/noticePayment",
// 			dataType: "json",
// 			type: "GET",
// 			success: (data)=>{
// 				console.log(data);
// 				var html = "<table class=table>";
// 				html += "<colgroup><col width='5%'><col width='60%'><col width='10%'><col width='15%'><col width='10%'></colgroup>";
// 				html+="<tr><th>번호</th><th>제목</th><th>글쓴이</th><th>날짜</th><th>조회수</th></tr>";
// 				if(data.length == 0){
// 					  html += '<tr><td colspan = "5">데이터가 없습니다.</td></tr>';
// 			            html += '</table>'
// 			            $("#result").html(html);
// 			            return;
// 				} else {
// 					for(var i in data){
// 					html += "<tr><td>"+data[i].noticeNo+"</td>";
// 					html += "<td>"+data[i].noticeTitle+"</td>";
// 					html += "<td>"+data[i].noticeWriter+"</td>";
// 					html += "<td>"+data[i].noticeDate.substring(0,10)+"</td>";
// 					html += "<td>"+data[i].noticeReadCount+"</td>";
// 				}
// 				html+="</table>";
// 				$("#result").html(html);
// 				}
// 			},
// 			error: (xhr,textStatus,err)=>{
// 				console.log("ajax 처리 실패!", xhr, textStatus, err);
// 			}
			
// 		});
// });
// $("#header-bottom .sell").on("click",()=>{
// 		$.ajax({
// 			url: "${pageContext.request.contextPath}/notice/noticeSell",
// 			dataType: "json",
// 			type: "GET",
// 			success: (data)=>{
// 				console.log(data);
// 				var html = "<table class=table>";
// 				html += "<colgroup><col width='5%'><col width='60%'><col width='10%'><col width='15%'><col width='10%'></colgroup>";
// 				html+="<tr><th>번호</th><th>제목</th><th>글쓴이</th><th>날짜</th><th>조회수</th></tr>";
// 				if(data.length == 0){
// 					  html += '<tr><td colspan = "5">데이터가 없습니다.</td></tr>';
// 			            html += '</table>'
// 			            $("#result").html(html);
// 			            return;
// 				}else{
// 					for(var i in data){
// 					html += "<tr><td>"+data[i].noticeNo+"</td>";
// 					html += "<td>"+data[i].noticeTitle+"</td>";
// 					html += "<td>"+data[i].noticeWriter+"</td>";
// 					html += "<td>"+data[i].noticeDate.substring(0,10)+"</td>";
// 					html += "<td>"+data[i].noticeReadCount+"</td>";
// 				}
// 				html+="</table>";
// 				$("#result").html(html);
// 				}
// 			},
// 			error: (xhr,textStatus,err)=>{
// 				console.log("ajax 처리 실패!", xhr, textStatus, err);
// 			}
			
// 		});
// });
// $("#header-bottom .auction").on("click",()=>{
// 		$.ajax({
// 			url: "${pageContext.request.contextPath}/notice/noticeAuction",
// 			dataType: "json",
// 			type: "GET",
// 			success: (data)=>{
// 				console.log(data);
// 				var html = "<table class=table>";
// 				html += "<colgroup><col width='5%'><col width='60%'><col width='10%'><col width='15%'><col width='10%'></colgroup>";
// 				html+="<tr><th>번호</th><th>제목</th><th>글쓴이</th><th>날짜</th><th>조회수</th></tr>";
// 				if(data.length == 0){
// 					  html += '<tr><td colspan = "5">데이터가 없습니다.</td></tr>';
// 			            html += '</table>'
// 			            $("#result").html(html);
// 			            return;
// 				}else{
// 					for(var i in data){
// 					html += "<tr><td>"+data[i].noticeNo+"</td>";
// 					html += "<td>"+data[i].noticeTitle+"</td>";
// 					html += "<td>"+data[i].noticeWriter+"</td>";
// 					html += "<td>"+data[i].noticeDate.substring(0,10)+"</td>";
// 					html += "<td>"+data[i].noticeReadCount+"</td>";
// 				}
// 				html+="</table>";
// 				$("#result").html(html);
// 				}
// 			},
// 			error: (xhr,textStatus,err)=>{
// 				console.log("ajax 처리 실패!", xhr, textStatus, err);
// 			}
			
// 		});
// });
// $("#header-bottom .other").on("click",()=>{
// 		$.ajax({
// 			url: "${pageContext.request.contextPath}/notice/noticeOther",
// 			dataType: "json",
// 			type: "GET",
// 			success: (data)=>{
// 				console.log(data);
// 				var html = "<table class=table>";
// 				html += "<colgroup><col width='5%'><col width='60%'><col width='10%'><col width='15%'><col width='10%'></colgroup>";
// 				html+="<tr><th>번호</th><th>제목</th><th>글쓴이</th><th>날짜</th><th>조회수</th></tr>";
// 				if(data.length == 0){
// 					  html += '<tr><td colspan = "5">데이터가 없습니다.</td></tr>';
// 			            html += '</table>'
// 			            $("#result").html(html);
// 			            return;
// 				}else{
// 					for(var i in data){
// 					html += "<tr noticeNo="+data[i].noticeNo"><td>"+data[i].noticeNo+"</td>";
// 					html += "<td>"+data[i].noticeTitle+"</td>";
// 					html += "<td>"+data[i].noticeWriter+"</td>";
// 					html += "<td>"+data[i].noticeDate.substring(0,10)+"</td>";
// 					html += "<td>"+data[i].noticeReadCount+"</td>";
// 					html += '<input type="hidden" name="noticeNo" value='+data[i].noticeNo+'/>'
// 					}
// 				html+="</table>";
// 				$("#result").html(html);
// 				}
// 			},
// 			error: (xhr,textStatus,err)=>{
// 				console.log("ajax 처리 실패!", xhr, textStatus, err);
// 			}
			
// 		});
// });
</script>
<script>
$("#header-bottom .member").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticeMember";
	$("#everyDiv").hide();
	$("#paymentDiv").hide();
	$("#sellDiv").hide();
	$("#auctionDiv").hide();
	$("#otherDiv").hide();
	$("#memberDiv").show();
// alert("member");
});
$("#header-bottom .payment").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticePayment";
	$("#everyDiv").hide();
	$("#memberDiv").hide();
	$("#sellDiv").hide();
	$("#auctionDiv").hide();
	$("#otherDiv").hide();
	$("#paymentDiv").show();
// alert("payment");
});
$("#header-bottom .sell").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticeSell";
	$("#everyDiv").hide();
	$("#memberDiv").hide();
	$("#paymentDiv").hide();
	$("#auctionDiv").hide();
	$("#otherDiv").hide();
	$("#sellDiv").show();
// alert("sell");
});
$("#header-bottom .auction").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticeAuction";
	$("#everyDiv").hide();
	$("#memberDiv").hide();
	$("#paymentDiv").hide();
	$("#sellDiv").hide();
	$("#otherDiv").hide();
	$("#auctionDiv").show();
// alert("auction");
});
$("#header-bottom .other").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticeOther";
	$("#everyDiv").hide();
	$("#memberDiv").hide();
	$("#paymentDiv").hide();
	$("#sellDiv").hide();
	$("#auctionDiv").hide();
	$("#otherDiv").show();
// alert("other");
});
//이전 버튼 이벤트

function fn_prev_e(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticeList.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination_e(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/notice/noticeList.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;

	location.href = url;	
}

//다음 버튼 이벤트
function fn_next_e(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticeList.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}
//이전 버튼 이벤트

function fn_prev_m(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticeMember.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination_m(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/notice/noticeMember.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;

	location.href = url;	
}

//다음 버튼 이벤트
function fn_next_m(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticeMember.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}
//이전 버튼 이벤트

function fn_prev_p(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticePayment.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination_p(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/notice/noticePayment.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;

	location.href = url;	
}

//다음 버튼 이벤트
function fn_next_p(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticePayment.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}
//이전 버튼 이벤트

function fn_prev_s(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticeSell.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination_s(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/notice/noticeSell.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;

	location.href = url;	
}

//다음 버튼 이벤트
function fn_next_s(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticeSell.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}
//이전 버튼 이벤트

function fn_prev_a(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticeAuction.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination_a(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/notice/noticeAuction.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;

	location.href = url;	
}

//다음 버튼 이벤트
function fn_next_a(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticeAuction.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}
//이전 버튼 이벤트

function fn_prev_o(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticeOther.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination_o(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/notice/noticeOther.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;

	location.href = url;	
}

//다음 버튼 이벤트
function fn_next_o(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "${pageContext.request.contextPath}/notice/noticeOther.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	
	location.href = url;
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
