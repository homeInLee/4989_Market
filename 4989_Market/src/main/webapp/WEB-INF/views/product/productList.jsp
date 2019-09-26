<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<title>중고물품</title>
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
#product-img{
	width: 90px;
	height: 90px; 
	width:100%; 
	height:160px; 
	position: relative;
}
#info{
	text-align: center;
}







</style>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="상품목록" name="pageTitle"/>
</jsp:include>

	<section>
		<c:forEach items="${plist }" var="product">
			<article class="top-card" >
				<a href="${pageContext.request.contextPath }/product/productView.do?productNo=${product.sellNo}" style="text-decoration: none;">
					<c:forEach items="${attachList }" var="attach">
						<c:if test="${attach.boardName eq 's' && attach.boardNo eq product.sellNo}">
							<img id="product-img" src="${pageContext.request.contextPath}/resources/upload/product/${attach.renamedfileName}" alt="" /><br />
						</c:if>
					</c:forEach>
				<div id="info">
					<br />
					<h5>${product.sellTitle}</h5>
					<div class="auction-content">
						${product.sellAddress }
					</div>
					<div class="auction-price">
						<fmt:formatNumber value="${product.sellPrice}" pattern="#,###" />원
					</div>
				</div>
				</a>
				
				<br /><br />
			</article>
		</c:forEach>
	</section>



	<%-- <ul>
		<!-- forEach 반복문 탈출을 위한 변수  -->

		
		
		<!-- 상품 정보를 출력하는 forEach문  -->
		<c:forEach items="${plist }" var="product">
		
		<li productNo="${product.sellNo}" >
			<article class="top-card" >		
				<p id="noPanel">${product.sellNo} </p><br />
				
				<!-- 상품사진을 출력하는 forEach문  -->				
				<c:forEach items="${attachList }" var="attach" varStatus="status">
					
					<!-- 게시판 타입, 첨부파일 리스트의 데이터 중 첨부파일의 참조게시물 번호와 비교 -->
					<c:if test="${attach.boardName eq 's' && attach.boardNo eq product.sellNo }">								
							<img id="product-img" src="${pageContext.request.contextPath}/resources/upload/product/${attach.renamedfileName}" alt="" /><br />				
									
									
					</c:if>
									
					
	
					
				</c:forEach>
				${product.sellTitle}<br />
				판매자 ${product.sellWriter}<br />
				상태 ${product.sellState}<br />
				<div class="auction-content">
				가격 ${product.sellPrice}&#8361;<br />
				</div>
				등록일 ${product.sellDate}<br />
				조회수 ${product.sellReadCount}<br />		
				
			</article>
		</li>				
		</c:forEach>
		
	</ul>
	</section> --%>


<script>
$(()=>{
	$("div[productNo]").click(function() {
		var productNo = $(this).attr("productNo");
		location.href = "${pageContext.request.contextPath}/product/productView.do?productNo="+productNo;
	} )
})



</script>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
 --%>
