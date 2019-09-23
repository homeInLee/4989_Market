<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<title></title>
<style>
input{
	background: rgb(179, 179, 255);
}
textarea{
	background: rgb(179, 179, 255);


}

form{
	border: 1px solid;
}

#Registration{
	padding-left: 25px;

}

label{
	padding-right: 50px;
}
#content-area{
	border: 1px solid;
	font-size: 20px;

</style>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="" name=""/>
</jsp:include>
<!-- content 영역 -->
<br />
<br />
<br />
<br />
<br />
	<form name="boardFrm" 
		  action="${pageContext.request.contextPath}/product/productEditEnd.do" 
		  method="post" >
		번호:<h4>${p.sellNo}</h4>
		<input type="hidden" value="${p.sellNo}" name=productNo />
		
		제목:<input type="text" class="form-control" value="${p.sellTitle}" 
				name="productTitle" id="productTitle" required>

		
		<label for="writer">작성자</label>
		<input id="writer" type="text" value="${p.sellWriter }" disabled="disabled"/><br />
		<%-- <input type="hidden" value="${p.sellWriter }" />--%>
		<label for="buyer">구매자</label>
		<input id="buyer" type="text" value="${p.sellBuyer }" /><br />

		
	          내용:<textarea class="form-control" name="productContent" placeholder="" required>${p.sellContent }</textarea>
	    
	    
	          가격:<input type="number" class="form-control" value="${p.sellPrice }" 
		name="productPrice" id="productPrice" required>
	    

	    
		<br />
		<input type="submit" class="btn btn-outline-success" value="저장" >
		
		
	</form>

















<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
 --%>
