<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<title>중고물품</title>
<style>
h2, section {
	text-align: center;
	position: relative;
}

.auction-content {
	color: gray;
}

.auction-price {
	color: #ff8a3d;
}

.top-card {
	position: relative;
	text-align: left;
	display: inline-block;
	margin-right: 30px;
	margin-bottom: 35px;
	width: calc(25% - 34px);
	border: 1px solid #e9ecef;
	border-radius: 8px;
}

.top-card:hover {
	cursor: pointer;
	-webkit-box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2);
	top: -2px;
}

.product-img {
	width: 90px;
	height: 90px;
	width: 100%;
	height: 160px;
	position: relative;
}

.info {
	text-align: center;
}

.more-btn {
	display: -webkit-box;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	height: 50px;
	cursor: pointer;
	width: 100%;
	color: #868e96;
	font-size: 16px;
	border-top: 1px solid #e9ecef;
}

.more-btn .more-loading {
	display: none;
}

.more-btn:hover {
	cursor: pointer;
	-webkit-box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2);
	top: -2px;
}

.productImgBox {
	text-decoration: none;
}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="상품목록" name="pageTitle" />
</jsp:include>


<section id="section">
	<div id="plist">
		<c:forEach items="${plist }" var="product">
			<article class="top-card">
				<a href="${pageContext.request.contextPath}/product/productView.do?productNo=${product.sellNo}&memberId=${memberLoggedIn.memberId}"
					class="productImgBox" style="text-decoration: none;"> <c:forEach
						items="${attachList }" var="attach">
						<c:if
							test="${attach.boardName eq 'S' && attach.boardNo eq product.sellNo}">
							<img class="product-img"
								src="${pageContext.request.contextPath}/resources/upload/product/${attach.renamedfileName}"
								alt="" />
							<br />
						</c:if>
					</c:forEach>
					<div class="info">
						<br />
						<h5>${product.sellTitle}</h5>
						<div class="auction-content">${product.sellAddress }</div>
						<div class="auction-price">
							<fmt:formatNumber value="${product.sellPrice}" pattern="#,###" />
							원
						</div>
					</div>
				</a> <br /> <br />
			</article>
		</c:forEach>
	</div>




	<form action="moreResultForm" name="moreResultForm" id="moreResultForm">
		<input type="hidden" id="startCount" name="startCount" value="9" /> <input
			type="hidden" id="endCount" name="endCount" value="16" />
		<div onclick="moreResult();" class="more-btn">
			<span class="more-text">더보기</span>
			<div class="more-loading">
				<div class="loader"></div>
			</div>
		</div>
	</form>
	<br /> <br /> <br /> <br /> <br /> <br /> <br />
</section>


<script>

function moreResult() {
	var startCount = Number($("#startCount").val());
	var endCount = Number($("#endCount").val());



	console.log(startCount);
	console.log(endCount);
	
	
	
	var moreResultForm = $("#moreResultForm").serialize();
	var values = [];
	var html = "";
	var attach = [] 
	var contentCount = 8; //한 페이지당 게시물 수


	 $.ajax({
	        type    :   "post",
	        url     :   "${pageContext.request.contextPath}/product/moreResult.do",
	        data    :   moreResultForm,
	        dataType:   "json",
	        success :   function(retnVal) {
			        					        				
	        						values = retnVal.moreList;
	        						attach = retnVal.attachList;

        							
        							
	        						for(var i=0; contentCount>i; i++ ){
	        								
	        							html += "<article class='top-card'>";
	        							html += "<a href='<%=request.getContextPath()%>/product/productView.do?productNo="+values[i].sellNo+ "' style='text-decoration: none;'>";
										console.log("게시물 번호="+values[i].sellNo);
	        							for(var idxx = 0; attach.length>idxx; idxx++){

	        								console.log("사진 for문 "+idxx+"번 실행중");
											if(attach[idxx].boardNo == values[i].sellNo){
	        								html += "<img class='product-img' src='<%=request.getContextPath()%>/resources/upload/product/"+attach[idxx].renamedfileName+"'/> <br/>"
	        								
											}
	        							}
	        							
	        							html += "<div class='info'>";
	        							html += "<br/>";
	        							html += "<h5>"+values[i].sellTitle+"</h5>";
	        							html += "<div class='auction-content'>"+values[i].sellAddress+"</div>";
	        							html += "<div class='auction-price'>"+values[i].sellPrice+"원";
	        							html += "</div>";
	        							html += "</div>";
	        							html += "</a> <br /> <br />";
	        							html += "</article>";
										$("#plist").append(html);
										html = "";


	        						}

	        			
	        						
	        						
        				
			        			 	$("#startCount").attr('value', startCount + 8);
			        				$("#endCount").attr('value', endCount + 8); 
									

			        				
			        				
	                    },
	        error   :   function(request,status,error){
	                    alert("에러 코드 = "+ request.status + " 내용 = " + request.responseText + " 에러메세지 = " + error); // 실패 시 처리
	                    }
	    });	
} 
</script>


<script>
$(()=>{
	$("div[productNo]").click(function() {
		var productNo = $(this).attr("productNo");
		location.href = "${pageContext.request.contextPath}/product/productView.do?productNo="+productNo;
	} )
})


</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

