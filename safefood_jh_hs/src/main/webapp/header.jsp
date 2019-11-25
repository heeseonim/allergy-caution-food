<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<style>
.slider .indicators .indicator-item {
  background-color: #666666;
  border: 3px solid #ffffff;
  -webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  -moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
}
.slider .indicators .indicator-item.active {
  background-color: #ffffff;
}
.slider {
  width: 1920px;
  margin: 0 auto;
}
.slider .indicators {
  bottom: 60px;
  z-index: 100;
  /* text-align: left; */
}
</style>

<div id="login_form_white"></div>
<div class="slider">
    <ul class="slides">
      <li>
        <img src="./img/food1.jpg"> <!-- random image -->
        <div class="caption center-align">
          <h3>This is our big Tagline!</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        </div>
      </li>
      <li>
        <img src="./img/food2.jpg"> <!-- random image -->
        <div class="caption left-align">
          <h3>Left Aligned Caption</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        </div>
      </li>
      <li>
        <img src="./img/food3.jpg"> <!-- random image -->
        <div class="caption right-align">
          <h3>Right Aligned Caption</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        </div>
      </li>
      <li>
        <img src="./img/food4.jpg"> <!-- random image -->
        <div class="caption center-align">
          <h3>This is our big Tagline!</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        </div>
      </li>
    </ul>
  </div>
<div>  
	<div id="main" class="container" style="position:relative">
		<div class="row">
			<div id="status" class="col-md-12">
			<div>
					<c:choose>
						<c:when test="${not empty member}">
							<div class="top_button">
								<span class="glyphicon glyphicon-ok"></span> <a id="login"
									href="logout.do">로그아웃</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="top_button">
								<span class="glyphicon glyphicon-ok"></span>
								<a id="login" href="/signup.jsp">회원가입</a>
							</div>
							<div class="top_button">
								<span class="glyphicon glyphicon-ok"></span>
								<a id="login" href="/login.jsp">로그인</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<c:if test="${not empty member}">
					<div class="top_button">
						<span class="glyphicon glyphicon-user"></span><a href="memberinfo.jsp">회원정보</a>
					</div>
					<div class="top_button">
						<span class="glyphicon glyphicon-user"></span><a href="basketlist.jsp">장바구니</a>
					</div>
				</c:if>
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
								<li><a href="./qna.jsp">Q&A</a></li>
								<li class="divider"></li>
							</ul>
							
							<!-- SEARCH FORM all, name, maker, material-->
							
							<form class="navbar-form navbar-right" role="search" method="post" action="foodlist.do">
								<input id="stype" type="hidden" name="stype" value="all" />
								<div class="form-group">
									<input id="word" type="text" name="word" class="form-control"
										placeholder="검색 단어">
								</div>
								<button id="commit" type="submit" class="btn btn-default">찾기</button>
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
										<li class="c3"><a href="#">제조사</a></li>
										<li class="c4"><a href="#">재료</a></li>
									</ul>
							</ul>

						</div>
					</div>
				</nav>
			</div>
		</div>


		<!-- <div id="title">
			<div class="container">
				<div id="big_title" class="">
					<br>
					<h1 class="sharp_font">
						WHAT WE <b class="high_light">PROVIDE</b>
					</h1>
					<h2>건강한 삶을 위한 먹거리 프로젝트</h2>
				</div>
			</div>
		</div> -->
	</div>
</div>
<script src="search.js"></script>
<script>
$(document).ready(function(){
	  $('.slider').slider();
	});
</script>