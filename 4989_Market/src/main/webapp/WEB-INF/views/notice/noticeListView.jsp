<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
input.btn.btn{
width:200px;
background-color: white; 
border: 1px solid #1b5ac2;
color: navy;
padding: 15px 0;
text-align: center;
text-decoration: none;
display: inline;
font-size: 15px;
margin: 50px 0 0 0;
cursor: pointer;
}

input.btn:hover{
background: #1b5ac2;
color: #fff;
}
div#result.result{
border-collapse: none;
height: 1000px;
}

div#result.result tr:nth-child(n):not(:nth-child(1)):hover {
color: black;
cursor: pointer;
border: 1px solid #1b5ac2;
}
div#result.result th{
border: none;
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
</style>


<br />
<br />
<h2 style="text-align: center;">noticeListView</h2>
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
// alert("member");
});
$("#header-bottom .payment").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticePayment";
// alert("payment");
});
$("#header-bottom .sell").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticeSell";
// alert("sell");
});
$("#header-bottom .auction").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticeAuction";
// alert("auction");
});
$("#header-bottom .other").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticeOther";
// alert("other");
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
