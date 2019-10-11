<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	//System.out.println("memberEnroll.jsp");
%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
	<jsp:param value="회원등록" name="pageTitle"/>
</jsp:include>
<style>
div#enroll-container{width:500px; margin:0 auto; text-align:center;}
div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
div#enroll-container table{margin: 0 auto;}
div#enroll-container table th{text-align: right; padding-right:10px;}
div#enroll-container table td{text-align: left;}
/*중복아이디체크관련*/
div#memberId-container{position:relative; padding:0px;}
div#memberId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
div#memberId-container span.ok{color:green;}
div#memberId-container span.error{color:red;}
</style>
<!-- 
	bootstrap form 태그 작성요령
	* input[type=text, password, tel, number], select -> .form-control
	* input[type=checkbox, radio] -> .form-check-input
	* label -> .form-check-label
	* radio, checkbox는 div.form-check.form-check-inline으로 감싸줄것.
 -->
 <br />
 <br />
 <br />
<div id="enroll-container">
	<form name="memberEnrollFrm" action="memberEnrollEnd.do" method="post" onsubmit="return validate();" >
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<div id="memberId-container">
						<input type="text" class="form-control" placeholder="4글자이상" name="memberId" id="memberId_" required>
						<span class="guide ok">이 아이디는 사용가능합니다.</span>
	           			<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
	           			<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" class="form-control" name="memberPassword" id="password_" required>
				</td>
			</tr>
			<tr>
				<th>패스워드확인</th>
				<td>	
					<input type="password" class="form-control" id="password2" required>
				</td>
			</tr>  
			<tr>
				<th>이름</th>
				<td>	
				<input type="text" class="form-control" name="memberName" id="memberName" required>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" class="form-control" placeholder="abc@xyz.com" name="memberEmail" id="memberEmail">
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>	
					<input type="tel" class="form-control" placeholder="(-없이)01012345678" name="memberPhone" id="memberPhone" maxlength="11" required>
				</td>
			</tr>
			<tr>
                <th>주소</th>
                <td class="left">
                    <select name="sido" id="sido"></select>
                    <select name="gugun" id="gugun"></select>            
					<input type="text" class="form-control" placeholder="상세주소" name="memberAddress" id="memberAddress">
                </td>
            </tr>
		</table>
		<input class="log" type="submit" value="가입" >
		<input class="log" type="reset" value="취소">
	</form>
</div>
<script>
$(function(){
	
	$("#password2").blur(function(){
		var p1=$("#password_").val(), p2=$("#password2").val();
		if(p1!=p2){
			alert("패스워드가 일치하지 않습니다.");
			$("#password_").focus();
		}
	});
	
	//아이디 중복체크 ajax
	$("#memberId_").on("keyup",(e)=>{
		var memberId = $(e.target).val().trim();
		if(memberId.length < 4){
			$(".guide").hide();
			$("#idDuplicateCheck").val(0);
			return;
		}
		$.ajax({
			url: "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
			data: {memberId: memberId},
			//dataType: "json",
			success: data =>{
				console.log(data);//json타입이 js object로 변환되어 전달됨.
				if(data.isUsable==true){
					$(".guide.error").hide();
					$(".guide.ok").show();
					$("#idDuplicateCheck").val(1);//중복체크 했음
				}
				else{
					$(".guide.error").show();
					$(".guide.ok").hide();
					$("#idDuplicateCheck").val(0);//중복체크 안했음
				}
			},
			error: (jqxhr, textStatus, errorThrown)=>{
				console.log("ajax처리실패!", jqxhr, textStatus, errorThrown);
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

function validate(){
	var memberId = $("#memberId_");
	if(memberId.val().trim().length<4){
		alert("아이디는 최소 4자리이상이어야 합니다.");
		memberId.focus();
		return false;
	}
	return true;
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>