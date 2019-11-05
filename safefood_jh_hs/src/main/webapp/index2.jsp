<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="top.css">

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url('https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap');
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');

body {
	font-family: 'Noto Sans KR', sans-serif;
}

.sharp_font{
	font-family: 'Libre Baskerville', serif;
}

/* 제일 껍데기 부분 */

#back {
	display:block;
	position:absolute;
	background-image: url("./img/back.jpg");
    opacity:0.9;	
    top:0;
    left:0;
    width: 100%;
    height: 290px;
    z-index:-1;
}

/* 로그인 메뉴 부분 */
#status a, .white{
	color:white;
	text-decoration: blink;
}
#status a:hover, .white{
	color:silver;
	text-decoration: blink;
}
#status a:visited, .white{
	color:white;
}

.none_deco{
	color:black;
	text-decoration: blink;
}
.none_deco:hover{
	color:silver;
	text-decoration: blink;
}
.none_deco:visited{
	color:black;
}

.top_button {
	float: right;
	color:white;
	height: 30px;
	width: 80px;
	padding-top:5px;
}

/* 메뉴 */
#brand{
	color:black;
}

/* 가운데 큰 타이틀, blue는 하이라이트 부분 */
#big_title {
	vertical-align: middle;
	text-align: center;
	height: 200px;
	color:white;
}

.high_light{
	color:#56b85a;
}

.blue {
	color: #86db89;
}
/* 본문 */
#detail{
	padding-top:20px;
}


/* 바닥 */
footer{
	padding-top:30px;
}

#login_form{
}

.login {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 410px;
	height: 300px;
	z-index: 2;
	background: white;
	color: black !important;
	padding: 10px;
	border: 1px solid #EFEFEF;
	margin-left: -205px;
	margin-top: -150px;
	display:none;
}

.login_title{
	text-align: center;
}

#login_buttons{
	text-align: center;
}

.table>tbody+tbody {
	border-top: none;
}

.table>tbody>tr>td {
	background: #ffffff;
	vertical-align: middle;
	padding: 0px;
	border-top: none;
	border-left: 0px solid #fafafa;
	border-right: 0px solid #fafafa;
	border-top: 0px solid #fafafa;
	border-bottom: 0px solid #fafafa;
}

hr.green{
	width:10px;
	border:1px solid green;
}

tr {
	margin-bottom: "5px";
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="detail">
		<div class="container">
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-condensed" id="food_table">
						<tbody id="food_tbody" class="col-md-6"
							style="padding-left: 5%; padding-right: 0px"></tbody>
						<tbody id="food_tbody2" class="col-md-6" style="padding-left: 0px"></tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="result"></div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
<script>
let search="전체";

$(".c1").on("click", ()=>{
	$("#cat").html('전체<span class="caret"></span>');
	search = "전체";
});
$(".c2").on("click", ()=>{
	$("#cat").html('상품명<span class="caret"></span>');
	search = "상품명";
});
$(".c3").on("click", ()=>{
	$("#cat").html('분류<span class="caret"></span>');
	search = "분류";
});
$(".c4").on("click", ()=>{
	$("#cat").html('원료<span class="caret"></span>');
	search = "원료";
});
$(".c5").on("click", ()=>{
	$("#cat").html('영양성분<span class="caret"></span>');
	search = "영양성분";
});

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