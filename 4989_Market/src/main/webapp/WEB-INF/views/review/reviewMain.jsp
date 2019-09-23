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
<div class="submenu">
  	<a id="review-btn" href="${pageContext.request.contextPath }/review/reviewMain.do?memberId=${memberLoggedIn.memberId}">나의판매물품</a>
  	<a id="review-btn" href="${pageContext.request.contextPath }/basket/basketView.do?memberId=${memberLoggedIn.memberId}">장바구니</a>
  	<a id="review-btn" href="${pageContext.request.contextPath}/review/reviewContentForm.do?memberId=${memberLoggedIn.memberId}">거래 후기</a>
  	<a id="review-btn" href="${pageContext.request.contextPath}/review/reviewMannerForm.do?memberId=${memberLoggedIn.memberId}">매너 칭찬</a>
  	<a id="review-btn" href="${pageContext.request.contextPath}/review/reviewCheckForm.do">임시 거래 평가</a>
</div>
<div style="text-align: center;">작업하는중</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>