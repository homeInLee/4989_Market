<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<title>중고물품</title>
<style>
ul{
	list-style:none;
    margin-right: 10px;
    padding:0;

}

li {
    margin-right: 10px;
    padding: 0 0 0 0;
    border : 0;
    float: left;
}

#product-container{

}

</style>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="상품목록" name="pageTitle"/>
</jsp:include>
<div id="product-container">
	<ul>
		<c:forEach items="${plist }" var="product">
		
		<li>
			${product.sellNo} <br />
			${product.sellTitle}<br />
			판매자 ${product.sellWriter}<br />
			상태 ${product.sellState}<br />
			가격 ${product.sellPrice}&#8361;<br />
			등록일 ${product.sellDate}<br />
			조회수 ${product.sellReadCount}<br />		
		
		</li>
		</c:forEach>
	
	</ul>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

