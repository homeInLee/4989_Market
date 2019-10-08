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

 
</script>





<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>

