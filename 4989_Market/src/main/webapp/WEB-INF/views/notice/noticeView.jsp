<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<br />
<br />
<br />
<h2>공지사항 view</h2>

${notice}

<input type="hidden" name="noticeNo" value="" />
<input type="button" value="수정" onclick="${pageContext.request.contextPath}/notice/noticeUpdate"/>
<input type="button" value="삭제" />
<%-- ?noticeNo=${notice.getNoticeNo} --%>















<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

