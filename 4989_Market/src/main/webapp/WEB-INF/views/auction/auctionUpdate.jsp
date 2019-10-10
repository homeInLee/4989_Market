<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value= "경매물품 수정" name="pageTitle"/>
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
	<h2 style="padding: 30px 0;">경매물품 수정</h2>
</div>

<hr style="background-color:orange; height:5px;" width="70px;"/>
<br />

<br />


<div id="enroll-container">
	<form name="auctionUpdateFrm" action="auctionUpdateEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
		<table>
			<tr>
				<th>경매 물품명</th>
				<td>
					<div id="auction-container">
						<input type="text" class="form-control"  name="auctionTitle" id="auctionTitle_" value="${updateAuction.auctionTitle }" required>
	           			<input type="hidden" name="auctionNo" id="auctionNo" value="${updateAuction.auctionNo }"/>
					</div>
				</td>
			</tr>
			<tr>
					<div id="auction-container">
						<input type="hidden" class="form-control"  name="auctionAddress" id="auctionAddress" value="${updateAuction.auctionAddress}" required>
					</div>
			</tr>
			<tr>
				<th>경매시작 가격</th>
				<td>
					<input type="number" class="form-control" name="auctionPrice" id="auctionPrice" value="${updateAuction.auctionPrice}" required>
				</td>
			</tr>
			<tr>
				<th>경매금액 단위</th>
				<td>	
					<input type="number" class="form-control" name="auctionUnitPrice" id="auctionUnitPrice" min=100 step=100 value="${updateAuction.auctionUnitPrice}" required>
				</td>
			</tr>
			<tr>
				<th>즉시구매 가격</th>
				<td>	
					<input type="number" class="form-control" name="auctionDirectPrice" id="auctionDirectPrice" min=100 step=100 value="${updateAuction.auctionDirectPrice}" required>
				</td>
			</tr>  
			<tr>
					<input type="hidden" class="form-control" name="auctionCategory" value="${updateAuction.auctionCategory}" />
			</tr>
			<tr>
				<th>경매종료 날짜</th>
				<td>	
					<input type="date" class="form-control" placeholder="1900-00-00" name="auctionEndDate" id="auctionEndDate" value="${updateAuction.auctionEndDate}" required>
				</td>
			</tr>
			<tr>
				<th>상품 이미지</th>
				<td>
					<c:forEach items="${updateAttachment}" var="u" varStatus="vs">
					<div class="input-group mb-3" style="padding:0px;">
					  <div class="input-group-prepend" style="padding:0px;">
					    <span class="input-group-text">${vs.index == 0 ? "대표":""}이미지${vs.index == 0 ? "":vs.index}</span>
					  </div>
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" name="upFile" id="upFile${vs.count}" <c:if test="${vs.count == 1 }">required</c:if>  >
					    <label class="custom-file-label" for="upFile${vs.count}">
					    	${u.originalfileName }
				    	</label>
					  </div>
					</div>
					</c:forEach> 
					
					<c:if test="${attachmentIndex > 0 }">
					<c:forEach var="o" varStatus="ovs" begin="0" end="${attachmentIndex-1 }" >
					<div class="input-group mb-3" style="padding:0px;">
					  <div class="input-group-prepend" style="padding:0px;">
					    <span class="input-group-text">이미지${attachmentSize+ovs.index}</span>
					  </div>
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" name="upFile" id="upFile${attachmentSize+ovs.count}" >
					    <label class="custom-file-label" for="upFile${attachmentSize+ovs.count}">
					    		이미지를 선택하세요.
					    </label>
					  </div>
					</div>
					</c:forEach>
					</c:if>
				
				</td>
			</tr>
			<tr>
				<th>상품 설명</th>
				<td >	
					<textarea rows="10" style="width:120%; border: 1px solid;" name="auctionContent">${updateAuction.auctionContent}</textarea>
				</td>
			</tr>
		</table>
		<input class="log" type="submit" value="수정하기" >
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

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>