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
  	<a id="review-btn" href="${pageContext.request.contextPath }/auction/memberAuctionBuyView.do?memberId=${memberLoggedIn.memberId}">구매경매물품</a>	
	<a id="review-btn" href="${pageContext.request.contextPath }/auction/memberAuctionSellView.do?memberId=${memberLoggedIn.memberId}">판매경매물품</a>
</div>

<h2 style="display:block">구매 경매 물품</h2>
	<br />
	<c:if test="${empty auctionList}">
		<div style="text-align: center;">구매 경매 물품이 비어있습니다</div>
	</c:if>
	<section>
		<c:forEach items="${auctionList}" var="l">
			<article class="top-card">
				<a href="${pageContext.request.contextPath }/auction/auctionSelectOne.do?auctionNo=${l.auctionNo}&memberId=${memberLoggedIn.memberId}" style="text-decoration: none;">
					  	<!-- <img src="http://placehold.it/700x400" style="width:100%"> -->
					  	<c:forEach items="${attachmentList }" var="a">
					  		<c:if test="${l.auctionNo==a.boardNo and a.attachmentMainImage=='Y' and a.boardName=='A'}">				
					  			<img src="${pageContext.request.contextPath}/resources/upload/auction/${a.renamedfileName}" style="width:220px; height: 200px;">
					  		</c:if>
					  	</c:forEach>
					<div>
					  	<br />
					  	<h5>${l.auctionTitle }</h5>
						<div class="auction-content">
							${l.auctionAddress }
						</div>
						<div class="auction-price">
							<fmt:formatNumber value="${l.auctionDirectPrice }" pattern="#,###" />원
						</div>
						<div class="auction-content">구매경매물품</div>
						<div>기간</div>
						<div class="auction-content">
							${l.auctionDate}~${l.auctionEndDate}
						</div>
					</div>
				</a>
				<br /><br />
			</article>
		</c:forEach>
	</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>