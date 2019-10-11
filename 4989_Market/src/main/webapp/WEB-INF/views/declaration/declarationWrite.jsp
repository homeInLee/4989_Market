<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
table,th,td,tr{
border: 1px solid lightgray;
width: 80%;

}
table{
margin-left: 10%;
}
table th{
width: 25%;
height: 50px;
text-align: center;
}
.btn-dec{
width: 75px;
height: 40px;
position: absolute; 
font-size: 16px;
background: #fff;
border: 1px solid #1b5ac2;
border-radius: 7px;
color: #1b5ac2;
cursor: pointer;
margin-left: 40%;
}
.btn-cancel{
width: 75px;
height: 40px;
position: absolute; 
font-size: 16px;
background: #fff;
border: 1px solid #1b5ac2;
border-radius: 7px;
color: #1b5ac2;
cursor: pointer;
margin-left: 50%;
}

</style>
<!-- <h2 style="text-align: center; color:#1b5ac2; border: 1px solid #1b5ac2; height: 100px; padding-top: 27px;">신 고</h2> -->
<br />	
<br />	
	<form action="${pageContext.request.contextPath}/declaration/insertMemberDeclaration"
		  method="post"
		  id="declarationFrm"
		  name="declarationFrm">
	<table>
	<tr><td style="background: #1b5ac2; color: white; text-align: left; height: 50px;" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;신고</td></tr>
	<tr>
		<th>신고사유</th>
		<td>
		<select style="width: 200px; margin-left: 20px; border: 1px solid lightgray;" name="declarationReason" id="reason">
		<option value="a">욕설 및 비방</option>
		<option value="s">부적절한 내용</option>
		<option value="d">광고</option>
		<option value="f">불법 거래 유도</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" style="margin-left: 20px; width: 580px; height: 50px;" name="declarationTitle" id="declarationTitle" /></td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="height: 510px;">
		<c:if test="${declaration.declarationDivision ne 'c' }">
		<textarea name="declarationContent" id="" cols="80" rows="21"></textarea>
		</c:if>
		<c:if test="${declaration.declarationDivision eq 'c' }">
		<textarea name="declarationContent" id="" cols="80" rows="30" >신고 댓글 내용 : ${declaration.declarationContent }
신고 댓글 작성자 : ${declaration.declarationReceiver}
--------------------------------------------------------
</textarea>
		</c:if>
		<input type="hidden" name="declarationDivision" value="${declaration.declarationDivision }"/>
		<input type="hidden" name="declarationReceiver" value="${declaration.declarationReceiver}"/>
		<input type="hidden" name="declarationWriter" value="${memberLoggedIn.memberId}"/>
		<input type="hidden" name="boardName" value="${declaration.boardName}"/>
		<input type="hidden" name="boardNo" value="${declaration.boardNo}"/>
		</td>
	</tr>
	
	</table>
	<br />
	<br />
	<input type="submit" class="btn-dec" id="btn-dec" value="신고" />
	<input type="reset" class="btn-cancel" id="btn-cancel" value="취소" onclick="history.back(-1);"/>
	</form>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
<script>
$("#btn-dec").click(()=>{
	$("#declarationFrm").submit();
});
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
