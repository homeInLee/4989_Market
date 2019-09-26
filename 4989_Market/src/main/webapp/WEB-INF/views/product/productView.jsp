
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/imageSlider/sliderStyle.css">
<fmt:requestEncoding value="utf-8"/>
<title></title>
<style>

</style>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="" name=""/>
</jsp:include>
<!-- content 영역 -->
<div id="wrapper">
	<div id="slider-wrap">
		<ul id="slider">
			<li data-color="#1abc9c">		                             
				<img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" class="images0">
			</li>		
			             
			<li data-color="#3498db">
				<img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" class="images1">
			</li>	
				             
			<li data-color="#9b59b6">
				<img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" class="images2">
			</li>         
		</ul>
          
		<!--controls-->
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
		<!--controls-->  
                 
	</div> 
</div>



<br />
<br />
<br />
<br />
<br />
<h4>번호: ${p.sellNo}</h4>
<h4>제목: ${p.sellTitle}</h4>
<h4>작성자: ${p.sellWriter}</h4>

<h4> 구매자:
	<c:choose>
		<c:when test="${not empty p.sellBuyer}">${p.sellBuyer}</c:when>
		<c:when test="${empty p.sellBuyer}">없음</c:when>
	</c:choose>
</h4>


<h4>내용: ${p.sellContent}</h4>
<h4>상태:  ${p.sellState}


</h4>
<h4>가격: ${p.sellPrice}</h4>
<h4>등록일: ${p.sellDate}</h4>
<h4>조회수: ${p.sellReadCount}</h4>
<button onclick="updateProduct();">수정하기</button>
<button onclick="deleteProduct();">삭제</button>

<script>
function updateProduct() {
	location.href = "${pageContext.request.contextPath}/product/productEdit.do?productNo=${p.sellNo}";

}
function deleteProduct() {
	location.href = "${pageContext.request.contextPath}/product/productDelete.do?productNo=${p.sellNo}";

}


</script>
<!-- 이미지 슬라이더 -->
<script src="${pageContext.request.contextPath }/resources/js/imageSlider.js"></script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

