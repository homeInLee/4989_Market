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
.top-card :hover{
	cursor: pointer;
	-webkit-box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2);
	top: -2px;
}
	

</style>
	
	<h2 style="display:block">경매 목록</h2>
	<br />
	<section>
		<c:forEach items="${auctionList }" var="a">
			<article class="top-card">
				<a href="${pageContext.request.contextPath }/auctionSelectOne.do?auctionNo=${a.auctionNo}">
					<div>
					  	<img src="${pageContext.request.contextPath }/resources/images/iPhoneX.jpg" style="height: 100%; width:100%">
					  	<br />
					</div>
					
					<div>
					  	<h5>${a.auctionTitle }</h5>
						<div class="auction-content">
							${a.auctionContent }
						</div>
						<div class="auction-price">
							<fmt:formatNumber value="${a.auctionPrice }" pattern="#,###" />원
						</div>
					</div>
				</a>
				<br /><br />
			</article>
		</c:forEach>
	</section>	

		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>