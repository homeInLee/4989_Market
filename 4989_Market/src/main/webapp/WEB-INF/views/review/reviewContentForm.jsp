<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/review.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/review/reviewHeader.jsp"></jsp:include>
<style>
div#pageBar {
	margin-top: 10px;
	text-align: center;	
}

div#pageBar span.cPage {	
	margin-right: 5px;
}

div#pageBar a {
	margin-right: 5px;
}
</style>
<div class="submenu">
	<a id="review-btn" href="${pageContext.request.contextPath }/product/memberbuyView.do?memberId=${memberLoggedIn.memberId}">나의구매물품</a>
  	<a id="review-btn" href="${pageContext.request.contextPath }/product/memberSellView.do?memberId=${memberLoggedIn.memberId}">나의판매물품</a>
  	<a id="review-btn" href="${pageContext.request.contextPath }/basket/basketView.do?memberId=${memberLoggedIn.memberId}">장바구니</a>
  	<a id="review-btn" href="${pageContext.request.contextPath}/review/reviewContentForm.do?memberId=${memberLoggedIn.memberId}">거래 후기</a>
  	<a id="review-btn" href="${pageContext.request.contextPath}/review/reviewMannerForm.do?memberId=${memberLoggedIn.memberId}">매너 칭찬</a>
  	
</div>
  <c:if test="${empty reviewList}">
  	<div style="text-align: center;">거래후기가 없습니다.</div>
  </c:if>
  <div style="height: 450px;">
  <c:forEach items="${reviewList}" var="r">
 	<ul class="list-group list-group-flush">
  	  <li class="list-group-item">
  	  ${r.reviewWriter}
  	  <br />
  	  ${r.reviewContent}
  	  </li>
  	  
    </ul> 
  </c:forEach>
  </div>
  <div id='pageBar'>
  ${pageBar}
  </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>