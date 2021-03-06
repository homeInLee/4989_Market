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
<jsp:include page="/WEB-INF/views/review/reviewHeader.jsp"></jsp:include>
<style>
/*GLOBALS*/
*{margin:0; padding:0; list-style:none;}
a{text-decoration:none; color:#666;}
a:hover{color:#1bc1a3;}
body, hmtl{background: #fff; font-family: 'Anton', sans-serif;}


#wrapper{
    width:600px;
    margin:50px auto;
    height:400px;
    position:relative;
    color:#fff;
    text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;    
}

#slider-wrap{
    width:600px;
    height:400px;
    position:relative;
    overflow:hidden;
}

#slider-wrap ul#slider{
    width:100%;
    height:100%;
    
    position:absolute;
    top:0;
    left:0;     
}

#slider-wrap ul#slider li{
    float:left;
    position:relative;
    width:600px;
    height:400px;   
}

#slider-wrap ul#slider li > div{
    position:absolute;
    top:20px;
    left:35px;  
}

#slider-wrap ul#slider li > div h3{
    font-size:36px;
    text-transform:uppercase;   
}

#slider-wrap ul#slider li > div span{
    font-family: Neucha, Arial, sans serif;
    font-size:21px;
}

#slider-wrap ul#slider li img{
    display:block;
    width:100%;
  height: 100%;
}


/*btns*/
.btns{
    position:absolute;
    width:50px;
    height:60px;
    top:50%;
    margin-top:-25px;
    line-height:57px;
    text-align:center;
    cursor:pointer; 
    background:rgba(0,0,0,0.1);
    z-index:100;
    
    
    -webkit-user-select: none;  
    -moz-user-select: none; 
    -khtml-user-select: none; 
    -ms-user-select: none;
    
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
    -o-transition: all 0.1s ease;
    -ms-transition: all 0.1s ease;
    transition: all 0.1s ease;
}

.btns:hover{
    background:rgba(0,0,0,0.3); 
}

#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}
#counter{
    top: 30px; 
    right:35px; 
    width:auto;
    position:absolute;
}

#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}


/*bar*/
#pagination-wrap{
    min-width:20px;
    margin-top:350px;
    margin-left: auto; 
    margin-right: auto;
    height:15px;
    position:relative;
    text-align:center;
}

#pagination-wrap ul {
    width:100%;
}

#pagination-wrap ul li{
    margin: 0 4px;
    display: inline-block;
    width:5px;
    height:5px;
    border-radius:50%;
    background:#fff;
    opacity:0.5;
    position:relative;
  top:0;
  
  
}

#pagination-wrap ul li.active{
  width:12px;
  height:12px;
  top:3px;
    opacity:1;
    box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
}




/*Header*/
h1, h2{text-shadow:none; text-align:center;}
h1{ color: #666; text-transform:uppercase;  font-size:36px;}
h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 




/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li{
    -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    transition: all 0.3s cubic-bezier(1,.01,.32,1); 
}

#memberInfo{
	margin-left: 50px;
	text-align: left;
}
a{
	color:black;
}
#directPrice{
	text-align: right;
}


</style>


<script>
//장바구니 기능 코드 나중에 옮기자
function basketCheck(check,sellNo,memberId){
	var basket={};
	basket.sellNo = sellNo;
    basket.memberId = memberId;
	
    if(check==0){	
		//장바구니에 담기
		$.ajax({
		    url: "${pageContext.request.contextPath}/basket/basketInsert",
		    data:basket,
		    contentType:"application/json; charset=utf-8",
		    type: "GET",
		    dataType: "json",
		    success: function(data) {
		      alert("장바구니에 담겼습니다");
		    },
		    error: function(xhr,txtStatus,err){
		      console.log("ajax실패",xhr,txtStatus,err);
		    }
		});
	
		$("#image").attr("src","${pageContext.request.contextPath}/resources/images/redheart.PNG");
		$("#image").attr("onclick","basketCheck(1,"+sellNo+",'"+memberId+"')");
	}else{
		//장바구니에 삭제
		console.log(sellNo);
		console.log(memberId);
		$.ajax({
		    url: "${pageContext.request.contextPath}/basket/basketDelete",
		    data:basket,
		    contentType:"application/json; charset=utf-8",
		    type: "GET",
		    dataType: "json",
		    success: function(data) {
		      alert("장바구니에서 삭제되었습니다")
		      location.href="${pageContext.request.contextPath }/basket/basketView.do?memberId=${memberLoggedIn.memberId}";
		    },
		    error: function(xhr,txtStatus,err){
		      console.log("ajax실패",xhr,txtStatus,err);
		    }
		});
		
		$("#image").attr("src","${pageContext.request.contextPath}/resources/images/whiteheart.PNG");
		$("#image").attr("onclick","basketCheck(0,"+sellNo+",'"+memberId+"')");
	}
}
//
</script>
<div class="submenu">
	<a id="review-btn" href="${pageContext.request.contextPath }/basket/basketView.do?memberId=${memberLoggedIn.memberId}">중고물품 장바구니</a>
  	<a id="review-btn" href="${pageContext.request.contextPath }/basket/basketAuctionView.do?memberId=${memberLoggedIn.memberId}">경매물품 장바구니</a>	
</div>

<div id="wrapper">
      <div id="slider-wrap">
          <ul id="slider">
             <li data-color="#1abc9c">
                             
<img src="http://placehold.it/700x400">
             </li>
             
             <li data-color="#3498db">
<img src="http://placehold.it/700x400">
             </li>
             
             <li data-color="#9b59b6">
<img src="http://placehold.it/700x400">
             </li>     
          </ul>
          
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
          <!--controls-->  
                 
      </div>
  
</div>

<div id="memberInfo">
	<!-- 장바구니 기능 코드 -->
	
	<c:if test="${empty basket}">
		<div style="text-align: right;"><img id="image" onclick="basketCheck(0,${p.sellNo},'${memberLoggedIn.memberId}')" src="${pageContext.request.contextPath }/resources/images/whiteheart.PNG" alt="" style="width: 20px; height: 20px; cursor: pointer;"/></div>
	</c:if>
	
	<c:if test="${not empty basket}">
		<div style="text-align: right;"><img id="image" onclick="basketCheck(1,${p.sellNo},'${memberLoggedIn.memberId}')" src="${pageContext.request.contextPath }/resources/images/redheart.PNG" alt="" style="width: 20px; height: 20px; cursor: pointer;"/></div>
	</c:if>
	
	<!--  -->
	<hr />
		<a href="">
			<h6>${p.sellWriter }</h6>
   		</a>
	   		<span>${member.memberAddress}</span>	
	<hr />
	
	<div>
		<h3 style="padding:32px 0;">${p.sellTitle}</h3>
		<fmt:formatNumber value="${p.sellPrice }" pattern="#,###" />원	
		<p>${p.sellContent}</p>
		
	</div>
	
	<hr />
	
</div>
<script>
//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();


$(document).ready(function(){
    
    
    /*****************
     BUILD THE SLIDER
    *****************/
    //set width to be 'x' times the number of slides
    $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
    
    //next slide    
    $('#next').click(function(){
        slideRight();
    });
    
    //previous slide
    $('#previous').click(function(){
        slideLeft();
    });
    
    
    
    /*************************
     //*> OPTIONAL SETTINGS
    ************************/
    //automatic slider
    var autoSlider = setInterval(slideRight, 3000);
    
    //for each slide 
    $.each($('#slider-wrap ul li'), function() { 

       //create a pagination
       var li = document.createElement('li');
       $('#pagination-wrap ul').append(li);    
    });
    
    //counter
    countSlides();
    
    //pagination
    pagination();
    
    //hide/show controls/btns when hover
    //pause automatic slide when hover
    $('#slider-wrap').hover(
      function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
      function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
    );
    
    

});//DOCUMENT READY
    


/***********
 SLIDE LEFT
************/
function slideLeft(){
    pos--;
    if(pos==-1){ pos = totalSlides-1; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
    
    //*> optional
    countSlides();
    pagination();
}


/************
 SLIDE RIGHT
*************/
function slideRight(){
    pos++;
    if(pos==totalSlides){ pos = 0; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
    
    //*> optional 
    countSlides();
    pagination();
}



    
/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides(){
    $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
    $('#pagination-wrap ul li').removeClass('active');
    $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}
 
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>