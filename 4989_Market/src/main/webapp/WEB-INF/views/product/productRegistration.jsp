<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/product/productRegistrationStyle.css">
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

</style>
<!-- 컨텐츠 영역 시작-->
<div id="wrapper">
      <div id="slider-wrap">
          <ul id="slider">
             <li data-color="#1abc9c">
                             
<img src="${pageContext.request.contextPath }/resources/images/mac.jpg">
             </li>
             
             <li data-color="#3498db">
<img src="${pageContext.request.contextPath }/resources/images/mac.jpg">
             </li>
             
             <li data-color="#9b59b6">
<img src="${pageContext.request.contextPath }/resources/images/mac.jpg">
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
							<input type="text"  id="sell-address" disabled="disabled" value="${memberLoggedIn.memberAddress }" class="form-control"  />
							<button type="button" onclick="editable();">변경</button>
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
	
		</table>
			<br />

			<p align="right" id="btnP">
			<button type="submit" onclick="return checkYN();" class="btn btn-primary" >등록하기</button>
			</p>
		</form>
		
	</div>








<script>



function checkYN() {
	var check=confirm('정말 등록 하시겠습니까?');
	
	return check;
}

</script>
<script>

	function editable() {
		window.open("${pageContext.request.contextPath}/product/editAddress.do","주소 변경하기", "width=400, height=300,left=100,top=50")
		/* $("#sell-address").removeAttr('disabled'); */
		window.location.reload('#sell-address');
	}


	



$(()=>{
	//부트스트랩bug : input:file변경시 파일명보이기
	$("[name=upFile]").on("change", function(){
		if($(this).prop('files')[0] === undefined){
			$(this).next(".custom-file-label").html('파일을 선택하세요');			
		}
		
		var fileName = $(this).prop('files')[0].name;
		$(this).next(".custom-file-label").html(fileName);
	});
	
});
</script>






<!-- 컨텐츠 영역 끝  -->
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>

