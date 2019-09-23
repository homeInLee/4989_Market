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
						<textarea style="width: 800px" rows="3" cols="30" id="comment" placeholder="댓글을 입려하세요"></textarea>
						<br />
						<a href="#" onclick="send_comment();">등록</a>
					</td>
				</tr>
			</table>
		</div>
		<input type="hidden" id="">
	</form>
</div>
<div id="container">
	<form id="commentListFrm" method="post">
		<div id="commentList">
		</div>
	</form>
</div>
<script>
function send_comment() {
	$.ajax({
        type:'POST',
        url : '/comment/commentInsert.do',
        data:$("#commentFrm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            console("실패!!");
       }
        
    });
}
	
	$(function() {
		getCommentList();
	});
function commentList() {
	 $.ajax({
	        type:'GET',
	        url : '/comment/commentList.do',
	        dataType : "json",
	        data:$("#commentListFrm").serialize(),
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	            
	            var html = "";
	            var cCnt = data.length;
	            
	            if(data.length > 0){
	                
	                for(i=0; i<data.length; i++){
	                    html += "<div>";
	                    html += "<div><table class='table'><h6><strong>"+data[i].commentWriter+"</strong></h6>";
	                    html += data[i].comment + "<tr><td></td></tr>";
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
	            $("#commentListFrm").html(html);
	            
	        },
	        error:function(request,status,error){
	            
	       }
	        
	    });
}	
	
</script>