<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
</head>
<body>
	<h2>신고신고</h2>
	<form action="${pageContext.request.contextPath}/declaration/insertMemberDeclaration"
		  method="post"
		  id="frm">
	<table>
	<tr>
		<th>신고사유</th>
		<td>
		<select name="reason" id="reason">
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
		<td><textarea name="" id="" cols="30" rows="10"></textarea>
		<input type="hidden" name="declarationDivision" value="m"/>
		<input type="hidden" name="declarationReceiver" value="${declarationReceiver}"/>
		<input type="hidden" name="declarationWriter" value="${memberLoggedIn.memberId}"/>
		</td>
	</tr>
	
	</table>
	</form>
	
	<input type="button" id="btn-dec" value="신고" />
	<input type="button" onclick="self.close()" value="닫기" />
	
<script>
$("#btn-dec").click(()=>{
	document.getElementById('frm').submit();
});
</script>
	
	
	
	
	
	
	
</body>
</html>