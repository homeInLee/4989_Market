<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product/productRegistrationStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/imageSlider/sliderStyle.css">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>
<title>물품 등록하기</title>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="물품 등록하기" name="pageTitle"/>
</jsp:include>
<style>


/* /*Header*/
h1, h2{text-shadow:none; text-align:center;}
h1{ color: #666; text-transform:uppercase;  font-size:36px;}
h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 
 */
 
#preview{

	margin: 0 auto;
}

.preimg{
	
	border: 1px solid;
	width: 100px;
	height: 100px;
	float: left;
}


</style>
	<section id="cotentArea">
	<!-- 컨텐츠 영역 시작-->
	
	
	<!-- 이미지 슬라이더 -->
	
	<div id="wrapper" class="col-sm-9">
		<div id="slider-wrap">
			<ul id="slider">
				<li data-color="#1abc9c">		                             
					<img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" class="images0">
				</li>		
				             
				<li data-color="#3498db">
					<img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" class="images1">
				</li>	
					             
				<li data-color="#9b59b6">
					<img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" class="images2">
				</li>         
			</ul>
	          
			<!--controls-->
			<div class="btns" id="next">
				<i class="fa fa-arrow-right">&gt;</i>
			</div>
			
			<div class="btns" id="previous">
				<i class="fa fa-arrow-left">&lt;</i>
			</div>
			
			<div id="counter"></div>		          
			<div id="pagination-wrap">
				<ul>
				
				</ul>
			</div>
			<!--controls-->  
	                 
		</div> 
	</div>
	
		<h3>미리보기</h3>
		<div id="preview">
			<ul>
				<li><img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" alt="" class="preimg images0" /></li>
				<li><img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" alt="" class="preimg images1" /></li>
				<li><img src="${pageContext.request.contextPath }/resources/images/product/noimage.png" alt="" class="preimg images2" /></li>
			</ul>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
	<!-- 정보 입력 폼 -->
	<div id="Registration">
	
		<form name="productFrm" action="${pageContext.request.contextPath }/product/productRegistrationEnd.do"  
			  method="post" 
			  enctype="multipart/form-data">
		
	        
	        <div class="input-group mb-3" style="padding:0px;">
			  <div class="input-group-prepend" style="padding:0px;">
			    <span class="input-group-text">첨부파일</span>		    
			  </div>
			  <div class="custom-file">
			    <input type="file" multiple="multiple" class="custom-file-input imageUpload" 
			    	   name="upFile" id="upFile1" >
			    <label class="custom-file-label" for="upFile1">파일을 선택하세요(사진은 최대 3장까지 업로드됩니다.)</label>
			  </div>
			</div>
	
	    <br />
	    <br />
	    <br />
	
		<table id="tbl-Registration">
						<tr style="padding-bottom: 1px;">
							
							<th>작성자 정보</th>
							
							<td>
								<div id="userinfo">
								<input type="text"  id="writer" disabled="disabled" value="${memberLoggedIn.memberId}" class="form-control"/>
								<input type="hidden" name="productWriter" value="${memberLoggedIn.memberId}"/>
								<input type="text"  id="phone" disabled="disabled" value="${memberLoggedIn.memberPhone }" class="form-control"/>
								<input type="text"  id="email" disabled="disabled" value="${memberLoggedIn.memberEmail }"  class="form-control"/>
								<input type="text"  id="sell-address" disabled="disabled" value="${memberLoggedIn.memberAddress }" class="form-control"  />
								<input type="hidden" name="address" value="${memberLoggedIn.memberAddress}"/>
<!-- 								<button type="button" onclick="editable();">변경</button>
 -->								</div>
							</td>
						
						
						</tr>
						<tr>
							<th>제목</th>
							<td>		
								<input type="text" id="title" name="productTitle" class="form-control" required="required"/>
							</td>			
						</tr>		
					
					
						<tr>
							<th>가격</th>
							<td>
							<input type="checkbox" onclick="freeProductClick();" id="freeProductCHK"/>		
							<input type="number" id="price" name="productPrice" class="form-control" placeholder="0,000,000원" required="required" />
							</td>			
						</tr>
						
						<tr>
			                <th>거래 지역</th>
			                <td class="auction-container">
			                    <select name="sido" id="sido" class="form-control"></select>
			                    <select name="gugun" id="gugun" class="form-control"></select>            
			                </td>
			            </tr>
			            
			            <tr>
			                <th>상품분류</th>
			                <td class="left">
			                    <select name="cate" id="cate" class="form-control"></select>
			                    <select name="gory" id="gory" class="form-control"></select>
			                </td>
			            </tr>
						
						<tr>
							<th>내용</th>
							<td>		
							<textarea rows="30" cols="113" id="content" name="content" class="form-control" required="required"></textarea>
							</td>			
						</tr>
	
			</table>
				<br />
	
				<p align="right" id="btnP">
				<button type="submit" onclick="return checkYN();" class="btn btn-primary" >등록하기</button>
				</p>
			</form>
			
	</div>
</section>

<script>
function checkYN() {
	var check=confirm('정말 등록 하시겠습니까?');
	
	return check;
}
</script>




<!-- 이미지 슬라이더 스크립트 -->
<script src="${pageContext.request.contextPath }/resources/js/imageSlider.js"></script>



<script>
function freeProductClick() {
	
	var isChecked = $("#freeProductCHK").is(":checked");
	console.log($("#freeProductCHK").val());
	confirm("무료나눔으로 등록 하시겠습니까?");
	
}


var sel_files = [];


$(document).ready(function() {
    $("#upFile1").on("change", handleImgFileSelect);
}); 

function fileUploadAction() {
    console.log("fileUploadAction");
    $("#upFile1").trigger('click');
}


function handleImgFileSelect() {
	alert("handleImgFileSelect 실행");
}


function handleImgFileSelect(e) {

    // 이미지 정보들을 초기화
/*             sel_files = [];
    $(".imgs_wrap").empty(); */

    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var index = 0;
    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {
            var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
            $('.images'+index).attr('src', e.target.result);
            $('.images'+index).attr('href', 'javascript:void(0);');
            $('.images'+index).attr('onclick', 'deleteImageAction('+index+')');
            $('.images'+index).attr('id', "img_id_"+index);
            $('.images'+index).attr('title', '클릭 시 삭제됩니다.');
            /* <img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'> */
			/* $('.images'+imgIndex).attr('src', e.target.result); */
            $(".imgs_wrap").append(html);
            index++;

        }
        reader.readAsDataURL(f);
        
    });
}

function deleteImageAction(index) {
    console.log("index : "+index);
    console.log("sel length : "+sel_files.length);

    sel_files.splice(index, 1);

    var img_id = ".images"+index;
    $(img_id).attr('src', '${pageContext.request.contextPath }/resources/images/product/noimage.png') 
}

$(function(){	
	$('document').ready(function() {
		var area0 = ["대분류 선택","의류","뷰티/잡화","식품/마트/유아","가구/생활/건강/렌탈","디지털/가전/컴퓨터","스포츠/레저/자동차","도서/티켓/여행/e쿠폰","기타"];
		 
		var area1 = ["여성의류","남성의류","언더웨어"];
				  
		var area2 = ["화장품/향수","바디/헤어","신발","가방/패션잡화","쥬얼리/시계/선글라스"];
				  
		var area3 = ["쌀/과일/농수축산물","건강식품/다이어트","커피/음료","즉석/간식/가공식품","화장지/물티슈/생리대","세제/구강","기저귀/분유/유아식","출산/유아용품/임부복","장난감/교육완구/인형","유아동의류","유아동신발/가방/잡화"];
				  
		var area4 = ["가구/DIY","조명/인테리어","생활/욕실/수납용품","주방용품","침구/커튼","건강/의료용품","반려동물용품","악기/취미/키덜트","디자인/문구/사무용품","꽃/이벤트용품","렌탈서비스"];
				  
		var area5 = ["영상가전","계절가전","주방가전","생활/미용가전","카메라","음향기기","게임","모바일/태블릿","노트불/PC","모니터/프린터","PC주변기기","저장장치"];
				  
		var area6 = ["휘트니스/수영","스포츠의류/운동화","골프클럼/의류/용품","등산/아웃도어","캠핑/낚시","구기/라켓","자전거/보드","자동차용품/블랙박스","타이어/오일/부품","공구/안전/산업용품"];
				  
		var area7 = ["유아/아동","교육/참고서","문학/인문/음반","콘서트/클래식","뮤지컬/연극","행사/전시","항공권","해외여행/호텔","국내여행/숙박","커피/디저트/간식","영화/모바일상품권","백화점/제화상품권"];
		
		var area8 = [""]
		// 시/도 선택 박스 초기화
		$("select[name^=cate]").each(function() {
		 $selcate = $(this);
		 $.each(eval(area0), function() {
		  $selcate.append("<option value='"+this+"'>"+this+"</option>");
		  
		 });
		 $selcate.next().append("<option value=''>소분류 선택</option>");
		});
		// 시/도 선택시 구/군 설정
		$("select[name^=cate]").change(function() {
		 var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		 var $gory = $(this).next(); // 선택영역 군구 객체
		 $("option",$gory).remove(); // 구군 초기화
		 if(area == "area0")
		  $gory.append("<option value=''>소분류 선택</option>");
		 else {
		  $.each(eval(area), function() {
		   $gory.append("<option value='"+this+"'>"+this+"</option>");
		  });
		 }
		});
		});
	$('document').ready(function() {
		var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도","세종특별자치시"];
		 var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		  var area2 = ["계양구","남동구","동구","미추홀구","부평구","서구","연수구","중구","강화군","옹진군"];
		  var area3 = ["대덕구","동구","서구","유성구","중구"];
		  var area4 = ["광산구","남구","동구","북구","서구"];
		  var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
		  var area6 = ["남구","동구","북구","중구","울주군"];
		  var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
		  var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","여주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","연천군"];
		  var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
		  var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군"];
		  var area11 = ["계룡시","공주시","논산시","당진시","보령시","서산시","아산시","천안시","금산군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
		  var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
		  var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
		  var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
		  var area15 = ["거제시","김해시","밀양시","사천시","양산시","진주시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
		  var area16 = ["서귀포시","제주시"];
		// 시/도 선택 박스 초기화
		$("select[name^=sido]").each(function() {
		 $selsido = $(this);
		 $.each(eval(area0), function() {
		  $selsido.append("<option value='"+this+"'>"+this+"</option>");
		  
		 });
		 $selsido.next().append("<option value=''>구/군 선택</option>");
		});
		// 시/도 선택시 구/군 설정
		$("select[name^=sido]").change(function() {
		 var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		 var $gugun = $(this).next(); // 선택영역 군구 객체
		 $("option",$gugun).remove(); // 구군 초기화
		 if(area == "area0")
		  $gugun.append("<option value=''>시/군/구 선택</option>");
		 else {
		  $.each(eval(area), function() {
		   $gugun.append("<option value='"+this+"'>"+this+"</option>");
		  });
		 }
		});
		});
});
</script>





<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>

