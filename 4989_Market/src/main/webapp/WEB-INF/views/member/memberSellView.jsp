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
<script>
//판매완료하기 기능
function sellComplete(sellNo){
	var sellBuyer="";
	if(sellBuyer=prompt("상품구매자 아이디를 입력해주세요")){
		location.href="${pageContext.request.contextPath}/product/sellComplete.do?sellNo="+sellNo+"&sellWriter=${memberLoggedIn.memberId}&sellBuyer="+sellBuyer;
	}else{
		return;
	}
}
</script>
<div class="submenu">
	<a id="review-btn" href="${pageContext.request.contextPath }/product/memberbuyView.do?memberId=${memberLoggedIn.memberId}">나의구매물품</a>
  	<a id="review-btn" href="${pageContext.request.contextPath }/product/memberSellView.do?memberId=${memberLoggedIn.memberId}">나의판매물품</a>
  	<a id="review-btn" href="${pageContext.request.contextPath}/review/reviewContentForm.do?memberId=${memberLoggedIn.memberId}">거래 후기</a>
  	<a id="review-btn" href="${pageContext.request.contextPath}/review/reviewMannerForm.do?memberId=${memberLoggedIn.memberId}">매너 칭찬</a>
  	
</div>

<h2 style="display:block">나의 판매 물품</h2>
	<br />
	<c:if test="${empty list}">
		<div style="text-align: center;">나의 판매 물품이 비어있습니다</div>
	</c:if>
	<section>
		<c:forEach items="${list}" var="l">
			<c:if test="${l.sellDelType=='N'}">
				<article class="top-card">
				<a href="${pageContext.request.contextPath}/product/productView.do?productNo=${l.sellNo}&memberId=${memberLoggedIn.memberId}" style="text-decoration: none;">
					  	<c:forEach items="${attachmentList }" var="a">
					  		<c:if test="${l.sellNo==a.boardNo and a.attachmentMainImage=='Y' and a.boardName=='S'}">				
					  			<img src="${pageContext.request.contextPath}/resources/upload/product/${a.renamedfileName}" style="width:220px; height: 200px;">
					  		</c:if>
					  	</c:forEach>
					<div>
					  	<br />
					  	<h5>${l.sellTitle }</h5>
						<div class="auction-content">
							${l.sellAddress }
						</div>
						<div class="auction-price">
							<fmt:formatNumber value="${l.sellPrice }" pattern="#,###" />원
						</div>
						<c:if test="${'sale' eq fn:trim(l.sellState)}">
							<div>
								판매중
							</div>
						</c:if>
						<c:if test="${'soldout' eq fn:trim(l.sellState)}">
							<div>
								판매완료
							</div>
						</c:if>
					</div>
				</a>
				<!-- 판매완료하기 기능 -->
				<c:if test="${'sale' eq fn:trim(l.sellState)}">
					<button class="badge badge-light" onclick="sellComplete(${l.sellNo})">판매완료하기</button>
				</c:if>
				<br /><br />
			</article>
			</c:if>
			
		</c:forEach>
	</section>
<div id='pageBar'>
  ${pageBar}
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>