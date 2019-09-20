<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

</style>


<br />
<br />
<h2 style="text-align: center;">공지사항</h2>
<br />
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
					class="btn btn-block btn-outline-success declaration" 
					value="경매관련">
			<input type="button" 
					class="btn btn-block btn-outline-success other" 
					value="기타">
	</div>
	<br />
	<div class="result" id="result"></div>
	
	<input type="button" class="btn-write" onclick="location.href='${pageContext.request.contextPath}/notice/noticeWrite'" value="글쓰기"/>
</section>
<script>
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
// $("#header-bottom .declaration").on("click",()=>{
// 		$.ajax({
// 			url: "${pageContext.request.contextPath}/notice/noticeDeclaration",
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
});
$("#header-bottom .payment").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticePayment";
});
$("#header-bottom .sell").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticeSell";
});
$("#header-bottom .declaration").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticeDeclaration";
});
$("#header-bottom .other").click(()=>{
	location.href="${pageContext.request.contextPath}/notice/noticeOther";
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
