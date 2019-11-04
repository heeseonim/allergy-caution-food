<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="login_form_white"></div>

<div>
	<div id="back"></div>

	<div id="main" class="container">
		<div class="row">
			<div id="status" class="col-md-12">
				<div class="top_button">
					<span class="glyphicon glyphicon-list"></span> <a
						href="sitemap.html">사이트맵</a>
				</div>
				<div class="top_button">
					<span class="glyphicon glyphicon-user"></span><a
						href="searchmember.html">회원검색</a>
				</div>
				<div class="top_button">
					<span class="glyphicon glyphicon-user"></span><a href="memberinfo.jsp">회원정보</a>
				</div>
				<div>
					${loginId}
					<c:choose>
						<c:when test="${loginId != ''}">
							<div class="top_button">
								<span class="glyphicon glyphicon-ok"></span> <a id="login"
									href="login.jsp">로그아웃</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="top_button">
							<span class="glyphicon glyphicon-ok"></span>
							<a id="login" href="login.jsp">로그인</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>


			</div>
		</div>

		<div class="row">
			<div id="menu_nav" class="col-md-12">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<a id="brand" class="navbar-brand" href="./index.jsp"> <b>SSAFY</b>
							</a>
						</div>

						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a href="./notify.jsp">공지사항</a></li>
								<li><a href="foodlist.do">상품정보</a></li>
								<li class="divider"></li>
							</ul>
							<form class="navbar-form navbar-right" role="search">
								<div class="form-group">
									<input id="word" type="text" class="form-control"
										placeholder="검색 단어">
								</div>
								<button id="commit" type="button" class="btn btn-default">찾기</button>
							</form>
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown"><a id="cat" href="#"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-expanded="false">검색조건<span class="caret"></span></a>
									<ul id="drops" class="dropdown-menu" role="menu"
										aria-labelledby="dropdownMenu">
										<li class="c1"><a href="#">전체</a></li>
										<li class="divider"></li>
										<li class="c2"><a href="#">상품명</a></li>
										<li class="c4"><a href="#">원료</a></li>
										<li class="divider"></li>
										<li class="c5"><a href="#">영양성분</a></li>
									</ul>
							</ul>

						</div>
					</div>
				</nav>
			</div>
		</div>


		<div id="title">
			<div class="container">
				<div id="big_title" class="">
					<br>
					<h1 class="sharp_font">
						WHAT WE <b class="high_light">PROVIDE</b>
					</h1>
					<h2>건강한 삶을 위한 먹거리 프로젝트</h2>
				</div>
			</div>
		</div>
	</div>
</div>
