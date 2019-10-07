<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<style>
tbody, tr{
display: block;
}
#commentFrm{
	border: 1px solid #9999;
	margin: 0px;
	padding: 5px;
}
strong{
padding: 0 0 10px;
}
#sbtn, #rbtn{
text-align: right;
}
#btn-send, #btn-resend{
padding: 8px 9px 8px;
border: 2px solid #1b5ac2;
border-radius: 4px;
background: #fff;
margin: 5px;
}
#re-send, #re-delete{
 padding: 0 3px 3px;
border: 2px solid #1b5ac2;
border-radius: 4px;
background: #fff;
margin: 5px;
 }
#re-send{
 margin-left: 50px;
 }
textarea{
border:1px solid #F2F2F2;
padding: 8px 11.2px;
display: block;
resize: none;
}
textarea::placeholder{
color: #1b5ac2;
font-weight: bold;
}
#reply{
margin-left : 35px;
padding: 10px;
display: block;
}

#commentList{
padding: 15px;
}
.commentList_table{
border-bottom:1px solid #F2F2F2;
padding: 5px;
}

</style>
<p style="font-size: 13px; line-height: 1.46; letter-spacing: -0.6px; color: #868e96;">댓글 <span id="cCnt_"></span> ∙ 관심 13 ∙ 조회 ${auctionSelectOne.get(0).auctionReadcount }</p>
<div id="container">
	<form action="" id="commentFrm" method="post">
	<br />
		<div>
			<span><strong>Comments</strong></span> <span id="cCnt"></span>
		</div>
		<div>
			<table>
				<tr>
					<td>
						<input type="hidden" name="commentWriter" value="${memberLoggedIn.memberId}">
						<textarea style="width: 800px" rows="3" cols="30" name="commentContent" id="comment" placeholder="댓글을 입력하세요"></textarea>
						<input type="hidden" id="auctionNo" name="auctionSelectOne.auctionNo" value="${auctionSelectOne.get(0).auctionNo }">
						<br />
						<c:if test="${memberLoggedIn != null }">
						<div id="sbtn">
							<input type="button" id="btn-send" value="등록">
						</div>
						</c:if>
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
//대댓글 입력창 보여주기
function replyComment(btn) {
	console.log("!!");
	
	var param = {commentNo: btn};
	var  reply =
		"<table id='reply'><tr><td>" +
	"<input type='hidden' name='commentWriter' value='${memberLoggedIn.memberId}'>"+
	"<input type='hidden' name='commentREF' value='"+param.commentNo+"'>"+
	"<input type='hidden' name='coBoardNo' name='auctionSelectOne.auctionNo' value='${auctionSelectOne.get(0).auctionNo }'/>"+
	"<textarea rows='3' cols='30' name='commentContent_' placeholder='답글을 입력하세요'></textarea>"+
	"<div id='rbtn'><input type='button' id='btn-resend' value='등록'></div></td></tr></table>";
	$("#reply").html(reply);
}
 $(()=>{
	//댓글 등록
	$("#commentFrm #btn-send").on("click", ()=>{
		var comment = {};
		comment.commentWriter = $("#commentFrm [name=commentWriter]").val();
		comment.commentContent = $("#commentFrm [name=commentContent]").val();
		comment.coBoardNo = '${auctionSelectOne.get(0).auctionNo}';
		console.log(comment);		
		$.ajax({
			url: "${pageContext.request.contextPath}/comment/commentInsert",
			data: comment,
			dataType: "json",
			type: "POST",
			success: (data)=>{
				console.log(data);
				getcommentList();
				$("#commentFrm [name=commentContent]").val("");
			},
			error: (xhr, txtStatus, err)=>{
				console.log("ajax처리실패!", xhr, txtStatus, err);
			}
		});
	});	
	
	//대댓글 입력
	$(document).on("click", "#btn-resend", ()=>{
		var comment = {};
		comment.commentWriter = $("[name=commentWriter]").val();
		comment.commentREF = $("[name=commentREF]").val();
		comment.commentContent = $("[name=commentContent_]").val();
		comment.coBoardNo = '${auctionSelectOne.get(0).auctionNo}';
		console.log(comment);		
		$.ajax({
			url: "${pageContext.request.contextPath}/comment/commentInsert2",
			data: comment,
			dataType: "json",
			type: "POST",
			success: (data)=>{
				console.log(data);
				getcommentList();
				$(".commentContent_").val("");
			},
			error: (xhr, txtStatus, err)=>{
				console.log("ajax처리실패!", xhr, txtStatus, err);
			}
		});
	});	
	
});

	
//댓글삭제
function deleteComment(btn){
	
	var param = {
			commentNo : btn
	}
	var result = confirm("삭제하시겠습니까");
	if(result == false){
		return;
	}else{
		
	
	console.log(param);
	
	$.ajax({
		url: "${pageContext.request.contextPath}/comment/commentDelete",
		dataType: "json",
		type: "POST",
		data: param,
		success: function(data){
                alert(data.msg);
                location.reload(); 
		},
		error: function(jqxhr, textStatus, errorThrown){
            console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
        }
	});
	}
}

//댓글 리스트
$(function() {
	getcommentList();
});
function getcommentList() {
	var param = {
			auctionNo : '${auctionSelectOne.get(0).auctionNo}'
	}
	
	$.ajax({
		type:'GET',
		url: "${pageContext.request.contextPath}/comment/commentList",
		dataType: "json",
		data: param,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data){
            console.log(data);
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<table class='commentList_table'>";
                    if(data[i].commentLevel==1){
	                    html += "<tr><td colspan='2'><h6><strong>"+data[i].commentWriter+"</strong></h6></td></tr>";
	                    html += "<tr><td>"+data[i].commentContent+"</td>";
	                    html += "<td>";
	                    html += "<c:if test='${memberLoggedIn.memberId == auctionSelectOne.get(0).auctionWriter }'>";
	                    html += "<input type='button' id='re-send' value='답글' onclick='replyComment("+data[i].commentNo+");' />"; 
	                    html += "</c:if>";
	                    html += "<c:if test='${memberLoggedIn.memberId != commentWriter }'>";
	                    html += "<input type='button' id='re-delete' value='삭제'  onclick='deleteComment("+data[i].commentNo+");'/>"; 
	                    html += "</c:if>";
	                    html += "</td></tr>";
                    } else if(data[i].commentLevel == 2){
	                    html += "<tr><td colspan='2' style='padding-left : 30px;'><h6><strong>"+data[i].commentWriter+"</strong></h6></td></tr>";
	                    html += "<tr><td style='padding-left : 30px;'>"+data[i].commentContent+"</td>";
	                    html += "<td>";
	                    html += "<c:if test='${memberLoggedIn.memberId == auctionSelectOne.get(0).auctionWriter }'>";
	                    html += "<input type='button' id='re-send' value='답글' onclick='replyComment("+data[i].commentNo+");' />"; 
	                    html += "</c:if>";
	                    html += "<c:if test='${memberLoggedIn.memberId != commentWriter }'>";
	                    html += "<input type='button' id='re-delete' value='삭제'  onclick='deleteComment("+data[i].commentNo+");'/>"; 
	                    html += "</c:if>";
	                    html += "</td></tr>";
                    } 
                    html += "</table>";
                    html += "<table id='reply'>";
                   	html += "</table>";
                }
                
            } else {
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
            }
            
            $("#cCnt, #cCnt_").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(jqxhr,textStatus,errorThrown){
        	console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
       }
	});
}

</script>
