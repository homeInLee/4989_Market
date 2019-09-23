<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<title>물품 등록하기</title>
<style>
#btnP{
	padding-right: 10px;
}

table{
	border-spacing: 2px;
	border: solid 1px;
}
th{
	padding-right: 20px;
	width: 120px;
	background-color: #1b5ac2;
	color: white;
	text-align: center;
}

td{
	padding-bottom: 10px;
}

div#userinfo{
		width:200px; 

		text-align:left;
		position:relative; 
		padding:0px;

}


input{
	background: rgb(179, 179, 255);
}
textarea{
	background: rgb(179, 179, 255);


}

form{
	border: 1px solid;
}

#Registration{
	padding-left: 25px;

}

label{
	padding-right: 50px;
}
#content-area{
	border: 1px solid;
	font-size: 20px;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="물품 등록하기" name="pageTitle"/>
</jsp:include>

<!-- 컨텐츠 영역 시작-->

	<div id="Registration">
	<form name="productFrm" action="${pageContext.request.contextPath }/product/productRegistrationEnd.do"  method="get" >
		<table id="tbl-Registration">
					<tr style="padding-bottom: 1px;">
						
						<th>작성자 정보</th>
						
						<td>
							<div id="userinfo">
							<input type="text"  id="writer" disabled="disabled" value="admin" class="form-control"/>
							<input type="hidden" name="productWriter" value="admin"/>
							<input type="text"  id="phone" disabled="disabled" value="01015412215" class="form-control"/>
							<input type="text"  id="email" disabled="disabled" value="" placeholder="이메일 없음" class="form-control"/>
							</div>
						</td>
					
					
					</tr>
					<tr>
						<th>제목</th>
						<td>		
							<input type="text" id="title" name="productTitle" class="form-control"/>
						</td>			
					</tr>		
				
				
					<tr>
						<th>가격</th>
						<td>		
						<input type="number" id="price" name="productPrice" class="form-control" placeholder="0,000,000원"/>
						</td>			
					</tr>
					
					<tr>
						<th>내용</th>
						<td>		
						<textarea rows="30" cols="113" id="content" name="content" class="form-control"></textarea>
						</td>			
					</tr>
					<tr>
						<th></th>
						<td></td>			
					</tr>
		<!-- 		<label for="productType">분류</label>
				<select id="productType">
					<option value="">--분류 선택--</option>
					<option value="house">집</option>
					<option value="clothes">의류</option>
					<option value="food">식품</option>
					<option value="bicycle">자전거</option>
				<br />
				<label for="attachPhoto">사진첨부</label>
				<input type="file"  id="attachPhoto" name="attachPhoto"/>
				<br />
				</select> -->		
		</table>
			<br />

			<p align="right" id="btnP">
			<button type="submit" onclick="return checkYN();" class="btn btn-primary" >등록하기</button>
			</p>
		</form>
		
	</div>
		<!-- <label for="attachPhoto">사진첨부</label>
		<input type="file"  id="attachPhoto" name="attachPhoto"/>
		 -->


<!-- 			(이미지 등록)
			<form id="ajaxform" action="/upload" method="post" enctype="multipart/form-data">
			    <input type="file" multiple id="photo_upload">
			    <output id="list"></output>
			    <button id="files_send">완료</button>
			</form> -->
			
			
<!-- <form name="PhotoUploadFrm" id="PhotoUploadFrm" method="post" enctype="multipart/form-data">
    <input type="file" name="upfile" id="upfile">
</form>
 
 
<a href="javascript:upload();">등록</a> -->





<script>
function checkYN() {
	var check=confirm('정말 등록 하시겠습니까?');
	
	return check;
}

</script>


<!-- 컨텐츠 영역 끝  -->
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>

