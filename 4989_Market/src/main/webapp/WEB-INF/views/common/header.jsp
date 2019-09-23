<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4989Market</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css">
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	

</head>
<script>
$(()=>{
	$("#dropdown").click(function() {
		$("#sub").slideDown(50)
	});
	$("#sub").click(function() {
		$("#sub").slideUp(1000)
	});
});
</script>

<body>
	<header id="header">
		<section id="header-top">
			<h1 id="logo"><a href="${pageContext.request.contextPath}">4989 Market  <img src=""></a>
			</h1>
			<div id="search-box">
				<form>
					<input id="search-text" type="text" placeholder="어떤 상품을 찾고 계세요?">
					<button id="search-btn">
						<img src="">검색
					</button>
				</form>
			</div>
			<div id="header-btn">
			<c:if test="${memberLoggedIn==null}">
				<!-- 로그인,회원가입 버튼 -->
				<button class="log" type="button" data-toggle="modal" data-target="#loginModal">로그인</button>
				&nbsp;
				<button class="log" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do'">회원가입</button>
			</c:if>
		    <c:if test="${memberLoggedIn!=null}">
		        <span><a href="${pageContext.request.contextPath }/member/memberView.do?memberId=${memberLoggedIn.memberId}">${memberLoggedIn.memberName}</a> 님, 안녕하세요</span>
		        &nbsp;
		        <button class="log" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">로그아웃</button>
		    </c:if>
			</div>
		</section>
		<hr>
		<section id="header-bottom">
			<div id="header-catagory">
			<ul id="menu">
					<li>
						<a href="${pageContext.request.contextPath }/product/productList.do">상품</a>
						<ul>
						    <li><a href="#">menu1</a></li>
						    <li><a href="#">menu2</a></li>
						    <li><a href="#">menu3</a></li>
					    </ul>
				    </li>
					<li>
						<a href="#">무료나눔</a>
						<ul>
						    <li><a href="#">menu1</a></li>
						    <li><a href="#">menu2</a></li>
						    <li><a href="#">menu3</a></li>
					    </ul>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/auction/auction.do">경매</a>
						<ul>
						    <li><a href="#">menu1</a></li>
						    <li><a href="#">menu2</a></li>
						    <li><a href="#">menu3</a></li>
					    </ul>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/product/productRegistration.do">등록하기</a>
						<ul>
						    <li><a href="${pageContext.request.contextPath }/auction/auctionEnroll.do">경매물품 등록</a></li>
						    <li><a href="#">menu2</a></li>
						    <li><a href="#">menu3</a></li>
					    </ul>
					</li>
                    <li><a href="${pageContext.request.contextPath }/notice/noticeList.do">공지사항</a></li>
				</ul>
			</div>
		</section>
	</header>
	<hr>
	<!-- 로그인모달 : https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!--로그인폼 : https://getbootstrap.com/docs/4.1/components/forms/#overview -->
				<form action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">
					<div class="modal-body">
						<input type="text" class="form-control" name="memberId" placeholder="아이디" required> <br /> 
						<input type="password" class="form-control" name="password" placeholder="비밀번호" required>
					</div>
					<div class="modal-footer">
						<button type="submit" class="log">로그인</button>
						<button type="button" class="log" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
