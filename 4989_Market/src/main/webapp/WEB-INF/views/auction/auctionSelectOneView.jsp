<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value= "경매제품 상세보기" name="pageTitle"/>
</jsp:include>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
#finishNotice{
	display:none; 
	color:red; 
	font-size: 25px;
}

.zeta-menu-bar {
	display: inline-block;
	width: 100%;
}

.zeta-menu {
	margin: 0;
	padding: 0;
}

.zeta-menu li {
	float: left;
	list-style: none;
	position: relative;
}

/* .zeta-menu li:hover { */
/* 	background: black; */
/* } */

/* .zeta-menu li.expand { */
/* 	background: white; */
/* } */

.zeta-menu li.expand>a {
	color: black;
}

.zeta-menu a {
	display: block;
	padding: 10px 20px;
	text-decoration: none;
}

/* .zeta-menu li.expand #declaration:hover{ */
/* background: lightgray;}  */

/* .zeta-menu li.expand>a:hover{ */
/* background: white;}  */

.zeta-menu ul {
	background: #fff;
	border: 1px solid silver;
	display: none;
	padding: 0;
	position: absolute;
/* 	여기부터 위치 조정 */
	left: -11;
	top: -99;
	width: 115px;
}

.zeta-menu ul li {
	float: none;
}

.zeta-menu ul li.expand {
	background: #ddd;
}

.zeta-menu ul li.expand a {
	color: black;
}

.zeta-menu ul a {
	color: black;
}

.zeta-menu ul ul {
	left: 100%;
	top: 0;
}
</style>
<script>
//장바구니 기능 코드
function basketCheck(check,sellNo,memberId){
	var basket={};
	basket.sellNo = sellNo;
    basket.memberId = memberId;
	
    if(check==0){	
		//장바구니에 담기
		$.ajax({
		    url: "${pageContext.request.contextPath}/basket/basketAuctionInsert",
		    data:basket,
		    contentType:"application/json; charset=utf-8",
		    type: "GET",
		    dataType: "json",
		    success: function(data) {
		      alert("장바구니에 담겼습니다");
		      var param = {
		  			auctionNo : '${auctionSelectOne.get(0).auctionNo}'
		  	  }
			  	$.ajax({
			  	    url: "${pageContext.request.contextPath}/basket/basketSelectAuctionCnt",
			  	    data:param,
			  	    contentType:"application/json; charset=utf-8",
			  	    type: "GET",
			  	    dataType: "json",
			  	    success: function(data) {
			  	      $("#aCnt_").html(data);
			  	    },
			  	    error: function(xhr,txtStatus,err){
			  	      console.log("ajax실패",xhr,txtStatus,err);
			  	    }
			  	});
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
		    url: "${pageContext.request.contextPath}/basket/basketAuctionDelete",
		    data:basket,
		    contentType:"application/json; charset=utf-8",
		    type: "GET",
		    dataType: "json",
		    success: function(data) {
		      alert("장바구니에서 삭제되었습니다")
		      var param = {
					auctionNo : '${auctionSelectOne.get(0).auctionNo}'
			  }
				$.ajax({
				    url: "${pageContext.request.contextPath}/basket/basketSelectAuctionCnt",
				    data:param,
				    contentType:"application/json; charset=utf-8",
				    type: "GET",
				    dataType: "json",
				    success: function(data) {
				      $("#aCnt_").html(data);
				    },
				    error: function(xhr,txtStatus,err){
				      console.log("ajax실패",xhr,txtStatus,err);
				    }
				});
		    },
		    error: function(xhr,txtStatus,err){
		      console.log("ajax실패",xhr,txtStatus,err);
		    }
		});
		
		$("#image").attr("src","${pageContext.request.contextPath}/resources/images/whiteheart.PNG");
		$("#image").attr("onclick","basketCheck(0,"+sellNo+",'"+memberId+"')");
	}
}
</script>
<div id="wrapper">
      <div id="slider-wrap">
          <ul id="slider">
          
             	<c:forEach items="${auctionSelectOne }" var="as">
		             <li data-color="#3498db">
							<img src="${pageContext.request.contextPath }/resources/upload/auction/${as.renamedfileName}">
		             </li>
             	</c:forEach>
             
          </ul>
          
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i>&gt;</div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i>&lt;</div>
          <div id="counter"></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
          <!--controls-->  
                 
      </div>
  
   </div>
   
<!-- 장바구니 기능 코드 -->	
<hr />
<c:if test="${auctionSelectOne.get(0).auctionDeltype=='N' }">
	<c:if test="${empty basket}">
		<div ><img id="image" onclick="basketCheck(0,${auctionSelectOne.get(0).auctionNo},'${memberLoggedIn.memberId}')" src="${pageContext.request.contextPath }/resources/images/whiteheart.PNG" alt="" style="width: 20px; height: 20px; cursor: pointer;"/></div>
	</c:if>
		
	<c:if test="${not empty basket}">
		<div ><img id="image" onclick="basketCheck(1,${auctionSelectOne.get(0).auctionNo},'${memberLoggedIn.memberId}')" src="${pageContext.request.contextPath }/resources/images/redheart.PNG" alt="" style="width: 20px; height: 20px; cursor: pointer;"/></div>
	</c:if>
</c:if>
<!--  -->
	<div id="memberInfo">
	<hr />
	<div class='zeta-menu-bar'>
  		<ul class="zeta-menu">	
		<li><a href="#"><h6>${auctionSelectOne.get(0).auctionWriter }</h6></a>
	   		<ul>
		      <li><a id="memberNotice">회원정보</a></li>
		      <li><a href="${pageContext.request.contextPath}/declaration/connectDeclaration?declarationWriter=${memberLoggedIn.memberId }&declarationReceiver=${auctionSelectOne.get(0).auctionWriter }&declarationDivision=m" id="id-declaration"
		      		>신고</a>
		      		</li>
	          <li><input type="hidden" name="declarationReceiver" value="${auctionSelectOne.get(0).auctionWriter }"/></li>
	          <li><input type="hidden" name="declarationDivision" value="m"/></li>
	        </ul>
		</li>
		</ul>
	     </div>  
<!-- 		<a href=""> -->
<%-- 			<h6>${auctionSelectOne.get(0).auctionWriter }</h6> --%>
<!--    		</a> -->
	   		<span>${member.memberAddress}</span>	
<!-- 	신고 버튼	 -->

		<c:if test="${memberLoggedIn.memberId eq 'admin' }">
		<input type="button" id="declarationProcess" value="신고처리" />
		</c:if>
		<input type="button" id="acutionDeclaration" value="신고" />		
		<form name="frmPop" id="frmPop" method=post action="${pageContext.request.contextPath}/declaration/connectDeclaration">
		<input type="hidden" id="declarationWriter" name="declarationWriter" value="${memberLoggedIn.memberId }" />
		<input type="hidden" id="declarationDivision" name="declarationDivision" value="w" />
		<input type="hidden" id="declarationReceiver" name="declarationReceiver" value="${auctionSelectOne.get(0).auctionWriter }" />
		<input type="hidden" id="boardName" name="boardName" value="a" />
		<input type="hidden" id="boardNo" name="boardNo" value="${auctionSelectOne.get(0).auctionNo }" />
		</form>	 
<!-- 신고 -->
	<hr />
	
	<div>
		<h3 style="padding:32px 0;">${auctionSelectOne.get(0).auctionTitle}</h3>
		<p>거래 가능 지역 : ${auctionSelectOne.get(0).auctionAddress }</p>
		<p>${auctionSelectOne.get(0).auctionContent}</p>
		<jsp:include page="/WEB-INF/views/comment/auctionComment.jsp"></jsp:include>
	</div>
	
	<hr />
	
	<div>
		<h3 style="padding: 32px 0">경매</h3>
		<input type="hidden" name="auctionNoFromView" value="${auctionSelectOne.get(0).auctionNo}" />
			<div>
				<c:if test="${auctionSelectOne.get(0).auctionIngPrice == 0 }">
					<span>
						현재가격 : <span style="color:#ff8a3d; font-size:18px;"><fmt:formatNumber value="${auctionSelectOne.get(0).auctionPrice }" pattern="#,###"/>원</span>
						(마지막 입찰자 : <c:if test="${auctionSelectOne.get(0).auctionBuyer eq null}">없음</c:if>
										<c:if test="${auctionSelectOne.get(0).auctionBuyer ne null}">${auctionSelectOne.get(0).auctionBuyer}</c:if>)
					</span>&nbsp;/&nbsp;
				</c:if>
				
				<c:if test="${auctionSelectOne.get(0).auctionIngPrice != 0 }">
					<span>
						현재가격 : <span style="color:#ff8a3d; font-size:18px;"><fmt:formatNumber value="${auctionSelectOne.get(0).auctionIngPrice}" pattern="#,###"/>원</span>
						(마지막 입찰자 : <c:if test="${auctionSelectOne.get(0).auctionBuyer eq null}">없음</c:if>
										<c:if test="${auctionSelectOne.get(0).auctionBuyer ne null}">${auctionSelectOne.get(0).auctionBuyer}</c:if>)
					</span>&nbsp;/&nbsp;
				</c:if>
				
				<span style="font-size:13px">
					시작가격 : <fmt:formatNumber value="${auctionSelectOne.get(0).auctionPrice }" pattern="#,###"/>원
				</span>&nbsp; -> &nbsp;
				
				<span>
					즉시구매가격 : <span style="color:red; font-size:24px;"><fmt:formatNumber value="${auctionSelectOne.get(0).auctionDirectPrice }" pattern="#,###"/>원</span>
				</span>&nbsp;
				
				<span><button type="button" class="btn btn-danger" id="kakao2" onclick="kakao2();">즉시구매가로 구매하기</button></span>
			</div>
			<br />
			
			<p>입찰 가격 단위 : <fmt:formatNumber value="${auctionSelectOne.get(0).auctionUnitPrice }" pattern="#,###" />원 </p>
			<br />
			
			<p>
				경매 시작 날짜 : <fmt:formatDate value="${auctionSelectOne.get(0).auctionDate }" pattern="yyyy-MM-dd"/> 
				&nbsp;/&nbsp;
				경매 종료 날짜 : <fmt:formatDate value="${auctionSelectOne.get(0).auctionEndDate }" pattern="yyyy-MM-dd"/>
				&nbsp;&nbsp;
				<span id="finishNotice" >경매 종료</span>
				<span id="mainTimer" style="color:red; font-size: 12px;">남은시간 : <span id="timer" style="color:red; font-size: 12px;"></span></span>
			</p>
			
			<p id="finishAuction">
				원하는 입찰 가격 : <input type="number" name="auctionIngPriceFromView" id="ingPrice" style="border:1px solid;"/>&nbsp;원
				&nbsp;
				<span>
					<c:if test="${auctionSelectOne.get(0).auctionIngPrice == 0 }">
					<span>(최소 시작 금액 : <span style="color:#ff8a3d; font-size:18px;"><fmt:formatNumber value="${auctionSelectOne.get(0).auctionPrice + auctionSelectOne.get(0).auctionUnitPrice}" pattern="#,###"/>원</span>)</span> 
					&nbsp;
					</c:if>
					<c:if test="${auctionSelectOne.get(0).auctionIngPrice != 0 }">
					<span>
						(최소 시작 금액 : <span style="color:#ff8a3d; font-size:18px;">
											<c:if test="${auctionSelectOne.get(0).auctionIngPrice eq auctionSelectOne.get(0).auctionDirectPrice}">
												<fmt:formatNumber value="${auctionSelectOne.get(0).auctionIngPrice}" pattern="#,###"/>원
											</c:if>
											<c:if test="${auctionSelectOne.get(0).auctionIngPrice ne auctionSelectOne.get(0).auctionDirectPrice}">
												<fmt:formatNumber value="${auctionSelectOne.get(0).auctionIngPrice + auctionSelectOne.get(0).auctionUnitPrice}" pattern="#,###"/>원
											</c:if>
										</span>)
					</span> 
					&nbsp;
					</c:if> 
				</span>
				<button type="button" class="btn btn-warning" id="auctionPrice" onclick="tender();">입찰하기</button>
			</p>
				<button type="button" class="btn btn-warning" id="trade" onclick="trade();" style="display:none;">거래하기</button>
		 
	</div>
		<!-- 시간 관련 코드 -->    
	  <!-- <p style="color:red; font-size: 12px;">남은시간 : <span id="timer" style="color:red; font-size: 12px;"></span></p> -->
	  
  <script>
  $(document).ready(function(){
       tid=setInterval('msg_time()',1000); // 타이머 1초간격으로 수행
     });
  var stDate = new Date().getTime();
  var edDate = new Date('${auctionSelectOne.get(0).auctionEndDate }').getTime(); // 종료날짜
  var RemainDate = edDate - stDate;
  
  function msg_time() {
    var day = Math.floor((RemainDate % (1000 * 60 * 60 * 24 * 60)) / (1000*60*60*24));
    var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
    var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
    var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
    m = day + "일 " + hours + "시 " +  miniutes + "분 " + seconds +"초"; // 남은 시간 text형태로 변경
    document.all.timer.innerHTML = m;   // div 영역에 보여줌
    if (RemainDate < 0) {
      // 시간이 종료 되었으면..
      clearInterval(tid);   // 타이머 해제
      //여기서 타이머종료되면 작업한다
      $("#mainTimer").attr("style","display:none");
      $("#finishAuction").attr("style","display:none");
      $("#kakao2").attr("style","display:none");
      $("#finishNotice").prop("style","display:inline-block");
      
      
      if(${memberLoggedIn.memberId == auctionSelectOne.get(0).auctionBuyer}){
    	  $("#trade").prop("style","display:inline-block");	  
    	  $("#finishNotice").prop("style","none");
      }
      
    }else if(RemainDate > 0 && ${auctionSelectOne.get(0).auctionIngPrice == auctionSelectOne.get(0).auctionDirectPrice}){
    	
    }
    
    else{
      RemainDate = RemainDate - 1000; // 남은시간 -1초
    }
  }
  </script>
  <!--  -->
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
 
<!--// mode : development or production-->
 
</script>

<script>
function tender(){
	var ingPrice = $("#ingPrice").val();
	var auctionNo = ${auctionSelectOne.get(0).auctionNo};
	
	if(${memberLoggedIn.memberId == auctionSelectOne.get(0).auctionWriter}){
		alert("본인은 경매에 참여할 수 없습니다.");
		
	}
	else if(${memberLoggedIn.memberId == auctionSelectOne.get(0).auctionBuyer}){
		alert("연속으로 경매에 참여할 수 없습니다.");
	}
	
	else if(ingPrice <= 0 || ingPrice < ${auctionSelectOne.get(0).auctionPrice + auctionSelectOne.get(0).auctionUnitPrice} || 
			ingPrice < ${auctionSelectOne.get(0).auctionIngPrice + auctionSelectOne.get(0).auctionUnitPrice} ||
			ingPrice > ${auctionSelectOne.get(0).auctionDirectPrice}){
		alert("금액을 확인해 주세요.");
	}
		
	else{
	location.href='${pageContext.request.contextPath }/auction/ingPrice.do?auctionNo=${auctionSelectOne.get(0).auctionNo}&auctionIngPrice='+ingPrice+'&auctionBuyer=${memberLoggedIn.memberId}';
	
	}
};


function kakao1(){
		
var ingPrice = $("#ingPrice").val();
var auctionNo = ${auctionSelectOne.get(0).auctionNo};	

location.href='${pageContext.request.contextPath }/auction/ingPrice.do?auctionNo=${auctionSelectOne.get(0).auctionNo}&auctionIngPrice='+ingPrice+'&auctionBuyer=${memberLoggedIn.memberId}';
		
		var IMP = window.IMP; // 생략가능
	   IMP.init('imp45289348');  // 가맹점 식별 코드
	
	   IMP.request_pay({
	      pg : 'kakao', // 결제방식
	       pay_method : 'card',	// 결제 수단
	       merchant_uid : 'merchant_' + new Date().getTime(),
	       name : '${auctionSelectOne.get(0).auctionTitle}',	// order 테이블에 들어갈 주문명 혹은 주문 번호
	       amount : ingPrice,
	       /* amount : '${auctionSelectOne.get(0).auctionIngPrice == 0 ? auctionSelectOne.get(0).auctionPrice : auctionSelectOne.get(0).auctionIngPrice}',	// 결제 금액 
	       buyer_email : '',	// 구매자 email
	      buyer_name :  '${auctionSelectOne.get(0).auctionWriter}',	// 구매자 이름
	       buyer_tel :  '',	// 구매자 전화번호
	       buyer_addr :  '',	// 구매자 주소
	       buyer_postcode :  '',	// 구매자 우편번호
	       /* m_redirect_url : '${pageContext.request.contextPath }/auction/ingPrice.do' */	// 결제 완료 후 보낼 컨트롤러의 메소드명
	   }, function(rsp) {
		if ( rsp.success ) { // 성공시
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			location.href='${pageContext.request.contextPath }/auction/ingPrice.do?auctionNo='+auctionNo+'&auctionIngPrice='+ingPrice+'&auctionBuyer=${memberLoggedIn.memberId}';
		} else { // 실패시
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
	});
	   
   
}
function kakao2(){
	
		var IMP = window.IMP; // 생략가능
	   IMP.init('imp45289348');  // 가맹점 식별 코드
	
	   IMP.request_pay({
	      pg : 'kakao', // 결제방식
	       pay_method : 'card',	// 결제 수단
	       merchant_uid : 'merchant_' + new Date().getTime(),
	      name : '${auctionSelectOne.get(0).auctionTitle}',	// order 테이블에 들어갈 주문명 혹은 주문 번호
	       amount : '${auctionSelectOne.get(0).auctionDirectPrice}' ,	// 결제 금액
	       buyer_email : '${memberLoggedIn.memberEmail}',	// 구매자 email
	      buyer_name :  '${auctionSelectOne.get(0).auctionBuyer}',	// 구매자 이름
	       buyer_tel :  '${memberLoggedIn.memberPhone}',	// 구매자 전화번호
	       buyer_addr :  '${memberLoggedIn.memberAddress}',	// 구매자 주소
	       buyer_postcode :  '',	// 구매자 우편번호
	       m_redirect_url : '/khx/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명
	   }, function(rsp) {
		if ( rsp.success ) { // 성공시
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			
			location.href='${pageContext.request.contextPath }/auction/directPrice.do?auctionNo=${auctionSelectOne.get(0).auctionNo}&auctionDirectPrice=${auctionSelectOne.get(0).auctionDirectPrice}&auctionBuyer=${memberLoggedIn.memberId}';
		} else { // 실패시
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
	});
   
}

</script>
<script>
// 신고기능관련 script
$("#declarationProcess").click(()=>{
	location.href="${pageContext.request.contextPath}/declaration/declarationProcess?memberId=${auctionSelectOne.get(0).auctionWriter}&decNo=${decNo}";
});
$("#acutionDeclaration").click(()=>{
	$("#frmPop").submit();
});

$(function(){
	$(document).mouseup(function(e) {
		if ($(e.target).parents('.zeta-menu').length == 0) {
			$('.zeta-menu li').removeClass('expand');
			$('.zeta-menu ul').hide();
		}
	});
	$(".zeta-menu>li:has(ul)>a").each( function() {
		$(this).html( $(this).html());
	});
	$(".zeta-menu ul li:has(ul)")
		.find("a:first")
		.append("<p style='float:right;margin:-3px'>&#9656;</p>");

	$(".zeta-menu li>a").click(function(){
		var li = $(this).parent();
		var ul = li.parent()
		ul.find('li').removeClass('expand');
		ul.find('ul').not(li.find('ul')).hide();
		li.children('ul').toggle();
		if( li.children('ul').is(':visible') || li.has('ul')) {
			li.addClass('expand');
		}
	});
});
</script> 







<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>