<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/index.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/slick-theme.css"/>
<style>
.space-type li {
float:left;
width:249px;
margin-right:18px;
}
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/slick/slick.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
$(document).ready(function(){
	$('.space-type').slick({
	  infinite: true,
	  slidesToShow: 4,
	  slidesToScroll: 4,
	  prevArrow: ".prev_btn",
	  nextArrow: ".next_btn"
	});
});	
</script>

<div id="main_container">
        
        <section id="main-sec1" class="sec">
            <article>
            <div class="your-class">
                <h3 class="tit txt_center">이 상품 어때요?</h3>
                <div id="list-goods" style="max-width: 1050px; margin: 0px auto;">
	                <div id="viewport" style="width: 100%; overflow: hidden; position: relative; height: 506px;">
		                <ul class="space-type clearfix" style="width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
		                    <li>
							<img  class="sec-image" style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/mac.jpg" alt="" />
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">mac북 사세요</a>
		                    		</span>
		                    		<span id="price">9,900원</span>
		                    		<span></span>
		                    	</div>
		                    </li>
		                    <li>
							<img class="sec-image" style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/mac.jpg" alt="" />
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">mac북 사세요</a>
		                    		</span>
		                    		<span id="price">9,900원</span>
		                    		<span></span>
		                    	</div>
		                    </li>
		                    <li>
		                    	<a href="" class="dp_block">
									<img class="sec-image" style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/mac.jpg" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">mac북 사세요</a>
		                    		</span>
		                    		<span id="price">9,900원</span>
		                    		<span></span>
		                    	</div>
		                    </li>
		                    <li>
		                    	<a href="" class="dp_block">
									<img class="sec-image" style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/mac.jpg" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">mac북 사세요</a>
		                    		</span>
		                    		<span id="price">9,900원</span>
		                    		<span></span>
		                    	</div>
		                    </li>
		                    <li>
		                    	<a href="" class="dp_block">
									<img class="sec-image" style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/mac.jpg" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">mac북 사세요</a>
		                    		</span>
		                    		<span id="price">9,900원</span>
		                    		<span></span>
		                    	</div>
		                    </li>
		                   
		                </ul>
		                <button class="prev_btn" >&#10094;</button>
						<button class="next_btn">&#10095;</button>
	                </div>
                </div>
            </div>
            </article>
             <section id="main-sec2" class="sec">
            <article>
            	<div id="sec2">
                <h3 class="tit txt_center">새로운 상품</h3>
                <div class="effect">
	                <ul class="member-recom-wrap clearfix" style="width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
	                   <li style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/mac.jpg" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">mac북 사세요</a>
		                    		</span>
		                    		<span id="price">9,900원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	                    
	                </ul>
                </div>
            	</div>
            </article>
        </section>   
            <article>
            	<div id="MD">
                <h3 class="tit txt_center">MD의  추천</h3>
                <div id="category">
                	<ul id="list_category">
                		<li>
                			<a href="#" id="">메뉴</a>
                		</li>
                		<li>
                			<a href="#" id="">메뉴</a>
                		</li>
                		<li>
                			<a href="#" id="">메뉴</a>
                		</li>
                		<li>
                			<a href="#" id="">메뉴</a>
                		</li>
                		<li>
                			<a href="#" id="">메뉴</a>
                		</li>
                		<li>
                			<a href="#" id="">메뉴</a>
                		</li>
                	</ul>
                </div>
                <ul class="recom-space clearfix" style="width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                	 <li style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
		                    	<a href="" class="dp_block">
									<img style="width: 249px; height: 320px;" src="${pageContext.request.contextPath }/resources/images/mac.jpg" alt="" />
		                    	</a>
		                    	<div id="info-goods">
		                    		<span id="name">
		                    			<a href="" id="text">mac북 사세요</a>
		                    		</span>
		                    		<span id="price">9,900원</span>
		                    		<span></span>
		                    	</div>
		                 </li>	     
                
                	<li class="no-list">조회된 공간이 없습니다.</li>
                </ul>
            	</div>
            </article>
        </section>
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>