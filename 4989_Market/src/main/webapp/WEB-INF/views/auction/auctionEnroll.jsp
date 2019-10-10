<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value= "경매물품 등록" name="pageTitle"/>
</jsp:include>

<style>
div#enroll-container{width:500px; margin:0 auto; text-align:center;}
div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
div#enroll-container table{margin: 0 auto;}
div#enroll-container table th{text-align: center; padding-right:15px; width: 125px;}
div#enroll-container table td{text-align: left;}
/*중복아이디체크관련*/
div#memberId-container{position:relative; padding:0px;}
div#memberId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
div#memberId-container span.ok{color:green;}
div#memberId-container span.error{color:red;}
</style>

<br />
<br />
<div style="text-align: center;">
	<h2 style="padding: 30px 0;">경매물품 등록</h2>
</div>

<hr style="background-color:orange; height:5px;" width="70px;"/>
<br />

<br />


<div id="enroll-container">
	<form name="auctionEnrollFrm" action="auctionEnrollEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
		<table>
			<tr>
				<th>경매 물품명</th>
				<td>
					<div id="auction-container">
						<input type="text" class="form-control"  name="auctionTitle" id="auctionTitle_" required>
	           			<input type="hidden" name="auctionWriter" id="auctionWriter" value="${memberLoggedIn.memberId }"/>
					</div>
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
				<th>경매시작 가격</th>
				<td>
					<input type="number" class="form-control" name="auctionPrice" id="auctionPrice" required>
				</td>
			</tr>
			<tr>
				<th>경매금액 단위</th>
				<td>	
					<input type="number" class="form-control" name="auctionUnitPrice" id="auctionUnitPrice" min=100 step=100 required>
				</td>
			</tr>
			<tr>
				<th>즉시구매 가격</th>
				<td>	
					<input type="number" class="form-control" name="auctionDirectPrice" id="auctionDirectPrice" min=100 step=100 required>
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
				<th>경매종료 날짜</th>
				<td>	
					<input type="date" class="form-control" placeholder="1900-00-00" name="auctionEndDate" id="auctionEndDate" required>
				</td>
			</tr>
			<tr>
				<th>상품 이미지</th>
				<td>
					<div class="input-group mb-3" style="padding:0px;">
					  <div class="input-group-prepend" style="padding:0px;">
					    <span class="input-group-text">대표 이미지</span>
					  </div>
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" name="upFile" id="upFile1" required>
					    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
					    <input type="hidden" name="attachmentMainImage" value="Y" />
					  </div>
					</div>
					
					<div class="input-group mb-3" style="padding:0px;">
					  <div class="input-group-prepend" style="padding:0px;">
					    <span class="input-group-text">이미지1</span>
					  </div>
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" name="upFile" id="upFile2" >
					    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
					  </div>
					</div>
					
					<div class="input-group mb-3" style="padding:0px;">
					  <div class="input-group-prepend" style="padding:0px;">
					    <span class="input-group-text">이미지2</span>
					  </div>
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" name="upFile" id="upFile3" >
					    <label class="custom-file-label" for="upFile3">파일을 선택하세요</label>
					  </div>
					</div>
					
					<div class="input-group mb-3" style="padding:0px;">
					  <div class="input-group-prepend" style="padding:0px;">
					    <span class="input-group-text">이미지3</span>
					  </div>
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" name="upFile" id="upFile4" >
					    <label class="custom-file-label" for="upFile4">파일을 선택하세요</label>
					  </div>
					</div>
					
					<div class="input-group mb-3" style="padding:0px;">
					  <div class="input-group-prepend" style="padding:0px;">
					    <span class="input-group-text">이미지4</span>
					  </div>
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" name="upFile" id="upFile5" >
					    <label class="custom-file-label" for="upFile5">파일을 선택하세요</label>
					  </div>
					</div>
				</td>
			</tr>
			<tr>
				<th>상품 설명</th>
				<td >	
					<textarea rows="10" style="width:120%; border: 1px solid;" name="auctionContent"></textarea>
				</td>
			</tr>
		</table>
		<br />
		<input class="log" type="submit" value="등록하기" >
	</form>
</div>

<script>
/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
function validate(){
	var content = $("[name=productContent]").val();
	if(content.trim().length==0){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}

$(()=>{
	//부트스트랩 버그 : input:file 변경시 파일명 보이기
	$("[name=upFile]").on("change", function(){
		if($(this).prop('files')[0] === undefined){
			$(this).next(".custom-file-label").html("파일을 선택하세요.");
		}
		
		var fileName = $(this).prop('files')[0].name;
		$(this).next(".custom-file-label").html(fileName);
	});
});

$(function(){	
	$('document').ready(function() {
		var area0 = ["대분류 선택","의류","뷰티/잡화","식품/마트/유아","가구/생활/건강/렌탈","디지털/가전/컴퓨터","스포츠/레저/자동차","도서/티켓/여행/e쿠폰","기타"];
		 
		var area1 = ["여성의류","남성의류","언더웨어"];
				  
		var area2 = ["화장품/향수","바디/헤어","신발","가방/패션잡화","쥬얼리/시계/선글라스"];
				  
		var area3 = ["쌀/과일/농수축산물","건강식품/다이어트","커피/음료","즉석/간식/가공식품","화장지/물티슈/생리대","세제/구강","기저귀/분유/유아식","출산/유아용품/임부복","장난감/교육완구/인형","유아동의류","유아동신발/가방/잡화"];
				  
		var area4 = ["가구/DIY","조명/인테리어","생활/욕실/수납용품","주방용품","침구/커튼","건강/의료용품","반려동물용품","악기/취미/키덜트","디자인/문구/사무용품","꽃/이벤트용품","렌탈서비스"];
				  
		var area5 = ["영상가전","계절가전","주방가전","생활/미용가전","카메라","음향기기","게임","모바일/태블릿","노트북/PC","모니터/프린터","PC주변기기","저장장치"];
				  
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>