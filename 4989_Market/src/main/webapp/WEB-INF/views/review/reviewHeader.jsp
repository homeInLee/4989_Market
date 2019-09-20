<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.menu{
	text-align: center;
}
</style>  
  <div class="menu" style="margin-top: 30px;">
  	<a class="badge badge-light" href="${pageContext.request.contextPath }/member/memberView.do?memberId=${memberLoggedIn.memberId}"><h2>회원정보</h2></a>
  	<a class="badge badge-light" href="${pageContext.request.contextPath}/message/messageList.do?memberId=${memberLoggedIn.memberId}"><h2>쪽지함</h2></a>
  	<a class="badge badge-light" href="${pageContext.request.contextPath }/review/reviewMain.do?memberId=${memberLoggedIn.memberId}"><h2>나의거래</h2></a>
  	<a class="badge badge-light"><h2>나의경매</h2></a>
  </div>
  