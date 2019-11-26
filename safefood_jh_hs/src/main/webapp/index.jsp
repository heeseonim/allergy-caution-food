<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SafeFood</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link type="text/css" href="css/css.css" rel="stylesheet" />

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="detail">
		<div id="result" class="container">

			<hr class="featurette-divider">
			<div class="row">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						First featurette heading. <span class="text-muted">It'll blow your mind.</span>
					</h2>
					<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
				</div>
				<div class="col-md-5">
					<img class="featurette-image img-responsive center-block" alt="500x500" src="./img/우유.jpg" data-holder-rendered="true">
				</div>
			</div>
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7 col-md-push-5">
					<h2 class="featurette-heading">
						Daily Refreshing <span class="text-muted">Dessert</span>
					</h2>
					<p class="lead">작은 디저트를 통해 누구나 일상에서 행복을 느낄 수 있도록, 우리들의 하루가 더 달콤해지는 디저트 입니다.</p>
				</div>
				<div class="col-md-5 col-md-pull-7">
					<img class="featurette-image img-responsive center-block" alt="500x500" src="./img/아이스크림.jpg" data-holder-rendered="true">
				</div>
			</div>
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						And lastly, this one. <span class="text-muted">Checkmate.</span>
					</h2>
					<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
				</div>
				<div class="col-md-5">
					<img class="featurette-image img-responsive center-block" alt="500x500" src="./img/food4.jpg" data-holder-rendered="true">
				</div>
			</div>
			<hr class="featurette-divider">
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>

<script>
$("#commit").on("click", ()=>{
	location.href='./resources/html/foodsearch.html?cat='+search+'&word='+$("#word").val();
})
</script>

</html>