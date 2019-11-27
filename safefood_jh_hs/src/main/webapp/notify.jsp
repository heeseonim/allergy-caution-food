<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안전 먹거리</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link type="text/css" href="css/css.css" rel="stylesheet" />

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="detail">
	
		<div id="result" class="container">

			<h2 class="high_light middle"><b>게시판</b></h2>
			<hr>
			<c:import url="./static/notify.html"></c:import>
			<hr>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
<script>

$("#commit").on("click", ()=>{
	location.href='./foodsearch.html?cat='+search+'&word='+$("#word").val();
})

$("#word").on("keydown", (key)=>{
	if(key.keyCode == 13){
		$("#commit").trigger("click");
	}
}) 
</script>
</html>