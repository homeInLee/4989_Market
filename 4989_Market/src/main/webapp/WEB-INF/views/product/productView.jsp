<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.market.product.model.vo.Attachment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/imageSlider/sliderStyle.css">
<fmt:requestEncoding value="utf-8" />
<title>4989중고물품-${p.sellTitle}</title>
<% 
	List<Attachment> attach = (List<Attachment>)request.getAttribute("attach");
	int attachIndex = 0;	
	
%>
<style>
*{margin:0; padding:0; list-style:none;}
a{text-decoration:none; color:#666;}
a:hover{color:#1bc1a3;}
body, hmtl{background: #fff; font-family: 'Anton', sans-serif;}


#call {
	border: 1px solid #da1519;
	height: 56px;
	background-color: #e81e22;
	font-size: 18px;
	font-weight: 700;
	color: #fff;
	cursor: pointer;
}

#goToList {
	border: 1px solid green;
	height: 56px;
	background-color: green;
	font-size: 18px;
	font-weight: 700;
	color: #fff;
	cursor: pointer;
	
	
}
#wrapper{
	margin: 0 auto;
	width: 700px;
}
#productControl{
	text-align: right;
	
}
#editProductBtn{
	border: 1px solid #f39614;
	height: 56px;
	background-color: #f39614;
	font-size: 18px;
	font-weight: 700;
	color: #fff;
	cursor: pointer;
}

#deleteProductBtn{
	border: 1px solid #da1519;
	height: 56px;
	background-color: #e81e22;
	font-size: 18px;
	font-weight: 700;
	color: white;
	cursor: pointer;
}
#memberInfo{
	margin-left: 0px;
	text-align: left;
}
</style>
<script>
//장바구니 기능 코드
function basketCheck(check,sellNo,memberId){
	var basket={};
	basket.sellNo = sellNo;
    basket.memberId = memberId;
	
    if(check==0){	
		//장바구니에 담기
		$.ajax({
		    url: "${pageContext.request.contextPath}/basket/basketInsert",
		    data:basket,
		    contentType:"application/json; charset=utf-8",
		    type: "GET",
		    dataType: "json",
		    success: function(data) {
		      alert("장바구니에 담겼습니다");
		    },
		    error: function(xhr,txtStatus,err){
		      console.log("ajax실패",xhr,txtStatus,err);
		    }
		});
	
		$("#image").attr("src","${pageContext.request.contextPath}/resources/images/redheart.PNG");
		$("#image").attr("onclick","basketCheck(1,"+sellNo+",'"+memberId+"')");
	}else{
		//장바구니에 삭제
		console.log(sellNo);
		console.log(memberId);
		$.ajax({
		    url: "${pageContext.request.contextPath}/basket/basketDelete",
		    data:basket,
		    contentType:"application/json; charset=utf-8",
		    type: "GET",
		    dataType: "json",
		    success: function(data) {
		      alert("장바구니에서 삭제되었습니다")
		      
		    },
		    error: function(xhr,txtStatus,err){
		      console.log("ajax실패",xhr,txtStatus,err);
		    }
		});
		
		$("#image").attr("src","${pageContext.request.contextPath}/resources/images/whiteheart.PNG");
		$("#image").attr("onclick","basketCheck(0,"+sellNo+",'"+memberId+"')");
	}
}

</script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="" />
</jsp:include>
<!-- content 영역 -->
<div id="wrapper">

<hr />
	<div id="slider-wrap">
		<ul id="slider">
			<li data-color="#1abc9c"><img
				src="${pageContext.request.contextPath }/resources/images/product/noimage.png"
				class="images0"></li>

			<li data-color="#3498db"><img
				src="${pageContext.request.contextPath }/resources/images/product/noimage.png"
				class="images1"></li>

			<li data-color="#9b59b6"><img
				src="${pageContext.request.contextPath }/resources/images/product/noimage.png"
				class="images2"></li>
		</ul>

		<!--image slider controls-->
		<div class="btns" id="next">
			<i class="fa fa-arrow-right">&gt;</i>
		</div>

		<div class="btns" id="previous">
			<i class="fa fa-arrow-left">&lt;</i>
		</div>

		<div id="counter"></div>
		<div id="pagination-wrap">
			<ul>

			</ul>
		</div>
		<!--image slider controls end-->

	</div>
<!-- image slider section end -->
<br />
<!-- 장바구니 기능 코드 -->	
<hr />
<br />
<c:if test="${empty basket}">
	<div ><img id="image" onclick="basketCheck(0,${p.sellNo},'${memberLoggedIn.memberId}')" src="${pageContext.request.contextPath }/resources/images/whiteheart.PNG" alt="" style="width: 20px; height: 20px; cursor: pointer;"/></div>
</c:if>
	
<c:if test="${not empty basket}">
	<div ><img id="image" onclick="basketCheck(1,${p.sellNo},'${memberLoggedIn.memberId}')" src="${pageContext.request.contextPath }/resources/images/redheart.PNG" alt="" style="width: 20px; height: 20px; cursor: pointer;"/></div>
</c:if> 
<br />	
<c:if test="${memberLoggedIn.memberId ne p.sellWriter }">
<button type="button" id="call" onclick="location.href='${pageContext.request.contextPath}/message/messageListEnd.do?messageWriter=${memberLoggedIn.memberId}&messageReciver=${p.sellWriter }'">&nbsp;&nbsp;연락하기&nbsp;&nbsp;</button>

</c:if>
<button type="button" id="goToList" onclick="goToList();">&nbsp;목록으로 돌아가기&nbsp;</button>
<br />
<br />
<br />
<br />
<br />

<div id="memberInfo">
	<hr />
		<a href="">
			<h6>${p.sellWriter}</h6>
   		</a>
	   		<span>${p.sellAddress}</span>	
	<hr />
</div>
<div id="productInfo">
	<div>
		<h3 style="padding:32px 0;">${p.sellTitle}</h3>
		<hr />
		<br />		
		<br />

		<p>거래 가능 지역 : ${p.sellAddress }</p>
		<br />
		<hr />
		<p>${p.sellContent}</p>
		<hr />
		<br />
		<br />
		<span style="color:#ff8a3d; font-size:32px;"><fmt:formatNumber value="${p.sellPrice }" pattern="#,###"/>원</span>
		<hr />
		<br />
<%-- 		<p style="font-size: 13px; line-height: 1.46; letter-spacing: -0.6px; color: #868e96;">댓글 33 ∙ 관심 13 ∙ 조회 ${auctionSelectOne.get(0).auctionReadcount }</p>
 --%>
		<jsp:include page="/WEB-INF/views/comment/productComment.jsp"></jsp:include>
	</div>
</div>
<hr />

<div>
	<h3 style="padding: 32px 0">중고물품</h3>
	<div>
	<span>가격 : <span style="color:#ff8a3d; font-size:18px;"><fmt:formatNumber value="${p.sellPrice}" pattern="#,###"/>원</span></span> &nbsp;&nbsp;
	</div>
	<br />			
</div>



<p>
	구매자:
	<c:choose>
		<c:when test="${not empty p.sellBuyer}"><p>${p.sellBuyer}</p></c:when>
		<c:when test="${empty p.sellBuyer}"><p>없음</p></c:when>
	</c:choose>
<p>



<h4>등록일: ${p.sellDate}</h4>
<h4>조회수: ${p.sellReadCount}</h4>
<button onclick="updateProduct();">수정하기</button>
<button onclick="deleteProduct();">삭제</button>

<jsp:include page="/WEB-INF/views/comment/productComment.jsp"></jsp:include>


<%-- <c:if test="${memberLoggedIn.memberId eq p.sellWriter}">
	<button onclick="updateProduct();">수정하기</button>
	<button onclick="deleteProduct();">삭제</button>
</c:if> --%>
	<div id="productControl">
		<c:if test="${memberLoggedIn.memberId eq p.sellWriter}">
			<button onclick="updateProduct();" id="editProductBtn">&nbsp;수정하기&nbsp;</button>
			<button onclick="deleteProduct();" id="deleteProductBtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
		</c:if>
	</div>
</div>

<script>
function updateProduct() {
	location.href = "${pageContext.request.contextPath}/product/productEdit.do?productNo=${p.sellNo}";

}
function deleteProduct() {
	location.href = "${pageContext.request.contextPath}/product/productDelete.do?productNo=${p.sellNo}";

}



function goToList() {
	location.href = "${pageContext.request.contextPath}/product/productList.do"
	
}
</script>




<!-- 이미지 슬라이더 기본이미지에서 실제 이미지로 변경하는 스크립트 -->
<script>
var index = 0;

$(()=>{
		 <%for(; attach.size()>attachIndex; attachIndex++){%>
			$('.images'+<%=attachIndex%>).attr('src', '<%=request.getContextPath()%>/resources/upload/product/<%=attach.get(attachIndex).getRenamedfileName()%>');		 
		 <% }%>
})



</script> 








<!-- 이미지 슬라이더 -->
<script src="${pageContext.request.contextPath}/resources/js/imageSlider.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

