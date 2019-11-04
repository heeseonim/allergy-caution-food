<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN - SAFEFOOD</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/css.css">

<style>
#login {
	width: 350px;
	height: 350px;
}

.middle{
	text-align: center;
}

.btn-max{
	width: 100%;
}

.sp{
	height:10px;
}

</style>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div id="login_form" class="login container">
		<form class="form-horizontal" action="login.do" method="post">

			<div class="row bo">

				<div class="col-sm-4 col-sm-offset-4">
					<h3 class="middle">로그인</h3>
					<div class="form-group has-feedback">
						<label class="control-label" for="inputSuccess2">ID</label><input type="text" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status" name="id"><span id="inputSuccess2Status" class="sr-only">(success)</span>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="inputSuccess2">PW</label><input type="password" class="form-control" id="passSuccess2" aria-describedby="inputSuccess2Status" name="pw"><span id="inputSuccess2Status" class="sr-only">(success)</span>
					</div>

				<div class="form-group middle" id="login_buttons">
					<div class="row">
						<div class="col-sm-12">
							<button type="submit" class="btn btn-default btn-max">로그인</button>
						</div>
					</div>
					<div class="sp">
					</div>
					<div class="row">
						<div class="col-sm-12">
							<button type="button" class="btn btn-default btn-max" onClick="location.href='./signup.jsp'">회원가입</button>
						</div>
					</div>					
				</div>
				</div>
			</div>

		</form>
	</div>
</body>
</html>