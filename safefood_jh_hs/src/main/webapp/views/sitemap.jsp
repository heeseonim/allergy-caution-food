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

<style>
</style>
<script>
let productlist = () => {
        $.ajax({
            url:"foodlist.do",
            type:"post",
            data:$("#my_form").serialize(),
            success:()=>{
//            	("성공");
            },
            error:()=>{
                alert("아이쿠");
            }
        })
}

productlist();

</script>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="detail">
		<div id="result" class="container">
			<h2 class="high_light middle"><b>공지사항</b></h2>
			<hr>
			<form id="my_form" action="#">
				<table class="table">
					<tr>
						<td><span class="high_light">번호</span></td>
						<td><span class="high_light">제목</span></td>
						<td><span class="high_light">작성일자</span></td>
					</tr>
					<tr>
						<td><a class="none_deco" href="#">2</a></td>
						<td><a class="none_deco" href="#">테스트</a></td>
						<td><a class="none_deco" href="#">2019-09-10</a></td>
					</tr>
					<tr>
						<td><a class="none_deco" href="#">1</a></td>
						<td><a class="none_deco" href="#">제목</a></td>
						<td><a class="none_deco" href="#">2019-09-09</a></td>
					</tr>
				</table>

				<input type="button" class="btn btn-default" value="글쓰기" />
			</form>
			<hr>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
<script src="search.js"></script>
</html>