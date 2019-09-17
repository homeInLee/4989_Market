<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 페이지</title>
</head>
<body>
<style>
h2, section{
	text-align: center;
	position: relative;
}

</style>

	<h2>경매 목록</h2>
	<section>
	<c:forEach items="${auctionList }" var="a">
		<table style="cursor:pointer;" >
			<div class="card" style="width: 18rem;">
			  <div class="card-body">
				<tr>
					<th>이미지</th>
					<th>경매번호</th>
					<th>품목</th>
					<th>설명</th>
					<th>판매자</th>
					<th>가격</th>
				</tr>
				<tr>
				  	<td><img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/iPhoneX.jpg" alt="Card image cap" style="height: 180px"></td>
					<td>${a.auctionNo }</td>
					<td>${a.auctionTitle }</td>
					<td class="card-text">${a.auctionContent }</td>
					<td>${a.auctionWriter }</td>
					<td>${a.auctionPrice }</td>
				</tr>
			  </div>
			</div>
		
		</table>
	</c:forEach>
	</section>	

		
	

</body>
</html>