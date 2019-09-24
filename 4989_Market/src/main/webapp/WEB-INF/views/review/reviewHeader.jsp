<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<style>
.menu{
	text-align: center;
	margin: 40px 0;
}
#menubtn{
background-color: #ffff;
font-size:20px;
border: 2px solid #1b5ac2;
color: #1b5ac2;
line-height: 50px;
text-decoration: none;
padding: 10px;
border-radius: 10px; 
margin: 35px;
}
#menubtn:hover {
	background-color: #6A7BD9;
	border-color:#6A7BD9;
	color: white;
	
}
</style>  
  <div class="menu" >
  	<a id="menubtn" href="${pageContext.request.contextPath }/member/memberView.do?memberId=${memberLoggedIn.memberId}">회원정보</a>
  	<a id="menubtn" href="${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}">쪽지함</a>
  	<a id="menubtn" href="${pageContext.request.contextPath }/product/memberSellView.do?memberId=${memberLoggedIn.memberId}">나의거래</a>
  	<a id="menubtn">나의경매</a>
  </div>
  