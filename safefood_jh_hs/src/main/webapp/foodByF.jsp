<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#floatMenu {
	position: absolute;
	width: 200px;
	height: 200px;
	right: 50px;
	top: 300px;
	color: #fff;
}
</style>
</head>
<body>
<div id="floatMenu">
	<img src="./img/베스트상품.png" width="140"/>
	<c:forEach items="${foodByF }" var="f">
		<img src="${f.img }" height="130px" width="130px" onclick="javascript:moveFoodInfo('${f.code}')"/>
	</c:forEach>
	</div>
</body>
<script>
$(document).ready(function() {
	var floatPosition = parseInt($("#floatMenu").css('top'));
	
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
});

let moveFoodInfo = (code) => {
	location.href="./foodview.do?code="+code;
}
</script>
</html>