<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<title>물품 등록하기</title>
<style>
input{
	background: rgb(179, 179, 255);
}
textarea{
	background: rgb(179, 179, 255);


}
label{
	font-size: 20px;

}
input{
	font-size: 20px;
	

}
form{
	border: 1px solid;
}

#Registration{
	padding-left: 25px;
	border: 1px solid;
}

label{
	padding-right: 50px;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="물품 등록하기" name="pageTitle"/>
</jsp:include>

<!-- 컨텐츠 영역 시작-->

<form action="${pageContext.request.contextPath }/productRegistrationEnd.do" enctype="multipart/form-data" >
	<div id="Registration">
	</div>
	<button type="submit" onclick="checkYN();" >전송</button>
</form>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />


<!-- 컨텐츠 영역 끝  -->
<script>
/* (()=>{
	
function checkYN() {
	var check=confirm('등록 하시겠습니까?');
	
	return check;
})

	
}


(()=>{
	alert("asdasd");
})
 */
</script>


<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>

