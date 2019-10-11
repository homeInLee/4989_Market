<%@page import="com.kh.market.auction.model.vo.Auction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/index.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> 
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> 
<style>
.space-type li {
float:left;
width:249px;
margin-right:18px;
}

.bx-wrapper {
-moz-box-shadow: none;
-webkit-box-shadow: none;
box-shadow: none;
border: none;
}

#banner_wrap {position:relative; width:500px; margin:15px auto;}
</style>

<script>
$(()=>{
	var mySlider = $('#slide_banner').bxSlider({
		mode: 'horizontal',
		minSlides:4,
		maxSlides:4,
		speed:500,
		slideWidth:900,
		slideMargin:10,
		auto:true
	});
});

</script>


<div id="main_container">
		<section id="main-sec1" class="sec">
		<article style="margin-top: 50px;">
		<h3 class="tit txt_center">이 상품 어때요?</h3>
			<div id="banner_wrap" style="width: 100%; overflow: hidden; position: relative; height: 506px;">
				<ul id="slide_banner" style="width: 100%; overflow: hidden; position: relative; height: 506px;">
					<li>
						<a href="" class="clearfix"><img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/mac.jpg" alt="" /></a>
						<div id="info-goods">
		                    <span id="name">
		                    	<a href="" id="text"> mac북 사세요</a>
		                    </span>
		                    <span id="price">500,000원</span>
		                </div>
					</li>
					<li>
						<a href="" class="clearfix"><img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/iphone.jpg" alt="" /></a>
						<div id="info-goods">
		                    <span id="name">
		                    	<a href="" id="text"> 명품 핸드폰 팔아요!</a>
		                    </span>
		                    <span id="price">400,000원</span>
		                </div>
					</li>
					<li>
						<a href="" class="clearfix"><img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/product/louisvuitton.jpg" alt="" /></a>
						<div id="info-goods">
		                    <span id="name">
		                    	<a href="" id="text">진짜! 명품!!</a>
		                    </span>
		                    <span id="price">500,000원</span>
		                </div>
					</li>
					<li>
						<a href="" class="clearfix"><img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/baby.jpg" alt="" /></a>
						<div id="info-goods">
		                    <span id="name">
		                    	<a href="" id="text"> 인기만점! 아기 채육관</a>
		                    </span>
		                    <span id="price">30,000원</span>
		                </div>
					</li>
					<li>
						<a href="" class="clearfix"><img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/stroller.jpg" alt="" /></a>
						<div id="info-goods">
		                    <span id="name">
		                    	<a href="" id="text"> 1번 밖에 안쓴 유모차</a>
		                    </span>
		                    <span id="price">150,000원</span>
		                </div>
					</li>
					<li>
						<a href="" class="clearfix"><img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/coat.jpg" alt="" /></a>
						<div id="info-goods">
		                    <span id="name">
		                    	<a href="" id="text"> 깨끗한 버버리 코트</a>
		                    </span>
		                    <span id="price">100,000원</span>
		                </div>
					</li>
				</ul>
			</div>
		</article>
		</section>
 
           <section id="main-sec2" class="sec">
            <article>
            	<div id="sec2">
                <h3 class="tit txt_center">새로운 상품</h3>
                <div id="sec2-img">
	                <ul style="width: 1015%; overflow: hidden; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
	                   <li style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/nike.jpg" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">진짜 off white!!!</a>
		                    		</span>
		                    		<span id="price">100,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	                    
	                   <li style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/iphone.jpg" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">명품 핸드폰 팔아요!</a>
		                    		</span>
		                    		<span id="price">400,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	                    
	                   <li style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/dior.jpg" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">Dior!!! 레이디백</a>
		                    		</span>
		                    		<span id="price">1,000,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	                    
	                </ul>
                </div>
            	</div>
            </article>
        </section>  
        <section> 
            <article>
            	<div id="MD">
                <h3 id="ori" class="tit txt_center">MD의  추천</h3>
                <div id="category">
                	<ul id="list_category">
                		<li>
                			<a href="#" id="dress">의류</a>
                		</li>
                		<li>
                			<a href="#" id="beauty">뷰티 · 잡화</a>
                		</li>
                		<li>
                			<a href="#" id="mart">식품 · 마트 · 유아</a>
                		</li>
                		<li>
                			<a href="#" id="health">가구 · 생활 · 건강 · 렌탈  </a>
                		</li>
                		<li>
                			<a href="#" id="digital"> 디지털 · 가전 · 컴퓨터 </a>
                		</li>
                		<li>
                			<a href="#" id="sport">스포츠 · 레저 · 자동차</a>
                		</li>
                		<li>
                			<a href="#" id="book">도서 · 티켓 · 여행 · e쿠폰</a>
                		</li>
                	</ul>
                </div>
                <div id="sec3-img">
                <ul  style="overflow: hidden; width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/mac.jpg" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">mac북 사세요</a>
		                    		</span>
		                    		<span id="price">9,900원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/chanel.jpg" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">여자들의 로망, chanel</a>
		                    		</span>
		                    		<span id="price">1,500,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/adidas.jpg" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">몇번 안신은 운동화 팔아요</a>
		                    		</span>
		                    		<span id="price">50,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                </ul>
                </div>
                <div id="sec3-2img" style="display:none;">
                <ul  style="overflow: hidden; width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/animal.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">애니멀 우주복</a>
		                    		</span>
		                    		<span id="price">35,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/bose.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">중고 보세 옷 떨이요.</a>
		                    		</span>
		                    		<span id="price">10,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/Fitting.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">프릴리본블라우스(피팅의류)</a>
		                    		</span>
		                    		<span id="price">25,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                </ul>
                </div>
                <div id="sec3-3img" style="display:none;">
                <ul  style="overflow: hidden; width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/flower.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">꽃을든 남자 옴므 스킨케어 세트 남성화장품</a>
		                    		</span>
		                    		<span id="price">28,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/5belt.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">오혁허리띠팝니다.</a>
		                    		</span>
		                    		<span id="price">300,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/rui.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">루이비통 정품 크로스가방 심플가방</a>
		                    		</span>
		                    		<span id="price">500,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                </ul>
                </div>
                <div id="sec3-4img" style="display:none;">
                <ul  style="overflow: hidden; width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/art.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">바른생활 아트컬렉션12입 1세트</a>
		                    		</span>
		                    		<span id="price">8,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/hong.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">홍삼스틱 15ml 60포</a>
		                    		</span>
		                    		<span id="price">59,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/blue.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">블루보틀 텀블러</a>
		                    		</span>
		                    		<span id="price">2,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                </ul>
                </div>
                <div id="sec3-5img" style="display:none;">
                <ul  style="overflow: hidden; width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/tvdiy.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">TV DIY</a>
		                    		</span>
		                    		<span id="price">10,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/mazack.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">원마작 중국마작 중국게임</a>
		                    		</span>
		                    		<span id="price">20,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/dragon.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">소니 PS4 용과같이4 전설을 잇는 자</a>
		                    		</span>
		                    		<span id="price">38,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                </ul>
                </div>
                <div id="sec3-6img" style="display:none;">
                <ul  style="overflow: hidden; width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/Spider.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">Joy Photo 28  Spider</a>
		                    		</span>
		                    		<span id="price">740,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/air.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">에어팟2세대 무선충선 새제품 팝니다.</a>
		                    		</span>
		                    		<span id="price">195,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/rider.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">허스크바나 승용잔디깍기 후론트라이더</a>
		                    		</span>
		                    		<span id="price">14,550,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                </ul>
                </div>
                <div id="sec3-7img" style="display:none;">
                <ul  style="overflow: hidden; width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/energe.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">에너자이저 AA건전지</a>
		                    		</span>
		                    		<span id="price">120,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/bike.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">와이업자전거 세발자전거 유아자전거 팝니다.</a>
		                    		</span>
		                    		<span id="price">25,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/stand.PNG" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">지아이엘 SG-2농구대 이동식 농구링</a>
		                    		</span>
		                    		<span id="price">1,035,500원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                </ul>
                </div>
                <div id="sec3-8img" style="display:none;">
                <ul  style="overflow: hidden; width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/book.png" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">중고도서 권당 3000원 팝니다.</a>
		                    		</span>
		                    		<span id="price">3,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/ticket.png" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">메이저리그 직관 야구티켓 팔아여.</a>
		                    		</span>
		                    		<span id="price">70,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                	 <li style=" float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block clearfix">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath}/resources/images/home.png" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">반포자이아파트 36평형</a>
		                    		</span>
		                    		<span id="price">4,500,000,000원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                </ul>
                </div>
            	</div>
            </article>
        </section>
    </div>
<script>
$(()=>{
	$('#dress').hover(function() {
		if($("#sec3-2img").css("display") == "none"){   
	        $('#sec3-img').hide();  
	        $('#sec3-3img').hide();  
	        $('#sec3-4img').hide();  
	        $('#sec3-5img').hide();  
	        $('#sec3-6img').hide();  
	        $('#sec3-7img').hide();  
	        $('#sec3-8img').hide();  
	        $('#sec3-2img').show();  
	    }
	})
	$('#beauty').hover(function() {
		if($("#sec3-3img").css("display") == "none"){   
	        $('#sec3-img').hide();  
	        $('#sec3-2img').hide();  
	        $('#sec3-4img').hide();  
	        $('#sec3-5img').hide();  
	        $('#sec3-6img').hide();  
	        $('#sec3-7img').hide();  
	        $('#sec3-8img').hide();  
	        $('#sec3-3img').show();  
	    }
	})
	$('#mart').hover(function() {
		if($("#sec3-4img").css("display") == "none"){   
	        $('#sec3-img').hide();  
	        $('#sec3-2img').hide();  
	        $('#sec3-3img').hide();  
	        $('#sec3-5img').hide();  
	        $('#sec3-6img').hide();  
	        $('#sec3-7img').hide();  
	        $('#sec3-8img').hide();  
	        $('#sec3-4img').show();  
	    } 
	})
	$('#health').hover(function() {
		if($("#sec3-5img").css("display") == "none"){   
	        $('#sec3-img').hide();  
	        $('#sec3-2img').hide();  
	        $('#sec3-3img').hide();  
	        $('#sec3-4img').hide();  
	        $('#sec3-6img').hide();  
	        $('#sec3-7img').hide();  
	        $('#sec3-8img').hide();  
	        $('#sec3-5img').show();  
	    } 
	})
	$('#digital').hover(function() {
		if($("#sec3-6img").css("display") == "none"){   
	        $('#sec3-img').hide();  
	        $('#sec3-2img').hide();  
	        $('#sec3-3img').hide();  
	        $('#sec3-4img').hide();  
	        $('#sec3-5img').hide();  
	        $('#sec3-7img').hide();  
	        $('#sec3-8img').hide();  
	        $('#sec3-6img').show();  
	    }
	})
	$('#sport').hover(function() {
		if($("#sec3-7img").css("display") == "none"){   
	        $('#sec3-img').hide();  
	        $('#sec3-2img').hide();  
	        $('#sec3-3img').hide();  
	        $('#sec3-4img').hide();  
	        $('#sec3-5img').hide();  
	        $('#sec3-6img').hide();  
	        $('#sec3-8img').hide();  
	        $('#sec3-7img').show();  
	    } 
	})
	$('#book').hover(function() {
		if($("#sec3-8img").css("display") == "none"){   
	        $('#sec3-img').hide();  
	        $('#sec3-2img').hide();  
	        $('#sec3-3img').hide();  
	        $('#sec3-4img').hide();  
	        $('#sec3-5img').hide();  
	        $('#sec3-6img').hide();  
	        $('#sec3-7img').hide();  
	        $('#sec3-8img').show();  
	    }
	})
	$('#ori').hover(function() {
		if($("#sec3-img").css("display") == "none"){   
	        $('#sec3-img').show();  
	        $('#sec3-2img').hide();  
	        $('#sec3-3img').hide();  
	        $('#sec3-4img').hide();  
	        $('#sec3-5img').hide();  
	        $('#sec3-6img').hide();  
	        $('#sec3-7img').hide();  
	        $('#sec3-8img').hide();  
	    }
	})
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>