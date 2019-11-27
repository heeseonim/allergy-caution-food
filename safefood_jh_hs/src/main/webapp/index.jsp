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
						Natural Product <span class="text-muted">Milk</span>
					</h2>
					<p class="lead">From the very moment you drink Milk, to not only make you full physically but also make you feel warm and happy, Milk creates a new lifestyle.</p>
				</div>
				<div class="col-md-5">
					<img class="featurette-image img-responsive center-block" alt="500x500" src="./img/우유.jpg" data-holder-rendered="true">
				</div>
			</div>
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7 col-md-push-5">
					<h2 class="featurette-heading">
						Daily Refreshing <span class="text-muted">Ice Cream</span>
					</h2>
					<p class="lead">To make people happy in their daily lives through small desserts, and to make our lives sweeter, Ice Cream is a dessert brand that offers refreshment for our daily lives.</p>
				</div>
				<div class="col-md-5 col-md-pull-7">
					<img class="featurette-image img-responsive center-block" alt="500x500" src="./img/아이스크림.jpg" data-holder-rendered="true">
				</div>
			</div>
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						Korean spicy taste <span class="text-muted">Ramen</span>
					</h2>
					<p class="lead">An increasing number of people feel the happiness from serving well-prepared, delicious meal even if it’s just a quick meal.
					Ramen was born for these people.</p>
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