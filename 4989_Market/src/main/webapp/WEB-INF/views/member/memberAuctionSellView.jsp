<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/review.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/review/reviewHeader.jsp"></jsp:include>
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
	
ul.pageUl {
    text-align:center;
    top: 2px;
}
ul li.pageLi {
    display:inline;
    vertical-align:middle;
}
ul li a.pageA {
    display:-moz-inline-stack;
    display:inline-block;
    vertical-align:top;
    padding:4px;
    margin-left: 3px;
    width:30px !important;
    color:#000;
    font:bold 14px tahoma;
    border:1px solid #eee;
    text-decoration:none;
    margin-top: 17px;
}
ul li a.pageB{
    display:-moz-inline-stack;
    display:inline-block;
    vertical-align:top;
    padding:4px;
    margin-left: 3px;
    width:50px !important;
    color:#000;
    font:bold 14px tahoma;
    border:1px solid #eee;
    text-decoration:none;
    margin-top: 17px;
}
ul li a.now {
    color:#fff;
    background-color:#1b5ac2;
    border:1px solid #1b5ac2;
}
ul li a:hover, ul li a:focus {
    color:#fff;
    border:1px solid #1b5ac2;
    background-color:#1b5ac2;
}
</style>
<script>
//판매완료하기 기능
function auctionComplete(auctionNo,auctionBuyer){
	if(confirm("판매완료하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/auction/auctionComplete.do?auctionNo="+auctionNo+"&auctionWriter=${memberLoggedIn.memberId}&auctionBuyer="+auctionBuyer;
	}else{
		return;
	}
}
</script>
<div class="submenu">
  	<a id="review-btn" href="${pageContext.request.contextPath }/auction/memberAuctionBuyView.do?memberId=${memberLoggedIn.memberId}">구매경매물품</a>	
	<a id="review-btn" href="${pageContext.request.contextPath }/auction/memberAuctionSellView.do?memberId=${memberLoggedIn.memberId}">판매경매물품</a>
</div>

<h2 style="display:block">판매 경매 물품</h2>
	<br />
	<c:if test="${empty auctionList}">
		<div style="text-align: center;">판매 경매 물품이 비어있습니다</div>
	</c:if>
	<section>
		<c:forEach items="${auctionList}" var="l">
			<article class="top-card">
				<a href="${pageContext.request.contextPath }/auction/auctionSelectOne.do?auctionNo=${l.auctionNo}&memberId=${memberLoggedIn.memberId}" style="text-decoration: none;">
					  	<!-- <img src="http://placehold.it/700x400" style="width:100%"> -->
					  	<c:forEach items="${attachmentList }" var="a">
					  		<c:if test="${l.auctionNo==a.boardNo and a.attachmentMainImage=='Y' and a.boardName=='A'}">				
					  			<img src="${pageContext.request.contextPath}/resources/upload/auction/${a.renamedfileName}" style="width:215px; height: 200px;">
					  		</c:if>
					  	</c:forEach>
					<div>
					  	<br />
					  	<h5>${l.auctionTitle }</h5>
						<div class="auction-content">
							${l.auctionAddress }
						</div>
						<div class="auction-price">
							<fmt:formatNumber value="${l.auctionDirectPrice }" pattern="#,###" />원
						</div>
						<div class="auction-content">판매경매물품</div>
						<div>기간</div>
						<div class="auction-content">
							${l.auctionDate}~${l.auctionEndDate}
						</div>
					</div>
				</a>
				<!-- 판매완료하기 기능 -->
				<c:if test="${'Y' eq fn:trim(l.auctionDeltype) and l.auctionBuyer!=null and 'H' eq fn:trim(l.auctionType)}">
					<button class="badge badge-light" onclick="auctionComplete(${l.auctionNo},'${l.auctionBuyer}')">판매완료하기</button>
				</c:if>
				<c:if test="${'Y' eq fn:trim(l.auctionDeltype) and l.auctionBuyer!=null and 'C' eq fn:trim(l.auctionType)}">
					판매완료
				</c:if>
				<br /><br />
			</article>
			
		</c:forEach>
		<div>
		    <ul class="pageUl">
		        <c:if test="${paging.prev}">
		            <li class="pageLi"><a class="pageB" href="#" onClick="fn_prev('${paging.page}', '${paging.range}', '${paging.rangeSize}')">&lt;이전</a></li>
		        </c:if>
		            
		        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
		            <li class="pageLi" "<c:out value="${paging.page == idx ? 'active' : ''}"/>"><a class="pageA" href="#" onClick="fn_pagination('${idx}', '${paging.range}', '${paging.rangeSize}')"> ${idx} </a></li>
		        </c:forEach>
		            
		        <c:if test="${paging.next}">
		            <li class="pageLi" ><a class="pageB" href="#" onClick="fn_next('${paging.range}', '${paging.range}', '${paging.rangeSize}')" >다음&gt;</a></li>
		        </c:if>
		    </ul>
		</div>
	</section>

<script>
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
    var page = ((range - 2) * rangeSize) + 1;
    var range = range - 1;
    
    var url = "${pageContext.request.contextPath}/auction/memberAuctionSellView.do?memberId=${memberLoggedIn.memberId}";
    url = url + "&page=" + page;
    url = url + "&range=" + range;
    
    location.href = url;
}
//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
    var url = "${pageContext.request.contextPath}/auction/memberAuctionSellView.do?memberId=${memberLoggedIn.memberId}";
    url = url + "&page=" + page;
    url = url + "&range=" + range;
    location.href = url;    
}
//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
    var page = parseInt((range * rangeSize)) + 1;
    var range = parseInt(range) + 1;
    
    var url = "${pageContext.request.contextPath}/auction/memberAuctionSellView.do?memberId=${memberLoggedIn.memberId}";
    url = url + "&page=" + page;
    url = url + "&range=" + range;
    
    location.href = url;
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>