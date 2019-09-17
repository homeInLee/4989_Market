<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<title>물품 등록하기</title>
<style>
input{
	background: rgb(179, 179, 255);
}
textarea{
	background: rgb(179, 179, 255);


}
label{
	font-size: 20px;

}
input{
	font-size: 20px;
	

}
form{
	border: 1px solid;
}

#Registration{
	padding-left: 25px;
	border: 1px solid;
}

label{
	padding-right: 50px;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp" >
	<jsp:param value="물품 등록하기" name="pageTitle"/>
</jsp:include>

<!-- 컨텐츠 영역 시작-->

<form action="${pageContext.request.contextPath }/productRegistrationEnd.do" enctype="multipart/form-data">
	<div id="Registration">

		<label for="productType">분류</label>
		<select id="productType">
			<option value="">--분류 선택--</option>
			<option value="house">집</option>
			<option value="clothes">의류</option>
			<option value="food">식품</option>
			<option value="bicycle">자전거</option>
		</select>
		<br />
		
		<label for="writer">작성자 정보</label>
		<input type="text"  id="writer" disabled="disabled" value="admin" name="productWriter"/>
		<input type="text"  id="phone" disabled="disabled" value="01015412215" />
		<input type="text"  id="phone" disabled="disabled" value="" placeholder="이메일 없음"/>
		<br />
		<label for="title">제목</label>		
		<input type="text" id="title" name="productTitle"/>
		<br />
		<label for="price">가격</label>		
		<input type="number" id="price" name="productPrice"/>원
		<br />
		<label for="attachPhoto">사진첨부</label>
		<input type="file"  id="attachPhoto" name="attachPhoto"/>
		<br />
		<br />
		<label for="content">내용</label>
		<textarea rows="30" cols="113" id="content" name="content"></textarea>
		
	</div>

	<button type="submit">전송</button>
</form>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />


<!-- 컨텐츠 영역 끝  -->
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>

