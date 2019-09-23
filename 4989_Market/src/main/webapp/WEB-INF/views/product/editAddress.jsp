<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>주소 변경하기</title>
</head>
<body>
	<form method="get" id="addressFrm" name="addressFrm">
		<input type="text" placeholder="새로운 주소를 입력하세요" name="address"/>
		<input type="hidden" name="memberId" value="${memberLoggedIn.memberId }"/>
	
		<input type="submit" value="저장" onclick="fnSubmit();"/>
	</form>


</body>
<script>
function fnSubmit(){
	  
	event.preventDefault();
    var queryString = $("form[name=addressFrm]").serialize() ;

    $.ajax({
        type : 'get',
        url : '${pageContext.request.contextPath}/member/editAddressEnd.do',
        data : queryString,
        dataType : 'json',
        success : function(json){
        	opener.parent.location.reload();
        	/* opener로 인풋박스 새로고침 시키기 미구현   */
        	window.close();
        	

        },
        error: function(xhr, status, error){
            alert('등록 실패 관리자에게 문의하세요 1577-9993');
            console.log('실패');
        }
    });

}


</script>

</html>