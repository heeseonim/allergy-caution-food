<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="./css/bootstrap.min.css" rel="stylesheet">

    <script src="./js/ie-emulation-modes-warning.js"></script>

    <link href="./css/carousel.css" rel="stylesheet">
<div id="login_form_white"></div>
<div id="back">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="./img/food1.jpg;" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>We Bring Delicious Indulgences to the Table</h1>
              <p>We contribute to a tastier and healthier world with K-Food,
a cuisine that satisfies local tastes with a touch of Korean flavor</p>
             </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="./img/food3.jpg;" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>We lead the future of eco-friendly green biotechnology</h1>
              <p>We lead the future of GREEN BIO by possessing
the world’s very best technology and competitiveness</p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="./img/food5.jpg;" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>We help the world grow together with local communities</h1>
              <p>We now find ourselves on the doorstep of a global age of mutual prosperity
through sustainable management</p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
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


		<div id="title">
			<div class="container">
				<div id="big_title" class="">
					<br>
					<h1 class="sharp_font">
						 <b class="high_light"> </b>
					</h1>
					<h2> </h2>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="./js/holder.js"></script>
    <script src="./js/ie10-viewport-bug-workaround.js"></script>
    <script src="./js/search.js"></script>