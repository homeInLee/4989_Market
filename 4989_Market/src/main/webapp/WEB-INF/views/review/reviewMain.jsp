<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/review/reviewHeader.jsp"></jsp:include>
<div class="menu">
  	<a class="badge badge-light" href="${pageContext.request.contextPath }/review/reviewMain.do?memberId=${memberLoggedIn.memberId}">판매물품</a>
  	<a class="badge badge-light" href="${pageContext.request.contextPath}/review/reviewContentForm.do?memberId=${memberLoggedIn.memberId}">거래 후기</a>
  	<a class="badge badge-light" href="${pageContext.request.contextPath}/review/reviewMannerForm.do?memberId=${memberLoggedIn.memberId}">매너 칭찬</a>
  	<a class="badge badge-light" href="${pageContext.request.contextPath}/review/reviewCheckForm.do">임시 거래 평가</a>
</div>
<!-- Page Content -->
<div class="container">

  <!-- Page Heading -->
  <div class="row">
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card h-70">
        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
        <div class="card-body">
          <h4 class="card-title">
            <a href="#">제목</a>
          </h4>
          <p class="card-text">주소</p>
          <p class="card-text">가격</p>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card h-70">
        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
        <div class="card-body">
          <h4 class="card-title">
            <a href="#">제목</a>
          </h4>
          <p class="card-text">주소</p>
          <p class="card-text">가격</p>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card h-70">
        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
        <div class="card-body">
          <h4 class="card-title">
            <a href="#">제목</a>
          </h4>
          <p class="card-text">주소</p>
          <p class="card-text">가격</p>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card h-70">
        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
        <div class="card-body">
          <h4 class="card-title">
            <a href="#">제목</a>
          </h4>
          <p class="card-text">주소</p>
          <p class="card-text">가격</p>
        </div>
      </div>
    </div>
   </div>
</div>
<!-- /.container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>