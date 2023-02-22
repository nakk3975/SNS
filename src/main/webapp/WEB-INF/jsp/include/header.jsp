<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header class="col-3 text-center">
			<h1>Naromgram</h1>
			<hr>
			<nav class="main-menu p-2">
				<ul class="nav flex-column">
					<li class="nav-item"><a href="/post/main/view" class="nav-link font-weight-bold">메인</a></li>
					<li class="nav-item"><a href="#" class="nav-link font-weight-bold">검색</a></li>
					<li class="nav-item"><a href="#" class="nav-link font-weight-bold">내가 쓴 글</a></li>
					<li class="nav-item"><a href="/post/create/view" class="nav-link font-weight-bold">글쓰기</a></li>
				</ul>
			</nav>
			<div id="logoutText">
				<c:if test="${not empty userId}">
					${userLoginId}님 &nbsp;
					<a href="/user/signout"> 로그아웃</a>
				</c:if>
			</div>
		</header>