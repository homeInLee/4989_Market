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
  
  <div style="margin-top: 50px; margin-left: 230px;">
  	<a class="badge badge-warning"><h2>회원정보</h2></a>
  	<a class="badge badge-warning" href="${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}"><h2>쪽지함</h2></a>
  	<a class="badge badge-warning"><h2>나의거래</h2></a>
  	<a class="badge badge-warning"><h2>나의경매</h2></a>
  </div>
  
  <h3>user</h3>
  
  <div>
  	<a class="badge badge-light">판매물품</a>
  	<a class="badge badge-light" href="#">거래 후기</a>
  	<a class="badge badge-light">매너 칭찬</a>
  	<a class="badge badge-light" href="${pageContext.request.contextPath}/review/reviewCheckForm.do">임시 거래 평가</a>
  </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>