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

<form action="${pageContext.request.contextPath}/product/productEditEnd.do" method="get">
<h4>${p.sellNo}</h4>
<input type="hidden" value="${p.sellNo}" name=productNo />

<label for="title">제목</label>
<input id="title" type="text" value="${p.sellTitle }" name=productTitle/><br />

<label for="writer">작성자</label>
<input id="writer" type="text" value="${p.sellWriter }" disabled="disabled"/><br />
<%-- <input type="hidden" value="${p.sellWriter }" />--%>
<label for="buyer">구매자</label>
<input id="buyer" type="text" value="${p.sellBuyer }" /><br />

<label for="content">내용</label>
<textarea name="productContent" id="" cols="30" rows="10" >${p.sellContent }</textarea><br />

<%-- <label for="state">상태</label>
<input id="state" type="text" value="${p.sellState }" name=productState/><br /> --%>

<label for="price">가격</label>
<input id="price" type="text" value="${p.sellPrice }" name=productPrice/><br />

<button type="submit">전송</button>
</form>








<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

