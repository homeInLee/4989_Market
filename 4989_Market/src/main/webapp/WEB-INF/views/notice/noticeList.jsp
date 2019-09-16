<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
input.btn{
width:200px;
background-color: white; 
border: 1px solid navy;
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

.result{
text-align: center;
}

</style>
<h2 style="text-align: center;">공지사항</h2>

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
	<div class="result" id="result"></div>
</section>

<script>
$("#header-bottom .member").on("click",()=>{
	$.ajax({
		url: "${pageContext.request.contextPath}/notice/noticeMember",
		dataType: "json",
		type: "GET",
		success: (data)=>{
			console.log(data);
			var html = "<table class=table>";
			html+="<tr><th>번호</th><th>제목</th><th>글쓴이</th><th>날짜</th><th>조회수</th></tr>";
			if(data.length == 0){
				  html += '<tr><td colspan = "5">데이터가 없습니다.</td></tr>';
		            html += '</table>'
		            $("#result").html(html);
		            return;
			}else{
				for(var i in data){
				html += "<tr><td>"+data[i].noticeNo+"</td>";
				html += "<td>"+data[i].noticeTitle+"</td>";
				html += "<td>"+data[i].noticeWriter+"</td>";
				html += "<td>"+data[i].noticeDate+"</td>";
				html += "<td>"+data[i].noticeReadCount+"</td>";
			}
			html+="</table>";
			$("#result").html(html);
			}
		},
		error: (xhr,textStatus,err)=>{
			console.log("ajax 처리 실패!", xhr, textStatus, err);
		}
		
	});
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
