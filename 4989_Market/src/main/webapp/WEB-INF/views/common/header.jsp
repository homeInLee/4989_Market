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
<style>
#menu{
    height: 50px;
}
.main1{
    width: 738px;
    height: 100%;
    margin: 0 auto;
}
.main1>li{
    float: left;
    width: 25%;
    line-height: 50px;
    text-align: center;
    position: relative;
}
.main1>li:hover .main2{
    left: 0;
}
.main1>li a{
    display: block;
    background: #ffffff;
	text-align: center;
	color: #1b5ac2;
	width: 200px;
	z-index: 200;
	position:relative; 
	text-decoration:none;
}
.main1>li a:hover {
    background: #B21016;
    color: #fff;
    font-weight: bold;
}
.main2{
    position: absolute;
    top:50px;
    left: -9999px;
    background: #ccc;
    width: 100%;
    z-index: 1;
}
.main2>li:hover .main3{
    left: 100%;
}
.main3{
    position: absolute;
    top: 0;
    background: #6BD089;
    width: 200px;
    left: -9999px;
}
.main3>li a:hover{
    background: #085820;
    color: #fff;
}
</style>
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
				<form action="${pageContext.request.contextPath}/product/productSearch.do" method="get">
					<input id="search-text" name="searchWord" type="text" placeholder="어떤 상품을 찾고 계세요?" required>
					<button type="submit" id="search-btn">
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
		        <span><a href="${pageContext.request.contextPath }/member/memberView.do?memberId=${memberLoggedIn.memberId}">${memberLoggedIn.memberName}</a>님</span>
		        &nbsp;
		        <button class="log" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">로그아웃</button>
		    <c:if test="${memberLoggedIn.memberId.trim()=='admin' }">
		        
		        <button class="log" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberList.do'">회원관리</button>
		    </c:if>
		    </c:if>
			</div>
		</section>		
		<section id="header-bottom">
			<div id="menu">
        <ul class="main1">
            <li><a href="${pageContext.request.contextPath }/product/productList.do">중고거래</a>
                <ul class="main2">
                    <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=의류">의류</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=의류 여성의류">여성의류</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=의류 남성의류">남성의류</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=의류 언더웨어">언더웨어</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=뷰티/잡화">뷰티/잡화</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=뷰티/잡화 화장품/향수">화장품/향수</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=뷰티/잡화 바디/헤어">바디/헤어</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=뷰티/잡화 신발">신발</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=뷰티/잡화 가방/패션잡화">가방/패션잡화</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=뷰티/잡화 쥬얼리/시계/선글라스">쥬얼리/시계/선글라스</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아">식품/마트/유아</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아 쌀/과일/농수축산물">쌀/과일/농수축산물</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아 건강식품/다이어트">건강식품/다이어트</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아 커피/음료">커피/음료</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아 즉석/간식/가공식품">즉석/간식/가공식품</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아 화장지/물티슈/생리대">화장지/물티슈/생리대</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아 세제/구강">세제/구강</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아 기저귀/분유/유아식">기저귀/분유/유아식</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아 출산/유아용품/임부복">출산/유아용품/임부복</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아 장난감/교육완구/인형">장난감/교육완구/인형</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아 유아동의류">유아동의류</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=식품/마트/유아 유아동신발/가방/잡화">유아동신발/가방/잡화</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈">가구/생활/건강/렌탈</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈 가구/DIY">가구/DIY</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈 조명/인테리어">조명/인테리어</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈 생활/욕실/수납용품">생활/욕실/수납용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈 주방용품">주방용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈 침구/커튼">침구/커튼</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈 건강/의료용품">건강/의료용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈 반려동물용품">반려동물용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈 악기/취미/키덜트">악기/취미/키덜트</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈 디자인/문구/사무용품">디자인/문구/사무용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈 꽃/이벤트용품">꽃/이벤트용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=가구/생활/건강/렌탈 렌탈서비스">렌탈서비스</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터">디지털/가전/컴퓨터</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 영상가전">영상가전</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 계절가전">계절가전</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 주방가전">주방가전</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 생활/미용가전">생활/미용가전</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 카메라">카메라</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 음향기기">음향기기</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 게임">게임</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 모바일/태블릿">모바일/태블릿</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 노트불/PC">노트불/PC</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 모니터/프린터">모니터/프린터</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 PC주변기기">PC주변기기</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=디지털/가전/컴퓨터 저장장치">저장장치</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=스포츠/레저/자동차">스포츠/레저/자동차</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=스포츠/레저/자동차 휘트니스/수영">휘트니스/수영</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=스포츠/레저/자동차 스포츠의류/운동화">스포츠의류/운동화</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=스포츠/레저/자동차 골프클럼/의류/용품">골프클럼/의류/용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=스포츠/레저/자동차 등산/아웃도어">등산/아웃도어</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=스포츠/레저/자동차 캠핑/낚시">캠핑/낚시</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=스포츠/레저/자동차 구기/라켓">구기/라켓</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=스포츠/레저/자동차 자전거/보드">자전거/보드</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=스포츠/레저/자동차 자동차용품/블랙박스">자동차용품/블랙박스</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=스포츠/레저/자동차 타이어/오일/부품">타이어/오일/부품</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=스포츠/레저/자동차 공구/안전/산업용품">공구/안전/산업용품</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰">도서/티켓/여행/e쿠폰</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 유아/아동">유아/아동</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 교육/참고서">교육/참고서</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 문학/인문/음반">문학/인문/음반</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 콘서트/클래식">콘서트/클래식</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 뮤지컬/연극">뮤지컬/연극</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 행사/전시">행사/전시</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 항공권">항공권</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 해외여행/호텔">해외여행/호텔</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 국내여행/숙박">국내여행/숙박</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 커피/디저트/간식">커피/디저트/간식</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 영화/모바일상품권">영화/모바일상품권</a></li>
                            <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=도서/티켓/여행/e쿠폰 백화점/제화상품권">백화점/제화상품권</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/product/productList.do?sellCategory=기타">기타</a></li>
                </ul>
            </li>
            <li><a href="${pageContext.request.contextPath }/auction/auction.do">중고경매</a>
                <ul class="main2">
                    <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=의류">의류</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=의류 여성의류">여성의류</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=의류 남성의류">남성의류</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=의류 언더웨어">언더웨어</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=뷰티/잡화">뷰티/잡화</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=뷰티/잡화 화장품/향수">화장품/향수</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=뷰티/잡화 바디/헤어">바디/헤어</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=뷰티/잡화 신발">신발</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=뷰티/잡화 가방/패션잡화">가방/패션잡화</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=뷰티/잡화 쥬얼리/시계/선글라스">쥬얼리/시계/선글라스</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아">식품/마트/유아</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아 쌀/과일/농수축산물">쌀/과일/농수축산물</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아 건강식품/다이어트">건강식품/다이어트</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아 커피/음료">커피/음료</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아 즉석/간식/가공식품">즉석/간식/가공식품</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아 화장지/물티슈/생리대">화장지/물티슈/생리대</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아 세제/구강">세제/구강</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아 기저귀/분유/유아식">기저귀/분유/유아식</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아 출산/유아용품/임부복">출산/유아용품/임부복</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아 장난감/교육완구/인형">장난감/교육완구/인형</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아 유아동의류">유아동의류</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=식품/마트/유아 유아동신발/가방/잡화">유아동신발/가방/잡화</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈">가구/생활/건강/렌탈</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈 가구/DIY">가구/DIY</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈 조명/인테리어">조명/인테리어</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈 생활/욕실/수납용품">생활/욕실/수납용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈 주방용품">주방용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈 침구/커튼">침구/커튼</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈 건강/의료용품">건강/의료용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈 반려동물용품">반려동물용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈 악기/취미/키덜트">악기/취미/키덜트</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈 디자인/문구/사무용품">디자인/문구/사무용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈 꽃/이벤트용품">꽃/이벤트용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=가구/생활/건강/렌탈 렌탈서비스">렌탈서비스</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터">디지털/가전/컴퓨터</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 영상가전">영상가전</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 계절가전">계절가전</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 주방가전">주방가전</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 생활/미용가전">생활/미용가전</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 카메라">카메라</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 음향기기">음향기기</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 게임">게임</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 모바일/태블릿">모바일/태블릿</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 노트불/PC">노트불/PC</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 모니터/프린터">모니터/프린터</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 PC주변기기">PC주변기기</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=디지털/가전/컴퓨터 저장장치">저장장치</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=스포츠/레저/자동차">스포츠/레저/자동차</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=스포츠/레저/자동차 휘트니스/수영">휘트니스/수영</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=스포츠/레저/자동차 스포츠의류/운동화">스포츠의류/운동화</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=스포츠/레저/자동차 골프클럼/의류/용품">골프클럼/의류/용품</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=스포츠/레저/자동차 등산/아웃도어">등산/아웃도어</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=스포츠/레저/자동차 캠핑/낚시">캠핑/낚시</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=스포츠/레저/자동차 구기/라켓">구기/라켓</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=스포츠/레저/자동차 자전거/보드">자전거/보드</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=스포츠/레저/자동차 자동차용품/블랙박스">자동차용품/블랙박스</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=스포츠/레저/자동차 타이어/오일/부품">타이어/오일/부품</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=스포츠/레저/자동차 공구/안전/산업용품">공구/안전/산업용품</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰">도서/티켓/여행/e쿠폰</a>
                        <ul class="main3">
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 유아/아동">유아/아동</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 교육/참고서">교육/참고서</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 문학/인문/음반">문학/인문/음반</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 콘서트/클래식">콘서트/클래식</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 뮤지컬/연극">뮤지컬/연극</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 행사/전시">행사/전시</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 항공권">항공권</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 해외여행/호텔">해외여행/호텔</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 국내여행/숙박">국내여행/숙박</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 커피/디저트/간식">커피/디저트/간식</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 영화/모바일상품권">영화/모바일상품권</a></li>
                            <li><a href="${pageContext.request.contextPath }/auction/auction.do?auctionCategory=도서/티켓/여행/e쿠폰 백화점/제화상품권">백화점/제화상품권</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/auction/auction.do?sellCategory=기타">기타</a></li>
                </ul>
            </li>
            <li><a href="#">상품등록</a>
                <ul class="main2">
                    <li><a href="${pageContext.request.contextPath }/product/productRegistration.do">중고물품 등록</a></li>
                    <li><a href="${pageContext.request.contextPath }/auction/auctionEnroll.do">중고경매 등록</a></li>
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
	
	