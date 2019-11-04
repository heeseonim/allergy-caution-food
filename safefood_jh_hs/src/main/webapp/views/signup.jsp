<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGNUP - SAFEFOOD</title>
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
<link rel="stylesheet" href="css/css.css">
<script src="search.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div id="login_form" class="login container">
		<form class="form-horizontal" action="signup.do" method="post">
			<div class="login_title">
				<h3 class="high_light middle">회원가입</h3>
			</div>
			<hr>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">아이디</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="id" id="id"
						placeholder="ID">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-4 control-label">비밀번호</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="pw"
						placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">이름</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="name"
						placeholder="Name">
				</div>
			</div>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">전화번호</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="phone"
						placeholder="Phone">
				</div>
			</div>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">이메일</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="email"
						placeholder="Email">
				</div>
			</div>
			<div class="form-group" id="login_buttons">
				<div style="height: 10px"></div>
				<div class="row">
					<div class="col-sm-5">
					</div>
					<div class="col-sm-2">
						<button type="submit" class="btn btn-default mybutton">회원가입</button>
					</div>
				</div>
			</div>

		</form>
	</div>
</body>
</html>