<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<h2>신고</h2>
	
	<form action="${pageContext.request.contextPath}/declaration/insertMemberDeclaration"
		  method="post"
		  id="declarationFrm"
		  name="declarationFrm">
	<table>
	<tr>
		<th>신고사유</th>
		<td>
		<select name="declarationReason" id="reason">
		<option value="a">욕설 및 비방</option>
		<option value="s">부적절한 내용</option>
		<option value="d">광고</option>
		<option value="f">불법 거래 유도</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="declarationTitle" id="declarationTitle" /></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
		<textarea name="declarationContent" id="" cols="30" rows="10" >신고 댓글 내용 : ${declaration.declarationContent }
신고 댓글 작성자 : ${declaration.declarationReceiver}
----------------------------------</textarea>
		<input type="hidden" name="declarationDivision" value="${declaration.declarationDivision }"/>
		<input type="hidden" name="declarationReceiver" value="${declaration.declarationReceiver}"/>
		<input type="hidden" name="declarationWriter" value="${memberLoggedIn.memberId}"/>
		<input type="hidden" name="boardName" value="${declaration.boardName}"/>
		<input type="hidden" name="boardNo" value="${declaration.boardNo}"/>
		</td>
	</tr>
	
	</table>
	</form>
	
	<input type="submit" id="btn-dec" value="신고" />
	<input type="button"  value="닫기" />
<script>
$("#btn-dec").click(()=>{
	$("#declarationFrm").submit();
// 	document.getElementById('declarationFrm');
// 	window.opener.name = "parentPage"; // 부모창의 이름 설정
//     document.declarationFrm.target = "parentPage"; // 타켓을 부모창으로 설정
//     document.declarationFrm.action = "${pageContext.request.contextPath}/declaration/insertMemberDeclaration";  //부모창에 호출될 url 
//     document.declarationFrm.submit();
//     self.close();
});
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
