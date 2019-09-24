<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value= "" name="pageTitle"/>
</jsp:include>
<style>
h2, section{
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
	margin-left: 15px;
	margin-right: 15px;
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
	
	<section>
	<div>
		<c:if test="${pList != null}">
			<h2 style="display:block">중고 거래</h2>
			<br />
			<c:forEach items="${pList }" var="a">
				<article class="top-card">
					<a href="${pageContext.request.contextPath }/auction/auctionSelectOne.do?auctionNo=${a.sellNo}" style="text-decoration: none;">
						  	<img src="${pageContext.request.contextPath }/resources/images/mac.jpg" style="width:100%">
						<div>
						  	<br />
						  	<h5>${a.sellTitle }</h5>
							<div class="auction-content">
								${a.sellAddress}
							</div>
							<div class="auction-price">
								<fmt:formatNumber value="${a.sellPrice }" pattern="#,###" />원
							</div>
						</div>
					</a>
					<br /><br />
				</article>
			</c:forEach>
		</c:if>
	</div>
	<div>
		<c:if test="${aList != null}">
			<h2 style="display:block">중고 경매</h2>
			<br />
			<c:forEach items="${aList }" var="a">
				<article class="top-card">
					<a href="${pageContext.request.contextPath }/auction/auctionSelectOne.do?productNo=${a.auctionNo}" style="text-decoration: none;">
						  	<img src="${pageContext.request.contextPath }/resources/images/mac.jpg" style="width:100%">
						<div>
						  	<br />
						  	<h5>${a.auctionTitle }</h5>
							<div class="auction-content">
								${a.auctionAddress}
							</div>
							<div class="auction-price">
								<fmt:formatNumber value="${a.auctionPrice }" pattern="#,###" />원
							</div>
						</div>
					</a>
					<br /><br />
				</article>
			</c:forEach>
		</c:if>
	</div>
	</section>	

		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>