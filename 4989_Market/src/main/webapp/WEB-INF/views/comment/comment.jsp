<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<style>
#container{
	border: 1px solid #fff;
}
</style>
<div id="container">
	<form action="" id="commentFrm" method="post">
	<br /><br />
		<div>
			<span><strong>Comments</strong></span> <span id="cCnt"></span>
		</div>
		<div>
			<table>
				<tr>
					<td>
						<input type="hidden" name="commentREF" value="41">
						<textarea style="width: 800px" rows="3" cols="30" name="commentContent" id="comment" placeholder="댓글을 입력하세요"></textarea>
						<input type="hidden" name="commentWriter" value="admin" >
						<br />
						<%-- <c:if test="${memberLoggedIn != null }"> --%>
						<input type="button" id="btn-send" value="등록">
						<%-- </c:if> --%>
					</td>
				</tr>
			</table>
		</div>
		<input type="hidden" id="">
	</form>
</div>
	<div id="commentList">
		<table>
			<c:forEach items="${commentList }" var="c">
				<tr>
					<td><input type="hidden" name="auctionNo">
						${c.commentNo}</td>
					<td>${c.commentLevel }</td>
					<td>${c.commentWriter }</td>
					<td>${c.commentContent }</td>
					<td>${c.commentREF }</td>
					<td>${c.commentDate }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

<script>
$(()=>{
	$("#commentFrm #btn-send").on("click", ()=>{
		var comment = {};
		comment.commentWriter = $("#commentFrm [name=commentWriter]").val();
		comment.commentContent = $("#commentFrm [name=commentContent]").val();
		comment.commentREF = $("#commentFrm [name=commentREF]").val();
		console.log(comment);		
		$.ajax({
			url: "${pageContext.request.contextPath}/comment/commentInsert",
			data: comment,
			dataType: "json",
			type: "POST",
			success: (data)=>{
				console.log(data);
			},
			error: (xhr, txtStatus, err)=>{
				console.log("ajax처리실패!", xhr, txtStatus, err);
			}
		});
	});
	
});
</script>