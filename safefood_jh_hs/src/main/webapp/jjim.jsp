<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 정보</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>





<link type="text/css" href="css/css.css" rel="stylesheet" />


<style>
<!--
지우지 말 것 -->.widget-chart ul li {
	width: 31.5%;
	display: inline-block;
	padding: 0px;
}

.moon {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="detail">
		<div class="container" style="width:800px">
			<h1 class="text-center">
				<span class="high_light">찜 상품</span>
			</h1>
			<br>
			<form id="jjimform" class="form-horizontal">
				<table class="table table-hover">
					<tr>
						<th>이미지</th>
						<th>상품명</th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<td><img src="./img/비비빅.jpg" height="100px" width="100px"></td>
						<td>비비빅</td>
						<td><input type="number" name="jjimcheck" id="jjimcheck" class="form-control" style="width:15%" placeholder="0"></td>
						<td><button type="button" onclick="deletejjim(1)" class="btn btn-default">삭제</button></td>
					</tr>
				</table>
				<button type="button" id="addjjim" class="btn btn-default">추가</button>
			</form>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>

<script>
	function showjjim(){
		console.log("jjimlist 로딩중");
		$.ajax({
			url:"",
			type:"",
			success:function(){},
			error:function(){},
		})
	};
	showjjim();
	$("#addjjim").on("click", (e)=>{
		$('input:checkbox[name=jjimcheck]:checked').each(function() {
	         console.log($(this).val());
	     });
		$.ajax({
			url:"",
			type:"",
			success:function(){},
			error:function(){},
		})
	});
	function deletejjim(id){
		console.log(id);
		console.log("in");
		$.ajax({
			url:"",
			type:"",
			success:function(){},
			error:function(){},
		})
		
	}
</script>
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
</html>