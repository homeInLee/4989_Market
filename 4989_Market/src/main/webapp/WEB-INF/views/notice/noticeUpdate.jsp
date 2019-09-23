<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
textarea {
border: 1px solid lightgray;
}
div#noticeUpdate-container{
width:500px; 
margin:0 auto; 
text-align:center;
padding: 10px;
}
div#noticeUpdate-container table th,tr,td{
margin-bottom:15px;
padding:5px;
}

div#noticeUpdate-container input,
div#noticeUpdate-container textarea{
margin-bottom:5px;
margin-top: 5px;
}

div#noticeUpdate-container .log{
color: #1b5ac2;
width: 75px;
height: 40px;
}
div#noticeUpdate-container select{
border: 1px solid lightgray;
}
input.log{
cursor: pointer;
}
</style>
<br />
<br />
<h2 style="text-align: center;">공지사항 수정</h2>
<br />
<div id="noticeUpdate-container">
	<form name="noticeUpdateFrm" action="${pageContext.request.contextPath}/notice/noticeWriteEnd.do" method="post" >
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" 
					class="form-control" 
					name="noticeTitle" 
					id="noticeTitle" 
					value="${notice.noticeTitle }"
					required>
				</td>
			</tr>
			<tr>
				<th>분류</th>
				<td style="text-align: left;">
				<c:if test="${not empty notice.noticeType}">
				<select name="noticeType" id="noticeType" >
					<option value="m" >회원관련</option>	
					<option value="p" >결제관련</option>	
					<option value="s" >중고거래관련</option>	
					<option value="a" >경매관련</option>	
					<option value="o" >기타</option>	
				</select>
				</c:if>
				</td>
				</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" 
							class="form-control" 
							readonly 
							value="${memberLoggedIn.memberId}" 
							name="noticeWriter" 
							id="noticeWriter" 
							required>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>	
				<textarea name="noticeContent" id="noticeContent" cols="40" rows="10" required>${notice.noticeContent }</textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="upfile" id="upfile" />
				</td>
			</tr>
			
		</table>
		<br />
		<input class="log" type="submit" value="등록" >
		&nbsp;&nbsp;&nbsp;
		<input class="log" type="button" value="취소" >
	</form>
</div>
<script>
$("input:button.log").click(()=>{
	location.href='${pageContext.request.contextPath}/notice/noticeList.do'
})

$("#noticeType").val("${notice.noticeType}").attr("selected","selected");


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>