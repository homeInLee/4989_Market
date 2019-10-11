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
                <h3 class="tit txt_center">MD의  추천</h3>
                <div id="category">
                	<ul id="list_category">
                		<li>
                			<a href="#" id="">의류</a>
                		</li>
                		<li>
                			<a href="#" id="">뷰티 · 잡화</a>
                		</li>
                		<li>
                			<a href="#" id="">식품 · 마트 · 유아</a>
                		</li>
                		<li>
                			<a href="#" id="">가구 · 생활 · 건강 · 렌탈  </a>
                		</li>
                		<li>
                			<a href="#" id=""> 디지털 · 가전 · 컴퓨터 </a>
                		</li>
                		<li>
                			<a href="#" id="">스포츠 · 레저 · 자동차</a>
                		</li>
                		<li>
                			<a href="#" id="">도서 · 티켓 · 여행 · e쿠폰</a>
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
            	</div>
            </article>
        </section>
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>