<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작페이지</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css">
<%-- <fmt:requestEncoding value="utf-8"/> --%>
</head>
<body>
    <header id="header">
        <section id="header-top">
                <h1 id="logo">4989 Market
                    <a href="#">
                        <img src="">
                    </a>
                </h1>
                <div id="search-box">
                    <form>
                        <input id="search-text" type="text" placeholder="어떤 상품을 찾고 계세요?">
                        <button id= "search-btn"><img src="">검색</button>
                    </form>
                </div>
                <div id="header-btn">
                    <button id="login">로그인</button>
                    <button id="info">회원가입</button>
                </div>
        </section>
        <hr>
        <section id="header-bottom">
            <div id="header-catagory">
                    <ul id="dropdown">
                        <li><a href="#">지역</a>
                            <ul id="sub1">
                                <li><a href="">서울</a></li>
                            </ul>
                        </li>
                        <li><a href="#">상품</a></li>
                        <li><a href="#">무료나눔</a></li>
                        <li><a href="#">경매</a></li>
                        <li><a href="#">등록하기</a></li>
                        <li><a href="${pageContext.request.contextPath }/notice/noticeList.do">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath}/review/reviewMain.do">임시 마이페이지</a></li>
                    </ul>
            </div>
        </section>
    </header>
