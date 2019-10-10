<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
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
.top-card:hover{
	cursor: pointer;
	-webkit-box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2);
	top: -2px;
}
	

</style>
	
	<h2 style="display:block">경매 목록</h2>
	<br />
	<section>
		<c:forEach items="${auctionList }" var="a">
				<c:if test="${a.boardName eq 'A' and a.attachmentMainImage eq 'Y' and a.auctionDeltype eq 'N'}">
					<article class="top-card" >
						<a href="${pageContext.request.contextPath }/auction/auctionSelectOne.do?auctionNo=${a.auctionNo}&memberId=${memberLoggedIn.memberId}" style="text-decoration: none;">
							  			<img src="${pageContext.request.contextPath }/resources/upload/auction/${a.renamedfileName }" style="width:100%; height:160px; position: relative;">
							<div>
							  	<br />
							  	<h5>${a.auctionTitle }</h5>
								<div class="auction-content">
									${a.auctionAddress }
								</div>
								<div class="auction-price">
									<c:if test="${a.auctionIngPrice eq 0 }">
										<fmt:formatNumber value="${a.auctionPrice}" pattern="#,###" />원
									</c:if>
									<c:if test="${a.auctionIngPrice ne 0 }">
										<fmt:formatNumber value="${a.auctionIngPrice}" pattern="#,###" />원
									</c:if>
								</div>
							</div>
						</a>
						<br /><br />
				</article>
	  		</c:if>
	  		<c:if test="${a.boardName eq 'A' and a.attachmentMainImage eq 'Y' and a.auctionDeltype eq 'Y'}">
					<article class="top-card" >
						<a href="${pageContext.request.contextPath }/auction/auctionSelectOne.do?auctionNo=${a.auctionNo}&memberId=${memberLoggedIn.memberId}" style="text-decoration: none;">
							  			<img src="${pageContext.request.contextPath }/resources/upload/auction/${a.renamedfileName }" style="width:100%; height:160px; position: relative;">
							<div>
							  	<br />
							  	<h5>${a.auctionTitle }</h5>
								<div class="auction-content">
									${a.auctionAddress }
								</div>
								<div class="auction-price" style="color:red;">
									경매종료!
								</div>
							</div>
						</a>
						<br /><br />
				</article>
	  		</c:if>
		</c:forEach>
	</section>	

		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>