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

<script src="search.js"></script>

<link type="text/css" href="css/css.css" rel="stylesheet" />

<style>
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="detail">
		<div id="result" class="container">
			<h2 class="high_light middle"><b>회원 리스트</b></h2>
			<hr>
			<form id="my_form" action="#">
				<table class="table">
					<tr>
						<td><span class="high_light">id</span></td>
						<td><span class="high_light">name</span></td>
						<td><span class="high_light">phone</span></td>
						<td><span class="high_light">e-mail</span></td>
					</tr>
					
					<c:forEach var="member" items="${memberlist}" >
						<tr>
							<td><a class="none_deco" href="#">${member.id }</a></td>
							<td><a class="none_deco" href="#">${member.name }</a></td>
							<td><a class="none_deco" href="#">${member.phone }</a></td>
							<td><a class="none_deco" href="#">${member.email }</a></td>
						</tr>
					</c:forEach>
				</table>
			</form>
			<hr>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>