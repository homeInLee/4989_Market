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
${auctionSelectOne.get(0).auctionNo }
${selectCommentList.commentNo }
	<form action="" id="commentFrm" method="post">
	<br /><br />
		<div>
			<span><strong>Comments</strong></span> <span id="cCnt"></span>
		</div>
		<div>
			<table>
				<tr>
					<td>
						<input type="hidden" name="commentREF" value="${auctionSelectOne.get(0).auctionNo }">
						<input type="hidden" name="commentWriter" value="${memberLoggedIn.memberId}">
						<input type="hidden" name="commentNo" value="${commentInsert.commentNo }"/>
						<textarea style="width: 800px" rows="3" cols="30" name="commentContent" id="comment" placeholder="댓글을 입력하세요"></textarea>
						<input type="hidden" id="auctionSelectOne.auctionNo" name="auctionSelectOne.auctionNo">
						<br />
						<%-- <c:if test="${memberLoggedIn != null }"> --%>
						<input type="button" id="btn-send" value="등록">
						<%-- </c:if> --%>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
	<form id="commentListFrm" name="commentListFrm" method="post">
	<div id="commentList">
	</div>
	</form>

<script>
$(()=>{
	//댓글 등록
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
				getcommentList();
				$("comment").val("");
			},
			error: (xhr, txtStatus, err)=>{
				console.log("ajax처리실패!", xhr, txtStatus, err);
			}
		});
	});	
});
//댓글삭제
function deleteComment(btn){
	console.log("gg");
	var param = {
			commentNo : btn
	}
	
	console.log(param);
	
	$.ajax({
		url: "${pageContext.request.contextPath}/comment/commentDelete",
		dataType: "json",
		type: "POST",
		data: param,
		success: function(data){
                //$(".commentNo").remove();
                //alert("삭제되었습니다.");
                alert(data.msg);

		},
		error: function(jqxhr, textStatus, errorThrown){
            console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
        }
	});
}

$(function() {
	getcommentList();
});
function getcommentList() {
	var param = {
			auctionNo : $("#commentFrm [name=commentREF]").val()
	}
	
	$.ajax({
		type:'GET',
		url: "${pageContext.request.contextPath}/comment/commentList",
		dataType: "json",
		data: param,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].commentWriter+"</strong></h6>";
                    html += data[i].commentContent + "<tr><td></td></tr>";
                    html += "<input type='button' value='답글' id='btn-reply' />"; 
                    html += "<input type='button' value='삭제'  onclick='deleteComment("+data[i].commentNo+");'/>"; 
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
        	console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
       }
	});
}

	
</script>