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
		<form class="form-horizontal" method="post" action="signup.do">
			<div class="login_title">
				<h3 class="high_light middle">회원가입</h3>
			</div>
			<hr>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">아이디</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="id" id="id"
						placeholder="ID" required="required">
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
				<label for="inputid3" class="col-sm-4 control-label">이메일</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="email"
						placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">핸드폰</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="phone"
						placeholder="phone">
				</div>
			</div>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">알러지</label>
				<div class="col-sm-5">
					<div class="checkbox">
					<label> <input type="checkbox" name="allergy" value="대두">대두&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="땅콩">땅콩&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="우유">우유&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="게">게&nbsp;</label>
					<label> <input type="checkbox" name="allergy" value="새우">새우&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="참치">참치&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="연어">연어&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="쑥">쑥&nbsp;</label><br>
					<label> <input type="checkbox" name="allergy" value="소고기">소고기 </label>
					<label> <input type="checkbox" name="allergy" value="닭고기">닭고기 </label>
					<label> <input type="checkbox" name="allergy" value="돼지고기">돼지고기&nbsp;</label>
					<label> <input type="checkbox" name="allergy" value="복숭아">복숭아 </label>
					<label> <input type="checkbox" name="allergy" value="민들레">민들레 </label>
					<label> <input type="checkbox" name="allergy" value="계란흰자">계란흰자 </label>
					</div>
				</div>
			</div>
			<div class="form-group" id="login_buttons">
				<div style="height: 10px"></div>
				<div class="row">
					<div class="col-sm-5">
					</div>
					<div class="col-sm-2">
						<button type="submit" class="btn btn-default mybutton" id="bt">회원가입</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>