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

h2, section{
	text-align: center;
	position: relative;
}
.auction-content{
	color:gray;
}
.auction-price{
	color:#ff8a3d;
}
.top-card{
	position: relative;
	text-align: left;
	display: inline-block;
	margin-right: 30px;
	margin-bottom: 35px;
	width: calc(25% - 34px);	
	border: 1px solid #e9ecef;
	border-radius: 8px;
	
}
.top-card:hover{
	cursor: pointer;
	-webkit-box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2);
	top: -2px;
}
</style>


<div class="submenu">
	<a id="review-btn" href="${pageContext.request.contextPath }/basket/basketView.do?memberId=${memberLoggedIn.memberId}">중고물품 장바구니</a>
  	<a id="review-btn" href="${pageContext.request.contextPath }/basket/basketAuctionView.do?memberId=${memberLoggedIn.memberId}">경매물품 장바구니</a>
</div>

<h2 style="display:block">중고물품 장바구니</h2>
	<br />
	<c:if test="${empty myBasketList}">
		<div style="text-align: center;">장바구니가 비어있습니다</div>
	</c:if>
	<section>
		<c:forEach items="${myBasketList}" var="b">
			<article class="top-card">
				<a href="${pageContext.request.contextPath}/basket/basketDetailView.do?sellNo=${b.sellNo}&sellWriter=${b.sellWriter}&memberId=${memberLoggedIn.memberId}" style="text-decoration: none;">
					  	<img src="http://placehold.it/700x400" style="width:100%">
					<div>
					  	<br />
					  	<h5>${b.sellTitle }</h5>
						<div class="auction-content">
							${b.sellContent }
						</div>
						<div class="auction-price">
							<fmt:formatNumber value="${b.sellPrice }" pattern="#,###" />원
						</div>
						<c:if test="${'sale' eq fn:trim(b.sellState)}">
							<div>
								판매중
							</div>
						</c:if>
						<c:if test="${'soldout' eq fn:trim(b.sellState)}">
							<div>
								판매완료
							</div>
						</c:if>
					</div>
				</a>
				<br /><br />
			</article>
		</c:forEach>
	</section>


<div id='pageBar'>
  ${pageBar}
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>