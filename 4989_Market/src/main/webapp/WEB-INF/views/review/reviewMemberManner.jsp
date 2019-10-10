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

<style>
.list-group-item>span{
display:table; 
margin-left:auto; 
margin-right:auto;
}
</style>
<div class="submenu">
	<a id="review-btn" href="${pageContext.request.contextPath}/review/reviewMemberContent.do?memberId=${memberId}">거래 후기</a>
  	<a id="review-btn" href="${pageContext.request.contextPath}/review/reviewMemberManner.do?memberId=${memberId}">매너 칭찬</a>
</div>
  <c:if test="${empty reviewPoint}">
  	<div style="text-align: center;">받은 매너평가 없습니다.</div>
  </c:if>
  <div style="text-align: right">참여 인원수:${reviewSize}(평균 5점만점)</div>
  <c:forEach items="${reviewPoint}" var="r" varStatus="status">
 	<ul class="list-group list-group-flush">
  	  <li class="list-group-item">
  	  	<c:if test="${status.count==1}">
  	  	<span>1.친절하고 매너가 좋아요 - ${r}점</span>
	  	          
	  	</c:if>
	  	<c:if test="${status.count==2}">
	  	<span>2.시간 약속을 잘지켜요 - ${r}점</span>
	  	         
	  	</c:if>
	  	<c:if test="${status.count==3}">
	  	<span>3.응답이 빨라요 - ${r}점</span>
	  	         
	  	</c:if>
	  	<c:if test="${status.count==4}">
	  	<span>4.좋은 상품을 저렴하게 판매해요 - ${r}점</span>
	  	         
	  	</c:if>
	  	<c:if test="${status.count==5}">
	  	<span>5.상품상태가 설명한 것과 같아요 - ${r}점</span>
	  	         
	  	</c:if>
	  	<c:if test="${status.count==6}">
	  	<span>6.제가 있는 곳까지 와서 거래했어요 - ${r}점</span>
	  	         
	  	</c:if>
	  	<c:if test="${status.count==7}">
	  	<span>7.상품설명이 자세해요 - ${r}점</span>
	  	         
	  	</c:if>	
  	  </li>
  	  
    </ul> 
  </c:forEach>
 
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>