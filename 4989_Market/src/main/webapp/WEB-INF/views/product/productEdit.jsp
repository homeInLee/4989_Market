<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/imageSlider/sliderStyle.css">
<fmt:requestEncoding value="utf-8"/>
<title></title>
<style>
div#enroll-container{width:500px; margin:0 auto; text-align:center;}
div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
div#enroll-container table{margin: 0 auto;}
div#enroll-container table th{text-align: center; padding-right:15px; width: 125px;}
div#enroll-container table td{text-align: left;}
/* 
input{
	background: rgb(179, 179, 255);
}
textarea{
	background: rgb(179, 179, 255);


}

form{
	border: 1px solid;
}

#Registration{
	padding-left: 25px;

}

label{
	padding-right: 50px;
}
#content-area{
	border: 1px solid;
	font-size: 20px;
 */
 #preview{

	margin: 0 auto;
}

.preimg{
	
	border: 1px solid;
	width: 100px;
	height: 100px;
	float: left;
}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="" name=""/>
</jsp:include>
<!-- content 영역 -->



<div style="text-align: center;">
	<h2 style="padding: 30px 0;">중고물품 수정</h2>
</div>

<hr style="background-color:orange; height:5px;" width="70px;"/>
<br />

<br />
<div id="enroll-container">
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
	
<%-- 		<div id="preview">
			<ul>
				<li><img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" alt="" class="preimg images0" /></li>
				<li><img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" alt="" class="preimg images1" /></li>
				<li><img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" alt="" class="preimg images2" /></li>
			</ul>
		</div> --%>
			<div class="input-group mb-3" style="padding:0px;">
			  <div class="input-group-prepend" style="padding:0px;">
			    <span class="input-group-text">첨부파일</span>		    
			  </div>
			  <div class="custom-file">
			    <input type="file" multiple="multiple" class="custom-file-input imageUpload" 
			    	   name="upFile" id="upFile1" >
			    <label class="custom-file-label" for="upFile1">파일을 선택하세요(사진은 최대 3장까지 업로드됩니다.)</label>
			  </div>
			</div>
	
	<br />
	<br />
	<br />
	<br />
	<br />
	<form name="boardFrm" 
		  action="${pageContext.request.contextPath}/product/productEditEnd.do" 
		  method="post" >
		  
			<!-- -============================================== -->
		  <table>
			<tr>
				<th>제목</th>
				<td>
					<div id="auction-container">
					    <input type="hidden" value="${p.sellNo}" name=productNo />
						<input type="text" class="form-control"  name="productTitle" id="productTitle_" required value="${p.sellTitle}">
	           			<input type="hidden" name="writer" id="writer" value="${memberLoggedIn.memberId }"/>
	           			<input type="hidden" name="memberId" id="memberId" value="${memberLoggedIn.memberId }"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>	
					<input type="number" class="form-control" name="productPrice" id="productPrice" value="${p.sellPrice }">
				</td>
			</tr>  

			<tr>
				<th>상품 설명</th>
				<td >	
					<textarea rows="10" style="width:120%; border: 1px solid;" name="productContent">${p.sellContent }</textarea>
				</td>
			</tr>
		</table>
			<!-- -============================================== -->


		


		







	    
		<br />
		<input type="hidden" class="form-control"  name="productAddress" id="productAddress" required value="${p.sellAddress }">
		<input type="text" class="form-control" name="productCategory" value="${p.sellCategory }"/>
		<input type="submit" class="btn btn-outline-success" value="저장" >
		
		
	</form>
</div>
<script src="${pageContext.request.contextPath}/resources/js/imageSlider.js"></script>
















<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
 --%>
