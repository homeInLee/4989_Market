<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/review.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>
ul.pageUl {
    text-align:center;
    top: 2px;
}
ul li.pageLi {
    display:inline;
    vertical-align:middle;
}
ul li a.pageA {
    display:-moz-inline-stack;
    display:inline-block;
    vertical-align:top;
    padding:4px;
    margin-left: 3px;
    width:30px !important;
    color:#000;
    font:bold 14px tahoma;
    border:1px solid #eee;
    text-decoration:none;
    margin-top: 17px;
}
ul li a.pageB{
    display:-moz-inline-stack;
    display:inline-block;
    vertical-align:top;
    padding:4px;
    margin-left: 3px;
    width:50px !important;
    color:#000;
    font:bold 14px tahoma;
    border:1px solid #eee;
    text-decoration:none;
    margin-top: 17px;
}
ul li a.now {
    color:#fff;
    background-color:#1b5ac2;
    border:1px solid #1b5ac2;
}
ul li a:hover, ul li a:focus {
    color:#fff;
    border:1px solid #1b5ac2;
    background-color:#1b5ac2;
}
</style>
<div class="submenu">
  	<a id="review-btn" href="${pageContext.request.contextPath}/review/reviewMemberContent.do?memberId=${memberId}">거래 후기</a>
  	<a id="review-btn" href="${pageContext.request.contextPath}/review/reviewMemberManner.do?memberId=${memberId}">매너 칭찬</a>
  	
</div>
  <c:if test="${empty reviewList}">
  	<div style="text-align: center;">거래후기가 없습니다.</div>
  </c:if>
  
  <c:forEach items="${reviewList}" var="r">
 	<ul class="list-group list-group-flush">
  	  <li class="list-group-item">
  	  ${r.reviewWriter}
  	  <br />
  	  ${r.reviewContent}
  	  </li>
  	  
    </ul> 
  </c:forEach>
  
<div>
    <ul class="pageUl">
        <c:if test="${paging.prev}">
            <li class="pageLi"><a class="pageB" href="#" onClick="fn_prev('${paging.page}', '${paging.range}', '${paging.rangeSize}')">&lt;이전</a></li>
        </c:if>
            
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
            <li class="pageLi" "<c:out value="${paging.page == idx ? 'active' : ''}"/>"><a class="pageA" href="#" onClick="fn_pagination('${idx}', '${paging.range}', '${paging.rangeSize}')"> ${idx} </a></li>
        </c:forEach>
            
        <c:if test="${paging.next}">
            <li class="pageLi" ><a class="pageB" href="#" onClick="fn_next('${paging.range}', '${paging.range}', '${paging.rangeSize}')" >다음&gt;</a></li>
        </c:if>
    </ul>
</div>
<script>
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
    var page = ((range - 2) * rangeSize) + 1;
    var range = range - 1;
    
    var url = "${pageContext.request.contextPath}/review/reviewMemberContent.do?memberId=${memberId}";
    url = url + "&page=" + page;
    url = url + "&range=" + range;
    
    location.href = url;
}
//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
    var url = "${pageContext.request.contextPath}/review/reviewMemberContent.do?memberId=${memberId}";
    url = url + "&page=" + page;
    url = url + "&range=" + range;
    location.href = url;    
}
//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
    var page = parseInt((range * rangeSize)) + 1;
    var range = parseInt(range) + 1;
    
    var url = "${pageContext.request.contextPath}/review/reviewMemberContent.do?memberId=${memberId}";
    url = url + "&page=" + page;
    url = url + "&range=" + range;
    
    location.href = url;
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>