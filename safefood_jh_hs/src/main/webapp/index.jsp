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
    			if(!<%=session.getAttribute("data")%>){
    				location.href="index.jsp";
    			}else{
    				console.log("완료");
    			}
            },
            error:()=>{
            	console.log("실패");
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

			<h2 class="high_light middle">
				<b>상품 목록</b>
			</h2>
			<hr>
			<div class="row">
				<c:forEach items="${foods}" var="food">
					<div class="col-md-3">
						<table>
							<tr>
								<td><img src="${food.img}" height="200px" width="200px"
									onclick="javascript:moveFoodInfo('${food.code}')" /></td>
							</tr>
							<tr>
								<td height="50px"><hr><div class="middle">${food.name}</div></td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
			<hr>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
<script>
let moveFoodInfo = (code) => {
	location.href="foodview.do?code="+code;
}

$("#commit").on("click", ()=>{
	location.href='./resources/html/foodsearch.html?cat='+search+'&word='+$("#word").val();
})

</script>

<script src="search.js"></script>

</html>